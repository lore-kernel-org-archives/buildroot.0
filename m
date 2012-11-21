From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 21 Nov 2012 11:08:50 +0100
Subject: [Buildroot] [git commit] xtensa: use uppercase for configurations
	and modified overlay structure
Message-ID: <20121121101539.CF76E90D48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fdd5bc948ed5fa3d14f9bfa09968f8216fb08ae1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Except for architecture and processor names, buildroot uses capitalized
configuration names, so change the macro names for xtensa to follow that
standard.
Change the overlay file to have a subdirectory for each component
(gdb, binutils, gcc, etc.) to make it more future-prove.

Signed-off-by: Chris Zankel <chris@zankel.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 arch/Config.in.xtensa           |   26 +++++++++++++++-----------
 package/binutils/binutils.mk    |    6 +++---
 toolchain/gcc/gcc-uclibc-4.x.mk |    6 +++---
 toolchain/gdb/gdb.mk            |    6 +++---
 4 files changed, 24 insertions(+), 20 deletions(-)

diff --git a/arch/Config.in.xtensa b/arch/Config.in.xtensa
index af66125..60c03f5 100644
--- a/arch/Config.in.xtensa
+++ b/arch/Config.in.xtensa
@@ -2,32 +2,36 @@ choice
 	prompt "Target Architecture Variant"
 	depends on BR2_xtensa
 	default BR2_xtensa_fsf
-config BR2_xtensa_custom
+config BR2_XTENSA_CUSTOM
 	bool "Custom Xtensa processor configuration"
 config BR2_xtensa_fsf
 	bool "fsf - Default configuration"
 endchoice
 
-config BR2_xtensa_custom_name
-	string "Custom Xtensa processor configuration anme"
-	depends on BR2_xtensa_custom
+config BR2_XTENSA_CUSTOM_NAME
+	string "Custom Xtensa processor configuration name"
+	depends on BR2_XTENSA_CUSTOM
 	default ""
 	help
 	  Name given to a custom Xtensa processor configuration.
 
-config BR2_xtensa_core_name
+config BR2_XTENSA_CORE_NAME
 	string
-	default BR2_xtensa_custom_name	if BR2_xtensa_custom
+	default BR2_XTENSA_CUSTOM_NAME	if BR2_XTENSA_CUSTOM
 	default ""			if BR2_xtensa_fsf
 
-config BR2_xtensa_overlay_dir
+config BR2_XTENSA_OVERLAY_DIR
 	string "Overlay directory for custom configuration"
-	depends on BR2_xtensa_custom
+	depends on BR2_XTENSA_CUSTOM
 	default ""
 	help
-	  Provide a directory path that contains the overlay files
-	  for the custom configuration. The path is based on the
-	  buildroot top directory.
+	  Provide the directory path that contains the overlay file
+	  for a custom processor configuration. The path is relative
+	  to the top directory of buildroot.
+	  These overlay files are tar packages with updated configuration
+	  files for various toolchain packages and Xtensa processor
+	  configurations. They are provided by the processor vendor or
+	  directly from Tensilica.
 
 config BR2_ARCH
 	default "xtensa"	if BR2_xtensa
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 82f8fd2..92e0a74 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -68,11 +68,11 @@ define BINUTILS_INSTALL_TARGET_CMDS
 endef
 endif
 
-XTENSA_CORE_NAME = $(call qstrip, $(BR2_xtensa_core_name))
+XTENSA_CORE_NAME = $(call qstrip, $(BR2_XTENSA_CORE_NAME))
 ifneq ($(XTENSA_CORE_NAME),)
 define BINUTILS_XTENSA_PRE_PATCH
-	tar xf $(BR2_xtensa_overlay_dir)/xtensa_$(XTENSA_CORE_NAME).tar \
-		-C $(@D) bfd include ld
+	tar xf $(BR2_XTENSA_OVERLAY_DIR)/xtensa_$(XTENSA_CORE_NAME).tar \
+		-C $(@D) --strip-components=1 binutils
 endef
 HOST_BINUTILS_PRE_PATCH_HOOKS += BINUTILS_XTENSA_PRE_PATCH
 endif
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 1710070..7a0b4ca 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -251,9 +251,9 @@ $(GCC_DIR)/.unpacked: $(DL_DIR)/$(GCC_SOURCE)
 	rm -rf $(GCC_DIR)
 	$(GCC_CAT) $(DL_DIR)/$(GCC_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
 	$(call CONFIG_UPDATE,$(@D))
-ifneq ($(call qstrip, $(BR2_xtensa_core_name)),)
-	tar xf $(BR2_xtensa_overlay_dir)/xtensa_$(call qstrip,\
-		$(BR2_xtensa_core_name)).tar -C $(@D) include
+ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
+	tar xf $(BR2_XTENSA_OVERLAY_DIR)/xtensa_$(call qstrip,\
+		$(BR2_XTENSA_CORE_NAME)).tar -C $(@D) --strip-components=1 gcc
 endif
 	touch $@
 
diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
index dc305a6..c42c755 100644
--- a/toolchain/gdb/gdb.mk
+++ b/toolchain/gdb/gdb.mk
@@ -25,9 +25,9 @@ gdb-unpacked: $(GDB_DIR)/.unpacked
 $(GDB_DIR)/.unpacked: $(DL_DIR)/$(GDB_SOURCE)
 	mkdir -p $(GDB_DIR)
 	$(GDB_CAT) $(DL_DIR)/$(GDB_SOURCE) | tar -C $(GDB_DIR) $(TAR_STRIP_COMPONENTS)=1 $(TAR_OPTIONS) -
-ifneq ($(call qstrip, $(BR2_xtensa_core_name)),)
-	tar xf $(BR2_xtensa_overlay_dir)/xtensa_$(call qstrip, \
-		$(BR2_xtensa_core_name)).tar -C $(@D) bfd include gdb
+ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
+	tar xf $(BR2_XTENSA_OVERLAY_DIR)/xtensa_$(call qstrip, \
+		$(BR2_XTENSA_CORE_NAME)).tar -C $(@D) --strip-components=1 gdb
 endif
 ifneq ($(wildcard $(GDB_PATCH_DIR)),)
 	support/scripts/apply-patches.sh $(GDB_DIR) $(GDB_PATCH_DIR) \*.patch
