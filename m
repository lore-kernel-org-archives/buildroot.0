From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Jan 2018 21:58:07 +0100
Subject: [Buildroot] [git commit] fs: make it behave a bit more like the
 package infra
Message-ID: <20180103210533.3D4E983ADB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6842c40977886058f3471973397872c880a0ddc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, to register a filesystem, one has to call:

    $(eval $(call ROOTFS_TARGET,blabla))

This is very unlike the package infrastructure, where the name of the
package is automatically guessed by the infra.

It turns out that we can now do that for the filesystem infra too.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 fs/ubi/ubi.mk           | 2 +-
 fs/ubifs/ubifs.mk       | 2 +-
 fs/yaffs2/yaffs.mk      | 2 +-
 14 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/fs/axfs/axfs.mk b/fs/axfs/axfs.mk
index 6c795d7..4b93df5 100644
--- a/fs/axfs/axfs.mk
+++ b/fs/axfs/axfs.mk
@@ -10,4 +10,4 @@ define ROOTFS_AXFS_CMD
 	$(HOST_DIR)/bin/mkfs.axfs -s -a $(TARGET_DIR) $@
 endef
 
-$(eval $(call ROOTFS_TARGET,axfs))
+$(eval $(rootfs))
diff --git a/fs/cloop/cloop.mk b/fs/cloop/cloop.mk
index cbfc79b..17749c5 100644
--- a/fs/cloop/cloop.mk
+++ b/fs/cloop/cloop.mk
@@ -11,4 +11,4 @@ define ROOTFS_CLOOP_CMD
 		$(HOST_DIR)/bin/create_compressed_fs - 65536 > $@
 endef
 
-$(eval $(call ROOTFS_TARGET,cloop))
+$(eval $(rootfs))
diff --git a/fs/common.mk b/fs/common.mk
index b06e9b5..98232f0 100644
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
index c68e0bf..aa4d947 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -40,4 +40,4 @@ endef
 ROOTFS_CPIO_POST_GEN_HOOKS += ROOTFS_CPIO_UBOOT_MKIMAGE
 endif
 
-$(eval $(call ROOTFS_TARGET,cpio))
+$(eval $(rootfs))
diff --git a/fs/cramfs/cramfs.mk b/fs/cramfs/cramfs.mk
index 85b98b8..f880871 100644
--- a/fs/cramfs/cramfs.mk
+++ b/fs/cramfs/cramfs.mk
@@ -16,4 +16,4 @@ endef
 
 ROOTFS_CRAMFS_DEPENDENCIES = host-cramfs
 
-$(eval $(call ROOTFS_TARGET,cramfs))
+$(eval $(rootfs))
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 12b87a7..6bb4b1c 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -43,4 +43,4 @@ endef
 ROOTFS_EXT2_POST_GEN_HOOKS += ROOTFS_EXT2_SYMLINK
 endif
 
-$(eval $(call ROOTFS_TARGET,ext2))
+$(eval $(rootfs))
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 38ed3cd..207c6aa 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -144,4 +144,4 @@ endef
 ROOTFS_ISO9660_POST_GEN_HOOKS += ROOTFS_ISO9660_GEN_HYBRID
 endif
 
-$(eval $(call ROOTFS_TARGET,iso9660))
+$(eval $(rootfs))
diff --git a/fs/jffs2/jffs2.mk b/fs/jffs2/jffs2.mk
index 9a36a75..740ab3e 100644
--- a/fs/jffs2/jffs2.mk
+++ b/fs/jffs2/jffs2.mk
@@ -49,4 +49,4 @@ define ROOTFS_JFFS2_CMD
 endef
 endif
 
-$(eval $(call ROOTFS_TARGET,jffs2))
+$(eval $(rootfs))
diff --git a/fs/romfs/romfs.mk b/fs/romfs/romfs.mk
index eded91d..163751b 100644
--- a/fs/romfs/romfs.mk
+++ b/fs/romfs/romfs.mk
@@ -10,4 +10,4 @@ define ROOTFS_ROMFS_CMD
 	$(HOST_DIR)/bin/genromfs -d $(TARGET_DIR) -f $@
 endef
 
-$(eval $(call ROOTFS_TARGET,romfs))
+$(eval $(rootfs))
diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index 7de7f51..51abd5d 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -24,4 +24,4 @@ define ROOTFS_SQUASHFS_CMD
 	$(HOST_DIR)/bin/mksquashfs $(TARGET_DIR) $@ $(ROOTFS_SQUASHFS_ARGS)
 endef
 
-$(eval $(call ROOTFS_TARGET,squashfs))
+$(eval $(rootfs))
diff --git a/fs/tar/tar.mk b/fs/tar/tar.mk
index 0e3eacb..e39c2fd 100644
--- a/fs/tar/tar.mk
+++ b/fs/tar/tar.mk
@@ -11,4 +11,4 @@ define ROOTFS_TAR_CMD
 		tar $(TAR_OPTS) -cf $@ --null --no-recursion -T - --numeric-owner)
 endef
 
-$(eval $(call ROOTFS_TARGET,tar))
+$(eval $(rootfs))
diff --git a/fs/ubi/ubi.mk b/fs/ubi/ubi.mk
index b71a555..c78feda 100644
--- a/fs/ubi/ubi.mk
+++ b/fs/ubi/ubi.mk
@@ -29,4 +29,4 @@ define ROOTFS_UBI_CMD
 	rm $(BUILD_DIR)/ubinize.cfg
 endef
 
-$(eval $(call ROOTFS_TARGET,ubi))
+$(eval $(rootfs))
diff --git a/fs/ubifs/ubifs.mk b/fs/ubifs/ubifs.mk
index 4f45acd..2cfc397 100644
--- a/fs/ubifs/ubifs.mk
+++ b/fs/ubifs/ubifs.mk
@@ -27,4 +27,4 @@ define ROOTFS_UBIFS_CMD
 	$(HOST_DIR)/sbin/mkfs.ubifs -d $(TARGET_DIR) $(UBIFS_OPTS) -o $@
 endef
 
-$(eval $(call ROOTFS_TARGET,ubifs))
+$(eval $(rootfs))
diff --git a/fs/yaffs2/yaffs.mk b/fs/yaffs2/yaffs.mk
index 3057073..9cba27a 100644
--- a/fs/yaffs2/yaffs.mk
+++ b/fs/yaffs2/yaffs.mk
@@ -10,4 +10,4 @@ define ROOTFS_YAFFS2_CMD
 	$(HOST_DIR)/bin/mkyaffs2 --all-root $(TARGET_DIR) $@
 endef
 
-$(eval $(call ROOTFS_TARGET,yaffs2))
+$(eval $(rootfs))
