From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Nov 2008 20:17:32 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <20081030140206.411543C2BE@busybox.net>
References: <20081030140206.411543C2BE@busybox.net>
Message-ID: <20081104201732.54f83c0c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le Thu, 30 Oct 2008 07:02:06 -0700 (PDT),
egtvedt at uclibc.org a ?crit :

> Author: egtvedt
> Date: 2008-10-30 07:02:05 -0700 (Thu, 30 Oct 2008)
> New Revision: 23858

This commit breaks the build for me. See inline comments below.

> Changeset:
> Modified: trunk/buildroot/target/linux/Makefile.in.advanced
> ===================================================================
> --- trunk/buildroot/target/linux/Makefile.in.advanced
> 2008-10-30 08:05:36 UTC (rev 23857) +++
> trunk/buildroot/target/linux/Makefile.in.advanced	2008-10-30
> 14:02:05 UTC (rev 23858) @@ -42,6 +42,9 @@ endif
>  endif
>  
> +# Ask the kernel what version number it will use when installing
> modules +LINUX26_VERSION_PROBED = `$(MAKE) $(LINUX26_MAKE_FLAGS) -C
> $(LINUX26_DIR) -s kernelrelease` +
>  ifeq ($(BOARD_PATH),)
>  BOARD_PATH:=$(strip $(subst ",,$(BR2_BOARD_PATH)))
>  #"))
> @@ -388,16 +391,16 @@
>  	touch -c $@
>  
>  #
> -----------------------------------------------------------------------------
> -$(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep:
> $(LINUX26_DIR)/.configured
> -	rm -rf $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)
> +$(PROJECT_BUILD_DIR)/autotools-stamps/linux_modules_target_installed:
> $(LINUX26_DIR)/.configured

This change breaks with the following:

make[1]: Leaving directory `/home/thomas/local/buildroot2/project_build_arm/uclibc/linux-2.6.27'
touch /home/thomas/local/buildroot2/project_build_arm/uclibc/autotools-stamps/linux_modules_target_installed
touch: cannot touch `/home/thomas/local/buildroot2/project_build_arm/uclibc/autotools-stamps/linux_modules_target_installed': No such file or directory
make: ***
[/home/thomas/local/buildroot2/project_build_arm/uclibc/autotools-stamps/linux_modules_target_installed]
Error 1

> +	rm -rf $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)

And this one (which evaluates LINUX26_VERSION_PROVED) breaks with:

Makefile:1561: *** kernelrelease not valid - run 'make prepare' to update it.  Stop.

(But this one is not fatal, the compilation process continues.)

My .config is below.

Thomas

#
# Automatically generated make config: don't edit
# Tue Nov  4 19:40:25 2008
#
BR2_HAVE_DOT_CONFIG=y
BR2_VERSION="0.10.0-svn"
# BR2_alpha is not set
BR2_arm=y
# BR2_armeb is not set
# BR2_avr32 is not set
# BR2_cris is not set
# BR2_ia64 is not set
# BR2_i386 is not set
# BR2_m68k is not set
# BR2_mips is not set
# BR2_mipsel is not set
# BR2_nios2 is not set
# BR2_powerpc is not set
# BR2_s390 is not set
# BR2_sh is not set
# BR2_sh64 is not set
# BR2_sparc is not set
# BR2_sparc64 is not set
# BR2_x86_64 is not set
BR2_generic_arm=y
# BR2_arm7tdmi is not set
# BR2_arm610 is not set
# BR2_arm710 is not set
# BR2_arm720t is not set
# BR2_arm920t is not set
# BR2_arm922t is not set
# BR2_arm926t is not set
# BR2_arm10t is not set
# BR2_arm1136jf_s is not set
# BR2_arm1176jz_s is not set
# BR2_arm1176jzf_s is not set
# BR2_sa110 is not set
# BR2_sa1100 is not set
# BR2_xscale is not set
# BR2_iwmmxt is not set
BR2_ARM_TYPE="GENERIC_ARM"
# BR2_ARM_OABI is not set
BR2_ARM_EABI=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"

#
# Target options
#

#
# Project Options
#
BR2_PROJECT="uclibc"
BR2_HOSTNAME="uclibc"
BR2_BANNER="Welcome to the Erik's uClibc development environment."

#
# Preset Devices
#
# BR2_TARGET_ARMLTD is not set
# BR2_TARGET_ATMEL is not set
# BR2_TARGET_KWIKBYTE is not set
# BR2_TARGET_SHARP is not set

#
# Generic Architecture support
#
# BR2_TARGET_ARM is not set

#
# Generic System Support
#
# BR2_TARGET_GENERIC_ACCESS_POINT is not set
# BR2_TARGET_GENERIC_FIREWALL is not set
# BR2_TARGET_GENERIC_DEV_SYSTEM is not set

#
# Build options
#
BR2_PRIMARY_SITE=""
BR2_WGET="wget --passive-ftp -nd"
BR2_SVN_CO="svn co"
BR2_SVN_UP="svn up"
BR2_GIT="git clone"
BR2_ZCAT="gzip -d -c"
BR2_BZCAT="bzcat"
BR2_TAR_OPTIONS=""
BR2_DL_DIR="$(BASE_DIR)/dl"

#
# Mirrors and Download locations
#
BR2_SOURCEFORGE_MIRROR="easynews"
BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
BR2_DEBIAN_MIRROR="http://ftp.debian.org"

#
# Atmel Mirrors
#
BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot/"
BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
# BR2_FPU_SUFFIX is not set
BR2_TOPDIR_PREFIX=""
BR2_TOPDIR_SUFFIX=""
BR2_ROOTFS_PREFIX="rootfs"
BR2_ROOTFS_SUFFIX=""
BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
BR2_GNU_TARGET_SUFFIX="linux-uclibc"
BR2_JLEVEL=1
# BR2_PREFER_IMA is not set
# BR2_DEPRECATED is not set
BR2_RECENT=y
# BR2_ENABLE_DEBUG is not set
BR2_STRIP_strip=y
# BR2_STRIP_sstrip is not set
# BR2_STRIP_none is not set
# BR2_OPTIMIZE_0 is not set
# BR2_OPTIMIZE_1 is not set
# BR2_OPTIMIZE_2 is not set
# BR2_OPTIMIZE_3 is not set
BR2_OPTIMIZE_S=y
# BR2_PREFER_STATIC_LIB is not set
# BR2_HAVE_MANPAGES is not set
# BR2_HAVE_INFOPAGES is not set
# BR2_HAVE_DOCUMENTATION is not set
# BR2_HAVE_DEVFILES is not set
BR2_UPDATE_CONFIG=y

#
# Toolchain
#
# BR2_TOOLCHAIN_BUILDROOT is not set
BR2_TOOLCHAIN_EXTERNAL=y
# BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
# BR2_TOOLCHAIN_SOURCE is not set
BR2_EXT_GCC_VERSION_4_1_2=y
BR2_EXT_GCC_VERSION_4_2_1=y
BR2_EXT_GCC_VERSION_4_2_2=y
BR2_EXT_GCC_VERSION_4_2_3=y
BR2_EXT_BINUTILS_VERSION_2_17=y
BR2_EXT_UCLIBC_VERSION_0_9_29=y
BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
BR2_GCC_CROSS_CXX=y
# BR2_PACKAGE_GDB is not set
# BR2_PACKAGE_GDB_SERVER is not set
# BR2_PACKAGE_GDB_HOST is not set
# BR2_LARGEFILE is not set
# BR2_INET_IPV6 is not set
# BR2_INET_RPC is not set
BR2_SOFT_FLOAT=y
BR2_TARGET_OPTIMIZATION="-Os -pipe"

#
# External Toolchain Options
#
BR2_TOOLCHAIN_EXTERNAL_LIB_C="libc.so.0"
BR2_TOOLCHAIN_EXTERNAL_LIBS="ld-uClibc.so.0 libcrypt.so.0 libdl.so.0 libgcc_s.so libm.so.0 libnsl.so.0 libpthread.so.0 libresolv.so.0 librt.so.0 libutil.so.0"
BR2_TOOLCHAIN_EXTERNAL_STRIP=y

#
# Common Toolchain Options
#

#
# Gdb Options
#
BR2_TOOLCHAIN_EXTERNAL_PATH="/usr/local/xtools/arm-unknown-linux-uclibcgnueabi/"
BR2_TOOLCHAIN_EXTERNAL_PREFIX="arm-unknown-linux-uclibcgnueabi"
# BR2_EXT_PTHREADS_NONE is not set
# BR2_EXT_PTHREADS is not set
BR2_EXT_PTHREADS_OLD=y
# BR2_EXT_PTHREADS_NATIVE is not set

#
# Package Selection for the target
#
BR2_PACKAGE_BUSYBOX=y
# BR2_BUSYBOX_VERSION_1_2_2_1 is not set
# BR2_BUSYBOX_VERSION_1_6_1 is not set
# BR2_BUSYBOX_VERSION_1_7_X is not set
# BR2_BUSYBOX_VERSION_1_8_X is not set
# BR2_BUSYBOX_VERSION_1_9_X is not set
# BR2_BUSYBOX_VERSION_1_10_X is not set
# BR2_BUSYBOX_VERSION_1_11_X is not set
BR2_BUSYBOX_VERSION_1_12_X=y
# BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
BR2_BUSYBOX_VERSION="1.12.1"
BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
BR2_PACKAGE_BUSYBOX_CONFIG="busybox.config"
BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
# BR2_PACKAGE_BUSYBOX_SKELETON is not set

#
# The minimum needed to build a uClibc development system
#
# BR2_PACKAGE_FLEX is not set
# BR2_PACKAGE_GCC_TARGET is not set
# BR2_PACKAGE_MAKE is not set

#
# Other development stuff
#
# BR2_PACKAGE_AUTOCONF is not set
# BR2_PACKAGE_AUTOMAKE is not set
# BR2_PACKAGE_BISON is not set
# BR2_PACKAGE_CCACHE_TARGET is not set
# BR2_PACKAGE_DISTCC is not set
# BR2_PACKAGE_DMALLOC is not set
# BR2_PACKAGE_FAKEROOT is not set
# BR2_PACKAGE_GETTEXT is not set
# BR2_PACKAGE_LIBINTL is not set
# BR2_PACKAGE_LIBGMP is not set
# BR2_PACKAGE_GPERF is not set
# BR2_PACKAGE_LIBMPFR is not set
# BR2_PACKAGE_LIBTOOL is not set
# BR2_PACKAGE_M4 is not set
# BR2_PACKAGE_OPROFILE is not set
BR2_PACKAGE_PKGCONFIG=y
# BR2_READLINE is not set
# BR2_PACKAGE_PCRE is not set

#
# Other stuff
#
# BR2_PACKAGE_AT is not set
# BR2_PACKAGE_BEECRYPT is not set
# BR2_PACKAGE_BERKELEYDB is not set
# BR2_PACKAGE_BSDIFF is not set
# BR2_PACKAGE_CUPS is not set
# BR2_PACKAGE_CUSTOMIZE is not set
# BR2_PACKAGE_FILE is not set
# BR2_PACKAGE_GAMIN is not set
# BR2_PACKAGE_ICU is not set
# BR2_PACKAGE_KEXEC is not set
# BR2_PACKAGE_LIBCONFIG is not set
# BR2_PACKAGE_LIBCONFUSE is not set
# BR2_PACKAGE_LIBDAEMON is not set
# BR2_PACKAGE_LIBELF is not set
# BR2_PACKAGE_LIBEVENT is not set
# BR2_PACKAGE_LIBFLOAT is not set
# BR2_PACKAGE_LIBGCRYPT is not set
# BR2_PACKAGE_LIBGPG_ERROR is not set
# BR2_PACKAGE_LIBICONV is not set
# BR2_PACKAGE_LIBLOCKFILE is not set
# BR2_PACKAGE_LIBSYSFS is not set
# BR2_PACKAGE_LOCKFILE_PROGS is not set

#
# logrotate     - disabled (requires wchar support)
#
# BR2_PACKAGE_LSOF is not set
# BR2_PACKAGE_LTP-TESTSUITE is not set
# BR2_PACKAGE_LTRACE is not set
# BR2_PACKAGE_LTT is not set
# BR2_PACKAGE_MEMSTAT is not set
# BR2_PACKAGE_NG_SPICE_REWORK is not set
# BR2_PACKAGE_POPT is not set
# BR2_PACKAGE_SCREEN is not set
# BR2_PACKAGE_STARTUP_NOTIFICATION is not set
# BR2_PACKAGE_STRACE is not set
# BR2_PACKAGE_SUDO is not set
# BR2_DATABASE_SUPPORT is not set
# BR2_NETWORK_SUPPORT is not set
# BR2_BLOCKDEV_SUPPORT is not set
# BR2_AUDIO_SUPPORT is not set
# BR2_GRAPHIC_SUPPORT is not set
# BR2_COMPRESSOR_SUPPORT is not set
# BR2_PACKAGEMGRS_SUPPORT is not set
# BR2_SCRIPTING_SUPPORT is not set
# BR2_XML_SUPPORT is not set
# BR2_JAVA_SUPPORT is not set
# BR2_GAMES is not set

#
# Target filesystem options
#

#
# filesystem for target device
#
# BR2_TARGET_ROOTFS_CRAMFS is not set
# BR2_TARGET_ROOTFS_CLOOP is not set
# BR2_TARGET_ROOTFS_EXT2 is not set
# BR2_TARGET_ROOTFS_JFFS2 is not set
# BR2_TARGET_ROOTFS_UBIFS is not set
# BR2_TARGET_ROOTFS_SQUASHFS is not set
# BR2_TARGET_ROOTFS_TAR is not set
# BR2_TARGET_ROOTFS_CPIO is not set
# BR2_TARGET_ROOTFS_INITRAMFS is not set
# BR2_TARGET_ROOTFS_ROMFS is not set

#
# bootloader for target device
#
# BR2_TARGET_UBOOT is not set

#
# Kernel
#
# BR2_KERNEL_none is not set
BR2_KERNEL_LINUX_ADVANCED=y
# BR2_KERNEL_LINUX is not set
# BR2_KERNEL_HURD is not set
BR2_PACKAGE_LINUX=y
BR2_PACKAGE_LINUX_KCONFIG="kernel.config"
BR2_PACKAGE_LINUX_FORMAT="uImage"
BR2_KERNEL_CURRENT_VERSION="2.6.26.3"
BR2_KERNEL_NEXT_VERSION="2.6.28"
BR2_KERNEL_THIS_VERSION="2.6.27"
BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6/"
BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
# BR2_LINUX_2_6_STABLE is not set
# BR2_LINUX_2_6_26 is not set
# BR2_LINUX_2_6_25 is not set
# BR2_LINUX_2_6_24 is not set
# BR2_LINUX_2_6_23 is not set
# BR2_LINUX_2_6_22_10 is not set
# BR2_LINUX_2_6_22_1 is not set
# BR2_LINUX_2_6_22 is not set
# BR2_LINUX_2_6_21_7 is not set
# BR2_LINUX_2_6_21_5 is not set
# BR2_LINUX_2_6_21 is not set
# BR2_LINUX_2_6_20 is not set
BR2_LINUX_2_6_27=y
# BR2_LINUX_2_6_28 is not set
# BR2_LINUX26_CUSTOM is not set

#
# Patches
#
# BR2_KERNEL_ADD_KERNEL_ORG_PATCH is not set
# BR2_KERNEL_ARCH_PATCH_ENABLED is not set
BR2_LINUX_BOARD_PATCH=y
BR2_LINUX_BSP_PATCH=""
BR2_KERNEL_BASE=y
BR2_DOWNLOAD_LINUX26_VERSION="$(BR2_KERNEL_THIS_VERSION)"
BR2_LINUX26_VERSION="$(BR2_KERNEL_THIS_VERSION)"

#
# Linux Kernel Configuration
#
BR2_PACKAGE_LINUX_USE_KCONFIG=y
# BR2_PACKAGE_LINUX_USE_DEFCONFIG is not set
# BR2_PACKAGE_LINUX_USE_XCONFIG is not set
# BR2_MAKE_XCONFIG is not set
BR2_MAKE_MENUCONFIG=y
BR2_KERNEL_CONFIG_METHOD="menuconfig"
# BR2_LINUX_BIN_BZIMAGE is not set
BR2_LINUX_BIN_UIMAGE=y
# BR2_LINUX_BIN_VMLINUX is not set
# BR2_LINUX_BIN_ZIMAGE is not set
# BR2_LINUX_BIN_CUSTOM is not set

#
# Destinations for linux kernel binaries
#
# BR2_LINUX_COPYTO_ROOTFS is not set
# BR2_LINUX_COPYTO_TFTPBOOT is not set
BR2_LINUX_COPYTO=""
# BR2_LINUX_COPY_CONFIGURATION is not set


-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
