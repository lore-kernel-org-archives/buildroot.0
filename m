From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue,  1 Nov 2011 11:58:31 +0100
Subject: [Buildroot] [PATCH] toolchain/ct-ng: update to 1.13.0
Message-ID: <1320145111-5171-1-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the version in the package description. Update the default
configuration files for the three different C libraries.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 package/crosstool-ng/crosstool-ng.mk               |    2 +-
 .../crosstool-ng.config-eglibc                     |  105 +++++++++++---------
 .../crosstool-ng.config-glibc                      |   95 ++++++++++--------
 .../crosstool-ng.config-uClibc                     |   89 +++++++++--------
 4 files changed, 162 insertions(+), 129 deletions(-)

diff --git a/package/crosstool-ng/crosstool-ng.mk b/package/crosstool-ng/crosstool-ng.mk
index 84e218e..f676697 100644
--- a/package/crosstool-ng/crosstool-ng.mk
+++ b/package/crosstool-ng/crosstool-ng.mk
@@ -1,4 +1,4 @@
-CROSSTOOL_NG_VERSION           = 1.12.1
+CROSSTOOL_NG_VERSION           = 1.13.0
 CROSSTOOL_NG_SOURCE            = crosstool-ng-$(CROSSTOOL_NG_VERSION).tar.bz2
 CROSSTOOL_NG_SITE              = http://crosstool-ng.org/download/crosstool-ng/
 CROSSTOOL_NG_INSTALL_STAGING   = NO
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
index 66744bc..7426f7e 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
@@ -1,14 +1,11 @@
 #
 # Automatically generated make config: don't edit
-# The crosstool-NG configuration menu
-# Sun Aug  7 15:40:17 2011
+# crosstool-NG 1.13.0 Configuration
+# Sat Oct 29 16:35:00 2011
 #
+CT_CONFIGURE_has_xzutils=y
 CT_CONFIGURE_has_cvs=y
 CT_CONFIGURE_has_svn=y
-CT_CONFIGURE_static_link_ok=y
-CT_CONFIGURE_has_static_libstdcxx=y
-CT_CONFIGURE_has_expat=y
-CT_CONFIGURE_has_static_expat=y
 CT_BACKEND=y
 CT_MODULES=y
 
@@ -25,10 +22,10 @@ CT_MODULES=y
 #
 # Paths
 #
-CT_LOCAL_TARBALLS_DIR=""
+CT_LOCAL_TARBALLS_DIR="/home/ymorin/dev/buildroot/br.wip/dl"
 CT_SAVE_TARBALLS=y
 CT_WORK_DIR="${CT_TOP_DIR}/.build"
-CT_PREFIX_DIR="${HOME}/x-tools/${CT_TARGET}"
+CT_PREFIX_DIR="/home/ymorin/dev/buildroot/O/host/usr"
 CT_INSTALL_DIR="${CT_PREFIX_DIR}"
 CT_REMOVE_DOCS=y
 # CT_INSTALL_DIR_RO is not set
@@ -39,9 +36,9 @@ CT_REMOVE_DOCS=y
 #
 # CT_FORBID_DOWNLOAD is not set
 # CT_FORCE_DOWNLOAD is not set
-# CT_USE_MIRROR is not set
 CT_CONNECT_TIMEOUT=10
 # CT_ONLY_DOWNLOAD is not set
+# CT_USE_MIRROR is not set
 
 #
 # Extracting
@@ -65,11 +62,12 @@ CT_PATCH_ORDER="bundled"
 #
 # Build options hiden
 #
-CT_PARALLEL_JOBS=1
+CT_PARALLEL_JOBS=0
 CT_LOAD=0
 CT_USE_PIPES=y
-CT_CONFIG_SHELL="custom"
+CT_EXTRA_FLAGS_FOR_HOST=""
 CT_CONFIG_SHELL_CUSTOM_PATH="/bin/sh"
+CT_CONFIG_SHELL="/bin/sh"
 
 #
 # Logging
@@ -88,25 +86,31 @@ CT_LOG_FILE_COMPRESS=y
 #
 # Target options
 #
-CT_ARCH="x86"
+CT_ARCH="arm"
+CT_ARCH_SUPPORTS_BOTH_MMU=y
+CT_ARCH_SUPPORTS_BOTH_ENDIAN=y
 CT_ARCH_SUPPORTS_32=y
-CT_ARCH_SUPPORTS_64=y
 CT_ARCH_SUPPORT_ARCH=y
 CT_ARCH_SUPPORT_CPU=y
 CT_ARCH_SUPPORT_TUNE=y
+CT_ARCH_SUPPORT_FPU=y
+CT_ARCH_DEFAULT_HAS_MMU=y
+CT_ARCH_DEFAULT_LE=y
 CT_ARCH_DEFAULT_32=y
 CT_ARCH_ARCH=""
 CT_ARCH_CPU=""
 CT_ARCH_TUNE=""
-# CT_ARCH_32 is not set
-CT_ARCH_64=y
-CT_ARCH_BITNESS=64
-CT_ARCH_FLOAT_HW=y
-# CT_ARCH_FLOAT_SW is not set
+CT_ARCH_FPU=""
+CT_ARCH_BE=y
+# CT_ARCH_LE is not set
+CT_ARCH_32=y
+CT_ARCH_BITNESS=32
+# CT_ARCH_FLOAT_HW is not set
+CT_ARCH_FLOAT_SW=y
 CT_TARGET_CFLAGS=""
 CT_TARGET_LDFLAGS=""
-CT_ARCH_x86=y
-CT_ARCH_x86_AVAILABLE=y
+CT_ARCH_arm=y
+CT_ARCH_arm_AVAILABLE=y
 
 #
 # Generic target options
@@ -118,6 +122,13 @@ CT_ARCH_USE_MMU=y
 #
 
 #
+# arm other options
+#
+CT_ARCH_ARM_MODE="arm"
+CT_ARCH_ARM_MODE_ARM=y
+CT_ARCH_ARM_EABI=y
+
+#
 # Toolchain options
 #
 
@@ -128,8 +139,8 @@ CT_FORCE_SYSROOT=y
 CT_USE_SYSROOT=y
 CT_SYSROOT_NAME="sysroot"
 CT_SYSROOT_DIR_PREFIX=""
-CT_STATIC_TOOLCHAIN_POSSIBLE=y
-CT_TOOLCHAIN_PKGVERSION=""
+CT_WANTS_STATIC_LINK=y
+CT_TOOLCHAIN_PKGVERSION="buildroot 2011.11-git-00322-g9b25853-dirty"
 CT_TOOLCHAIN_BUGURL=""
 
 #
@@ -137,7 +148,7 @@ CT_TOOLCHAIN_BUGURL=""
 #
 CT_TARGET_VENDOR="unknown"
 CT_TARGET_ALIAS_SED_EXPR=""
-CT_TARGET_ALIAS=""
+CT_TARGET_ALIAS="armeb-linux"
 
 #
 # Toolchain type
@@ -157,23 +168,22 @@ CT_BUILD_SUFFIX=""
 #
 CT_KERNEL_SUPPORTS_SHARED_LIBS=y
 CT_KERNEL="linux"
-CT_KERNEL_VERSION="2.6.38.8"
+CT_KERNEL_VERSION="2.6.39.4"
 CT_KERNEL_linux=y
 CT_KERNEL_linux_AVAILABLE=y
-CT_KERNEL_LINUX_INSTALL=y
-# CT_KERNEL_LINUX_USE_CUSTOM_HEADERS is not set
+# CT_KERNEL_V_3_0_4 is not set
+# CT_KERNEL_V_3_0_3 is not set
+# CT_KERNEL_V_3_0_2 is not set
+# CT_KERNEL_V_3_0_1 is not set
 # CT_KERNEL_V_3_0 is not set
-# CT_KERNEL_V_2_6_39_3 is not set
-# CT_KERNEL_V_2_6_39_2 is not set
-# CT_KERNEL_V_2_6_39_1 is not set
-# CT_KERNEL_V_2_6_39 is not set
-CT_KERNEL_V_2_6_38_8=y
+CT_KERNEL_V_2_6_39_4=y
+# CT_KERNEL_V_2_6_38_8 is not set
 # CT_KERNEL_V_2_6_37_6 is not set
 # CT_KERNEL_V_2_6_36_4 is not set
-# CT_KERNEL_V_2_6_35_13 is not set
+# CT_KERNEL_V_2_6_35_14 is not set
 # CT_KERNEL_V_2_6_34_10 is not set
-# CT_KERNEL_V_2_6_33_16 is not set
-# CT_KERNEL_V_2_6_32_43 is not set
+# CT_KERNEL_V_2_6_33_19 is not set
+# CT_KERNEL_V_2_6_32_46 is not set
 # CT_KERNEL_V_2_6_31_14 is not set
 # CT_KERNEL_V_2_6_27_59 is not set
 # CT_KERNEL_LINUX_CUSTOM is not set
@@ -200,12 +210,11 @@ CT_ARCH_BINFMT_ELF=y
 #
 # GNU binutils
 #
-# CT_BINUTILS_V_2_20_1 is not set
-CT_BINUTILS_V_2_20=y
-# CT_BINUTILS_V_2_19_1 is not set
-# CT_BINUTILS_V_2_19 is not set
-# CT_BINUTILS_V_2_18 is not set
-CT_BINUTILS_VERSION="2.20"
+# CT_BINUTILS_V_2_21_1a is not set
+CT_BINUTILS_V_2_20_1a=y
+# CT_BINUTILS_V_2_19_1a is not set
+# CT_BINUTILS_V_2_18a is not set
+CT_BINUTILS_VERSION="2.20.1a"
 CT_BINUTILS_2_20_or_later=y
 CT_BINUTILS_2_19_or_later=y
 CT_BINUTILS_2_18_or_later=y
@@ -257,7 +266,7 @@ CT_CC_SUPPORT_OBJCXX=y
 #
 # Additional supported languages:
 #
-# CT_CC_LANG_CXX is not set
+CT_CC_LANG_CXX=y
 # CT_CC_LANG_JAVA is not set
 
 #
@@ -293,21 +302,23 @@ CT_CC_GCC_LDBL_128=m
 # C-library
 #
 CT_LIBC="eglibc"
-CT_LIBC_VERSION="2_10"
+CT_LIBC_VERSION="2_12"
 CT_LIBC_eglibc=y
 CT_LIBC_eglibc_AVAILABLE=y
-# CT_LIBC_EGLIBC_V_2_12 is not set
+CT_LIBC_EGLIBC_V_2_12=y
 # CT_LIBC_EGLIBC_V_2_11 is not set
-CT_LIBC_EGLIBC_V_2_10=y
+# CT_LIBC_EGLIBC_V_2_10 is not set
 # CT_LIBC_EGLIBC_V_2_9 is not set
 # CT_LIBC_EGLIBC_V_TRUNK is not set
+CT_LIBC_EGLIBC_2_12_or_later=y
+CT_LIBC_EGLIBC_2_11_or_later=y
 CT_LIBC_EGLIBC_2_10_or_later=y
 CT_LIBC_EGLIBC_2_9_or_later=y
 CT_LIBC_EGLIBC_HAS_PKGVERSION_BUGURL=y
 CT_EGLIBC_REVISION="HEAD"
 # CT_EGLIBC_HTTP is not set
 # CT_EGLIBC_CHECKOUT is not set
-# CT_EGLIBC_OPT_SIZE is not set
+CT_EGLIBC_OPT_SIZE=y
 # CT_EGLIBC_CUSTOM_CONFIG is not set
 CT_LIBC_SUPPORT_THREADS_ANY=y
 CT_LIBC_SUPPORT_NPTL=y
@@ -324,6 +335,7 @@ CT_LIBC_XLDD=y
 #
 # eglibc other options
 #
+CT_LIBC_GLIBC_MAY_FORCE_PORTS=y
 CT_LIBC_glibc_familly=y
 CT_LIBC_GLIBC_EXTRA_CONFIG_ARRAY=""
 CT_LIBC_GLIBC_CONFIGPARMS=""
@@ -354,10 +366,11 @@ CT_LIBC_ADDONS_LIST=""
 #
 #   or try again later... :-(                            
 #
+# CT_LIBC_LOCALES is not set
 # CT_LIBC_GLIBC_KERNEL_VERSION_NONE is not set
 CT_LIBC_GLIBC_KERNEL_VERSION_AS_HEADERS=y
 # CT_LIBC_GLIBC_KERNEL_VERSION_CHOSEN is not set
-CT_LIBC_GLIBC_MIN_KERNEL="2.6.38.8"
+CT_LIBC_GLIBC_MIN_KERNEL="2.6.39.4"
 
 #
 # Debug facilities
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
index 9513432..9f15925 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
@@ -1,14 +1,11 @@
 #
 # Automatically generated make config: don't edit
-# The crosstool-NG configuration menu
-# Sun Aug  7 15:49:35 2011
+# crosstool-NG 1.13.0 Configuration
+# Sat Oct 29 16:14:07 2011
 #
+CT_CONFIGURE_has_xzutils=y
 CT_CONFIGURE_has_cvs=y
 CT_CONFIGURE_has_svn=y
-CT_CONFIGURE_static_link_ok=y
-CT_CONFIGURE_has_static_libstdcxx=y
-CT_CONFIGURE_has_expat=y
-CT_CONFIGURE_has_static_expat=y
 CT_BACKEND=y
 CT_MODULES=y
 
@@ -25,10 +22,10 @@ CT_MODULES=y
 #
 # Paths
 #
-CT_LOCAL_TARBALLS_DIR=""
+CT_LOCAL_TARBALLS_DIR="/home/ymorin/dev/buildroot/br.wip/dl"
 CT_SAVE_TARBALLS=y
 CT_WORK_DIR="${CT_TOP_DIR}/.build"
-CT_PREFIX_DIR="${HOME}/x-tools/${CT_TARGET}"
+CT_PREFIX_DIR="/home/ymorin/dev/buildroot/O/host/usr"
 CT_INSTALL_DIR="${CT_PREFIX_DIR}"
 CT_REMOVE_DOCS=y
 # CT_INSTALL_DIR_RO is not set
@@ -39,9 +36,9 @@ CT_REMOVE_DOCS=y
 #
 # CT_FORBID_DOWNLOAD is not set
 # CT_FORCE_DOWNLOAD is not set
-# CT_USE_MIRROR is not set
 CT_CONNECT_TIMEOUT=10
 # CT_ONLY_DOWNLOAD is not set
+# CT_USE_MIRROR is not set
 
 #
 # Extracting
@@ -65,11 +62,12 @@ CT_PATCH_ORDER="bundled"
 #
 # Build options hiden
 #
-CT_PARALLEL_JOBS=1
+CT_PARALLEL_JOBS=0
 CT_LOAD=0
 CT_USE_PIPES=y
-CT_CONFIG_SHELL="custom"
+CT_EXTRA_FLAGS_FOR_HOST=""
 CT_CONFIG_SHELL_CUSTOM_PATH="/bin/sh"
+CT_CONFIG_SHELL="/bin/sh"
 
 #
 # Logging
@@ -88,25 +86,31 @@ CT_LOG_FILE_COMPRESS=y
 #
 # Target options
 #
-CT_ARCH="x86"
+CT_ARCH="arm"
+CT_ARCH_SUPPORTS_BOTH_MMU=y
+CT_ARCH_SUPPORTS_BOTH_ENDIAN=y
 CT_ARCH_SUPPORTS_32=y
-CT_ARCH_SUPPORTS_64=y
 CT_ARCH_SUPPORT_ARCH=y
 CT_ARCH_SUPPORT_CPU=y
 CT_ARCH_SUPPORT_TUNE=y
+CT_ARCH_SUPPORT_FPU=y
+CT_ARCH_DEFAULT_HAS_MMU=y
+CT_ARCH_DEFAULT_LE=y
 CT_ARCH_DEFAULT_32=y
 CT_ARCH_ARCH=""
 CT_ARCH_CPU=""
 CT_ARCH_TUNE=""
-# CT_ARCH_32 is not set
-CT_ARCH_64=y
-CT_ARCH_BITNESS=64
-CT_ARCH_FLOAT_HW=y
-# CT_ARCH_FLOAT_SW is not set
+CT_ARCH_FPU=""
+CT_ARCH_BE=y
+# CT_ARCH_LE is not set
+CT_ARCH_32=y
+CT_ARCH_BITNESS=32
+# CT_ARCH_FLOAT_HW is not set
+CT_ARCH_FLOAT_SW=y
 CT_TARGET_CFLAGS=""
 CT_TARGET_LDFLAGS=""
-CT_ARCH_x86=y
-CT_ARCH_x86_AVAILABLE=y
+CT_ARCH_arm=y
+CT_ARCH_arm_AVAILABLE=y
 
 #
 # Generic target options
@@ -118,6 +122,13 @@ CT_ARCH_USE_MMU=y
 #
 
 #
+# arm other options
+#
+CT_ARCH_ARM_MODE="arm"
+CT_ARCH_ARM_MODE_ARM=y
+CT_ARCH_ARM_EABI=y
+
+#
 # Toolchain options
 #
 
@@ -128,8 +139,8 @@ CT_FORCE_SYSROOT=y
 CT_USE_SYSROOT=y
 CT_SYSROOT_NAME="sysroot"
 CT_SYSROOT_DIR_PREFIX=""
-CT_STATIC_TOOLCHAIN_POSSIBLE=y
-CT_TOOLCHAIN_PKGVERSION=""
+CT_WANTS_STATIC_LINK=y
+CT_TOOLCHAIN_PKGVERSION="buildroot 2011.11-git-00322-g9b25853-dirty"
 CT_TOOLCHAIN_BUGURL=""
 
 #
@@ -137,7 +148,7 @@ CT_TOOLCHAIN_BUGURL=""
 #
 CT_TARGET_VENDOR="unknown"
 CT_TARGET_ALIAS_SED_EXPR=""
-CT_TARGET_ALIAS=""
+CT_TARGET_ALIAS="armeb-linux"
 
 #
 # Toolchain type
@@ -157,23 +168,22 @@ CT_BUILD_SUFFIX=""
 #
 CT_KERNEL_SUPPORTS_SHARED_LIBS=y
 CT_KERNEL="linux"
-CT_KERNEL_VERSION="3.0"
+CT_KERNEL_VERSION="2.6.39.4"
 CT_KERNEL_linux=y
 CT_KERNEL_linux_AVAILABLE=y
-CT_KERNEL_LINUX_INSTALL=y
-# CT_KERNEL_LINUX_USE_CUSTOM_HEADERS is not set
-CT_KERNEL_V_3_0=y
-# CT_KERNEL_V_2_6_39_3 is not set
-# CT_KERNEL_V_2_6_39_2 is not set
-# CT_KERNEL_V_2_6_39_1 is not set
-# CT_KERNEL_V_2_6_39 is not set
+# CT_KERNEL_V_3_0_4 is not set
+# CT_KERNEL_V_3_0_3 is not set
+# CT_KERNEL_V_3_0_2 is not set
+# CT_KERNEL_V_3_0_1 is not set
+# CT_KERNEL_V_3_0 is not set
+CT_KERNEL_V_2_6_39_4=y
 # CT_KERNEL_V_2_6_38_8 is not set
 # CT_KERNEL_V_2_6_37_6 is not set
 # CT_KERNEL_V_2_6_36_4 is not set
-# CT_KERNEL_V_2_6_35_13 is not set
+# CT_KERNEL_V_2_6_35_14 is not set
 # CT_KERNEL_V_2_6_34_10 is not set
-# CT_KERNEL_V_2_6_33_16 is not set
-# CT_KERNEL_V_2_6_32_43 is not set
+# CT_KERNEL_V_2_6_33_19 is not set
+# CT_KERNEL_V_2_6_32_46 is not set
 # CT_KERNEL_V_2_6_31_14 is not set
 # CT_KERNEL_V_2_6_27_59 is not set
 # CT_KERNEL_LINUX_CUSTOM is not set
@@ -200,12 +210,11 @@ CT_ARCH_BINFMT_ELF=y
 #
 # GNU binutils
 #
-# CT_BINUTILS_V_2_20_1 is not set
-CT_BINUTILS_V_2_20=y
-# CT_BINUTILS_V_2_19_1 is not set
-# CT_BINUTILS_V_2_19 is not set
-# CT_BINUTILS_V_2_18 is not set
-CT_BINUTILS_VERSION="2.20"
+# CT_BINUTILS_V_2_21_1a is not set
+CT_BINUTILS_V_2_20_1a=y
+# CT_BINUTILS_V_2_19_1a is not set
+# CT_BINUTILS_V_2_18a is not set
+CT_BINUTILS_VERSION="2.20.1a"
 CT_BINUTILS_2_20_or_later=y
 CT_BINUTILS_2_19_or_later=y
 CT_BINUTILS_2_18_or_later=y
@@ -257,7 +266,7 @@ CT_CC_SUPPORT_OBJCXX=y
 #
 # Additional supported languages:
 #
-# CT_CC_LANG_CXX is not set
+CT_CC_LANG_CXX=y
 # CT_CC_LANG_JAVA is not set
 
 #
@@ -308,6 +317,7 @@ CT_THREADS="nptl"
 #
 CT_THREADS_NPTL=y
 CT_LIBC_XLDD=y
+CT_LIBC_GLIBC_MAY_FORCE_PORTS=y
 CT_LIBC_glibc_familly=y
 CT_LIBC_GLIBC_EXTRA_CONFIG_ARRAY=""
 CT_LIBC_GLIBC_CONFIGPARMS=""
@@ -318,10 +328,11 @@ CT_LIBC_OLDEST_ABI=""
 CT_LIBC_GLIBC_FORCE_UNWIND=y
 CT_LIBC_GLIBC_USE_PORTS=y
 CT_LIBC_ADDONS_LIST=""
+# CT_LIBC_LOCALES is not set
 # CT_LIBC_GLIBC_KERNEL_VERSION_NONE is not set
 CT_LIBC_GLIBC_KERNEL_VERSION_AS_HEADERS=y
 # CT_LIBC_GLIBC_KERNEL_VERSION_CHOSEN is not set
-CT_LIBC_GLIBC_MIN_KERNEL="3.0"
+CT_LIBC_GLIBC_MIN_KERNEL="2.6.39.4"
 
 #
 # glibc other options
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
index 5296923..b2b2b25 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
@@ -1,14 +1,11 @@
 #
 # Automatically generated make config: don't edit
-# The crosstool-NG configuration menu
-# Sun Aug  7 15:06:46 2011
+# crosstool-NG 1.13.0 Configuration
+# Sat Oct 29 17:00:56 2011
 #
+CT_CONFIGURE_has_xzutils=y
 CT_CONFIGURE_has_cvs=y
 CT_CONFIGURE_has_svn=y
-CT_CONFIGURE_static_link_ok=y
-CT_CONFIGURE_has_static_libstdcxx=y
-CT_CONFIGURE_has_expat=y
-CT_CONFIGURE_has_static_expat=y
 CT_BACKEND=y
 CT_MODULES=y
 
@@ -25,10 +22,10 @@ CT_MODULES=y
 #
 # Paths
 #
-CT_LOCAL_TARBALLS_DIR=""
+CT_LOCAL_TARBALLS_DIR="/home/ymorin/dev/buildroot/br.wip/dl"
 CT_SAVE_TARBALLS=y
 CT_WORK_DIR="${CT_TOP_DIR}/.build"
-CT_PREFIX_DIR="${HOME}/x-tools/${CT_TARGET}"
+CT_PREFIX_DIR="/home/ymorin/dev/buildroot/O/host/usr"
 CT_INSTALL_DIR="${CT_PREFIX_DIR}"
 CT_REMOVE_DOCS=y
 # CT_INSTALL_DIR_RO is not set
@@ -39,9 +36,9 @@ CT_REMOVE_DOCS=y
 #
 # CT_FORBID_DOWNLOAD is not set
 # CT_FORCE_DOWNLOAD is not set
-# CT_USE_MIRROR is not set
 CT_CONNECT_TIMEOUT=10
 # CT_ONLY_DOWNLOAD is not set
+# CT_USE_MIRROR is not set
 
 #
 # Extracting
@@ -65,11 +62,12 @@ CT_PATCH_ORDER="bundled"
 #
 # Build options hiden
 #
-CT_PARALLEL_JOBS=1
+CT_PARALLEL_JOBS=0
 CT_LOAD=0
 CT_USE_PIPES=y
-CT_CONFIG_SHELL="custom"
+CT_EXTRA_FLAGS_FOR_HOST=""
 CT_CONFIG_SHELL_CUSTOM_PATH="/bin/sh"
+CT_CONFIG_SHELL="/bin/sh"
 
 #
 # Logging
@@ -88,25 +86,31 @@ CT_LOG_FILE_COMPRESS=y
 #
 # Target options
 #
-CT_ARCH="x86"
+CT_ARCH="arm"
+CT_ARCH_SUPPORTS_BOTH_MMU=y
+CT_ARCH_SUPPORTS_BOTH_ENDIAN=y
 CT_ARCH_SUPPORTS_32=y
-CT_ARCH_SUPPORTS_64=y
 CT_ARCH_SUPPORT_ARCH=y
 CT_ARCH_SUPPORT_CPU=y
 CT_ARCH_SUPPORT_TUNE=y
+CT_ARCH_SUPPORT_FPU=y
+CT_ARCH_DEFAULT_HAS_MMU=y
+CT_ARCH_DEFAULT_LE=y
 CT_ARCH_DEFAULT_32=y
 CT_ARCH_ARCH=""
 CT_ARCH_CPU=""
 CT_ARCH_TUNE=""
-# CT_ARCH_32 is not set
-CT_ARCH_64=y
-CT_ARCH_BITNESS=64
-CT_ARCH_FLOAT_HW=y
-# CT_ARCH_FLOAT_SW is not set
+CT_ARCH_FPU=""
+CT_ARCH_BE=y
+# CT_ARCH_LE is not set
+CT_ARCH_32=y
+CT_ARCH_BITNESS=32
+# CT_ARCH_FLOAT_HW is not set
+CT_ARCH_FLOAT_SW=y
 CT_TARGET_CFLAGS=""
 CT_TARGET_LDFLAGS=""
-CT_ARCH_x86=y
-CT_ARCH_x86_AVAILABLE=y
+CT_ARCH_arm=y
+CT_ARCH_arm_AVAILABLE=y
 
 #
 # Generic target options
@@ -118,6 +122,13 @@ CT_ARCH_USE_MMU=y
 #
 
 #
+# arm other options
+#
+CT_ARCH_ARM_MODE="arm"
+CT_ARCH_ARM_MODE_ARM=y
+CT_ARCH_ARM_EABI=y
+
+#
 # Toolchain options
 #
 
@@ -128,8 +139,8 @@ CT_FORCE_SYSROOT=y
 CT_USE_SYSROOT=y
 CT_SYSROOT_NAME="sysroot"
 CT_SYSROOT_DIR_PREFIX=""
-CT_STATIC_TOOLCHAIN_POSSIBLE=y
-CT_TOOLCHAIN_PKGVERSION=""
+CT_WANTS_STATIC_LINK=y
+CT_TOOLCHAIN_PKGVERSION="buildroot 2011.11-git-00322-g9b25853-dirty"
 CT_TOOLCHAIN_BUGURL=""
 
 #
@@ -137,7 +148,7 @@ CT_TOOLCHAIN_BUGURL=""
 #
 CT_TARGET_VENDOR="unknown"
 CT_TARGET_ALIAS_SED_EXPR=""
-CT_TARGET_ALIAS=""
+CT_TARGET_ALIAS="armeb-linux"
 
 #
 # Toolchain type
@@ -160,20 +171,19 @@ CT_KERNEL="linux"
 CT_KERNEL_VERSION="2.6.38.8"
 CT_KERNEL_linux=y
 CT_KERNEL_linux_AVAILABLE=y
-CT_KERNEL_LINUX_INSTALL=y
-# CT_KERNEL_LINUX_USE_CUSTOM_HEADERS is not set
+# CT_KERNEL_V_3_0_4 is not set
+# CT_KERNEL_V_3_0_3 is not set
+# CT_KERNEL_V_3_0_2 is not set
+# CT_KERNEL_V_3_0_1 is not set
 # CT_KERNEL_V_3_0 is not set
-# CT_KERNEL_V_2_6_39_3 is not set
-# CT_KERNEL_V_2_6_39_2 is not set
-# CT_KERNEL_V_2_6_39_1 is not set
-# CT_KERNEL_V_2_6_39 is not set
+# CT_KERNEL_V_2_6_39_4 is not set
 CT_KERNEL_V_2_6_38_8=y
 # CT_KERNEL_V_2_6_37_6 is not set
 # CT_KERNEL_V_2_6_36_4 is not set
-# CT_KERNEL_V_2_6_35_13 is not set
+# CT_KERNEL_V_2_6_35_14 is not set
 # CT_KERNEL_V_2_6_34_10 is not set
-# CT_KERNEL_V_2_6_33_16 is not set
-# CT_KERNEL_V_2_6_32_43 is not set
+# CT_KERNEL_V_2_6_33_19 is not set
+# CT_KERNEL_V_2_6_32_46 is not set
 # CT_KERNEL_V_2_6_31_14 is not set
 # CT_KERNEL_V_2_6_27_59 is not set
 # CT_KERNEL_LINUX_CUSTOM is not set
@@ -200,12 +210,11 @@ CT_ARCH_BINFMT_ELF=y
 #
 # GNU binutils
 #
-# CT_BINUTILS_V_2_20_1 is not set
-CT_BINUTILS_V_2_20=y
-# CT_BINUTILS_V_2_19_1 is not set
-# CT_BINUTILS_V_2_19 is not set
-# CT_BINUTILS_V_2_18 is not set
-CT_BINUTILS_VERSION="2.20"
+# CT_BINUTILS_V_2_21_1a is not set
+CT_BINUTILS_V_2_20_1a=y
+# CT_BINUTILS_V_2_19_1a is not set
+# CT_BINUTILS_V_2_18a is not set
+CT_BINUTILS_VERSION="2.20.1a"
 CT_BINUTILS_2_20_or_later=y
 CT_BINUTILS_2_19_or_later=y
 CT_BINUTILS_2_18_or_later=y
@@ -256,7 +265,7 @@ CT_CC_SUPPORT_OBJCXX=y
 #
 # Additional supported languages:
 #
-# CT_CC_LANG_CXX is not set
+CT_CC_LANG_CXX=y
 # CT_CC_LANG_JAVA is not set
 
 #
@@ -310,7 +319,7 @@ CT_LIBC_UCLIBC_DEBUG_LEVEL_0=y
 # CT_LIBC_UCLIBC_DEBUG_LEVEL_1 is not set
 # CT_LIBC_UCLIBC_DEBUG_LEVEL_2 is not set
 CT_LIBC_UCLIBC_DEBUG_LEVEL=0
-CT_LIBC_UCLIBC_CONFIG_FILE=""
+CT_LIBC_UCLIBC_CONFIG_FILE="/home/ymorin/dev/buildroot/O/build/build-toolchain/libc.config"
 CT_LIBC_SUPPORT_THREADS_ANY=y
 CT_LIBC_SUPPORT_LINUXTHREADS=y
 CT_LIBC_SUPPORT_THREADS_NONE=y
-- 
1.7.2.5
