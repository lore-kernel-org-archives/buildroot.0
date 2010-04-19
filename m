From: Will Wagner <will_wagner@carallon.com>
Date: Mon, 19 Apr 2010 15:34:49 +0100
Subject: [Buildroot] [PATCH] Repair initramfs dependancies after move to fs
Message-ID: <1271687689-344-1-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The restructure for building root filesystems changed the target name
for the initramfs file, to build the file the trget is now
initramfs-root but the generated file is rootfs.initramfs

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 fs/initramfs/initramfs.mk         |    6 ++++++
 target/linux/Makefile.in          |    2 +-
 target/linux/Makefile.in.advanced |    2 +-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/initramfs/initramfs.mk b/fs/initramfs/initramfs.mk
index 4a205d1..9aaf1b0 100644
--- a/fs/initramfs/initramfs.mk
+++ b/fs/initramfs/initramfs.mk
@@ -6,6 +6,12 @@
 #
 #############################################################
 
+ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
+INITRAMFS_TARGET:=initramfs-root
+else
+INITRAMFS_TARGET:= #nothing
+endif
+
 define ROOTFS_INITRAMFS_INIT_SYMLINK
 	rm -f $(TARGET_DIR)/init
 	ln -s sbin/init $(TARGET_DIR)/init
diff --git a/target/linux/Makefile.in b/target/linux/Makefile.in
index f3c7807..41e4821 100644
--- a/target/linux/Makefile.in
+++ b/target/linux/Makefile.in
@@ -153,7 +153,7 @@ endif
 	$(SED) '/CONFIG_INITRAMFS_SOURCE/d' $(LINUX26_DIR)/.config
 	$(SED) '/INITRAMFS_ROOT_.ID/d' $(LINUX26_DIR)/.config
 ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
-	echo "CONFIG_INITRAMFS_SOURCE=\"$(INITRAMFS_TARGET)\"" >> \
+	echo "CONFIG_INITRAMFS_SOURCE=\"$(BINARIES_DIR)/rootfs.initramfs\"" >> \
 		$(LINUX26_DIR)/.config
 	echo "CONFIG_INITRAMFS_ROOT_UID=0" >> $(LINUX26_DIR)/.config
 	echo "CONFIG_INITRAMFS_ROOT_GID=0" >> $(LINUX26_DIR)/.config
diff --git a/target/linux/Makefile.in.advanced b/target/linux/Makefile.in.advanced
index 0eb1b82..99f3f45 100644
--- a/target/linux/Makefile.in.advanced
+++ b/target/linux/Makefile.in.advanced
@@ -354,7 +354,7 @@ endif
 	$(SED) '/CONFIG_INITRAMFS_SOURCE/d' $(LINUX26_DIR)/.config
 	$(SED) '/INITRAMFS_ROOT_.ID/d' $(LINUX26_DIR)/.config
 ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
-	echo "CONFIG_INITRAMFS_SOURCE=\"$(INITRAMFS_TARGET)\"" >> \
+	echo "CONFIG_INITRAMFS_SOURCE=\"$(BINARIES_DIR)/rootfs.initramfs\"" >> \
 		$(LINUX26_DIR)/.config
 	echo "CONFIG_INITRAMFS_ROOT_UID=0" >> $(LINUX26_DIR)/.config
 	echo "CONFIG_INITRAMFS_ROOT_GID=0" >> $(LINUX26_DIR)/.config
-- 
1.7.0
