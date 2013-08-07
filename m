From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 7 Aug 2013 10:38:08 +0200
Subject: [Buildroot] buildroot 2013.08-rc1 large file support
Message-ID: <CAB0FRsuK6T8q5nokvmGAknOhi3uUW6QEdDF0wM9RxPXBh1xKBw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a problem which looks like "buildroot 2012.11 large file
support" (see http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/50741
and fixed by http://git.buildroot.net/buildroot/commit/?id=7ce93438c12ca68c9bb12ed28c4d15d1fa840c94
)

I have tried to build qemu_arm_versatile_defconfig (without any
modification) with the release 2013.08-rc1 on a 32bit Ubuntu 12.04
machine.
The build of the toolchain fails with :
>>> host-gcc-final 4.7.3 Building
...
/home/user/build/qarm2/build/host-gcc-final-4.7.3/build/./gcc/xgcc
-B/home/user/build/qarm2/build/host-gcc-final-4.7.3/build/./gcc/
-B/home/user/build/qarm2/host/usr/arm-buildroot-linux-uclibcgnueabi/bin/
-B/home/user/build/qarm2/host/usr/arm-buildroot-linux-uclibcgnueabi/lib/
-isystem /home/user/build/qarm2/host/usr/arm-buildroot-linux-uclibcgnueabi/include
-isystem /home/user/build/qarm2/host/usr/arm-buildroot-linux-uclibcgnueabi/sys-include
   -g -Os -O2 -g -Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall
-Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes
-Wold-style-definition  -isystem ./include  -I. -I. -I../.././gcc
-I../../../libgcc -I../../../libgcc/. -I../../../libgcc/../gcc
-I../../../libgcc/../include   -g0 -finhibit-size-directive
-fno-inline -fno-exceptions -fno-zero-initialized-in-bss
-fno-toplevel-reorder -fno-tree-vectorize -fno-stack-protector  -I.
-I. -I../.././gcc -I../../../libgcc -I../../../libgcc/.
-I../../../libgcc/../gcc -I../../../libgcc/../include  -o crtbegin.o
-MT crtbegin.o -MD -MP -MF crtbegin.dep  -c ../../../libgcc/crtstuff.c
-DCRT_BEGIN
In file included from
/home/user/build/qarm2/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:28:0,
                 from ../../../libgcc/../gcc/tsystem.h:88,
                 from ../../../libgcc/crtstuff.c:62:
/home/user/build/qarm2/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/features.h:219:5:
error: #error It appears you have defined _FILE_OFFSET_BITS=64.
Unfortunately, uClibc was built without large file support enabled.
In file included from
/home/user/build/qarm2/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:72:0,
                 from ../../../libgcc/../gcc/tsystem.h:88,
                 from ../../../libgcc/crtstuff.c:62:
/home/user/build/qarm2/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/bits/uClibc_stdio.h:61:2:
error: #error Sorry... uClibc was built without large file support!
In file included from ../../../libgcc/../gcc/tsystem.h:88:0,
                 from ../../../libgcc/crtstuff.c:62:
/home/user/build/qarm2/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:83:1:
error: unknown type name ?__STDIO_fpos64_t?

Like with the fix of 2012.11, the initial & intermediate stages are
built with --disable-largefile forced.
See the dump :
$ make O=~/build/qarm2 printvars | grep -E HOST_GCC_[A-Z]+_CONF_OPT
HOST_GCC_COMMON_CONF_OPT=--target=arm-buildroot-linux-uclibcgnueabi
--with-sysroot=/home/user/build/qarm2/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot
--disable-__cxa_atexit --with-gnu-ld --disable-libssp
--disable-multilib --with-gmp=/home/user/build/qarm2/host/usr
--with-mpfr=/home/user/build/qarm2/host/usr  --enable-target-optspace
--disable-libquadmath --enable-tls --enable-threads
--with-mpc=/home/user/build/qarm2/host/usr --with-float=soft
--disable-decimal-float --with-arch="armv5te" --with-tune="arm926ej-s"
--with-abi="aapcs-linux" --with-float=soft --with-mode=arm
--with-pkgversion="Buildroot 2013.08-rc1-00011-g6cabf13"
--with-bugurl="http://bugs.buildroot.net/"
(--target=$(GNU_TARGET_NAME) --with-sysroot=$(STAGING_DIR)
--disable-__cxa_atexit --with-gnu-ld --disable-libssp
--disable-multilib --with-gmp=$(HOST_DIR)/usr
--with-mpfr=$(HOST_DIR)/usr  --enable-target-optspace
--disable-libquadmath --enable-tls --enable-threads
--with-mpc=$(HOST_DIR)/usr --with-float=soft --disable-decimal-float
--with-arch=$(BR2_GCC_TARGET_ARCH) --with-tune=$(BR2_GCC_TARGET_TUNE)
--with-abi=$(BR2_GCC_TARGET_ABI) --with-float=$(GCC_TARGET_FLOAT_ABI)
--with-mode=$(GCC_TARGET_MODE) --with-pkgversion="Buildroot
$(BR2_VERSION_FULL)" --with-bugurl="http://bugs.buildroot.net/")
HOST_GCC_FINAL_CONF_OPT=--target=arm-buildroot-linux-uclibcgnueabi
--with-sysroot=/home/user/build/qarm2/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot
--disable-__cxa_atexit --with-gnu-ld --disable-libssp
--disable-multilib --with-gmp=/home/user/build/qarm2/host/usr
--with-mpfr=/home/user/build/qarm2/host/usr  --enable-target-optspace
--disable-libquadmath --enable-tls --enable-threads
--with-mpc=/home/user/build/qarm2/host/usr --with-float=soft
--disable-decimal-float --with-arch="armv5te" --with-tune="arm926ej-s"
--with-abi="aapcs-linux" --with-float=soft --with-mode=arm
--with-pkgversion="Buildroot 2013.08-rc1-00011-g6cabf13"
--with-bugurl="http://bugs.buildroot.net/" --enable-languages=c
--with-build-time-tools=/home/user/build/qarm2/host/usr/arm-buildroot-linux-uclibcgnueabi/bin
--disable-libgomp  ($(HOST_GCC_COMMON_CONF_OPT)
--enable-languages=$(GCC_FINAL_CROSS_LANGUAGES)
--with-build-time-tools=$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin
--disable-libgomp $(call qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS)))
HOST_GCC_INITIAL_CONF_OPT=--target=arm-buildroot-linux-uclibcgnueabi
--with-sysroot=/home/user/build/qarm2/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot
--disable-__cxa_atexit --with-gnu-ld --disable-libssp
--disable-multilib --with-gmp=/home/user/build/qarm2/host/usr
--with-mpfr=/home/user/build/qarm2/host/usr  --enable-target-optspace
--disable-libquadmath --enable-tls --enable-threads
--with-mpc=/home/user/build/qarm2/host/usr --with-float=soft
--disable-decimal-float --with-arch="armv5te" --with-tune="arm926ej-s"
--with-abi="aapcs-linux" --with-float=soft --with-mode=arm
--with-pkgversion="Buildroot 2013.08-rc1-00011-g6cabf13"
--with-bugurl="http://bugs.buildroot.net/" --enable-languages=c
--disable-shared --without-headers --with-newlib --disable-largefile
--disable-nls  ($(HOST_GCC_COMMON_CONF_OPT) --enable-languages=c
--disable-shared --without-headers --with-newlib --disable-largefile
--disable-nls $(call qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS)))
HOST_GCC_INTERMEDIATE_CONF_OPT=--target=arm-buildroot-linux-uclibcgnueabi
--with-sysroot=/home/user/build/qarm2/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot
--disable-__cxa_atexit --with-gnu-ld --disable-libssp
--disable-multilib --with-gmp=/home/user/build/qarm2/host/usr
--with-mpfr=/home/user/build/qarm2/host/usr  --enable-target-optspace
--disable-libquadmath --enable-tls --enable-threads
--with-mpc=/home/user/build/qarm2/host/usr --with-float=soft
--disable-decimal-float --with-arch="armv5te" --with-tune="arm926ej-s"
--with-abi="aapcs-linux" --with-float=soft --with-mode=arm
--with-pkgversion="Buildroot 2013.08-rc1-00011-g6cabf13"
--with-bugurl="http://bugs.buildroot.net/" --enable-languages=c
--disable-largefile --disable-nls  ($(HOST_GCC_COMMON_CONF_OPT)
--enable-languages=c --disable-largefile --disable-nls $(call
qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS)))

But the final stage is built without --disable-large, the config
DISABLE_LARGEFILE is used only for target package, not for host
package.
See package/pkg-autotools.mk and the dump :
$ make O=~/build/qarm2 printvars | grep "HOST_GCC_FINAL_CONFIGURE_CMDS"
HOST_GCC_FINAL_CONFIGURE_CMDS=	(cd  && rm -rf config.cache;
PATH=/home/user/build/qarm2/host/bin:/home/user/build/qarm2/host/usr/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld" NM="/usr/bin/nm"
CC="/usr/bin/gcc" GCC="/usr/bin/gcc" CXX="/usr/bin/g++"
CPP="/usr/bin/cpp"
CPPFLAGS="-I/home/user/build/qarm2/host/usr/include" CFLAGS="-O2
-I/home/user/build/qarm2/host/usr/include" CXXFLAGS="-O2
-I/home/user/build/qarm2/host/usr/include"
LDFLAGS="-L/home/user/build/qarm2/host/lib
-L/home/user/build/qarm2/host/usr/lib
-Wl,-rpath,/home/user/build/qarm2/host/usr/lib"
PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG="/home/user/build/qarm2/host/usr/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/"
PKG_CONFIG_LIBDIR="/home/user/build/qarm2/host/usr/lib/pkgconfig:/home/user/build/qarm2/host/usr/share/pkgconfig"
PERLLIB="/home/user/build/qarm2/host/usr/lib/perl"
LD_LIBRARY_PATH="/home/user/build/qarm2/host/usr/lib:" CFLAGS="-O2
-I/home/user/build/qarm2/host/usr/include"
LDFLAGS="-L/home/user/build/qarm2/host/lib
-L/home/user/build/qarm2/host/usr/lib
-Wl,-rpath,/home/user/build/qarm2/host/usr/lib"  ./configure
--prefix="/home/user/build/qarm2/host/usr"
--sysconfdir="/home/user/build/qarm2/host/etc" --enable-shared
--disable-static --disable-gtk-doc --disable-doc --disable-docs
--disable-documentation --with-xmlto=no --with-fop=no   ) (	(cd
$($(PKG)_SRCDIR) && rm -rf config.cache; $(HOST_CONFIGURE_OPTS)
CFLAGS="$(HOST_CFLAGS)" LDFLAGS="$(HOST_LDFLAGS)" $($(PKG)_CONF_ENV)
./configure --prefix="$(HOST_DIR)/usr" --sysconfdir="$(HOST_DIR)/etc"
--enable-shared --disable-static --disable-gtk-doc --disable-doc
--disable-docs --disable-documentation --with-xmlto=no --with-fop=no
$(QUIET) $($(PKG)_CONF_OPT) ))

Fran?ois.

Note : the new feature "make printvars" saves my day.
