From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Tue, 21 Dec 2010 18:38:07 +0100
Subject: [Buildroot] [PATCH] v2 Add UBI image generation support.
Message-ID: <1292953087-19486-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Boibessot <julien.boibessot@armadeus.com>

UBI images are generated from UBIFS one (with ubinize tool) and are used by
bootloaders (eg U-Boot) to write UBIFS images directly on bare NAND FLASH
(see http://www.linux-mtd.infradead.org/faq/ubi.html).

Changes since v1:
* change some comments/helps
* as requested by Thomas, merged fs/ubi/ in fs/ubifs/, but kept ubifs.mk and
  ubi.mk separated. (I don't know if it's really worth to merge them...)

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
Signed-off-by: Nicolas Colombain <nicolas.colombain@armadeus.com>
---
 fs/ubifs/Config.in   |   22 ++++++++++++++++++++++
 fs/ubifs/ubi.mk      |   23 +++++++++++++++++++++++
 fs/ubifs/ubinize.cfg |    7 +++++++
 3 files changed, 52 insertions(+), 0 deletions(-)
 create mode 100644 fs/ubifs/ubi.mk
 create mode 100644 fs/ubifs/ubinize.cfg

diff --git a/fs/ubifs/Config.in b/fs/ubifs/Config.in
index bcf409c..363960e 100644
--- a/fs/ubifs/Config.in
+++ b/fs/ubifs/Config.in
@@ -77,3 +77,25 @@ config BR2_TARGET_ROOTFS_UBIFS_LZMA
 
 endchoice
 
+config BR2_TARGET_ROOTFS_UBI
+	depends on BR2_TARGET_ROOTFS_UBIFS
+	bool "Embed into an UBI image"
+	help
+	  Build an ubi image from the ubifs one (with ubinize).
+
+config BR2_TARGET_ROOTFS_UBI_PEBSIZE
+	hex "UBI physical erase block size"
+	depends on BR2_TARGET_ROOTFS_UBI
+	default 0x20000
+	help
+	  Tells ubinize that physical eraseblock size of the flash chip the ubi
+	  image is created for is 0x20000 (by default).
+
+config BR2_TARGET_ROOTFS_UBI_SUBSIZE
+	int "UBI sub-page size"
+	depends on BR2_TARGET_ROOTFS_UBI
+	default 512
+	help
+	  Tells ubinize that the flash supports sub-pages and that sub-page
+	  size is 512 bytes (by default).
+
diff --git a/fs/ubifs/ubi.mk b/fs/ubifs/ubi.mk
new file mode 100644
index 0000000..c88e336
--- /dev/null
+++ b/fs/ubifs/ubi.mk
@@ -0,0 +1,23 @@
+#############################################################
+#
+# Embed the ubifs image into an ubi one
+#
+#############################################################
+
+UBI_UBINIZE_OPTS := -m $(BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE)
+UBI_UBINIZE_OPTS += -p $(BR2_TARGET_ROOTFS_UBI_PEBSIZE)
+ifneq ($(BR2_TARGET_ROOTFS_UBI_SUBSIZE),0)
+UBI_UBINIZE_OPTS += -s $(BR2_TARGET_ROOTFS_UBI_SUBSIZE)
+endif
+
+ROOTFS_UBI_DEPENDENCIES = rootfs-ubifs
+
+define ROOTFS_UBI_CMD
+	cp fs/ubifs/ubinize.cfg . ;\
+	echo "image=$$@fs" \
+		>> ./ubinize.cfg ;\
+	$(HOST_DIR)/usr/sbin/ubinize -o $$@ $(UBI_UBINIZE_OPTS) ubinize.cfg ;\
+	rm ubinize.cfg
+endef
+
+$(eval $(call ROOTFS_TARGET,ubi))
diff --git a/fs/ubifs/ubinize.cfg b/fs/ubifs/ubinize.cfg
new file mode 100644
index 0000000..6515271
--- /dev/null
+++ b/fs/ubifs/ubinize.cfg
@@ -0,0 +1,7 @@
+[ubifs]
+mode=ubi
+vol_id=0
+vol_type=dynamic
+vol_name=rootfs
+vol_alignment=1
+vol_flags=autoresize
-- 
1.6.0.4
