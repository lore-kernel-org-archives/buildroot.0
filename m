From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 17 Nov 2010 02:03:46 -0500
Subject: [Buildroot] [PATCH] linux: support unpacked source trees
Message-ID: <1289977426-18642-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I keep the kernel sources for my target laying around on my system
(since that's what I'm developing against), so having to manage a
tarball with it is a pita.  So add a new "local tree" option so that
people can point the build system to that.

While I could have this new option "unpack" the tree into the br
tree by doing a recursive cp or rsync, it seems like it makes more
sense to support out-of-tree building (O=).  So split the linux.mk
logic to have a "source" and "build" dir.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 linux/Config.in |   11 +++++++++-
 linux/linux.mk  |   58 +++++++++++++++++++++++++++++++++---------------------
 2 files changed, 45 insertions(+), 24 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 4cc9946..480adca 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -47,6 +47,11 @@ config BR2_LINUX_KERNEL_CUSTOM_TARBALL
 	  This option allows to specify the http or ftp location of a
 	  specific kernel source tarball
 
+config BR2_LINUX_KERNEL_CUSTOM_TREE
+	bool "Custom unpacked tree"
+	help
+	  This option allows use of an already unpacked linux tree.
+
 endchoice
 
 config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
@@ -58,12 +63,16 @@ config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
 	string "URL of custom kernel tarball"
 	depends on BR2_LINUX_KERNEL_CUSTOM_TARBALL
 
+config BR2_LINUX_KERNEL_CUSTOM_PATH
+	string "PATH of custom kernel tree"
+	depends on BR2_LINUX_KERNEL_CUSTOM_TREE
+
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "2.6.36" if BR2_LINUX_KERNEL_2_6_36
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
-	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
+	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL || BR2_LINUX_KERNEL_CUSTOM_TREE
 
 #
 # Patch selection
diff --git a/linux/linux.mk b/linux/linux.mk
index 69cab9f..17c4b48 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -7,15 +7,22 @@ LINUX26_VERSION=$(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 
 # Compute LINUX26_SOURCE and LINUX26_SITE from the configuration
 ifeq ($(LINUX26_VERSION),custom)
+ifneq ($(BR2_LINUX_KERNEL_CUSTOM_TREE),y)
 LINUX26_TARBALL:=$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
 LINUX26_SITE:=$(dir $(LINUX26_TARBALL))
 LINUX26_SOURCE:=$(notdir $(LINUX26_TARBALL))
+endif
 else
 LINUX26_SOURCE:=linux-$(LINUX26_VERSION).tar.bz2
 LINUX26_SITE:=$(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
 endif
 
-LINUX26_DIR:=$(BUILD_DIR)/linux-$(LINUX26_VERSION)
+LINUX26_BUILD_DIR:=$(BUILD_DIR)/linux-$(LINUX26_VERSION)
+ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TREE),y)
+LINUX26_SOURCE_DIR := $(BR2_LINUX_KERNEL_CUSTOM_PATH)
+else
+LINUX26_SOURCE_DIR := $(LINUX26_BUILD_DIR)
+endif
 LINUX26_PATCH=$(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 
 LINUX26_MAKE_FLAGS = \
@@ -26,10 +33,13 @@ LINUX26_MAKE_FLAGS = \
 	CROSS_COMPILE=$(TARGET_CROSS) \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
 	LZMA="$(LZMA)"
+ifneq ($(LINUX26_SOURCE_DIR),$(LINUX26_BUILD_DIR))
+LINUX26_MAKE_FLAGS += O="$(LINUX26_BUILD_DIR)"
+endif
 
 # Get the real Linux version, which tells us where kernel modules are
 # going to be installed in the target filesystem.
-LINUX26_VERSION_PROBED = $(shell $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) --no-print-directory -s kernelrelease)
+LINUX26_VERSION_PROBED = $(shell $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_SOURCE_DIR) --no-print-directory -s kernelrelease)
 
 ifeq ($(BR2_LINUX_KERNEL_UIMAGE),y)
 ifeq ($(KERNEL_ARCH),blackfin)
@@ -47,13 +57,13 @@ LINUX26_IMAGE_NAME=vmlinux.bin
 endif
 
 ifeq ($(KERNEL_ARCH),avr32)
-LINUX26_IMAGE_PATH=$(LINUX26_DIR)/arch/$(KERNEL_ARCH)/boot/images/$(LINUX26_IMAGE_NAME)
+LINUX26_IMAGE_PATH=$(LINUX26_BUILD_DIR)/arch/$(KERNEL_ARCH)/boot/images/$(LINUX26_IMAGE_NAME)
 else
-LINUX26_IMAGE_PATH=$(LINUX26_DIR)/arch/$(KERNEL_ARCH)/boot/$(LINUX26_IMAGE_NAME)
+LINUX26_IMAGE_PATH=$(LINUX26_BUILD_DIR)/arch/$(KERNEL_ARCH)/boot/$(LINUX26_IMAGE_NAME)
 endif
 
 # Download
-$(LINUX26_DIR)/.stamp_downloaded:
+$(LINUX26_BUILD_DIR)/.stamp_downloaded:
 	@$(call MESSAGE,"Downloading kernel")
 	$(call DOWNLOAD,$(LINUX26_SITE),$(LINUX26_SOURCE))
 ifneq ($(filter ftp://% http://%,$(LINUX26_PATCH)),)
@@ -63,15 +73,17 @@ endif
 	touch $@
 
 # Extraction
-$(LINUX26_DIR)/.stamp_extracted: $(LINUX26_DIR)/.stamp_downloaded
+$(LINUX26_BUILD_DIR)/.stamp_extracted: $(LINUX26_BUILD_DIR)/.stamp_downloaded
+ifneq ($(BR2_LINUX_KERNEL_CUSTOM_TREE),y)
 	@$(call MESSAGE,"Extracting kernel")
 	mkdir -p $(@D)
 	$(Q)$(INFLATE$(suffix $(LINUX26_SOURCE))) $(DL_DIR)/$(LINUX26_SOURCE) | \
 		tar -C $(@D) $(TAR_STRIP_COMPONENTS)=1 $(TAR_OPTIONS) -
+endif
 	$(Q)touch $@
 
 # Patch
-$(LINUX26_DIR)/.stamp_patched: $(LINUX26_DIR)/.stamp_extracted
+$(LINUX26_BUILD_DIR)/.stamp_patched: $(LINUX26_BUILD_DIR)/.stamp_extracted
 	@$(call MESSAGE,"Patching kernel")
 ifneq ($(LINUX26_PATCH),)
 ifneq ($(filter ftp://% http://%,$(LINUX26_PATCH)),)
@@ -86,10 +98,10 @@ endif
 
 
 # Configuration
-$(LINUX26_DIR)/.stamp_configured: $(LINUX26_DIR)/.stamp_patched
+$(LINUX26_BUILD_DIR)/.stamp_configured: $(LINUX26_BUILD_DIR)/.stamp_patched
 	@$(call MESSAGE,"Configuring kernel")
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
-	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(@D) $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
+	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_SOURCE_DIR) $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
 	cp $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE) $(@D)/.config
 endif
@@ -113,27 +125,27 @@ ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
 	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,\"$(BINARIES_DIR)/rootfs.initramfs\",$(@D)/.config)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_GZIP,$(@D)/.config)
 endif
-	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) oldconfig
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_SOURCE_DIR) oldconfig
 	$(Q)touch $@
 
 # Compilation. We make sure the kernel gets rebuilt when the
 # configuration has changed.
-$(LINUX26_DIR)/.stamp_compiled: $(LINUX26_DIR)/.stamp_configured $(LINUX26_DIR)/.config
+$(LINUX26_BUILD_DIR)/.stamp_compiled: $(LINUX26_BUILD_DIR)/.stamp_configured $(LINUX26_BUILD_DIR)/.config
 	@$(call MESSAGE,"Compiling kernel")
-	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) $(LINUX26_IMAGE_NAME)
-	@if [ $(shell grep -c "CONFIG_MODULES=y" $(LINUX26_DIR)/.config) != 0 ] ; then 	\
-		$(TARGET_MAKE_ENV) $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) modules ;	\
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_SOURCE_DIR) $(LINUX26_IMAGE_NAME)
+	@if [ $(shell grep -c "CONFIG_MODULES=y" $(LINUX26_BUILD_DIR)/.config) != 0 ] ; then 	\
+		$(TARGET_MAKE_ENV) $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_SOURCE_DIR) modules ;	\
 	fi
 	$(Q)touch $@
 
 # Installation
-$(LINUX26_DIR)/.stamp_installed: $(LINUX26_DIR)/.stamp_compiled
+$(LINUX26_BUILD_DIR)/.stamp_installed: $(LINUX26_BUILD_DIR)/.stamp_compiled
 	@$(call MESSAGE,"Installing kernel")
 	cp $(LINUX26_IMAGE_PATH) $(BINARIES_DIR)
 	# Install modules and remove symbolic links pointing to build
 	# directories, not relevant on the target
-	@if [ $(shell grep -c "CONFIG_MODULES=y" $(LINUX26_DIR)/.config) != 0 ] ; then 	\
-		$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(@D) 		\
+	@if [ $(shell grep -c "CONFIG_MODULES=y" $(LINUX26_BUILD_DIR)/.config) != 0 ] ; then 	\
+		$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_SOURCE_DIR) 		\
 			INSTALL_MOD_PATH=$(TARGET_DIR) modules_install ;		\
 		find $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED) -type f -name "*o" | \
 			xargs -r $(TARGET_CROSS)strip -R .comment -R .note -g --strip-unneeded ; \
@@ -142,27 +154,27 @@ $(LINUX26_DIR)/.stamp_installed: $(LINUX26_DIR)/.stamp_compiled
 	fi
 	$(Q)touch $@
 
-linux26: host-module-init-tools $(LINUX26_DEPENDENCIES) $(LINUX26_DIR)/.stamp_installed
+linux26: host-module-init-tools $(LINUX26_DEPENDENCIES) $(LINUX26_BUILD_DIR)/.stamp_installed
 
-linux26-menuconfig linux26-xconfig linux26-gconfig: dirs $(LINUX26_DIR)/.stamp_configured
-	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(subst linux26-,,$@)
+linux26-menuconfig linux26-xconfig linux26-gconfig: dirs $(LINUX26_BUILD_DIR)/.stamp_configured
+	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_BUILD_DIR) $(subst linux26-,,$@)
 
 # Support for rebuilding the kernel after the initramfs file list has
 # been generated in $(BINARIES_DIR)/rootfs.initramfs.
-$(LINUX26_DIR)/.stamp_initramfs_rebuilt: $(LINUX26_DIR)/.stamp_installed $(BINARIES_DIR)/rootfs.initramfs
+$(LINUX26_BUILD_DIR)/.stamp_initramfs_rebuilt: $(LINUX26_BUILD_DIR)/.stamp_installed $(BINARIES_DIR)/rootfs.initramfs
 	@$(call MESSAGE,"Rebuilding kernel with initramfs")
 	# Remove the previously generated initramfs which was empty,
 	# to make sure the kernel will actually regenerate it.
 	$(RM) -f $(@D)/usr/initramfs_data.cpio*
 	# Build the kernel.
-	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) $(LINUX26_IMAGE_NAME)
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_SOURCE_DIR) $(LINUX26_IMAGE_NAME)
 	# Copy the kernel image to its final destination
 	cp $(LINUX26_IMAGE_PATH) $(BINARIES_DIR)
 	$(Q)touch $@
 
 # The initramfs building code must make sure this target gets called
 # after it generated the initramfs list of files.
-linux26-rebuild-with-initramfs: $(LINUX26_DIR)/.stamp_initramfs_rebuilt
+linux26-rebuild-with-initramfs: $(LINUX26_BUILD_DIR)/.stamp_initramfs_rebuilt
 
 ifeq ($(BR2_LINUX_KERNEL),y)
 TARGETS+=linux26
-- 
1.7.3.2
