From: Hoang Tran <hoang.tran@vnoss.org>
Date: Mon,  8 Jun 2015 09:49:56 -0700
Subject: [Buildroot] [PATCH 1/1] fs/romfs: add U-Boot image support
Message-ID: <1433782196-17824-1-git-send-email-hoang.tran@vnoss.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds U-Boot image support for romfs root filesystems. This allows you to
use the bootm command in U-Boot to load the rootfs.

Signed-off-by: Hoang Tran <hoang.tran@vnoss.org>
---
 fs/romfs/Config.in | 13 +++++++++++++
 fs/romfs/romfs.mk  | 10 +++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/fs/romfs/Config.in b/fs/romfs/Config.in
index 84944a0..34faf2d 100644
--- a/fs/romfs/Config.in
+++ b/fs/romfs/Config.in
@@ -2,3 +2,16 @@ config BR2_TARGET_ROOTFS_ROMFS
 	bool "romfs root filesystem"
 	help
 	  Build a romfs image of the root filesystem.
+
+if BR2_TARGET_ROOTFS_ROMFS
+
+config BR2_TARGET_ROOTFS_ROMFS_UIMAGE
+	bool "u-boot image of romfs root filesystem"
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS
+	help
+	  Add a u-boot header to the romfs root filesystem. This allows
+	  the u-boot image to be loaded with the bootm command in U-Boot.
+
+	  The u-boot image will be called rootfs.romfs.uboot
+
+endif
diff --git a/fs/romfs/romfs.mk b/fs/romfs/romfs.mk
index e0ac65f..9fa5005 100644
--- a/fs/romfs/romfs.mk
+++ b/fs/romfs/romfs.mk
@@ -12,4 +12,12 @@ define ROOTFS_ROMFS_CMD
 	$(HOST_DIR)/usr/bin/genromfs -d $(TARGET_DIR) -f $@
 endef
 
-$(eval $(call ROOTFS_TARGET,romfs))
\ No newline at end of file
+$(BINARIES_DIR)/rootfs.romfs.uboot: $(BINARIES_DIR)/rootfs.romfs host-uboot-tools
+	$(MKIMAGE) -A $(MKIMAGE_ARCH) -T ramdisk -O linux \
+		-C none -d $<$(ROOTFS_ROMFS_COMPRESS_EXT) $@
+
+ifeq ($(BR2_TARGET_ROOTFS_ROMFS_UIMAGE),y)
+ROOTFS_ROMFS_POST_TARGETS += $(BINARIES_DIR)/rootfs.romfs.uboot
+endif
+
+$(eval $(call ROOTFS_TARGET,romfs))
-- 
2.3.5
