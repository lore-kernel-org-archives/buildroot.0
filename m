From: Karoly Kasza <kaszak@gmail.com>
Date: Fri, 17 Oct 2014 23:16:45 +0200
Subject: [Buildroot] [PATCH] fs/iso9660: add dependencies for make source
Message-ID: <1413580605-57289-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The "iso image" rootfs target is a special one, as it does not use the
ROOTFS_TARGET infrastructure. The absence of ROOTFS_*_DEPENDENCIES
variable makes "make source" to skip this target's dependencies
(namely host-cdrkit and it's children) obstructing an offline build.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 fs/iso9660/iso9660.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index b0e755d..5137026 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -10,6 +10,8 @@
 ISO9660_TARGET_DIR = $(BUILD_DIR)/iso9660
 ISO9660_BOOT_MENU := $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
 
+ROOTFS_ISO9660_DEPENDENCIES = host-cdrkit host-fakeroot linux rootfs-cpio grub
+
 $(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux rootfs-cpio grub
 	@$(call MESSAGE,"Generating root filesystem image rootfs.iso9660")
 	mkdir -p $(ISO9660_TARGET_DIR)
-- 
1.7.10.4
