From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  4 Jun 2015 17:05:28 +0200
Subject: [Buildroot] [PATCH 10/12] fs/iso9660: add hybrid image support
In-Reply-To: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1433430330-2166-11-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a new option, which allows, when isolinux is used as
the bootloader, to generate an "hybrid" ISO image. Such images can
either be booted from CD-ROM or from USB keys. It simply uses the
isohybrid tool provided by syslinux.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/iso9660/Config.in  | 9 +++++++++
 fs/iso9660/iso9660.mk | 8 ++++++++
 2 files changed, 17 insertions(+)

diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
index e7bf3c3..1b1f090 100644
--- a/fs/iso9660/Config.in
+++ b/fs/iso9660/Config.in
@@ -58,6 +58,15 @@ config BR2_TARGET_ROOTFS_ISO9660_INITRD
 	  contain a kernel image, an initrd image (unless an initramfs
 	  linked into the kernel is used) and the bootloader.
 
+config BR2_TARGET_ROOTFS_ISO9660_HYBRID
+	bool "Build hybrid image"
+	depends on BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
+	help
+	  Enable this option to build an hybrid image, i.e an image
+	  which can either be booted from a CD-ROM or from a device
+	  which BIOS considers a hard disk or ZIP disk, e.g. a USB key
+	  or similar.
+
 endif
 
 comment "iso image needs a Linux kernel and grub or isolinux to be built"
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index c95485c..792a770 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -142,4 +142,12 @@ endef
 ROOTFS_ISO9660_POST_GEN_HOOKS += ROOTFS_ISO9660_REMOVE_TEMPDIR
 endif
 
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_HYBRID),y)
+define ROOTFS_ISO9660_GEN_HYBRID
+	$(HOST_DIR)/usr/bin/isohybrid $@
+endef
+
+ROOTFS_ISO9660_POST_GEN_HOOKS += ROOTFS_ISO9660_GEN_HYBRID
+endif
+
 $(eval $(call ROOTFS_TARGET,iso9660))
-- 
2.1.0
