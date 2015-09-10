From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Sep 2015 14:29:18 +0200
Subject: [Buildroot] [git commit] package/usbmount: run-parts directory fix
Message-ID: <20150910123011.81EBE81F6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4c6f0f30bbb11b7ce0899f7545c73fd9e32070bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

usbmount.mk created/installed run-parts scripts in
/etc/usbmount/usbmount.d.  However, usbmount executes run-parts on
/etc/usbmount/mount.d for UDEV add action and on /etc/usbmount/umount.d
for UDEV remove action. Change usbmount.mk to create the directories
referenced by usbmount and install the run-parts scripts appropriately.

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/usbmount/usbmount.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
