From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 14 Feb 2007 03:47:00 -0800
Subject: [Buildroot] [buildroot 0001114]: Cannot build ARM eabi toolchain
Message-ID: <f21f16b7bfc9d7b3d20a0b0129ab0e17@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1114 
====================================================================== 
Reported By:                mikewhit
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1114
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             12-13-2006 01:58 PST
Last Modified:              02-14-2007 03:46 PST
====================================================================== 
Summary:                    Cannot build ARM eabi toolchain
Description: 
Building of arm-eabi toolchain fails due to missing linker emulation:
>>
/home/fred/buildroot/build_arm_nofpu/staging_dir/arm-linux-uclibcgnueabi/bin/ld:
unrecognised emulation mode: armelf_linux
Supported emulations: armelf_linux_eabi
collect2: ld returned 1 exit status
<<
====================================================================== 

---------------------------------------------------------------------- 
 mikewhit - 12-13-06 02:43  
---------------------------------------------------------------------- 
This is actually a Blocking issue, since cannot use Buildroot without EABI
support. 

---------------------------------------------------------------------- 
 bernhardf - 12-21-06 03:50  
---------------------------------------------------------------------- 
post your
egrep -v "^(#|$)" .config
egrep -v "^(#|$)" uClibc.config
egrep -v "^(#|$)" busybox.config
egrep -v "^(#|$)" kernel.config

So i can try to reproduce it locally. 

---------------------------------------------------------------------- 
 stephaneC - 01-09-07 05:06  
---------------------------------------------------------------------- 
I have the same problem with : 
buildroot rev 17204
ARM920T / EABI / gcc-3.4.6
see below for my .config and uClibc.config

1st error is bug 1131 :
file toolchain_build_arm_nofpu/uClibc/libc/misc/glob/glob.c  line 364 
#if !defined COMPILE_GLOB64
to 
#if defined __UCLIBC_HAS_LFS__ && !defined COMPILE_GLOB64

2nd error :
---
[snip]buildroot/build_arm_nofpu/staging_dir/arm-linux-uclibcgnueabi/bin/ld:
unrecognised emulation mode: armelf_linux
Supported emulations: armelf_linux_eabi armelfb_linux_eabi
collect2: ld returned 1 exit status
make[3]: *** [libgcc/./_udivsi3.oS] Erreur 1
make[3]: quittant le r?pertoire ?
[snip]buildroot/toolchain_build_arm_nofpu/gcc-3.4.6-final/gcc ?
make[2]: *** [libgcc.a] Erreur 2
---
file toolchain_build_arm_nofpu/gcc-3.4.6/gcc/config/arm/linux-elf.h  line
44
#define TARGET_LINKER_EMULATION "armelf_linux"
to
#define TARGET_LINKER_EMULATION "armelf_linux_eabi"

after that all is ok
I hope this can help you

Stephane

-------------- egrep -v "^(#|$)" .config -------------------
BR2_HAVE_DOT_CONFIG=y
BR2_arm=y
BR2_arm920t=y
BR2_ARM_TYPE="ARM920T"
BR2_ARM_EABI=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_WGET="wget --passive-ftp"
BR2_SVN="svn co"
BR2_ZCAT="zcat"
BR2_BZCAT="bzcat"
BR2_TAR_OPTIONS=""
BR2_DL_DIR="$(BASE_DIR)/dl"
BR2_SOURCEFORGE_MIRROR="easynews"
BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
BR2_TOPDIR_PREFIX=""
BR2_TOPDIR_SUFFIX=""
BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
BR2_GNU_TARGET_SUFFIX="linux-uclibcgnueabi"
BR2_JLEVEL=1
BR2_KERNEL_HEADERS_2_6_19_1=y
BR2_DEFAULT_KERNEL_HEADERS="2.6.19.1"
BR2_UCLIBC_VERSION_SNAPSHOT=y
BR2_USE_UCLIBC_SNAPSHOT="snapshot"
BR2_PTHREADS_OLD=y
BR2_BINUTILS_VERSION_2_17_50_0_8=y
BR2_BINUTILS_VERSION="2.17.50.0.8"
BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
BR2_GCC_VERSION_3_4_6=y
BR2_GCC_VERSION="3.4.6"
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
BR2_GCC_SHARED_LIBGCC=y
BR2_ENABLE_MULTILIB=y
BR2_SOFT_FLOAT=y
BR2_TARGET_OPTIMIZATION="-Os -pipe"
BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
BR2_PACKAGE_BUSYBOX=y
BR2_PACKAGE_BUSYBOX_SNAPSHOT=y
BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS=y
BR2_PACKAGE_BUSYBOX_CONFIG="/home/be/Buildroot/config_busybox"
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
BR2_TARGET_ROOTFS_EXT2_INODES=0
BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
BR2_TARGET_ROOTFS_EXT2_SQUASH=y
BR2_TARGET_ROOTFS_EXT2_OUTPUT="$(IMAGE).ext2"
BR2_TARGET_ROOTFS_EXT2_NONE=y
BR2_TARGET_ROOTFS_EXT2_COPYTO=""
-----------------------------------------------------------------------------------------


-------------- egrep -v "^(#|$)" 
./toolchain_build_arm_nofpu/uClibc/.config  ----------------
TARGET_arm=y
TARGET_ARCH="arm"
FORCE_OPTIONS_FOR_ARCH=y
CONFIG_ARM_EABI=y
USE_BX=y
CONFIG_ARM920T=y
ARCH_ANY_ENDIAN=y
ARCH_LITTLE_ENDIAN=y
ARCH_WANTS_LITTLE_ENDIAN=y
ARCH_HAS_MMU=y
ARCH_USE_MMU=y
UCLIBC_HAS_FLOATS=y
UCLIBC_HAS_SOFT_FLOAT=y
DO_C99_MATH=y
KERNEL_HEADERS="/home/be/Buildroot/buildroot_EABI_3.4.6_bug/buildroot/toolchain_build_arm_nofpu/linux/include"
HAVE_DOT_CONFIG=y
DOPIC=y
HAVE_SHARED=y
LDSO_LDD_SUPPORT=y
LDSO_CACHE_SUPPORT=y
LDSO_BASE_FILENAME="ld.so"
UCLIBC_CTOR_DTOR=y
UCLIBC_HAS_THREADS=y
PTHREADS_DEBUG_SUPPORT=y
LINUXTHREADS_OLD=y
MALLOC_STANDARD=y
MALLOC_GLIBC_COMPAT=y
UCLIBC_DYNAMIC_ATEXIT=y
UCLIBC_SUSV3_LEGACY_MACROS=y
UCLIBC_HAS_SHADOW=y
UCLIBC_HAS___PROGNAME=y
ASSUME_DEVPTS=y
UCLIBC_HAS_TM_EXTENSIONS=y
UCLIBC_HAS_TZ_CACHING=y
UCLIBC_HAS_TZ_FILE=y
UCLIBC_HAS_TZ_FILE_READ_MANY=y
UCLIBC_TZ_FILE_PATH="/etc/TZ"
UCLIBC_HAS_IPV6=y
UCLIBC_HAS_RPC=y
UCLIBC_HAS_FULL_RPC=y
UCLIBC_HAS_REENTRANT_RPC=y
UCLIBC_HAS_STRING_GENERIC_OPT=y
UCLIBC_HAS_STRING_ARCH_OPT=y
UCLIBC_HAS_CTYPE_TABLES=y
UCLIBC_HAS_CTYPE_SIGNED=y
UCLIBC_HAS_CTYPE_CHECKED=y
UCLIBC_HAS_WCHAR=y
UCLIBC_HAS_HEXADECIMAL_FLOATS=y
UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
UCLIBC_HAS_SCANF_GLIBC_A_FLAG=y
UCLIBC_HAS_STDIO_BUFSIZ_4096=y
UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
UCLIBC_HAS_STDIO_GETC_MACRO=y
UCLIBC_HAS_STDIO_PUTC_MACRO=y
UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
UCLIBC_HAS_PRINTF_M_SPEC=y
UCLIBC_HAS_ERRNO_MESSAGES=y
UCLIBC_HAS_SIGNUM_MESSAGES=y
UCLIBC_HAS_GNU_GETOPT=y
UCLIBC_HAS_GNU_GETSUBOPT=y
UCLIBC_HAS_REGEX=y
UCLIBC_HAS_REGEX_OLD=y
UCLIBC_HAS_FNMATCH=y
UCLIBC_HAS_FNMATCH_OLD=y
UCLIBC_HAS_FTW=y
UCLIBC_HAS_GLOB=y
UCLIBC_HAS_GNU_GLOB=y
SHARED_LIB_LOADER_PREFIX="/lib"
RUNTIME_PREFIX="/"
DEVEL_PREFIX="/usr/"
UCLIBC_BUILD_RELRO=y
UCLIBC_BUILD_NOW=y
CROSS_COMPILER_PREFIX="/home/be/Buildroot/buildroot_EABI_3.4.6_bug/buildroot/build_arm_nofpu/staging_dir/bin/arm-linux-uclibcgnueabi-"
DOSTRIP=y
WARNINGS="-Wall"
-----------------------------------------------------------------------------------------


---------------------------------------------------------------------- 
 bernhardf - 02-04-07 09:09  
---------------------------------------------------------------------- 
I think this is fixed in current trunk. Please retest. 

---------------------------------------------------------------------- 
 bernhardf - 02-14-07 03:46  
---------------------------------------------------------------------- 
Works with
$ egrep "^BR2_(BINUT|GCC_VER|SOFT)" .config 
BR2_BINUTILS_VERSION_2_17_50_0_10=y
BR2_BINUTILS_VERSION="2.17.50.0.10"
BR2_GCC_VERSION_4_1_2=y
BR2_GCC_VERSION="4.1.2"
BR2_SOFT_FLOAT=y 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-13-06 01:58  mikewhit       New Issue                                    
12-13-06 01:58  mikewhit       Status                   new => assigned     
12-13-06 01:58  mikewhit       Assigned To               => uClibc          
12-13-06 02:43  mikewhit       Note Added: 0001860                          
12-21-06 03:50  bernhardf      Note Added: 0001900                          
01-09-07 05:06  stephaneC      Note Added: 0001974                          
01-09-07 05:07  stephaneC      Issue Monitored: stephaneC                    
02-04-07 09:09  bernhardf      Note Added: 0002106                          
02-04-07 09:09  bernhardf      Status                   assigned => feedback
02-12-07 05:33  vapier         Status                   feedback => assigned
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
02-14-07 03:46  bernhardf      Status                   assigned => closed  
02-14-07 03:46  bernhardf      Note Added: 0002159                          
======================================================================
