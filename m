From: Roland Uuesoo <rolandu@gmail.com>
Date: Tue,  6 Mar 2012 12:47:59 +0200
Subject: [Buildroot] [PATCH] Ubinize: made UBI volume name and volume
	alignment configurable
Message-ID: <1331030879-13141-1-git-send-email-rolandu@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Roland Uuesoo <roland@martem.eu>

Signed-off-by: Roland Uuesoo <roland@martem.eu>
---
 fs/ubifs/Config.in   |   39 +++++++++++++++++++++++++++++++++++----
 fs/ubifs/ubi.mk      |   12 ++++++++----
 fs/ubifs/ubinize.cfg |    2 --
 3 files changed, 43 insertions(+), 10 deletions(-)

diff --git a/fs/ubifs/Config.in b/fs/ubifs/Config.in
index a5ef5f2..f887848 100644
--- a/fs/ubifs/Config.in
+++ b/fs/ubifs/Config.in
@@ -7,20 +7,37 @@ config BR2_TARGET_ROOTFS_UBIFS_LEBSIZE
 	hex "UBI logical erase block size"
 	depends on BR2_TARGET_ROOTFS_UBIFS
 	default 0x1f800
+	help
+	  In general, logical eraseblock size is a property of the UBI device,
+	  not of the UBI volume. The logical eraseblock size depends on the
+	  physical eraseblock size and on how much bytes UBI headers consume.
+	  But because of the volume alignment, the usable size of logical
+	  eraseblock in a volume may be less.
+	  LEB size = PEB size - (PEB size % alignment)
 
 config BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE
 	hex "UBI minimum I/O size"
 	depends on BR2_TARGET_ROOTFS_UBIFS
 	default 0x800
 	help
-	  Some comment required here
+	  Minimum input/output unit size. All the I/O may only be done
+	  in fractions of the contained number.
 
 config BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT
 	int "Maximum LEB count"
 	depends on BR2_TARGET_ROOTFS_UBIFS
 	default 2048
 	help
-	  Some comment required here
+	  This option defines the maximum file-system size (maximum UBI volume
+	  size). For example, if you use --max-leb-cnt=200, than it will be
+	  possible to put the resulting image to smaller UBI volume and mount
+	  it. But if the image is put to a larger UBI volume, the file-system
+	  will anyway take only first 200 LEBs, and the rest of the volume will
+	  be wasted.
+	  Note, the --max-leb-cnt option does not affect the size of the
+	  resulting image file, which depends only on the amount of data in the
+	  file-system. mkfs.ubifs just writes the --max-leb-cnt value to the
+	  file-system superblocks.
 
 choice
 	prompt "ubifs runtime compression"
@@ -52,8 +69,7 @@ choice
 	default BR2_TARGET_ROOTFS_UBIFS_NONE
 	depends on BR2_TARGET_ROOTFS_UBIFS
 	help
-	  Select which compression format to compress the final image
-	  into.
+	  Select which compression format to compress the final image into.
 
 config BR2_TARGET_ROOTFS_UBIFS_NONE
 	bool "no compression"
@@ -98,3 +114,18 @@ config BR2_TARGET_ROOTFS_UBI_SUBSIZE
 	help
 	  Tells ubinize that the flash supports sub-pages and the sub-page
 	  size. Use 0 if subpages are not supported on flash chip.
+
+config BR2_TARGET_ROOTFS_UBI_VOL_ALIGNMENT
+	int "UBI volume alignment"
+	depends on BR2_TARGET_ROOTFS_UBI
+	default 1
+	help
+	  Alignment is a multiple of the minimal flash input/output unit size.
+	  Volume alignment must not be greater than LEB size.
+
+config BR2_TARGET_ROOTFS_UBI_VOL_NAME
+	string "UBI volume name"
+	depends on BR2_TARGET_ROOTFS_UBI
+	default rootfs
+	help
+	  UBI volume name
diff --git a/fs/ubifs/ubi.mk b/fs/ubifs/ubi.mk
index c88e336..b4a8a78 100644
--- a/fs/ubifs/ubi.mk
+++ b/fs/ubifs/ubi.mk
@@ -13,11 +13,15 @@ endif
 ROOTFS_UBI_DEPENDENCIES = rootfs-ubifs
 
 define ROOTFS_UBI_CMD
-	cp fs/ubifs/ubinize.cfg . ;\
+	cp fs/ubifs/ubinize.cfg $(BUILD_DIR)/_ubinize.cfg ;\
+	echo "vol_name=$(BR2_TARGET_ROOTFS_UBI_VOL_NAME)" \
+		>> $(BUILD_DIR)/_ubinize.cfg ;\
+	echo "vol_alignment=$(BR2_TARGET_ROOTFS_UBI_VOL_ALIGNMENT)" \
+		>> $(BUILD_DIR)/_ubinize.cfg ; \
 	echo "image=$$@fs" \
-		>> ./ubinize.cfg ;\
-	$(HOST_DIR)/usr/sbin/ubinize -o $$@ $(UBI_UBINIZE_OPTS) ubinize.cfg ;\
-	rm ubinize.cfg
+		>> $(BUILD_DIR)/_ubinize.cfg ;\
+	$(HOST_DIR)/usr/sbin/ubinize -o $$@ $(UBI_UBINIZE_OPTS) $(BUILD_DIR)/_ubinize.cfg ;\
+	rm $(BUILD_DIR)/_ubinize.cfg
 endef
 
 $(eval $(call ROOTFS_TARGET,ubi))
diff --git a/fs/ubifs/ubinize.cfg b/fs/ubifs/ubinize.cfg
index 6515271..d4140ed 100644
--- a/fs/ubifs/ubinize.cfg
+++ b/fs/ubifs/ubinize.cfg
@@ -2,6 +2,4 @@
 mode=ubi
 vol_id=0
 vol_type=dynamic
-vol_name=rootfs
-vol_alignment=1
 vol_flags=autoresize
-- 
1.7.5.4
