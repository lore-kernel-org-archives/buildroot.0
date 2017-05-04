From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Thu,  4 May 2017 17:26:01 +0200
Subject: [Buildroot] [PATCH 1/3] fs/ext2: use mkfs to generate rootfs image
Message-ID: <1493911563-2453-1-git-send-email-sebastien.szymanski@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mkfs is now capable of generating rootfs images. Use mkfs intead of
genext2fs. As we let mkfs calculate the block size and the number of
inodes needed we can drop BR2_TARGET_ROOTFS_EXT2_INODES and
BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES and rename
BR2_TARGET_ROOTFS_EXT2_BLOCKS to BR2_TARGET_ROOTFS_EXT2_SIZE

Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
---

This patch is a rework of the previous series I sent. [1] [2] [3]
Now it directly modifies fs/ext2 instead of mke2img script which is dropped at the
end. It also takes into account the comments from Thomas and Arnout.

[1] http://patchwork.ozlabs.org/patch/743281/
[2] http://patchwork.ozlabs.org/patch/743278/
[3] http://patchwork.ozlabs.org/patch/743282/

 Config.in.legacy  | 34 ++++++++++++++++++++++++++++++++++
 fs/ext2/Config.in | 24 ++++++++----------------
 fs/ext2/ext2.mk   | 22 +++++++++++-----------
 3 files changed, 53 insertions(+), 27 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 98b9eeb..5fc37ec 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,40 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.05"
 
+config BR2_TARGET_ROOTFS_EXT2_INODES
+	int "exact number of inodes has been removed"
+	default 0
+	help
+	  Buildroot uses mkfs.ext2/3/4 to generate ext2/3/4 images. So let mkfs
+	  automatically selects the number of inodes needed. Set this option to
+	  0.
+
+config BR2_TARGET_ROOTFS_EXT2_INODES_WRAP
+	bool
+	default y if BR2_TARGET_ROOTFS_EXT2_INODES != 0
+	select BR2_LEGACY
+
+config BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES
+	int "extra inodes has been removed" if BR2_TARGET_ROOTFS_EXT2_INODES = 0
+	default 0
+	help
+	  Buildroot uses mkfs.ext2/3/4 to generate ext2/3/4 images. So let mkfs
+	  automatically selects the number of inodes needed. Set this option to
+	  0.
+
+config BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES_WRAP
+	bool
+	default y if BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES != 0
+	select BR2_LEGACY
+
+config BR2_TARGET_ROOTFS_EXT2_BLOCKS
+	int "exact size in blocks has been removed"
+	default 0
+	help
+	  This option has been removed in favor of BR2_TARGET_ROOTFS_EXT2_SIZE.
+
+# Note: BR2_TARGET_ROOTFS_EXT2_BLOCKS still reference in fs/ext2/Config.in
+
 config BR2_PACKAGE_OPENOCD_FT2XXX
 	bool "openocd ft2232 support has been removed"
 	select BR2_PACKAGE_OPENOCD_FTDI
diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index 19ed140..842000a 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -1,6 +1,6 @@
 config BR2_TARGET_ROOTFS_EXT2
 	bool "ext2/3/4 root filesystem"
-	select BR2_PACKAGE_HOST_MKE2IMG
+	select BR2_PACKAGE_HOST_E2FSPROGS
 	help
 	  Build an ext2/3/4 root filesystem
 
@@ -44,22 +44,14 @@ config BR2_TARGET_ROOTFS_EXT2_REV
 config BR2_TARGET_ROOTFS_EXT2_LABEL
 	string "filesystem label"
 
-# 61440 = 60MB, i.e usually small enough to fit on a 64MB media
-config BR2_TARGET_ROOTFS_EXT2_BLOCKS
-	int "exact size in blocks"
-	default 61440
-
-config BR2_TARGET_ROOTFS_EXT2_INODES
-	int "exact number of inodes (leave at 0 for auto calculation)"
-	default 0
-
-config BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES
-	int "extra inodes" if BR2_TARGET_ROOTFS_EXT2_INODES = 0
-	default 0
+config BR2_TARGET_ROOTFS_EXT2_SIZE
+	string "exact size"
+	default BR2_TARGET_ROOTFS_EXT2_BLOCKS if BR2_TARGET_ROOTFS_EXT2_BLOCKS != 0 # legacy 2017.02
 	help
-	  Enter here the number of extra free inodes you want on
-	  your filesystem. By default, Buildroot will not leave
-	  many free inodes.
+	  The size of the filesystem image. If it does not have a suffix, it is
+	  interpreted as power-of-two kilobytes. If it is suffixed by 'k', 'm',
+	  'g', 't' (either upper-case or lower-case), then it is interpreted in
+	  power-of-two kilobytes, megabytes, gigabytes, terabytes, etc.
 
 config BR2_TARGET_ROOTFS_EXT2_RESBLKS
 	int "reserved blocks percentage"
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 9d3e8fd..1da74d5 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -4,30 +4,30 @@
 #
 ################################################################################
 
-EXT2_OPTS = -G $(BR2_TARGET_ROOTFS_EXT2_GEN) -R $(BR2_TARGET_ROOTFS_EXT2_REV)
-
-EXT2_OPTS += -b $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)
-
-ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_INODES)),0)
-EXT2_OPTS += -i $(BR2_TARGET_ROOTFS_EXT2_INODES)
+EXT2_SIZE = $(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_SIZE))
+ifeq ($(EXT2_SIZE),)
+$(error BR2_TARGET_ROOTFS_EXT2_SIZE cannot be empty)
 endif
-EXT2_OPTS += -I $(BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES)
+
+EXT2_OPTS = -d $(TARGET_DIR)
+EXT2_OPTS += -r $(BR2_TARGET_ROOTFS_EXT2_REV)
 
 ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)),0)
-EXT2_OPTS += -r $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)
+EXT2_OPTS += -m $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)
 endif
 
 # qstrip results in stripping consecutive spaces into a single one. So the
 # variable is not qstrip-ed to preserve the integrity of the string value.
 EXT2_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_LABEL))
 ifneq ($(EXT2_LABEL),)
-EXT2_OPTS += -l "$(EXT2_LABEL)"
+EXT2_OPTS += -L "$(EXT2_LABEL)"
 endif
 
-ROOTFS_EXT2_DEPENDENCIES = host-mke2img
+ROOTFS_EXT2_DEPENDENCIES = host-e2fsprogs
 
 define ROOTFS_EXT2_CMD
-	PATH=$(BR_PATH) mke2img -d $(TARGET_DIR) $(EXT2_OPTS) -o $@
+	rm -f $@
+	PATH=$(BR_PATH) mkfs.ext$(BR2_TARGET_ROOTFS_EXT2_GEN) $(EXT2_OPTS) $@ $(EXT2_SIZE)
 endef
 
 rootfs-ext2-symlink:
-- 
2.7.3
