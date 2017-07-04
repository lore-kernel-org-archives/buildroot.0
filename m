From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 00:39:38 +0200
Subject: [Buildroot] [git commit] fs/ext2: use mkfs to generate rootfs image
Message-ID: <20170704223652.DFCE880330@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=67aaa90d3bbe6ad5b5ffa9e66cdb0a1928448eb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mkfs is now capable of generating rootfs images. Use mkfs instead of
genext2fs.

If not set, we now let mkfs calculate the block size and the number of
inodes needed.

This change also adjusts the options to meet those of mkfs.

Notes:
* Passing a null inode number to mkfs triggers its automatic calculation.
* Passing a fs-size with no unit suffix to mkfs is interpreted as using
  1K block size.

Signed-off-by: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Thomas: don't pass PATH when calling mkfs.ext, just call it directly
from $(HOST_DIR)/usr/sbin, as suggested by Arnout.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/ext2/Config.in |  2 +-
 fs/ext2/ext2.mk   | 18 +++++++++---------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index ec1b5f2..9c58ac6 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -1,6 +1,6 @@
 config BR2_TARGET_ROOTFS_EXT2
 	bool "ext2/3/4 root filesystem"
-	select BR2_PACKAGE_HOST_MKE2IMG
+	select BR2_PACKAGE_HOST_E2FSPROGS
 	help
 	  Build an ext2/3/4 root filesystem
 
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 8a648dd..ff04b78 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -10,18 +10,18 @@ EXT2_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_LABEL))
 #" Syntax highlighting... :-/ )
 
 EXT2_OPTS = \
-	-G $(BR2_TARGET_ROOTFS_EXT2_GEN) \
-	-R $(BR2_TARGET_ROOTFS_EXT2_REV) \
-	-B 1024 \
-	-b $(BR2_TARGET_ROOTFS_EXT2_BLOCKS) \
-	-i $(BR2_TARGET_ROOTFS_EXT2_INODES) \
-	-r $(BR2_TARGET_ROOTFS_EXT2_RESBLKS) \
-	-l "$(EXT2_LABEL)"
+	-d $(TARGET_DIR) \
+	-r $(BR2_TARGET_ROOTFS_EXT2_REV) \
+	-N $(BR2_TARGET_ROOTFS_EXT2_INODES) \
+	-m $(BR2_TARGET_ROOTFS_EXT2_RESBLKS) \
+	-L "$(EXT2_LABEL)"
 
-ROOTFS_EXT2_DEPENDENCIES = host-mke2img
+ROOTFS_EXT2_DEPENDENCIES = host-e2fsprogs
 
 define ROOTFS_EXT2_CMD
-	PATH=$(BR_PATH) mke2img -d $(TARGET_DIR) $(EXT2_OPTS) -o $@
+	rm -f $@
+	$(HOST_DIR)/usr/sbin/mkfs.ext$(BR2_TARGET_ROOTFS_EXT2_GEN) $(EXT2_OPTS) $@ \
+		 $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)
 endef
 
 rootfs-ext2-symlink:
