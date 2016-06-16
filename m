From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 16 Jun 2016 23:17:24 +0200
Subject: [Buildroot] Thread support in Cortex m4 toolchains,
 was: Re: Update of Buildroot toolchains on autobuild.b.o
In-Reply-To: <j0i43dx88l.ln2@ID-313208.user.individual.net>
References: <20160608220152.5b54ea7d@free-electrons.com>
 <XnsA625B1BC8388EID313208userindividu@bernd-kuhls.de>
 <20160612182040.1c4ea274@free-electrons.com>
 <20160613214825.GJ2584@waldemar-brodkorb.de>
 <j0i43dx88l.ln2@ID-313208.user.individual.net>
Message-ID: <20160616211723.GW2584@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,
Bernd Kuhls wrote,

> Am Mon, 13 Jun 2016 23:48:25 +0200 schrieb Waldemar Brodkorb:
> 
> > Thread model: single
> > gcc version 4.4.1 (Sourcery G++ Lite 2010q1-189) 
> > 
> > I would say it is normal for any *-uclinux-* toolchain using
> > linuxthreads instead of NPTL.
> 
> Hi Waldemar,
> 
> how to distinguish a toolchain using linuxthreads from a
> toolchain lacking thread support?
> 
> The toolchain from
> http://autobuild.buildroot.net/toolchains/configs/br-arm-full-
> nothread.config
> shows a similar output to the m4 toolchain
> 
> $ output/host/opt/ext-toolchain/bin/arm-buildroot-linux-uclibcgnueabihf-
> gcc -v
> Using built-in specs.
> COLLECT_GCC=/home/bernd/buildroot/br2/output/host/opt/ext-toolchain/bin/
> arm-buildroot-linux-uclibcgnueabihf-gcc.br_real
> COLLECT_LTO_WRAPPER=/home/bernd/buildroot/br2/output/host/opt/ext-
> toolchain/bin/../libexec/gcc/arm-buildroot-linux-uclibcgnueabihf/4.9.3/
> lto-wrapper
> Target: arm-buildroot-linux-uclibcgnueabihf
> Configured with: ./configure --prefix=/opt/br-arm11-full-
> nothread-2016.05-2-g5dabb45/usr --sysconfdir=/opt/br-arm11-full-
> nothread-2016.05-2-g5dabb45/etc --enable-static --target=arm-buildroot-
> linux-uclibcgnueabihf --with-sysroot=/opt/br-arm11-full-
> nothread-2016.05-2-g5dabb45/usr/arm-buildroot-linux-uclibcgnueabihf/
> sysroot --disable-__cxa_atexit --with-gnu-ld --disable-libssp --disable-
> multilib --with-gmp=/opt/br-arm11-full-nothread-2016.05-2-g5dabb45/usr --
> with-mpfr=/opt/br-arm11-full-nothread-2016.05-2-g5dabb45/usr --with-
> pkgversion='Buildroot 2016.05-00002-g5dabb45' --with-bugurl=http://
> bugs.buildroot.net/ --disable-libsanitizer --disable-tls --disable-
> libmudflap --disable-threads --disable-libitm --disable-libatomic --with-
> mpc=/opt/br-arm11-full-nothread-2016.05-2-g5dabb45/usr --without-isl --
> without-cloog --disable-decimal-float --with-abi=aapcs-linux --with-
> cpu=arm1176jzf-s --with-fpu=vfp --with-float=hard --with-mode=arm --
> enable-languages=c,c++ --with-build-time-tools=/opt/br-arm11-full-
> nothread-2016.05-2-g5dabb45/usr/arm-buildroot-linux-uclibcgnueabihf/bin --
> enable-shared --disable-libgomp
> Thread model: single
> gcc version 4.9.3 (Buildroot 2016.05-00002-g5dabb45) 
> 
> This toolchain, as expected, lacks the definition of 
> _GLIBCXX_HAS_GTHREADS in
> output/host/opt/ext-toolchain/arm-buildroot-linux-uclibcgnueabihf/include/
> c++/4.9.3/arm-buildroot-linux-uclibcgnueabihf/bits/c++config.h
> 
> The same is valid for the Cortex m4 toolchain however despite the fact 
> that it claims to have thread support in Kconfig. This leads to build 
> errors in the boost package:
> http://autobuild.buildroot.net/
> results/422/4220e275dcc90e64545ad2d5ed3e0b51044f6426/
> 
> ./boost/config/requires_threads.hpp:29:4: error: #error "Threading 
> support unavaliable: it has been explicitly disabled with 
> BOOST_DISABLE_THREADS"
>  #  error "Threading support unavaliable: it has been explicitly disabled 
> with BOOST_DISABLE_THREADS"
> 
> Boost checks for _GLIBCXX_HAS_GTHREADS to determine thread support:
> https://github.com/boostorg/config/blob/develop/include/boost/config/
> stdlib/libstdcpp3.hpp#L37
> 
> Afaics we have two choices: Fix the thread support in gcc or remove the 
> setting that the m4 toolchain supports threads.

I would prefer first choice.
Can you try something like the attached patch for your gcc build?

I managed to compile ARM noMMU boost with that.
I have done no runtime testing and there is an open issue regarding
noMMU ARM and threads support discussed on the uClinux mailinglist.

best regards
 Waldemar
-------------- next part --------------
A non-text attachment was scrubbed...
Name: uclinux-threads.patch
Type: text/x-diff
Size: 471 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160616/169a59d1/attachment.bin>
