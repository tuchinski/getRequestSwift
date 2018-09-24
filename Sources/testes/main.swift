import Foundation
import SwiftGlibc


// import SwiftGlibc


func getRequest() -> String {
    let sessionConfiguration = URLSessionConfiguration.default
    let session = URLSession(configuration: sessionConfiguration)
    var meuDeus: String = ""

    let urls = [ "https://developer.apple.com/documentation/dispatch"]

    let group = DispatchGroup()
        print("staring sync")
        urls.forEach { url in
            group.enter()
            session.dataTask(with: URL(string: url)!, completionHandler: {
                (data, response, error) in
                let str = String(data: data!, encoding: .utf8)
                // print("Task ran! \(str!)")
                meuDeus = str!
                group.leave()
            }).resume()
        }

    print("ending sync")
    group.wait()
    return meuDeus
}  

var senhor: String
senhor = getRequest()
print (senhor)
print ("ainda continua aqui")

// var meuDado = getRequest2()
// getRequest2()
// print("hello")




// postFuncion()
// print(str)


