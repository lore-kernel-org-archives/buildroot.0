From: Gary Coulbourne <bear@bears.org>
Date: Thu, 20 Dec 2012 17:22:27 -0500
Subject: [Buildroot] [PATCH] dtb: provide option to install dtb to boot
	directory
Message-ID: <1356042147-1532-1-git-send-email-bear@bears.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Gary Coulbourne <bear@bears.org>
---
 linux/Config.in |    6 ++++++
 linux/linux.mk  |    7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 9ebe0c9..8918297 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -284,6 +284,12 @@ config BR2_LINUX_KERNEL_INSTALL_TARGET
 	  /boot in the target root filesystem, as is typically done on
 	  x86/x86_64 systems.
 
+config BR2_LINUX_DEVICE_TREE_INSTALL_TARGET
+	bool "Install Device Tree to /boot in target"
+	depends on BR2_LINUX_KERNEL_DTS_SUPPORT
+	help
+	  Select this option to have the device tree installed to
+	  /boot in the target root filesystem.
 
 # Linux extensions
 source "linux/Config.ext.in"
diff --git a/linux/linux.mk b/linux/linux.mk
index 3321d80..6d8c752 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -211,6 +211,12 @@ define LINUX_APPEND_DTB
 endef
 endif
 
+ifeq ($(BR2_LINUX_DEVICE_TREE_INSTALL_TARGET),y)
+define LINUX_INSTALL_DTB_TO_TARGET
+	install -m 0644 -D $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb $(TARGET_DIR)/boot/$(KERNEL_DTS_NAME).dtb
+endef
+endif
+
 # Compilation. We make sure the kernel gets rebuilt when the
 # configuration has changed.
 define LINUX_BUILD_CMDS
@@ -247,6 +253,7 @@ endef
 define LINUX_INSTALL_TARGET_CMDS
 	$(LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET)
 	$(LINUX_INSTALL_DTB)
+	$(LINUX_INSTALL_DTB_TO_TARGET)
 	# Install modules and remove symbolic links pointing to build
 	# directories, not relevant on the target
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
-- 
1.7.10.4
