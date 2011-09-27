From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Sep 2011 22:36:26 +0200
Subject: [Buildroot] [git commit] cpio: fix boot with dynamic /dev
Message-ID: <20110927212737.83DC38D9FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3fac21ef8d794b47f731003b399e704349c54346
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Devtmpfs doesn't get automounted by the kernel when an initramfs is used.
Since cpio archives are used almost exclusively as an initramfs, the same
fix should be applied to it as for the initramfs.

Cfr. commit 424888e47431db738f5f9b3c6392435bfce7a842 and
10a130f91e5b947e2d2558443ff09b1686eac273.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/cpio/cpio.mk |   24 +++++++++++++++++++-----
 fs/cpio/init    |    7 +++++++
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index ab7d546..aa20b41 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -4,15 +4,29 @@
 #
 #############################################################
 
-define ROOTFS_CPIO_INIT_SYMLINK
-	rm -f $(TARGET_DIR)/init
-	ln -s sbin/init $(TARGET_DIR)/init
+ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
+
+define ROOTFS_CPIO_ADD_INIT
+        if [ ! -e $(TARGET_DIR)/init ]; then \
+                ln -sf sbin/init $(TARGET_DIR)/init; \
+        fi
+endef
+
+else
+# devtmpfs does not get automounted when initramfs is used.
+# Add a pre-init script to mount it before running init
+define ROOTFS_CPIO_ADD_INIT
+        if [ ! -e $(TARGET_DIR)/init ]; then \
+                $(INSTALL) -m 0755 fs/cpio/init $(TARGET_DIR)/init; \
+        fi
 endef
 
-ROOTFS_CPIO_PRE_GEN_HOOKS += ROOTFS_CPIO_INIT_SYMLINK
+endif # BR2_ROOTFS_DEVICE_CREATION_STATIC
+
+ROOTFS_CPIO_PRE_GEN_HOOKS += ROOTFS_CPIO_ADD_INIT
 
 define ROOTFS_CPIO_CMD
 	cd $(TARGET_DIR) && find . | cpio --quiet -o -H newc > $$@
 endef
 
-$(eval $(call ROOTFS_TARGET,cpio))
\ No newline at end of file
+$(eval $(call ROOTFS_TARGET,cpio))
diff --git a/fs/cpio/init b/fs/cpio/init
new file mode 100755
index 0000000..a275482
--- /dev/null
+++ b/fs/cpio/init
@@ -0,0 +1,7 @@
+#!/bin/sh
+# devtmpfs does not get automounted for initramfs
+/bin/mount -t devtmpfs devtmpfs /dev
+exec 0</dev/console
+exec 1>/dev/console
+exec 2>/dev/console
+exec /sbin/init $*
