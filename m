From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 10 May 2010 01:11:31 +0200
Subject: [Buildroot] [PATCH 6/6] toolchain: add new toolchain backend:
	crosstool-NG
In-Reply-To: <20100509230759.16258.48956.stgit@roazhon.bzh.lan>
References: <20100509230759.16258.48956.stgit@roazhon.bzh.lan>
Message-ID: <20100509231131.16258.82446.stgit@roazhon.bzh.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>

Signed-off-by: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
---
 Makefile                                           |    4 
 toolchain/Config.in                                |    4 
 toolchain/toolchain-crosstool-NG.mk                |   16 +
 toolchain/toolchain-crosstool-NG/Config.in         |   53 +++
 .../toolchain-crosstool-NG/crosstool-NG.config     |  360 ++++++++++++++++++++
 toolchain/toolchain-crosstool-NG/crosstool-NG.mk   |  118 +++++++
 6 files changed, 554 insertions(+), 1 deletions(-)
 create mode 100644 toolchain/toolchain-crosstool-NG.mk
 create mode 100644 toolchain/toolchain-crosstool-NG/Config.in
 create mode 100644 toolchain/toolchain-crosstool-NG/crosstool-NG.config
 create mode 100644 toolchain/toolchain-crosstool-NG/crosstool-NG.mk

diff --git a/Makefile b/Makefile
index 0559a34..845e260 100644
--- a/Makefile
+++ b/Makefile
@@ -201,7 +201,7 @@ PREFERRED_LIB_FLAGS:=--enable-static --enable-shared
 ##############################################################
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 BASE_TARGETS:=uclibc-configured binutils cross_compiler uclibc-target-utils kernel-headers
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
+else
 BASE_TARGETS:=toolchain-prepare
 endif
 TARGETS:=
@@ -294,6 +294,8 @@ ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 include toolchain/toolchain-buildroot.mk
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 include toolchain/toolchain-external.mk
+else ifeq ($(BR2_TOOLCHAIN_CTNG),y)
+include toolchain/toolchain-crosstool-NG.mk
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX),y)
diff --git a/toolchain/Config.in b/toolchain/Config.in
index fc9a048..819ae50 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -14,10 +14,14 @@ config BR2_TOOLCHAIN_BUILDROOT
 config BR2_TOOLCHAIN_EXTERNAL
 	bool "External toolchain"
 
+config BR2_TOOLCHAIN_CTNG
+	bool "Crosstool-NG toolchain"
+
 endchoice
 
 source "toolchain/toolchain-buildroot/Config.in"
 source "toolchain/toolchain-external/Config.in"
+source "toolchain/toolchain-crosstool-NG/Config.in
 source "toolchain/toolchain-common.in"
 source "toolchain/toolchain-buildroot/Config.in.2"
 source "toolchain/toolchain-external/Config.in.2"
diff --git a/toolchain/toolchain-crosstool-NG.mk b/toolchain/toolchain-crosstool-NG.mk
new file mode 100644
index 0000000..c5807a8
--- /dev/null
+++ b/toolchain/toolchain-crosstool-NG.mk
@@ -0,0 +1,16 @@
+# Required includes for the external toolchain backend
+
+# Explicit ordering:
+include toolchain/helpers.mk
+include toolchain/binutils/binutils.mk
+include toolchain/ccache/ccache.mk
+include toolchain/dependencies/dependencies.mk
+include toolchain/elf2flt/elf2flt.mk
+include toolchain/gcc/gcc-uclibc-3.x.mk
+include toolchain/gcc/gcc-uclibc-4.x.mk
+include toolchain/gdb/gdb.mk
+include toolchain/toolchain-crosstool-NG/crosstool-NG.mk
+include toolchain/mklibs/mklibs.mk
+include toolchain/sstrip/sstrip.mk
+include toolchain/toolchain-external/ext-tool.mk
+include toolchain/uClibc/uclibc.mk
diff --git a/toolchain/toolchain-crosstool-NG/Config.in b/toolchain/toolchain-crosstool-NG/Config.in
new file mode 100644
index 0000000..60ba0ab
--- /dev/null
+++ b/toolchain/toolchain-crosstool-NG/Config.in
@@ -0,0 +1,53 @@
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
+    default "toolchain/toolchain-crosstool-NG/crosstool-NG.config"
+    help
+      Enter here the crosstool-NG's .config file to use.
+      If unsure, use the default.
+      To finely tune your toolchain, you can also call:
+        make ctng-menuconfig
+
+endif # BR2_TOOLCHAIN_CTNG
diff --git a/toolchain/toolchain-crosstool-NG/crosstool-NG.config b/toolchain/toolchain-crosstool-NG/crosstool-NG.config
new file mode 100644
index 0000000..4df366d
--- /dev/null
+++ b/toolchain/toolchain-crosstool-NG/crosstool-NG.config
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
+CT_INSTALL_DIR_RO=y
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
diff --git a/toolchain/toolchain-crosstool-NG/crosstool-NG.mk b/toolchain/toolchain-crosstool-NG/crosstool-NG.mk
new file mode 100644
index 0000000..3d9409b
--- /dev/null
+++ b/toolchain/toolchain-crosstool-NG/crosstool-NG.mk
@@ -0,0 +1,118 @@
+# Makefile fragment for building toolchain with crosstool-NG
+
+# As a reference, you can look at toolchain/toolchain-external/ext-tool.mk
+# for a generic approach to external toolchains.
+# crosdtool-NG as a backend is but a kind of external toolchains,
+# except that it is not pre-built.
+
+#-----------------------------------------------------------------------------
+# toolchain-prepare is the target to depend on to get the toolchain
+# and prepare staging and co.
+toolchain-prepare: dependencies $(STAMP_DIR)/ct-ng-toolchain-installed
+
+#-----------------------------------------------------------------------------
+# Internal variables
+
+# Crostool-NG hard-coded configuration options
+CTNG_VERSION:=1.7.0
+CTNG_SITE:=http://ymorin.is-a-geek.org/download/crosstool-ng/
+CTNG_SOURCE:=crosstool-ng-$(CTNG_VERSION).tar.bz2
+CTNG_DIR:=$(BUILD_DIR)/crosstool-ng-$(CTNG_VERSION)
+CTNG_CAT:=bzcat
+CTNG_PATCH_DIR:=toolchain/toolchain-crosstool-NG
+CTNG_CONFIG_FILE:=$(call qstrip,$(BR2_TOOLCHAIN_CTNG_CONFIG))
+
+# Hack! ct-ng is in fact a Makefile script. As such, it accepts all
+# make options, such as -C, which makes it uneeded to chdir prior
+# to calling ct-ng.
+CTNG:=$(CTNG_DIR)/ct-ng -C $(CTNG_DIR) --no-print-directory
+
+# The 'system' libraries
+# Note: it may be needed to tweak the NSS libs in the glibc and eglibc cases...
+CTNG_LIBS := EXTERNAL_LIBS=libc.so libcrypt.so libdl.so libgcc_s.so libm.so libnsl.so libpthread.so libresolv.so librt.so libutil.so
+
+ifeq       ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_LIBC)),uClibc)
+  CTNG_LIBS += ld-uClibc.so
+else ifeq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_LIBC)),eglibc)
+  CTNG_LIBS += ld-linux.so libnss_files.so libnss_dns.so
+else ifeq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_LIBC)),glibc)
+  CTNG_LIBS += ld-linux.so libnss_files.so libnss_dns.so
+endif
+
+# YEM: This will have to be tested only after crosstool-NG has been configured.
+ifneq ($(shell grep -E '^CT_CC_LANG_CXX=y$$' $(CTNG_DIR)/.config 2>/dev/null),)
+  CTNG_LIBS += libstdc++.so
+endif
+
+#-----------------------------------------------------------------------------
+# Building the toolchain with crosstool-NG
+
+# YEM: needs to set up a proper uClibc .config file
+$(STAMP_DIR)/ct-ng-toolchain-installed: $(CTNG_DIR)/.config $(CTNG_DIR)/ct-ng
+	$(Q)$(CTNG) build.$(BR2_JLEVEL)
+	$(Q)touch $@
+#	$(Q)CTNG_TUPLE=$$( $(CTNG) show-tuple );                                \
+#	    CTNG_SYSROOT=$$( true )
+
+#-----------------------------------------------------------------------------
+# Configuring the toolchain via crosstool-NG
+
+# Massage BR2_ARCH so that it matches CT-NG's ARCH          YEM: MISSING!
+CTNG_ARCH:=$(call qstrip,$(BR2_ARCH))
+CTNG_LIBC:=$(call qstrip,$(BR2_TOOLCHAIN_CTNG_LIBC))
+
+# Massage BR options into CTNG .config file
+define fix-ctng-dot-config
+	$(Q)sed -r -i -e 's:^(CT_PREFIX_DIR)=.*:\1="$(TOOLCHAIN_DIR)":;' $1
+	$(Q)sed -r -i -e 's:^(CT_LOCAL_TARBALLS_DIR)=.*:\1="$(DL_DIR)":;' $1
+endef
+# Lots of other awfull sed manipulations go here, to        YEM: MISSING!
+# override CT-NG's .config with BR2 config options
+# Known missing: MMU, endianness, bitness...
+
+# Default configuration
+$(CTNG_DIR)/.config: $(CTNG_CONFIG_FILE) $(CTNG_DIR)/ct-ng .config
+	$(Q)cp -f $< $@
+	$(Q)yes ''                                         |\
+	$(CTNG) CT_IS_A_BACKEND=y                           \
+	        CT_BACKEND_ARCH=$(CTNG_ARCH)                \
+	        CT_BACKEND_KERNEL=linux                     \
+	        CT_BACKEND_LIBC=$(BR2_TOOLCHAIN_CTNG_LIBC)  \
+	        oldconfig
+	$(call fix-ctng-dot-config,$@)
+
+# Manual configuration
+ctng-menuconfig: $(CTNG_DIR)/.config
+	$(Q)$(CTNG) CT_IS_A_BACKEND=y               \
+	            CT_BACKEND_ARCH=$(CTNG_ARCH)    \
+	            CT_BACKEND_KERNEL=linux         \
+	            CT_BACKEND_LIBC=$(CTNG_LIBC)	\
+	            menuconfig
+	$(call fix-ctng-dot-config,$<)
+
+#-----------------------------------------------------------------------------
+# Retrieving, configuring and building crosstool-NG
+
+$(CTNG_DIR)/ct-ng: $(CTNG_DIR)/.configured
+	$(Q)make -C $(CTNG_DIR) --no-print-directory
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
