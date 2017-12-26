From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 Dec 2017 00:20:47 +0100
Subject: [Buildroot] [PATCH 3/3] fs: make it behave a bit more like the
 package infra
In-Reply-To: <cover.1514330428.git.yann.morin.1998@free.fr>
References: <cover.1514330428.git.yann.morin.1998@free.fr>
Message-ID: <63ee53d0a4bbf5e9fc6f3f500dda279d99d1350f.1514330428.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, to register a filesystem, one has to call:
    $(eval $(call ROOTFS_TARGET,blabla))

This is very unlike the package infrastrucutre, where the name of the
packagge os automatically guessed by the infra.

It turns out that we can nowe do that for the filesystem infra too.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 fs/axfs/axfs.mk         | 2 +-
 fs/cloop/cloop.mk       | 2 +-
 fs/common.mk            | 7 +++----
 fs/cpio/cpio.mk         | 2 +-
 fs/cramfs/cramfs.mk     | 2 +-
 fs/ext2/ext2.mk         | 2 +-
 fs/iso9660/iso9660.mk   | 2 +-
 fs/jffs2/jffs2.mk       | 2 +-
 fs/romfs/romfs.mk       | 2 +-
 fs/squashfs/squashfs.mk | 2 +-
 fs/tar/tar.mk           | 2 +-
 fs/ubifs/ubifs.mk       | 2 +-
 fs/yaffs2/yaffs.mk      | 2 +-
 13 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/fs/axfs/axfs.mk b/fs/axfs/axfs.mk
index 6c795d7062..4b93df55c0 100644
--- a/fs/axfs/axfs.mk
+++ b/fs/axfs/axfs.mk
@@ -10,4 +10,4 @@ define ROOTFS_AXFS_CMD
 	$(HOST_DIR)/bin/mkfs.axfs -s -a $(TARGET_DIR) $@
 endef
 
-$(eval $(call ROOTFS_TARGET,axfs))
+$(eval $(rootfs))
diff --git a/fs/cloop/cloop.mk b/fs/cloop/cloop.mk
index cbfc79b0d1..17749c5a3b 100644
--- a/fs/cloop/cloop.mk
+++ b/fs/cloop/cloop.mk
@@ -11,4 +11,4 @@ define ROOTFS_CLOOP_CMD
 		$(HOST_DIR)/bin/create_compressed_fs - 65536 > $@
 endef
 
-$(eval $(call ROOTFS_TARGET,cloop))
+$(eval $(rootfs))
diff --git a/fs/common.mk b/fs/common.mk
index b06e9b5597..98232f0b9f 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -37,7 +37,7 @@ ROOTFS_USERS_TABLES = $(call qstrip,$(BR2_ROOTFS_USERS_TABLES))
 
 # Since this function will be called from within an $(eval ...)
 # all variable references except the arguments must be $$-quoted.
-define ROOTFS_TARGET_INTERNAL
+define inner-rootfs
 
 # extra deps
 ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs \
@@ -128,8 +128,7 @@ endif
 
 endef
 
-define ROOTFS_TARGET
-	$(call ROOTFS_TARGET_INTERNAL,$(1),$(call UPPERCASE,$(1)))
-endef
+# $(pkgname) also works well to return the filesystem name
+rootfs = $(call inner-rootfs,$(pkgname),$(call UPPERCASE,$(pkgname)))
 
 include $(sort $(wildcard fs/*/*.mk))
diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index c68e0bfb97..aa4d947fa5 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -40,4 +40,4 @@ endef
 ROOTFS_CPIO_POST_GEN_HOOKS += ROOTFS_CPIO_UBOOT_MKIMAGE
 endif
 
-$(eval $(call ROOTFS_TARGET,cpio))
+$(eval $(rootfs))
diff --git a/fs/cramfs/cramfs.mk b/fs/cramfs/cramfs.mk
index 85b98b8ccd..f880871935 100644
--- a/fs/cramfs/cramfs.mk
+++ b/fs/cramfs/cramfs.mk
@@ -16,4 +16,4 @@ endef
 
 ROOTFS_CRAMFS_DEPENDENCIES = host-cramfs
 
-$(eval $(call ROOTFS_TARGET,cramfs))
+$(eval $(rootfs))
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 12b87a722c..6bb4b1c7f8 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -43,4 +43,4 @@ endef
 ROOTFS_EXT2_POST_GEN_HOOKS += ROOTFS_EXT2_SYMLINK
 endif
 
-$(eval $(call ROOTFS_TARGET,ext2))
+$(eval $(rootfs))
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index c2de27101a..ab11a393e1 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -128,4 +128,4 @@ endef
 ROOTFS_ISO9660_POST_GEN_HOOKS += ROOTFS_ISO9660_GEN_HYBRID
 endif
 
-$(eval $(call ROOTFS_TARGET,iso9660))
+$(eval $(rootfs))
diff --git a/fs/jffs2/jffs2.mk b/fs/jffs2/jffs2.mk
index 9a36a75ff4..740ab3e03d 100644
--- a/fs/jffs2/jffs2.mk
+++ b/fs/jffs2/jffs2.mk
@@ -49,4 +49,4 @@ define ROOTFS_JFFS2_CMD
 endef
 endif
 
-$(eval $(call ROOTFS_TARGET,jffs2))
+$(eval $(rootfs))
diff --git a/fs/romfs/romfs.mk b/fs/romfs/romfs.mk
index eded91df0a..163751b4e2 100644
--- a/fs/romfs/romfs.mk
+++ b/fs/romfs/romfs.mk
@@ -10,4 +10,4 @@ define ROOTFS_ROMFS_CMD
 	$(HOST_DIR)/bin/genromfs -d $(TARGET_DIR) -f $@
 endef
 
-$(eval $(call ROOTFS_TARGET,romfs))
+$(eval $(rootfs))
diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index 7de7f51af1..51abd5d7d0 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -24,4 +24,4 @@ define ROOTFS_SQUASHFS_CMD
 	$(HOST_DIR)/bin/mksquashfs $(TARGET_DIR) $@ $(ROOTFS_SQUASHFS_ARGS)
 endef
 
-$(eval $(call ROOTFS_TARGET,squashfs))
+$(eval $(rootfs))
diff --git a/fs/tar/tar.mk b/fs/tar/tar.mk
index 0e3eacbedf..e39c2fdbf1 100644
--- a/fs/tar/tar.mk
+++ b/fs/tar/tar.mk
@@ -11,4 +11,4 @@ define ROOTFS_TAR_CMD
 		tar $(TAR_OPTS) -cf $@ --null --no-recursion -T - --numeric-owner)
 endef
 
-$(eval $(call ROOTFS_TARGET,tar))
+$(eval $(rootfs))
diff --git a/fs/ubifs/ubifs.mk b/fs/ubifs/ubifs.mk
index 5f7846ff73..277bff4ebf 100644
--- a/fs/ubifs/ubifs.mk
+++ b/fs/ubifs/ubifs.mk
@@ -54,4 +54,4 @@ ROOTFS_UBIFS_POST_GEN_HOOKS += UBIFS_UBINIZE
 
 endif # BR2_TARGET_ROOTFS_UBI
 
-$(eval $(call ROOTFS_TARGET,ubifs))
+$(eval $(rootfs))
diff --git a/fs/yaffs2/yaffs.mk b/fs/yaffs2/yaffs.mk
index 30570735fa..9cba27af70 100644
--- a/fs/yaffs2/yaffs.mk
+++ b/fs/yaffs2/yaffs.mk
@@ -10,4 +10,4 @@ define ROOTFS_YAFFS2_CMD
 	$(HOST_DIR)/bin/mkyaffs2 --all-root $(TARGET_DIR) $@
 endef
 
-$(eval $(call ROOTFS_TARGET,yaffs2))
+$(eval $(rootfs))
-- 
2.11.0
