From: Will Wagner <will_wagner@carallon.com>
Date: Tue, 20 Apr 2010 09:12:39 +0200
Subject: [Buildroot] [git commit master] Repair initramfs dependancies after
	move to fs
Message-ID: <20100420071957.859768B79D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=102ca91d741d0d271d96170df491bec7fdb7880a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The restructure for building root filesystems changed the target name
for the initramfs file, to build the file the trget is now
initramfs-root but the generated file is rootfs.initramfs

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
index f87d14d..745224d 100644
--- a/target/linux/Makefile.in.advanced
+++ b/target/linux/Makefile.in.advanced
@@ -344,7 +344,7 @@ endif
 	$(SED) '/CONFIG_INITRAMFS_SOURCE/d' $(LINUX26_DIR)/.config
 	$(SED) '/INITRAMFS_ROOT_.ID/d' $(LINUX26_DIR)/.config
 ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
-	echo "CONFIG_INITRAMFS_SOURCE=\"$(INITRAMFS_TARGET)\"" >> \
+	echo "CONFIG_INITRAMFS_SOURCE=\"$(BINARIES_DIR)/rootfs.initramfs\"" >> \
 		$(LINUX26_DIR)/.config
 	echo "CONFIG_INITRAMFS_ROOT_UID=0" >> $(LINUX26_DIR)/.config
 	echo "CONFIG_INITRAMFS_ROOT_GID=0" >> $(LINUX26_DIR)/.config
-- 
1.6.3.3
