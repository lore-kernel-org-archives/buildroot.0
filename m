From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Mar 2013 18:07:40 +0100
Subject: [Buildroot] ARM allyespackageconfig report
In-Reply-To: <87hakn5vlw.fsf@dell.be.48ers.dk>
References: <20130307111108.64a6dc0a@skate> <87hakn5vlw.fsf@dell.be.48ers.dk>
Message-ID: <20130307180740.51c1b9b6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Thu, 07 Mar 2013 11:53:46 +0100, Peter Korsgaard wrote:

>  Thomas> mplayer build failure
>  Thomas> =====================
> 
>  Thomas> {standard input}: Assembler messages:
>  Thomas> {standard input}:2857: Error: selected FPU does not support instruction -- `vmul.f32 q0,q0,q1'
>  Thomas> {standard input}:2951: Error: selected processor does not support ARM mode `veor q0,q0,q2'
>  Thomas> {standard input}:2952: Error: selected FPU does not support instruction -- `vmul.f32 q0,q0,q1'
>  Thomas> {standard input}:3023: Error: selected FPU does not support instruction -- `vmul.f32 d0,d0,d1'
>  Thomas> {standard input}:3106: Error: selected processor does not support ARM mode `veor d0,d0,d2'
>  Thomas> {standard input}:3107: Error: selected FPU does not support instruction -- `vmul.f32 d0,d0,d1'
> 
> Sounds like thumb2 / arm mismatch.

Seems more like floating point stuff, but I don't know yet.

>  Thomas> ltp-testsuite build failure
>  Thomas> ===========================
> 
>  Thomas> par_chld_ipv6.c: In function 'main':
>  Thomas> par_chld_ipv6.c:55:14: error: 'CLONE_NEWNS' undeclared (first use in this function)
>  Thomas> par_chld_ipv6.c:55:14: note: each undeclared identifier is reported only once for each function it appears in
>  Thomas> par_chld_ipv6.c:84:9: warning: implicit declaration of function 'unshare' [-Wimplicit-function-declaration]
>  Thomas> par_chld_ipv6.c:93:5: warning: implicit declaration of function 'crtchild' [-Wimplicit-function-declaration]
>  Thomas> two_children_ns.c: In function 'main':make[6]: *** [par_chld_ipv6.o] Error 1
> 
> Odd, do the Linaro guys build against old kernel headers (without
> NEWNS/unshare)?

$ grep -r CLONE_NEWNS staging/usr/include/*
staging/usr/include/arm-linux-gnueabi/bits/sched.h:# define CLONE_NEWNS   0x00020000 /* Set to create new namespace.  */
staging/usr/include/arm-linux-gnueabihf/bits/sched.h:# define CLONE_NEWNS   0x00020000 /* Set to create new namespace.  */
staging/usr/include/linux/sched.h:#define CLONE_NEWNS   0x00020000      /* New namespace group? */

$ grep -r unshare staging/usr/include/*
staging/usr/include/arm-linux-gnueabi/bits/sched.h:extern int unshare (int __flags) __THROW;
staging/usr/include/arm-linux-gnueabi/bits/syscall.h:#define SYS_unshare __NR_unshare
staging/usr/include/arm-linux-gnueabi/asm/unistd.h:#define __NR_unshare                 (__NR_SYSCALL_BASE+337)
staging/usr/include/arm-linux-gnueabihf/bits/sched.h:extern int unshare (int __flags) __THROW;
staging/usr/include/arm-linux-gnueabihf/bits/syscall.h:#define SYS_unshare __NR_unshare
staging/usr/include/arm-linux-gnueabihf/asm/unistd.h:#define __NR_unshare                       (__NR_SYSCALL_BASE+337)
staging/usr/include/asm-generic/unistd.h:#define __NR_unshare 97
staging/usr/include/asm-generic/unistd.h:__SYSCALL(__NR_unshare, sys_unshare)

$ cat staging/usr/include/linux/version.h 
#define LINUX_VERSION_CODE 197134
#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))

$ python
Python 2.6.6 (r266:84292, Dec 26 2010, 22:31:48) 
[GCC 4.4.5] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> 197134 >> 16
3
>>> (197134 >> 8) & 0xFF
2
>>> 197134 & 0xFF
14

So seems like their kernel headers are 3.2.14, and that they have
CLONE_NEWNS/unshare.

>  Thomas> sconeserver build failure
>  Thomas> =========================
> 
>  Thomas> checking for InitializeMagick in -lMagick++... no
>  Thomas> configure: error: library 'Magick++' is required for Sconesite:image
>  Thomas> make[1]: *** [/home/test/outputs/allpkg/build/sconeserver-183/.stamp_configured] Error 1
>  Thomas> make: *** [all] Error 2
> 
> Could you have a look in config.log to see what goes wrong with the
> InitializeMagick check?

Seems like the .pc file forgets to link against some library:

configure:15580: /home/test/outputs/allpkg/host/usr/bin/arm-linux-gnueabihf-g++ -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -I/home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/libxml2 -I/home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/mysql -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/home/test/outputs/allpkg/host/usr/include/libxml2  -L/home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/mysql conftest.cpp -lMagick++  -lcrypt -lpcre -lpthread -ldl  >&5
/home/test/outputs/allpkg/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld: /tmp/ccVrnXFg.o: undefined reference to symbol 'InitializeMagick'
/home/test/outputs/allpkg/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld: note: 'InitializeMagick' is defined in DSO /home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libMagickCore.so.5 so try adding it to the linker command line
/home/test/outputs/allpkg/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libMagickCore.so.5: could not read symbols: Invalid operation
collect2: error: ld returned 1 exit status

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
