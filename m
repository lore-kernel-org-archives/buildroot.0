From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 13 Jun 2016 23:48:25 +0200
Subject: [Buildroot] Update of Buildroot toolchains on autobuild.b.o
In-Reply-To: <20160612182040.1c4ea274@free-electrons.com>
References: <20160608220152.5b54ea7d@free-electrons.com>
 <XnsA625B1BC8388EID313208userindividu@bernd-kuhls.de>
 <20160612182040.1c4ea274@free-electrons.com>
Message-ID: <20160613214825.GJ2584@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thomas Petazzoni wrote,

> Hello,
> 
> On Sun, 12 Jun 2016 17:28:19 +0200, Bernd Kuhls wrote:
> 
> > According to its defconfig it supports threads, but not NPTL however:
> 
> The fact that it doesn't support NPTL is expected I believe (we're
> talking about ARMv7-M).
> 
> > $ wget http://autobuild.buildroot.net/toolchains/configs/br-arm-cortex-m4-
> > full.conf
> > $ make defconfig BR2_DEFCONFIG=br-arm-cortex-m4-full.config
> > 
> > $ grep -i has_threads .config
> > BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS=y
> > # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> > # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL is not set
> > BR2_TOOLCHAIN_HAS_THREADS=y
> > 
> > But according to the output of gcc is does not support threads although it 
> > was compiled with --enable-threads
> > 
> > $ make toolchain
> > $ output/host/opt/ext-toolchain/bin/arm-buildroot-uclinux-uclibcgnueabi-gcc 
> > -v
> > 
> > Configured with: ./configure --prefix=/opt/br-arm-cortex-m4-full-2016.05-2-
> > g5dabb45/usr --sysconfdir=/opt/br-arm-cortex-m4-full-2016.05-2-g5dabb45/etc 
> > --enable-static --target=arm-buildroot-uclinux-uclibcgnueabi --with-
> > sysroot=/opt/br-arm-cortex-m4-full-2016.05-2-g5dabb45/usr/arm-buildroot-
> > uclinux-uclibcgnueabi/sysroot --disable-__cxa_atexit --with-gnu-ld --
> > disable-libssp --disable-multilib --with-gmp=/opt/br-arm-cortex-m4-full-
> > 2016.05-2-g5dabb45/usr --with-mpfr=/opt/br-arm-cortex-m4-full-2016.05-2-
> > g5dabb45/usr --with-pkgversion='Buildroot 2016.05-00002-g5dabb45' --with-
> > bugurl=http://bugs.buildroot.net/ --disable-libsanitizer --disable-tls --
> > disable-libmudflap 
> > 
> >     	    	--enable-threads
> > 
> >  --with-mpc=/opt/br-arm-cortex-m4-full-2016.05-2-g5dabb45/usr --without-isl 
> > --without-cloog --with-float=soft --disable-decimal-float --with-abi=aapcs-
> > linux --with-cpu=cortex-m4 --with-float=soft --with-mode=thumb --enable-
> > languages=c,c++ --with-build-time-tools=/opt/br-arm-cortex-m4-full-2016.05-
> > 2-g5dabb45/usr/arm-buildroot-uclinux-uclibcgnueabi/bin --disable-shared --
> > disable-libgomp
> > 
> >     	    	Thread model: single
> > 
> > gcc version 4.9.3 (Buildroot 2016.05-00002-g5dabb45) 
> > 
> > I noticed this while trying to fix some boost build errors.
> 
> Indeed weird. Waldemar, do you have an idea? uClibc_config.h contains:
> 
> #undef __HAS_NO_THREADS__
> #define __LINUXTHREADS_OLD__ 1
> #undef __LINUXTHREADS_NEW__
> #define __UCLIBC_HAS_THREADS__ 1

When looking at the output of some precompiled toolchain for ARM
noMMU used by Emcraft:
./bin/arm-uclinuxeabi-gcc -v                                                                                                        
Using built-in specs.
Target: arm-uclinuxeabi
Configured with:
/scratch/julian/2010q1-release-uclinux-lite/src/gcc-4.4-2010q1/configure
--build=i686-pc-linux-gnu --host=i686-pc-linux-gnu
--target=arm-uclinuxeabi --enable-threads --disable-libmudflap
--disable-libssp --disable-libstdcxx-pch
--enable-extra-sgxxlite-multilibs --with-gnu-as --with-gnu-ld
--with-specs='%{O2:%{!fno-remove-local-statics:
-fremove-local-statics}}
%{O*:%{O|O0|O1|O2|Os:;:%{!fno-remove-local-statics:
%-fremove-local-statics}}}' --enable-languages=c,c++
%--disable-shared --disable-lto --with-pkgversion='Sourcery G++ Lite
%2010q1-189'
%--with-bugurl=https://support.codesourcery.com/GNUToolchain/
%--disable-nls --prefix=/opt/codesourcery
%--with-sysroot=/opt/codesourcery/arm-uclinuxeabi/libc
%--with-build-sysroot=/scratch/julian/2010q1-release-uclinux-lite/install/arm-uclinuxeabi/libc
%--with-gmp=/scratch/julian/2010q1-release-uclinux-lite/obj/host-libs-2010q1-189-arm-uclinuxeabi-i686-pc-linux-gnu/usr
%--with-mpfr=/scratch/julian/2010q1-release-uclinux-lite/obj/host-libs-2010q1-189-arm-uclinuxeabi-i686-pc-linux-gnu/usr
%--with-ppl=/scratch/julian/2010q1-release-uclinux-lite/obj/host-libs-2010q1-189-arm-uclinuxeabi-i686-pc-linux-gnu/usr
%--with-host-libstdcxx='-static-libgcc
%-Wl,-Bstatic,-lstdc++,-Bdynamic -lm'
%--with-cloog=/scratch/julian/2010q1-release-uclinux-lite/obj/host-libs-2010q1-189-arm-uclinuxeabi-i686-pc-linux-gnu/usr
%--disable-libgomp --enable-poison-system-directories
%--with-build-time-tools=/scratch/julian/2010q1-release-uclinux-lite/install/arm-uclinuxeabi/bin
%--with-build-time-tools=/scratch/julian/2010q1-release-uclinux-lite/install/arm-uclinuxeabi/bin
Thread model: single
gcc version 4.4.1 (Sourcery G++ Lite 2010q1-189) 

I would say it is normal for any *-uclinux-* toolchain using
linuxthreads instead of NPTL.

best regards
 Waldemar
