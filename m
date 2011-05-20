From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sat, 21 May 2011 01:39:20 +0200
Subject: [Buildroot] [PATCH 1/3] toolchain/crosstool-NG: bundle one CT-NG
	config file for each libc familly
In-Reply-To: <1305934762-10058-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1305934762-10058-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1305934762-10058-2-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the bundled CT-NG config file has no C library configured.
It is quite complex to add and/or munge options in this case.

Now, with one config file per libc familly, it becomes easier.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 toolchain/toolchain-crosstool-ng/Config.in         |   11 +-
 ...sstool-ng.config => crosstool-ng.config-eglibc} |  128 ++++++++++++++++----
 ...osstool-ng.config => crosstool-ng.config-glibc} |  126 ++++++++++++++++----
 ...sstool-ng.config => crosstool-ng.config-uClibc} |  107 +++++++++++++----
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk   |   18 +++-
 5 files changed, 312 insertions(+), 78 deletions(-)
 copy toolchain/toolchain-crosstool-ng/{crosstool-ng.config => crosstool-ng.config-eglibc} (74%)
 copy toolchain/toolchain-crosstool-ng/{crosstool-ng.config => crosstool-ng.config-glibc} (74%)
 rename toolchain/toolchain-crosstool-ng/{crosstool-ng.config => crosstool-ng.config-uClibc} (76%)

diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
index 1a10416..3cac808 100644
--- a/toolchain/toolchain-crosstool-ng/Config.in
+++ b/toolchain/toolchain-crosstool-ng/Config.in
@@ -38,12 +38,15 @@ config BR2_TOOLCHAIN_CTNG_LIBC
 
 config BR2_TOOLCHAIN_CTNG_CONFIG
 	string "crosstool-NG configuration file to use"
-	default "toolchain/toolchain-crosstool-ng/crosstool-ng.config"
+	default "toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc" if BR2_TOOLCHAIN_CTNG_uClibc
+	default "toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc" if BR2_TOOLCHAIN_CTNG_eglibc
+	default "toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc"  if BR2_TOOLCHAIN_CTNG_glibc
 	help
 	  Enter here the crosstool-NG's .config file to use.
-	  If unsure, use the default.
-	  To finetune your toolchain, you can also call:
-	  make ctng-menuconfig
+	  To fine-tune your toolchain, you can also call:
+	    make ctng-menuconfig
+
+	  If unsure, keep the default value.
 
 if BR2_TOOLCHAIN_CTNG_uClibc
 
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
similarity index 74%
copy from toolchain/toolchain-crosstool-ng/crosstool-ng.config
copy to toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
index 5f6aefe..83af9e7 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# crosstool-NG version: 1.10.0
-# Mon Feb  7 14:03:32 2011
+# crosstool-NG version: 1.10.1
+# Sun Apr 24 23:38:08 2011
 #
 CT_BACKEND=y
 CT_MODULES=y
@@ -84,9 +84,9 @@ CT_LOG_FILE_COMPRESS=y
 #
 # Target options
 #
-CT_ARCH="blackfin"
-# CT_ARCH_SUPPORTS_BOTH_MMU is not set
-# CT_ARCH_SUPPORTS_BOTH_ENDIAN is not set
+CT_ARCH="arm"
+CT_ARCH_SUPPORTS_BOTH_MMU=y
+CT_ARCH_SUPPORTS_BOTH_ENDIAN=y
 CT_ARCH_SUPPORTS_32=y
 # CT_ARCH_SUPPORTS_64 is not set
 CT_ARCH_SUPPORT_ARCH=y
@@ -94,7 +94,7 @@ CT_ARCH_SUPPORT_ARCH=y
 CT_ARCH_SUPPORT_CPU=y
 CT_ARCH_SUPPORT_TUNE=y
 CT_ARCH_SUPPORT_FPU=y
-# CT_ARCH_DEFAULT_HAS_MMU is not set
+CT_ARCH_DEFAULT_HAS_MMU=y
 # CT_ARCH_DEFAULT_BE is not set
 CT_ARCH_DEFAULT_LE=y
 CT_ARCH_DEFAULT_32=y
@@ -103,6 +103,8 @@ CT_ARCH_ARCH=""
 CT_ARCH_CPU=""
 CT_ARCH_TUNE=""
 CT_ARCH_FPU=""
+# CT_ARCH_BE is not set
+CT_ARCH_LE=y
 CT_ARCH_32=y
 # CT_ARCH_64 is not set
 CT_ARCH_BITNESS=32
@@ -115,9 +117,9 @@ CT_TARGET_LDFLAGS=""
 # General target options
 #
 # CT_ARCH_alpha is not set
-# CT_ARCH_arm is not set
+CT_ARCH_arm=y
 # CT_ARCH_avr32 is not set
-CT_ARCH_blackfin=y
+# CT_ARCH_blackfin is not set
 # CT_ARCH_m68k is not set
 # CT_ARCH_mips is not set
 # CT_ARCH_powerpc is not set
@@ -134,7 +136,15 @@ CT_ARCH_powerpc_AVAILABLE=y
 CT_ARCH_s390_AVAILABLE=y
 CT_ARCH_sh_AVAILABLE=y
 CT_ARCH_x86_AVAILABLE=y
-# CT_ARCH_USE_MMU is not set
+CT_ARCH_USE_MMU=y
+
+#
+# arm other options
+#
+CT_ARCH_ARM_MODE="arm"
+CT_ARCH_ARM_MODE_ARM=y
+# CT_ARCH_ARM_MODE_THUMB is not set
+CT_ARCH_ARM_EABI=y
 
 #
 # Target optimisations
@@ -178,17 +188,18 @@ CT_BUILD_SUFFIX=""
 #
 # Operating System
 #
-CT_BARE_METAL=y
+# CT_BARE_METAL is not set
 # CT_MINGW32 is not set
-# CT_KERNEL_SUPPORTS_SHARED_LIBS is not set
-CT_KERNEL="bare-metal"
-CT_KERNEL_bare_metal=y
-# CT_KERNEL_linux is not set
+CT_KERNEL_SUPPORTS_SHARED_LIBS=y
+CT_KERNEL="linux"
+CT_KERNEL_VERSION="2.6.37"
+# CT_KERNEL_bare_metal is not set
+CT_KERNEL_linux=y
 # CT_KERNEL_mingw32 is not set
 CT_KERNEL_bare_metal_AVAILABLE=y
 CT_KERNEL_linux_AVAILABLE=y
-# CT_KERNEL_LINUX_INSTALL is not set
-# CT_KERNEL_V_2_6_37 is not set
+CT_KERNEL_LINUX_INSTALL=y
+CT_KERNEL_V_2_6_37=y
 # CT_KERNEL_V_2_6_36_3 is not set
 # CT_KERNEL_V_2_6_36_2 is not set
 # CT_KERNEL_V_2_6_36_1 is not set
@@ -200,15 +211,18 @@ CT_KERNEL_linux_AVAILABLE=y
 # CT_KERNEL_V_2_6_31_14 is not set
 # CT_KERNEL_V_2_6_27_57 is not set
 # CT_KERNEL_LINUX_CUSTOM is not set
-# CT_KERNEL_LINUX_VERBOSITY_0 is not set
+CT_KERNEL_LINUX_VERBOSITY_0=y
 # CT_KERNEL_LINUX_VERBOSITY_1 is not set
 # CT_KERNEL_LINUX_VERBOSITY_2 is not set
+CT_KERNEL_LINUX_VERBOSE_LEVEL=0
+CT_KERNEL_LINUX_INSTALL_CHECK=y
 # CT_KERNEL_LINUX_USE_CUSTOM_HEADERS is not set
 CT_KERNEL_mingw32_AVAILABLE=y
 
 #
 # Common kernel options
 #
+CT_SHARED_LIBS=y
 
 #
 # Binary utilities
@@ -229,6 +243,7 @@ CT_BINUTILS_V_2_20=y
 # CT_BINUTILS_V_2_17 is not set
 # CT_BINUTILS_V_2_16_1 is not set
 CT_BINUTILS_VERSION="2.20"
+CT_BINUTILS_GOLD_SUPPORTS_ARCH=y
 CT_BINUTILS_EXTRA_CONFIG=""
 
 #
@@ -273,6 +288,7 @@ CT_CC_PKGVERSION="crosstool-NG-${CT_VERSION}"
 CT_CC_BUGURL=""
 CT_CC_ENABLE_CXX_FLAGS=""
 CT_CC_CORE_EXTRA_CONFIG=""
+CT_CC_EXTRA_CONFIG=""
 CT_CC_SUPPORT_CXX=y
 CT_CC_SUPPORT_FORTRAN=y
 CT_CC_SUPPORT_JAVA=y
@@ -284,6 +300,8 @@ CT_CC_SUPPORT_OBJCXX=y
 # Additional supported languages:
 #
 # CT_CC_LANG_CXX is not set
+# CT_CC_LANG_FORTRAN is not set
+# CT_CC_LANG_JAVA is not set
 
 #
 # gcc other options
@@ -298,31 +316,93 @@ CT_CC_STATIC_LIBSTDCXX=y
 #
 # Misc. obscure options.
 #
+CT_CC_CXA_ATEXIT=y
 # CT_CC_GCC_DISABLE_PCH is not set
+CT_CC_GCC_SJLJ_EXCEPTIONS=m
 CT_CC_GCC_LDBL_128=m
 
 #
 # C-library
 #
-CT_LIBC="none"
-# CT_LIBC_eglibc is not set
+CT_LIBC="eglibc"
+CT_LIBC_VERSION="2_10"
+CT_LIBC_eglibc=y
 # CT_LIBC_glibc is not set
 # CT_LIBC_mingw is not set
 # CT_LIBC_newlib is not set
-CT_LIBC_none=y
+# CT_LIBC_none is not set
 # CT_LIBC_uClibc is not set
 CT_LIBC_eglibc_AVAILABLE=y
+# CT_LIBC_EGLIBC_V_2_12 is not set
+# CT_LIBC_EGLIBC_V_2_11 is not set
+CT_LIBC_EGLIBC_V_2_10=y
+# CT_LIBC_EGLIBC_V_2_9 is not set
+# CT_LIBC_EGLIBC_V_2_8 is not set
+# CT_LIBC_EGLIBC_V_2_7 is not set
+# CT_LIBC_EGLIBC_V_2_6 is not set
+# CT_LIBC_EGLIBC_V_2_5 is not set
+# CT_LIBC_EGLIBC_V_TRUNK is not set
+CT_EGLIBC_REVISION="HEAD"
+# CT_EGLIBC_CHECKOUT is not set
+# CT_EGLIBC_OPT_SIZE is not set
+# CT_EGLIBC_CUSTOM_CONFIG is not set
 CT_LIBC_glibc_AVAILABLE=y
 CT_LIBC_mingw_AVAILABLE=y
 CT_LIBC_newlib_AVAILABLE=y
 CT_LIBC_none_AVAILABLE=y
 CT_LIBC_uClibc_AVAILABLE=y
-# CT_LIBC_SUPPORT_THREADS_ANY is not set
-# CT_LIBC_SUPPORT_NPTL is not set
-# CT_LIBC_SUPPORT_LINUXTHREADS is not set
+
+#
+# glibc/eglibc common options
+#
+CT_LIBC_GLIBC_EXTRA_CONFIG=""
+CT_LIBC_GLIBC_CONFIGPARMS=""
+CT_LIBC_GLIBC_EXTRA_CFLAGS=""
+CT_LIBC_EXTRA_CC_ARGS=""
+# CT_LIBC_DISABLE_VERSIONING is not set
+CT_LIBC_OLDEST_ABI=""
+# CT_LIBC_GLIBC_FORCE_UNWIND is not set
+CT_LIBC_GLIBC_USE_PORTS=y
+CT_LIBC_ADDONS_LIST=""
+
+#
+# WARNING !!!                                            
+#
+
+#
+#   For glibc >= 2.8, it can happen that the tarballs    
+#
+
+#
+#   for the addons are not available for download.       
+#
+
+#
+#   If that happens, bad luck... Try a previous version  
+#
+
+#
+#   or try again later... :-(                            
+#
+# CT_LIBC_GLIBC_KERNEL_VERSION_NONE is not set
+CT_LIBC_GLIBC_KERNEL_VERSION_AS_HEADERS=y
+# CT_LIBC_GLIBC_KERNEL_VERSION_CHOSEN is not set
+CT_LIBC_GLIBC_MIN_KERNEL="2.6.37"
+CT_LIBC_SUPPORT_THREADS_ANY=y
+CT_LIBC_SUPPORT_NPTL=y
+CT_LIBC_SUPPORT_LINUXTHREADS=y
 # CT_LIBC_SUPPORT_WIN32THREADS is not set
 # CT_LIBC_SUPPORT_THREADS_NONE is not set
-CT_THREADS="none"
+CT_THREADS="nptl"
+
+#
+# Common C library options
+#
+CT_THREADS_NPTL=y
+# CT_THREADS_LINUXTHREADS is not set
+# CT_THREADS_WIN32THREADS is not set
+# CT_THREADS_NONE is not set
+CT_LIBC_XLDD=y
 
 #
 # Debug facilities
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
similarity index 74%
copy from toolchain/toolchain-crosstool-ng/crosstool-ng.config
copy to toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
index 5f6aefe..737429d 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# crosstool-NG version: 1.10.0
-# Mon Feb  7 14:03:32 2011
+# crosstool-NG version: 1.10.1
+# Sun Apr 24 23:37:30 2011
 #
 CT_BACKEND=y
 CT_MODULES=y
@@ -84,9 +84,9 @@ CT_LOG_FILE_COMPRESS=y
 #
 # Target options
 #
-CT_ARCH="blackfin"
-# CT_ARCH_SUPPORTS_BOTH_MMU is not set
-# CT_ARCH_SUPPORTS_BOTH_ENDIAN is not set
+CT_ARCH="arm"
+CT_ARCH_SUPPORTS_BOTH_MMU=y
+CT_ARCH_SUPPORTS_BOTH_ENDIAN=y
 CT_ARCH_SUPPORTS_32=y
 # CT_ARCH_SUPPORTS_64 is not set
 CT_ARCH_SUPPORT_ARCH=y
@@ -94,7 +94,7 @@ CT_ARCH_SUPPORT_ARCH=y
 CT_ARCH_SUPPORT_CPU=y
 CT_ARCH_SUPPORT_TUNE=y
 CT_ARCH_SUPPORT_FPU=y
-# CT_ARCH_DEFAULT_HAS_MMU is not set
+CT_ARCH_DEFAULT_HAS_MMU=y
 # CT_ARCH_DEFAULT_BE is not set
 CT_ARCH_DEFAULT_LE=y
 CT_ARCH_DEFAULT_32=y
@@ -103,6 +103,8 @@ CT_ARCH_ARCH=""
 CT_ARCH_CPU=""
 CT_ARCH_TUNE=""
 CT_ARCH_FPU=""
+# CT_ARCH_BE is not set
+CT_ARCH_LE=y
 CT_ARCH_32=y
 # CT_ARCH_64 is not set
 CT_ARCH_BITNESS=32
@@ -115,9 +117,9 @@ CT_TARGET_LDFLAGS=""
 # General target options
 #
 # CT_ARCH_alpha is not set
-# CT_ARCH_arm is not set
+CT_ARCH_arm=y
 # CT_ARCH_avr32 is not set
-CT_ARCH_blackfin=y
+# CT_ARCH_blackfin is not set
 # CT_ARCH_m68k is not set
 # CT_ARCH_mips is not set
 # CT_ARCH_powerpc is not set
@@ -134,7 +136,15 @@ CT_ARCH_powerpc_AVAILABLE=y
 CT_ARCH_s390_AVAILABLE=y
 CT_ARCH_sh_AVAILABLE=y
 CT_ARCH_x86_AVAILABLE=y
-# CT_ARCH_USE_MMU is not set
+CT_ARCH_USE_MMU=y
+
+#
+# arm other options
+#
+CT_ARCH_ARM_MODE="arm"
+CT_ARCH_ARM_MODE_ARM=y
+# CT_ARCH_ARM_MODE_THUMB is not set
+CT_ARCH_ARM_EABI=y
 
 #
 # Target optimisations
@@ -178,17 +188,18 @@ CT_BUILD_SUFFIX=""
 #
 # Operating System
 #
-CT_BARE_METAL=y
+# CT_BARE_METAL is not set
 # CT_MINGW32 is not set
-# CT_KERNEL_SUPPORTS_SHARED_LIBS is not set
-CT_KERNEL="bare-metal"
-CT_KERNEL_bare_metal=y
-# CT_KERNEL_linux is not set
+CT_KERNEL_SUPPORTS_SHARED_LIBS=y
+CT_KERNEL="linux"
+CT_KERNEL_VERSION="2.6.37"
+# CT_KERNEL_bare_metal is not set
+CT_KERNEL_linux=y
 # CT_KERNEL_mingw32 is not set
 CT_KERNEL_bare_metal_AVAILABLE=y
 CT_KERNEL_linux_AVAILABLE=y
-# CT_KERNEL_LINUX_INSTALL is not set
-# CT_KERNEL_V_2_6_37 is not set
+CT_KERNEL_LINUX_INSTALL=y
+CT_KERNEL_V_2_6_37=y
 # CT_KERNEL_V_2_6_36_3 is not set
 # CT_KERNEL_V_2_6_36_2 is not set
 # CT_KERNEL_V_2_6_36_1 is not set
@@ -200,15 +211,18 @@ CT_KERNEL_linux_AVAILABLE=y
 # CT_KERNEL_V_2_6_31_14 is not set
 # CT_KERNEL_V_2_6_27_57 is not set
 # CT_KERNEL_LINUX_CUSTOM is not set
-# CT_KERNEL_LINUX_VERBOSITY_0 is not set
+CT_KERNEL_LINUX_VERBOSITY_0=y
 # CT_KERNEL_LINUX_VERBOSITY_1 is not set
 # CT_KERNEL_LINUX_VERBOSITY_2 is not set
+CT_KERNEL_LINUX_VERBOSE_LEVEL=0
+CT_KERNEL_LINUX_INSTALL_CHECK=y
 # CT_KERNEL_LINUX_USE_CUSTOM_HEADERS is not set
 CT_KERNEL_mingw32_AVAILABLE=y
 
 #
 # Common kernel options
 #
+CT_SHARED_LIBS=y
 
 #
 # Binary utilities
@@ -229,6 +243,7 @@ CT_BINUTILS_V_2_20=y
 # CT_BINUTILS_V_2_17 is not set
 # CT_BINUTILS_V_2_16_1 is not set
 CT_BINUTILS_VERSION="2.20"
+CT_BINUTILS_GOLD_SUPPORTS_ARCH=y
 CT_BINUTILS_EXTRA_CONFIG=""
 
 #
@@ -273,6 +288,7 @@ CT_CC_PKGVERSION="crosstool-NG-${CT_VERSION}"
 CT_CC_BUGURL=""
 CT_CC_ENABLE_CXX_FLAGS=""
 CT_CC_CORE_EXTRA_CONFIG=""
+CT_CC_EXTRA_CONFIG=""
 CT_CC_SUPPORT_CXX=y
 CT_CC_SUPPORT_FORTRAN=y
 CT_CC_SUPPORT_JAVA=y
@@ -284,6 +300,8 @@ CT_CC_SUPPORT_OBJCXX=y
 # Additional supported languages:
 #
 # CT_CC_LANG_CXX is not set
+# CT_CC_LANG_FORTRAN is not set
+# CT_CC_LANG_JAVA is not set
 
 #
 # gcc other options
@@ -298,31 +316,93 @@ CT_CC_STATIC_LIBSTDCXX=y
 #
 # Misc. obscure options.
 #
+CT_CC_CXA_ATEXIT=y
 # CT_CC_GCC_DISABLE_PCH is not set
+CT_CC_GCC_SJLJ_EXCEPTIONS=m
 CT_CC_GCC_LDBL_128=m
 
 #
 # C-library
 #
-CT_LIBC="none"
+CT_LIBC="glibc"
+CT_LIBC_VERSION="2.9"
 # CT_LIBC_eglibc is not set
-# CT_LIBC_glibc is not set
+CT_LIBC_glibc=y
 # CT_LIBC_mingw is not set
 # CT_LIBC_newlib is not set
-CT_LIBC_none=y
+# CT_LIBC_none is not set
 # CT_LIBC_uClibc is not set
 CT_LIBC_eglibc_AVAILABLE=y
 CT_LIBC_glibc_AVAILABLE=y
+CT_LIBC_GLIBC_TARBALL=y
+# CT_LIBC_GLIBC_V_2_12_2 is not set
+# CT_LIBC_GLIBC_V_2_12_1 is not set
+# CT_LIBC_GLIBC_V_2_11_1 is not set
+# CT_LIBC_GLIBC_V_2_11 is not set
+# CT_LIBC_GLIBC_V_2_10_1 is not set
+CT_LIBC_GLIBC_V_2_9=y
+# CT_LIBC_GLIBC_V_2_8 is not set
+# CT_LIBC_GLIBC_V_2_7 is not set
+# CT_LIBC_GLIBC_V_2_6_1 is not set
+# CT_LIBC_GLIBC_V_2_6 is not set
+# CT_LIBC_GLIBC_V_2_5_1 is not set
+# CT_LIBC_GLIBC_V_2_5 is not set
 CT_LIBC_mingw_AVAILABLE=y
 CT_LIBC_newlib_AVAILABLE=y
 CT_LIBC_none_AVAILABLE=y
 CT_LIBC_uClibc_AVAILABLE=y
-# CT_LIBC_SUPPORT_THREADS_ANY is not set
-# CT_LIBC_SUPPORT_NPTL is not set
+
+#
+# glibc/eglibc common options
+#
+CT_LIBC_GLIBC_EXTRA_CONFIG=""
+CT_LIBC_GLIBC_CONFIGPARMS=""
+CT_LIBC_GLIBC_EXTRA_CFLAGS=""
+CT_LIBC_EXTRA_CC_ARGS=""
+# CT_LIBC_DISABLE_VERSIONING is not set
+CT_LIBC_OLDEST_ABI=""
+# CT_LIBC_GLIBC_FORCE_UNWIND is not set
+CT_LIBC_GLIBC_USE_PORTS=y
+CT_LIBC_ADDONS_LIST=""
+
+#
+# WARNING !!!                                            
+#
+
+#
+#   For glibc >= 2.8, it can happen that the tarballs    
+#
+
+#
+#   for the addons are not available for download.       
+#
+
+#
+#   If that happens, bad luck... Try a previous version  
+#
+
+#
+#   or try again later... :-(                            
+#
+# CT_LIBC_GLIBC_KERNEL_VERSION_NONE is not set
+CT_LIBC_GLIBC_KERNEL_VERSION_AS_HEADERS=y
+# CT_LIBC_GLIBC_KERNEL_VERSION_CHOSEN is not set
+CT_LIBC_GLIBC_MIN_KERNEL="2.6.37"
+CT_LIBC_SUPPORT_THREADS_ANY=y
+CT_LIBC_SUPPORT_NPTL=y
 # CT_LIBC_SUPPORT_LINUXTHREADS is not set
 # CT_LIBC_SUPPORT_WIN32THREADS is not set
 # CT_LIBC_SUPPORT_THREADS_NONE is not set
-CT_THREADS="none"
+CT_THREADS="nptl"
+
+#
+# Common C library options
+#
+CT_THREADS_NPTL=y
+# CT_THREADS_LINUXTHREADS is not set
+# CT_THREADS_WIN32THREADS is not set
+# CT_THREADS_NONE is not set
+CT_LIBC_XLDD=y
 
 #
 # Debug facilities
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
similarity index 76%
rename from toolchain/toolchain-crosstool-ng/crosstool-ng.config
rename to toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
index 5f6aefe..f251726 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# crosstool-NG version: 1.10.0
-# Mon Feb  7 14:03:32 2011
+# crosstool-NG version: 1.10.1
+# Sun Apr 24 23:37:50 2011
 #
 CT_BACKEND=y
 CT_MODULES=y
@@ -84,9 +84,9 @@ CT_LOG_FILE_COMPRESS=y
 #
 # Target options
 #
-CT_ARCH="blackfin"
-# CT_ARCH_SUPPORTS_BOTH_MMU is not set
-# CT_ARCH_SUPPORTS_BOTH_ENDIAN is not set
+CT_ARCH="arm"
+CT_ARCH_SUPPORTS_BOTH_MMU=y
+CT_ARCH_SUPPORTS_BOTH_ENDIAN=y
 CT_ARCH_SUPPORTS_32=y
 # CT_ARCH_SUPPORTS_64 is not set
 CT_ARCH_SUPPORT_ARCH=y
@@ -94,7 +94,7 @@ CT_ARCH_SUPPORT_ARCH=y
 CT_ARCH_SUPPORT_CPU=y
 CT_ARCH_SUPPORT_TUNE=y
 CT_ARCH_SUPPORT_FPU=y
-# CT_ARCH_DEFAULT_HAS_MMU is not set
+CT_ARCH_DEFAULT_HAS_MMU=y
 # CT_ARCH_DEFAULT_BE is not set
 CT_ARCH_DEFAULT_LE=y
 CT_ARCH_DEFAULT_32=y
@@ -103,6 +103,8 @@ CT_ARCH_ARCH=""
 CT_ARCH_CPU=""
 CT_ARCH_TUNE=""
 CT_ARCH_FPU=""
+# CT_ARCH_BE is not set
+CT_ARCH_LE=y
 CT_ARCH_32=y
 # CT_ARCH_64 is not set
 CT_ARCH_BITNESS=32
@@ -115,9 +117,9 @@ CT_TARGET_LDFLAGS=""
 # General target options
 #
 # CT_ARCH_alpha is not set
-# CT_ARCH_arm is not set
+CT_ARCH_arm=y
 # CT_ARCH_avr32 is not set
-CT_ARCH_blackfin=y
+# CT_ARCH_blackfin is not set
 # CT_ARCH_m68k is not set
 # CT_ARCH_mips is not set
 # CT_ARCH_powerpc is not set
@@ -134,7 +136,15 @@ CT_ARCH_powerpc_AVAILABLE=y
 CT_ARCH_s390_AVAILABLE=y
 CT_ARCH_sh_AVAILABLE=y
 CT_ARCH_x86_AVAILABLE=y
-# CT_ARCH_USE_MMU is not set
+CT_ARCH_USE_MMU=y
+
+#
+# arm other options
+#
+CT_ARCH_ARM_MODE="arm"
+CT_ARCH_ARM_MODE_ARM=y
+# CT_ARCH_ARM_MODE_THUMB is not set
+CT_ARCH_ARM_EABI=y
 
 #
 # Target optimisations
@@ -178,17 +188,18 @@ CT_BUILD_SUFFIX=""
 #
 # Operating System
 #
-CT_BARE_METAL=y
+# CT_BARE_METAL is not set
 # CT_MINGW32 is not set
-# CT_KERNEL_SUPPORTS_SHARED_LIBS is not set
-CT_KERNEL="bare-metal"
-CT_KERNEL_bare_metal=y
-# CT_KERNEL_linux is not set
+CT_KERNEL_SUPPORTS_SHARED_LIBS=y
+CT_KERNEL="linux"
+CT_KERNEL_VERSION="2.6.37"
+# CT_KERNEL_bare_metal is not set
+CT_KERNEL_linux=y
 # CT_KERNEL_mingw32 is not set
 CT_KERNEL_bare_metal_AVAILABLE=y
 CT_KERNEL_linux_AVAILABLE=y
-# CT_KERNEL_LINUX_INSTALL is not set
-# CT_KERNEL_V_2_6_37 is not set
+CT_KERNEL_LINUX_INSTALL=y
+CT_KERNEL_V_2_6_37=y
 # CT_KERNEL_V_2_6_36_3 is not set
 # CT_KERNEL_V_2_6_36_2 is not set
 # CT_KERNEL_V_2_6_36_1 is not set
@@ -200,15 +211,18 @@ CT_KERNEL_linux_AVAILABLE=y
 # CT_KERNEL_V_2_6_31_14 is not set
 # CT_KERNEL_V_2_6_27_57 is not set
 # CT_KERNEL_LINUX_CUSTOM is not set
-# CT_KERNEL_LINUX_VERBOSITY_0 is not set
+CT_KERNEL_LINUX_VERBOSITY_0=y
 # CT_KERNEL_LINUX_VERBOSITY_1 is not set
 # CT_KERNEL_LINUX_VERBOSITY_2 is not set
+CT_KERNEL_LINUX_VERBOSE_LEVEL=0
+CT_KERNEL_LINUX_INSTALL_CHECK=y
 # CT_KERNEL_LINUX_USE_CUSTOM_HEADERS is not set
 CT_KERNEL_mingw32_AVAILABLE=y
 
 #
 # Common kernel options
 #
+CT_SHARED_LIBS=y
 
 #
 # Binary utilities
@@ -229,6 +243,7 @@ CT_BINUTILS_V_2_20=y
 # CT_BINUTILS_V_2_17 is not set
 # CT_BINUTILS_V_2_16_1 is not set
 CT_BINUTILS_VERSION="2.20"
+CT_BINUTILS_GOLD_SUPPORTS_ARCH=y
 CT_BINUTILS_EXTRA_CONFIG=""
 
 #
@@ -273,6 +288,7 @@ CT_CC_PKGVERSION="crosstool-NG-${CT_VERSION}"
 CT_CC_BUGURL=""
 CT_CC_ENABLE_CXX_FLAGS=""
 CT_CC_CORE_EXTRA_CONFIG=""
+CT_CC_EXTRA_CONFIG=""
 CT_CC_SUPPORT_CXX=y
 CT_CC_SUPPORT_FORTRAN=y
 CT_CC_SUPPORT_JAVA=y
@@ -284,6 +300,8 @@ CT_CC_SUPPORT_OBJCXX=y
 # Additional supported languages:
 #
 # CT_CC_LANG_CXX is not set
+# CT_CC_LANG_FORTRAN is not set
+# CT_CC_LANG_JAVA is not set
 
 #
 # gcc other options
@@ -298,31 +316,72 @@ CT_CC_STATIC_LIBSTDCXX=y
 #
 # Misc. obscure options.
 #
+CT_CC_CXA_ATEXIT=y
 # CT_CC_GCC_DISABLE_PCH is not set
+CT_CC_GCC_SJLJ_EXCEPTIONS=m
 CT_CC_GCC_LDBL_128=m
 
 #
 # C-library
 #
-CT_LIBC="none"
+CT_LIBC="uClibc"
+CT_LIBC_VERSION="0.9.30.3"
 # CT_LIBC_eglibc is not set
 # CT_LIBC_glibc is not set
 # CT_LIBC_mingw is not set
 # CT_LIBC_newlib is not set
-CT_LIBC_none=y
-# CT_LIBC_uClibc is not set
+# CT_LIBC_none is not set
+CT_LIBC_uClibc=y
 CT_LIBC_eglibc_AVAILABLE=y
 CT_LIBC_glibc_AVAILABLE=y
 CT_LIBC_mingw_AVAILABLE=y
 CT_LIBC_newlib_AVAILABLE=y
 CT_LIBC_none_AVAILABLE=y
 CT_LIBC_uClibc_AVAILABLE=y
-# CT_LIBC_SUPPORT_THREADS_ANY is not set
+# CT_LIBC_UCLIBC_V_0_9_31 is not set
+CT_LIBC_UCLIBC_V_0_9_30_3=y
+# CT_LIBC_UCLIBC_V_0_9_30_2 is not set
+# CT_LIBC_UCLIBC_V_0_9_30_1 is not set
+# CT_LIBC_UCLIBC_V_0_9_30 is not set
+# CT_LIBC_UCLIBC_V_0_9_29 is not set
+# CT_LIBC_UCLIBC_V_0_9_28_3 is not set
+# CT_LIBC_UCLIBC_V_snapshot is not set
+# CT_LIBC_UCLIBC_V_specific_date is not set
+CT_LIBC_UCLIBC_0_9_30_or_later=y
+CT_LIBC_UCLIBC_PARALLEL=y
+CT_LIBC_UCLIBC_VERBOSITY_0=y
+# CT_LIBC_UCLIBC_VERBOSITY_1 is not set
+# CT_LIBC_UCLIBC_VERBOSITY_2 is not set
+CT_LIBC_UCLIBC_VERBOSITY=""
+CT_LIBC_UCLIBC_DEBUG_LEVEL_0=y
+# CT_LIBC_UCLIBC_DEBUG_LEVEL_1 is not set
+# CT_LIBC_UCLIBC_DEBUG_LEVEL_2 is not set
+CT_LIBC_UCLIBC_DEBUG_LEVEL=0
+CT_LIBC_UCLIBC_CONFIG_FILE=""
+CT_LIBC_SUPPORT_THREADS_ANY=y
 # CT_LIBC_SUPPORT_NPTL is not set
-# CT_LIBC_SUPPORT_LINUXTHREADS is not set
+CT_LIBC_SUPPORT_LINUXTHREADS=y
 # CT_LIBC_SUPPORT_WIN32THREADS is not set
-# CT_LIBC_SUPPORT_THREADS_NONE is not set
-CT_THREADS="none"
+CT_LIBC_SUPPORT_THREADS_NONE=y
+CT_THREADS="linuxthreads"
+
+#
+# Common C library options
+#
+# CT_THREADS_NPTL is not set
+CT_THREADS_LINUXTHREADS=y
+# CT_THREADS_WIN32THREADS is not set
+# CT_THREADS_NONE is not set
+CT_LIBC_XLDD=y
+
+#
+# uClibc other options
+#
+CT_LIBC_UCLIBC_LNXTHRD_OLD=y
+# CT_LIBC_UCLIBC_LNXTHRD_NEW is not set
+CT_LIBC_UCLIBC_LNXTHRD="old"
+# CT_LIBC_UCLIBC_LOCALES is not set
+# CT_LIBC_UCLIBC_WCHAR is not set
 
 #
 # Debug facilities
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 015cd13..b9888bf 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -20,9 +20,10 @@ CTNG_SOURCE:=crosstool-ng-$(CTNG_VERSION).tar.bz2
 CTNG_DIR:=$(BUILD_DIR)/crosstool-ng-$(CTNG_VERSION)
 CTNG_CAT:=bzcat
 CTNG_PATCH_DIR:=toolchain/toolchain-crosstool-ng
-CTNG_CONFIG_FILE:=$(call qstrip,$(BR2_TOOLCHAIN_CTNG_CONFIG))
 CTNG_UCLIBC_CONFIG_FILE := $(TOPDIR)/toolchain/toolchain-crosstool-ng/uClibc.config
 
+CTNG_CONFIG_FILE:=$(call qstrip,$(BR2_TOOLCHAIN_CTNG_CONFIG))
+
 # Hack! ct-ng is in fact a Makefile script. As such, it accepts all
 # make options, such as -C, which makes it uneeded to chdir prior
 # to calling ct-ng.
@@ -349,13 +350,24 @@ endef
 # Default configuration
 # Depends on top-level .config because it has options we have to shoe-horn
 # into crosstool-NG's .config
-# Only copy the original .config file if we don't have one already
+# Only copy the original .config file if we don't have one already.
+# Check that given config file matches selected C library.
 # We need to call oldconfig twice in a row to ensure the options
 # are correctly set ( eg. if an option is new, then the initial sed
 # can't do anything about it ) Ideally, this should go in oldconfig
 # itself, but it's much easier to handle here.
 $(CTNG_DIR)/.config: $(CTNG_CONFIG_FILE) $(CTNG_DIR)/ct-ng $(CONFIG_DIR)/.config
-	$(Q)[ -f $@ ] && cp -a $@ $@.timestamp || cp -f $< $@
+	$(Q)if [ ! -f $@ ]; then                                                        \
+	        libc="$$(awk -F '"' '$$1=="CT_LIBC=" { print $2; } "$<")";              \
+	        if [ "$${libc}" != "$(BR2_TOOLCHAIN_CTNG_LIBC)" ]; then                 \
+	            echo "* Inconsistency in crosstool-NG config file '$<'";            \
+	            echo "* - buildroot configured for '$(BR2_TOOLCHAIN_CTNG_LIBC)'";   \
+	            echo "* - given config file for '$${libc}'";                        \
+	            exit 1;                                                             \
+	        fi;                                                                     \
+	        cp -f $< $@;                                                            \
+	    fi
+	$(Q)cp -a $@ $@.timestamp
 	$(call ctng-oldconfig,$@)
 	$(call ctng-oldconfig,$@)
 	$(call ctng-check-config-changed,$@,$@.timestamp)
-- 
1.7.2.3
