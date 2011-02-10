From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 10 Feb 2011 20:15:53 +0100
Subject: [Buildroot] [git commit master 1/1] toolchain/ct-ng: update to
	crosstool-NG 1.10.0
Message-ID: <20110210202906.A13078F43E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bf6660377b9946b82250879b5e10f973f64af68a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the default .config file.
Remove now unnecessary patches.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-crosstool-ng/001-no-cvs.patch  |    2 +-
 .../002-dont-nuke-ct-prefix.patch                  |   37 ------
 .../toolchain-crosstool-ng/003-use-sysroot.patch   |   35 -----
 .../toolchain-crosstool-ng/crosstool-ng.config     |  133 +++++++++++---------
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk   |    2 +-
 5 files changed, 77 insertions(+), 132 deletions(-)
 delete mode 100644 toolchain/toolchain-crosstool-ng/002-dont-nuke-ct-prefix.patch
 delete mode 100644 toolchain/toolchain-crosstool-ng/003-use-sysroot.patch

diff --git a/toolchain/toolchain-crosstool-ng/001-no-cvs.patch b/toolchain/toolchain-crosstool-ng/001-no-cvs.patch
index fd805d3..c82d359 100644
--- a/toolchain/toolchain-crosstool-ng/001-no-cvs.patch
+++ b/toolchain/toolchain-crosstool-ng/001-no-cvs.patch
@@ -8,7 +8,7 @@ under Buildroot, so cvs is not required.
 @@ -359,7 +359,6 @@
               err="'libtool' 1.5.26 or above was not found"
  has_or_abort prog=stat
- has_or_abort prog="aria2c curl wget"
+ has_or_abort prog="curl wget"
 -has_or_abort prog=cvs
  has_or_abort prog=patch
  has_or_abort prog=tar
diff --git a/toolchain/toolchain-crosstool-ng/002-dont-nuke-ct-prefix.patch b/toolchain/toolchain-crosstool-ng/002-dont-nuke-ct-prefix.patch
deleted file mode 100644
index a5405fa..0000000
--- a/toolchain/toolchain-crosstool-ng/002-dont-nuke-ct-prefix.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-ct-ng: don't remove CT_PREFIX_DIR
-
-You might want to install the ct-ng toolchain into an existing directory
-with other files (which is what we're doing in BR for HOST_DIR/usr),
-so don't remove it.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- scripts/crosstool-NG.sh.in |    8 --------
- 1 file changed, 8 deletions(-)
-
-Index: crosstool-ng-1.8.0/scripts/crosstool-NG.sh.in
-===================================================================
---- crosstool-ng-1.8.0.orig/scripts/crosstool-NG.sh.in
-+++ crosstool-ng-1.8.0/scripts/crosstool-NG.sh.in
-@@ -210,11 +210,6 @@ CT_TOOLCHAIN_ID="crosstool-${CT_VERSION}
- 
- CT_DoLog EXTRA "Preparing working directories"
- 
--# Ah! The build directory shall be eradicated, even if we restart!
--if [ -d "${CT_BUILD_DIR}" ]; then
--    CT_DoForceRmdir "${CT_BUILD_DIR}"
--fi
--
- # Don't eradicate directories if we need to restart
- if [ -z "${CT_RESTART}" ]; then
-     # Get rid of pre-existing installed toolchain and previous build directories.
-@@ -226,9 +221,6 @@ if [ -z "${CT_RESTART}" ]; then
-     if [ "${CT_FORCE_EXTRACT}" = "y" -a -d "${CT_SRC_DIR}" ]; then
-         CT_DoForceRmdir "${CT_SRC_DIR}"
-     fi
--    if [ -d "${CT_INSTALL_DIR}" ]; then
--        CT_DoForceRmdir "${CT_INSTALL_DIR}"
--    fi
-     # In case we start anew, get rid of the previously saved state directory
-     if [ -d "${CT_STATE_DIR}" ]; then
-         CT_DoForceRmdir "${CT_STATE_DIR}"
diff --git a/toolchain/toolchain-crosstool-ng/003-use-sysroot.patch b/toolchain/toolchain-crosstool-ng/003-use-sysroot.patch
deleted file mode 100644
index f9b0baf..0000000
--- a/toolchain/toolchain-crosstool-ng/003-use-sysroot.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-ct-ng: use 'sysroot' rather than 'sys-root' for sysroot directory
-
-The sysroot directory name is arbitrary, but 'sysroot' matches the GCC
-documentation.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- scripts/crosstool-NG.sh.in |    6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-Index: crosstool-ng-1.8.0/scripts/crosstool-NG.sh.in
-===================================================================
---- crosstool-ng-1.8.0.orig/scripts/crosstool-NG.sh.in
-+++ crosstool-ng-1.8.0/scripts/crosstool-NG.sh.in
-@@ -274,7 +274,7 @@ esac
- if [ -z "${CT_RESTART}" ]; then
-     # Arrange paths depending on wether we use sys-root or not.
-     if [ "${CT_USE_SYSROOT}" = "y" ]; then
--        CT_SYSROOT_DIR="${CT_PREFIX_DIR}/${CT_TARGET}/${CT_SYSROOT_DIR_PREFIX}/sys-root"
-+        CT_SYSROOT_DIR="${CT_PREFIX_DIR}/${CT_TARGET}/${CT_SYSROOT_DIR_PREFIX}/sysroot"
-         CT_DEBUGROOT_DIR="${CT_PREFIX_DIR}/${CT_TARGET}/${CT_SYSROOT_DIR_PREFIX}/debug-root"
-         CT_HEADERS_DIR="${CT_SYSROOT_DIR}/usr/include"
-         BINUTILS_SYSROOT_ARG="--with-sysroot=${CT_SYSROOT_DIR}"
-@@ -315,9 +315,9 @@ if [ -z "${CT_RESTART}" ]; then
- 
-     if [ "${CT_USE_SYSROOT}" = "y" ]; then
-         # Prevent gcc from installing its libraries outside of the sys-root
--        CT_DoExecLog ALL ln -sf "./${CT_SYSROOT_DIR_PREFIX}/sys-root/lib" "${CT_PREFIX_DIR}/${CT_TARGET}/lib"
-+        CT_DoExecLog ALL ln -sf "./${CT_SYSROOT_DIR_PREFIX}/sysroot/lib" "${CT_PREFIX_DIR}/${CT_TARGET}/lib"
-         # Prevent libc from installing its headers outside of the sysroot
--        CT_DoExecLog ALL ln -sf "./${CT_SYSROOT_DIR_PREFIX}/sys-root/usr/include" "${CT_PREFIX_DIR}/${CT_TARGET}/include"
-+        CT_DoExecLog ALL ln -sf "./${CT_SYSROOT_DIR_PREFIX}/sysroot/usr/include" "${CT_PREFIX_DIR}/${CT_TARGET}/include"
-     fi
- 
-     # Now, in case we're 64 bits, just have lib64/ be a symlink to lib/
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config b/toolchain/toolchain-crosstool-ng/crosstool-ng.config
index 506f78a..5f6aefe 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config
@@ -1,9 +1,10 @@
 #
 # Automatically generated make config: don't edit
-# crosstool-NG version: hg_default at 1943_48e107b35ba9
-# Sat May  8 16:27:31 2010
+# crosstool-NG version: 1.10.0
+# Mon Feb  7 14:03:32 2011
 #
 CT_BACKEND=y
+CT_MODULES=y
 
 #
 # Paths and misc options
@@ -20,11 +21,12 @@ CT_BACKEND=y
 #
 CT_LOCAL_TARBALLS_DIR=""
 CT_SAVE_TARBALLS=y
-CT_WORK_DIR="${CT_TOP_DIR}/targets"
+CT_WORK_DIR="${CT_TOP_DIR}/.build"
 CT_PREFIX_DIR="${HOME}/x-tools/${CT_TARGET}"
 CT_INSTALL_DIR="${CT_PREFIX_DIR}"
 CT_REMOVE_DOCS=y
 # CT_INSTALL_DIR_RO is not set
+# CT_STRIP_ALL_TOOLCHAIN_EXECUTABLES is not set
 
 #
 # Downloading
@@ -33,7 +35,6 @@ CT_REMOVE_DOCS=y
 # CT_FORCE_DOWNLOAD is not set
 # CT_USE_MIRROR is not set
 CT_CONNECT_TIMEOUT=10
-CT_DOWNLOAD_MAX_CHUNKS=5
 # CT_ONLY_DOWNLOAD is not set
 
 #
@@ -77,7 +78,6 @@ CT_LOG_ALL=y
 # CT_LOG_DEBUG is not set
 CT_LOG_LEVEL_MAX="ALL"
 # CT_LOG_SEE_TOOLS_WARN is not set
-# CT_LOG_PROGRESS_BAR is not set
 CT_LOG_TO_FILE=y
 CT_LOG_FILE_COMPRESS=y
 
@@ -103,8 +103,6 @@ CT_ARCH_ARCH=""
 CT_ARCH_CPU=""
 CT_ARCH_TUNE=""
 CT_ARCH_FPU=""
-# CT_ARCH_BE is not set
-# CT_ARCH_LE is not set
 CT_ARCH_32=y
 # CT_ARCH_64 is not set
 CT_ARCH_BITNESS=32
@@ -120,7 +118,6 @@ CT_TARGET_LDFLAGS=""
 # CT_ARCH_arm is not set
 # CT_ARCH_avr32 is not set
 CT_ARCH_blackfin=y
-# CT_ARCH_ia64 is not set
 # CT_ARCH_m68k is not set
 # CT_ARCH_mips is not set
 # CT_ARCH_powerpc is not set
@@ -128,26 +125,14 @@ CT_ARCH_blackfin=y
 # CT_ARCH_sh is not set
 # CT_ARCH_x86 is not set
 CT_ARCH_alpha_AVAILABLE=y
-# CT_ARCH_ALPHA_EV4 is not set
-# CT_ARCH_ALPHA_EV45 is not set
-# CT_ARCH_ALPHA_EV5 is not set
-# CT_ARCH_ALPHA_EV56 is not set
-# CT_ARCH_ALPHA_EV6 is not set
-# CT_ARCH_ALPHA_EV67 is not set
 CT_ARCH_arm_AVAILABLE=y
-# CT_ARCH_ARM_MODE_ARM is not set
-# CT_ARCH_ARM_MODE_THUMB is not set
 CT_ARCH_avr32_AVAILABLE=y
 CT_ARCH_blackfin_AVAILABLE=y
-CT_ARCH_ia64_AVAILABLE=y
 CT_ARCH_m68k_AVAILABLE=y
 CT_ARCH_mips_AVAILABLE=y
 CT_ARCH_powerpc_AVAILABLE=y
 CT_ARCH_s390_AVAILABLE=y
 CT_ARCH_sh_AVAILABLE=y
-# CT_ARCH_SH_SH3 is not set
-# CT_ARCH_SH_SH4 is not set
-# CT_ARCH_SH_SH4A is not set
 CT_ARCH_x86_AVAILABLE=y
 # CT_ARCH_USE_MMU is not set
 
@@ -162,7 +147,9 @@ CT_ARCH_x86_AVAILABLE=y
 #
 # General toolchain options
 #
+CT_FORCE_SYSROOT=y
 CT_USE_SYSROOT=y
+CT_SYSROOT_NAME="sysroot"
 CT_SYSROOT_DIR_PREFIX=""
 
 #
@@ -192,12 +179,32 @@ CT_BUILD_SUFFIX=""
 # Operating System
 #
 CT_BARE_METAL=y
+# CT_MINGW32 is not set
 # CT_KERNEL_SUPPORTS_SHARED_LIBS is not set
 CT_KERNEL="bare-metal"
 CT_KERNEL_bare_metal=y
 # CT_KERNEL_linux is not set
+# CT_KERNEL_mingw32 is not set
 CT_KERNEL_bare_metal_AVAILABLE=y
 CT_KERNEL_linux_AVAILABLE=y
+# CT_KERNEL_LINUX_INSTALL is not set
+# CT_KERNEL_V_2_6_37 is not set
+# CT_KERNEL_V_2_6_36_3 is not set
+# CT_KERNEL_V_2_6_36_2 is not set
+# CT_KERNEL_V_2_6_36_1 is not set
+# CT_KERNEL_V_2_6_36 is not set
+# CT_KERNEL_V_2_6_35_10 is not set
+# CT_KERNEL_V_2_6_34_8 is not set
+# CT_KERNEL_V_2_6_33_7 is not set
+# CT_KERNEL_V_2_6_32_28 is not set
+# CT_KERNEL_V_2_6_31_14 is not set
+# CT_KERNEL_V_2_6_27_57 is not set
+# CT_KERNEL_LINUX_CUSTOM is not set
+# CT_KERNEL_LINUX_VERBOSITY_0 is not set
+# CT_KERNEL_LINUX_VERBOSITY_1 is not set
+# CT_KERNEL_LINUX_VERBOSITY_2 is not set
+# CT_KERNEL_LINUX_USE_CUSTOM_HEADERS is not set
+CT_KERNEL_mingw32_AVAILABLE=y
 
 #
 # Common kernel options
@@ -213,6 +220,8 @@ CT_ARCH_BINFMT_ELF=y
 #
 # GNU binutils
 #
+# CT_BINUTILS_V_2_21 is not set
+# CT_BINUTILS_V_2_20_1 is not set
 CT_BINUTILS_V_2_20=y
 # CT_BINUTILS_V_2_19_1 is not set
 # CT_BINUTILS_V_2_19 is not set
@@ -223,21 +232,21 @@ CT_BINUTILS_VERSION="2.20"
 CT_BINUTILS_EXTRA_CONFIG=""
 
 #
-# sstrip
-#
-# CT_SSTRIP is not set
-
-#
 # C compiler
 #
 CT_CC="gcc"
 CT_CC_VERSION="4.4.3"
 CT_CC_gcc=y
+# CT_CC_V_4_5_2 is not set
+# CT_CC_V_4_5_1 is not set
 # CT_CC_V_4_5_0 is not set
+# CT_CC_V_4_4_5 is not set
+# CT_CC_V_4_4_4 is not set
 CT_CC_V_4_4_3=y
 # CT_CC_V_4_4_2 is not set
 # CT_CC_V_4_4_1 is not set
 # CT_CC_V_4_4_0 is not set
+# CT_CC_V_4_3_5 is not set
 # CT_CC_V_4_3_4 is not set
 # CT_CC_V_4_3_3 is not set
 # CT_CC_V_4_3_2 is not set
@@ -254,13 +263,16 @@ CT_CC_GCC_4_2_or_later=y
 CT_CC_GCC_4_3_or_later=y
 CT_CC_GCC_4_4_or_later=y
 # CT_CC_GCC_4_5_or_later is not set
+CT_CC_GCC_HAS_GRAPHITE=y
+# CT_CC_GCC_HAS_LTO is not set
 CT_CC_GCC_USE_GMP_MPFR=y
-CT_CC_GCC_USE_PPL_CLOOG_MPC=y
+CT_CC_GCC_USE_PPL_CLOOG=y
+# CT_CC_GCC_USE_MPC is not set
 # CT_CC_GCC_USE_LIBELF is not set
-CT_CC_ENABLE_CXX_FLAGS=""
-CT_CC_CORE_EXTRA_CONFIG=""
 CT_CC_PKGVERSION="crosstool-NG-${CT_VERSION}"
 CT_CC_BUGURL=""
+CT_CC_ENABLE_CXX_FLAGS=""
+CT_CC_CORE_EXTRA_CONFIG=""
 CT_CC_SUPPORT_CXX=y
 CT_CC_SUPPORT_FORTRAN=y
 CT_CC_SUPPORT_JAVA=y
@@ -274,39 +286,45 @@ CT_CC_SUPPORT_OBJCXX=y
 # CT_CC_LANG_CXX is not set
 
 #
+# gcc other options
+#
+CT_CC_GCC_ENABLE_TARGET_OPTSPACE=y
+CT_CC_GCC_USE_GRAPHITE=y
+CT_CC_STATIC_LIBSTDCXX=y
+# CT_CC_GCC_LIBMUDFLAP is not set
+# CT_CC_GCC_LIBGOMP is not set
+# CT_CC_GCC_LIBSSP is not set
+
+#
+# Misc. obscure options.
+#
+# CT_CC_GCC_DISABLE_PCH is not set
+CT_CC_GCC_LDBL_128=m
+
+#
 # C-library
 #
-CT_LIBC="newlib"
-CT_LIBC_VERSION="1.17.0"
+CT_LIBC="none"
 # CT_LIBC_eglibc is not set
 # CT_LIBC_glibc is not set
-CT_LIBC_newlib=y
-# CT_LIBC_none is not set
+# CT_LIBC_mingw is not set
+# CT_LIBC_newlib is not set
+CT_LIBC_none=y
 # CT_LIBC_uClibc is not set
 CT_LIBC_eglibc_AVAILABLE=y
 CT_LIBC_glibc_AVAILABLE=y
+CT_LIBC_mingw_AVAILABLE=y
 CT_LIBC_newlib_AVAILABLE=y
-# CT_LIBC_NEWLIB_V_1_18_0 is not set
-CT_LIBC_NEWLIB_V_1_17_0=y
-# CT_LIBC_NEWLIB_CVS is not set
-
-#
-# Architecture specific options
-#
 CT_LIBC_none_AVAILABLE=y
 CT_LIBC_uClibc_AVAILABLE=y
+# CT_LIBC_SUPPORT_THREADS_ANY is not set
 # CT_LIBC_SUPPORT_NPTL is not set
 # CT_LIBC_SUPPORT_LINUXTHREADS is not set
+# CT_LIBC_SUPPORT_WIN32THREADS is not set
+# CT_LIBC_SUPPORT_THREADS_NONE is not set
 CT_THREADS="none"
 
 #
-# Common C library options
-#
-# CT_THREADS_NPTL is not set
-# CT_THREADS_LINUXTHREADS is not set
-CT_THREADS_NONE=y
-
-#
 # Debug facilities
 #
 # CT_DEBUG_gdb is not set
@@ -314,17 +332,19 @@ CT_THREADS_NONE=y
 #
 # Companion libraries
 #
-
-#
-# FIXME: check real dependencies!!!
-#
+CT_COMPLIBS_NEEDED=y
+CT_GMP_NEEDED=y
+CT_MPFR_NEEDED=y
+CT_PPL_NEEDED=y
+CT_CLOOG_NEEDED=y
+# CT_MPC_NEEDED is not set
+# CT_LIBELF_NEEDED is not set
 CT_COMPLIBS=y
 # CT_WRAPPER_NEEDED is not set
 CT_GMP=y
 CT_MPFR=y
 CT_PPL=y
 CT_CLOOG=y
-CT_MPC=y
 # CT_GMP_V_5_0_1 is not set
 CT_GMP_V_4_3_2=y
 # CT_GMP_V_4_3_1 is not set
@@ -332,29 +352,26 @@ CT_GMP_V_4_3_2=y
 # CT_GMP_V_4_2_4 is not set
 # CT_GMP_V_4_2_2 is not set
 CT_GMP_VERSION="4.3.2"
+# CT_MPFR_V_3_0_0 is not set
 CT_MPFR_V_2_4_2=y
 # CT_MPFR_V_2_4_1 is not set
 # CT_MPFR_V_2_4_0 is not set
 # CT_MPFR_V_2_3_2 is not set
 # CT_MPFR_V_2_3_1 is not set
 CT_MPFR_VERSION="2.4.2"
+# CT_PPL_V_0_11 is not set
 CT_PPL_V_0_10_2=y
 CT_PPL_VERSION="0.10.2"
+# CT_CLOOG_V_0_15_10 is not set
 CT_CLOOG_V_0_15_9=y
 # CT_CLOOG_V_0_15_8 is not set
 # CT_CLOOG_V_0_15_7 is not set
 # CT_CLOOG_V_0_15_6 is not set
-# CT_CLOOG_V_0_15_5 is not set
-# CT_CLOOG_V_0_15_4 is not set
-# CT_CLOOG_V_0_15_3 is not set
 CT_CLOOG_VERSION="0.15.9"
-CT_MPC_V_0_8_1=y
-# CT_MPC_V_0_7 is not set
-# CT_MPC_V_0_6 is not set
-CT_MPC_VERSION="0.8.1"
 
 #
 # Companion libraries common options
 #
+CT_COMPLIBS_BACKUP=y
 # CT_COMPLIBS_CHECK is not set
 # CT_COMPLIBS_SHARED is not set
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index ee267df..c838f51 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -14,7 +14,7 @@ uclibc: dependencies $(STAMP_DIR)/ct-ng-toolchain-installed
 # Internal variables
 
 # Crostool-NG hard-coded configuration options
-CTNG_VERSION:=1.8.0
+CTNG_VERSION:=1.10.0
 CTNG_SITE:=http://ymorin.is-a-geek.org/download/crosstool-ng/
 CTNG_SOURCE:=crosstool-ng-$(CTNG_VERSION).tar.bz2
 CTNG_DIR:=$(BUILD_DIR)/crosstool-ng-$(CTNG_VERSION)
-- 
1.7.3.4
