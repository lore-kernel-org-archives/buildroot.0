From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  1 Apr 2015 23:54:57 +0200
Subject: [Buildroot] [PATCH 1/2 v3] package/linux-firmware: add support to
	copy entire directories
In-Reply-To: <cover.1427925170.git.yann.morin.1998@free.fr>
References: <cover.1427925170.git.yann.morin.1998@free.fr>
Message-ID: <6cc0db1c47d2723e2dff1d2126b2bc65e750e5cf.1427925170.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: David BARBION <david.barbion@ext.leroymerlin.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/linux-firmware.mk | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 71c8611..5a68138 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -293,6 +293,23 @@ LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
 endif
 
 ifneq ($(LINUX_FIRMWARE_FILES),)
+define LINUX_FIRMWARE_INSTALL_FILES
+	$(TAR) c -C $(@D) $(sort $(LINUX_FIRMWARE_FILES)) | \
+		$(TAR) x -C $(TARGET_DIR)/lib/firmware
+endef
+endif
+
+ifneq ($(LINUX_FIRMWARE_DIRS),)
+# We need to rm-rf the destination directory to avoid copying
+# into it in itself, should we re-install the package.
+define LINUX_FIRMWARE_INSTALL_DIRS
+	$(foreach d,$(LINUX_FIRMWARE_DIRS), \
+		rm -rf $(TARGET_DIR)/lib/firmware/$(d); \
+		cp -a $(@D)/$(d) $(TARGET_DIR)/lib/firmware/$(d)$(sep))
+endef
+endif
+
+ifneq ($(LINUX_FIRMWARE_FILES)$(LINUX_FIRMWARE_DIRS),)
 
 # Most firmware files are under a proprietary license, so no need to
 # repeat it for every selections above. Those firmwares that have more
@@ -308,12 +325,12 @@ LINUX_FIRMWARE_ALL_LICENSE_FILES += WHENCE
 # duplicates
 LINUX_FIRMWARE_LICENSE_FILES = $(sort $(LINUX_FIRMWARE_ALL_LICENSE_FILES))
 
+endif
+
 define LINUX_FIRMWARE_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/lib/firmware
-	$(TAR) c -C $(@D) $(sort $(LINUX_FIRMWARE_FILES)) | \
-		$(TAR) x -C $(TARGET_DIR)/lib/firmware
+	$(LINUX_FIRMWARE_INSTALL_FILES)
+	$(LINUX_FIRMWARE_INSTALL_DIRS)
 endef
 
-endif
-
 $(eval $(generic-package))
-- 
1.9.1
