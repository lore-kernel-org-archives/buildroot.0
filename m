From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Dec 2017 18:13:36 +0100
Subject: [Buildroot] [git commit] fs/iso9660: add option for transparent
 (de)compression
Message-ID: <20171231172140.9AB068390B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=90867d8fdf45e7af24cf9e63e3ee8a70f30b479c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Thomas: rename option to BR2_TARGET_ROOTFS_ISO9660_TRANSPARENT_COMPRESSION.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/iso9660/Config.in  |  9 +++++++++
 fs/iso9660/iso9660.mk | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
index 842c987..6f001c0 100644
--- a/fs/iso9660/Config.in
+++ b/fs/iso9660/Config.in
@@ -63,6 +63,15 @@ config BR2_TARGET_ROOTFS_ISO9660_INITRD
 	  contain a kernel image, an initrd image (unless an initramfs
 	  linked into the kernel is used) and the bootloader.
 
+config BR2_TARGET_ROOTFS_ISO9660_TRANSPARENT_COMPRESSION
+	bool "transparent compression"
+	depends on !BR2_TARGET_ROOTFS_ISO9660_INITRD
+	depends on !BR2_TARGET_ROOTFS_INITRAMFS
+	help
+	  Say 'y' to enable use of transparent (de)compression. Files
+	  are stored compressed and will be decompressed on-the-fly
+	  upon access at runtime.
+
 config BR2_TARGET_ROOTFS_ISO9660_HYBRID
 	bool "Build hybrid image"
 	depends on BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index c2de271..0646726 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -41,6 +41,17 @@ define ROOTFS_ISO9660_CREATE_TEMPDIR
 	mkdir -p $(ROOTFS_ISO9660_TARGET_DIR)
 endef
 ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_CREATE_TEMPDIR
+else ifeq ($(BR2_TARGET_ROOTFS_ISO9660_TRANSPARENT_COMPRESSION),y)
+ROOTFS_ISO9660_TARGET_DIR = $(FS_DIR)/rootfs.iso9660.tmp
+# This must be early, before we copy the bootloader files
+define ROOTFS_ISO9660_MKZFTREE
+	$(RM) -rf $(ROOTFS_ISO9660_TARGET_DIR)
+	mkzftree -X -z 9 -p $(PARALLEL_JOBS) \
+		$(TARGET_DIR) \
+		$(ROOTFS_ISO9660_TARGET_DIR)
+endef
+ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_MKZFTREE
+ROOTFS_ISO9660_GENISOIMAGE_OPTS += -z
 else
 ROOTFS_ISO9660_TARGET_DIR = $(TARGET_DIR)
 endif
@@ -117,6 +128,7 @@ endif # ROOTFS_ISO9660_USE_INITRD
 define ROOTFS_ISO9660_CMD
 	$(HOST_DIR)/bin/genisoimage -J -R -b $(ROOTFS_ISO9660_BOOT_IMAGE) \
 		-no-emul-boot -boot-load-size 4 -boot-info-table \
+		$(ROOTFS_ISO9660_GENISOIMAGE_OPTS) \
 		-o $@ $(ROOTFS_ISO9660_TARGET_DIR)
 endef
 
