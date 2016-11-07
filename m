From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 7 Nov 2016 02:20:17 +0100
Subject: [Buildroot] [PATCH v4 22/22] toolchain-external: remove Arago
	toolchains
In-Reply-To: <20161107012017.22505-1-arnout@mind.be>
References: <20161107012017.22505-1-arnout@mind.be>
Message-ID: <20161107012017.22505-23-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Arago toolchains are no longer maintained and haven't been updated
for a long time.

With this removal, all the legacy toolchain-external support can be
removed as well.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy                                   |  16 +++
 toolchain/toolchain-external/Config.in             |  53 +--------
 .../toolchain-external/toolchain-external.hash     |   8 --
 toolchain/toolchain-external/toolchain-external.mk | 123 ---------------------
 4 files changed, 19 insertions(+), 181 deletions(-)
 delete mode 100644 toolchain/toolchain-external/toolchain-external.hash

diff --git a/Config.in.legacy b/Config.in.legacy
index 8c41b05..ccf06c0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -143,6 +143,22 @@ comment "----------------------------------------------------"
 endif
 
 ###############################################################################
+comment "Legacy options removed in 2017.02"
+
+config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
+	bool "Arago ARMv7 2011.09 removed"
+	select BR2_LEGACY
+	help
+	  The Arago toolchains are every old and not updated anymore.
+
+config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
+	bool "Arago ARMv5 2011.09 removed"
+	select BR2_LEGACY
+	help
+	  The Arago toolchains are every old and not updated anymore.
+
+
+###############################################################################
 comment "Legacy options removed in 2016.11"
 
 config BR2_PACKAGE_PHP_SAPI_CLI_CGI
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index fb33703..2c39e5a 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -51,51 +51,6 @@ source "toolchain/toolchain-external/toolchain-external-musl-cross/Config.in"
 # architecture.
 source "toolchain/toolchain-external/toolchain-external-custom/Config.in"
 
-config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
-	bool "Arago ARMv7 2011.09"
-	depends on BR2_arm
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on BR2_ARM_CPU_ARMV7A
-	depends on BR2_ARM_EABI
-	depends on BR2_ARM_CPU_HAS_VFPV3
-	depends on !BR2_STATIC_LIBS
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
-	# kernel headers: 2.6.31
-	help
-	  Texas Instruments Arago 2011.09 toolchain, with gcc 4.5.3,
-	  binutils 2.20.1, glibc 2.12, gdb 7.2.
-
-	  This toolchain uses -mfloat-abi=softfp (i.e can use FPU
-	  instructions, but passes floating point function arguments
-	  in integer registers), and requires a VFPv3 floating point
-	  unit to work properly. This unit is available on most
-	  Cortex-A ARM processors, but not all.
-
-config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
-	bool "Arago ARMv5 2011.09"
-	depends on BR2_arm
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_ARM_CPU_ARMV4
-	depends on BR2_ARM_EABI
-	depends on !BR2_STATIC_LIBS
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
-	# kernel headers: 2.6.31
-	help
-	  Texas Instruments Arago ARMv5 2011.09 toolchain, with gcc
-	  4.5.3, binutils 2.20.1, glibc 2.12, gdb 7.2.
-
-	  This toolchain uses software-floating point.
-
 endchoice
 
 choice
@@ -127,11 +82,6 @@ config BR2_TOOLCHAIN_EXTERNAL_PATH
 	help
 	  Path to where the external toolchain is installed.
 
-config BR2_TOOLCHAIN_EXTERNAL_PREFIX
-	string
-	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
-	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
-
 config BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	bool
 	select BR2_TOOLCHAIN_USES_GLIBC
@@ -154,6 +104,9 @@ config BR2_PACKAGE_HAS_TOOLCHAIN_EXTERNAL
 config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
 	string
 
+config BR2_TOOLCHAIN_EXTERNAL_PREFIX
+	string
+
 # Kept toolchains sorted as in the choice above
 # The toolchain Config.in.options must define
 # BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL and BR2_TOOLCHAIN_EXTERNAL_PREFIX
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
deleted file mode 100644
index cc93998..0000000
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ /dev/null
@@ -1,8 +0,0 @@
-######################################
-# Next hashes are all locally computed
-
-# ARM toolchains from Texas Instrument's Arago project
-# There is one source file that covers both binary distributions.
-sha256 f2febf3b3c565536461ad4405f1bcb835d75a6afb2a8bec958a1248cb4b81fc7  arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2
-sha256 254af7d02eb3bcc8345c78e131700bc995d65b68232caaed21150a5fd1456070  arago-2011.09-armv5te-linux-gnueabi-sdk.tar.bz2
-sha256 25fbf0513ad7322b15cbaae964cafadcbb4c939f2708f57f40b8f9f2d601122b  arago-toolchain-2011.09-sources.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 53f5583..48de1e7 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -15,129 +15,6 @@ ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
 TOOLCHAIN_EXTERNAL_DEPENDENCIES += musl-compat-headers
 endif
 
-# All the definition that are common between the toolchain-external
-# generic package and the toolchain-external-package infrastructure
-# can be found in pkg-toolchain-external.mk
-
-# Legacy toolchains that don't use the toolchain-external-package infrastructure
-# yet. We can recognise that because no provider is set.
-ifeq ($(call qstrip,$(BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL)),)
-
-# Now we are the provider. However, we can't set it to ourselves or we'll get a
-# circular dependency. Let's set it to a target that we always depend on
-# instead.
-BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL = skeleton
-
-TOOLCHAIN_EXTERNAL_INSTALL_STAGING = YES
-
-# In fact, we don't need to download the toolchain, since it is already
-# available on the system, so force the site and source to be empty so
-# that nothing will be downloaded/extracted.
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED),y)
-TOOLCHAIN_EXTERNAL_SITE =
-TOOLCHAIN_EXTERNAL_SOURCE =
-endif
-
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A),y)
-TOOLCHAIN_EXTERNAL_SITE = http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports
-TOOLCHAIN_EXTERNAL_SOURCE = arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2
-TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL = arago-toolchain-2011.09-sources.tar.bz2
-define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
-	mv $(@D)/arago-2011.09/armv7a/* $(@D)/
-	rm -rf $(@D)/arago-2011.09/
-endef
-TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_FIXUP_CMDS
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE),y)
-TOOLCHAIN_EXTERNAL_SITE = http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports
-TOOLCHAIN_EXTERNAL_SOURCE = arago-2011.09-armv5te-linux-gnueabi-sdk.tar.bz2
-TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL = arago-toolchain-2011.09-sources.tar.bz2
-define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
-	mv $(@D)/arago-2011.09/armv5te/* $(@D)/
-	rm -rf $(@D)/arago-2011.09/
-endef
-TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_FIXUP_CMDS
-endif
-
-# Some toolchain vendors have a regular file naming pattern.
-# For them, mass-define _ACTUAL_SOURCE_TARBALL based _SITE.
-ifneq ($(findstring sourcery.mentor.com/public/gnu_toolchain,$(TOOLCHAIN_EXTERNAL_SITE)),)
-TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL ?= \
-	$(subst -i686-pc-linux-gnu.tar.bz2,.src.tar.bz2,$(subst -i686-pc-linux-gnu-i386-linux.tar.bz2,-i686-pc-linux-gnu.src.tar.bz2,$(TOOLCHAIN_EXTERNAL_SOURCE)))
-endif
-
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
-TOOLCHAIN_EXTERNAL_EXCLUDES = usr/lib/locale/*
-
-TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += \
-	TOOLCHAIN_EXTERNAL_MOVE
-endif
-
-# Checks for an already installed toolchain: check the toolchain
-# location, check that it is usable, and then verify that it
-# matches the configuration provided in Buildroot: ABI, C++ support,
-# kernel headers version, type of C library and all C library features.
-define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
-	$(Q)$(call check_cross_compiler_exists,$(TOOLCHAIN_EXTERNAL_CC))
-	$(Q)$(call check_unusable_toolchain,$(TOOLCHAIN_EXTERNAL_CC))
-	$(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC))" ; \
-	$(call check_kernel_headers_version,\
-		$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC)),\
-		$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))); \
-	$(call check_gcc_version,$(TOOLCHAIN_EXTERNAL_CC),\
-		$(call qstrip,$(BR2_TOOLCHAIN_GCC_AT_LEAST))); \
-	if test "$(BR2_arm)" = "y" ; then \
-		$(call check_arm_abi,\
-			"$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS)",\
-			$(TOOLCHAIN_EXTERNAL_READELF)) ; \
-	fi ; \
-	if test "$(BR2_INSTALL_LIBSTDCPP)" = "y" ; then \
-		$(call check_cplusplus,$(TOOLCHAIN_EXTERNAL_CXX)) ; \
-	fi ; \
-	if test "$(BR2_TOOLCHAIN_HAS_FORTRAN)" = "y" ; then \
-		$(call check_fortran,$(TOOLCHAIN_EXTERNAL_FC)) ; \
-	fi ; \
-	if test "$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)" = "y" ; then \
-		$(call check_uclibc,$${SYSROOT_DIR}) ; \
-	elif test "$(BR2_TOOLCHAIN_EXTERNAL_MUSL)" = "y" ; then \
-		$(call check_musl,$${SYSROOT_DIR}) ; \
-	else \
-		$(call check_glibc,$${SYSROOT_DIR}) ; \
-	fi
-	$(Q)$(call check_toolchain_ssp,$(TOOLCHAIN_EXTERNAL_CC))
-endef
-
-TOOLCHAIN_EXTERNAL_BUILD_CMDS = $(TOOLCHAIN_WRAPPER_BUILD)
-
-define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
-	$(TOOLCHAIN_WRAPPER_INSTALL)
-	$(TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK)
-	$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS)
-	$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC)
-	$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
-	$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
-endef
-
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
-TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
-endif
-
-# Even though we're installing things in both the staging, the host
-# and the target directory, we do everything within the
-# install-staging step, arbitrarily.
-define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_CMDS
-	$(TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK)
-	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS)
-	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER)
-	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FDPIC)
-	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FLAT)
-	$(TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO)
-endef
-
-endif # BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
-
-
-# Since a virtual package is just a generic package, we can still
-# define commands for the legacy toolchains.
 $(eval $(virtual-package))
 
 # Ensure the external-toolchain package has a prefix defined.
-- 
2.10.2
