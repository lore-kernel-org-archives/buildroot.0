From: Mike Davies <busybox_mail@rovoreed.com>
Date: Mon, 14 Mar 2016 19:07:03 +0000
Subject: [Buildroot] tar failing to build with latest buildroot
In-Reply-To: <874mc9dygn.fsf@dell.be.48ers.dk>
References: <1457951104.2051.1.camel@rovoreed.com>
 <874mc9dygn.fsf@dell.be.48ers.dk>
Message-ID: <1457982423.1938.1.camel@rovoreed.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2016-03-14 at 13:40 +0100, Peter Korsgaard wrote:

> > > > > > "Mike" == Mike Davies <busybox_mail@rovoreed.com> writes:
> 
>  > Title says it all really. 'tar' (the real one not the busybox
> version)
>  > fails to build in the latest stable version. I'm using uClibc
> 1.0.12
> 
> 
>  > [mike at ceri buildroot-2016.02]$ make
>  >>>> tar 1.28 Building
>  > PATH="/home/mike/work/kodi/buildroot
>  > -2016.02/output/host/bin:/home/mike/work/kodi/buildroot
>  > -2016.02/output/host/sbin:/home/mike/work/kodi/buildroot
>  > -2016.02/output/host/usr/bin:/home/mike/work/kodi/buildroot
>  > -2016.02/output/host/usr/sbin:/usr/lib64/qt
>  > 
> -3.3/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/home
> /m
>  >
> ike/bin:/sbin:/home/mike/.local/bin:/home/mike/bin:/home/mike/bin:/sb
> in
>  > "  /usr/bin/make -j5  -C /home/mike/work/kodi/buildroot
>  > -2016.02/output/build/tar-1.28/
>  > /usr/bin/make  all-recursive
>  > Making all in doc
>  > make[4]: Nothing to be done for 'all'.
> 
> Is this with a clean build? E.G. tar needs wchar, so if you didn't
> have
> that enabled in the toolchain configuration you will need to rebuild
> the
> toolchain.
> 
> It works for me with current git with this defconfig:
> 
> cat defconfig
> BR2_arm=y
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> BR2_PACKAGE_TAR=y
> 
> 
> What is your configuration exactly? (E.G. run make savedefconfig and
> post your defconfig file).
>

Thanks for the reply. I tried a full rebuild with a 'make clean all'
and it fails exactly the same again.

Here is my defconfig. You'll see I have my own config file for uClibc.
That follows the defconfig, and you'll see that WCHAR is enabled.

BR2_arm=y
BR2_cortex_a7=y
BR2_ARM_FPU_NEON_VFPV4=y
BR2_KERNEL_HEADERS_4_1=y
BR2_UCLIBC_CONFIG="uClibc_armv7.config"
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_TARGET_GENERIC_HOSTNAME="kodi"
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_TARGET_GENERIC_GETTY_PORT="tty1"
# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
BR2_ROOTFS_OVERLAY="../buildroot_rootfs"
BR2_ROOTFS_POST_BUILD_SCRIPT="../PRE_IMAGE_SCRIPT"
BR2_ROOTFS_POST_IMAGE_SCRIPT="../POST_IMAGE_SCRIPT"
BR2_ROOTFS_POST_SCRIPT_ARGS="7"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="
https://github.com/raspberrypi/linux.git"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rpi-4.1.y"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="kernel_armv7.config"
BR2_LINUX_KERNEL_ZIMAGE=y
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2709-rpi-2-b"
BR2_PACKAGE_BUSYBOX_CONFIG="busybox.config"
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_ALSA_UTILS=y
BR2_PACKAGE_ALSA_UTILS_APLAY=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_KODI_ALSA_LIB=y
BR2_PACKAGE_KODI_LIBCEC=y
BR2_PACKAGE_KODI_LIRC=y
BR2_PACKAGE_KODI_LIBUSB=y
BR2_PACKAGE_RPI_FIRMWARE=y
# BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
BR2_PACKAGE_EDID_DECODE=y
BR2_PACKAGE_LIRC_TOOLS=y
BR2_PACKAGE_MINICOM=y
BR2_PACKAGE_RPI_USERLAND=y
BR2_PACKAGE_RPI_USERLAND_START_VCFILED=y
BR2_PACKAGE_PYTHON_PY_PYC=y
BR2_PACKAGE_LIBV4L=y
BR2_PACKAGE_LIBV4L_UTILS=y
BR2_PACKAGE_CURL=y
BR2_PACKAGE_ELFUTILS=y
BR2_PACKAGE_DROPBEAR=y
BR2_PACKAGE_NTP=y
BR2_PACKAGE_NTP_NTPDATE=y
BR2_PACKAGE_NTP_NTPQ=y
BR2_PACKAGE_PURE_FTPD=y
BR2_PACKAGE_WIRELESS_TOOLS=y
BR2_PACKAGE_WPA_SUPPLICANT=y
BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_SYSLOG=y
BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
BR2_PACKAGE_TAR=y
BR2_PACKAGE_NANO=y
BR2_TARGET_ROOTFS_INITRAMFS=y
# BR2_TARGET_ROOTFS_TAR is not set


uClibc_armv7.config ...

#
# Automatically generated file; DO NOT EDIT.
# uClibc-ng 1.0.12 C Library Configuration
#
# TARGET_alpha is not set
# TARGET_arc is not set
TARGET_arm=y
# TARGET_avr32 is not set
# TARGET_bfin is not set
# TARGET_c6x is not set
# TARGET_cris is not set
# TARGET_h8300 is not set
# TARGET_hppa is not set
# TARGET_i386 is not set
# TARGET_ia64 is not set
# TARGET_lm32 is not set
# TARGET_m68k is not set
# TARGET_metag is not set
# TARGET_microblaze is not set
# TARGET_mips is not set
# TARGET_nios2 is not set
# TARGET_or1k is not set
# TARGET_powerpc is not set
# TARGET_sh is not set
# TARGET_sparc is not set
# TARGET_x86_64 is not set
# TARGET_xtensa is not set

#
# Target Architecture Features and Options
#
TARGET_ARCH="arm"
FORCE_OPTIONS_FOR_ARCH=y
CONFIG_ARM_EABI=y
# COMPILE_IN_THUMB_MODE is not set
USE_BX=y
TARGET_SUBARCH=""

#
# Using ELF file format
#
ARCH_HAS_DEPRECATED_SYSCALLS=y
ARCH_ANY_ENDIAN=y
ARCH_LITTLE_ENDIAN=y
# ARCH_WANTS_BIG_ENDIAN is not set
ARCH_WANTS_LITTLE_ENDIAN=y
ARCH_HAS_MMU=y
ARCH_USE_MMU=y
UCLIBC_HAS_FLOATS=y
UCLIBC_HAS_FPU=y
DO_C99_MATH=y
# DO_XSI_MATH is not set
# UCLIBC_HAS_FENV is not set
KERNEL_HEADERS="/home/mike/work/kodi/buildroot/output/build/linux
-headers-4.1.18/usr/include"
HAVE_DOT_CONFIG=y

#
# General Library Settings
#
DOPIC=y
ARCH_HAS_UCONTEXT=y
HAVE_SHARED=y
# FORCE_SHAREABLE_TEXT_SEGMENTS is not set
LDSO_LDD_SUPPORT=y
# LDSO_CACHE_SUPPORT is not set
LDSO_PRELOAD_ENV_SUPPORT=y
# LDSO_PRELOAD_FILE_SUPPORT is not set
# LDSO_STANDALONE_SUPPORT is not set
# LDSO_PRELINK_SUPPORT is not set
# UCLIBC_STATIC_LDCONFIG is not set
LDSO_RUNPATH=y
# LDSO_RUNPATH_OF_EXECUTABLE is not set
LDSO_SAFE_RUNPATH=y
LDSO_SEARCH_INTERP_PATH=y
LDSO_LD_LIBRARY_PATH=y
# LDSO_NO_CLEANUP is not set
UCLIBC_CTOR_DTOR=y
# LDSO_GNU_HASH_SUPPORT is not set
# HAS_NO_THREADS is not set
UCLIBC_HAS_THREADS_NATIVE=y
UCLIBC_HAS_THREADS=y
UCLIBC_HAS_TLS=y
# PTHREADS_DEBUG_SUPPORT is not set
UCLIBC_HAS_SYSLOG=y
UCLIBC_HAS_LFS=y
# MALLOC is not set
# MALLOC_SIMPLE is not set
MALLOC_STANDARD=y
MALLOC_GLIBC_COMPAT=y
# UCLIBC_HAS_OBSTACK is not set
UCLIBC_DYNAMIC_ATEXIT=y
# COMPAT_ATEXIT is not set
UCLIBC_HAS_UTMPX=y
UCLIBC_HAS_UTMP=y
# UCLIBC_SUSV2_LEGACY is not set
UCLIBC_SUSV3_LEGACY=y
# UCLIBC_HAS_CONTEXT_FUNCS is not set
# UCLIBC_SUSV3_LEGACY_MACROS is not set
UCLIBC_SUSV4_LEGACY=y
# UCLIBC_STRICT_HEADERS is not set
# UCLIBC_HAS_STUBS is not set
UCLIBC_HAS_SHADOW=y
UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y
UCLIBC_HAS___PROGNAME=y
UCLIBC_HAS_PTY=y
ASSUME_DEVPTS=y
UNIX98PTY_ONLY=y
UCLIBC_HAS_GETPT=y
UCLIBC_HAS_LIBUTIL=y
UCLIBC_HAS_TM_EXTENSIONS=y
UCLIBC_HAS_TZ_CACHING=y
UCLIBC_HAS_TZ_FILE=y
UCLIBC_HAS_TZ_FILE_READ_MANY=y
UCLIBC_TZ_FILE_PATH="/etc/TZ"
UCLIBC_FALLBACK_TO_ETC_LOCALTIME=y

#
# Advanced Library Settings
#
UCLIBC_PWD_BUFFER_SIZE=256
UCLIBC_GRP_BUFFER_SIZE=256

#
# Support various families of functions
#
UCLIBC_LINUX_MODULE_26=y
# UCLIBC_LINUX_MODULE_24 is not set
UCLIBC_LINUX_SPECIFIC=y
UCLIBC_HAS_GNU_ERROR=y
UCLIBC_BSD_SPECIFIC=y
UCLIBC_HAS_BSD_ERR=y
# UCLIBC_HAS_OBSOLETE_BSD_SIGNAL is not set
# UCLIBC_HAS_OBSOLETE_SYSV_SIGNAL is not set
# UCLIBC_NTP_LEGACY is not set
# UCLIBC_SV4_DEPRECATED is not set
UCLIBC_HAS_REALTIME=y
UCLIBC_HAS_ADVANCED_REALTIME=y
UCLIBC_HAS_EPOLL=y
UCLIBC_HAS_XATTR=y
UCLIBC_HAS_PROFILING=y
UCLIBC_HAS_CRYPT_IMPL=y
# UCLIBC_HAS_SHA256_CRYPT_IMPL is not set
# UCLIBC_HAS_SHA512_CRYPT_IMPL is not set
UCLIBC_HAS_CRYPT=y
UCLIBC_HAS_NETWORK_SUPPORT=y
UCLIBC_HAS_SOCKET=y
UCLIBC_HAS_IPV4=y
UCLIBC_HAS_IPV6=y
UCLIBC_HAS_RPC=y
UCLIBC_HAS_FULL_RPC=y
UCLIBC_HAS_REENTRANT_RPC=y
UCLIBC_USE_NETLINK=y
UCLIBC_SUPPORT_AI_ADDRCONFIG=y
# UCLIBC_HAS_BSD_RES_CLOSE is not set
UCLIBC_HAS_COMPAT_RES_STATE=y
# UCLIBC_HAS_EXTRA_COMPAT_RES_STATE is not set
UCLIBC_HAS_RESOLVER_SUPPORT=y
UCLIBC_HAS_LIBRESOLV_STUB=y
UCLIBC_HAS_LIBNSL_STUB=y

#
# String and Stdio Support
#
# UCLIBC_HAS_STRING_GENERIC_OPT is not set
UCLIBC_HAS_STRING_ARCH_OPT=y
UCLIBC_HAS_STDIO_FUTEXES=y
UCLIBC_HAS_CTYPE_TABLES=y
UCLIBC_HAS_CTYPE_SIGNED=y
# UCLIBC_HAS_CTYPE_UNSAFE is not set
UCLIBC_HAS_CTYPE_CHECKED=y
# UCLIBC_HAS_CTYPE_ENFORCED is not set
UCLIBC_HAS_WCHAR=y
UCLIBC_HAS_LOCALE=y
# UCLIBC_BUILD_ALL_LOCALE is not set
UCLIBC_BUILD_MINIMAL_LOCALE=y
UCLIBC_BUILD_MINIMAL_LOCALES="en_US"
UCLIBC_HAS_XLOCALE=y
UCLIBC_HAS_HEXADECIMAL_FLOATS=y
# UCLIBC_HAS_GLIBC_DIGIT_GROUPING is not set
UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
# UCLIBC_HAS_STDIO_BUFSIZ_256 is not set
# UCLIBC_HAS_STDIO_BUFSIZ_512 is not set
# UCLIBC_HAS_STDIO_BUFSIZ_1024 is not set
# UCLIBC_HAS_STDIO_BUFSIZ_2048 is not set
UCLIBC_HAS_STDIO_BUFSIZ_4096=y
# UCLIBC_HAS_STDIO_BUFSIZ_8192 is not set
UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_4 is not set
# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_8 is not set
# UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT is not set
# UCLIBC_HAS_STDIO_GETC_MACRO is not set
# UCLIBC_HAS_STDIO_PUTC_MACRO is not set
UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
# UCLIBC_HAS_FOPEN_CLOSEEXEC_MODE is not set
UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
UCLIBC_HAS_PRINTF_M_SPEC=y
UCLIBC_HAS_ERRNO_MESSAGES=y
# UCLIBC_HAS_SYS_ERRLIST is not set
UCLIBC_HAS_SIGNUM_MESSAGES=y
# UCLIBC_HAS_SYS_SIGLIST is not set
UCLIBC_HAS_GNU_GETOPT=y
UCLIBC_HAS_GETOPT_LONG=y
UCLIBC_HAS_GNU_GETSUBOPT=y
UCLIBC_HAS_ARGP=y

#
# Big and Tall
#
UCLIBC_HAS_REGEX=y
# UCLIBC_HAS_REGEX_OLD is not set
UCLIBC_HAS_FNMATCH=y
# UCLIBC_HAS_FNMATCH_OLD is not set
# UCLIBC_HAS_WORDEXP is not set
UCLIBC_HAS_NFTW=y
UCLIBC_HAS_FTW=y
# UCLIBC_HAS_FTS is not set
UCLIBC_HAS_GLOB=y
UCLIBC_HAS_GNU_GLOB=y

#
# Library Installation Options
#
RUNTIME_PREFIX="/"
DEVEL_PREFIX="/usr"
MULTILIB_DIR="lib"
HARDWIRED_ABSPATH=y

#
# Security options
#
# UCLIBC_BUILD_PIE is not set
# UCLIBC_HAS_ARC4RANDOM is not set
# UCLIBC_HAS_SSP is not set
UCLIBC_BUILD_RELRO=y
UCLIBC_BUILD_NOW=y
UCLIBC_BUILD_NOEXECSTACK=y

#
# Development/debugging options
#
CROSS_COMPILER_PREFIX="/home/mike/work/kodi/buildroot/output/host/usr/b
in/arm-buildroot-linux-uclibcgnueabihf-"
UCLIBC_EXTRA_CFLAGS=""
# DODEBUG is not set
DOSTRIP=y
# DOASSERTS is not set
# SUPPORT_LD_DEBUG is not set
# SUPPORT_LD_DEBUG_EARLY is not set
# UCLIBC_MALLOC_DEBUGGING is not set
# UCLIBC_HAS_BACKTRACE is not set
WARNINGS="-Wall"
# EXTRA_WARNINGS is not set
# DOMULTI is not set
[mike at ceri buildroot-2016.02]$ 
