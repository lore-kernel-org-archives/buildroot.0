From: H.Fijnvandraat at inter.nl.net <H.Fijnvandraat@inter.nl.net>
Date: Mon, 22 Apr 2013 12:52:26 +0200 (CEST)
Subject: [Buildroot] iMX6Q prerequisite patches for Qt5
In-Reply-To: <5174D566.7010403@mind.be>
References: <51034.217.149.209.147.1366471569.squirrel@webmail.internl.net> 
 <5174D566.7010403@mind.be>
Message-ID: <13893.194.123.5.106.1366627946.squirrel@webmail.internl.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Op Ma, 22 april, 2013 8:15 am schreef Arnout Vandecappelle:
> Hi Henk,
>
>
> On 20/04/13 17:26, H.Fijnvandraat at inter.nl.net wrote:
>
>> Hi All,
>>
>>
>> I have been successfull in compiling Qt5 for the Freescale iMX6Q
>> processor using the contributions from Thomas Petazzoni.
>>
>> However, the iMX6Q uses a closed source Vivante GPU, which must be
>> handled by some libraries.
>>
>> The attached patches are an attempt to incorporate these into
>> Buildroot.
>>
>
> I had to make changes in Qt5 itself as well to make it work. Didn't you
> need to?
>
>
> I also have the following problem with the gpu-viv-bin-mx6q package.
> It's a binary that is linked to a soft-float glibc library.  I had
> already added
>
> # Library binaries are linked against libc.so.6
> depends on BR2_TOOLCHAIN_CTNG_glibc || \ BR2_TOOLCHAIN_CTNG_eglibc || \
> BR2_TOOLCHAIN_EXTERNAL_GLIBC
>
>
> but that doesn't yet capture the softfloat aspect. The alternative is to
> lock it on to a specific external toolchain version, but I don't like to
> take away so much freedom from the user (plus it's really annoying when
> deprecating old toolchains).
>
>
> Finally, also some comments on the patch submitting process.
>
>
> - Please send patches in-line, with a single patch per e-mail. That makes
>  it easy to make reviews per e-mail. The preferred way of sending patches
>  is to use git send-email.
>
> - Please make separate patches for adding a new package and for updating
> other packages to make use of it. Also make the version bump of imx-lib a
> separate patch.
>
> - Please word-wrap all lines at 80 columns.
>
>
>
> If you are not going to submit updated versions of your patch, please
> let us know so somebody else can take over (we will make sure your
> authorship information is retained).
>
> Regards,
> Arnout

Thanks for your comments on the patch process. Currently I am not familiar
enough with git -after years of svn- to redo the patches in the proper
way.
(I just bought the Git book from O'Reilly book by Loeliger & McCullough)
Besides I copied them to my private email account, because we do not want
to reveal our company name -yet-

So please if somebody else can redo the patches that would be great.

Then, as I indicated, these patches were only prerequisites, which implies
more is needed right?
And yes, closed source GPU stuff is really annoying, especially if it
requires you to build an external toolchain with glib-2.13, for that's
what
Freescales's LTIB used.
But that is exactly what I did: an external crosstool-NG
(I spent 4 weeks trying to do without, but I could not get the stuff to
link properly)
As an aside: the new Qt5-5.0.2-base fails to build on linking errors
(vtable; that is link sequence problems)

To prevent this email from becomming to big I will only inline the
crosstool-NG config I used. I will put the modified Qt5-base.mk in a
seperate email.

By the way, I used the Freescale Linux distro, which revealed a problem
in Buildroot also: If a custom kernel tarball is used -possibly only-
together with crosstool-NG, that kernel does not get a make
linux-configure to fetch the headers needed to build the toolchain.
And as noted: the integration with crosstool-NG is not perfect, so the
external tarball location is not filled in.
So here is my toolchain/toolchain-crosstool-ng/crosstool-ng.config-glib

#
# Automatically generated make config: don't edit
# crosstool-NG 1.17.0 Configuration
# Sat Dec  8 12:56:02 2012
#
CT_CONFIGURE_has_xz=y
CT_CONFIGURE_has_svn=y
CT_MODULES=y

#
# Paths and misc options
#

#
# crosstool-NG behavior
#
# CT_OBSOLETE is not set
# CT_EXPERIMENTAL is not set
# CT_DEBUG_CT is not set

#
# Paths
#
CT_LOCAL_TARBALLS_DIR=""
CT_WORK_DIR="${CT_TOP_DIR}/.build"
CT_PREFIX_DIR=""
CT_INSTALL_DIR="${CT_PREFIX_DIR}"
CT_RM_RF_PREFIX_DIR=y
CT_REMOVE_DOCS=y
# CT_INSTALL_DIR_RO is not set
# CT_STRIP_ALL_TOOLCHAIN_EXECUTABLES is not set

#
# Downloading
#
# CT_FORBID_DOWNLOAD is not set
# CT_FORCE_DOWNLOAD is not set
CT_CONNECT_TIMEOUT=10
# CT_ONLY_DOWNLOAD is not set
# CT_USE_MIRROR is not set

#
# Extracting
#
# CT_FORCE_EXTRACT is not set
CT_OVERIDE_CONFIG_GUESS_SUB=y
# CT_ONLY_EXTRACT is not set
CT_PATCH_BUNDLED=y
# CT_PATCH_LOCAL is not set
# CT_PATCH_BUNDLED_LOCAL is not set
# CT_PATCH_LOCAL_BUNDLED is not set
# CT_PATCH_BUNDLED_FALLBACK_LOCAL is not set
# CT_PATCH_LOCAL_FALLBACK_BUNDLED is not set
# CT_PATCH_NONE is not set
CT_PATCH_ORDER="bundled"

#
# Build behavior
#
CT_PARALLEL_JOBS=0
CT_LOAD=0
CT_USE_PIPES=y
CT_EXTRA_FLAGS_FOR_HOST=""
# CT_CONFIG_SHELL_SH is not set
# CT_CONFIG_SHELL_ASH is not set
CT_CONFIG_SHELL_BASH=y
# CT_CONFIG_SHELL_CUSTOM is not set
CT_CONFIG_SHELL="${bash}"

#
# Logging
#
# CT_LOG_ERROR is not set
# CT_LOG_WARN is not set
# CT_LOG_INFO is not set
# CT_LOG_EXTRA is not set
CT_LOG_ALL=y
# CT_LOG_DEBUG is not set
CT_LOG_LEVEL_MAX="ALL"
# CT_LOG_SEE_TOOLS_WARN is not set
CT_LOG_TO_FILE=y
CT_LOG_FILE_COMPRESS=y

#
# Target options
#
CT_ARCH="arm"
CT_ARCH_SUPPORTS_BOTH_MMU=y
CT_ARCH_SUPPORTS_BOTH_ENDIAN=y
CT_ARCH_SUPPORTS_32=y
CT_ARCH_SUPPORTS_WITH_ARCH=y
CT_ARCH_SUPPORTS_WITH_CPU=y
CT_ARCH_SUPPORTS_WITH_TUNE=y
CT_ARCH_SUPPORTS_WITH_FLOAT=y
CT_ARCH_SUPPORTS_WITH_FPU=y
CT_ARCH_SUPPORTS_SOFTFP=y
CT_ARCH_DEFAULT_HAS_MMU=y
CT_ARCH_DEFAULT_LE=y
CT_ARCH_DEFAULT_32=y
CT_ARCH_ARCH="armv7-a"
CT_ARCH_CPU="cortex-a9"
CT_ARCH_TUNE="cortex-a9"
CT_ARCH_FPU="neon"
# CT_ARCH_BE is not set
CT_ARCH_LE=y
CT_ARCH_32=y
CT_ARCH_BITNESS=32
# CT_ARCH_FLOAT_HW is not set
# CT_ARCH_FLOAT_SW is not set
CT_TARGET_CFLAGS=""
CT_TARGET_LDFLAGS=""
# CT_ARCH_alpha is not set
CT_ARCH_arm=y
# CT_ARCH_avr32 is not set
# CT_ARCH_blackfin is not set
# CT_ARCH_mips is not set
# CT_ARCH_powerpc is not set
# CT_ARCH_sh is not set
# CT_ARCH_sparc is not set
# CT_ARCH_x86 is not set
CT_ARCH_alpha_AVAILABLE=y
CT_ARCH_arm_AVAILABLE=y
CT_ARCH_avr32_AVAILABLE=y
CT_ARCH_blackfin_AVAILABLE=y
CT_ARCH_m68k_AVAILABLE=y
CT_ARCH_microblaze_AVAILABLE=y
CT_ARCH_mips_AVAILABLE=y
CT_ARCH_powerpc_AVAILABLE=y
CT_ARCH_s390_AVAILABLE=y
CT_ARCH_sh_AVAILABLE=y
CT_ARCH_sparc_AVAILABLE=y
CT_ARCH_x86_AVAILABLE=y

#
# Generic target options
#
CT_ARCH_USE_MMU=y
CT_ARCH_ENDIAN="little"

#
# Target optimisations
#
# CT_ARCH_FLOAT_SOFTFP is not set
CT_ARCH_FLOAT="soft"

#
# arm other options
#
CT_ARCH_ARM_MODE="arm"
CT_ARCH_ARM_MODE_ARM=y
CT_ARCH_ARM_EABI=y

#
# Toolchain options
#

#
# General toolchain options
#
CT_FORCE_SYSROOT=y
CT_USE_SYSROOT=y
CT_SYSROOT_NAME="sysroot"
CT_SYSROOT_DIR_PREFIX=""
CT_WANTS_STATIC_LINK=n
CT_TOOLCHAIN_PKGVERSION=""
CT_TOOLCHAIN_BUGURL=""

#
# Tuple completion and aliasing
#
CT_TARGET_VENDOR="unknown"
CT_TARGET_ALIAS_SED_EXPR=""
CT_TARGET_ALIAS=""

#
# Toolchain type
#
CT_CROSS=y
CT_TOOLCHAIN_TYPE="cross"

#
# Build system
#
CT_BUILD=""
CT_BUILD_PREFIX=""
CT_BUILD_SUFFIX=""

#
# Misc options
#
# CT_TOOLCHAIN_ENABLE_NLS is not set

#
# Operating System
#
CT_KERNEL_SUPPORTS_SHARED_LIBS=y
CT_KERNEL="linux"
CT_KERNEL_VERSION="3.0.35"
# CT_KERNEL_bare_metal is not set
CT_KERNEL_linux=y
CT_KERNEL_bare_metal_AVAILABLE=y
CT_KERNEL_linux_AVAILABLE=y
# CT_KERNEL_V_3_6_3 is not set
# CT_KERNEL_V_3_6_2 is not set
# CT_KERNEL_V_3_6_1 is not set
# CT_KERNEL_V_3_6 is not set
# CT_KERNEL_V_3_5_7 is not set
# CT_KERNEL_V_3_4_15 is not set
# CT_KERNEL_V_3_3_8 is not set
# CT_KERNEL_V_3_2_32 is not set
# CT_KERNEL_V_3_1_10 is not set
# CT_KERNEL_V_3_0_48 is not set
# CT_KERNEL_V_2_6_39_4 is not set
# CT_KERNEL_V_2_6_38_8 is not set
# CT_KERNEL_V_2_6_37_6 is not set
# CT_KERNEL_V_2_6_36_4 is not set
# CT_KERNEL_V_2_6_33_20 is not set
# CT_KERNEL_V_2_6_32_60 is not set
# CT_KERNEL_V_2_6_31_14 is not set
# CT_KERNEL_V_2_6_27_62 is not set
CT_KERNEL_LINUX_CUSTOM=y
CT_KERNEL_LINUX_CUSTOM_LOCATION="/home/systembuilder/buildroot/output/build/linux-custom"
CT_KERNEL_mingw32_AVAILABLE=y

#
# Common kernel options
#
CT_SHARED_LIBS=y

#
# linux other options
#
CT_KERNEL_LINUX_VERBOSITY_0=y
# CT_KERNEL_LINUX_VERBOSITY_1 is not set
# CT_KERNEL_LINUX_VERBOSITY_2 is not set
CT_KERNEL_LINUX_VERBOSE_LEVEL=0
CT_KERNEL_LINUX_INSTALL_CHECK=n

#
# Binary utilities
#
CT_ARCH_BINFMT_ELF=y

#
# GNU binutils
#
# CT_BINUTILS_V_2_21_1a is not set
CT_BINUTILS_V_2_20_1a=y
# CT_BINUTILS_V_2_19_1a is not set
# CT_BINUTILS_V_2_18a is not set
CT_BINUTILS_VERSION="2.20.1a"
CT_BINUTILS_2_20_or_later=y
CT_BINUTILS_2_19_or_later=y
CT_BINUTILS_2_18_or_later=y
CT_BINUTILS_HAS_HASH_STYLE=y
CT_BINUTILS_GOLD_SUPPORTS_ARCH=y
CT_BINUTILS_HAS_PKGVERSION_BUGURL=y
CT_BINUTILS_FORCE_LD_BFD=y
CT_BINUTILS_LINKER_LD=y
CT_BINUTILS_LINKERS_LIST="ld"
CT_BINUTILS_LINKER_DEFAULT="bfd"
CT_BINUTILS_EXTRA_CONFIG_ARRAY=""
# CT_BINUTILS_FOR_TARGET is not set

#
# C compiler
#
CT_CC="gcc"
CT_CC_VERSION="4.6.2"
CT_CC_gcc=y
# CT_CC_V_4_7_2 is not set
# CT_CC_V_4_6_3 is not set
CT_CC_V_4_6_2=y
# CT_CC_V_4_6_1 is not set
# CT_CC_V_4_6_0 is not set
# CT_CC_V_4_5_3 is not set
# CT_CC_V_4_5_2 is not set
# CT_CC_V_4_5_1 is not set
# CT_CC_V_4_5_0 is not set
# CT_CC_V_4_4_7 is not set
# CT_CC_V_4_4_6 is not set
# CT_CC_V_4_4_5 is not set
# CT_CC_V_4_4_4 is not set
# CT_CC_V_4_4_3 is not set
# CT_CC_V_4_4_2 is not set
# CT_CC_V_4_4_1 is not set
# CT_CC_V_4_4_0 is not set
# CT_CC_V_4_3_6 is not set
# CT_CC_V_4_3_5 is not set
# CT_CC_V_4_3_4 is not set
# CT_CC_V_4_3_3 is not set
# CT_CC_V_4_3_2 is not set
# CT_CC_V_4_3_1 is not set
# CT_CC_V_4_2_4 is not set
# CT_CC_V_4_2_2 is not set
CT_CC_GCC_4_2_or_later=y
CT_CC_GCC_4_3_or_later=y
CT_CC_GCC_4_4_or_later=y
CT_CC_GCC_4_5_or_later=y
CT_CC_GCC_4_6=y
CT_CC_GCC_4_6_or_later=y
CT_CC_GCC_HAS_GRAPHITE=y
CT_CC_GCC_HAS_LTO=y
CT_CC_GCC_HAS_PKGVERSION_BUGURL=y
CT_CC_GCC_HAS_BUILD_ID=y
CT_CC_GCC_USE_GMP_MPFR=y
CT_CC_GCC_USE_PPL_CLOOG=y
CT_CC_GCC_USE_MPC=y
CT_CC_GCC_HAS_LIBQUADMATH=y
# CT_CC_LANG_FORTRAN is not set
CT_CC_SUPPORT_CXX=y
CT_CC_SUPPORT_FORTRAN=y
CT_CC_SUPPORT_JAVA=y
CT_CC_SUPPORT_ADA=y
CT_CC_SUPPORT_OBJC=y
CT_CC_SUPPORT_OBJCXX=y

#
# Additional supported languages:
#
CT_CC_LANG_CXX=y
# CT_CC_LANG_JAVA is not set

#
# gcc other options
#
CT_CC_ENABLE_CXX_FLAGS=""
CT_CC_CORE_EXTRA_CONFIG_ARRAY="--disable-decimal-float"
CT_CC_EXTRA_CONFIG_ARRAY="--disable-decimal-float"
CT_CC_STATIC_LIBSTDCXX=y

#
# Optimisation features
#
CT_CC_GCC_USE_GRAPHITE=y
CT_CC_GCC_USE_LTO=y

#
# Settings for libraries running on target
#
CT_CC_GCC_ENABLE_TARGET_OPTSPACE=y
# CT_CC_GCC_LIBMUDFLAP is not set
# CT_CC_GCC_LIBGOMP is not set
# CT_CC_GCC_LIBSSP is not set
# CT_CC_GCC_LIBQUADMATH is not set

#
# Misc. obscure options.
#
CT_CC_CXA_ATEXIT=y
# CT_CC_GCC_DISABLE_PCH is not set
CT_CC_GCC_SJLJ_EXCEPTIONS=m
CT_CC_GCC_LDBL_128=m
# CT_CC_GCC_BUILD_ID is not set

#
# C-library
#
CT_LIBC="glibc"
CT_LIBC_VERSION="2.13"
# CT_LIBC_eglibc is not set
# CT_LIBC_uClibc is not set
CT_LIBC_glibc=y
CT_LIBC_mingw_AVAILABLE=y
CT_LIBC_eglibc_AVAILABLE=y
CT_LIBC_newlib_AVAILABLE=y
CT_LIBC_uClibc_AVAILABLE=y
CT_LIBC_none_AVAILABLE=y
CT_LIBC_glibc_AVAILABLE=y
# CT_LIBC_GLIBC_V_2_14_1 is not set
# CT_LIBC_GLIBC_V_2_14 is not set
CT_LIBC_GLIBC_V_2_13=y
# CT_LIBC_GLIBC_V_2_12_2 is not set
# CT_LIBC_GLIBC_V_2_12_1 is not set
# CT_LIBC_GLIBC_V_2_11_1 is not set
# CT_LIBC_GLIBC_V_2_11 is not set
# CT_LIBC_GLIBC_V_2_10_1 is not set
# CT_LIBC_GLIBC_V_2_9 is not set
# CT_LIBC_GLIBC_V_2_8 is not set
CT_LIBC_SUPPORT_THREADS_ANY=y
CT_LIBC_SUPPORT_NPTL=y
CT_THREADS="nptl"

#
# Common C library options
#
CT_THREADS_NPTL=y
CT_LIBC_XLDD=y
CT_LIBC_GLIBC_MAY_FORCE_PORTS=y
CT_LIBC_glibc_familly=y
CT_LIBC_GLIBC_EXTRA_CONFIG_ARRAY=""
CT_LIBC_GLIBC_CONFIGPARMS=""
CT_LIBC_GLIBC_EXTRA_CFLAGS=""
CT_LIBC_EXTRA_CC_ARGS=""
# CT_LIBC_DISABLE_VERSIONING is not set
CT_LIBC_OLDEST_ABI=""
CT_LIBC_GLIBC_FORCE_UNWIND=y
CT_LIBC_GLIBC_USE_PORTS=y
CT_LIBC_ADDONS_LIST=""
# CT_LIBC_LOCALES is not set
# CT_LIBC_GLIBC_KERNEL_VERSION_NONE is not set
CT_LIBC_GLIBC_KERNEL_VERSION_AS_HEADERS=y
# CT_LIBC_GLIBC_KERNEL_VERSION_CHOSEN is not set
CT_LIBC_GLIBC_MIN_KERNEL="custom"

#
# glibc other options
#

#
# WARNING !!!
#

#
#   For glibc >= 2.8, it can happen that the tarballs
#

#
#   for the addons are not available for download.
#

#
#   If that happens, bad luck... Try a previous version
#

#
#   or try again later... :-(
#

#
# Debug facilities
#
# CT_DEBUG_dmalloc is not set
# CT_DEBUG_duma is not set
# CT_DEBUG_gdb is not set
# CT_DEBUG_ltrace is not set
# CT_DEBUG_strace is not set

#
# Companion libraries
#
CT_COMPLIBS_NEEDED=y
CT_GMP_NEEDED=y
CT_MPFR_NEEDED=y
CT_PPL_NEEDED=y
CT_CLOOG_NEEDED=y
CT_MPC_NEEDED=y
CT_COMPLIBS=y
CT_GMP=y
CT_MPFR=y
CT_PPL=y
CT_CLOOG=y
CT_MPC=y
# CT_GMP_V_5_0_2 is not set
# CT_GMP_V_5_0_1 is not set
CT_GMP_V_4_3_2=y
# CT_GMP_V_4_3_1 is not set
# CT_GMP_V_4_3_0 is not set
CT_GMP_VERSION="4.3.2"
CT_MPFR_V_3_1_0=y
# CT_MPFR_V_3_0_1 is not set
# CT_MPFR_V_3_0_0 is not set
# CT_MPFR_V_2_4_2 is not set
# CT_MPFR_V_2_4_1 is not set
# CT_MPFR_V_2_4_0 is not set
CT_MPFR_VERSION="3.1.0"
CT_PPL_V_0_11_2=y
# CT_PPL_V_0_11_1 is not set
# CT_PPL_V_0_11 is not set
# CT_PPL_V_0_10_2 is not set
CT_PPL_VERSION="0.11.2"
CT_PPL_0_11=y
CT_PPL_NEEDS_LIBPWL=y
CT_CLOOG_V_0_15_11=y
# CT_CLOOG_V_0_15_10 is not set
# CT_CLOOG_V_0_15_9 is not set
# CT_CLOOG_V_0_15_8 is not set
# CT_CLOOG_V_0_15_7 is not set
# CT_CLOOG_V_0_15_6 is not set
CT_CLOOG_VERSION="0.15.11"
CT_CLOOG_0_15_1x=y
CT_CLOOG_NEEDS_AUTORECONF=y
CT_MPC_V_0_9=y
# CT_MPC_V_0_8_2 is not set
# CT_MPC_V_0_8_1 is not set
# CT_MPC_V_0_7 is not set
CT_MPC_VERSION="0.9"

#
# Companion libraries common options
#
# CT_COMPLIBS_CHECK is not set
