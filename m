From: Shinya Kuribayashi <skuribay@ruby.dti.ne.jp>
Date: Tue, 09 Oct 2007 18:56:19 +0900
Subject: [Buildroot] [MIPS] toolchain/gcc/Config.in broken
In-Reply-To: <20071009070816.GP20951@aon.at>
References: <470ADDA8.3080105@ruby.dti.ne.jp> <20071009070816.GP20951@aon.at>
Message-ID: <470B5043.5010606@ruby.dti.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:
> You probably mean OABI and not O32.

Yes :-)

> Look at target/Config.in.arch
> I was under the impression that OABI was 32 for mipsel and o64 for mips,
> no?

I'm not confident about that...

> I'm not too familiar with the mips matrix.. I will take a look how
> mips32r2 should be configured (mips vs. mips64 vs. mipsel vs. ??; i.e.
> both the endianess and the bit-depth have to be settable, AFAICS).

IMHO it's target ABI config problem about OABI and mips, not mips32r2
specific problem as you know.

I have three successful builds. I hope these help.

[1] mips: Before recently toolchain config rework (2007-09-19 build)

skuribay at debian:~/devel/buildroot$ ./build_mips.orig/staging_dir/usr/bin/mips-linux-gcc -v
Using built-in specs.
Target: mips-linux-uclibc
Configured with: /home/skuribay/devel/buildroot/toolchain_build_mips/gcc-4.2.1/configure --prefix=/usr --build=i386-pc-linux-gnu --host=i386-pc-linux-gnu --target=mips-linux-uclibc --enable-languages=c,c++ --with-sysroot=/home/skuribay/devel/buildroot/build_mips/staging_dir --with-build-time-tools=/home/skuribay/devel/buildroot/build_mips/staging_dir/usr/mips-linux-uclibc/bin --disable-__cxa_atexit --enable-target-optspace --with-gnu-ld --enable-shared --with-gmp=/home/skuribay/devel/buildroot/toolchain_build_mips/gmp --with-mpfr=/home/skuribay/devel/buildroot/toolchain_build_mips/mpfr --disable-nls --enable-threads --disable-multilib
Thread model: posix
gcc version 4.2.1

[2] mipsel: Current trunk build

skuribay at debian:~/devel/buildroot$ ./build_mipsel/staging_dir/usr/bin/mipsel-linux-gcc -v
Using built-in specs.
Target: mipsel-linux-uclibc
Configured with: /home/skuribay/devel/buildroot/toolchain_build_mipsel/gcc-4.2.1/configure --prefix=/usr --build=i386-pc-linux-gnu --host=i386-pc-linux-gnu --target=mipsel-linux-uclibc --enable-languages=c,c++ --with-sysroot=/home/skuribay/devel/buildroot/build_mipsel/staging_dir --with-build-time-tools=/home/skuribay/devel/buildroot/build_mipsel/staging_dir/usr/mipsel-linux-uclibc/bin --disable-__cxa_atexit --enable-target-optspace --with-gnu-ld --enable-shared --with-gmp=/home/skuribay/devel/buildroot/toolchain_build_mipsel/gmp --with-mpfr=/home/skuribay/devel/buildroot/toolchain_build_mipsel/mpfr --disable-nls --enable-threads --disable-multilib --with-abi=32 --with-tune=mips32r2
Thread model: posix
gcc version 4.2.1

[3] mips: Current trunk build with a change (for testing)

skuribay at debian:~/devel/buildroot$ svn diff
Index: target/Config.in.arch
===================================================================
--- target/Config.in.arch       (revision 20207)
+++ target/Config.in.arch       (working copy)
@@ -689,7 +689,7 @@
        default iwmmxt          if BR2_iwmmxt
        default 32              if BR2_mipsel && BR2_MIPS_OABI
        default n32             if BR2_mipsel && BR2_MIPS_EABI
-       default o64             if BR2_mips && BR2_MIPS_OABI
+       default 32              if BR2_mips && BR2_MIPS_OABI
        default eabi            if BR2_mips && BR2_MIPS_EABI
        default 64              if BR2_mips && BR2_MIPS_ABI64
        default mmixware        if BR2_mmix && BR2_MMIX_ABI_native

skuribay at debian:~/devel/buildroot$ ./build_mips/staging_dir/usr/bin/mips-linux-gcc -v
Using built-in specs.
Target: mips-linux-uclibc
Configured with: /home/skuribay/devel/buildroot/toolchain_build_mips/gcc-4.2.1/configure --prefix=/usr --build=i386-pc-linux-gnu --host=i386-pc-linux-gnu --target=mips-linux-uclibc --enable-languages=c,c++ --with-sysroot=/home/skuribay/devel/buildroot/build_mips/staging_dir --with-build-time-tools=/home/skuribay/devel/buildroot/build_mips/staging_dir/usr/mips-linux-uclibc/bin --disable-__cxa_atexit --enable-target-optspace --with-gnu-ld --enable-shared --with-gmp=/home/skuribay/devel/buildroot/toolchain_build_mips/gmp --with-mpfr=/home/skuribay/devel/buildroot/toolchain_build_mips/mpfr --disable-nls --enable-threads --disable-multilib --with-abi=32 --with-tune=mips32r2
Thread model: posix
gcc version 4.2.1

Component versions are same for all three:
 - binutils-2.18.50.1
 - gcc-4.2.1
 - gmp-4.2.2
 - linux-2.6.22.1
 - mpfr-2.3.0
 - uClibc-0.9.29

thanks,

    Shinya Kuribayashi
