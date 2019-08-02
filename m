From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 02 Aug 2019 08:44:35 +0000
Subject: [Buildroot] [Bug 12076] Patchelf can link against an incompatible
 libc++ version
In-Reply-To: <bug-12076-163@https.bugs.busybox.net/>
References: <bug-12076-163@https.bugs.busybox.net/>
Message-ID: <bug-12076-163-XDuJ7U9mnU@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12076

--- Comment #2 from Bradley Gamble <bradley.gamble@ncipher.com> ---
The build is completed in a single container without any sort of file
migration. My build commands are:

    wget https://buildroot.org/downloads/buildroot-2019.05.1.tar.gz
    tar -xvf ./buildroot-2019.05.1.tar.gz
    cp ./baseimage/defconfig ./buildroot-2019.05.1/configs/custom_defconfig
    make -C buildroot-2019.05.1 custom_defconfig
    make -C buildroot-2019.05.1

This completes successfully, for example, on my host machine with newer
libraries.
In the container I am able to build and C++ applications without issue - We
compile many C++ binaries from source and this example of Patchelf is the only
failure we've encountered. I have demonstrated this by building a hello world
example:

$ cat helloworld.cpp 
    #include <iostream>
    using namespace std;
    int main() 
    {
        cout << "Hello, World!";
        return 0;
    }
$ g++ helloworld.cpp -ohelloworld
$ ./helloworld 
Hello, World!

I have uploaded the files here: https://gofile.io/?c=INwQ9u (Apologies for the
third-party host, the binaries are too big to upload even when compressed.)
This tarball contains the Patchelf binary and log from Buildroot, as well as
one I have manually compiled in the container. The Buildroot binary fails to
execute from within the container, whereas the manually built one executes
without issue.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
