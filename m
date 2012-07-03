From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Tue,  3 Jul 2012 12:01:13 +0200
Subject: [Buildroot] [PATCH 1/4] Rework support for the device tree
In-Reply-To: <1341309676-18681-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1341309676-18681-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <1341309676-18681-2-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 linux/Config.in |   46 +++++++++++++++++++++++++++++++++++++++-------
 linux/linux.mk  |   38 +++++++++++++++++++++++---------------
 2 files changed, 62 insertions(+), 22 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 4562b1b..6f704b0 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -124,14 +124,46 @@ config BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE
 	help
 	  Path to the kernel configuration file
 
+config BR2_LINUX_KERNEL_DTS_SUPPORT
+	bool "Device tree support"
+	help
+	  Compile a device tree source into a device tree blob.
+	  Select the dts file to compile in the options below.
+
+if BR2_LINUX_KERNEL_DTS_SUPPORT
+
+choice
+	prompt "Device tree source"
+	default BR2_LINUX_KERNEL_USE_DEFAULT_DTS
+
+config BR2_LINUX_KERNEL_USE_DEFAULT_DTS
+	bool "Use a device tree present in the kernel.
+	help
+	   Use a device tree source distributed with
+	   the kernel sources. The dts files are to be
+	   found in the arch/<arch>/boot/dts folder.
+
+config BR2_LINUX_KERNEL_USE_CUSTOM_DTS
+	bool "Use a custom device tree file"
+	help
+	  Use a custom device tree file.
+
+endchoice
+
 config BR2_LINUX_KERNEL_DTS_FILE
-    string "Device Tree dts file location"
-    depends on BR2_microblaze
-    help
-      Path from where the dts file has to be copied
-      The final "custom target" name depends on the
-      dts file name:
-          <name>.dts --> simpleImage.<name>
+	string "DTS name"
+	depends on BR2_LINUX_KERNEL_USE_DEFAULT_DTS
+	help
+	 Name of the default device tree, without the
+	 trailing .dts
+
+config BR2_LINUX_KERNEL_CUSTOM_DTS_FILE
+	string "Device tree file path"
+	depends on BR2_LINUX_KERNEL_USE_CUSTOM_DTS
+	help
+	  Path to the kernel configuration file
+
+endif
 #
 # Binary format
 #
diff --git a/linux/linux.mk b/linux/linux.mk
index 34f8623..0540aeb 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -46,6 +46,12 @@ LINUX_MAKE_FLAGS = \
 # going to be installed in the target filesystem.
 LINUX_VERSION_PROBED = $(shell $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease)
 
+ifeq ($(BR2_LINUX_KERNEL_USE_DEFAULT_DTS),y)
+KERNEL_DTS_NAME = $(BR2_LINUX_KERNEL_DTS_FILE)
+else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),y)
+KERNEL_DTS_NAME = $(basename $(notdir $(BR2_LINUX_KERNEL_CUSTOM_DTS_FILE)))
+endif
+
 ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
 LINUX_IMAGE_NAME=$(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME))
 else
@@ -117,19 +123,6 @@ endef
 
 LINUX_POST_PATCH_HOOKS += LINUX_APPLY_PATCHES
 
-ifeq ($(KERNEL_ARCH),microblaze)
-# on microblaze, we always want mkimage
-LINUX_DEPENDENCIES+=host-uboot-tools
-
-define LINUX_COPY_DTS
-    if test -f "$(BR2_LINUX_KERNEL_DTS_FILE)" ; then \
-        cp $(BR2_LINUX_KERNEL_DTS_FILE) $(@D)/arch/microblaze/boot/dts ; \
-    else \
-        echo "Cannot copy dts file!" ; \
-    fi
-endef
-endif
-
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 KERNEL_SOURCE_CONFIG = $(KERNEL_ARCH_PATH)/configs/$(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
@@ -143,8 +136,6 @@ define LINUX_CONFIGURE_CMDS
 	$(if $(BR2_ARM_EABI),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config),
 		$(call KCONFIG_DISABLE_OPT,CONFIG_AEABI,$(@D)/.config))
-    $(if $(BR2_microblaze),
-        $(call LINUX_COPY_DTS))
 	# As the kernel gets compiled before root filesystems are
 	# built, we create a fake cpio file. It'll be
 	# replaced later by the real cpio archive, and the kernel will be
@@ -167,13 +158,23 @@ define LINUX_CONFIGURE_CMDS
 	yes '' | $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) oldconfig
 endef
 
+ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
+define LINUX_BUILD_DTB
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(KERNEL_DTS_NAME).dtb
+endef
+endif
+
 # Compilation. We make sure the kernel gets rebuilt when the
 # configuration has changed.
 define LINUX_BUILD_CMDS
+	$(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
+		mkdir $(KERNEL_ARCH_PATH)/boot/dts
+		cp $(BR2_LINUX_KERNEL_CUSTOM_DTS_FILE) $(KERNEL_ARCH_PATH)/boot/dts/)
 	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_IMAGE_NAME)
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
 		$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;	\
 	fi
+	$(LINUX_BUILD_DTB)
 endef
 
 
@@ -183,12 +184,19 @@ define LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET
 endef
 endif
 
+ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
+define LINUX_INSTALL_DTB
+	cp $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb $(BINARIES_DIR)/
+endef
+endif
+
 define LINUX_INSTALL_IMAGES_CMDS
 	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
 endef
 
 define LINUX_INSTALL_TARGET_CMDS
 	$(LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET)
+	$(LINUX_INSTALL_DTB)
 	# Install modules and remove symbolic links pointing to build
 	# directories, not relevant on the target
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
-- 
1.7.9.5
