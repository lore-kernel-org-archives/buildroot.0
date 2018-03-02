From: Alvaro G. M. <alvaro.gamez@hazent.com>
Date: Fri, 2 Mar 2018 13:50:15 +0100
Subject: [Buildroot] host-lz4 bug on LTS 2017.02.10
In-Reply-To: <20180302122601.6yif52fyv7rlhv6i@tarshish>
References: <20180302113812.GA29093@salem.gmr.ssr.upm.es>
 <20180302122601.6yif52fyv7rlhv6i@tarshish>
Message-ID: <20180302125014.GA5480@salem.gmr.ssr.upm.es>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Hi, Baruch! 

On Fri, Mar 02, 2018 at 02:26:01PM +0200, Baruch Siach wrote:
> Hi Alvaro,
> 
> On Fri, Mar 02, 2018 at 12:38:12PM +0100, Alvaro G. M. wrote:
> > I've tracked this issue compiling host-lz4. Offending commit is this one
> > (found via git bisect)
> > 
> > 17cf7e511e6919d5b6744deb21770c2d0ea922a9
> > lz4: install programs as well as libraries
> > 
> > I attach at the end the defconfig file that produced this log, using
> > Microblaze, but I've found that the same error happens on x86_64.
> > 
> > I don't really know what's going on, as it seems it's including
> > /usr/include/stdlib.h from the host system, but bits/libc-header-start.h
> > does indeed exist as /usr/include/x86_64-linux-gnu/bits/libc-header-start.h
> 
> Note the -m32 option in the gcc command line below. You might be missing the 
> 32bit version of bits/. Note sure why host-lz4 builds 32bit though.

Installing libc6-dev:i386 solved it indeed, thanks a lot. This is a machine
just recently installed and I was missing it.

I'll try to dive into lz4 to check why it tries to build as 32 bits.

Thanks a lot for your insight, I had totally missed that!

> 
> baruch
> 
> > make: Entering directory '/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP'
> > make -C /home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/../buildroot O=/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output BR2_EXTERNAL=/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP PROJECT_NAME=TRP BR2_DEFCONFIG=/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/defconfig defconfig
> >   GEN     /home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/Makefile
> > #
> > # configuration written to /home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/.config
> > #
> > make -C /home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/../buildroot O=/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output BR2_EXTERNAL=/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP PROJECT_NAME=TRP BR2_DEFCONFIG=/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/defconfig
> > /usr/bin/make -j1 O=/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output HOSTCC="/usr/bin/gcc" HOSTCXX="/usr/bin/g++" silentoldconfig
> >   GEN     /home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/Makefile
> > BR2_DEFCONFIG='/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/defconfig' KCONFIG_AUTOCONFIG=/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/build/buildroot-config/auto.conf KCONFIG_AUTOHEADER=/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/build/buildroot-config/autoconf.h KCONFIG_TRISTATE=/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/build/buildroot-config/tristate.config BR2_CONFIG=/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/.config HOST_GCC_VERSION="7" BUILD_DIR=/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/build SKIP_LEGACY= /home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/build/buildroot-config/conf --silentoldconfig Config.in
> > [7m>>> host-lz4 r131 Building[27m
> > PATH="/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/bin:/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/sbin:/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/bin:/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/sbin:/home/sslayer/android-sdk-update-manager/platform-tools/:/home/sslayer/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/local/EMPIRE-XCcel:/usr/local/ADS2013_06/bin:/home/sslayer/bin:/usr/NX/bin" PKG_CONFIG="/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/bin/pkg-config" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 PKG_CONFIG_LIBDIR="/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/lib/pkgconfig:/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/share/pkgconfig" PATH="/home/sslayer/Proyectos/AR
> >  T/tmp/buildroot-external-skeleton/TRP/output/host/bin:/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/sbin:/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/bin:/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/sbin:/home/sslayer/android-sdk-update-manager/platform-tools/:/home/sslayer/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/local/EMPIRE-XCcel:/usr/local/ADS2013_06/bin:/home/sslayer/bin:/usr/NX/bin" PKG_CONFIG="/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/bin/pkg-config" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 PKG_CONFIG_LIBDIR="/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/lib/pkgconfig:/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/share/pkgconfig" AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld" NM="/usr/bin
> >  /nm" CC="/usr/bin/gcc" GCC="/usr/bin/gcc" CXX="/usr/bin/g++" CPP="/usr/bin/cpp" OBJCOPY="/usr/bin/objcopy" RANLIB="/usr/bin/ranlib" CPPFLAGS="-I/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/include" CFLAGS="-O2 -I/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/include" CXXFLAGS="-O2 -I/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/include" LDFLAGS="-L/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/lib -L/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/lib -Wl,-rpath,/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/lib" INTLTOOL_PERL=/usr/bin/perl /usr/bin/make -j17 -C /home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/build/host-lz4-r131 all
> > compiling static library
> > compiling dynamic library 1.7.1
> > creating versioned links
> > /usr/bin/gcc -m32 -I../lib -I/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/include -O2 -I/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/include -L/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/lib -L/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/lib -Wl,-rpath,/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/lib -DENABLE_LZ4C_LEGACY_OPTIONS ../lib/lz4.c ../lib/lz4hc.c ../lib/lz4frame.c ../lib/xxhash.c bench.c lz4io.c lz4cli.c -o lz4c32
> > /usr/bin/gcc -m32 -I../lib -I/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/include -O2 -I/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/include -L/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/lib -L/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/lib -Wl,-rpath,/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/lib ../lib/lz4.c ../lib/lz4hc.c ../lib/lz4frame.c ../lib/xxhash.c fullbench.c -o fullbench32
> > /usr/bin/gcc -m32 -I../lib -I/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/include -O2 -I/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/include -L/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/lib -L/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/lib -Wl,-rpath,/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/lib ../lib/lz4.c ../lib/lz4hc.c ../lib/xxhash.c fuzzer.c -o fuzzer32
> > /usr/bin/gcc -m32 -I../lib -I/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/include -O2 -I/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/include -L/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/lib -L/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/lib -Wl,-rpath,/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/lib ../lib/lz4frame.c ../lib/lz4.c ../lib/lz4hc.c ../lib/xxhash.c frametest.c -o frametest32
> > In file included from ../lib/lz4frame.c:52:0:
> > /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No such file or directory
> >  #include <bits/libc-header-start.h>
> >           ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > In file included from ../lib/lz4.c:105:0:
> > /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No such file or directory
> >  #include <bits/libc-header-start.h>
> >           ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > In file included from ../lib/lz4.c:105:0:
> > /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No such file or directory
> >  #include <bits/libc-header-start.h>
> >           ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > In file included from ../lib/lz4.c:105:0:
> > /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No such file or directory
> >  #include <bits/libc-header-start.h>
> >           ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > In file included from ../lib/lz4.c:105:0:
> > /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No such file or directory
> >  #include <bits/libc-header-start.h>
> >           ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > In file included from ../lib/lz4.c:105:0,
> >                  from ../lib/lz4hc.c:65:
> > /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No such file or directory
> >  #include <bits/libc-header-start.h>
> >           ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > In file included from ../lib/lz4.c:105:0,
> >                  from ../lib/lz4hc.c:65:
> > /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No such file or directory
> >  #include <bits/libc-header-start.h>
> >           ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > In file included from ../lib/lz4.c:105:0,
> >                  from ../lib/lz4hc.c:65:
> > /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No such file or directory
> >  #include <bits/libc-header-start.h>
> >           ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > In file included from ../lib/lz4frame.c:52:0:
> > /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No such file or directory
> >  #include <bits/libc-header-start.h>
> >           ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > In file included from ../lib/lz4frame.c:52:0:
> > /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No such file or directory
> >  #include <bits/libc-header-start.h>
> >           ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > In file included from ../lib/lz4.c:105:0,
> >                  from ../lib/lz4hc.c:65:
> > /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No such file or directory
> >  #include <bits/libc-header-start.h>
> >           ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > In file included from ../lib/xxhash.c:90:0:
> > /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No such file or directory
> >  #include <bits/libc-header-start.h>
> >           ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > In file included from ../lib/xxhash.c:90:0:
> > /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No such file or directory
> >  #include <bits/libc-header-start.h>
> >           ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > In file included from ../lib/xxhash.c:90:0:
> > /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No such file or directory
> >  #include <bits/libc-header-start.h>
> >           ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > In file included from fullbench.c:50:0:
> > /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No such file or directory
> >  #include <bits/libc-header-start.h>
> >           ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > In file included from bench.c:47:0:
> > /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No such file or directory
> >  #include <bits/libc-header-start.h>
> >           ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > make[3]: *** [Makefile:88: fullbench32] Error 1
> > make[3]: *** Waiting for unfinished jobs....
> > In file included from ../lib/xxhash.c:90:0:
> > /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No such file or directory
> >  #include <bits/libc-header-start.h>
> >           ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > In file included from lz4io.c:49:0:
> > /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No such file or directory
> >  #include <bits/libc-header-start.h>
> >           ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > In file included from fuzzer.c:45:0:
> > /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No such file or directory
> >  #include <bits/libc-header-start.h>
> >           ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > make[3]: *** [Makefile:94: fuzzer32] Error 1
> > In file included from frametest.c:43:0:
> > /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No such file or directory
> >  #include <bits/libc-header-start.h>
> >           ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > make[3]: *** [Makefile:100: frametest32] Error 1
> > In file included from lz4cli.c:58:0:
> > /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No such file or directory
> >  #include <bits/libc-header-start.h>
> >           ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > make[3]: *** [Makefile:82: lz4c32] Error 1
> > make[2]: *** [Makefile:66: all] Error 2
> > make[1]: *** [package/pkg-generic.mk:219: /home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/build/host-lz4-r131/.stamp_built] Error 2
> > make: *** [../common.mk:42: default] Error 2
> > make: Leaving directory '/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP'
> > 
> > 
> > 
> > defconfig used:
> > 
> > BR2_DL_DIR="$(BR2_EXTERNAL_TRP_PATH)/../dl"
> > BR2_PACKAGE_OVERRIDE_FILE="$(BR2_EXTERNAL_TRP_PATH)/../local.mk"
> > BR2_GLOBAL_PATCH_DIR="$(BR2_EXTERNAL_TRP_PATH)/../patch"
> > BR2_KERNEL_HEADERS_4_4=y
> > BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> > BR2_PTHREAD_DEBUG=y
> > BR2_PACKAGE_HOST_GDB=y
> > BR2_PACKAGE_HOST_GDB_TUI=y
> > BR2_PACKAGE_HOST_GDB_PYTHON=y
> > BR2_TARGET_GENERIC_HOSTNAME="ART-TRP"
> > BR2_TARGET_GENERIC_ISSUE="Welcome to ART-TRP"
> > BR2_ROOTFS_OVERLAY="$(BR2_EXTERNAL_TRP_PATH)/../overlay/common $(BR2_EXTERNAL_TRP_PATH)/../overlay/TRP"
> > BR2_ROOTFS_POST_BUILD_SCRIPT="$(BR2_EXTERNAL_TRP_PATH)/../scripts/set_version_file.sh"
> > BR2_ROOTFS_POST_SCRIPT_ARGS="-p $(PROJECT_NAME) -f $(BR2_EXTERNAL_TRP_PATH)/post_script.rc $(BR2_ART_SOFTWARE_VERSION)"
> > BR2_LINUX_KERNEL=y
> > BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> > BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14"
> > BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> > BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(BR2_EXTERNAL_TRP_PATH)/kernel_mb_defconfig"
> > BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
> > BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="$(BR2_EXTERNAL_TRP_PATH)/system.dts"
> > BR2_PACKAGE_BUSYBOX_CONFIG="$(BR2_EXTERNAL_TRP_PATH)/busybox_defconfig"
> > BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> > BR2_TARGET_ROOTFS_CPIO=y
> > BR2_TARGET_ROOTFS_CPIO_GZIP=y
> > BR2_TARGET_ROOTFS_JFFS2=y
> > BR2_TARGET_ROOTFS_ROMFS=y
> > BR2_TARGET_ROOTFS_SQUASHFS=y
> > BR2_TARGET_ROOTFS_SQUASHFS4_LZ4=y
> 
> -- 
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

-- 
Alvaro G. M.
