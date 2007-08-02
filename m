From: Benjamin Tietz <benjamin@micronet24.de>
Date: Thu, 2 Aug 2007 10:00:11 +0200
Subject: [Buildroot] DirectFB Fails with wrong File Format erro rfor
	libsysfs
In-Reply-To: <11959125.post@talk.nabble.com>
References: <11959125.post@talk.nabble.com>
Message-ID: <20070802080011.GB4820@firebird.dresden.micronet24.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 01, 2007 at 11:25:06PM -0700, Hebbar wrote:
> 
> Hi all,
> 
>   I am trying to build arm 926ejs toolchain with latest buildroot snapshot .
> while compilling directfb I get error as mentione below libsysfs in wrong
> file format. i checked $(BUILD_DIR)/staging_dir/usr/lib & libsysfs.[a/so]
> exists their. but the make directfb must be from /usr/lib/. 
>   
>   kindly help me to resolve the same. i have attached the Directfb configure
> erro & also my Buildroot config details & directfb config.log details
> 
> 
> Regards
> Gururaja  

I had a similar error in another package some time ago and found out,
that libtool expands the -l... (In this case the -ldirectfb) to the
first library-file it finds. Unfurtunatly It searches the system-path
first. That time I was patching libtool to ignore the library I needed;
but it was a verry dirty hack. 
Maybe someone knows a better solution.
>   
> ************directfb configure error*************************************
> 
> /home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-gcc
> -Os -pipe 
> -I/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/include
> -I/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/include
> --sysroot=/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/
> -isysroot
> /home/guru/project/original/toolchains/buildroot/build_arm/staging_dir
> -mtune=arm9tdmi -shared  .libs/fbdev.o .libs/vt.o .libs/agp.o  -Wl,--rpath
> -Wl,/home/guru/project/original/toolchains/buildroot/build_arm/DirectFB-0.9.25.1/lib/direct/.libs
> -Wl,--rpath
> -Wl,/home/guru/project/original/toolchains/buildroot/build_arm/DirectFB-0.9.25.1/lib/fusion/.libs
> -Wl,--rpath
> -Wl,/home/guru/project/original/toolchains/buildroot/build_arm/DirectFB-0.9.25.1/src/.libs
> /usr/lib/libsysfs.so ../../lib/direct/.libs/libdirect.so
> ../../lib/fusion/.libs/libfusion.so ../../src/.libs/libdirectfb.so -ldl
> -lpthread  -mtune=arm9tdmi -Wl,-soname -Wl,libdirectfb_fbdev.so -o
> .libs/libdirectfb_fbdev.so
> /usr/lib/libsysfs.so: could not read symbols: File in wrong format
> collect2: ld returned 1 exit status
> make[4]: *** [libdirectfb_fbdev.la] Error 1
> make[4]: Leaving directory
> `/home/guru/project/original/toolchains/buildroot/build_arm/DirectFB-0.9.25.1/systems/fbdev'
> make[3]: *** [all-recursive] Error 1
> make[3]: Leaving directory
> `/home/guru/project/original/toolchains/buildroot/build_arm/DirectFB-0.9.25.1/systems'
> make[2]: *** [all-recursive] Error 1
> make[2]: Leaving directory
> `/home/guru/project/original/toolchains/buildroot/build_arm/DirectFB-0.9.25.1'
> make[1]: *** [all-recursive-am] Error 2
> make[1]: Leaving directory
> `/home/guru/project/original/toolchains/buildroot/build_arm/DirectFB-0.9.25.1'
> make: ***
> [/home/guru/project/original/toolchains/buildroot/build_arm/DirectFB-0.9.25.1/.compiled]
> Error 2
> 
> *********************directfb confi.log****************************
> <snip>
> <snip>
>   $ ./configure --target=arm-linux --host=arm-linux
> --build=i386-pc-linux-gnu --prefix=/usr --exec-prefix=/usr --bindir=/usr/bin
> --sbindir=/usr/sbin --libdir=/lib --libexecdir=/usr/lib --sysconfdir=/etc
> --datadir=/usr/share --localstatedir=/var --includedir=/usr/include
> --mandir=/usr/man --infodir=/usr/info --with-gfxdrivers=cle266,unichrome
> --enable-jpeg --enable-png --enable-linux-input --enable-zlib
> --enable-freetype --enable-sysfs --disable-sdl --disable-video4linux
> --disable-video4linux2 --disable-fusion
> 
> <snip>
> <snip>
> configure:21879: checking for sysfs_get_mnt_path in -lsysfs
> configure:21909:
> /home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-gcc
> -Os -pipe 
> -I/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/include
> -I/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/include
> --sysroot=/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/
> -isysroot
> /home/guru/project/original/toolchains/buildroot/build_arm/staging_dir
> -mtune=arm9tdmi -o conftest -O3 -ffast-math -pipe  -D_REENTRANT   conftest.c
> -lsysfs  -ldl -lpthread  >&5
> configure:21915: $? = 0
> configure:21918: test -z 			 || test ! -s conftest.err
> configure:21921: $? = 0
> configure:21924: test -s conftest
> configure:21927: $? = 0
> configure:21940: result: yes
> configure:21954: checking sysfs/libsysfs.h usability
> configure:21966:
> /home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-gcc
> -Os -pipe 
> -I/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/include
> -I/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/include
> --sysroot=/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/
> -isysroot
> /home/guru/project/original/toolchains/buildroot/build_arm/staging_dir
> -mtune=arm9tdmi -c -O3 -ffast-math -pipe  -D_REENTRANT  conftest.c >&5
> configure:21972: $? = 0
> configure:21975: test -z 			 || test ! -s conftest.err
> configure:21978: $? = 0
> configure:21981: test -s conftest.o
> configure:21984: $? = 0
> configure:21994: result: yes
> configure:21998: checking sysfs/libsysfs.h presence
> configure:22008:
> /home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-cpp
> -Os -pipe 
> -I/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/include
> -I/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/include
> --sysroot=/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/
> -isysroot
> /home/guru/project/original/toolchains/buildroot/build_arm/staging_dir
> -mtune=arm9tdmi -D_REENTRANT  conftest.c
> configure:22014: $? = 0
> configure:22034: result: yes
> configure:22069: checking for sysfs/libsysfs.h
> configure:22076: result: yes
> 
> ***************buildroot config file************************************
> BR2_arm=y
> BR2_arm926t=y
> BR2_ARM_TYPE="ARM926T"
> BR2_ARM_EABI=y
> BR2_ARCH="arm"
> BR2_ENDIAN="LITTLE"
> BR2_GCC_TARGET_TUNE="arm9tdmi"
> BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
> BR2_PREFER_STATIC_LIB=y
> BR2_TOOLCHAIN_BUILDROOT=y
> BR2_TOOLCHAIN_NORMAL=y
> BR2_KERNEL_HEADERS_2_6_21=y
> BR2_UCLIBC_VERSION_0_9_29=y
> BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.29-wchar.config"
> BR2_ENABLE_LOCALE=y
> BR2_GCC_VERSION_4_2_0=y
> BR2_GCC_VERSION="4.2.0"
> BR2_TOOLCHAIN_SYSROOT=y
> BR2_GCC_CROSS_CXX=y
> BR2_INSTALL_LIBSTDCPP=y
> BR2_GCC_SHARED_LIBGCC=y
> BR2_LARGEFILE=y
> BR2_USE_WCHAR=y
> BR2_PACKAGE_EXPAT=y
> BR2_HOST_FAKEROOT=y
> BR2_PACKAGE_GETTEXT=y
> BR2_PACKAGE_GETTEXT_STATIC=y
> BR2_PACKAGE_LIBINTL=y
> BR2_PACKAGE_PKGCONFIG=y
> BR2_PACKAGE_LIBSYSFS=y
> BR2_PACKAGE_LIBXML2=y
> BR2_PACKAGE_LIBXML2_TARGET_HEADERS=y
> BR2_PACKAGE_NCURSES=y
> BR2_PACKAGE_NCURSES_TARGET_HEADERS=y
> BR2_PACKAGE_DIRECTFB=y
> BR2_PACKAGE_JPEG=y
> BR2_PACKAGE_LIBPNG=y
> BR2_PACKAGE_FONTCONFIG=y
> BR2_PACKAGE_FREETYPE=y
> BR2_COMPRESSOR_SUPPORT=y
> BR2_PACKAGE_ZLIB=y
> BR2_PACKAGE_ZLIB_TARGET_HEADERS=y
> 
> -- 
> View this message in context: http://www.nabble.com/DirectFB-Fails-with-wrong-File-Format-erro-rfor-libsysfs-tf4204376.html#a11959125
> Sent from the BuildRoot mailing list archive at Nabble.com.
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
