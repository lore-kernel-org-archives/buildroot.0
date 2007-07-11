From: Joey Oravec <joravec@drewtech.com>
Date: Wed, 11 Jul 2007 09:54:20 -0400
Subject: [Buildroot] buildroot with ARM926T and soft float
Message-ID: <f72nee$rmg$1@sea.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi -

Using buildroot (from subversion July 11, 2007) I have trouble building 
uClibc due to missing items in libgcc. This happens when I select an ARM926T 
with soft float and gcc 4.1.2 or gcc 4.2.0. There's a bug ID 1405 in the 
uClibc tracker that looks similar to my issue.

It's my first time posting to the list so I hope I'm including everything 
necessary. During the uClibc build I get the following:

  AR cr libc/libc_so.a
  LD libuClibc-0.9.29.so
libc/libc_so.a(difftime.os): In function `difftime':
difftime.c:(.text+0x8): undefined reference to `__floatsidf'
difftime.c:(.text+0x2c): undefined reference to `__subdf3'
libc/libc_so.a(_fpmaxtostr.os): In function `_fpmaxtostr':
_fpmaxtostr.c:(.text+0xd0): undefined reference to `__nedf2'
_fpmaxtostr.c:(.text+0xf4): undefined reference to `__eqdf2'
_fpmaxtostr.c:(.text+0x110): undefined reference to `__divdf3'
_fpmaxtostr.c:(.text+0x11c): undefined reference to `__ltdf2'
_fpmaxtostr.c:(.text+0x1d0): undefined reference to `__muldf3'
_fpmaxtostr.c:(.text+0x384): undefined reference to `__gedf2'
_fpmaxtostr.c:(.text+0x40c): undefined reference to `__floatunsidf'
libc/libc_so.a(__psfs_do_numeric.os): In function `__psfs_do_numeric':
__psfs_do_numeric.c:(.text+0x540): undefined reference to `__truncdfsf2'
libc/libc_so.a(strtof.os): In function `strtof':
strtof.c:(.text+0x1c): undefined reference to `__extendsfdf2'
libc/libc_so.a(__strtofpmax.os): In function `__strtofpmax':
__strtofpmax.c:(.text+0x154): undefined reference to `__adddf3'
/home/joey/buildroot/build_arm_nofpu/staging_dir/usr/lib/gcc/arm-linux-uclibc/42.0/libgcc.a(_fixunsdfsi.o): 
In function `__fixunsdfsi':
libgcc2.c:(.text+0x34): undefined reference to `__fixdfsi'
make[2]: *** [lib/libc.so] Error 1
make[1]: *** [lib/libc.so.0] Error 2
make[1]: Leaving directory 
`/home/joey/buildroot/toolchain_build_arm_nofpu/uClic-0.9.29'
make: *** 
[/home/joey/buildroot/toolchain_build_arm_nofpu/uClibc-0.9.29/lib/lib.a] 
Error 2

And my .config file:

BR2_HAVE_DOT_CONFIG=y
BR2_arm=y
BR2_arm926t=y
BR2_ARM_TYPE="ARM926T"
BR2_ARM_EABI=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="arm926ej-s"
BR2_WGET="wget --passive-ftp -nd"
BR2_SVN="svn co"
BR2_ZCAT="gzip -d -c"
BR2_BZCAT="bzcat"
BR2_TAR_OPTIONS=""
BR2_DL_DIR="$(BASE_DIR)/dl"
BR2_SOURCEFORGE_MIRROR="easynews"
BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
BR2_TOPDIR_PREFIX=""
BR2_TOPDIR_SUFFIX=""
BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
BR2_GNU_TARGET_SUFFIX="linux-uclibc"
BR2_JLEVEL=1
BR2_TOOLCHAIN_BUILDROOT=y
BR2_KERNEL_HEADERS_2_6_21=y
BR2_DEFAULT_KERNEL_HEADERS="2.6.21.5"
BR2_UCLIBC_VERSION_0_9_29=y
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.29.config"
BR2_PTHREADS_OLD=y
BR2_BINUTILS_VERSION_2_17=y
BR2_BINUTILS_VERSION="2.17"
BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
BR2_GCC_VERSION_4_2_0=y
BR2_GCC_VERSION="4.2.0"
BR2_TOOLCHAIN_SYSROOT=y
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
BR2_INSTALL_LIBSTDCPP=y
BR2_GCC_SHARED_LIBGCC=y
BR2_LARGEFILE=y
BR2_SOFT_FLOAT=y
BR2_TARGET_OPTIMIZATION="-Os -pipe"
BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
BR2_PACKAGE_BUSYBOX=y
BR2_BUSYBOX_VERSION_1_6_1=y
BR2_BUSYBOX_VERSION="1.6.1"
BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS=y
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.6.0.config"
BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS="-march=armv5te -mcpu=arm926ej-s"
BR2_NETWORK_SUPPORT=y
BR2_BLOCKDEV_SUPPORT=y
BR2_AUDIO_SUPPORT=y
BR2_GRAPHIC_SUPPORT=y
BR2_COMPRESSOR_SUPPORT=y
BR2_SCRIPTING_SUPPORT=y
