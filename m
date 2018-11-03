From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Nov 2018 15:14:47 +0100
Subject: [Buildroot] [git commit] fs/f2fs: add support for creating a f2fs
 image
Message-ID: <20181103143121.EB5DB882D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6f727ce1fe190dcaaa0ae9b254698dbea67ce63a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch makes possible to create rootfs image using f2fs
filesystem.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
[Thomas:
 - keep only the minimal functionality, as suggested by Yann E. Morin
 - use truncate -s instead of dd to create the initial empty image
   file, as suggested by Yann E. Morin]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 fs/Config.in      |  1 +
 fs/f2fs/Config.in | 21 +++++++++++++++++++++
 fs/f2fs/f2fs.mk   | 30 ++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+)

diff --git a/fs/Config.in b/fs/Config.in
index 24f22fd7e3..527051ef54 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -6,6 +6,7 @@ source "fs/cloop/Config.in"
 source "fs/cpio/Config.in"
 source "fs/cramfs/Config.in"
 source "fs/ext2/Config.in"
+source "fs/f2fs/Config.in"
 source "fs/initramfs/Config.in"
 source "fs/iso9660/Config.in"
 source "fs/jffs2/Config.in"
diff --git a/fs/f2fs/Config.in b/fs/f2fs/Config.in
new file mode 100644
index 0000000000..e62bc652ef
--- /dev/null
+++ b/fs/f2fs/Config.in
@@ -0,0 +1,21 @@
+config BR2_TARGET_ROOTFS_F2FS
+	bool "f2fs root filesystem"
+	select BR2_PACKAGE_HOST_F2FS_TOOLS
+	help
+	  Build a f2fs root filesystem. If you enable this option, you
+	  probably want to enable the f2fs-tools package too.
+
+if BR2_TARGET_ROOTFS_F2FS
+
+config BR2_TARGET_ROOTFS_F2FS_LABEL
+	string "filesystem label"
+
+config BR2_TARGET_ROOTFS_F2FS_SIZE
+	string "filesystem size"
+	default "100M"
+	help
+	  The size of the filesystem image in bytes.
+	  Suffix with K, M, G or T for power-of-two kilo-, mega-, giga-
+	  or terabytes.
+
+endif # BR2_TARGET_ROOTFS_F2FS
diff --git a/fs/f2fs/f2fs.mk b/fs/f2fs/f2fs.mk
new file mode 100644
index 0000000000..c954386b05
--- /dev/null
+++ b/fs/f2fs/f2fs.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# Build the f2fs root filesystem image
+#
+################################################################################
+
+F2FS_SIZE = $(call qstrip,$(BR2_TARGET_ROOTFS_F2FS_SIZE))
+ifeq ($(BR2_TARGET_ROOTFS_F2FS)-$(F2FS_SIZE),y-)
+$(error BR2_TARGET_ROOTFS_F2FS_SIZE cannot be empty)
+endif
+
+# qstrip results in stripping consecutive spaces into a single one. So the
+# variable is not qstrip-ed to preserve the integrity of the string value.
+F2FS_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_F2FS_LABEL))
+# ")
+
+F2FS_OPTS = \
+	-f \
+	-l "$(F2FS_LABEL)"
+
+ROOTFS_F2FS_DEPENDENCIES = host-f2fs-tools
+
+define ROOTFS_F2FS_CMD
+	$(RM) -f $@
+	truncate -s $(F2FS_SIZE) $@
+	$(HOST_DIR)/sbin/mkfs.f2fs $(F2FS_OPTS) $@
+	$(HOST_DIR)/sbin/sload.f2fs -f $(TARGET_DIR) $@
+endef
+
+$(eval $(rootfs))
