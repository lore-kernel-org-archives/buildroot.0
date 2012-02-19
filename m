From: Spenser Gilliland <spenser309@gmail.com>
Date: Sun, 19 Feb 2012 14:41:00 -0600
Subject: [Buildroot] [PATCH v2] Add Device Tree and simpleImage support
Message-ID: <1329684060-20751-1-git-send-email-Spenser309@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds device tree and simpleImage support to buildroot.  When the simpleImage Kernel binary image type is selected, the user has can select either an in tree device tree source file or an out of tree device tree source file.

This triggers the kernel to build the simpleImage.<dt> target and copy the resulting binary to the output/images directory.  Additionally, if the install dtb option is selected the <dt>.dtb file is copied to the output directory.

Signed-off-by: Spenser Gilliland <Spenser309@gmail.com>
---
 linux/Config.in |   46 ++++++++++++++++++++++++++++++++++++++++++++++
 linux/linux.mk  |   41 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 87 insertions(+), 0 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 26032fd..1c74f1a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -150,6 +150,10 @@ config BR2_LINUX_KERNEL_VMLINUZ
 	bool "vmlinuz"
 	depends on BR2_mips || BR2_mipsel
 
+config BR2_LINUX_KERNEL_SIMPLEIMAGE
+	bool "simpleImage"
+	depends on BR2_microblaze
+
 config BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
 	bool "custom target"
 	help
@@ -163,6 +167,48 @@ config BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
 
 endchoice
 
+#
+# Device Tree Support
+#
+
+choice 
+	prompt "Device Tree Blob"
+	default BR2_LINUX_KERNEL_USE_DTS
+	depends on BR2_LINUX_KERNEL_SIMPLEIMAGE 
+
+config BR2_LINUX_KERNEL_USE_DTS
+	bool "Use an in kernel device tree"
+
+config BR2_LINUX_KERNEL_USE_CUSTOM_DTS
+	bool "Use a custom device tree"
+
+endchoice
+
+config BR2_LINUX_KERNEL_MAKE_DTB
+	bool
+	default y if BR2_LINUX_KERNEL_USE_DTS || BR2_LINUX_KERNEL_USE_CUSTOM_DTS	
+
+config BR2_LINUX_KERNEL_INSTALL_DTS
+	bool "Copy device tree blob to the output directory"
+	depends on BR2_LINUX_KERNEL_MAKE_DTB
+	help
+	  This copies the device tree blob to the images
+	  directory.
+
+config BR2_LINUX_KERNEL_DTS
+	string "Dts Name"
+	depends on BR2_LINUX_KERNEL_USE_DTS
+	help
+	  Name of device tree source file in tree to use
+	  without the trailing .dts
+
+config BR2_LINUX_KERNEL_CUSTOM_DTS
+	string "Dts file path"
+	depends on BR2_LINUX_KERNEL_USE_CUSTOM_DTS 
+	help
+	  Path to the custom dts file.
+
+
 config BR2_LINUX_KERNEL_IMAGE_TARGET_NAME
 	string "Kernel image target name"
 	depends on BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
diff --git a/linux/linux.mk b/linux/linux.mk
index ae236d4..1fb4ece 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -67,6 +67,9 @@ else ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
 LINUX_IMAGE_NAME=vmlinux
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUZ),y)
 LINUX_IMAGE_NAME=vmlinuz
+else ifeq ($(BR2_LINUX_KERNEL_SIMPLEIMAGE),y)
+# Image name is set once the dts is known
+LINUX_DEPENDENCIES+=host-uboot-tools
 endif
 endif
 
@@ -118,6 +121,35 @@ endef
 LINUX_POST_PATCH_HOOKS += LINUX_APPLY_PATCHES
 
 
+ifneq ($(BR2_LINUX_KERNEL_CUSTOM_DTS),)
+LINUX_KERNEL_CUSTOM_DTS = $(call qstrip, $(BR2_LINUX_KERNEL_CUSTOM_DTS))
+DTS_NAME = $(shell export file=`basename $(LINUX_KERNEL_CUSTOM_DTS)` && echo $${file%.*})
+define LINUX_COPY_DTS
+   echo "LINUX_KERNEL_CUSTOM_DTS=$(LINUX_KERNEL_CUSTOM_DTS) and DTS_NAME=$(DTS_NAME)" && \
+	mkdir -p $(KERNEL_ARCH_PATH)/boot/dts && \
+	cp $(BR2_LINUX_KERNEL_CUSTOM_DTS) $(KERNEL_ARCH_PATH)/boot/dts/ 
+endef
+endif
+
+ifeq ($(BR2_LINUX_KERNEL_USE_DTS),y)
+DTS_NAME = $(call qstrip, $(BR2_LINUX_KERNEL_DTS))
+endif
+
+ifeq ($(BR2_LINUX_KERNEL_MAKE_DTB),y)
+define LINUX_MAKE_DTB
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) scripts/dtc/ && \
+    scripts/dtc/dtc -O dtb -o $(KERNEL_ARCH_PATH)/boot/$(DTS_NAME).dtb \
+      -b 0 -p 1024 $(KERNEL_ARCH_PATH)/boot/dts/$(DTS_NAME).dts
+endef
+define LINUX_INSTALL_DTB
+	cp $(KERNEL_ARCH_PATH)/boot/$(DTS_NAME).dtb $(BINARIES_DIR)
+endef
+endif
+
+ifeq ($(BR2_LINUX_KERNEL_SIMPLEIMAGE),y)
+LINUX_IMAGE_NAME = simpleImage.$(DTS_NAME)
+endif
+
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 KERNEL_SOURCE_CONFIG = $(KERNEL_ARCH_PATH)/configs/$(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
@@ -125,6 +157,8 @@ KERNEL_SOURCE_CONFIG = $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
 endif
 
 define LINUX_CONFIGURE_CMDS
+	$(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
+		$(call LINUX_COPY_DTS))
 	cp $(KERNEL_SOURCE_CONFIG) $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
 	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) buildroot_defconfig
 	rm $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
@@ -158,17 +192,22 @@ define LINUX_BUILD_CMDS
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
 		$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;	\
 	fi
+	$(if $(BR2_LINUX_KERNEL_MAKE_DTB),
+		$(call LINUX_MAKE_DTB))
 endef
 
 
 ifeq ($(BR2_LINUX_KERNEL_INSTALL_TARGET),y)
 define LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET
 	install -m 0644 -D $(LINUX_IMAGE_PATH) $(TARGET_DIR)/boot/$(LINUX_IMAGE_NAME)
+
 endef
 endif
 
 define LINUX_INSTALL_IMAGES_CMDS
 	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
+	$(if $(BR2_LINUX_KERNEL_INSTALL_DTB),
+		$(call LINUX_INSTALL_DTB))
 endef
 
 define LINUX_INSTALL_TARGET_CMDS
@@ -215,6 +254,8 @@ $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LI
 	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_IMAGE_NAME)
 	# Copy the kernel image to its final destination
 	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
+	# If there is a .ub file copy it to the final destination
+	test -f $(LINUX_IMAGE_PATH).ub && cp $(LINUX_IMAGE_PATH).ub $(BINARIES_DIR)
 	$(Q)touch $@
 
 # The initramfs building code must make sure this target gets called
-- 
1.7.9
