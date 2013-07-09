From: Spenser Gilliland <spenser@gillilanding.com>
Date: Tue,  9 Jul 2013 12:39:54 -0500
Subject: [Buildroot] [PATCH v2 1/2] linux: install firmware to staging.
Message-ID: <1373391595-19359-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install firmware to staging when the hidden option
BR2_LINUX_KERNEL_INSTALL_FIRMWARE is selected.  This allows parts of the
firmware provided by the linux kernel to be installed in the target.

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Yann E. Morin <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
v1->v2:
  - increase comment clarity in Config.in
---
 linux/Config.in |  7 +++++++
 linux/linux.mk  | 13 +++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index f58e714..f5c4764 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -297,6 +297,13 @@ config BR2_LINUX_KERNEL_INSTALL_TARGET
 	  /boot in the target root filesystem, as is typically done on
 	  x86/x86_64 systems.
 
+# This option can be selected by other packages that require special
+# firmwares bundled in some forks of the Linux kernel (e.g. the BeagleBone
+# Black cape firmwares (.dtbo) as distibuted in the TI Linux Kernel fork.) To
+# install firmware from the mainline kernel please use the
+# linux-firmware package.
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
