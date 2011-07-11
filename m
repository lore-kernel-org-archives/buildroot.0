From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2011 15:53:47 +0200
Subject: [Buildroot] [PATCH 03/12] linux: convert to the GENTARGETS
	infrastructure
In-Reply-To: <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
References: <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
Message-ID: <66c7e86f52aad84878870876946a99810e5fe2cb.1310392269.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |  116 +++++++++++++++++++++++++++-----------------------------
 1 files changed, 56 insertions(+), 60 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 9a63382..2c7ce89 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -15,8 +15,10 @@ LINUX_SOURCE  := linux-$(LINUX_VERSION).tar.bz2
 LINUX_SITE    := $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
 endif
 
-LINUX_DIR     := $(BUILD_DIR)/linux-$(LINUX_VERSION)
-LINUX_PATCH   := $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
+LINUX_PATCHES   := $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
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
@@ -103,64 +95,66 @@ $(LINUX_DIR)/.stamp_patched: $(LINUX_DIR)/.stamp_extracted
 			toolchain/patch-kernel.sh $(@D) `dirname $$p` `basename $$p` ; \
 		fi \
 	done
-	$(Q)touch $@
+endef
+
+LINUX_POST_PATCH_HOOKS += LINUX_APPLY_PATCHES
 
 
-# Configuration
-$(LINUX_DIR)/.stamp_configured: $(LINUX_DIR)/.stamp_patched
-	@$(call MESSAGE,"Configuring kernel")
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
-	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
+KERNEL_SOURCE_CONFIG = $(KERNEL_ARCH_PATH)/configs/$(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
-	cp $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE) $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
+KERNEL_SOURCE_CONFIG = $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
+endif
+
+define LINUX_CONFIGURE_CMDS
+	cp $(KERNEL_SOURCE_CONFIG) $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
 	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) buildroot_defconfig
 	rm $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
-endif
-ifeq ($(BR2_ARM_EABI),y)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config)
-else
-	$(call KCONFIG_DISABLE_OPT,CONFIG_AEABI,$(@D)/.config)
-endif
-ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
+	$(if $(BR2_ARM_EABI),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config),
+		$(call KCONFIG_DISABLE_OPT,CONFIG_AEABI,$(@D)/.config))
 	# As the kernel gets compiled before root filesystems are
 	# built, we create a fake initramfs file list. It'll be
 	# replaced later by the real list, and the kernel will be
 	# rebuilt using the linux26-rebuild-with-initramfs target.
-	touch $(BINARIES_DIR)/rootfs.initramfs
-	$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_INITRD,$(@D)/.config)
-	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,\"$(BINARIES_DIR)/rootfs.initramfs\",$(@D)/.config)
-	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_UID,0,$(@D)/.config)
-	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0,$(@D)/.config)
-	$(call KCONFIG_DISABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_NONE,$(@D)/.config)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_GZIP,$(@D)/.config)
-endif
-ifneq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config)
-endif
-ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
-	$(call KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(@D)/.config)
-endif
-	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) oldconfig
-	$(Q)touch $@
+	$(if $(BR2_TARGET_ROOTFS_INITRAMFS),
+		touch $(BINARIES_DIR)/rootfs.initramfs
+		$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_INITRD,$(@D)/.config)
+		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,\"$(BINARIES_DIR)/rootfs.initramfs\",$(@D)/.config)
+		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_UID,0,$(@D)/.config)
+		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0,$(@D)/.config)
+		$(call KCONFIG_DISABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_NONE,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_GZIP,$(@D)/.config))
+	$(if $(BR2_ROOTFS_DEVICE_CREATION_STATIC),,
+		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))
+	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
+		$(call KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(@D)/.config))
+	yes '' | $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) oldconfig
+endef
 
 # Compilation. We make sure the kernel gets rebuilt when the
 # configuration has changed.
-$(LINUX_DIR)/.stamp_compiled: $(LINUX_DIR)/.stamp_configured $(LINUX_DIR)/.config
-	@$(call MESSAGE,"Compiling kernel")
+define LINUX_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_IMAGE_NAME)
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
 		$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;	\
 	fi
-	$(Q)touch $@
+endef
+
 
-# Installation
-$(LINUX_DIR)/.stamp_installed: $(LINUX_DIR)/.stamp_compiled
-	@$(call MESSAGE,"Installing kernel")
 ifeq ($(BR2_LINUX_KERNEL_INSTALL_TARGET),y)
+define LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET
 	install -m 0644 -D $(LINUX_IMAGE_PATH) $(TARGET_DIR)/boot/$(LINUX_IMAGE_NAME)
+endef
 endif
+
+define LINUX_INSTALL_IMAGES_CMDS
 	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
+endef
+
+define LINUX_INSTALL_TARGET_CMDS
+	$(LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET)
 	# Install modules and remove symbolic links pointing to build
 	# directories, not relevant on the target
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
@@ -169,17 +163,18 @@ endif
 		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build ;		\
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
@@ -194,6 +189,7 @@ $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_installed $(BINARIES_
 # after it generated the initramfs list of files.
 linux-rebuild-with-initramfs linux26-rebuild-with-initramfs: $(LINUX_DIR)/.stamp_initramfs_rebuilt
 
+
 ifeq ($(BR2_LINUX_KERNEL),y)
 TARGETS+=linux
 endif
-- 
1.7.4.1
