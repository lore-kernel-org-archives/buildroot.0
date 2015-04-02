From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Apr 2015 10:15:42 +0200
Subject: [Buildroot] [git commit] package/linux-firmware: add support to
	copy entire directories
Message-ID: <20150402081636.A8A8B8195A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b55bd5a9e25e716e27890a13ef9dde8cf48e17d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: David BARBION <david.barbion@ext.leroymerlin.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/linux-firmware.mk |   25 +++++++++++++++++++++----
 1 files changed, 21 insertions(+), 4 deletions(-)

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
