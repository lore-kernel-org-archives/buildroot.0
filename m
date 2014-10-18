From: Karoly Kasza <kaszak@gmail.com>
Date: Sat, 18 Oct 2014 20:23:59 +0200
Subject: [Buildroot] [PATCH v2 1/1] fs/iso9660: add dependencies for make
	source
Message-ID: <1413656639-3314-1-git-send-email-kaszak@gmail.com>
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

Changes v1 -> v2:
  - Changed local target's dependencies to variable
  - Changed dependencies order to alphabetical

 fs/iso9660/iso9660.mk |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index b0e755d..2d6735e 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -10,7 +10,9 @@
 ISO9660_TARGET_DIR = $(BUILD_DIR)/iso9660
 ISO9660_BOOT_MENU := $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
 
-$(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux rootfs-cpio grub
+ROOTFS_ISO9660_DEPENDENCIES = grub host-cdrkit host-fakeroot linux rootfs-cpio
+
+$(BINARIES_DIR)/rootfs.iso9660: $(ROOTFS_ISO9660_DEPENDENCIES)
 	@$(call MESSAGE,"Generating root filesystem image rootfs.iso9660")
 	mkdir -p $(ISO9660_TARGET_DIR)
 	mkdir -p $(ISO9660_TARGET_DIR)/boot/grub
-- 
1.7.10.4
