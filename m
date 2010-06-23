From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jun 2010 11:27:29 +0200
Subject: [Buildroot] [git commit master 1/1] New, simpler,
	infrastructure for building the Linux kernel
Message-ID: <20100623092835.4977181886@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=487e21cff69b30b404146b2ffb46959a728a4002
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch introduces a single, simple, infrastructure to build the
Linux kernel. The configuration is limited to :

 * Kernel version: a fixed recent stable version, same as kernel
   headers version (for internal toolchains only), custom stable
   version, or custom tarball URL

 * Kernel patch: either a local file, directory or an URL

 * Kernel configuration: either the name of a defconfig or the
   location of a custom configuration file

 * Kernel image: either uImage, bzImage, zImage or vmlinux.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in       |    2 +-
 Makefile        |    1 +
 linux/Config.in |  133 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 linux/linux.mk  |  118 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 253 insertions(+), 1 deletions(-)
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
index 7e00b65..3bf23d9 100644
--- a/Makefile
+++ b/Makefile
@@ -323,6 +323,7 @@ endif
 
 include boot/common.mk
 include target/Makefile.in
+include linux/linux.mk
 include fs/common.mk
 
 TARGETS+=erase-fakeroots
diff --git a/linux/Config.in b/linux/Config.in
new file mode 100644
index 0000000..d8a5157
--- /dev/null
+++ b/linux/Config.in
@@ -0,0 +1,133 @@
+menu "Kernel"
+
+config BR2_LINUX_KERNEL
+	bool "Linux Kernel"
+	help
+	  Enable this option if you want to build a Linux kernel for
+	  your embedded device
+
+if BR2_LINUX_KERNEL
+
+#
+# Version selection. We provide the choice between:
+#
+#  1. A single fairly recent stable kernel version
+#  2. In case an internal toolchain has been built, the same kernel
+#     version as the kernel headers
+#  3. A custom stable version
+#  4. A custom tarball
+#
+choice
+	prompt "Kernel version"
+	default BR2_LINUX_KERNEL_2_6_34
+
+config BR2_LINUX_KERNEL_2_6_34
+	bool "2.6.34"
+
+config BR2_LINUX_KERNEL_SAME_AS_HEADERS
+	bool "Same as toolchain kernel headers"
+	depends on BR2_TOOLCHAIN_BUILDROOT
+	help
+	  This option will re-use the same kernel sources as the one
+	  that have been used for the kernel headers of the
+	  cross-compiling toolchain. Having the same version for the
+	  kernel running on the system and for the kernel headers is
+	  not a requirement, but using the same version allows to
+	  download only one tarball of the kernel sources.
+
+config BR2_LINUX_KERNEL_CUSTOM_VERSION
+	bool "Custom version"
+	help
+	  This option allows to use a specific 2.6.x or 2.6.x.y
+	  official versions, as available on kernel.org
+
+config BR2_LINUX_KERNEL_CUSTOM_TARBALL
+	bool "Custom tarball"
+	help
+	  This option allows to specify the http or ftp location of a
+	  specific kernel source tarball
+
+endchoice
+
+config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
+	string "Kernel version"
+	depends on BR2_LINUX_KERNEL_CUSTOM_VERSION
+	default "2.6.34"
+
+config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
+	string "URL of custom kernel tarball"
+	depends on BR2_LINUX_KERNEL_CUSTOM_TARBALL
+
+config BR2_LINUX_KERNEL_VERSION
+	string
+	default "2.6.34" if BR2_LINUX_KERNEL_2_6_34
+	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
+	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
+	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
+
+#
+# Patch selection
+#
+
+config BR2_LINUX_KERNEL_PATCH
+	string "Custom kernel patch"
+	help
+         The location can be an URL, a file path, or a directory. In
+         the case of a directory, all files matching linux-*.patch
+         will be applied.
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
+	bool "Using a defconfig"
+
+config BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG
+	bool "Using a custom config file"
+
+endchoice
+
+config BR2_LINUX_KERNEL_DEFCONFIG
+	string "Defconfig name"
+	depends on BR2_LINUX_KERNEL_USE_DEFCONFIG
+	help
+	 Name of the defconfig file to use, without the leading
+	 _defconfig
+
+config BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE
+	string "Configuration file path"
+	depends on BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG
+	help
+	  Path to the kernel configuration file
+
+#
+# Binary format
+#
+
+choice
+	prompt "Kernel binary format"
+	default BR2_LINUX_KERNEL_UIMAGE if !BR2_i386 && !BR2_x86_64
+	default BR2_LINUX_KERNEL_BZIMAGE if BR2_i386 || BR2_x86_64
+
+config BR2_LINUX_KERNEL_UIMAGE
+	bool "uImage"
+
+config BR2_LINUX_KERNEL_BZIMAGE
+	bool "bzImage"
+
+config BR2_LINUX_KERNEL_ZIMAGE
+	bool "zImage"
+
+config BR2_LINUX_KERNEL_VMLINUX
+	bool "vmlinux"
+
+endchoice
+
+endif # BR2_LINUX_KERNEL
+
+endmenu
diff --git a/linux/linux.mk b/linux/linux.mk
new file mode 100644
index 0000000..3e91eca
--- /dev/null
+++ b/linux/linux.mk
@@ -0,0 +1,118 @@
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
+LINUX26_SITE:=$(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
+endif
+
+LINUX26_DIR:=$(BUILD_DIR)/linux-$(LINUX26_VERSION)
+LINUX26_PATCH=$(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
+
+LINUX26_MAKE_FLAGS = \
+	HOSTCC="$(HOSTCC)" \
+	HOSTCFLAGS="$(HOSTCFLAGS)" \
+	ARCH=$(KERNEL_ARCH) \
+	INSTALL_MOD_PATH=$(TARGET_DIR) \
+	CROSS_COMPILE=$(TARGET_CROSS) \
+	LDFLAGS="$(TARGET_LDFLAGS)" \
+	LZMA="$(LZMA)"
+
+# Get the real Linux version, which tells us where kernel modules are
+# going to be installed in the target filesystem.
+LINUX26_VERSION_PROBED = $(shell $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) --no-print-directory -s kernelrelease)
+
+ifeq ($(BR2_LINUX_KERNEL_UIMAGE),y)
+LINUX26_IMAGE_NAME=uImage
+LINUX26_DEPENDENCIES+=$(MKIMAGE)
+else ifeq ($(BR2_LINUX_KERNEL_BZIMAGE),y)
+LINUX26_IMAGE_NAME=bzImage
+else ifeq ($(BR2_LINUX_KERNEL_ZIMAGE),y)
+LINUX26_IMAGE_NAME=zImage
+else ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
+LINUX26_IMAGE_NAME=vmlinux.bin
+endif
+
+LINUX26_IMAGE_PATH=$(LINUX26_DIR)/arch/$(KERNEL_ARCH)/boot/$(LINUX26_IMAGE_NAME)
+
+# Download
+$(LINUX26_DIR)/.stamp_downloaded:
+	@$(call MESSAGE,"Downloading kernel")
+	$(call DOWNLOAD,$(LINUX26_SITE),$(LINUX26_SOURCE))
+ifneq ($(filter ftp://% http://%,$(LINUX26_PATCH)),)
+	$(call DOWNLOAD,$(dir $(LINUX26_PATCH)),$(notdir $(LINUX26_PATCH)))
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
+ifneq ($(LINUX26_PATCH),)
+ifneq ($(filter ftp://% http://%,$(LINUX26_PATCH)),)
+	toolchain/patch-kernel.sh $(@D) $(DL_DIR) $(notdir $(LINUX26_PATCH))
+else ifeq ($(shell test -d $(LINUX26_PATCH) && echo "dir"),dir)
+	toolchain/patch-kernel.sh $(@D) $(LINUX26_PATCH) linux-\*.patch
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
+	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(@D) $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
+else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
+	cp $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE) $(@D)/.config
+endif
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) oldconfig
+	$(Q)touch $@
+
+# Compilation
+$(LINUX26_DIR)/.stamp_compiled: $(LINUX26_DIR)/.stamp_configured
+	@$(call MESSAGE,"Compiling kernel")
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) $(LINUX26_IMAGE_NAME)
+	@if [ $(shell grep -c "CONFIG_MODULES=y" $(LINUX26_DIR)/.config) != 0 ] ; then 	\
+		$(TARGET_MAKE_ENV) $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) modules ;	\
+	fi
+	$(Q)touch $@
+
+# Installation
+$(LINUX26_DIR)/.stamp_installed: $(LINUX26_DIR)/.stamp_compiled
+	@$(call MESSAGE,"Installing kernel")
+	cp $(LINUX26_IMAGE_PATH) $(BINARIES_DIR)
+	# Install modules and remove symbolic links pointing to build
+	# directories, not relevant on the target
+	@if [ $(shell grep -c "CONFIG_MODULES=y" $(LINUX26_DIR)/.config) != 0 ] ; then 	\
+		$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(@D) 		\
+			INSTALL_MOD_PATH=$(TARGET_DIR) modules_install ;		\
+		rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/build ;	\
+		rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/source ;	\
+	fi
+	$(Q)touch $@
+
+linux26: $(LINUX26_DEPENDENCIES) $(LINUX26_DIR)/.stamp_installed
+
+ifeq ($(BR2_LINUX_KERNEL),y)
+TARGETS+=linux26
+endif
-- 
1.7.1
