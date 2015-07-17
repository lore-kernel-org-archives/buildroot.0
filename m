From: Doug Kehn <rdkehn@yahoo.com>
Date: Fri, 17 Jul 2015 16:08:32 -0500
Subject: [Buildroot] [PATCH 1/1] package/usbmount: run-parts directory fix
Message-ID: <1437167312-27136-1-git-send-email-rdkehn@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

usbmount.mk created/installed run-parts scripts in
/etc/usbmount/usbmount.d.  However, usbmount executes run-parts on
/etc/usbmount/mount.d for UDEV add action and on /etc/usbmount/umount.d
for UDEV remove action. Change usbmount.mk to create the directories
referenced by usbmount and install the run-parts scripts appropriately.

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
---
 package/usbmount/usbmount.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/usbmount/usbmount.mk b/package/usbmount/usbmount.mk
index 9e893c8..066cbb8 100644
--- a/package/usbmount/usbmount.mk
+++ b/package/usbmount/usbmount.mk
@@ -15,9 +15,9 @@ define USBMOUNT_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/usbmount $(TARGET_DIR)/usr/share/usbmount/usbmount
 
 	$(INSTALL) -m 0755 -D $(@D)/00_create_model_symlink 	\
-		$(TARGET_DIR)/etc/usbmount/usbmount.d/00_create_model_symlink
+		$(TARGET_DIR)/etc/usbmount/mount.d/00_create_model_symlink
 	$(INSTALL) -m 0755 -D $(@D)/00_remove_model_symlink 	\
-		$(TARGET_DIR)/etc/usbmount/usbmount.d/00_remove_model_symlink
+		$(TARGET_DIR)/etc/usbmount/umount.d/00_remove_model_symlink
 
 	$(INSTALL) -m 0644 -D $(@D)/usbmount.rules $(TARGET_DIR)/lib/udev/rules.d/usbmount.rules
 	$(INSTALL) -m 0644 -D $(@D)/usbmount.conf $(TARGET_DIR)/etc/usbmount/usbmount.conf
-- 
2.4.5
