From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Nov 2012 14:53:52 +0100
Subject: [Buildroot] [PATCH 5/6] xtensa: support configurable processor
	configurations
In-Reply-To: <cover.1352987586.git.thomas.petazzoni@free-electrons.com>
References: <cover.1352987586.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7c693cd311e2993cf78952db386b977b21196979.1352987586.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Chris Zankel <chris@zankel.net>

Xtensa is a configurable processor architecture, which allows to define
additional instructions and registers. The required variant specific
information for the toolchain is delivered in an 'overlay' file, which
needs to be 'untarred' to the corresponding directories after the
source is installed and patched.
This patch provides support for binutils, gcc, and gdb with a very
limited changes to the build scripts. These additions are only executed
for the Xtensa architecture and have no effect on other architectures.

[Thomas: rebased on top of the 'arch: improve definition of gcc mtune,
mcpu, etc.' patch, and changed 'Target ABI' to 'Target Architecture
Variant'].

Signed-off-by: Chris Zankel <chris@zankel.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.xtensa           |   31 +++++++++++++++++++++++++++++++
 package/binutils/binutils.mk    |    9 +++++++++
 toolchain/gcc/gcc-uclibc-4.x.mk |    4 ++++
 toolchain/gdb/gdb.mk            |    4 ++++
 4 files changed, 48 insertions(+)

diff --git a/arch/Config.in.xtensa b/arch/Config.in.xtensa
index 66749ee..af66125 100644
--- a/arch/Config.in.xtensa
+++ b/arch/Config.in.xtensa
@@ -1,2 +1,33 @@
+choice
+	prompt "Target Architecture Variant"
+	depends on BR2_xtensa
+	default BR2_xtensa_fsf
+config BR2_xtensa_custom
+	bool "Custom Xtensa processor configuration"
+config BR2_xtensa_fsf
+	bool "fsf - Default configuration"
+endchoice
+
+config BR2_xtensa_custom_name
+	string "Custom Xtensa processor configuration anme"
+	depends on BR2_xtensa_custom
+	default ""
+	help
+	  Name given to a custom Xtensa processor configuration.
+
+config BR2_xtensa_core_name
+	string
+	default BR2_xtensa_custom_name	if BR2_xtensa_custom
+	default ""			if BR2_xtensa_fsf
+
+config BR2_xtensa_overlay_dir
+	string "Overlay directory for custom configuration"
+	depends on BR2_xtensa_custom
+	default ""
+	help
+	  Provide a directory path that contains the overlay files
+	  for the custom configuration. The path is based on the
+	  buildroot top directory.
+
 config BR2_ARCH
 	default "xtensa"	if BR2_xtensa
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 6c51fc7..82f8fd2 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -68,5 +68,14 @@ define BINUTILS_INSTALL_TARGET_CMDS
 endef
 endif
 
+XTENSA_CORE_NAME = $(call qstrip, $(BR2_xtensa_core_name))
+ifneq ($(XTENSA_CORE_NAME),)
+define BINUTILS_XTENSA_PRE_PATCH
+	tar xf $(BR2_xtensa_overlay_dir)/xtensa_$(XTENSA_CORE_NAME).tar \
+		-C $(@D) bfd include ld
+endef
+HOST_BINUTILS_PRE_PATCH_HOOKS += BINUTILS_XTENSA_PRE_PATCH
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 1a075cc..1710070 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -251,6 +251,10 @@ $(GCC_DIR)/.unpacked: $(DL_DIR)/$(GCC_SOURCE)
 	rm -rf $(GCC_DIR)
 	$(GCC_CAT) $(DL_DIR)/$(GCC_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
 	$(call CONFIG_UPDATE,$(@D))
+ifneq ($(call qstrip, $(BR2_xtensa_core_name)),)
+	tar xf $(BR2_xtensa_overlay_dir)/xtensa_$(call qstrip,\
+		$(BR2_xtensa_core_name)).tar -C $(@D) include
+endif
 	touch $@
 
 gcc-patched: $(GCC_DIR)/.patched
diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
index 6b029a8..dc305a6 100644
--- a/toolchain/gdb/gdb.mk
+++ b/toolchain/gdb/gdb.mk
@@ -25,6 +25,10 @@ gdb-unpacked: $(GDB_DIR)/.unpacked
 $(GDB_DIR)/.unpacked: $(DL_DIR)/$(GDB_SOURCE)
 	mkdir -p $(GDB_DIR)
 	$(GDB_CAT) $(DL_DIR)/$(GDB_SOURCE) | tar -C $(GDB_DIR) $(TAR_STRIP_COMPONENTS)=1 $(TAR_OPTIONS) -
+ifneq ($(call qstrip, $(BR2_xtensa_core_name)),)
+	tar xf $(BR2_xtensa_overlay_dir)/xtensa_$(call qstrip, \
+		$(BR2_xtensa_core_name)).tar -C $(@D) bfd include gdb
+endif
 ifneq ($(wildcard $(GDB_PATCH_DIR)),)
 	support/scripts/apply-patches.sh $(GDB_DIR) $(GDB_PATCH_DIR) \*.patch
 endif
-- 
1.7.9.5
