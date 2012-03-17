From: Alvaro G. M <alvaro.gamez@hazent.com>
Date: Sat, 17 Mar 2012 13:13:25 +0100
Subject: [Buildroot] [PATCH] Microblaze: build kernel with device tree
In-Reply-To: <1331978750-11724-1-git-send-email-sho@relinux.de>
References: <1331978750-11724-1-git-send-email-sho@relinux.de>
Message-ID: <1331986405-7332-1-git-send-email-alvaro.gamez@hazent.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Stephan Hoffmann <sho@relinux.de>

This patch adds the options needed to build the SimpleImage containing
the device tree structure needed for the Microblaze architecture.

Handling Device Tree and SimpleImage will be handled in a general way
in the future.

I provide this patch to be able to build the system in the meantime.

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
Tested-by: Alvaro G. M <alvaro.gamez@hazent.com>
---
 linux/Config.in |    8 ++++++++
 linux/linux.mk  |   16 ++++++++++++++++
 2 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index b89fcdc..a7fa89f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -120,6 +120,14 @@ config BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE
 	help
 	  Path to the kernel configuration file
 
+config BR2_LINUX_KERNEL_DTS_FILE
+    string "Device Tree dts file location"
+    depends on BR2_microblaze
+    help
+      Path from where the dts file has to be copied
+      The final "custom target" name depends on the
+      dts file name:
+          <name>.dts --> simpleImage.<name>
 #
 # Binary format
 #
diff --git a/linux/linux.mk b/linux/linux.mk
index 58cbe8e..c0334d2 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -117,6 +117,18 @@ endef
 
 LINUX_POST_PATCH_HOOKS += LINUX_APPLY_PATCHES
 
+ifeq ($(KERNEL_ARCH),microblaze)
+# on microblaze, we always want mkimage
+LINUX_DEPENDENCIES+=host-uboot-tools
+
+define LINUX_COPY_DTS
+    if test -f "$(BR2_LINUX_KERNEL_DTS_FILE)" ; then \
+        cp $(BR2_LINUX_KERNEL_DTS_FILE) $(@D)/arch/microblaze/boot/dts ; \
+    else \
+        echo "Cannot copy dts file!" ; \
+    fi
+endef
+endif
 
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 KERNEL_SOURCE_CONFIG = $(KERNEL_ARCH_PATH)/configs/$(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
@@ -131,6 +143,8 @@ define LINUX_CONFIGURE_CMDS
 	$(if $(BR2_ARM_EABI),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config),
 		$(call KCONFIG_DISABLE_OPT,CONFIG_AEABI,$(@D)/.config))
+    $(if $(BR2_microblaze),
+        $(call LINUX_COPY_DTS))
 	# As the kernel gets compiled before root filesystems are
 	# built, we create a fake cpio file. It'll be
 	# replaced later by the real cpio archive, and the kernel will be
@@ -215,6 +229,8 @@ $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LI
 	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_IMAGE_NAME)
 	# Copy the kernel image to its final destination
 	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
+	# If there is a .ub file copy it to the final destination
+	test -f $(LINUX_IMAGE_PATH).ub && cp $(LINUX_IMAGE_PATH).ub $(BINARIES_DIR)
 	$(Q)touch $@
 
 # The initramfs building code must make sure this target gets called
-- 
1.7.9.1
