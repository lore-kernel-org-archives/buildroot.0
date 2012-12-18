From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 18 Dec 2012 10:24:37 +0100
Subject: [Buildroot] allyespackageconfig build on ARM/Linaro
In-Reply-To: <20121218100954.2d59c70f@skate> (Thomas Petazzoni's message of
 "Tue, 18 Dec 2012 10:09:54 +0100")
References: <20121218100954.2d59c70f@skate>
Message-ID: <878v8v7lwq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> Following Arnout's comment suggesting to try a allyespackageconfig
 Thomas> build on ARM with a Linaro external toolchain (to complement Arnout
 Thomas> excellent work on allyespackageconfig testing for x86-64), I did this
 Thomas> test yesterday and I have now have the results.

Great, thanks.

 Thomas> Here are my notes:

 Thomas>  * I've disabled JamVM and Classpath, because my testing chroot does
 Thomas>    not have javac. So those packages are not tested.

 Thomas>  * mplayer failed to build, so I had to disable it, and also disable
 Thomas>    libplayer, which was selecting mplayer. The mplayer build failure is
 Thomas>    FPU related:

Sounds related to the mplayer/fpu discussion we had fairly recently.


 Thomas>  * ltp-testsuite fails to build (build failures already seen with the
 Thomas>    autobuilders):

 Thomas> common.c: In function 'create_net_namespace':
 Thomas> common.c:64:17: error: 'CLONE_NEWNS' undeclared (first use in this function)
 Thomas> common.c:64:17: note: each undeclared identifier is reported only once for each function it appears in
 Thomas> common.c: In function 'child_fn':
 Thomas> common.c:124:11: error: 'CLONE_NEWNS' undeclared (first use in this function)
 Thomas> common.c:127:11: error: 'CLONE_FS' undeclared (first use in this function)

Odd, CLONE_NEWNS has existing for many years and common.c seems to
include sched.h


 Thomas>  * pcmanfm failed to build:

 Thomas> /home/test/outputs/allpkg/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld: fm-desktop.o: undefined reference to symbol 'XSendEvent'
 Thomas> /home/test/outputs/allpkg/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld: note: 'XSendEvent' is defined in DSO /home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libX11.so.6 so try adding it to the linker command line
 Thomas> /home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libX11.so.6: could not read symbols: Invalid operation
 Thomas> collect2: error: ld returned 1 exit status
 Thomas> make[4]: *** [pcmanfm] Error 1

Strange about all these linker issues.

-- 
Bye, Peter Korsgaard
