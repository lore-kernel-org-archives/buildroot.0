From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Dec 2010 17:27:39 +0100
Subject: [Buildroot] [PATCH 03/14] toolchain: add support for external
	toolchain profiles and download
In-Reply-To: <cover.1292257643.git.thomas.petazzoni@free-electrons.com>
References: <cover.1292257643.git.thomas.petazzoni@free-electrons.com>
Message-ID: <bf29c83b99bbc83aa389f2960819e87b900904ab.1292257643.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of letting the user define all the details of his external
toolchain, we define a set of profiles for well-known external
toolchains (CodeSourcery ones only at the moment, can easily be
extended with other toolchains).

Once a profile has been choosen, the user is offered the choice of
either letting Buildroot download and install the external toolchain,
or (as before) to tell Buildroot where the toolchain is installed on
the system.

We of course provide a "custom profile", through which the user can
configure Buildroot to use a custom external toolchain for which no
profile is available.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                                 |    3 +-
 package/Makefile.in                      |   10 +-
 toolchain/Config.in                      |    5 +-
 toolchain/toolchain-external/Config.in   |  168 ++++++++++++++++++++++--
 toolchain/toolchain-external/Config.in.2 |   17 ---
 toolchain/toolchain-external/ext-tool.mk |  210 +++++++++++++++++++++---------
 6 files changed, 315 insertions(+), 98 deletions(-)
 delete mode 100644 toolchain/toolchain-external/Config.in.2

diff --git a/Makefile b/Makefile
index 7d6e4af..f6ab07e 100644
--- a/Makefile
+++ b/Makefile
@@ -279,6 +279,7 @@ STAMP_DIR:=$(BASE_DIR)/stamps
 BINARIES_DIR:=$(BASE_DIR)/images
 TARGET_DIR:=$(BASE_DIR)/target
 TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
+TOOLCHAIN_EXTERNAL_DIR=$(BASE_DIR)/external-toolchain
 TARGET_SKELETON=$(TOPDIR)/fs/skeleton
 
 BR2_DEPENDS_DIR=$(BUILD_DIR)/buildroot-config
@@ -600,7 +601,7 @@ endif
 
 clean:
 	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
-		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR)
+		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR) $(TOOLCHAIN_EXTERNAL_DIR)
 
 distclean: clean
 ifeq ($(DL_DIR),$(TOPDIR)/dl)
diff --git a/package/Makefile.in b/package/Makefile.in
index d448a7e..36bd59f 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -114,13 +114,13 @@ REAL_GNU_TARGET_NAME=$(ARCH)-unknown-linux-$(LIBC)$(ABI)
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 TARGET_CROSS=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
-TOOLCHAIN_EXTERNAL_PREFIX:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
-TOOLCHAIN_EXTERNAL_PATH:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
-ifneq ($(TOOLCHAIN_EXTERNAL_PATH),)
-TARGET_CROSS=$(TOOLCHAIN_EXTERNAL_PATH)/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-
+TOOLCHAIN_EXTERNAL_PREFIX=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
+TOOLCHAIN_EXTERNAL_LOCATION=$(TOOLCHAIN_EXTERNAL_DIR)
 else
-TARGET_CROSS=$(TOOLCHAIN_EXTERNAL_PREFIX)-
+TOOLCHAIN_EXTERNAL_LOCATION=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
 endif
+TARGET_CROSS=$(TOOLCHAIN_EXTERNAL_LOCATION)/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-
 else ifeq ($(BR2_TOOLCHAIN_CTNG),y)
 TARGET_CROSS=$(TOOLCHAIN_DIR)/bin/$(REAL_GNU_TARGET_NAME)-
 endif
diff --git a/toolchain/Config.in b/toolchain/Config.in
index d476cbf..8baa0c1 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -13,6 +13,10 @@ config BR2_TOOLCHAIN_BUILDROOT
 
 config BR2_TOOLCHAIN_EXTERNAL
 	bool "External toolchain"
+	help
+	  Select if you want to use an existing cross-compiling
+	  toolchain. Buildroot can either download automatically a
+	  toolchain, or use an already installed toolchain.
 
 config BR2_TOOLCHAIN_CTNG
 	bool "Crosstool-NG toolchain"
@@ -29,6 +33,5 @@ source "toolchain/toolchain-external/Config.in"
 source "toolchain/toolchain-crosstool-ng/Config.in"
 source "toolchain/toolchain-common.in"
 source "toolchain/toolchain-buildroot/Config.in.2"
-source "toolchain/toolchain-external/Config.in.2"
 
 endmenu
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index f0268a7..c2602d2 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -1,15 +1,142 @@
-#
-
 if BR2_TOOLCHAIN_EXTERNAL
+
 choice
-	prompt "External toolchain C library"
-	default BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	prompt "Toolchain"
 
-config BR2_TOOLCHAIN_EXTERNAL_UCLIBC
-	bool "uClibc"
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009
+	bool "CodeSourcery ARM 2010.09"
+	depends on BR2_arm
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	help
+	  Toolchain for the ARM architecture, from CodeSourcery. It
+	  uses gcc 4.5.1, binutils 2.20, glibc 2.11 and gdb 7.2.50,
+	  kernel headers 2.6.35.2. It has support for the following
+	  variants:
+            - ARMv5TE, little endian, soft-float, glibc
+            - ARMv4T, little endian, soft-float, glibc
+            - ARMv7-A, Thumb 2, little endian, soft-float, glibc
+
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2010Q1
+	bool "CodeSourcery ARM 2010q1"
+	depends on BR2_arm
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	help
+	  Toolchain for the ARM architecture, from CodeSourcery. It
+	  uses gcc 4.4.1, binutils 2.19, glibc 2.11, gdb 7.0.50 and
+	  kernel headers 2.6.32. It has support for the following
+	  variants:
+             - ARMv5T, little endian, soft-float, glibc
+             - ARMv4T, little endian, soft-float, glibc
+             - ARMv7-A, Thumb 2, little endian, soft-float, glibc
+
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q1
+	bool "CodeSourcery ARM 2009q1"
+	depends on BR2_arm
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	help
+	  Toolchain for the ARM architecture, from CodeSourcery. It
+	  uses gcc 4.3.3, binutils 2.19, glibc 2.8 and gdb 6.8 and
+	  kernel headers 2.6.30. It has support for the following
+	  variants:
+            - ARMv5T, little endian, soft-float, glibc
+            - ARMv4T, little endian, soft-float, glibc
+            - ARMv7-A, Thumb 2, little endian, soft-float, glibc
+
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS44
+	bool "CodeSourcery MIPS 4.4"
+	depends on BR2_mips || BR2_mipsel
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	help
+	  Toolchain for the MIPS architecture, from CodeSourcery. It
+	  uses gcc 4.4.1, binutils 2.19, glibc 2.11, uClibc 0.9.30 and
+	  gdb 7.0, kernel headers 2.6.32. It has support for the
+	  following variants:
+            - MIPS32 O32 big endian glibc
+            - MIPS32 O32 little endian glibc
+            - MIPS32 big endian soft float glibc
+            - MIPS32 little endian soft float glibc
+            - MIPS32 big endian microMIPS glibc
+            - MIPS32 little endian microMIPS glibc
+            - MIPS32 big endian soft float microMIPS glibc
+            - MIPS32 little endian soft float microMIPS glibc
+            - MIPS32 big endian uclibc
+            - MIPS32 little endian uclibc
+            - MIPS32 big endian soft float uclibc
+            - MIPS32 little endian soft float uclibc
+
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
+	bool "CodeSoucery PowerPC 2010.09"
+	depends on BR2_powerpc
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	help
+	  Toolchain for the PowerPC architecture, from
+	  CodeSourcery. It uses gcc 4.5.1, binutils 2.20, glibc 2.11,
+	  gdb 7.2.50 and kernel headers 2.6.35.2. It has support for
+	  the following variants:
+            - 603 glibc, 32 bits
+            - 603 soft float glibc, 32 bits
+            - e600 altivec glibc, 32 bits
+            - e500v1 glibc, 32 bits
+            - e500v2 glibc, 32 bits
+            - e500mc glibc, 32 bits
+            - 970 glibc hard-float, 64 bits
+
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
+	bool "CodeSoucery PowerPC 2010.09"
+	depends on BR2_sh
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	help
+	  Toolchain for the SuperH architecture, from CodeSourcery. It
+	  uses gcc 4.5.1, binutils 2.20, glibc 2.11, uClibc 0.9.30,
+	  gdb 7.2.50 and kernel headers 2.6.35.2. It has support for
+	  the following variants:
+            - SH4A, glibc, little endian
+            - SH4A, glibc, big endian
+	    - SH4A, uClibc, little endian
+            - SH4A, uClibc, big endian
+
+config BR2_TOOLCHAIN_EXTERNAL_CUSTOM
+       bool "Custom toolchain"
+       help
+         Use this option to use a custom toolchain pre-installed on
+         your system.
+
+endchoice
+
+config BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD
+	bool "Download toolchain automatically"
+	default y
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CUSTOM
+	help
+	  When enabled, Buildroot will automatically download and
+	  install the selected external toolchain. When disabled,
+	  Buildroot will use a pre-installed toolchain.
+
+config BR2_TOOLCHAIN_EXTERNAL_PATH
+	string "Toolchain path"
+	default "/path/to/toolchain/usr"
+	depends on !BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD
+	help
+	  Path to where the external toolchain is installed.
+
+config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
+	string "Toolchain prefix"
+	depends on BR2_TOOLCHAIN_EXTERNAL_CUSTOM
+	default "$(ARCH)-linux"
+
+config BR2_TOOLCHAIN_EXTERNAL_PREFIX
+	string
+	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q1
+	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2010Q1
+	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009
+	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS44
+	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
+	default "sh4-linux-gnu"          if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
+	default $(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX) \
+					 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
 config BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	bool "glibc"
+	bool
 	select BR2_LARGEFILE
 	select BR2_INET_IPV6
 	select BR2_INET_RPC
@@ -17,9 +144,26 @@ config BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_ENABLE_LOCALE
 	select BR2_PROGRAM_INVOCATION
 
+config BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	bool
+
+if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
+
+choice
+	prompt "External toolchain C library"
+	default BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
+
+config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
+	bool "uClibc"
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+
+config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC
+	bool "glibc"
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+
 endchoice
 
-if BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+if BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
 
 config BR2_TOOLCHAIN_EXTERNAL_LARGEFILE
 	bool "Toolchain has large file support?"
@@ -70,7 +214,9 @@ config BR2_TOOLCHAIN_EXTERNAL_PROGRAM_INVOCATION
 	  invocation support. If you don't know, leave the default
 	  value, Buildroot will tell you if it's correct or not.
 
-endif
+endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
+
+endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
 config BR2_TOOLCHAIN_EXTERNAL_STRIP
 	bool
@@ -78,4 +224,6 @@ config BR2_TOOLCHAIN_EXTERNAL_STRIP
 	prompt "Strip shared libraries"
 	help
 	  Strip shared libraries copied from the external toolchain.
-endif
+
+endif # BR2_TOOLCHAIN_EXTERNAL
+
diff --git a/toolchain/toolchain-external/Config.in.2 b/toolchain/toolchain-external/Config.in.2
deleted file mode 100644
index 489558c..0000000
--- a/toolchain/toolchain-external/Config.in.2
+++ /dev/null
@@ -1,17 +0,0 @@
-#
-
-if BR2_TOOLCHAIN_EXTERNAL
-config BR2_TOOLCHAIN_EXTERNAL_PATH
-	string "External toolchain path"
-	default "/path/to/staging_dir/usr"
-	help
-	  Path to where the external toolchain is installed.
-
-config BR2_TOOLCHAIN_EXTERNAL_PREFIX
-	string "External toolchain prefix"
-	default "$(ARCH)-linux"
-	help
-	  This the the external toolchain prefix. For example:
-	    armeb-unknown-linux-gnu, mipsel-unknown-linux-gnu, etc.
-
-endif
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 53ad636..7a17914 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -2,8 +2,9 @@
 #
 # This file implements the support for external toolchains, i.e
 # toolchains that have not been produced by Buildroot itself and that
-# are already available on the system on which Buildroot runs. So far,
-# we have tested this with:
+# Buildroot can download from the Web or that are already available on
+# the system on which Buildroot runs. So far, we have tested this
+# with:
 #
 #  * Toolchains generated by Crosstool-NG
 #  * Toolchains generated by Buildroot
@@ -13,17 +14,21 @@
 #
 # The basic principle is the following
 #
-#  1. Perform some checks on the conformity between the toolchain
-#  configuration described in the Buildroot menuconfig system, and the
-#  real configuration of the external toolchain. This is for example
-#  important to make sure that the Buildroot configuration system
-#  knows whether the toolchain supports RPC, IPv6, locales, large
-#  files, etc. Unfortunately, these things cannot be detected
-#  automatically, since the value of these options (such as
-#  BR2_INET_RPC) are needed at configuration time because these
-#  options are used as dependencies for other options. And at
-#  configuration time, we are not able to retrieve the external
-#  toolchain configuration.
+#  1. a. For toolchains downloaded from the Web, Buildroot already
+#  knows their configuration, so it just downloads them and extract
+#  them in $(TOOLCHAIN_EXTERNAL_DIR).
+#
+#  1. b. For pre-installed toolchains, perform some checks on the
+#  conformity between the toolchain configuration described in the
+#  Buildroot menuconfig system, and the real configuration of the
+#  external toolchain. This is for example important to make sure that
+#  the Buildroot configuration system knows whether the toolchain
+#  supports RPC, IPv6, locales, large files, etc. Unfortunately, these
+#  things cannot be detected automatically, since the value of these
+#  options (such as BR2_INET_RPC) are needed at configuration time
+#  because these options are used as dependencies for other
+#  options. And at configuration time, we are not able to retrieve the
+#  external toolchain configuration.
 #
 #  2. Copy the libraries needed at runtime to the target directory,
 #  $(TARGET_DIR). Obviously, things such as the C library, the dynamic
@@ -55,61 +60,138 @@ LIB_EXTERNAL_LIBS+=libthread_db.so
 endif # gdbserver
 endif # ! no threads
 
-# SYSROOT_DIR selection. We first try the -print-sysroot option,
-# available in gcc 4.4.x and in some Codesourcery toolchains. If this
-# option is not available, we fallback to the value of --with-sysroot
-# as visible in CROSS-gcc -v. We don't pass any option to gcc that
-# could select a multilib variant as we want the "main" sysroot, which
-# contains all variants of the C library in the case of multilib
-# toolchains.
+# Details about sysroot directory selection.
+#
+# To find the sysroot directory:
+#
+#  * We first try the -print-sysroot option, available in gcc 4.4.x
+#    and in some Codesourcery toolchains.
+#
+#  * If this option is not available, we fallback to the value of
+#    --with-sysroot as visible in CROSS-gcc -v.
+#
+# When doing those tests, we don't pass any option to gcc that could
+# select a multilib variant (such as -march) as we want the "main"
+# sysroot, which contains all variants of the C library in the case of
+# multilib toolchains. We use the TARGET_CC_NO_SYSROOT variable, which
+# is the path of the cross-compiler, without the
+# --sysroot=$(STAGING_DIR), since what we want to find is the location
+# of the original toolchain sysroot. This "main" sysroot directory is
+# stored in SYSROOT_DIR.
+#
+# Then, multilib toolchains are a little bit more complicated, since
+# they in fact have multiple sysroots, one for each variant supported
+# by the toolchain. So we need to find the particular sysroot we're
+# interested in.
+#
+# To do so, we ask the compiler where its sysroot is by passing all
+# flags (including -march and al.), except the --sysroot flag since we
+# want to the compiler to tell us where its original sysroot
+# is. ARCH_SUBDIR will contain the subdirectory, in the main
+# SYSROOT_DIR, that corresponds to the selected architecture
+# variant. ARCH_SYSROOT_DIR will contain the full path to this
+# location.
+#
+# One might wonder why we don't just bother with ARCH_SYSROOT_DIR. The
+# fact is that in multilib toolchains, the header files are often only
+# present in the main sysroot, and only the libraries are available in
+# each variant-specific sysroot directory.
+
 TARGET_CC_NO_SYSROOT=$(filter-out --sysroot=%,$(TARGET_CC_NOCCACHE))
-SYSROOT_DIR=$(shell $(TARGET_CC_NO_SYSROOT) -print-sysroot 2>/dev/null)
-ifeq ($(SYSROOT_DIR),)
-SYSROOT_DIR=$(shell readlink -f $$(LANG=C $(TARGET_CC_NO_SYSROOT) -print-file-name=libc.a) |sed -r -e 's:usr/lib/libc\.a::;')
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
+TOOLCHAIN_EXTERNAL_DEPENDENCIES = $(TOOLCHAIN_EXTERNAL_DIR)/.extracted
+else
+TOOLCHAIN_EXTERNAL_DEPENDENCIES = $(STAMP_DIR)/ext-toolchain-checked
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q1),y)
+TOOLCHAIN_EXTERNAL_SITE=http://www.codesourcery.com/sgpp/lite/arm/portal/package5383/public/arm-none-linux-gnueabi/
+TOOLCHAIN_EXTERNAL_SOURCE=arm-2009q3-67-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2010Q1),y)
+TOOLCHAIN_EXTERNAL_SITE=http://www.codesourcery.com/sgpp/lite/arm/portal/package6488/public/arm-none-linux-gnueabi/
+TOOLCHAIN_EXTERNAL_SOURCE=arm-2010q1-202-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009),y)
+TOOLCHAIN_EXTERNAL_SITE=http://www.codesourcery.com/sgpp/lite/arm/portal/package7851/public/arm-none-linux-gnueabi/
+TOOLCHAIN_EXTERNAL_SOURCE=arm-2010.09-50-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS44),y)
+TOOLCHAIN_EXTERNAL_SITE=http://www.codesourcery.com/sgpp/lite/mips/portal/package7401/public/mips-linux-gnu/
+TOOLCHAIN_EXTERNAL_SOURCE=mips-4.4-303-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009),y)
+TOOLCHAIN_EXTERNAL_SITE=http://www.codesourcery.com/sgpp/lite/power/portal/package7703/public/powerpc-linux-gnu/
+TOOLCHAIN_EXTERNAL_SOURCE=freescale-2010.09-55-powerpc-linux-gnu-i686-pc-linux-gnu.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009),y)
+TOOLCHAIN_EXTERNAL_SITE=http://www.codesourcery.com/sgpp/lite/superh/portal/package7783/public/sh-linux-gnu/
+TOOLCHAIN_EXTERNAL_SOURCE=renesas-2010.09-45-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
+else
+# A value must be set (even if unused), otherwise the
+# $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) rule would override the main
+# $(DL_DIR) rule
+TOOLCHAIN_EXTERNAL_SOURCE=none
 endif
 
-# Now, find if the toolchain specifies a sub-directory for the
-# specific architecture variant we're interested in. This is the case
-# with multilib toolchain, when the selected architecture variant is
-# not the default one. To do so, we ask the compiler by passing all
-# flags, except the --sysroot flag since we want to the compiler to
-# tell us where its original sysroot is. ARCH_SUBDIR will contain the
-# subdirectory, in the main SYSROOT_DIR, that corresponds to the
-# selected architecture variant. ARCH_SYSROOT_DIR will contain the
-# full path to this location.
-ARCH_SUBDIR=$(shell $(TARGET_CC_NO_SYSROOT) $(TARGET_CFLAGS) -print-multi-directory)
-ARCH_SYSROOT_DIR=$(SYSROOT_DIR)/$(ARCH_SUBDIR)
+# Download and extraction of a toolchain
+$(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE):
+	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE),$(TOOLCHAIN_EXTERNAL_SOURCE))
+
+$(TOOLCHAIN_EXTERNAL_DIR)/.extracted: $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE)
+	mkdir -p $(@D)
+	$(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE))) $^ | $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
+	touch $@
 
-$(STAMP_DIR)/ext-toolchain-installed:
+# Checks for an already installed toolchain: check the toolchain
+# location, check that it supports sysroot, and then verify that it
+# matches the configuration provided in Buildroot: ABI, C++ support,
+# type of C library and all C library features.
+$(STAMP_DIR)/ext-toolchain-checked:
 	@echo "Checking external toolchain settings"
 	$(Q)$(call check_cross_compiler_exists)
-ifeq ($(strip $(SYSROOT_DIR)),)
-	@echo "External toolchain doesn't support --sysroot. Cannot use."
-	exit 1
-endif
-ifeq ($(BR2_arm),y)
-	$(Q)$(call check_arm_abi)
-endif
-ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-	$(Q)$(call check_cplusplus)
-endif
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
-	$(Q)$(call check_uclibc,$(SYSROOT_DIR))
-else
-	$(Q)$(call check_glibc,$(SYSROOT_DIR))
-endif
-	mkdir -p $(TARGET_DIR)/lib
-	@echo "Copy external toolchain libraries to target..."
-	$(Q)for libs in $(LIB_EXTERNAL_LIBS); do \
-		$(call copy_toolchain_lib_root,$(ARCH_SYSROOT_DIR),$$libs,/lib,$(BR2_TOOLCHAIN_EXTERNAL_STRIP)); \
-	done
-	$(Q)for libs in $(USR_LIB_EXTERNAL_LIBS); do \
-		$(call copy_toolchain_lib_root,$(ARCH_SYSROOT_DIR),$$libs,/usr/lib,$(BR2_TOOLCHAIN_EXTERNAL_STRIP)); \
-	done
-	@echo "Copy external toolchain sysroot to staging..."
-	$(Q)$(call copy_toolchain_sysroot,$(SYSROOT_DIR),$(ARCH_SYSROOT_DIR),$(ARCH_SUBDIR))
-	# Create lib64 symbolic links if needed
-	$(Q)if [ -L $(ARCH_SYSROOT_DIR)/lib64 ] ; then \
-		$(call create_lib64_symlinks) ; \
+	$(Q)SYSROOT_DIR=`$(TARGET_CC_NO_SYSROOT) -print-sysroot 2>/dev/null` ; \
+	if test -z "$${SYSROOT_DIR}" ; then \
+		SYSROOT_DIR=`readlink -f $$(LANG=C $(TARGET_CC_NO_SYSROOT) -print-file-name=libc.a) |sed -r -e 's:usr/lib/libc\.a::;'` ; \
+	fi ; \
+	if test -z "$${SYSROOT_DIR}" ; then \
+		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
+		exit 1 ; \
+	fi ; \
+	if test x$(BR2_arm) == x"y" ; then \
+		$(call check_arm_abi) ; \
+	fi ; \
+	if test x$(BR2_INSTALL_LIBSTDCPP) == x"y" ; then \
+		$(call check_cplusplus) ; \
+	fi ; \
+	if test x$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC) == x"y" ; then \
+		$(call check_uclibc,$${SYSROOT_DIR}) ; \
+	else \
+		$(call check_glibc,$${SYSROOT_DIR}) ; \
 	fi
-	@touch $@
+
+# Integration of the toolchain into Buildroot: find the main sysroot
+# and the variant-specific sysroot, then copy the needed libraries to
+# the $(TARGET_DIR) and copy the whole sysroot (libraries and headers)
+# to $(STAGING_DIR).
+$(STAMP_DIR)/ext-toolchain-installed: $(TOOLCHAIN_EXTERNAL_DEPENDENCIES)
+	$(Q)SYSROOT_DIR=`$(TARGET_CC_NO_SYSROOT) -print-sysroot 2>/dev/null` ; \
+	if test -z "$${SYSROOT_DIR}" ; then \
+		SYSROOT_DIR=`readlink -f $$(LANG=C $(TARGET_CC_NO_SYSROOT) -print-file-name=libc.a) |sed -r -e 's:usr/lib/libc\.a::;'` ; \
+	fi ; \
+	if test -z "$${SYSROOT_DIR}" ; then \
+		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
+		exit 1 ; \
+	fi ; \
+	ARCH_SUBDIR=`$(TARGET_CC_NO_SYSROOT) $(TARGET_CFLAGS) -print-multi-directory` ; \
+	ARCH_SYSROOT_DIR=$${SYSROOT_DIR}/$${ARCH_SUBDIR} ; \
+	mkdir -p $(TARGET_DIR)/lib ; \
+	echo "Copy external toolchain libraries to target..." ; \
+	for libs in $(LIB_EXTERNAL_LIBS); do \
+	 	$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$$libs,/lib,$(BR2_TOOLCHAIN_EXTERNAL_STRIP)); \
+	done ; \
+	for libs in $(USR_LIB_EXTERNAL_LIBS); do \
+	 	$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$$libs,/usr/lib,$(BR2_TOOLCHAIN_EXTERNAL_STRIP)); \
+	done ; \
+	echo "Copy external toolchain sysroot to staging..." ; \
+	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR}) ; \
+	if [ -L $${ARCH_SYSROOT_DIR}/lib64 ] ; then \
+		$(call create_lib64_symlinks) ; \
+	fi ; \
+	touch $@
-- 
1.7.0.4
