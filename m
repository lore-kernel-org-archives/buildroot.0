From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  9 May 2012 01:01:21 +0200
Subject: [Buildroot] [PATCH] package/crosstool-ng: bump version to 1.15.2,
	update config files
Message-ID: <1336518081-2809-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the version of crosstool-Ng used, bump to 1.15.2.
Also, update the bundled config files to match the new version.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 .../crosstool-ng-001-wget-instead-of-curl.patch    |   52 -------------
 package/crosstool-ng/crosstool-ng.mk               |    2 +-
 .../crosstool-ng.config-eglibc                     |   70 ++++++++++++------
 .../crosstool-ng.config-glibc                      |   75 +++++++++++++------
 .../crosstool-ng.config-uClibc                     |   78 +++++++++++++------
 5 files changed, 153 insertions(+), 124 deletions(-)

diff --git a/package/crosstool-ng/crosstool-ng-001-wget-instead-of-curl.patch b/package/crosstool-ng/crosstool-ng-001-wget-instead-of-curl.patch
deleted file mode 100644
index d40f178..0000000
--- a/package/crosstool-ng/crosstool-ng-001-wget-instead-of-curl.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-Use wget instead of curl
-
-While crosstool-NG did support either curl or wget in the past, it now
-only supports curl. Unfortunately, Buildroot uses wget for all its
-downloads, so wget is a hard dependency of Buildroot, while curl
-isn't.
-
-Instead of adding curl as a new Buildroot dependency, or building curl
-for the host, we simply tweak crosstool-NG to use wget instead of
-curl.
-
-The script/functions change has been provided by Yann E. Morin.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: crosstool-ng-1.13.0/configure
-===================================================================
---- crosstool-ng-1.13.0.orig/configure
-+++ crosstool-ng-1.13.0/configure
-@@ -496,7 +496,7 @@
-              ver='\(GNU libtool.*\) (2[[:digit:]]*\.|1\.6[[:digit:]]*\.|1\.5\.[2-9][[:digit:]]+)'   \
-              err="'libtoolize' 1.5.26 or above was not found"
- has_or_abort prog=stat
--has_or_abort prog="curl"
-+has_or_abort prog="wget"
- has_or_abort prog=patch
- has_or_abort prog=tar
- has_or_abort prog=gzip
-Index: crosstool-ng-1.13.0/scripts/functions
-===================================================================
---- crosstool-ng-1.13.0.orig/scripts/functions
-+++ crosstool-ng-1.13.0/scripts/functions
-@@ -456,13 +456,12 @@
-     # Some company networks have firewalls to connect to the internet, but it's
-     # not easy to detect them, so force a global ${CT_CONNECT_TIMEOUT}-second
-     # timeout.
--    # For curl, no good progress indicator is available. So, be silent.
--    if CT_DoExecLog ALL curl --ftp-pasv                                 \
--                             --retry 3                                  \
--                             --connect-timeout ${CT_CONNECT_TIMEOUT}    \
--                             --location --fail --silent                 \
--                             --output "${tmp}"                          \
--                             "${url}"
-+    if CT_DoExecLog ALL wget --passive-ftp --tries=3 -nc    \
-+                             -T ${CT_CONNECT_TIMEOUT}       \
-+                             -O "${tmp}"                    \
-+                              "${url}"
-+
-+
-     then
-         # Success, we got it, good!
-         mv "${tmp}" "${dest}"
diff --git a/package/crosstool-ng/crosstool-ng.mk b/package/crosstool-ng/crosstool-ng.mk
index 217b2f5..3540f70 100644
--- a/package/crosstool-ng/crosstool-ng.mk
+++ b/package/crosstool-ng/crosstool-ng.mk
@@ -1,4 +1,4 @@
-CROSSTOOL_NG_VERSION           = 1.13.4
+CROSSTOOL_NG_VERSION           = 1.15.2
 CROSSTOOL_NG_SOURCE            = crosstool-ng-$(CROSSTOOL_NG_VERSION).tar.bz2
 CROSSTOOL_NG_SITE              = http://crosstool-ng.org/download/crosstool-ng/
 CROSSTOOL_NG_INSTALL_TARGET    = NO
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
index c1ab679..cbad52a 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
@@ -1,9 +1,9 @@
 #
 # Automatically generated make config: don't edit
-# crosstool-NG 1.13.0 Configuration
-# Sat Oct 29 16:35:00 2011
+# crosstool-NG 1.15.0 Configuration
+# Mon May  7 18:54:54 2012
 #
-CT_CONFIGURE_has_xzutils=y
+CT_CONFIGURE_has_xz=y
 CT_CONFIGURE_has_cvs=y
 CT_CONFIGURE_has_svn=y
 CT_BACKEND=y
@@ -25,7 +25,7 @@ CT_MODULES=y
 CT_LOCAL_TARBALLS_DIR=""
 CT_SAVE_TARBALLS=y
 CT_WORK_DIR="${CT_TOP_DIR}/.build"
-CT_PREFIX_DIR="${HOME}/x-tools/${CT_TARGET}"
+CT_PREFIX_DIR=""
 CT_INSTALL_DIR="${CT_PREFIX_DIR}"
 CT_REMOVE_DOCS=y
 # CT_INSTALL_DIR_RO is not set
@@ -90,10 +90,12 @@ CT_ARCH="arm"
 CT_ARCH_SUPPORTS_BOTH_MMU=y
 CT_ARCH_SUPPORTS_BOTH_ENDIAN=y
 CT_ARCH_SUPPORTS_32=y
-CT_ARCH_SUPPORT_ARCH=y
-CT_ARCH_SUPPORT_CPU=y
-CT_ARCH_SUPPORT_TUNE=y
-CT_ARCH_SUPPORT_FPU=y
+CT_ARCH_SUPPORTS_WITH_ARCH=y
+CT_ARCH_SUPPORTS_WITH_CPU=y
+CT_ARCH_SUPPORTS_WITH_TUNE=y
+CT_ARCH_SUPPORTS_WITH_FLOAT=y
+CT_ARCH_SUPPORTS_WITH_FPU=y
+CT_ARCH_SUPPORTS_SOFTFP=y
 CT_ARCH_DEFAULT_HAS_MMU=y
 CT_ARCH_DEFAULT_LE=y
 CT_ARCH_DEFAULT_32=y
@@ -101,8 +103,8 @@ CT_ARCH_ARCH=""
 CT_ARCH_CPU=""
 CT_ARCH_TUNE=""
 CT_ARCH_FPU=""
-CT_ARCH_BE=y
-# CT_ARCH_LE is not set
+# CT_ARCH_BE is not set
+CT_ARCH_LE=y
 CT_ARCH_32=y
 CT_ARCH_BITNESS=32
 # CT_ARCH_FLOAT_HW is not set
@@ -116,10 +118,13 @@ CT_ARCH_arm_AVAILABLE=y
 # Generic target options
 #
 CT_ARCH_USE_MMU=y
+CT_ARCH_ENDIAN="little"
 
 #
 # Target optimisations
 #
+# CT_ARCH_FLOAT_SOFTFP is not set
+CT_ARCH_FLOAT="soft"
 
 #
 # arm other options
@@ -148,7 +153,7 @@ CT_TOOLCHAIN_BUGURL=""
 #
 CT_TARGET_VENDOR="unknown"
 CT_TARGET_ALIAS_SED_EXPR=""
-CT_TARGET_ALIAS="armeb-linux"
+CT_TARGET_ALIAS=""
 
 #
 # Toolchain type
@@ -164,28 +169,34 @@ CT_BUILD_PREFIX=""
 CT_BUILD_SUFFIX=""
 
 #
+# Misc options
+#
+# CT_TOOLCHAIN_ENABLE_NLS is not set
+
+#
 # Operating System
 #
 CT_KERNEL_SUPPORTS_SHARED_LIBS=y
 CT_KERNEL="linux"
-CT_KERNEL_VERSION="3.0.4"
+CT_KERNEL_VERSION="3.3.4"
 CT_KERNEL_linux=y
 CT_KERNEL_linux_AVAILABLE=y
-CT_KERNEL_V_3_0_4=y
-# CT_KERNEL_V_3_0_3 is not set
-# CT_KERNEL_V_3_0_2 is not set
-# CT_KERNEL_V_3_0_1 is not set
-# CT_KERNEL_V_3_0 is not set
+CT_KERNEL_V_3_3_4=y
+# CT_KERNEL_V_3_3_3 is not set
+# CT_KERNEL_V_3_3_2 is not set
+# CT_KERNEL_V_3_3_1 is not set
+# CT_KERNEL_V_3_3 is not set
+# CT_KERNEL_V_3_2_16 is not set
+# CT_KERNEL_V_3_1_10 is not set
+# CT_KERNEL_V_3_0_30 is not set
 # CT_KERNEL_V_2_6_39_4 is not set
 # CT_KERNEL_V_2_6_38_8 is not set
 # CT_KERNEL_V_2_6_37_6 is not set
 # CT_KERNEL_V_2_6_36_4 is not set
-# CT_KERNEL_V_2_6_35_14 is not set
-# CT_KERNEL_V_2_6_34_10 is not set
-# CT_KERNEL_V_2_6_33_19 is not set
-# CT_KERNEL_V_2_6_32_46 is not set
+# CT_KERNEL_V_2_6_33_20 is not set
+# CT_KERNEL_V_2_6_32_59 is not set
 # CT_KERNEL_V_2_6_31_14 is not set
-# CT_KERNEL_V_2_6_27_59 is not set
+# CT_KERNEL_V_2_6_27_62 is not set
 # CT_KERNEL_LINUX_CUSTOM is not set
 
 #
@@ -218,6 +229,7 @@ CT_BINUTILS_VERSION="2.20.1a"
 CT_BINUTILS_2_20_or_later=y
 CT_BINUTILS_2_19_or_later=y
 CT_BINUTILS_2_18_or_later=y
+CT_BINUTILS_HAS_HASH_STYLE=y
 CT_BINUTILS_GOLD_SUPPORTS_ARCH=y
 CT_BINUTILS_HAS_PKGVERSION_BUGURL=y
 CT_BINUTILS_FORCE_LD_BFD=y
@@ -232,6 +244,15 @@ CT_BINUTILS_EXTRA_CONFIG_ARRAY=""
 CT_CC="gcc"
 CT_CC_VERSION="4.4.6"
 CT_CC_gcc=y
+# CT_CC_V_4_6_3 is not set
+# CT_CC_V_4_6_2 is not set
+# CT_CC_V_4_6_1 is not set
+# CT_CC_V_4_6_0 is not set
+# CT_CC_V_4_5_3 is not set
+# CT_CC_V_4_5_2 is not set
+# CT_CC_V_4_5_1 is not set
+# CT_CC_V_4_5_0 is not set
+# CT_CC_V_4_4_7 is not set
 CT_CC_V_4_4_6=y
 # CT_CC_V_4_4_5 is not set
 # CT_CC_V_4_4_4 is not set
@@ -305,6 +326,9 @@ CT_LIBC="eglibc"
 CT_LIBC_VERSION="2_12"
 CT_LIBC_eglibc=y
 CT_LIBC_eglibc_AVAILABLE=y
+# CT_LIBC_EGLIBC_V_2_15 is not set
+# CT_LIBC_EGLIBC_V_2_14 is not set
+# CT_LIBC_EGLIBC_V_2_13 is not set
 CT_LIBC_EGLIBC_V_2_12=y
 # CT_LIBC_EGLIBC_V_2_11 is not set
 # CT_LIBC_EGLIBC_V_2_10 is not set
@@ -370,7 +394,7 @@ CT_LIBC_ADDONS_LIST=""
 # CT_LIBC_GLIBC_KERNEL_VERSION_NONE is not set
 CT_LIBC_GLIBC_KERNEL_VERSION_AS_HEADERS=y
 # CT_LIBC_GLIBC_KERNEL_VERSION_CHOSEN is not set
-CT_LIBC_GLIBC_MIN_KERNEL="2.6.39.4"
+CT_LIBC_GLIBC_MIN_KERNEL="3.3.4"
 
 #
 # Debug facilities
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
index 4a555c7..e57a91d 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
@@ -1,9 +1,9 @@
 #
 # Automatically generated make config: don't edit
-# crosstool-NG 1.13.0 Configuration
-# Sat Oct 29 16:14:07 2011
+# crosstool-NG 1.15.0 Configuration
+# Mon May  7 18:58:51 2012
 #
-CT_CONFIGURE_has_xzutils=y
+CT_CONFIGURE_has_xz=y
 CT_CONFIGURE_has_cvs=y
 CT_CONFIGURE_has_svn=y
 CT_BACKEND=y
@@ -25,7 +25,7 @@ CT_MODULES=y
 CT_LOCAL_TARBALLS_DIR=""
 CT_SAVE_TARBALLS=y
 CT_WORK_DIR="${CT_TOP_DIR}/.build"
-CT_PREFIX_DIR="${HOME}/x-tools/${CT_TARGET}"
+CT_PREFIX_DIR=""
 CT_INSTALL_DIR="${CT_PREFIX_DIR}"
 CT_REMOVE_DOCS=y
 # CT_INSTALL_DIR_RO is not set
@@ -90,10 +90,12 @@ CT_ARCH="arm"
 CT_ARCH_SUPPORTS_BOTH_MMU=y
 CT_ARCH_SUPPORTS_BOTH_ENDIAN=y
 CT_ARCH_SUPPORTS_32=y
-CT_ARCH_SUPPORT_ARCH=y
-CT_ARCH_SUPPORT_CPU=y
-CT_ARCH_SUPPORT_TUNE=y
-CT_ARCH_SUPPORT_FPU=y
+CT_ARCH_SUPPORTS_WITH_ARCH=y
+CT_ARCH_SUPPORTS_WITH_CPU=y
+CT_ARCH_SUPPORTS_WITH_TUNE=y
+CT_ARCH_SUPPORTS_WITH_FLOAT=y
+CT_ARCH_SUPPORTS_WITH_FPU=y
+CT_ARCH_SUPPORTS_SOFTFP=y
 CT_ARCH_DEFAULT_HAS_MMU=y
 CT_ARCH_DEFAULT_LE=y
 CT_ARCH_DEFAULT_32=y
@@ -101,8 +103,8 @@ CT_ARCH_ARCH=""
 CT_ARCH_CPU=""
 CT_ARCH_TUNE=""
 CT_ARCH_FPU=""
-CT_ARCH_BE=y
-# CT_ARCH_LE is not set
+# CT_ARCH_BE is not set
+CT_ARCH_LE=y
 CT_ARCH_32=y
 CT_ARCH_BITNESS=32
 # CT_ARCH_FLOAT_HW is not set
@@ -116,10 +118,13 @@ CT_ARCH_arm_AVAILABLE=y
 # Generic target options
 #
 CT_ARCH_USE_MMU=y
+CT_ARCH_ENDIAN="little"
 
 #
 # Target optimisations
 #
+# CT_ARCH_FLOAT_SOFTFP is not set
+CT_ARCH_FLOAT="soft"
 
 #
 # arm other options
@@ -148,7 +153,7 @@ CT_TOOLCHAIN_BUGURL=""
 #
 CT_TARGET_VENDOR="unknown"
 CT_TARGET_ALIAS_SED_EXPR=""
-CT_TARGET_ALIAS="armeb-linux"
+CT_TARGET_ALIAS=""
 
 #
 # Toolchain type
@@ -164,28 +169,34 @@ CT_BUILD_PREFIX=""
 CT_BUILD_SUFFIX=""
 
 #
+# Misc options
+#
+# CT_TOOLCHAIN_ENABLE_NLS is not set
+
+#
 # Operating System
 #
 CT_KERNEL_SUPPORTS_SHARED_LIBS=y
 CT_KERNEL="linux"
-CT_KERNEL_VERSION="3.0.4"
+CT_KERNEL_VERSION="3.3.4"
 CT_KERNEL_linux=y
 CT_KERNEL_linux_AVAILABLE=y
-CT_KERNEL_V_3_0_4=y
-# CT_KERNEL_V_3_0_3 is not set
-# CT_KERNEL_V_3_0_2 is not set
-# CT_KERNEL_V_3_0_1 is not set
-# CT_KERNEL_V_3_0 is not set
+CT_KERNEL_V_3_3_4=y
+# CT_KERNEL_V_3_3_3 is not set
+# CT_KERNEL_V_3_3_2 is not set
+# CT_KERNEL_V_3_3_1 is not set
+# CT_KERNEL_V_3_3 is not set
+# CT_KERNEL_V_3_2_16 is not set
+# CT_KERNEL_V_3_1_10 is not set
+# CT_KERNEL_V_3_0_30 is not set
 # CT_KERNEL_V_2_6_39_4 is not set
 # CT_KERNEL_V_2_6_38_8 is not set
 # CT_KERNEL_V_2_6_37_6 is not set
 # CT_KERNEL_V_2_6_36_4 is not set
-# CT_KERNEL_V_2_6_35_14 is not set
-# CT_KERNEL_V_2_6_34_10 is not set
-# CT_KERNEL_V_2_6_33_19 is not set
-# CT_KERNEL_V_2_6_32_46 is not set
+# CT_KERNEL_V_2_6_33_20 is not set
+# CT_KERNEL_V_2_6_32_59 is not set
 # CT_KERNEL_V_2_6_31_14 is not set
-# CT_KERNEL_V_2_6_27_59 is not set
+# CT_KERNEL_V_2_6_27_62 is not set
 # CT_KERNEL_LINUX_CUSTOM is not set
 
 #
@@ -218,6 +229,7 @@ CT_BINUTILS_VERSION="2.20.1a"
 CT_BINUTILS_2_20_or_later=y
 CT_BINUTILS_2_19_or_later=y
 CT_BINUTILS_2_18_or_later=y
+CT_BINUTILS_HAS_HASH_STYLE=y
 CT_BINUTILS_GOLD_SUPPORTS_ARCH=y
 CT_BINUTILS_HAS_PKGVERSION_BUGURL=y
 CT_BINUTILS_FORCE_LD_BFD=y
@@ -232,6 +244,15 @@ CT_BINUTILS_EXTRA_CONFIG_ARRAY=""
 CT_CC="gcc"
 CT_CC_VERSION="4.4.6"
 CT_CC_gcc=y
+# CT_CC_V_4_6_3 is not set
+# CT_CC_V_4_6_2 is not set
+# CT_CC_V_4_6_1 is not set
+# CT_CC_V_4_6_0 is not set
+# CT_CC_V_4_5_3 is not set
+# CT_CC_V_4_5_2 is not set
+# CT_CC_V_4_5_1 is not set
+# CT_CC_V_4_5_0 is not set
+# CT_CC_V_4_4_7 is not set
 CT_CC_V_4_4_6=y
 # CT_CC_V_4_4_5 is not set
 # CT_CC_V_4_4_4 is not set
@@ -306,6 +327,14 @@ CT_LIBC_VERSION="2.9"
 CT_LIBC_glibc=y
 CT_LIBC_glibc_AVAILABLE=y
 CT_LIBC_GLIBC_TARBALL=y
+# CT_LIBC_GLIBC_V_2_14_1 is not set
+# CT_LIBC_GLIBC_V_2_14 is not set
+# CT_LIBC_GLIBC_V_2_13 is not set
+# CT_LIBC_GLIBC_V_2_12_2 is not set
+# CT_LIBC_GLIBC_V_2_12_1 is not set
+# CT_LIBC_GLIBC_V_2_11_1 is not set
+# CT_LIBC_GLIBC_V_2_11 is not set
+# CT_LIBC_GLIBC_V_2_10_1 is not set
 CT_LIBC_GLIBC_V_2_9=y
 # CT_LIBC_GLIBC_V_2_8 is not set
 CT_LIBC_SUPPORT_THREADS_ANY=y
@@ -332,7 +361,7 @@ CT_LIBC_ADDONS_LIST=""
 # CT_LIBC_GLIBC_KERNEL_VERSION_NONE is not set
 CT_LIBC_GLIBC_KERNEL_VERSION_AS_HEADERS=y
 # CT_LIBC_GLIBC_KERNEL_VERSION_CHOSEN is not set
-CT_LIBC_GLIBC_MIN_KERNEL="2.6.39.4"
+CT_LIBC_GLIBC_MIN_KERNEL="3.3.4"
 
 #
 # glibc other options
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
index 0e442f0..13b30d9 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
@@ -1,9 +1,9 @@
 #
 # Automatically generated make config: don't edit
-# crosstool-NG 1.13.0 Configuration
-# Sat Oct 29 17:00:56 2011
+# crosstool-NG 1.15.0 Configuration
+# Mon May  7 18:49:59 2012
 #
-CT_CONFIGURE_has_xzutils=y
+CT_CONFIGURE_has_xz=y
 CT_CONFIGURE_has_cvs=y
 CT_CONFIGURE_has_svn=y
 CT_BACKEND=y
@@ -25,7 +25,7 @@ CT_MODULES=y
 CT_LOCAL_TARBALLS_DIR=""
 CT_SAVE_TARBALLS=y
 CT_WORK_DIR="${CT_TOP_DIR}/.build"
-CT_PREFIX_DIR="${HOME}/x-tools/${CT_TARGET}"
+CT_PREFIX_DIR=""
 CT_INSTALL_DIR="${CT_PREFIX_DIR}"
 CT_REMOVE_DOCS=y
 # CT_INSTALL_DIR_RO is not set
@@ -90,10 +90,12 @@ CT_ARCH="arm"
 CT_ARCH_SUPPORTS_BOTH_MMU=y
 CT_ARCH_SUPPORTS_BOTH_ENDIAN=y
 CT_ARCH_SUPPORTS_32=y
-CT_ARCH_SUPPORT_ARCH=y
-CT_ARCH_SUPPORT_CPU=y
-CT_ARCH_SUPPORT_TUNE=y
-CT_ARCH_SUPPORT_FPU=y
+CT_ARCH_SUPPORTS_WITH_ARCH=y
+CT_ARCH_SUPPORTS_WITH_CPU=y
+CT_ARCH_SUPPORTS_WITH_TUNE=y
+CT_ARCH_SUPPORTS_WITH_FLOAT=y
+CT_ARCH_SUPPORTS_WITH_FPU=y
+CT_ARCH_SUPPORTS_SOFTFP=y
 CT_ARCH_DEFAULT_HAS_MMU=y
 CT_ARCH_DEFAULT_LE=y
 CT_ARCH_DEFAULT_32=y
@@ -101,8 +103,8 @@ CT_ARCH_ARCH=""
 CT_ARCH_CPU=""
 CT_ARCH_TUNE=""
 CT_ARCH_FPU=""
-CT_ARCH_BE=y
-# CT_ARCH_LE is not set
+# CT_ARCH_BE is not set
+CT_ARCH_LE=y
 CT_ARCH_32=y
 CT_ARCH_BITNESS=32
 # CT_ARCH_FLOAT_HW is not set
@@ -116,10 +118,13 @@ CT_ARCH_arm_AVAILABLE=y
 # Generic target options
 #
 CT_ARCH_USE_MMU=y
+CT_ARCH_ENDIAN="little"
 
 #
 # Target optimisations
 #
+# CT_ARCH_FLOAT_SOFTFP is not set
+CT_ARCH_FLOAT="soft"
 
 #
 # arm other options
@@ -148,7 +153,7 @@ CT_TOOLCHAIN_BUGURL=""
 #
 CT_TARGET_VENDOR="unknown"
 CT_TARGET_ALIAS_SED_EXPR=""
-CT_TARGET_ALIAS="armeb-linux"
+CT_TARGET_ALIAS=""
 
 #
 # Toolchain type
@@ -164,28 +169,34 @@ CT_BUILD_PREFIX=""
 CT_BUILD_SUFFIX=""
 
 #
+# Misc options
+#
+# CT_TOOLCHAIN_ENABLE_NLS is not set
+
+#
 # Operating System
 #
 CT_KERNEL_SUPPORTS_SHARED_LIBS=y
 CT_KERNEL="linux"
-CT_KERNEL_VERSION="3.0.4"
+CT_KERNEL_VERSION="3.3.4"
 CT_KERNEL_linux=y
 CT_KERNEL_linux_AVAILABLE=y
-CT_KERNEL_V_3_0_4=y
-# CT_KERNEL_V_3_0_3 is not set
-# CT_KERNEL_V_3_0_2 is not set
-# CT_KERNEL_V_3_0_1 is not set
-# CT_KERNEL_V_3_0 is not set
+CT_KERNEL_V_3_3_4=y
+# CT_KERNEL_V_3_3_3 is not set
+# CT_KERNEL_V_3_3_2 is not set
+# CT_KERNEL_V_3_3_1 is not set
+# CT_KERNEL_V_3_3 is not set
+# CT_KERNEL_V_3_2_16 is not set
+# CT_KERNEL_V_3_1_10 is not set
+# CT_KERNEL_V_3_0_30 is not set
 # CT_KERNEL_V_2_6_39_4 is not set
 # CT_KERNEL_V_2_6_38_8 is not set
 # CT_KERNEL_V_2_6_37_6 is not set
 # CT_KERNEL_V_2_6_36_4 is not set
-# CT_KERNEL_V_2_6_35_14 is not set
-# CT_KERNEL_V_2_6_34_10 is not set
-# CT_KERNEL_V_2_6_33_19 is not set
-# CT_KERNEL_V_2_6_32_46 is not set
+# CT_KERNEL_V_2_6_33_20 is not set
+# CT_KERNEL_V_2_6_32_59 is not set
 # CT_KERNEL_V_2_6_31_14 is not set
-# CT_KERNEL_V_2_6_27_59 is not set
+# CT_KERNEL_V_2_6_27_62 is not set
 # CT_KERNEL_LINUX_CUSTOM is not set
 
 #
@@ -218,6 +229,7 @@ CT_BINUTILS_VERSION="2.20.1a"
 CT_BINUTILS_2_20_or_later=y
 CT_BINUTILS_2_19_or_later=y
 CT_BINUTILS_2_18_or_later=y
+CT_BINUTILS_HAS_HASH_STYLE=y
 CT_BINUTILS_GOLD_SUPPORTS_ARCH=y
 CT_BINUTILS_HAS_PKGVERSION_BUGURL=y
 CT_BINUTILS_LINKER_LD=y
@@ -231,10 +243,19 @@ CT_BINUTILS_EXTRA_CONFIG_ARRAY=""
 CT_CC="gcc"
 CT_CC_VERSION="4.4.6"
 CT_CC_gcc=y
+# CT_CC_V_4_6_3 is not set
+# CT_CC_V_4_6_2 is not set
+# CT_CC_V_4_6_1 is not set
+# CT_CC_V_4_6_0 is not set
+# CT_CC_V_4_5_3 is not set
+# CT_CC_V_4_5_2 is not set
+# CT_CC_V_4_5_1 is not set
+# CT_CC_V_4_5_0 is not set
+# CT_CC_V_4_4_7 is not set
 CT_CC_V_4_4_6=y
 # CT_CC_V_4_4_5 is not set
 # CT_CC_V_4_4_4 is not set
-# CT_CC_V_4_4_4_3 is not set
+# CT_CC_V_4_4_3 is not set
 # CT_CC_V_4_4_2 is not set
 # CT_CC_V_4_4_1 is not set
 # CT_CC_V_4_4_0 is not set
@@ -304,11 +325,15 @@ CT_LIBC="uClibc"
 CT_LIBC_VERSION="0.9.32"
 CT_LIBC_uClibc=y
 CT_LIBC_uClibc_AVAILABLE=y
+# CT_LIBC_UCLIBC_V_0_9_33_1 is not set
+# CT_LIBC_UCLIBC_V_0_9_33 is not set
+# CT_LIBC_UCLIBC_V_0_9_32_1 is not set
 CT_LIBC_UCLIBC_V_0_9_32=y
-#CT_LIBC_UCLIBC_V_0_9_30_3 is not set
+# CT_LIBC_UCLIBC_V_0_9_30_3 is not set
 # CT_LIBC_UCLIBC_V_0_9_30_2 is not set
 # CT_LIBC_UCLIBC_V_0_9_30_1 is not set
 # CT_LIBC_UCLIBC_V_0_9_30 is not set
+CT_LIBC_UCLIBC_0_9_32_or_later=y
 CT_LIBC_UCLIBC_0_9_30_or_later=y
 CT_LIBC_UCLIBC_PARALLEL=y
 CT_LIBC_UCLIBC_VERBOSITY_0=y
@@ -318,9 +343,11 @@ CT_LIBC_UCLIBC_VERBOSITY=""
 CT_LIBC_UCLIBC_DEBUG_LEVEL_0=y
 # CT_LIBC_UCLIBC_DEBUG_LEVEL_1 is not set
 # CT_LIBC_UCLIBC_DEBUG_LEVEL_2 is not set
+# CT_LIBC_UCLIBC_DEBUG_LEVEL_3 is not set
 CT_LIBC_UCLIBC_DEBUG_LEVEL=0
-CT_LIBC_UCLIBC_CONFIG_FILE="/home/ymorin/dev/buildroot/O/build/build-toolchain/libc.config"
+CT_LIBC_UCLIBC_CONFIG_FILE=""
 CT_LIBC_SUPPORT_THREADS_ANY=y
+CT_LIBC_SUPPORT_NPTL=y
 CT_LIBC_SUPPORT_LINUXTHREADS=y
 CT_LIBC_SUPPORT_THREADS_NONE=y
 CT_THREADS="linuxthreads"
@@ -328,6 +355,7 @@ CT_THREADS="linuxthreads"
 #
 # Common C library options
 #
+# CT_THREADS_NPTL is not set
 CT_THREADS_LINUXTHREADS=y
 # CT_THREADS_NONE is not set
 CT_LIBC_XLDD=y
-- 
1.7.2.5
