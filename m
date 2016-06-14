From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Tue, 14 Jun 2016 17:32:16 +0200
Subject: [Buildroot] [PATCH 11/12] reproducibility/fs/iso9660: reproducible
	iso images
In-Reply-To: <1465918337-30732-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160614152928.GH3060@hermes.click-hack.org>
 <1465918337-30732-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1465918337-30732-2-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When reproducibility is required, we:
- run genisoimage with the -creation-date option to avoid using the
  build date for files in the iso image automatically created by
  genisoimage (such as the catalog)
- disable the rockridge extension, as it stores each file "ctime", which
  can not be changed easily on the host filesystem
- force using an initrd, as a trying and booting an iso image without
  the rockridge extensions will not work
- use isohybrid -i option to avoid embedding a random number in the
  generated iso.

Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
---
 fs/iso9660/Config.in  |  9 +++++++++
 fs/iso9660/iso9660.mk | 20 ++++++++++++++++++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
index 2482e44..bb82d03 100644
--- a/fs/iso9660/Config.in
+++ b/fs/iso9660/Config.in
@@ -71,6 +71,15 @@ config BR2_TARGET_ROOTFS_ISO9660_INITRD
 	  contain a kernel image, an initrd image (unless an initramfs
 	  linked into the kernel is used) and the bootloader.
 
+config BR2_TARGET_ROOTFS_ISO9660_REPRODUCIBLE
+       def_bool BR2_REPRODUCIBLE
+       select BR2_TARGET_ROOTFS_ISO9660_INITRD
+
+if BR2_REPRODUCIBLE
+comment "A reproducible build requires disabling the RockRidge extensions"
+comment "Which makes using an initrd the only sane solution"
+endif
+
 config BR2_TARGET_ROOTFS_ISO9660_HYBRID
 	bool "Build hybrid image"
 	depends on BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 32d79d7..f97a9d7 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -143,15 +143,31 @@ ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_DISABLE_EXTERNAL_INITRD
 endif # ROOTFS_ISO9660_USE_INITRD
 
 
+ifneq ($(BR2_REPRODUCIBLE),y)
+define ROOTFS_ISO9660_GENISOIMAGE
+	$(HOST_DIR)/usr/bin/genisoimage -R
+endef
+define ROOTFS_ISO9660_ISOHYBRID
+	$(HOST_DIR)/usr/bin/isohybrid
+endef
+else
+define ROOTFS_ISO9660_GENISOIMAGE
+	$(HOST_DIR)/usr/bin/genisoimage -creation-date $(SOURCE_DATE_EPOCH)
+endef
+define ROOTFS_ISO9660_ISOHYBRID
+	$(HOST_DIR)/usr/bin/isohybrid -i $(SOURCE_DATE_EPOCH)
+endef
+endif
+
 define ROOTFS_ISO9660_CMD
-	$(HOST_DIR)/usr/bin/genisoimage -J -R -b $(ROOTFS_ISO9660_BOOT_IMAGE) \
+	$(ROOTFS_ISO9660_GENISOIMAGE) -J -b $(ROOTFS_ISO9660_BOOT_IMAGE) \
 		-no-emul-boot -boot-load-size 4 -boot-info-table \
 		-o $@ $(ROOTFS_ISO9660_TARGET_DIR)
 endef
 
 ifeq ($(BR2_TARGET_ROOTFS_ISO9660_HYBRID),y)
 define ROOTFS_ISO9660_GEN_HYBRID
-	$(HOST_DIR)/usr/bin/isohybrid -t 0x96 $@
+	$(ROOTFS_ISO9660_ISOHYBRID) -t 0x96 $@
 endef
 
 ROOTFS_ISO9660_POST_GEN_HOOKS += ROOTFS_ISO9660_GEN_HYBRID
-- 
2.8.2
