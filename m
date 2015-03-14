From: Karoly Kasza <kaszak@gmail.com>
Date: Sat, 14 Mar 2015 14:20:55 +0100
Subject: [Buildroot] [PATCH] system/system.mk: modify fstab according to
	GENERIC_REMOUNT_ROOTFS_RW
Message-ID: <1426339255-72888-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, if BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is set
/etc/inittab will run a remount on / to make it writable.
But in /etc/fstab the /dev/root entry is always mounted as rw, so the above
command is useless, BR will always mount /dev/root writable.

This patch adds a modification to /etc/fstab based on the value of
BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW, making BR once again to
enable readonly root builds OOB.

Also, remounting in either case seems mainingless, if /etc/fstab is not
setting /dev/root readonly by default - which can be an alternative solution.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 system/system.mk |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/system/system.mk b/system/system.mk
index 4a1eb4a..a390b6e 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -106,14 +106,18 @@ TARGET_FINALIZE_HOOKS += SYSTEM_GETTY
 endif
 
 ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
-# Find commented line, if any, and remove leading '#'s
+# Find commented line in inittab, if any, and remove leading '#'s
+# Rewrite fstab to mount /dev/root rw if set to ro
 define SYSTEM_REMOUNT_RW
 	$(SED) '/^#.*-o remount,rw \/$$/s~^#\+~~' $(TARGET_DIR)/etc/inittab
+	$(SED) '/^\/dev\/root.*ro,.*/s~ro,~rw,~' $(TARGET_DIR)/etc/fstab
 endef
 else
-# Find uncommented line, if any, and add a leading '#'
+# Find uncommented line in inittab, if any, and add a leading '#'
+# Rewrite fstab to mount /dev/root ro if set to rw
 define SYSTEM_REMOUNT_RW
 	$(SED) '/^[^#].*-o remount,rw \/$$/s~^~#~' $(TARGET_DIR)/etc/inittab
+	$(SED) '/^\/dev\/root.*rw,.*/s~rw,~ro,~' $(TARGET_DIR)/etc/fstab
 endef
 endif
 TARGET_FINALIZE_HOOKS += SYSTEM_REMOUNT_RW
-- 
1.7.10.4
