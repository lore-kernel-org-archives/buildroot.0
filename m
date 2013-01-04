From: Gary Coulbourne <bear@bears.org>
Date: Fri,  4 Jan 2013 16:41:18 -0500
Subject: [Buildroot] [PATCH] modifications of original patch to copy device
	trees into the boot directory. This now supports multiple
	device trees.
In-Reply-To: <1357335678-5915-1-git-send-email-bear@bears.org>
References: <1357335678-5915-1-git-send-email-bear@bears.org>
Message-ID: <1357335678-5915-2-git-send-email-bear@bears.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Gary Coulbourne <bear@bears.org>
---
 linux/Config.in |    6 ++++++
 linux/linux.mk  |   10 ++++++++++
 2 files changed, 16 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 9ebe0c9..b48911e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -284,6 +284,12 @@ config BR2_LINUX_KERNEL_INSTALL_TARGET
 	  /boot in the target root filesystem, as is typically done on
 	  x86/x86_64 systems.
 
+config BR2_LINUX_DTB_INSTALL_TARGET
+        bool "Install Device Trees to /boot in target"
+        depends on BR2_LINUX_KERNEL_DTS_SUPPORT
+	help
+	  Select this option to have the device trees installed to
+          /boot in the target root filesystem.
 
 # Linux extensions
 source "linux/Config.ext.in"
diff --git a/linux/linux.mk b/linux/linux.mk
index e852f62..6c1c7a8 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -214,6 +214,15 @@ define LINUX_APPEND_DTB
 endef
 endif
 
+ifeq ($(BR2_LINUX_DTB_INSTALL_TARGET),y)
+define LINUX_INSTALL_DTB_TO_TARGET
+	install -m 0644 -D $(addprefix \
+		$(KERNEL_ARCH_PATH)/boot/$(if $(wildcard \
+		$(addprefix $(KERNEL_ARCH_PATH)/boot/dts/,$(KERNEL_DTBS))),dts/),$(KERNEL_DTBS)) \
+		$(TARGET_DIR)/boot/
+endef
+endif
+
 # Compilation. We make sure the kernel gets rebuilt when the
 # configuration has changed.
 define LINUX_BUILD_CMDS
@@ -250,6 +259,7 @@ endef
 define LINUX_INSTALL_TARGET_CMDS
 	$(LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET)
 	$(LINUX_INSTALL_DTB)
+	$(LINUX_INSTALL_DTB_TO_TARGET)
 	# Install modules and remove symbolic links pointing to build
 	# directories, not relevant on the target
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
-- 
1.7.10.4
