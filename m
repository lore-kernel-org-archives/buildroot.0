From: Danny Gale <Daniel.Gale@coloradoengineeringinc.com>
Date: Mon, 03 Feb 2014 10:48:36 -0700
Subject: [Buildroot] Error building with external toolchain
In-Reply-To: <20140201094246.20d7dc22@skate>
References: <52EBD7F7.8010504@coloradoengineeringinc.com>
 <20140201094246.20d7dc22@skate>
Message-ID: <52EFD674.7060800@coloradoengineeringinc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, list:

On 02/01/2014 01:42 AM, Thomas Petazzoni wrote:
> Dear Danny Gale,
>
> On Fri, 31 Jan 2014 10:05:59 -0700, Danny Gale wrote:
>
>> I'm having some trouble getting buildroot to import my external
>> toolchain properly. The output is:
>>
>>   >>> toolchain undefined Extracting
>>   >>> toolchain undefined Patching
>>   >>> toolchain-external undefined Extracting
>>   >>> toolchain-external undefined Patching
>>   >>> toolchain-external undefined Configuring
>>   >>> toolchain-external undefined Building
>>   >>> toolchain-external undefined Installing to staging directory
>>   >>> toolchain-external undefined Copying external toolchain libraries
>> to target...
>> make[1]: ***
>> [/home/dgale/Documents/system_build/bld/start.buildroot-2013.11/output/build/toolchain-external-undefined/.stamp_staging_installed]
>> Error 255
>> make[1]: Leaving directory
>> `/home/dgale/Documents/system_build/bld/start.buildroot-2013.11'
>> make: *** [.buildroot] Error 2
> Interesting. Can you show your Buildroot .config file, and give more
> details about what your external toolchain is (or even better, provide
> us this external toolchain so that we can potentially reproduce the
> problem) ?
>
> Hum, the order of your messages look weird: the last message shown is
> "Copying external toolchain libraries to target", but make reports that
> the error occurred while working on the .stamp_staging_installed
> target. Maybe it's just me misinterpreting the output of make, I don't
> know.
>
> Aren't you running with "make -j<something>" by any chance?
I'm running make with a single thread (-j1) to pinpoint this error.

The external toolchain was built on an x86_64 host by Crosstool-NG 
1.19.0 for a powerpc64-e6500 target. I've attached the config file for 
ct-ng.

I was able to go through the buildroot source and follow it through: the 
.stamp_staging_installed target calls $($(PKG)_INSTALL_STAGING_CMDS), 
with PKG=TOOLCHAIN_EXTERNAL. TOOLCHAIN_EXTERNAL_INSTALL_STAGING_COMMANDS 
in ./toolchain/toolchain-external/toolchain-external.mk calls 
TOOLCHAIN_EXTERNAL_INSTALL_CORE in that same file. The message "Copying 
external toolchain libraries to target..." is there, though I don't 
understand why it fails at that point.
>> What is the problem here? Has anybody run into this before? I should
>> mention that the toolchain being imported is 64-bit. This is NOT an
>> issue using an equivalent toolchain at 32-bits. The 64-bit toolchain,
>> however, doesn't support multilib.
It seems I was mistaken -- the 32-bit version of the toolchain doesn't 
seem to import either. A different 32-bit toolchain (for the powerpc 440 
core) does import, however. So there seems to be something wrong with my 
toolchain configuration. I suspect RPC support to be the culprit.
>>
>> What will be required to get buildroot working with the 64-bit toolchain?
> When you're talking about 32 bits or 64 bits, are you talking about the
> bitness for the host architecture, or the target architecture?
The target. The host is an x86_64. The target is a 64-bit powerpc (e6500 
core)


-------------- next part --------------
#
# Automatically generated make config: don't edit
# crosstool-NG 1.19.0 Configuration
# Mon Feb  3 10:36:22 2014
#
CT_CONFIGURE_has_xz=y
CT_CONFIGURE_has_cvs=y
CT_CONFIGURE_has_svn=y
CT_MODULES=y

#
# Paths and misc options
#

#
# crosstool-NG behavior
#
# CT_OBSOLETE is not set
CT_EXPERIMENTAL=y
# CT_ALLOW_BUILD_AS_ROOT is not set
# CT_DEBUG_CT is not set

#
# Paths
#
CT_LOCAL_TARBALLS_DIR="[ARC_DIR]"
CT_SAVE_TARBALLS=y
CT_CUSTOM_LOCATION_ROOT_DIR=""
CT_WORK_DIR="[WORK_DIR]"
CT_PREFIX_DIR="[PREFIX_DIR]"
CT_INSTALL_DIR="${CT_PREFIX_DIR}"
CT_RM_RF_PREFIX_DIR=y
CT_REMOVE_DOCS=y
CT_INSTALL_DIR_RO=y
CT_STRIP_ALL_TOOLCHAIN_EXECUTABLES=y

#
# Downloading
#
# CT_FORBID_DOWNLOAD is not set
# CT_FORCE_DOWNLOAD is not set
CT_CONNECT_TIMEOUT=10
# CT_ONLY_DOWNLOAD is not set
CT_USE_MIRROR=y
# CT_FORCE_MIRROR is not set
CT_MIRROR_BASE_URL="http://ymorin.is-a-geek.org/mirrors/"

#
# Extracting
#
# CT_FORCE_EXTRACT is not set
CT_OVERIDE_CONFIG_GUESS_SUB=y
# CT_ONLY_EXTRACT is not set
# CT_PATCH_BUNDLED is not set
# CT_PATCH_LOCAL is not set
CT_PATCH_BUNDLED_LOCAL=y
# CT_PATCH_LOCAL_BUNDLED is not set
# CT_PATCH_BUNDLED_FALLBACK_LOCAL is not set
# CT_PATCH_LOCAL_FALLBACK_BUNDLED is not set
# CT_PATCH_NONE is not set
CT_PATCH_ORDER="bundled,local"
CT_PATCH_USE_LOCAL=y
CT_LOCAL_PATCH_DIR="/home/dgale/Documents/xcc/src/src/patches/start.1.19.0/"

#
# Build behavior
#
CT_PARALLEL_JOBS=8
CT_LOAD=""
CT_USE_PIPES=y
CT_EXTRA_CFLAGS_FOR_BUILD=""
CT_EXTRA_LDFLAGS_FOR_BUILD=""
CT_EXTRA_CFLAGS_FOR_HOST=""
CT_EXTRA_LDFLAGS_FOR_HOST=""
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
CT_LOG_EXTRA=y
# CT_LOG_ALL is not set
# CT_LOG_DEBUG is not set
CT_LOG_LEVEL_MAX="EXTRA"
# CT_LOG_SEE_TOOLS_WARN is not set
CT_LOG_PROGRESS_BAR=y
CT_LOG_TO_FILE=y
CT_LOG_FILE_COMPRESS=y

#
# Target options
#
CT_ARCH="powerpc"
CT_ARCH_SUPPORTS_32=y
CT_ARCH_SUPPORTS_64=y
CT_ARCH_SUPPORTS_WITH_ABI=y
CT_ARCH_SUPPORTS_WITH_CPU=y
CT_ARCH_SUPPORTS_WITH_TUNE=y
CT_ARCH_SUPPORTS_WITH_FLOAT=y
CT_ARCH_DEFAULT_32=y
CT_ARCH_ABI=""
CT_ARCH_CPU="e6500"
CT_ARCH_TUNE="e6500"
# CT_ARCH_32 is not set
CT_ARCH_64=y
CT_ARCH_BITNESS=64
CT_ARCH_FLOAT_HW=y
# CT_ARCH_FLOAT_SW is not set
CT_TARGET_CFLAGS=""
CT_TARGET_LDFLAGS=""
# CT_ARCH_alpha is not set
# CT_ARCH_arm is not set
# CT_ARCH_avr32 is not set
# CT_ARCH_blackfin is not set
# CT_ARCH_m68k is not set
# CT_ARCH_microblaze is not set
# CT_ARCH_mips is not set
CT_ARCH_powerpc=y
# CT_ARCH_s390 is not set
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
CT_ARCH_SUFFIX="-e6500"

#
# Generic target options
#
# CT_MULTILIB is not set
CT_ARCH_USE_MMU=y

#
# Target optimisations
#
CT_ARCH_FLOAT="hard"

#
# powerpc other options
#
CT_ARCH_powerpc_ABI=""
CT_ARCH_powerpc_ABI_DEFAULT=y
# CT_ARCH_powerpc_ABI_SPE is not set

#
# Toolchain options
#

#
# General toolchain options
#
CT_FORCE_SYSROOT=y
CT_USE_SYSROOT=y
CT_SYSROOT_NAME="sys-root"
CT_SYSROOT_DIR_PREFIX=""
CT_WANTS_STATIC_LINK=y
# CT_STATIC_TOOLCHAIN is not set
CT_TOOLCHAIN_PKGVERSION="[BLD_VERSION]"
CT_TOOLCHAIN_BUGURL=""

#
# Tuple completion and aliasing
#
CT_TARGET_VENDOR=""
CT_TARGET_ALIAS_SED_EXPR=""
CT_TARGET_ALIAS=""

#
# Toolchain type
#
# CT_NATIVE is not set
CT_CROSS=y
# CT_CROSS_NATIVE is not set
# CT_CANADIAN is not set
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
CT_KERNEL_VERSION="3.8.13"
# CT_KERNEL_bare_metal is not set
CT_KERNEL_linux=y
CT_KERNEL_bare_metal_AVAILABLE=y
CT_KERNEL_linux_AVAILABLE=y
# CT_KERNEL_V_3_10 is not set
# CT_KERNEL_V_3_9 is not set
CT_KERNEL_V_3_8=y
# CT_KERNEL_V_3_7 is not set
# CT_KERNEL_V_3_6 is not set
# CT_KERNEL_V_3_5 is not set
# CT_KERNEL_V_3_4 is not set
# CT_KERNEL_V_3_3 is not set
# CT_KERNEL_V_3_2 is not set
# CT_KERNEL_V_3_1 is not set
# CT_KERNEL_V_3_0 is not set
# CT_KERNEL_V_2_6_39 is not set
# CT_KERNEL_V_2_6_38 is not set
# CT_KERNEL_V_2_6_37 is not set
# CT_KERNEL_V_2_6_36 is not set
# CT_KERNEL_V_2_6_33 is not set
# CT_KERNEL_V_2_6_32 is not set
# CT_KERNEL_V_2_6_31 is not set
# CT_KERNEL_V_2_6_27 is not set
# CT_KERNEL_LINUX_CUSTOM is not set
CT_KERNEL_windows_AVAILABLE=y

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
CT_KERNEL_LINUX_INSTALL_CHECK=y

#
# Binary utilities
#
CT_ARCH_BINFMT_ELF=y
CT_BINUTILS="binutils"
CT_BINUTILS_binutils=y

#
# GNU binutils
#
# CT_BINUTILS_V_2_23_1 is not set
# CT_BINUTILS_V_2_22 is not set
# CT_BINUTILS_V_2_21_53 is not set
CT_BINUTILS_V_2_21_1a=y
# CT_BINUTILS_V_2_20_1a is not set
# CT_BINUTILS_V_2_19_1a is not set
# CT_BINUTILS_V_2_18a is not set
# CT_BINUTILS_CUSTOM is not set
CT_BINUTILS_VERSION="2.21.1a"
CT_BINUTILS_2_21_or_later=y
CT_BINUTILS_2_20_or_later=y
CT_BINUTILS_2_19_or_later=y
CT_BINUTILS_2_18_or_later=y
CT_BINUTILS_HAS_HASH_STYLE=y
CT_BINUTILS_HAS_GOLD=y
CT_BINUTILS_HAS_PLUGINS=y
CT_BINUTILS_HAS_PKGVERSION_BUGURL=y
CT_BINUTILS_FORCE_LD_BFD=y
CT_BINUTILS_LINKER_LD=y
CT_BINUTILS_LINKERS_LIST="ld"
CT_BINUTILS_LINKER_DEFAULT="bfd"
# CT_BINUTILS_PLUGINS is not set
CT_BINUTILS_EXTRA_CONFIG_ARRAY=""
CT_BINUTILS_FOR_TARGET=y
CT_BINUTILS_FOR_TARGET_IBERTY=y
CT_BINUTILS_FOR_TARGET_BFD=y

#
# binutils other options
#

#
# C compiler
#
CT_CC="gcc"
CT_CC_VERSION="4.7.2"
CT_CC_CORE_PASSES_NEEDED=y
CT_CC_gcc=y
# CT_CC_GCC_SHOW_LINARO is not set
# CT_CC_V_4_8_1 is not set
# CT_CC_V_4_8_0 is not set
# CT_CC_V_4_7_3 is not set
CT_CC_V_4_7_2=y
# CT_CC_V_4_7_1 is not set
# CT_CC_V_4_7_0 is not set
# CT_CC_V_4_6_4 is not set
# CT_CC_V_4_6_3 is not set
# CT_CC_V_4_6_2 is not set
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
# CT_CC_CUSTOM is not set
CT_CC_GCC_4_2_or_later=y
CT_CC_GCC_4_3_or_later=y
CT_CC_GCC_4_4_or_later=y
CT_CC_GCC_4_5_or_later=y
CT_CC_GCC_4_6_or_later=y
CT_CC_GCC_4_7=y
CT_CC_GCC_4_7_or_later=y
CT_CC_GCC_HAS_GRAPHITE=y
CT_CC_GCC_USE_GRAPHITE=y
CT_CC_GCC_HAS_LTO=y
CT_CC_GCC_USE_LTO=y
CT_CC_GCC_HAS_PKGVERSION_BUGURL=y
CT_CC_GCC_HAS_BUILD_ID=y
CT_CC_GCC_HAS_LNK_HASH_STYLE=y
CT_CC_GCC_USE_GMP_MPFR=y
CT_CC_GCC_USE_MPC=y
CT_CC_GCC_HAS_LIBQUADMATH=y
CT_CC_LANG_FORTRAN=y
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
# CT_CC_LANG_ADA is not set
# CT_CC_LANG_OBJC is not set
# CT_CC_LANG_OBJCXX is not set
CT_CC_LANG_OTHERS=""

#
# gcc other options
#
CT_CC_ENABLE_CXX_FLAGS=""
CT_CC_CORE_EXTRA_CONFIG_ARRAY=""
CT_CC_EXTRA_CONFIG_ARRAY="[BLD_STRING]"
CT_CC_STATIC_LIBSTDCXX=y
CT_CC_GCC_SYSTEM_ZLIB=y

#
# Optimisation features
#

#
# Settings for libraries running on target
#
# CT_CC_GCC_ENABLE_TARGET_OPTSPACE is not set
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
CT_CC_GCC_BUILD_ID=y
CT_CC_GCC_LNK_HASH_STYLE_DEFAULT=y
# CT_CC_GCC_LNK_HASH_STYLE_SYSV is not set
# CT_CC_GCC_LNK_HASH_STYLE_GNU is not set
# CT_CC_GCC_LNK_HASH_STYLE_BOTH is not set
CT_CC_GCC_LNK_HASH_STYLE=""

#
# C-library
#
CT_LIBC="glibc"
CT_LIBC_VERSION="2.17"
# CT_LIBC_eglibc is not set
CT_LIBC_glibc=y
# CT_LIBC_uClibc is not set
CT_LIBC_eglibc_AVAILABLE=y
CT_LIBC_glibc_AVAILABLE=y
CT_LIBC_GLIBC_V_2_17=y
# CT_LIBC_GLIBC_V_2_16_0 is not set
# CT_LIBC_GLIBC_V_2_15 is not set
# CT_LIBC_GLIBC_V_2_14_1 is not set
# CT_LIBC_GLIBC_V_2_14 is not set
# CT_LIBC_GLIBC_V_2_13 is not set
# CT_LIBC_GLIBC_V_2_12_2 is not set
# CT_LIBC_GLIBC_V_2_12_1 is not set
# CT_LIBC_GLIBC_V_2_11_1 is not set
# CT_LIBC_GLIBC_V_2_11 is not set
# CT_LIBC_GLIBC_V_2_10_1 is not set
# CT_LIBC_GLIBC_V_2_9 is not set
# CT_LIBC_GLIBC_V_2_8 is not set
CT_LIBC_mingw_AVAILABLE=y
CT_LIBC_newlib_AVAILABLE=y
CT_LIBC_none_AVAILABLE=y
CT_LIBC_uClibc_AVAILABLE=y
CT_LIBC_SUPPORT_THREADS_ANY=y
CT_LIBC_SUPPORT_NPTL=y
CT_THREADS="nptl"

#
# Common C library options
#
CT_THREADS_NPTL=y
CT_LIBC_XLDD=y
CT_LIBC_glibc_familly=y
CT_LIBC_GLIBC_EXTRA_CONFIG_ARRAY="--with-tls"
CT_LIBC_GLIBC_CONFIGPARMS=""
CT_LIBC_GLIBC_EXTRA_CFLAGS=""
CT_LIBC_EXTRA_CC_ARGS=""
# CT_LIBC_ENABLE_FORTIFIED_BUILD is not set
# CT_LIBC_DISABLE_VERSIONING is not set
CT_LIBC_OLDEST_ABI=""
CT_LIBC_GLIBC_FORCE_UNWIND=y
# CT_LIBC_GLIBC_USE_PORTS is not set
CT_LIBC_ADDONS_LIST=""
# CT_LIBC_LOCALES is not set
# CT_LIBC_GLIBC_KERNEL_VERSION_NONE is not set
CT_LIBC_GLIBC_KERNEL_VERSION_AS_HEADERS=y
# CT_LIBC_GLIBC_KERNEL_VERSION_CHOSEN is not set
CT_LIBC_GLIBC_MIN_KERNEL="3.8.13"

#
# glibc other options
#

#
# Debug facilities
#
# CT_DEBUG_dmalloc is not set
CT_DEBUG_duma=y
# CT_DUMA_A is not set
CT_DUMA_SO=y
CT_DUMA_V_2_5_15=y
CT_DUMA_VERSION="2_5_15"
CT_DEBUG_gdb=y
CT_GDB_CROSS=y
# CT_GDB_CROSS_STATIC is not set
# CT_GDB_CROSS_SIM is not set
CT_GDB_CROSS_PYTHON=y
CT_GDB_CROSS_EXTRA_CONFIG_ARRAY=""
CT_GDB_NATIVE=y
# CT_GDB_NATIVE_STATIC is not set
CT_GDB_GDBSERVER=y
CT_GDB_GDBSERVER_HAS_IPA_LIB=y
# CT_GDB_GDBSERVER_STATIC is not set
# CT_GDB_GDBSERVER_BUILD_IPA_LIB is not set

#
# gdb version
#
# CT_DEBUG_GDB_SHOW_LINARO is not set
CT_GDB_V_7_4_1=y
# CT_GDB_V_7_4 is not set
# CT_GDB_V_7_3_1 is not set
# CT_GDB_V_7_3a is not set
# CT_GDB_V_7_2a is not set
# CT_GDB_V_7_1a is not set
# CT_GDB_V_7_0_1a is not set
# CT_GDB_V_7_0a is not set
# CT_GDB_V_6_8a is not set
# CT_GDB_CUSTOM is not set
CT_GDB_7_2_or_later=y
CT_GDB_7_0_or_later=y
CT_GDB_HAS_PKGVERSION_BUGURL=y
CT_GDB_INSTALL_GDBINIT=y
CT_GDB_VERSION="7.4.1"
CT_DEBUG_ltrace=y
CT_LTRACE_V_0_5_3=y
# CT_LTRACE_V_0_5_2 is not set
CT_LTRACE_VERSION="0.5.3"
CT_LTRACE_0_5_3_or_later=y
CT_DEBUG_strace=y
# CT_STRACE_V_4_6 is not set
# CT_STRACE_V_4_5_20 is not set
CT_STRACE_V_4_5_19=y
# CT_STRACE_V_4_5_18 is not set
CT_STRACE_VERSION="4.5.19"

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
CT_LIBELF_TARGET=y
CT_GMP_V_5_1_1=y
# CT_GMP_V_5_0_2 is not set
# CT_GMP_V_5_0_1 is not set
# CT_GMP_V_4_3_2 is not set
# CT_GMP_V_4_3_1 is not set
# CT_GMP_V_4_3_0 is not set
CT_GMP_VERSION="5.1.1"
CT_MPFR_V_3_1_2=y
# CT_MPFR_V_3_1_0 is not set
# CT_MPFR_V_3_0_1 is not set
# CT_MPFR_V_3_0_0 is not set
# CT_MPFR_V_2_4_2 is not set
# CT_MPFR_V_2_4_1 is not set
# CT_MPFR_V_2_4_0 is not set
CT_MPFR_VERSION="3.1.2"
CT_PPL_V_0_11_2=y
# CT_PPL_V_0_11_1 is not set
# CT_PPL_V_0_11 is not set
# CT_PPL_V_0_10_2 is not set
CT_PPL_VERSION="0.11.2"
CT_PPL_0_11=y
CT_PPL_NEEDS_LIBPWL=y
# CT_CLOOG_V_0_15_11 is not set
# CT_CLOOG_V_0_15_10 is not set
CT_CLOOG_V_0_15_9=y
# CT_CLOOG_V_0_15_8 is not set
# CT_CLOOG_V_0_15_7 is not set
# CT_CLOOG_V_0_15_6 is not set
CT_CLOOG_VERSION="0.15.9"
# CT_MPC_V_1_0_1 is not set
# CT_MPC_V_1_0 is not set
# CT_MPC_V_0_9 is not set
CT_MPC_V_0_8_2=y
# CT_MPC_V_0_8_1 is not set
# CT_MPC_V_0_7 is not set
CT_MPC_VERSION="0.8.2"

#
# libelf version needed to build for target
#
CT_LIBELF_V_0_8_13=y
# CT_LIBELF_V_0_8_12 is not set
CT_LIBELF_VERSION="0.8.13"

#
# Companion libraries common options
#
# CT_COMPLIBS_CHECK is not set

#
# Companion tools
#

#
# READ HELP before you say 'Y' below !!!
#
# CT_COMP_TOOLS is not set

#
# Test suite
#
# CT_TEST_SUITE_GCC is not set
