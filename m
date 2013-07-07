From: Spenser Gilliland <spenser@gillilanding.com>
Date: Sun,  7 Jul 2013 18:31:05 -0500
Subject: [Buildroot] [PATCH 1/2] linux: install firmware to staging.
Message-ID: <1373239866-18076-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install firmware to staging when the hidden option
BR2_LINUX_KERNEL_INSTALL_FIRMWARE is selected.  This allows parts of the
firmware provided by the linux kernel to be installed in the target.

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 linux/Config.in |  5 +++++
 linux/linux.mk  | 13 +++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index f58e714..b733019 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -297,6 +297,11 @@ config BR2_LINUX_KERNEL_INSTALL_TARGET
 	  /boot in the target root filesystem, as is typically done on
 	  x86/x86_64 systems.
 
+# This option is used to install firmware to staging. Other packages such as
+# beagle-capes then install the firmware into the target. This avoids
+# installing all linux firmware.
+config BR2_LINUX_KERNEL_INSTALL_FIRMWARE
+	bool
 
 # Linux extensions
 source "linux/Config.ext.in"
diff --git a/linux/linux.mk b/linux/linux.mk
index befef16..88c954d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -256,6 +256,15 @@ define LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET
 endef
 endif
 
+ifeq ($(BR2_LINUX_KERNEL_INSTALL_FIRMWARE),y)
+
+LINUX_INSTALL_STAGING = YES
+
+define LINUX_INSTALL_FIRMWARE_TO_STAGING
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) firmware_install \
+		INSTALL_FW_PATH=$(STAGING_DIR)/lib/firmware/
+endef
+endif
 
 define LINUX_INSTALL_HOST_TOOLS
 	# Installing dtc (device tree compiler) as host tool, if selected
@@ -269,6 +278,10 @@ define LINUX_INSTALL_IMAGES_CMDS
 	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
 endef
 
+define LINUX_INSTALL_STAGING_CMDS
+	$(LINUX_INSTALL_FIRMWARE_TO_STAGING)
+endef
+
 define LINUX_INSTALL_TARGET_CMDS
 	$(LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET)
 	$(LINUX_INSTALL_DTB)
-- 
1.8.1.2
