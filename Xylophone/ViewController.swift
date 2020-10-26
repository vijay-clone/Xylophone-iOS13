//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player : AVAudioPlayer?
    var soundTitle : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    
    @IBAction func musicbuttonPressed(_ sender: UIButton) {
        
         soundTitle = sender.currentTitle!
         playSound()
        sender.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                   //Bring's sender's opacity back up to fully opaque.
                   sender.alpha = 1.0
               }
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "\(soundTitle)", withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}

