From: Malte Starostik <m-starostik@versanet.de>
Date: Tue, 20 Jul 2010 23:42:17 +0200
Subject: [Buildroot] [PATCH] Be nice to foreign /init
In-Reply-To: <1279662137-10251-1-git-send-email-m-starostik@versanet.de>
References: <1279662137-10251-1-git-send-email-m-starostik@versanet.de>
Message-ID: <1279662137-10251-2-git-send-email-m-starostik@versanet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If a skeleton or package provides an executable /init, don't replace it
with a symlink to /sbin/init later on.

Signed-off-by: Malte Starostik <m-starostik@versanet.de>
---
 fs/cpio/cpio.mk           |    8 +++++---
 fs/initramfs/initramfs.mk |    8 +++++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index ab7d546..553a891 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -5,8 +5,10 @@
 #############################################################
 
 define ROOTFS_CPIO_INIT_SYMLINK
-	rm -f $(TARGET_DIR)/init
-	ln -s sbin/init $(TARGET_DIR)/init
+	if [ -L $(TARGET_DIR)/init ]; then \
+	    rm -f $(TARGET_DIR)/init; \
+	    ln -s sbin/init $(TARGET_DIR)/init; \
+	fi
 endef
 
 ROOTFS_CPIO_PRE_GEN_HOOKS += ROOTFS_CPIO_INIT_SYMLINK
@@ -15,4 +17,4 @@ define ROOTFS_CPIO_CMD
 	cd $(TARGET_DIR) && find . | cpio --quiet -o -H newc > $$@
 endef
 
-$(eval $(call ROOTFS_TARGET,cpio))
\ No newline at end of file
+$(eval $(call ROOTFS_TARGET,cpio))
diff --git a/fs/initramfs/initramfs.mk b/fs/initramfs/initramfs.mk
index e6d004e..ef750c6 100644
--- a/fs/initramfs/initramfs.mk
+++ b/fs/initramfs/initramfs.mk
@@ -13,8 +13,10 @@ INITRAMFS_TARGET:= #nothing
 endif
 
 define ROOTFS_INITRAMFS_INIT_SYMLINK
-	rm -f $(TARGET_DIR)/init
-	ln -s sbin/init $(TARGET_DIR)/init
+	if [ -L $(TARGET_DIR)/init ]; then \
+	    rm -f $(TARGET_DIR)/init; \
+	    ln -s sbin/init $(TARGET_DIR)/init; \
+	fi
 endef
 
 ROOTFS_INITRAMFS_PRE_GEN_HOOKS += ROOTFS_INITRAMFS_INIT_SYMLINK
@@ -25,4 +27,4 @@ endef
 
 ROOTFS_INITRAMFS_POST_TARGETS += linux26-rebuild-with-initramfs
 
-$(eval $(call ROOTFS_TARGET,initramfs))
\ No newline at end of file
+$(eval $(call ROOTFS_TARGET,initramfs))
-- 
1.7.1
