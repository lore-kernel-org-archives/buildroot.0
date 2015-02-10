From: Floris Bos <bos@je-eigen-domein.nl>
Date: Tue, 10 Feb 2015 14:50:21 +0100
Subject: [Buildroot] [PATCH] Linux kernel: add support for config fragment
	files
Message-ID: <1423576221-24249-1-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds configuration option to merge additional kernel configuration files
to the main kernel configuration using scripts/kconfig/merge_config.sh

For use-cases in which it is desired to build a custom Linux kernel based on
the defconfig of the target device, but with a couple extra options/modules
enabled.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 linux/Config.in | 6 ++++++
 linux/linux.mk  | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index c981493..afa68b0 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -161,6 +161,12 @@ config BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE
 	help
 	  Path to the kernel configuration file
 
+config BR2_LINUX_KERNEL_CONFIG_FRAGMENTS
+	string "Additional configuration fragment files"
+	help
+	  A space-seperated list of kernel configuration fragment files,
+	  that will be merged to the main kernel configuration file.
+
 #
 # Binary format
 #
diff --git a/linux/linux.mk b/linux/linux.mk
index 29f59e8..02c3f66 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -39,6 +39,7 @@ endif # -rc
 endif
 
 LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
+LINUX_KERNEL_CONFIG_FRAGMENTS = $(call qstrip,$(BR2_LINUX_KERNEL_CONFIG_FRAGMENTS))
 
 LINUX_INSTALL_IMAGES = YES
 LINUX_DEPENDENCIES += host-kmod host-lzop
@@ -178,6 +179,8 @@ define LINUX_CONFIGURE_CMDS
 	$(INSTALL) -m 0644 $(KERNEL_SOURCE_CONFIG) $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
 	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) buildroot_defconfig
 	rm $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
+	$(if $(LINUX_KERNEL_CONFIG_FRAGMENTS),
+		$(@D)/scripts/kconfig/merge_config.sh -m -O $(@D) $(@D)/.config $(LINUX_KERNEL_CONFIG_FRAGMENTS))
 	$(if $(BR2_arm)$(BR2_armeb),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config))
 	$(if $(BR2_TARGET_ROOTFS_CPIO),
-- 
1.9.1
