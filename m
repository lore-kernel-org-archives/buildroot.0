From: Shinya Kuribayashi <skuribay@ruby.dti.ne.jp>
Date: Tue, 09 Oct 2007 11:12:05 +0900
Subject: [Buildroot] [MIPS] toolchain/gcc/Config.in broken?
Message-ID: <470AE375.8010200@ruby.dti.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

It seems that commits r20031 and r20045 or around those have broken
MIPS cross toolchain build:
---
/usr/bin/make MAKE="/usr/bin/make -j1" -C /home/skuribay/devel/buildroot/toolchain_build_mips/uClibc-0.9.29 \
               PREFIX= \
               DEVEL_PREFIX=/ \
               RUNTIME_PREFIX=/ \
               HOSTCC="/usr/bin/gcc" \
               all
make[1]: Entering directory `/home/skuribay/devel/buildroot/toolchain_build_mips/uClibc-0.9.29'
make[2]: `conf' is up to date.
ln -fs sgidefs.h ./include/
make[3]: `conf' is up to date.
ln -fs sgidefs.h ./include/
 LD libuClibc-0.9.29.so
libc/libc_so.a(lldiv.os): In function `imaxdiv':
lldiv.c:(.text+0x3c): undefined reference to `__divdi3'
lldiv.c:(.text+0x68): undefined reference to `__moddi3'
make[2]: *** [lib/libc.so] Error 1
make[1]: *** [lib/libc.so.0] Error 2
make[1]: Leaving directory `/home/skuribay/devel/buildroot/toolchain_build_mips/uClibc-0.9.29'
make: *** [/home/skuribay/devel/buildroot/toolchain_build_mips/uClibc-0.9.29/lib/libc.a] Error 2
---

Although I specified O32 and mips32r2 in menuconfig, gcc-4.2.1-initial/
config.status says --with-abi=o64.

# /home/skuribay/devel/buildroot/toolchain_build_mips/gcc-4.2.1/configure   --prefix=/home/skuribay/devel/buildroot/build_mips/staging_dir/usr --build=i386-pc-linux-gnu --host=i386-pc-linux-gnu --target=mips-linux-uclibc --with-sysroot=/home/skuribay/devel/buildroot/toolchain_build_mips/uClibc_dev/ --disable-__cxa_atexit --enable-target-optspace --with-gnu-ld --disable-shared --with-gmp=/home/skuribay/devel/buildroot/toolchain_build_mips/gmp --with-mpfr=/home/skuribay/devel/buildroot/toolchain_build_mips/mpfr --disable-nls --enable-threads --disable-multilib --with-abi=o64 --with-tune=mips32r2 --enable-languages=c

Is this right? I thought --with-abi=32 expected.
I'm not familiar with buildroot, so I might miss something.

thanks,

   Shinya Kuribayashi
