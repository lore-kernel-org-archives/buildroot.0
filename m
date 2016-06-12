From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Jun 2016 17:28:19 +0200
Subject: [Buildroot] Update of Buildroot toolchains on autobuild.b.o
References: <20160608220152.5b54ea7d@free-electrons.com>
Message-ID: <XnsA625B1BC8388EID313208userindividu@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Thomas Petazzoni <thomas.petazzoni-
wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote in 
news:20160608220152.5b54ea7d at free-electrons.com:

>  * Addition of a ARM Cortex-M4 noMMU toolchain.

Hi Thomas,

afaics something is weird with this toolchain.

According to its defconfig it supports threads, but not NPTL however:

$ wget http://autobuild.buildroot.net/toolchains/configs/br-arm-cortex-m4-
full.conf
$ make defconfig BR2_DEFCONFIG=br-arm-cortex-m4-full.config

$ grep -i has_threads .config
BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL is not set
BR2_TOOLCHAIN_HAS_THREADS=y

But according to the output of gcc is does not support threads although it 
was compiled with --enable-threads

$ make toolchain
$ output/host/opt/ext-toolchain/bin/arm-buildroot-uclinux-uclibcgnueabi-gcc 
-v

Configured with: ./configure --prefix=/opt/br-arm-cortex-m4-full-2016.05-2-
g5dabb45/usr --sysconfdir=/opt/br-arm-cortex-m4-full-2016.05-2-g5dabb45/etc 
--enable-static --target=arm-buildroot-uclinux-uclibcgnueabi --with-
sysroot=/opt/br-arm-cortex-m4-full-2016.05-2-g5dabb45/usr/arm-buildroot-
uclinux-uclibcgnueabi/sysroot --disable-__cxa_atexit --with-gnu-ld --
disable-libssp --disable-multilib --with-gmp=/opt/br-arm-cortex-m4-full-
2016.05-2-g5dabb45/usr --with-mpfr=/opt/br-arm-cortex-m4-full-2016.05-2-
g5dabb45/usr --with-pkgversion='Buildroot 2016.05-00002-g5dabb45' --with-
bugurl=http://bugs.buildroot.net/ --disable-libsanitizer --disable-tls --
disable-libmudflap 

    	    	--enable-threads

 --with-mpc=/opt/br-arm-cortex-m4-full-2016.05-2-g5dabb45/usr --without-isl 
--without-cloog --with-float=soft --disable-decimal-float --with-abi=aapcs-
linux --with-cpu=cortex-m4 --with-float=soft --with-mode=thumb --enable-
languages=c,c++ --with-build-time-tools=/opt/br-arm-cortex-m4-full-2016.05-
2-g5dabb45/usr/arm-buildroot-uclinux-uclibcgnueabi/bin --disable-shared --
disable-libgomp

    	    	Thread model: single

gcc version 4.9.3 (Buildroot 2016.05-00002-g5dabb45) 

I noticed this while trying to fix some boost build errors.

Regards, Bernd
