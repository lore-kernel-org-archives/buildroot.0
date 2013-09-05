From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  5 Sep 2013 23:27:48 +0200
Subject: [Buildroot] [RFCv1 10/11] toolchain-external: convert to the
	package infrastructure
In-Reply-To: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1378416469-17708-11-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit converts the 'toolchain-external' logic to the package
infrastructure.

The TOOLCHAIN_EXTERNAL_DIR variable (which points to where the
toolchain is located) is renamed to TOOLCHAIN_EXTERNAL_INSTALL_DIR,
because the former conflicts with the package infrastructure (which
defines the <pkg>_DIR variable for each package as pointing to its
build directory).

The new _SOURCE_ADDONS mechanism is used for Blackfin toolchains.

The extract, configuration and installation steps are converted inside
the <pkg>_EXTRACT_CMDS, <pkg>_CONFIGURE_CMDS and
<pkg>_INSTALL_STAGING_CMDS.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../{ext-tool.mk => toolchain-external.mk}         | 154 +++++++++------------
 1 file changed, 69 insertions(+), 85 deletions(-)
 rename toolchain/toolchain-external/{ext-tool.mk => toolchain-external.mk} (86%)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/toolchain-external.mk
similarity index 86%
rename from toolchain/toolchain-external/ext-tool.mk
rename to toolchain/toolchain-external/toolchain-external.mk
index fbcbe6c..4817cb6 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -1,5 +1,11 @@
+################################################################################
 #
-# This file implements the support for external toolchains, i.e
+# toolchain-external
+#
+################################################################################
+
+#
+# This package implements the support for external toolchains, i.e
 # toolchains that have not been produced by Buildroot itself and that
 # Buildroot can download from the Web or that are already available on
 # the system on which Buildroot runs. So far, we have tested this
@@ -14,7 +20,7 @@
 # The basic principle is the following
 #
 #  1. If the toolchain is not pre-installed, download and extract it
-#  in $(TOOLCHAIN_EXTERNAL_DIR).
+#  in $(TOOLCHAIN_EXTERNAL_INSTALL_DIR).
 #
 #  2. For all external toolchains, perform some checks on the
 #  conformity between the toolchain configuration described in the
@@ -105,21 +111,21 @@ endif # ! no threads
 
 TOOLCHAIN_EXTERNAL_PREFIX=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
-TOOLCHAIN_EXTERNAL_DIR=$(HOST_DIR)/opt/ext-toolchain
+TOOLCHAIN_EXTERNAL_INSTALL_DIR=$(HOST_DIR)/opt/ext-toolchain
 else
-TOOLCHAIN_EXTERNAL_DIR=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
+TOOLCHAIN_EXTERNAL_INSTALL_DIR=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
 endif
 
-ifeq ($(TOOLCHAIN_EXTERNAL_DIR),)
+ifeq ($(TOOLCHAIN_EXTERNAL_INSTALL_DIR),)
 ifneq ($(TOOLCHAIN_EXTERNAL_PREFIX),)
 # if no path set, figure it out from path
 TOOLCHAIN_EXTERNAL_BIN := $(shell dirname $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
 endif
 else
 ifeq ($(BR2_bfin),y)
-TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_DIR)/$(TOOLCHAIN_EXTERNAL_PREFIX)/bin
+TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/$(TOOLCHAIN_EXTERNAL_PREFIX)/bin
 else
-TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_DIR)/bin
+TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/bin
 endif
 endif
 
@@ -203,10 +209,6 @@ TOOLCHAIN_EXTERNAL_CFLAGS += -msoft-float
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_SOFTFLOAT=1
 endif
 
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
-TOOLCHAIN_EXTERNAL_DEPENDENCIES = $(TOOLCHAIN_EXTERNAL_DIR)/.extracted
-endif
-
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
 TOOLCHAIN_EXTERNAL_SOURCE = arm-2011.09-70-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
@@ -220,15 +222,15 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109),y)
 TOOLCHAIN_EXTERNAL_SITE = http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports/
 TOOLCHAIN_EXTERNAL_SOURCE = arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2
 define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
-	mv $(@D)/arago-2011.09/armv7a/* $(@D)/
-	rm -rf $(@D)/arago-2011.09/
+	mv $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/armv7a/* $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/
+	rm -rf $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/
 endef
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109),y)
 TOOLCHAIN_EXTERNAL_SITE = http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports/
 TOOLCHAIN_EXTERNAL_SOURCE = arago-2011.09-armv5te-linux-gnueabi-sdk.tar.bz2
 define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
-	mv $(@D)/arago-2011.09/armv5te/* $(@D)/
-	rm -rf $(@D)/arago-2011.09/
+	mv $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/armv5te/* $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/
+	rm -rf $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/
 endef
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_04),y)
 TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/13.04/components/toolchain/binaries/
@@ -282,17 +284,13 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209),y)
 TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE = ia32-2012.09-62-i686-pc-linux-gnu-i386-linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1),y)
-TOOLCHAIN_EXTERNAL_SITE_1   = http://blackfin.uclinux.org/gf/download/frsrelease/559/9858/
-TOOLCHAIN_EXTERNAL_SOURCE_1 = blackfin-toolchain-2012R1-RC2.i386.tar.bz2
-TOOLCHAIN_EXTERNAL_SITE_2   = http://blackfin.uclinux.org/gf/download/frsrelease/559/9866/
-TOOLCHAIN_EXTERNAL_SOURCE_2 = blackfin-toolchain-uclibc-full-2012R1-RC2.i386.tar.bz2
-TOOLCHAIN_EXTERNAL_SOURCE   = $(TOOLCHAIN_EXTERNAL_SOURCE_1) $(TOOLCHAIN_EXTERNAL_SOURCE_2)
+TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/projects/adi-toolchain/files/2012R1-BF60X/2012R1-RC2-BF60X/i386/
+TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2012R1-RC2.i386.tar.bz2
+TOOLCHAIN_EXTERNAL_SOURCE_ADDONS = blackfin-toolchain-uclibc-full-2012R1-RC2.i386.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2),y)
-TOOLCHAIN_EXTERNAL_SITE_1   = http://blackfin.uclinux.org/gf/download/frsrelease/588/10139/
-TOOLCHAIN_EXTERNAL_SOURCE_1 = blackfin-toolchain-2012R2-RC2.i386.tar.bz2
-TOOLCHAIN_EXTERNAL_SITE_2   = http://blackfin.uclinux.org/gf/download/frsrelease/588/10147/
-TOOLCHAIN_EXTERNAL_SOURCE_2 = blackfin-toolchain-uclibc-full-2012R2-RC2.i386.tar.bz2
-TOOLCHAIN_EXTERNAL_SOURCE   = $(TOOLCHAIN_EXTERNAL_SOURCE_1) $(TOOLCHAIN_EXTERNAL_SOURCE_2)
+TOOLCHAIN_EXTERNAL_SITE   = http://downloads.sourceforge.net/project/adi-toolchain/2012R2/2012R2-RC2/i386/
+TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2012R2-RC2.i386.tar.bz2
+TOOLCHAIN_EXTERNAL_SOURCE_ADDONS = blackfin-toolchain-uclibc-full-2012R2-RC2.i386.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sources.buildroot.net/
 TOOLCHAIN_EXTERNAL_SOURCE = lin32-microblazeel-unknown-linux-gnu_14.3_early.tar.xz
@@ -318,53 +316,38 @@ else
 # Custom toolchain
 TOOLCHAIN_EXTERNAL_SITE = $(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
 TOOLCHAIN_EXTERNAL_SOURCE = $(notdir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
-
-# A value must be set (even if unused), otherwise the
-# $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) rule would override the main
-# $(DL_DIR) rule
-ifeq (,$(TOOLCHAIN_EXTERNAL_SOURCE))
-TOOLCHAIN_EXTERNAL_SOURCE = none
-endif
 endif
 
+TOOLCHAIN_EXTERNAL_INSTALL_STAGING = YES
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2),y)
 # Special handling for Blackfin toolchain, because of the split in two
 # tarballs, and the organization of tarball contents. The tarballs
 # contain ./opt/uClinux/{bfin-uclinux,bfin-linux-uclibc} directories,
 # which themselves contain the toolchain. This is why we strip more
 # components than usual.
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2),y)
-$(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1):
-	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE_1:/=)/$(TOOLCHAIN_EXTERNAL_SOURCE_1))
-
-$(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_2):
-	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE_2:/=)/$(TOOLCHAIN_EXTERNAL_SOURCE_2))
-
-$(TOOLCHAIN_EXTERNAL_DIR)/.extracted: $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_2)
-	mkdir -p $(@D)
-	$(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE_1))) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1) | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(@D) $(TAR_OPTIONS) -
-	$(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE_2))) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_2) | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(@D) $(TAR_OPTIONS) -
-	$(Q)touch $@
-else
-# Download and extraction of a toolchain
-$(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE):
-	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE)$(TOOLCHAIN_EXTERNAL_SOURCE),$(TOOLCHAIN_EXTERNAL_SOURCE))
-
-$(TOOLCHAIN_EXTERNAL_DIR)/.extracted: $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE)
-	mkdir -p $(@D)
-	$(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE))) $^ | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 --exclude='usr/lib/locale/*' -C $(@D) $(TAR_OPTIONS) -
+define TOOLCHAIN_EXTERNAL_EXTRACT_CMDS
+	mkdir -p $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)
+	$(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE))) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
+	$(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE_ADDONS))) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_ADDONS) | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
+endef
+else ifneq ($(TOOLCHAIN_EXTERNAL_SOURCE),)
+# Normal handling of toolchain tarball extraction.
+define TOOLCHAIN_EXTERNAL_EXTRACT_CMDS
+	mkdir -p $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)
+	$(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE))) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 --exclude='usr/lib/locale/*' -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
 	$(TOOLCHAIN_EXTERNAL_FIXUP_CMDS)
-	$(Q)touch $@
+endef
 endif
 
 # Checks for an already installed toolchain: check the toolchain
 # location, check that it supports sysroot, and then verify that it
 # matches the configuration provided in Buildroot: ABI, C++ support,
 # type of C library and all C library features.
-$(STAMP_DIR)/ext-toolchain-checked: $(TOOLCHAIN_EXTERNAL_DEPENDENCIES)
-	@$(call MESSAGE,"Checking external toolchain settings")
+define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
 	$(Q)$(call check_cross_compiler_exists,$(TOOLCHAIN_EXTERNAL_CC))
 	$(Q)LIBC_A_LOCATION=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) -print-file-name=libc.a)` ; \
 	SYSROOT_DIR=`echo $${LIBC_A_LOCATION} | sed -r -e 's:usr/lib(32|64)?/(.*/)?libc\.a::'` ; \
@@ -385,7 +368,7 @@ $(STAMP_DIR)/ext-toolchain-checked: $(TOOLCHAIN_EXTERNAL_DEPENDENCIES)
 	else \
 		$(call check_glibc,$${SYSROOT_DIR}) ; \
 	fi
-	$(Q)touch $@
+endef
 
 # Integration of the toolchain into Buildroot: find the main sysroot
 # and the variant-specific sysroot, then copy the needed libraries to
@@ -435,7 +418,7 @@ $(STAMP_DIR)/ext-toolchain-checked: $(TOOLCHAIN_EXTERNAL_DEPENDENCIES)
 #                       considered when searching libraries for copy
 #                       to the target filesystem.
 
-$(STAMP_DIR)/ext-toolchain-installed: $(STAMP_DIR)/ext-toolchain-checked
+define TOOLCHAIN_EXTERNAL_INSTALL_CORE
 	$(Q)LIBC_A_LOCATION=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) -print-file-name=libc.a)` ; \
 	SYSROOT_DIR=`echo $${LIBC_A_LOCATION} | sed -r -e 's:usr/lib(32|64)?/(.*/)?libc\.a::'` ; \
 	if test -z "$${SYSROOT_DIR}" ; then \
@@ -478,14 +461,15 @@ $(STAMP_DIR)/ext-toolchain-installed: $(STAMP_DIR)/ext-toolchain-checked
 			echo "Could not find gdbserver in external toolchain" ; \
 			exit 1 ; \
 		fi ; \
-	fi ; \
-	touch $@
+	fi
+endef
 
 # Special installation target used on the Blackfin architecture when
 # FDPIC is not the primary binary format being used, but the user has
 # nonetheless requested the installation of the FDPIC libraries to the
 # target filesystem.
-$(STAMP_DIR)/ext-toolchain-bfin-fdpic-shared-installed: $(STAMP_DIR)/ext-toolchain-checked
+ifeq ($(BR2_BFIN_INSTALL_FDPIC_SHARED),y)
+define TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC
 	$(Q)$(call MESSAGE,"Install external toolchain FDPIC libraries to target...") ; \
 	FDPIC_EXTERNAL_CC=$(dir $(TOOLCHAIN_EXTERNAL_CC))/../../bfin-linux-uclibc/bin/bfin-linux-uclibc-gcc ; \
 	FDPIC_LIBC_A_LOCATION=`readlink -f $$(LANG=C $${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS) -print-file-name=libc.a)` ; \
@@ -503,8 +487,9 @@ $(STAMP_DIR)/ext-toolchain-bfin-fdpic-shared-installed: $(STAMP_DIR)/ext-toolcha
 	done ; \
 	for libs in $(USR_LIB_EXTERNAL_LIBS); do \
 	        $(call copy_toolchain_lib_root,$${FDPIC_SYSROOT_DIR},$${FDPIC_SUPPORT_LIB_DIR},$${FDPIC_LIB_DIR},$$libs,/usr/lib); \
-	done ; \
-	touch $@
+	done
+endef
+endif
 
 # Special installation target used on the Blackfin architecture when
 # shared FLAT is not the primary format being used, but the user has
@@ -512,36 +497,28 @@ $(STAMP_DIR)/ext-toolchain-bfin-fdpic-shared-installed: $(STAMP_DIR)/ext-toolcha
 # to the target filesystem. The flat libraries are found and linked
 # according to the index in name "libN.so". Index 1 is reserved for
 # the standard C library. Customer libraries can use 4 and above.
-$(STAMP_DIR)/ext-toolchain-bfin-shared-flat-installed: $(STAMP_DIR)/ext-toolchain-checked
+ifeq ($(BR2_BFIN_INSTALL_FLAT_SHARED),y)
+define TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FLAT
 	$(Q)$(call MESSAGE,"Install external toolchain FLAT libraries to target...") ; \
 	FLAT_EXTERNAL_CC=$(dir $(TOOLCHAIN_EXTERNAL_CC))../../bfin-uclinux/bin/bfin-uclinux-gcc ; \
 	FLAT_LIBC_A_LOCATION=`$${FLAT_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS) -mid-shared-library -print-file-name=libc`; \
 	if [ -f $${FLAT_LIBC_A_LOCATION} -a ! -h $${FLAT_LIBC_A_LOCATION} ] ; then \
 	        $(INSTALL) -D $${FLAT_LIBC_A_LOCATION} $(TARGET_DIR)/lib/lib1.so; \
-	fi ; \
-	touch $@
-
-TOOLCHAIN_EXTERNAL_INSTALL = $(STAMP_DIR)/ext-toolchain-installed
-
-ifeq ($(BR2_BFIN_INSTALL_FDPIC_SHARED),y)
-TOOLCHAIN_EXTERNAL_INSTALL += $(STAMP_DIR)/ext-toolchain-bfin-fdpic-shared-installed
-endif
-
-ifeq ($(BR2_BFIN_INSTALL_FLAT_SHARED),y)
-TOOLCHAIN_EXTERNAL_INSTALL += $(STAMP_DIR)/ext-toolchain-bfin-shared-flat-installed
+	fi
+endef
 endif
 
 # Build toolchain wrapper for preprocessor, C and C++ compiler and setup
 # symlinks for everything else. Skip gdb symlink when we are building our
 # own gdb to prevent two gdb's in output/host/usr/bin.
-$(HOST_DIR)/usr/bin/ext-toolchain-wrapper: $(TOOLCHAIN_EXTERNAL_INSTALL)
+define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
 	$(Q)$(call MESSAGE,"Building ext-toolchain wrapper")
 	mkdir -p $(HOST_DIR)/usr/bin; cd $(HOST_DIR)/usr/bin; \
 	for i in $(TOOLCHAIN_EXTERNAL_CROSS)*; do \
 		base=$${i##*/}; \
 		case "$$base" in \
 		*cc|*cc-*|*++|*++-*|*cpp) \
-			ln -sf $(@F) $$base; \
+			ln -sf ext-toolchain-wrapper $$base; \
 			;; \
 		*gdb|*gdbtui) \
 			if test "$(BR2_PACKAGE_HOST_GDB)" != "y"; then \
@@ -556,11 +533,18 @@ $(HOST_DIR)/usr/bin/ext-toolchain-wrapper: $(TOOLCHAIN_EXTERNAL_INSTALL)
 	# We use --hash-style=both to increase the compatibility of
 	# the generated binary with older platforms
 	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_EXTERNAL_WRAPPER_ARGS) -s -Wl,--hash-style=both \
-		toolchain/toolchain-external/ext-toolchain-wrapper.c -o $@
+		toolchain/toolchain-external/ext-toolchain-wrapper.c \
+		-o $(HOST_DIR)/usr/bin/ext-toolchain-wrapper
+endef
 
-toolchain-external: dependencies $(HOST_DIR)/usr/bin/ext-toolchain-wrapper
+# Even though we're installing things in both the staging, the host
+# and the target directory, we do everything within the
+# install-staging step, arbitrarily.
+define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
+	$(TOOLCHAIN_EXTERNAL_INSTALL_CORE)
+	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC)
+	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FLAT)
+	$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
+endef
 
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
-# download ext toolchain if so configured
-toolchain-external-source: $(addprefix $(DL_DIR)/,$(TOOLCHAIN_EXTERNAL_SOURCE))
-endif
+$(eval $(generic-package))
-- 
1.8.1.2
