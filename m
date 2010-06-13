From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Jun 2010 20:50:05 +0200
Subject: [Buildroot] [PATCH 01/10] New, simpler,
	infrastructure for building the Linux kernel
In-Reply-To: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
References: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
Message-ID: <851a84fbbe113196adb69e1a241e18a958cd77c2.1276454802.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch introduces a single, simple, infrastructure to build the
Linux kernel. The configuration is limited to :

 * Kernel version: a fixed recent stable version, custom stable
   version, or custom tarball URL

 * Kernel patch: either a local file, directory or an URL

 * Kernel configuration: either the name of a defconfig or the
   location of a custom configuration file

 * Kernel image: either uImage, bzImage, zImage or vmlinux.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in       |    2 +-
 Makefile        |    1 +
 linux/Config.in |  129 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 linux/linux.mk  |  120 +++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 251 insertions(+), 1 deletions(-)
 create mode 100644 linux/Config.in
 create mode 100644 linux/linux.mk

diff --git a/Config.in b/Config.in
index f5eb859..0a07576 100644
--- a/Config.in
+++ b/Config.in
@@ -295,4 +295,4 @@ source "fs/Config.in"
 
 source "boot/Config.in"
 
-source "target/Config.in"
+source "linux/Config.in"
diff --git a/Makefile b/Makefile
index 67e41ae..a72dc80 100644
--- a/Makefile
+++ b/Makefile
@@ -322,6 +322,7 @@ endif
 
 include boot/common.mk
 include target/Makefile.in
+include linux/linux.mk
 include fs/common.mk
 
 TARGETS+=erase-fakeroots
diff --git a/linux/Config.in b/linux/Config.in
new file mode 100644
index 0000000..8449d6b
--- /dev/null
+++ b/linux/Config.in
@@ -0,0 +1,129 @@
+menu "Kernel"
+
+config BR2_LINUX_KERNEL
+	bool "Linux Kernel"
+
+if BR2_LINUX_KERNEL
+
+#
+# Version selection. We provide the choice between:
+#
+#  1. A limited number of stable versions
+#  2. A custom stable version
+#  3. A custom tarball
+#
+choice
+	prompt "Kernel version"
+	default BR2_LINUX_KERNEL_2_6_34
+
+config BR2_LINUX_KERNEL_2_6_34
+	bool "2.6.34"
+
+config BR2_LINUX_KERNEL_CUSTOM_STABLE
+	bool "Custom stable version"
+
+config BR2_LINUX_KERNEL_CUSTOM_TARBALL
+	bool "Custom tarball"
+
+endchoice
+
+if BR2_LINUX_KERNEL_CUSTOM_STABLE
+
+config BR2_LINUX_KERNEL_CUSTOM_STABLE_VALUE
+	string "Stable kernel version"
+	default "2.6.34"
+
+endif # BR2_LINUX_KERNEL_CUSTOM_STABLE
+
+if BR2_LINUX_KERNEL_CUSTOM_TARBALL
+
+config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
+	string "URL of custom kernel tarball"
+
+endif # BR2_LINUX_KERNEL_CUSTOM_TARBALL
+
+config BR2_LINUX_KERNEL_VERSION
+	string
+	default "2.6.34" if BR2_LINUX_KERNEL_2_6_34
+	default BR2_LINUX_KERNEL_CUSTOM_STABLE_VALUE if BR2_LINUX_KERNEL_CUSTOM_STABLE
+	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
+
+#
+# Patch selection
+#
+
+config BR2_LINUX_KERNEL_PATCH
+       bool "Custom patch for the Linux kernel"
+
+if BR2_LINUX_KERNEL_PATCH
+
+config BR2_LINUX_KERNEL_PATCH_LOCATION
+       string "Location of custom kernel patch"
+       help
+         The location can be an URL, a file path, or a directory. In
+         the case of a directory, all files matching linux-*.patch
+         will be applied.
+
+endif # BR2_LINUX_KERNEL_PATCH
+
+#
+# Configuration selection
+#
+
+choice
+	prompt "Kernel configuration"
+	default BR2_LINUX_KERNEL_USE_DEFCONFIG
+
+config BR2_LINUX_KERNEL_USE_DEFCONFIG
+       bool "Using a defconfig"
+
+config BR2_LINUX_KERNEL_USE_CUSTOM
+       bool "Using a custom config file"
+
+endchoice
+
+if BR2_LINUX_KERNEL_USE_DEFCONFIG
+
+config BR2_LINUX_KERNEL_DEFCONFIG
+       string "Defconfig name"
+       help
+	 Name of the defconfig file to use, without the leading
+	 _defconfig.
+
+endif # BR2_LINUX_KERNEL_USE_DEFCONFIG
+
+if BR2_LINUX_KERNEL_USE_CUSTOM
+
+config BR2_LINUX_KERNEL_CUSTOM_FILE
+       string "Configuration file path"
+       help
+         Path to the kernel configuration file.
+
+endif # BR2_LINUX_KERNEL_USE_CUSTOM
+
+#
+# Binary format
+#
+
+choice
+	prompt "Kernel binary format"
+	default BR2_LINUX_KERNEL_UIMAGE if !BR2_386
+	default BR2_LINUX_KERNEL_BZIMAGE if BR2_386
+
+config BR2_LINUX_KERNEL_UIMAGE
+       bool "uImage"
+
+config BR2_LINUX_KERNEL_BZIMAGE
+       bool "bzImage"
+
+config BR2_LINUX_KERNEL_ZIMAGE
+       bool "zImage"
+
+config BR2_LINUX_KERNEL_VMLINUX
+       bool "vmlinux"
+
+endchoice
+
+endif # BR2_LINUX_KERNEL
+
+endmenu
diff --git a/linux/linux.mk b/linux/linux.mk
new file mode 100644
index 0000000..39abdea
--- /dev/null
+++ b/linux/linux.mk
@@ -0,0 +1,120 @@
+###############################################################################
+#
+# Linux kernel 2.6 target
+#
+###############################################################################
+LINUX26_VERSION=$(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
+
+# Compute LINUX26_SOURCE and LINUX26_SITE from the configuration
+ifeq ($(LINUX26_VERSION),custom)
+LINUX26_TARBALL:=$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
+LINUX26_SITE:=$(dir $(LINUX26_TARBALL))
+LINUX26_SOURCE:=$(notdir $(LINUX26_TARBALL))
+else
+LINUX26_SOURCE:=linux-$(LINUX26_VERSION).tar.bz2
+LINUX26_SITE:=http://kernel.org/pub/linux/kernel/v2.6/
+endif
+
+LINUX26_DIR:=$(BUILD_DIR)/linux-$(LINUX26_VERSION)
+LINUX26_PATCH=$(call qstrip,$(BR2_LINUX_KERNEL_PATCH_LOCATION))
+
+LINUX26_MAKE_FLAGS = \
+	HOSTCC="$(HOSTCC)" HOSTCFLAGS="$(HOSTCFLAGS)" \
+	ARCH=$(KERNEL_ARCH) \
+	INSTALL_MOD_PATH=$(TARGET_DIR) \
+	CROSS_COMPILE=$(TARGET_CROSS) \
+	LDFLAGS="$(TARGET_LDFLAGS)" \
+	LZMA="$(LZMA)" \
+	PATH=$(PATH)
+
+# Get the real Linux version, which tells us where kernel modules are
+# going to be installed in the target filesystem.
+LINUX26_VERSION_PROBED = `$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) --no-print-directory -s kernelrelease`
+
+ifeq ($(BR2_LINUX_KERNEL_UIMAGE),y)
+LINUX26_IMAGE_PATH=$(LINUX26_DIR)/arch/$(KERNEL_ARCH)/boot/uImage
+LINUX26_DEPENDENCIES+=$(MKIMAGE)
+else ifeq ($(BR2_LINUX_KERNEL_BZIMAGE),y)
+LINUX26_IMAGE_PATH=$(LINUX26_DIR)/arch/$(KERNEL_ARCH)/boot/bzImage
+else ifeq ($(BR2_LINUX_KERNEL_ZIMAGE),y)
+LINUX26_IMAGE_PATH=$(LINUX26_DIR)/arch/$(KERNEL_ARCH)/boot/zImage
+else ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
+LINUX26_IMAGE_PATH=$(LINUX26_DIR)/arch/$(KERNEL_ARCH)/boot/vmlinux.bin
+endif
+
+# Download
+$(LINUX26_DIR)/.stamp_downloaded:
+	@$(call MESSAGE,"Downloading kernel")
+	$(call DOWNLOAD,$(LINUX26_SITE),$(LINUX26_SOURCE))
+ifeq ($(BR2_LINUX_KERNEL_PATCH),y)
+ifneq ($(findstring http://,$(LINUX26_PATCH)),)
+	$(call DOWNLOAD,$(dir $(LINUX26_PATCH)),$(notdir $(LINUX26_PATCH)))
+else ifneq ($(findstring ftp://,$(LINUX26_PATCH)),)
+	$(call DOWNLOAD,$(dir $(LINUX26_PATCH)),$(notdir $(LINUX26_PATCH)))
+endif
+endif
+	mkdir -p $(@D)
+	touch $@
+
+# Extraction
+$(LINUX26_DIR)/.stamp_extracted: $(LINUX26_DIR)/.stamp_downloaded
+	@$(call MESSAGE,"Extracting kernel")
+	mkdir -p $(@D)
+	$(Q)$(INFLATE$(suffix $(LINUX26_SOURCE))) $(DL_DIR)/$(LINUX26_SOURCE) | \
+		tar -C $(@D) $(TAR_STRIP_COMPONENTS)=1 $(TAR_OPTIONS) -
+	$(Q)touch $@
+
+# Patch
+$(LINUX26_DIR)/.stamp_patched: $(LINUX26_DIR)/.stamp_extracted
+	@$(call MESSAGE,"Patching kernel")
+ifeq ($(BR2_LINUX_KERNEL_PATCH),y)
+ifneq ($(findstring http://,$(LINUX26_PATCH)),)
+	toolchain/patch-kernel.sh $(@D) $(DL_DIR) $(notdir $(LINUX26_PATCH))
+else ifneq ($(findstring ftp://,$(LINUX26_PATCH)),)
+	toolchain/patch-kernel.sh $(@D) $(DL_DIR) $(notdir $(LINUX26_PATCH))
+else ifeq ($(shell test -d $(LINUX26_PATCH) && echo "dir"),dir)
+	toolchain/patch-kernel.sh $(@D) $(LINUX26_PATCH) linux-*.patch
+else
+	toolchain/patch-kernel.sh $(@D) $(dir $(LINUX26_PATCH)) $(notdir $(LINUX26_PATCH))
+endif
+endif
+	$(Q)touch $@
+
+
+# Configuration
+$(LINUX26_DIR)/.stamp_configured: $(LINUX26_DIR)/.stamp_patched
+	@$(call MESSAGE,"Configuring kernel")
+ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
+	$(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(@D) $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
+else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM),y)
+	cp $(BR2_LINUX_KERNEL_CUSTOM_FILE) $(@D)/.config
+	yes "" | $(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(@D) oldconfig
+endif
+	$(Q)touch $@
+
+# Compilation
+$(LINUX26_DIR)/.stamp_compiled: $(LINUX26_DIR)/.stamp_configured
+	@$(call MESSAGE,"Compiling kernel")
+	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D)
+ifeq ($(BR2_LINUX_KERNEL_UIMAGE),y)
+	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) uImage
+endif
+	$(Q)touch $@
+
+# Installation
+$(LINUX26_DIR)/.stamp_installed: $(LINUX26_DIR)/.stamp_compiled
+	@$(call MESSAGE,"Installing kernel")
+	cp $(LINUX26_IMAGE_PATH) $(BINARIES_DIR)
+	$(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(@D) \
+		INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
+	# Remove symbolic links pointing to build directories, not
+	# relevant on the target
+	rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/build
+	rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/source
+	$(Q)touch $@
+
+linux26: $(LINUX26_DEPENDENCIES) $(LINUX26_DIR)/.stamp_installed
+
+ifeq ($(BR2_LINUX_KERNEL),y)
+TARGETS+=linux26
+endif
\ No newline at end of file
-- 
1.7.0.4
