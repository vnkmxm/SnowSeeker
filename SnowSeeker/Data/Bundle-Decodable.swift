//
//  Bundle-Decodable.swift
//  SnowSeeker
//
//  Created by Максим Нуждин on 31.01.2022.
//

import Foundation


extension Bundle {
    
    func decode<T: Decodable>(_ file: String) -> T {
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locale \(file) file")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        guard let loaded = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("Failed to deocde \(file) from bundle")
        }
        
        return loaded
    }
}
