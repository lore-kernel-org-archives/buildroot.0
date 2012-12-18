From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Dec 2012 10:40:40 +0100
Subject: [Buildroot] allyespackageconfig build on ARM/Linaro
In-Reply-To: <878v8v7lwq.fsf@dell.be.48ers.dk>
References: <20121218100954.2d59c70f@skate> <878v8v7lwq.fsf@dell.be.48ers.dk>
Message-ID: <20121218104040.7f5f3c79@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 18 Dec 2012 10:24:37 +0100, Peter Korsgaard wrote:

>  Thomas> Here are my notes:
> 
>  Thomas>  * I've disabled JamVM and Classpath, because my testing chroot does
>  Thomas>    not have javac. So those packages are not tested.
> 
>  Thomas>  * mplayer failed to build, so I had to disable it, and also disable
>  Thomas>    libplayer, which was selecting mplayer. The mplayer build failure is
>  Thomas>    FPU related:
> 
> Sounds related to the mplayer/fpu discussion we had fairly recently.

Indeed.

>  Thomas>  * ltp-testsuite fails to build (build failures already seen with the
>  Thomas>    autobuilders):
> 
>  Thomas> common.c: In function 'create_net_namespace':
>  Thomas> common.c:64:17: error: 'CLONE_NEWNS' undeclared (first use in this function)
>  Thomas> common.c:64:17: note: each undeclared identifier is reported only once for each function it appears in
>  Thomas> common.c: In function 'child_fn':
>  Thomas> common.c:124:11: error: 'CLONE_NEWNS' undeclared (first use in this function)
>  Thomas> common.c:127:11: error: 'CLONE_FS' undeclared (first use in this function)
> 
> Odd, CLONE_NEWNS has existing for many years and common.c seems to
> include sched.h

Yes, I haven't looked at this one yet, but it is strange.

>  Thomas>  * pcmanfm failed to build:
> 
>  Thomas> /home/test/outputs/allpkg/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld: fm-desktop.o: undefined reference to symbol 'XSendEvent'
>  Thomas> /home/test/outputs/allpkg/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld: note: 'XSendEvent' is defined in DSO /home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libX11.so.6 so try adding it to the linker command line
>  Thomas> /home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libX11.so.6: could not read symbols: Invalid operation
>  Thomas> collect2: error: ld returned 1 exit status
>  Thomas> make[4]: *** [pcmanfm] Error 1
> 
> Strange about all these linker issues.

No, not really strange. There has been a change in gcc 4.6 with regard
to linking some time ago. See
http://www.gentoo.org/proj/en/qa/asneeded.xml. This is causing build
breakage in some packages that had an incorrect list of libraries to
link with.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
