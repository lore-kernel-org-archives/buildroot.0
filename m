From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 19 Sep 2010 21:54:09 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain: add new toolchain backend:
	crosstool-NG
In-Reply-To: <1284926049-9882-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1284926049-9882-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1284926049-9882-3-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
---
 Makefile                                           |    4 +-
 package/Makefile.in                                |    2 +
 toolchain/Config.in                                |    9 +
 ...chain-external.mk => toolchain-crosstool-ng.mk} |    4 +-
 toolchain/toolchain-crosstool-ng/Config.in         |   60 +++
 .../toolchain-crosstool-ng/crosstool-ng.config     |  360 +++++++++++++++
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk   |  275 +++++++++++
 .../uClibc.config}                                 |  126 +++---
 8 files changed, 773 insertions(+), 67 deletions(-)

diff --git a/Makefile b/Makefile
index faa802b..12a7526 100644
--- a/Makefile
+++ b/Makefile
@@ -230,7 +230,7 @@ PREFERRED_LIB_FLAGS:=--enable-static --enable-shared
 ##############################################################
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 BASE_TARGETS:=uclibc-configured binutils cross_compiler uclibc-target-utils kernel-headers
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
+else
 BASE_TARGETS:=uclibc
 endif
 TARGETS:=
@@ -287,6 +287,8 @@ ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 include toolchain/toolchain-buildroot.mk
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 include toolchain/toolchain-external.mk
+else ifeq ($(BR2_TOOLCHAIN_CTNG),y)
+include toolchain/toolchain-crosstool-ng.mk
 endif
 
 include package/*/*.mk
diff --git a/package/Makefile.in b/package/Makefile.in
index bb2aafa..3ee9f99 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -117,6 +117,8 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 TOOLCHAIN_EXTERNAL_PREFIX:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
 TOOLCHAIN_EXTERNAL_PATH:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
 TARGET_CROSS=$(TOOLCHAIN_EXTERNAL_PATH)/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-
+else ifeq ($(BR2_TOOLCHAIN_CTNG),y)
+TARGET_CROSS=$(TOOLCHAIN_DIR)/bin/$(REAL_GNU_TARGET_NAME)-
 endif
 
 # Quotes are needed for spaces et al in path components.
diff --git a/toolchain/Config.in b/toolchain/Config.in
index fc9a048..d476cbf 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -14,10 +14,19 @@ config BR2_TOOLCHAIN_BUILDROOT
 config BR2_TOOLCHAIN_EXTERNAL
 	bool "External toolchain"
 
+config BR2_TOOLCHAIN_CTNG
+	bool "Crosstool-NG toolchain"
+	help
+	  Say 'y' if you want to generate the toolchain with crosstool-NG
+	  ( http://ymorin.is-a-geek.org/projects/crosstool )
+
+	  This is considered experimental, and you can expect some breakage.
+
 endchoice
 
 source "toolchain/toolchain-buildroot/Config.in"
 source "toolchain/toolchain-external/Config.in"
+source "toolchain/toolchain-crosstool-ng/Config.in"
 source "toolchain/toolchain-common.in"
 source "toolchain/toolchain-buildroot/Config.in.2"
 source "toolchain/toolchain-external/Config.in.2"
diff --git a/toolchain/toolchain-external.mk b/toolchain/toolchain-crosstool-ng.mk
similarity index 80%
copy from toolchain/toolchain-external.mk
copy to toolchain/toolchain-crosstool-ng.mk
index 6f1f641..81fce18 100644
--- a/toolchain/toolchain-external.mk
+++ b/toolchain/toolchain-crosstool-ng.mk
@@ -1,5 +1,6 @@
 # Required includes for the external toolchain backend
 
+# Explicit ordering:
 include toolchain/helpers.mk
 include toolchain/binutils/binutils.mk
 include toolchain/ccache/ccache.mk
@@ -7,8 +8,7 @@ include toolchain/dependencies/dependencies.mk
 include toolchain/elf2flt/elf2flt.mk
 include toolchain/gcc/gcc-uclibc-4.x.mk
 include toolchain/gdb/gdb.mk
-include toolchain/kernel-headers/kernel-headers.mk
+include toolchain/toolchain-crosstool-ng/crosstool-ng.mk
 include toolchain/mklibs/mklibs.mk
 include toolchain/sstrip/sstrip.mk
-include toolchain/toolchain-external/ext-tool.mk
 include toolchain/uClibc/uclibc.mk
diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
new file mode 100644
index 0000000..c50af37
--- /dev/null
+++ b/toolchain/toolchain-crosstool-ng/Config.in
@@ -0,0 +1,60 @@
+# Selection options for crosstool-NG
+
+if BR2_TOOLCHAIN_CTNG
+
+choice
+    bool
+    prompt "Crosstool-NG C library"
+
+config BR2_TOOLCHAIN_CTNG_uClibc
+    bool
+    prompt "uClibc"
+
+# Although eglibc can be configured to opt-out some features,
+# let's not deal with that for the time being, it's complex...
+config BR2_TOOLCHAIN_CTNG_eglibc
+    bool
+    prompt "eglibc"
+    select BR2_LARGEFILE
+    select BR2_INET_IPV6
+    select BR2_INET_RPC
+    select BR2_ENABLE_LOCALE
+    select BR2_USE_WCHAR
+    select BR2_PROGRAM_INVOCATION
+
+config BR2_TOOLCHAIN_CTNG_glibc
+    bool
+    prompt "glibc"
+    select BR2_LARGEFILE
+    select BR2_INET_IPV6
+    select BR2_INET_RPC
+    select BR2_ENABLE_LOCALE
+    select BR2_USE_WCHAR
+    select BR2_PROGRAM_INVOCATION
+
+endchoice # C library
+
+config BR2_TOOLCHAIN_CTNG_LIBC
+    string
+    default "uClibc"    if BR2_TOOLCHAIN_CTNG_uClibc
+    default "eglibc"    if BR2_TOOLCHAIN_CTNG_eglibc
+    default "glibc"     if BR2_TOOLCHAIN_CTNG_glibc
+
+config BR2_TOOLCHAIN_CTNG_CONFIG
+    string
+    prompt "crosstool-NG configuration file to use"
+    default "toolchain/toolchain-crosstool-ng/crosstool-ng.config"
+    help
+      Enter here the crosstool-NG's .config file to use.
+      If unsure, use the default.
+      To finely tune your toolchain, you can also call:
+        make ctng-menuconfig
+
+config BR2_TOOLCHAIN_CTNG_STRIP_LIBS
+    bool
+    prompt "Strip libs copied to target"
+    default y
+    help
+      Strip shared libraries copied from the toolchain.
+
+endif # BR2_TOOLCHAIN_CTNG
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config b/toolchain/toolchain-crosstool-ng/crosstool-ng.config
new file mode 100644
index 0000000..d5ee244
--- /dev/null
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config
@@ -0,0 +1,360 @@
+#
+# Automatically generated make config: don't edit
+# crosstool-NG version: hg_default at 1943_48e107b35ba9
+# Sat May  8 16:27:31 2010
+#
+CT_BACKEND=y
+
+#
+# Paths and misc options
+#
+
+#
+# crosstool-NG behavior
+#
+# CT_OBSOLETE is not set
+# CT_EXPERIMENTAL is not set
+
+#
+# Paths
+#
+CT_LOCAL_TARBALLS_DIR=""
+CT_SAVE_TARBALLS=y
+CT_WORK_DIR="${CT_TOP_DIR}/targets"
+CT_PREFIX_DIR="${HOME}/x-tools/${CT_TARGET}"
+CT_INSTALL_DIR="${CT_PREFIX_DIR}"
+CT_REMOVE_DOCS=y
+# CT_INSTALL_DIR_RO is not set
+
+#
+# Downloading
+#
+# CT_FORBID_DOWNLOAD is not set
+# CT_FORCE_DOWNLOAD is not set
+# CT_USE_MIRROR is not set
+CT_CONNECT_TIMEOUT=10
+CT_DOWNLOAD_MAX_CHUNKS=5
+# CT_ONLY_DOWNLOAD is not set
+
+#
+# Extracting
+#
+# CT_FORCE_EXTRACT is not set
+CT_OVERIDE_CONFIG_GUESS_SUB=y
+# CT_ONLY_EXTRACT is not set
+CT_PATCH_BUNDLED=y
+# CT_PATCH_LOCAL is not set
+# CT_PATCH_BUNDLED_LOCAL is not set
+# CT_PATCH_LOCAL_BUNDLED is not set
+# CT_PATCH_BUNDLED_FALLBACK_LOCAL is not set
+# CT_PATCH_LOCAL_FALLBACK_BUNDLED is not set
+# CT_PATCH_NONE is not set
+CT_PATCH_ORDER="bundled"
+# CT_PATCH_SINGLE is not set
+# CT_PATCH_USE_LOCAL is not set
+
+#
+# Build behavior
+#
+
+#
+# Build options hiden
+#
+CT_PARALLEL_JOBS=1
+CT_LOAD=0
+CT_USE_PIPES=y
+CT_CONFIG_SHELL="custom"
+CT_CONFIG_SHELL_CUSTOM_PATH="/bin/sh"
+
+#
+# Logging
+#
+# CT_LOG_ERROR is not set
+# CT_LOG_WARN is not set
+# CT_LOG_INFO is not set
+CT_LOG_EXTRA=y
+# CT_LOG_ALL is not set
+# CT_LOG_DEBUG is not set
+CT_LOG_LEVEL_MAX="EXTRA"
+# CT_LOG_SEE_TOOLS_WARN is not set
+CT_LOG_PROGRESS_BAR=y
+CT_LOG_TO_FILE=y
+CT_LOG_FILE_COMPRESS=y
+
+#
+# Target options
+#
+CT_ARCH="blackfin"
+# CT_ARCH_SUPPORTS_BOTH_MMU is not set
+# CT_ARCH_SUPPORTS_BOTH_ENDIAN is not set
+CT_ARCH_SUPPORTS_32=y
+# CT_ARCH_SUPPORTS_64 is not set
+CT_ARCH_SUPPORT_ARCH=y
+# CT_ARCH_SUPPORT_ABI is not set
+CT_ARCH_SUPPORT_CPU=y
+CT_ARCH_SUPPORT_TUNE=y
+CT_ARCH_SUPPORT_FPU=y
+# CT_ARCH_DEFAULT_HAS_MMU is not set
+# CT_ARCH_DEFAULT_BE is not set
+CT_ARCH_DEFAULT_LE=y
+CT_ARCH_DEFAULT_32=y
+# CT_ARCH_DEFAULT_64 is not set
+CT_ARCH_ARCH=""
+CT_ARCH_CPU=""
+CT_ARCH_TUNE=""
+CT_ARCH_FPU=""
+# CT_ARCH_BE is not set
+# CT_ARCH_LE is not set
+CT_ARCH_32=y
+# CT_ARCH_64 is not set
+CT_ARCH_BITNESS=32
+CT_ARCH_FLOAT_HW=y
+# CT_ARCH_FLOAT_SW is not set
+CT_TARGET_CFLAGS=""
+CT_TARGET_LDFLAGS=""
+
+#
+# General target options
+#
+# CT_ARCH_alpha is not set
+# CT_ARCH_arm is not set
+# CT_ARCH_avr32 is not set
+CT_ARCH_blackfin=y
+# CT_ARCH_ia64 is not set
+# CT_ARCH_m68k is not set
+# CT_ARCH_mips is not set
+# CT_ARCH_powerpc is not set
+# CT_ARCH_s390 is not set
+# CT_ARCH_sh is not set
+# CT_ARCH_x86 is not set
+CT_ARCH_alpha_AVAILABLE=y
+# CT_ARCH_ALPHA_EV4 is not set
+# CT_ARCH_ALPHA_EV45 is not set
+# CT_ARCH_ALPHA_EV5 is not set
+# CT_ARCH_ALPHA_EV56 is not set
+# CT_ARCH_ALPHA_EV6 is not set
+# CT_ARCH_ALPHA_EV67 is not set
+CT_ARCH_arm_AVAILABLE=y
+# CT_ARCH_ARM_MODE_ARM is not set
+# CT_ARCH_ARM_MODE_THUMB is not set
+CT_ARCH_avr32_AVAILABLE=y
+CT_ARCH_blackfin_AVAILABLE=y
+CT_ARCH_ia64_AVAILABLE=y
+CT_ARCH_m68k_AVAILABLE=y
+CT_ARCH_mips_AVAILABLE=y
+CT_ARCH_powerpc_AVAILABLE=y
+CT_ARCH_s390_AVAILABLE=y
+CT_ARCH_sh_AVAILABLE=y
+# CT_ARCH_SH_SH3 is not set
+# CT_ARCH_SH_SH4 is not set
+# CT_ARCH_SH_SH4A is not set
+CT_ARCH_x86_AVAILABLE=y
+# CT_ARCH_USE_MMU is not set
+
+#
+# Target optimisations
+#
+
+#
+# Toolchain options
+#
+
+#
+# General toolchain options
+#
+CT_USE_SYSROOT=y
+CT_SYSROOT_DIR_PREFIX=""
+
+#
+# Tuple completion and aliasing
+#
+CT_TARGET_VENDOR="unknown"
+CT_TARGET_ALIAS_SED_EXPR=""
+CT_TARGET_ALIAS=""
+
+#
+# Toolchain type
+#
+# CT_NATIVE is not set
+CT_CROSS=y
+# CT_CROSS_NATIVE is not set
+# CT_CANADIAN is not set
+CT_TOOLCHAIN_TYPE="cross"
+
+#
+# Build system
+#
+CT_BUILD=""
+CT_BUILD_PREFIX=""
+CT_BUILD_SUFFIX=""
+
+#
+# Operating System
+#
+CT_BARE_METAL=y
+# CT_KERNEL_SUPPORTS_SHARED_LIBS is not set
+CT_KERNEL="bare-metal"
+CT_KERNEL_bare_metal=y
+# CT_KERNEL_linux is not set
+CT_KERNEL_bare_metal_AVAILABLE=y
+CT_KERNEL_linux_AVAILABLE=y
+
+#
+# Common kernel options
+#
+
+#
+# Binary utilities
+#
+CT_ARCH_BINFMT_ELF=y
+# CT_ARCH_BINFMT_FLAT is not set
+# CT_ARCH_BINFMT_FDPIC is not set
+
+#
+# GNU binutils
+#
+CT_BINUTILS_V_2_20=y
+# CT_BINUTILS_V_2_19_1 is not set
+# CT_BINUTILS_V_2_19 is not set
+# CT_BINUTILS_V_2_18 is not set
+# CT_BINUTILS_V_2_17 is not set
+# CT_BINUTILS_V_2_16_1 is not set
+CT_BINUTILS_VERSION="2.20"
+CT_BINUTILS_EXTRA_CONFIG=""
+
+#
+# sstrip
+#
+# CT_SSTRIP is not set
+
+#
+# C compiler
+#
+CT_CC="gcc"
+CT_CC_VERSION="4.4.3"
+CT_CC_gcc=y
+# CT_CC_V_4_5_0 is not set
+CT_CC_V_4_4_3=y
+# CT_CC_V_4_4_2 is not set
+# CT_CC_V_4_4_1 is not set
+# CT_CC_V_4_4_0 is not set
+# CT_CC_V_4_3_4 is not set
+# CT_CC_V_4_3_3 is not set
+# CT_CC_V_4_3_2 is not set
+# CT_CC_V_4_3_1 is not set
+# CT_CC_V_4_2_4 is not set
+# CT_CC_V_4_2_3 is not set
+# CT_CC_V_4_2_2 is not set
+# CT_CC_V_4_2_1 is not set
+# CT_CC_V_4_2_0 is not set
+# CT_CC_V_4_1_2 is not set
+# CT_CC_V_4_0_4 is not set
+# CT_CC_V_3_4_6 is not set
+CT_CC_GCC_4_2_or_later=y
+CT_CC_GCC_4_3_or_later=y
+CT_CC_GCC_4_4_or_later=y
+# CT_CC_GCC_4_5_or_later is not set
+CT_CC_GCC_USE_GMP_MPFR=y
+CT_CC_GCC_USE_PPL_CLOOG_MPC=y
+# CT_CC_GCC_USE_LIBELF is not set
+CT_CC_ENABLE_CXX_FLAGS=""
+CT_CC_CORE_EXTRA_CONFIG=""
+CT_CC_PKGVERSION="crosstool-NG-${CT_VERSION}"
+CT_CC_BUGURL=""
+CT_CC_SUPPORT_CXX=y
+CT_CC_SUPPORT_FORTRAN=y
+CT_CC_SUPPORT_JAVA=y
+CT_CC_SUPPORT_ADA=y
+CT_CC_SUPPORT_OBJC=y
+CT_CC_SUPPORT_OBJCXX=y
+
+#
+# Additional supported languages:
+#
+# CT_CC_LANG_CXX is not set
+
+#
+# C-library
+#
+CT_LIBC="newlib"
+CT_LIBC_VERSION="1.17.0"
+# CT_LIBC_eglibc is not set
+# CT_LIBC_glibc is not set
+CT_LIBC_newlib=y
+# CT_LIBC_none is not set
+# CT_LIBC_uClibc is not set
+CT_LIBC_eglibc_AVAILABLE=y
+CT_LIBC_glibc_AVAILABLE=y
+CT_LIBC_newlib_AVAILABLE=y
+# CT_LIBC_NEWLIB_V_1_18_0 is not set
+CT_LIBC_NEWLIB_V_1_17_0=y
+# CT_LIBC_NEWLIB_CVS is not set
+
+#
+# Architecture specific options
+#
+CT_LIBC_none_AVAILABLE=y
+CT_LIBC_uClibc_AVAILABLE=y
+# CT_LIBC_SUPPORT_NPTL is not set
+# CT_LIBC_SUPPORT_LINUXTHREADS is not set
+CT_THREADS="none"
+
+#
+# Common C library options
+#
+# CT_THREADS_NPTL is not set
+# CT_THREADS_LINUXTHREADS is not set
+CT_THREADS_NONE=y
+
+#
+# Debug facilities
+#
+# CT_DEBUG_gdb is not set
+
+#
+# Companion libraries
+#
+
+#
+# FIXME: check real dependencies!!!
+#
+CT_COMPLIBS=y
+# CT_WRAPPER_NEEDED is not set
+CT_GMP=y
+CT_MPFR=y
+CT_PPL=y
+CT_CLOOG=y
+CT_MPC=y
+# CT_GMP_V_5_0_1 is not set
+CT_GMP_V_4_3_2=y
+# CT_GMP_V_4_3_1 is not set
+# CT_GMP_V_4_3_0 is not set
+# CT_GMP_V_4_2_4 is not set
+# CT_GMP_V_4_2_2 is not set
+CT_GMP_VERSION="4.3.2"
+CT_MPFR_V_2_4_2=y
+# CT_MPFR_V_2_4_1 is not set
+# CT_MPFR_V_2_4_0 is not set
+# CT_MPFR_V_2_3_2 is not set
+# CT_MPFR_V_2_3_1 is not set
+CT_MPFR_VERSION="2.4.2"
+CT_PPL_V_0_10_2=y
+CT_PPL_VERSION="0.10.2"
+CT_CLOOG_V_0_15_9=y
+# CT_CLOOG_V_0_15_8 is not set
+# CT_CLOOG_V_0_15_7 is not set
+# CT_CLOOG_V_0_15_6 is not set
+# CT_CLOOG_V_0_15_5 is not set
+# CT_CLOOG_V_0_15_4 is not set
+# CT_CLOOG_V_0_15_3 is not set
+CT_CLOOG_VERSION="0.15.9"
+CT_MPC_V_0_8_1=y
+# CT_MPC_V_0_7 is not set
+# CT_MPC_V_0_6 is not set
+CT_MPC_VERSION="0.8.1"
+
+#
+# Companion libraries common options
+#
+# CT_COMPLIBS_CHECK is not set
+# CT_COMPLIBS_SHARED is not set
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
new file mode 100644
index 0000000..c16c132
--- /dev/null
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -0,0 +1,275 @@
+# Makefile fragment for building toolchain with crosstool-NG
+
+# As a reference, you can look at toolchain/toolchain-external/ext-tool.mk
+# for a generic approach to external toolchains.
+# crosstool-NG as a backend is but a kind of external toolchains,
+# except that it is not pre-built.
+
+#-----------------------------------------------------------------------------
+# 'uclibc' is the target to depend on to get the toolchain and prepare
+# the staging directory and co.
+uclibc: dependencies $(STAMP_DIR)/ct-ng-toolchain-installed
+
+#-----------------------------------------------------------------------------
+# Internal variables
+
+# Crostool-NG hard-coded configuration options
+CTNG_VERSION:=1.8.0
+CTNG_SITE:=http://ymorin.is-a-geek.org/download/crosstool-ng/
+CTNG_SOURCE:=crosstool-ng-$(CTNG_VERSION).tar.bz2
+CTNG_DIR:=$(BUILD_DIR)/crosstool-ng-$(CTNG_VERSION)
+CTNG_CAT:=bzcat
+CTNG_PATCH_DIR:=toolchain/toolchain-crosstool-ng
+CTNG_CONFIG_FILE:=$(call qstrip,$(BR2_TOOLCHAIN_CTNG_CONFIG))
+CTNG_UCLIBC_CONFIG_FILE := $(TOPDIR)/toolchain/toolchain-crosstool-ng/uClibc.config
+
+# Hack! ct-ng is in fact a Makefile script. As such, it accepts all
+# make options, such as -C, which makes it uneeded to chdir prior
+# to calling ct-ng.
+# $1: the set of arguments to pass to ct-ng
+define ctng
+$(CTNG_DIR)/ct-ng -C $(CTNG_DIR) --no-print-directory $(1)
+endef
+
+#-----------------------------------------------------------------------------
+# Installing the libs to target/ and staging/
+
+#--------------
+# The generic system libraries (in /lib)
+CTNG_LIBS_LIB := libc.so libcrypt.so libdl.so libgcc_s.so libm.so libnsl.so libpthread.so libresolv.so librt.so libutil.so
+
+#--------------
+# The libc-specific system libraries (in /lib)
+# Note: it may be needed to tweak the NSS libs in the glibc and eglibc cases...
+CTNG_LIBS_uClibc := ld-uClibc.so
+CTNG_LIBS_glibc  := ld-linux.so libnss_files.so libnss_dns.so
+CTNG_LIBS_eglibc := $(CTNG_LIBS_glibc)
+
+#--------------
+# All that we need in /lib
+CTNG_LIBS_LIB += $(CTNG_LIBS_$(call qstrip,$(BR2_TOOLCHAIN_CTNG_LIBC)))
+
+#--------------
+# All that we need in /usr/lib
+ifneq ($(BR2_INSTALL_LIBSTDCPP),)
+CTNG_LIBS_USR_LIB += libstdc++.so
+endif
+
+#--------------
+# Actual copy
+$(STAMP_DIR)/ct-ng-toolchain-installed: $(STAMP_DIR)/ct-ng-toolchain-built
+	$(Q)mkdir -p $(TARGET_DIR)/lib
+	$(Q)CTNG_TUPLE="$$( $(call ctng,show-tuple) )";                     \
+	    CTNG_SYSROOT="$(TOOLCHAIN_DIR)/$${CTNG_TUPLE}/sys-root";        \
+	    echo "CTNG_TUPLE='$${CTNG_TUPLE}'";                             \
+	    echo "CTNG_SYSROOT='$${CTNG_SYSROOT}'";                         \
+	    echo "Copy external toolchain libraries to target...";          \
+	    for libs in $(CTNG_LIBS_LIB); do                                \
+	        $(call copy_toolchain_lib_root,$${CTNG_SYSROOT},$$libs,/lib,$(BR2_TOOLCHAIN_CTNG_STRIP_LIBS)); \
+	    done;                                                           \
+	    for libs in $(CTNG_LIBS_USR_LIB); do                            \
+	        $(call copy_toolchain_lib_root,$${CTNG_SYSROOT},$$libs,/usr/lib,$(BR2_TOOLCHAIN_CTNG_STRIP_LIBS)); \
+	    done;                                                           \
+	    echo "Copy external toolchain sysroot to staging...";           \
+	    $(call copy_toolchain_sysroot,$${CTNG_SYSROOT},$${CTNG_SYSROOT},)
+	$(Q)touch $@
+
+#-----------------------------------------------------------------------------
+# Building the toolchain
+
+$(STAMP_DIR)/ct-ng-toolchain-built: $(CTNG_DIR)/.config
+	$(Q)$(call ctng,build.$(BR2_JLEVEL))
+	$(Q)printf "\n"
+	$(Q)touch $@
+
+#-----------------------------------------------------------------------------
+# Configuring the toolchain
+
+# Note: a lot of the following tricks would become unneeded if one day
+# buildroot and crosstool-NG had matching options, especially for the
+# target description: arch name, bitness, endianness...
+
+# Note-2: missing conformity check between BR's .config and libc features.
+# Use check_uclibc or check_glibc.
+
+#--------------
+# Massage BR2_ARCH so that it matches CT-NG's ARCH
+# Defaults:
+CTNG_ARCH   := $(CTNG_BR2_ARCH)
+CTNG_ENDIAN :=
+CTNG_BIT    :=
+# Architecture overides, only overide pertinent vars:
+ifeq      ($(BR2_arm),y)
+CTNG_ARCH   := arm
+CTNG_ENDIAN := LE
+else ifeq ($(BR2_armeb),y)
+CTNG_ARCH   := arm
+CTNG_ENDIAN := BE
+else ifeq ($(BR2_i386),y)
+CTNG_ARCH   := x86
+CTNG_BIT    := 32
+else ifeq ($(BR2_mips),y)
+CTNG_ARCH   := mips
+CTNG_ENDIAN := BE
+else ifeq ($(BR2_mipsel),y)
+CTNG_ARCH   := mips
+CTNG_ENDIAN := LE
+else ifeq ($(BR2_powerpc),y)
+CTNG_BIT    := 32
+else ifeq ($(BR2_x86_64),y)
+CTNG_ARCH   := x86
+CTNG_BIT    := 64
+# Add other architecture overides below:
+#  - keep alphabetic order
+#  - duplicate next 4 lines, and uncomment
+#       else ifeq ($(BR2_<arch_name_here>),y)
+#       CTNG_ARCH   :=
+#       CTNG_ENDIAN :=
+#       CTNG_BIT    :=
+#  - remove unneeded vars
+#  - add BR arch-name on ifeq line
+#  - fill-in required CTNG_* vars
+endif
+
+#--------------
+# Massage BR options into CTNG .config file
+# CT_ARCH                   : handled by the backend mechanism
+# CT_ARCH_[BL]E             : endianness
+# CT_ARCH_(32|64)           : bitness
+# CT_PREFIX_DIR             : install into BR's toolchain dir
+# CT_INSTALL_DIR_RO         : do *not* chmod a-w the toolchain dir
+# CT_LOCAL_TARBALLS_DIR     : share downloads with BR
+# CT_SYSROOT_DIR_PREFIX     : no prefix needed, really
+# CT_TARGET_VENDOR          : try to set a unique vendor string, to avoid clashing with BR's vendor string
+# CT_TARGET_ALIAS           : set the target tuple alias to REAL_GNU_TARGET_NAME so that packages' ./configure find the compiler
+# CT_DEBUG_gdb              : deselect gdb+gdbserver if buildroot builds its own
+# CT_CC_LANG_CXX            : required if we copy libstdc++.so, and build C++
+# CT_LIBC_UCLIBC_CONFIG_FILE: uClibc config file, if needed
+#
+# Lots of other awfull sed manipulations go here, to override CT-NG's .config
+# with BR2 config options.
+# Known missing: arch variant & options, floating point (HW/SW), uClibc/eglibc config...
+#
+
+CTNG_FIX_DOT_CONFIG_SED :=
+CTNG_FIX_DOT_CONFIG_SED += s:^(CT_INSTALL_DIR_RO)=y:\# \1 is not set:;
+CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_ARCH_[BL]E).*:\# \2 is not set:;
+CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_ARCH_$(CTNG_ENDIAN)) is not set:\1=y:;
+CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_ARCH_(32|64)).*:\# \2 is not set:;
+CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_ARCH_$(CTNG_BIT)) is not set:\1=y:;
+CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_ARCH_USE_MMU) is not set:\1=y:;
+CTNG_FIX_DOT_CONFIG_SED += s:^(CT_TARGET_VENDOR)=.*:\1="buildroot_ctng":;
+CTNG_FIX_DOT_CONFIG_SED += s:^(CT_TARGET_ALIAS)=.*:\1="$(REAL_GNU_TARGET_NAME)":;
+CTNG_FIX_DOT_CONFIG_SED += s:^(CT_CC_PKGVERSION)="(.*)":\1="crosstool-NG $(CTNG_VERSION) - buildroot $(call qstrip,$(BR2_VERSION))":;
+ifneq ($(call qstrip,$(BR2_PACKAGE_GDB_SERVER))$(call qstrip,$(BR2_PACKAGE_GDB_HOST)),)
+CTNG_FIX_DOT_CONFIG_SED += s:^(CT_DEBUG_gdb)=.*:\# \1 is not set:;
+endif
+ifneq ($(call qstrip,$(BR2_INSTALL_LIBSTDCPP)),)
+CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_CC_LANG_CXX) is not set:\1=y:;
+else
+CTNG_FIX_DOT_CONFIG_SED += s:^(CT_CC_LANG_CXX)=.*:\# \1 is not set:;
+endif
+
+#--------------
+# And the specials for paths
+CTNG_FIX_DOT_CONFIG_PATHS_SED :=
+CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_PREFIX_DIR)=.*:\1="$(TOOLCHAIN_DIR)":;
+CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_LOCAL_TARBALLS_DIR)=.*:\1="$(DL_DIR)":;
+CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_SYSROOT_DIR_PREFIX)=.*:\1="":;
+ifeq ($(BR2_TOOLCHAIN_CTNG_uClibc),y)
+CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_LIBC_UCLIBC_CONFIG_FILE)=.*:\1="$(CTNG_UCLIBC_CONFIG_FILE)":;
+endif
+
+#--------------
+# Small functions to shoe-horn the above into crosstool-NG's .config
+# $1: the .config file to munge
+# $2: the sed expression to apply
+define ctng-fix-dot-config
+	$(Q)sed -r -e '$(2)' $(1) >$(1).sed
+	$(Q)cmp $(1) $(1).sed >/dev/null 2>&1 && rm -f $(1).sed || mv -f $(1).sed $(1)
+endef
+
+# Function to update the .config
+# We first munge the .config to shoe-horn defaults, then we push that unto
+# crosstool-NG's oldconfig process, to sort out wizy-wazy deps, and then we
+# shoe-horn paths again, as they get ripped-out by oldconfig (is that a bug
+# or a feature of kconfig?)
+# $1: the .config file to munge
+define ctng-oldconfig
+	$(call ctng-fix-dot-config,$(1),$(CTNG_FIX_DOT_CONFIG_SED))
+	$(Q)yes ''                                             |\
+	$(call ctng,CT_IS_A_BACKEND=y                           \
+	            CT_BACKEND_ARCH=$(CTNG_ARCH)                \
+	            CT_BACKEND_KERNEL=linux                     \
+	            CT_BACKEND_LIBC=$(BR2_TOOLCHAIN_CTNG_LIBC)  \
+	            oldconfig                                   )
+	$(call ctng-fix-dot-config,$(1),$(CTNG_FIX_DOT_CONFIG_PATHS_SED))
+endef
+
+# This function checks the confguration of the toolchain did actually change
+# If not changed, then current .config will be touched with reference to the
+# stamp file. If the configuration did change, nothing is done.
+# $1: the current .config to check
+# $2: the time-stamped .config file
+define ctng-check-config-changed
+	$(Q)old_md5="$$( grep -v -E '^(#|$$)' $(2) 2>/dev/null  \
+	                 |md5sum                                \
+	                 |cut -d ' ' -f 1                       \
+	               )";                                      \
+	    new_md5="$$( grep -v -E '^(#|$$)' $(1) 2>/dev/null  \
+	                 |md5sum                                \
+	                 |cut -d ' ' -f 1                       \
+	               )";                                      \
+	    if [ $${old_md5} = $${new_md5} -a -f $(2) ]; then   \
+	        touch -r $(2) $(1);                             \
+	    fi
+endef
+
+# Default configuration
+# Depends on top-level .config because it has options we have to shoe-horn
+# into crosstool-NG's .config
+# Only copy the original .config file if we don't have one already
+$(CTNG_DIR)/.config: $(CTNG_CONFIG_FILE) $(CTNG_DIR)/ct-ng $(CONFIG_DIR)/.config
+	$(Q)[ -f $@ ] && cp -a $@ $@.timestamp || cp -f $< $@
+	$(call ctng-oldconfig,$@)
+	$(call ctng-check-config-changed,$@,$@.timestamp)
+	$(Q)rm -f $@.timestamp
+
+# Manual configuration
+ctng-menuconfig: $(CTNG_DIR)/.config
+	$(Q)cp -a $< $<.timestamp
+	$(Q)$(call ctng,CT_IS_A_BACKEND=y                           \
+	                CT_BACKEND_ARCH=$(CTNG_ARCH)                \
+	                CT_BACKEND_KERNEL=linux                     \
+	                CT_BACKEND_LIBC=$(BR2_TOOLCHAIN_CTNG_LIBC)  \
+	                menuconfig                                  )
+	$(call ctng-oldconfig,$<)
+	$(call ctng-check-config-changed,$<,$<.timestamp)
+	$(Q)rm -f $<.timestamp
+
+#-----------------------------------------------------------------------------
+# Retrieving, configuring and building crosstool-NG (as a package)
+
+$(CTNG_DIR)/ct-ng: $(CTNG_DIR)/.configured
+	$(Q)$(MAKE) -C $(CTNG_DIR) --no-print-directory
+	$(Q)touch $@
+
+$(CTNG_DIR)/.configured: $(CTNG_DIR)/.patched
+	$(Q)cd $(CTNG_DIR) && ./configure --local
+	$(Q)touch $@
+
+$(CTNG_DIR)/.patched: $(CTNG_DIR)/.unpacked
+	$(Q)toolchain/patch-kernel.sh $(CTNG_DIR)       \
+	                              $(CTNG_PATCH_DIR) \
+	                              \*.patch          \
+	                              \*.patch.$(ARCH)
+	$(Q)touch $@
+
+$(CTNG_DIR)/.unpacked: $(DL_DIR)/$(CTNG_SOURCE)
+	$(Q)rm -rf $(CTNG_DIR)
+	$(Q)mkdir -p $(BUILD_DIR)
+	$(Q)$(CTNG_CAT) $(DL_DIR)/$(CTNG_SOURCE) |tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(Q)touch $@
+
+$(DL_DIR)/$(CTNG_SOURCE):
+	$(Q)$(call DOWNLOAD,$(CTNG_SITE),$(CTNG_SOURCE))
diff --git a/toolchain/uClibc/uClibc-0.9.30.config b/toolchain/toolchain-crosstool-ng/uClibc.config
similarity index 79%
copy from toolchain/uClibc/uClibc-0.9.30.config
copy to toolchain/toolchain-crosstool-ng/uClibc.config
index 2202b9e..f1163ae 100644
--- a/toolchain/uClibc/uClibc-0.9.30.config
+++ b/toolchain/toolchain-crosstool-ng/uClibc.config
@@ -1,5 +1,7 @@
 #
 # Automatically generated make config: don't edit
+# Version: 0.9.30
+# Fri Nov 21 09:26:34 2008
 #
 # TARGET_alpha is not set
 # TARGET_arm is not set
@@ -24,18 +26,42 @@
 # TARGET_sparc is not set
 # TARGET_v850 is not set
 # TARGET_vax is not set
-# TARGET_x86_64 is not set
+TARGET_x86_64=y
 # TARGET_xtensa is not set
 
 #
 # Target Architecture Features and Options
 #
-TARGET_ARCH="none"
+TARGET_ARCH="x86_64"
 FORCE_OPTIONS_FOR_ARCH=y
-# ARCH_LITTLE_ENDIAN is not set
-# ARCH_BIG_ENDIAN is not set
-# ARCH_WANTS_LITTLE_ENDIAN is not set
+# CONFIG_ARM_OABI is not set
+# CONFIG_ARM_EABI is not set
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_CORTEX_M3 is not set
+# CONFIG_ARM_CORTEX_M1 is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+# CONFIG_ARM_XSCALE is not set
+# CONFIG_ARM_IWMMXT is not set
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_LITTLE_ENDIAN=y
 # ARCH_WANTS_BIG_ENDIAN is not set
+# ARCH_WANTS_LITTLE_ENDIAN is not set
 
 #
 # Using Little Endian
@@ -45,9 +71,9 @@ ARCH_USE_MMU=y
 UCLIBC_HAS_FLOATS=y
 UCLIBC_HAS_FPU=y
 DO_C99_MATH=y
-# UCLIBC_HAS_FENV is not set
+UCLIBC_HAS_FENV=y
 UCLIBC_HAS_LONG_DOUBLE_MATH=y
-KERNEL_HEADERS="/usr/src/linux/include"
+KERNEL_HEADERS="/usr/include"
 HAVE_DOT_CONFIG=y
 
 #
@@ -58,12 +84,13 @@ DOPIC=y
 # ARCH_HAS_NO_SHARED is not set
 # ARCH_HAS_NO_LDSO is not set
 HAVE_SHARED=y
-FORCE_SHAREABLE_TEXT_SEGMENTS=y
+# FORCE_SHAREABLE_TEXT_SEGMENTS is not set
 LDSO_LDD_SUPPORT=y
-# LDSO_CACHE_SUPPORT is not set
+LDSO_CACHE_SUPPORT=y
 # LDSO_PRELOAD_FILE_SUPPORT is not set
-# UCLIBC_STATIC_LDCONFIG is not set
-LDSO_RUNPATH=y
+LDSO_BASE_FILENAME="ld.so"
+UCLIBC_STATIC_LDCONFIG=y
+# LDSO_RUNPATH is not set
 UCLIBC_CTOR_DTOR=y
 # LDSO_GNU_HASH_SUPPORT is not set
 # HAS_NO_THREADS is not set
@@ -75,7 +102,7 @@ UCLIBC_HAS_LFS=y
 # MALLOC is not set
 # MALLOC_SIMPLE is not set
 MALLOC_STANDARD=y
-MALLOC_GLIBC_COMPAT=y
+# MALLOC_GLIBC_COMPAT is not set
 UCLIBC_DYNAMIC_ATEXIT=y
 # COMPAT_ATEXIT is not set
 # UCLIBC_SUSV3_LEGACY is not set
@@ -83,11 +110,10 @@ UCLIBC_DYNAMIC_ATEXIT=y
 # UCLIBC_HAS_STUBS is not set
 UCLIBC_HAS_SHADOW=y
 # UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
-UCLIBC_HAS___PROGNAME=y
 UCLIBC_HAS_PTY=y
 ASSUME_DEVPTS=y
 UNIX98PTY_ONLY=y
-UCLIBC_HAS_GETPT=y
+# UCLIBC_HAS_GETPT is not set
 UCLIBC_HAS_TM_EXTENSIONS=y
 UCLIBC_HAS_TZ_CACHING=y
 UCLIBC_HAS_TZ_FILE=y
@@ -99,7 +125,6 @@ UCLIBC_TZ_FILE_PATH="/etc/TZ"
 #
 UCLIBC_PWD_BUFFER_SIZE=256
 UCLIBC_GRP_BUFFER_SIZE=256
-UCLIBC_HAS_NONREENTRANT=y
 
 #
 # Support various families of functions
@@ -107,7 +132,7 @@ UCLIBC_HAS_NONREENTRANT=y
 UCLIBC_LINUX_MODULE_24=y
 UCLIBC_LINUX_SPECIFIC=y
 UCLIBC_HAS_GNU_ERROR=y
-UCLIBC_BSD_SPECIFIC=y
+# UCLIBC_BSD_SPECIFIC is not set
 UCLIBC_HAS_BSD_ERR=y
 # UCLIBC_HAS_OBSOLETE_BSD_SIGNAL is not set
 # UCLIBC_HAS_OBSOLETE_SYSV_SIGNAL is not set
@@ -124,17 +149,17 @@ UCLIBC_HAS_NETWORK_SUPPORT=y
 UCLIBC_HAS_SOCKET=y
 UCLIBC_HAS_IPV4=y
 # UCLIBC_HAS_IPV6 is not set
-# UCLIBC_HAS_RPC is not set
-# UCLIBC_HAS_FULL_RPC is not set
-# UCLIBC_HAS_REENTRANT_RPC is not set
+UCLIBC_HAS_RPC=y
+UCLIBC_HAS_FULL_RPC=y
+UCLIBC_HAS_REENTRANT_RPC=y
 UCLIBC_USE_NETLINK=y
-# UCLIBC_SUPPORT_AI_ADDRCONFIG is not set
+UCLIBC_SUPPORT_AI_ADDRCONFIG=y
 # UCLIBC_HAS_BSD_RES_CLOSE is not set
 
 #
 # String and Stdio Support
 #
-# UCLIBC_HAS_STRING_GENERIC_OPT is not set
+UCLIBC_HAS_STRING_GENERIC_OPT=y
 UCLIBC_HAS_STRING_ARCH_OPT=y
 UCLIBC_HAS_CTYPE_TABLES=y
 UCLIBC_HAS_CTYPE_SIGNED=y
@@ -143,11 +168,11 @@ UCLIBC_HAS_CTYPE_SIGNED=y
 UCLIBC_HAS_CTYPE_ENFORCED=y
 # UCLIBC_HAS_WCHAR is not set
 # UCLIBC_HAS_LOCALE is not set
-UCLIBC_HAS_HEXADECIMAL_FLOATS=y
+# UCLIBC_HAS_HEXADECIMAL_FLOATS is not set
 UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
 # USE_OLD_VFPRINTF is not set
 UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
-UCLIBC_HAS_SCANF_GLIBC_A_FLAG=y
+# UCLIBC_HAS_SCANF_GLIBC_A_FLAG is not set
 # UCLIBC_HAS_STDIO_BUFSIZ_NONE is not set
 # UCLIBC_HAS_STDIO_BUFSIZ_256 is not set
 # UCLIBC_HAS_STDIO_BUFSIZ_512 is not set
@@ -159,53 +184,47 @@ UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
 # UCLIBC_HAS_STDIO_BUILTIN_BUFFER_4 is not set
 # UCLIBC_HAS_STDIO_BUILTIN_BUFFER_8 is not set
 # UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT is not set
-# UCLIBC_HAS_STDIO_GETC_MACRO is not set
-# UCLIBC_HAS_STDIO_PUTC_MACRO is not set
+UCLIBC_HAS_STDIO_GETC_MACRO=y
+UCLIBC_HAS_STDIO_PUTC_MACRO=y
 UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
 # UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
-UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
-UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
+# UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE is not set
+# UCLIBC_HAS_GLIBC_CUSTOM_STREAMS is not set
 UCLIBC_HAS_PRINTF_M_SPEC=y
 UCLIBC_HAS_ERRNO_MESSAGES=y
 # UCLIBC_HAS_SYS_ERRLIST is not set
 UCLIBC_HAS_SIGNUM_MESSAGES=y
 # UCLIBC_HAS_SYS_SIGLIST is not set
 UCLIBC_HAS_GNU_GETOPT=y
-# UCLIBC_HAS_GNU_GETSUBOPT is not set
+UCLIBC_HAS_GNU_GETSUBOPT=y
 
 #
 # Big and Tall
 #
 UCLIBC_HAS_REGEX=y
-# UCLIBC_HAS_REGEX_OLD is not set
+UCLIBC_HAS_REGEX_OLD=y
 UCLIBC_HAS_FNMATCH=y
-# UCLIBC_HAS_FNMATCH_OLD is not set
+UCLIBC_HAS_FNMATCH_OLD=y
 # UCLIBC_HAS_WORDEXP is not set
-UCLIBC_HAS_FTW=y
+# UCLIBC_HAS_FTW is not set
 UCLIBC_HAS_GLOB=y
 UCLIBC_HAS_GNU_GLOB=y
 
 #
 # Library Installation Options
 #
-SHARED_LIB_LOADER_PREFIX="/lib"
-RUNTIME_PREFIX="/"
-DEVEL_PREFIX="/usr/"
+SHARED_LIB_LOADER_PREFIX="$(RUNTIME_PREFIX)lib"
+RUNTIME_PREFIX="/usr/$(TARGET_ARCH)-linux-uclibc/"
+DEVEL_PREFIX="/usr/$(TARGET_ARCH)-linux-uclibc/usr/"
 
 #
 # Security options
 #
-# UCLIBC_BUILD_PIE is not set
 # UCLIBC_HAS_ARC4RANDOM is not set
 # HAVE_NO_SSP is not set
-UCLIBC_HAS_SSP=y
-# UCLIBC_HAS_SSP_COMPAT is not set
-# SSP_QUICK_CANARY is not set
-PROPOLICE_BLOCK_ABRT=y
-# PROPOLICE_BLOCK_SEGV is not set
-# UCLIBC_BUILD_SSP is not set
+# UCLIBC_HAS_SSP is not set
 UCLIBC_BUILD_RELRO=y
-UCLIBC_BUILD_NOW=y
+# UCLIBC_BUILD_NOW is not set
 UCLIBC_BUILD_NOEXECSTACK=y
 
 #
@@ -215,7 +234,7 @@ CROSS_COMPILER_PREFIX=""
 UCLIBC_EXTRA_CFLAGS=""
 # DODEBUG is not set
 # DODEBUG_PT is not set
-DOSTRIP=y
+# DOSTRIP is not set
 # DOASSERTS is not set
 # SUPPORT_LD_DEBUG is not set
 # SUPPORT_LD_DEBUG_EARLY is not set
@@ -224,24 +243,3 @@ WARNINGS="-Wall"
 # EXTRA_WARNINGS is not set
 # DOMULTI is not set
 # UCLIBC_MJN3_ONLY is not set
-
-# USE_BX is not set
-# CONFIG_GENERIC_ARM is not set
-# CONFIG_ARM610 is not set
-# CONFIG_ARM710 is not set
-# CONFIG_ARM7TDMI is not set
-# CONFIG_ARM720T is not set
-# CONFIG_ARM920T is not set
-# CONFIG_ARM922T is not set
-# CONFIG_ARM926T is not set
-# CONFIG_ARM10T is not set
-# CONFIG_ARM1136JF_S is not set
-# CONFIG_ARM1176JZ_S is not set
-# CONFIG_ARM1176JZF_S is not set
-# CONFIG_ARM_CORTEX_M3 is not set
-# CONFIG_ARM_CORTEX_M1 is not set
-# CONFIG_ARM_SA110 is not set
-# CONFIG_ARM_SA1100 is not set
-# CONFIG_ARM_XSCALE is not set
-# CONFIG_ARM_IWMMXT is not set
-
-- 
1.7.1
