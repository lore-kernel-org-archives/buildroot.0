From: Hebbar <gururajakr@sanyo.co.in>
Date: Mon, 6 Aug 2007 01:55:33 -0700 (PDT)
Subject: [Buildroot] Kindly help me to build glib2 on arm926 platform
Message-ID: <12012803.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi all,

 I am trying to libglib2 on arm926 platform using latest buildroot snapshot
but failing since last 2 weeks. 
I am pasted my buildroot & uclibc config details below. Glib fails with
missing libintl.h I know where the error is but i am unable to solve it.

here is the scenario.
1. gettext builds & saves libintl.h correctly in statging_dir/usr/include
directory.
2. while making glib it 1st build uclibc.
3. while making uclibc it check for gettext awareness & deletes libintl.h
ifneq ($(UCLIBC_HAS_GETTEXT_AWARENESS),y)
	# Remove libintl header since gettext support is disabled.
	$(RM) $(PREFIX)$(DEVEL_PREFIX)include/libintl.h
endif

4. now obviously glib make wqill fail.
5. so now i need to enable UCLIBC_HAS_GETTEXT_AWARENESS by make
uclibc-menuconfig.
6. for this i need to enable UCLIBC_MJN3_ONLY. I f i enable this i get a lot
of error warnings for Timezone daynight & others.

 If anyone can share their buildroot & uclibc .config file to help me build
a arm toolchain i would be really thankfull

Please help to me solve this as this is stopping me from going beyond glib
and make cairo or pango

Thanks in advance.

Regards
Gururaja

********** glib config.log **********************

configure:7552: checking libintl.h usability
configure:7569:
/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-gcc
-Os -pipe 
-I/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/include
-I/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/include
--sysroot=/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/
-isysroot
/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir
-mtune=arm9tdmi -c -g -O2  conftest.c >&5
conftest.c:60:21: error: libintl.h: No such file or directory

<snip>
<snip>
<snip>

configure:7610: checking libintl.h presence
configure:7625:
/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-cpp
-Os -pipe 
-I/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/include
-I/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/include
--sysroot=/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/
-isysroot
/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir
-mtune=arm9tdmi  conftest.c
conftest.c:27:21: error: libintl.h: No such file or directory
configure:7652: result: no
configure:7685: checking for libintl.h
configure:7692: result: no
configure:9045: error:
*** You must have either have gettext support in your C library, or use the
*** GNU gettext library. (http://www.gnu.org/software/gettext/gettext.html


make: ***
[/home/guru/project/original/toolchains/buildroot/build_arm/glib-2.12.9/.configured]
Error 1
root@(none):/home/guru/project/original/toolchains/buildroot# 


/*********buildroot config*************/
BR2_arm=y
BR2_arm926t=y
BR2_ARM_TYPE="ARM926T"
BR2_ARM_EABI=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="arm9tdmi"
BR2_PREFER_STATIC_LIB=y
BR2_TOOLCHAIN_BUILDROOT=y
BR2_TOOLCHAIN_NORMAL=y
BR2_KERNEL_HEADERS_2_6_21=y
BR2_UCLIBC_VERSION_0_9_29=y
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.29-wchar.config"
BR2_ENABLE_LOCALE=y
BR2_BINUTILS_VERSION_2_17=y
BR2_GCC_VERSION_4_2_0=y
BR2_GCC_VERSION="4.2.0"
BR2_TOOLCHAIN_SYSROOT=y
BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-gnu-as"
BR2_GCC_CROSS_CXX=y
BR2_INSTALL_LIBSTDCPP=y
BR2_GCC_SHARED_LIBGCC=y
BR2_USE_WCHAR=y
BR2_PACKAGE_EXPAT=y
BR2_HOST_FAKEROOT=y
BR2_PACKAGE_GETTEXT=y
BR2_PACKAGE_GETTEXT_STATIC=y
BR2_PACKAGE_LIBINTL=y
BR2_PACKAGE_LIBSYSFS=y
BR2_PACKAGE_LIBXML2=y
BR2_PACKAGE_LIBXML2_TARGET_HEADERS=y
BR2_PACKAGE_NCURSES=y
BR2_PACKAGE_NCURSES_TARGET_HEADERS=y
BR2_PACKAGE_DIRECTFB=y
BR2_PACKAGE_JPEG=y
BR2_PACKAGE_LIBPNG=y
BR2_PACKAGE_XSERVER_none=y
BR2_PACKAGE_LIBGLIB2=y
BR2_PACKAGE_FONTCONFIG=y
BR2_PACKAGE_FREETYPE=y
BR2_PACKAGE_ZLIB=y
BR2_PACKAGE_ZLIB_TARGET_HEADERS=y


/*********uclibc .config from
buildroot/toolchain_build_arm/uClibc-0.9.29*************/

TARGET_arm=y
TARGET_ARCH="arm"
FORCE_OPTIONS_FOR_ARCH=y
CONFIG_ARM_EABI=y
# USE_BX is not set
CONFIG_ARM926T=y
ARCH_ANY_ENDIAN=y
ARCH_LITTLE_ENDIAN=y
UCLIBC_HAS_WCHAR=y
UCLIBC_HAS_LOCALE=y
# UCLIBC_HAS_SYS_ERRLIST is not set
UCLIBC_HAS_SIGNUM_MESSAGES=y
# UCLIBC_HAS_SYS_SIGLIST is not set
UCLIBC_HAS_GNU_GETOPT=y
UCLIBC_HAS_GNU_GETSUBOPT=y
# UCLIBC_MJN3_ONLY is not set

-- 
View this message in context: http://www.nabble.com/Kindly-help-me-to-build-glib2-on-arm926-platform-tf4222891.html#a12012803
Sent from the BuildRoot mailing list archive at Nabble.com.
