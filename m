From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 May 2011 22:23:12 +0200
Subject: [Buildroot] [PATCH 21/26] linux: convert to the GENTARGETS
	infrastructure
In-Reply-To: <cover.1306782275.git.thomas.petazzoni@free-electrons.com>
References: <cover.1306782275.git.thomas.petazzoni@free-electrons.com>
Message-ID: <9fd3adf3c223ba47b722587b012b566a0b75cfae.1306782275.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |  111 +++++++++++++++++++++++++++-----------------------------
 1 files changed, 53 insertions(+), 58 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index eea84b5..0753fac 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -15,8 +15,10 @@ LINUX_SOURCE  = linux-$(LINUX_VERSION).tar.bz2
 LINUX_SITE    = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
 endif
 
-LINUX_DIR     = $(BUILD_DIR)/linux-$(LINUX_VERSION)
-LINUX_PATCH   = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
+LINUX_PATCHES   = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
+
+LINUX_INSTALL_IMAGES = YES
+LINUX_DEPENDENCIES  += host-module-init-tools
 
 LINUX_MAKE_FLAGS = \
 	HOSTCC="$(HOSTCC)" \
@@ -74,27 +76,17 @@ LINUX_IMAGE_PATH=$(KERNEL_ARCH_PATH)/boot/$(LINUX_IMAGE_NAME)
 endif
 endif # BR2_LINUX_KERNEL_VMLINUX
 
-# Download
-$(LINUX_DIR)/.stamp_downloaded:
-	@$(call MESSAGE,"Downloading kernel")
-	$(call DOWNLOAD,$(LINUX_SITE),$(LINUX_SOURCE))
-	$(foreach patch,$(filter ftp://% http://%,$(LINUX_PATCH)),\
+define LINUX_DOWNLOAD_PATCHES
+	$(if $(LINUX_PATCHES),
+		@$(call MESSAGE,"Download additional patches"))
+	$(foreach patch,$(filter ftp://% http://%,$(LINUX_PATCHES)),\
 		$(call DOWNLOAD,$(dir $(patch)),$(notdir $(patch)))$(sep))
-	mkdir -p $(@D)
-	touch $@
-
-# Extraction
-$(LINUX_DIR)/.stamp_extracted: $(LINUX_DIR)/.stamp_downloaded
-	@$(call MESSAGE,"Extracting kernel")
-	mkdir -p $(@D)
-	$(Q)$(INFLATE$(suffix $(LINUX_SOURCE))) $(DL_DIR)/$(LINUX_SOURCE) | \
-		tar -C $(@D) $(TAR_STRIP_COMPONENTS)=1 $(TAR_OPTIONS) -
-	$(Q)touch $@
+endef
+
+LINUX_POST_DOWNLOAD_HOOKS += LINUX_DOWNLOAD_PATCHES
 
-# Patch
-$(LINUX_DIR)/.stamp_patched: $(LINUX_DIR)/.stamp_extracted
-	@$(call MESSAGE,"Patching kernel")
-	for p in $(LINUX_PATCH) ; do \
+define LINUX_APPLY_PATCHES
+	for p in $(LINUX_PATCHES) ; do \
 		if echo $$p | grep -q -E "^ftp://|^http://" ; then \
 			toolchain/patch-kernel.sh $(@D) $(DL_DIR) `basename $$p` ; \
 		elif test -d $$p ; then \
@@ -103,7 +95,9 @@ $(LINUX_DIR)/.stamp_patched: $(LINUX_DIR)/.stamp_extracted
 			toolchain/patch-kernel.sh $(@D) `dirname $$p` `basename $$p` ; \
 		fi \
 	done
-	$(Q)touch $@
+endef
+
+LINUX_POST_PATCH_HOOKS += LINUX_APPLY_PATCHES
 
 # As we are tweaking the kernel configuration file, we want to run a
 # silent oldconfig pass on the configuration file after having done
@@ -115,60 +109,59 @@ $(LINUX_DIR)/.stamp_patched: $(LINUX_DIR)/.stamp_extracted
 KERNEL_DEFCONFIG_NAME = buildroot_defconfig
 KERNEL_DEFCONFIG_PATH = $(KERNEL_ARCH_PATH)/configs/$(KERNEL_DEFCONFIG_NAME)
 
-# Configuration
-$(LINUX_DIR)/.stamp_configured: $(LINUX_DIR)/.stamp_patched
-	@$(call MESSAGE,"Configuring kernel")
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
-	cp $(KERNEL_ARCH_PATH)/configs/$(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig $(KERNEL_DEFCONFIG_PATH)
+KERNEL_SOURCE_CONFIG = $(KERNEL_ARCH_PATH)/configs/$(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
-	cp $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE) $(KERNEL_DEFCONFIG_PATH)
+KERNEL_SOURCE_CONFIG = $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
 endif
-ifeq ($(BR2_ARM_EABI),y)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(KERNEL_DEFCONFIG_PATH))
-else
-	$(call KCONFIG_DISABLE_OPT,CONFIG_AEABI,$(KERNEL_DEFCONFIG_PATH))
-endif
-ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
+
+define LINUX_CONFIGURE_CMDS
+	cp $(KERNEL_SOURCE_CONFIG) $(KERNEL_DEFCONFIG_PATH)
+	$(if $(BR2_ARM_EABI),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(KERNEL_DEFCONFIG_PATH)),
+		$(call KCONFIG_DISABLE_OPT,CONFIG_AEABI,$(KERNEL_DEFCONFIG_PATH)))
 	# As the kernel gets compiled before root filesystems are
 	# built, we create a fake initramfs file list. It'll be
 	# replaced later by the real list, and the kernel will be
 	# rebuilt using the linux26-rebuild-with-initramfs target.
-	touch $(BINARIES_DIR)/rootfs.initramfs
-	$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_INITRD,$(KERNEL_DEFCONFIG_PATH))
-	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,\"$(BINARIES_DIR)/rootfs.initramfs\",$(KERNEL_DEFCONFIG_PATH))
-	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_UID,0,$(KERNEL_DEFCONFIG_PATH))
-	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0,$(KERNEL_DEFCONFIG_PATH))
-	$(call KCONFIG_DISABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_NONE,$(KERNEL_DEFCONFIG_PATH))
-	$(call KCONFIG_ENABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_GZIP,$(KERNEL_DEFCONFIG_PATH))
-endif
-ifneq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(KERNEL_DEFCONFIG_PATH))
-	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(KERNEL_DEFCONFIG_PATH))
-endif
-ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
-	$(call KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(KERNEL_DEFCONFIG_PATH))
-endif
+	$(if $(BR2_TARGET_ROOTFS_INITRAMFS),
+		touch $(BINARIES_DIR)/rootfs.initramfs
+		$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_INITRD,$(KERNEL_DEFCONFIG_PATH))
+		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,\"$(BINARIES_DIR)/rootfs.initramfs\",$(KERNEL_DEFCONFIG_PATH))
+		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_UID,0,$(KERNEL_DEFCONFIG_PATH))
+		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0,$(KERNEL_DEFCONFIG_PATH))
+		$(call KCONFIG_DISABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_NONE,$(KERNEL_DEFCONFIG_PATH))
+		$(call KCONFIG_ENABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_GZIP,$(KERNEL_DEFCONFIG_PATH)))
+	$(if $(BR2_ROOTFS_DEVICE_CREATION_STATIC),,
+		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(KERNEL_DEFCONFIG_PATH))
+		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(KERNEL_DEFCONFIG_PATH)))
+	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
+		$(call KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(KERNEL_DEFCONFIG_PATH)))
 	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) $(KERNEL_DEFCONFIG_NAME)
 	rm $(KERNEL_DEFCONFIG_PATH)
-	$(Q)touch $@
+endef
 
 # Compilation. We make sure the kernel gets rebuilt when the
 # configuration has changed.
-$(LINUX_DIR)/.stamp_compiled: $(LINUX_DIR)/.stamp_configured $(LINUX_DIR)/.config
-	@$(call MESSAGE,"Compiling kernel")
+define LINUX_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_IMAGE_NAME)
 	@if [ $(shell grep -c "CONFIG_MODULES=y" $(LINUX_DIR)/.config) != 0 ] ; then 	\
 		$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;	\
 	fi
-	$(Q)touch $@
+endef
 
-# Installation
-$(LINUX_DIR)/.stamp_installed: $(LINUX_DIR)/.stamp_compiled
-	@$(call MESSAGE,"Installing kernel")
+define LINUX_INSTALL_IMAGES_CMDS
 	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
+endef
+
 ifeq ($(BR2_LINUX_KERNEL_INSTALL_TARGET),y)
+define LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET
 	install -m 0644 -D $(LINUX_IMAGE_PATH) $(TARGET_DIR)/boot/$(LINUX_IMAGE_NAME)
+endef
 endif
+
+define LINUX_INSTALL_TARGET_CMDS
+	$(LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET)
 	# Install modules and remove symbolic links pointing to build
 	# directories, not relevant on the target
 	@if [ $(shell grep -c "CONFIG_MODULES=y" $(LINUX_DIR)/.config) != 0 ] ; then 	\
@@ -177,17 +170,18 @@ endif
 		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build ;	\
 		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/source ;	\
 	fi
-	$(Q)touch $@
+endef
 
-linux linux26: host-module-init-tools $(LINUX_DEPENDENCIES) $(LINUX_DIR)/.stamp_installed
+$(eval $(call GENTARGETS,,linux))
 
 linux-menuconfig linux-xconfig linux-gconfig linux-nconfig linux26-menuconfig linux26-xconfig linux26-gconfig linux26-nconfig: dirs $(LINUX_DIR)/.stamp_configured
 	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) \
 		$(subst linux-,,$(subst linux26-,,$@))
+	rm -f $(LINUX_DIR)/.stamp_{built,target_installed,images_installed}
 
 # Support for rebuilding the kernel after the initramfs file list has
 # been generated in $(BINARIES_DIR)/rootfs.initramfs.
-$(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_installed $(BINARIES_DIR)/rootfs.initramfs
+$(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LINUX_DIR)/.stamp_images_installed $(BINARIES_DIR)/rootfs.initramfs
 	@$(call MESSAGE,"Rebuilding kernel with initramfs")
 	# Remove the previously generated initramfs which was empty,
 	# to make sure the kernel will actually regenerate it.
@@ -202,6 +196,7 @@ $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_installed $(BINARIES_
 # after it generated the initramfs list of files.
 linux-rebuild-with-initramfs linux26-rebuild-with-initramfs: $(LINUX_DIR)/.stamp_initramfs_rebuilt
 
+
 ifeq ($(BR2_LINUX_KERNEL),y)
 TARGETS+=linux
 endif
-- 
1.7.1
