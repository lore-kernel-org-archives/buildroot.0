From: Roland Uuesoo <rolandu@gmail.com>
Date: Mon,  5 Mar 2012 21:14:12 +0200
Subject: [Buildroot] [PATCH] Ubinize: made UBI volume name and volume
	alignment configurable
Message-ID: <1330974852-27696-1-git-send-email-rolandu@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Roland Uuesoo <roland@martem.eu>

Signed-off-by: Roland Uuesoo <roland@martem.eu>
---
 fs/ubifs/Config.in   |   14 ++++++++++++++
 fs/ubifs/ubi.mk      |   12 ++++++++----
 fs/ubifs/ubinize.cfg |    2 --
 3 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/Config.in b/fs/ubifs/Config.in
index a5ef5f2..c76fa76 100644
--- a/fs/ubifs/Config.in
+++ b/fs/ubifs/Config.in
@@ -98,3 +98,17 @@ config BR2_TARGET_ROOTFS_UBI_SUBSIZE
 	help
 	  Tells ubinize that the flash supports sub-pages and the sub-page
 	  size. Use 0 if subpages are not supported on flash chip.
+
+config BR2_TARGET_ROOTFS_UBI_VOL_ALIGNMENT
+        int "UBI volume alignment"
+        depends on BR2_TARGET_ROOTFS_UBI
+        default 1
+        help
+          Default volume alignment
+
+config BR2_TARGET_ROOTFS_UBI_VOL_NAME
+        string "UBI volume name"
+        depends on BR2_TARGET_ROOTFS_UBI
+        default rootfs
+        help
+          UBI volume name
diff --git a/fs/ubifs/ubi.mk b/fs/ubifs/ubi.mk
index c88e336..7cdbea8 100644
--- a/fs/ubifs/ubi.mk
+++ b/fs/ubifs/ubi.mk
@@ -13,11 +13,15 @@ endif
 ROOTFS_UBI_DEPENDENCIES = rootfs-ubifs
 
 define ROOTFS_UBI_CMD
-	cp fs/ubifs/ubinize.cfg . ;\
+	cp fs/ubifs/ubinize.cfg $(BUILD_DIR)/_ubinize.cfg ;\
+        echo "vol_name=$(BR2_TARGET_ROOTFS_UBI_VOL_NAME)" \
+                >> $(BUILD_DIR)/_ubinize.cfg ;\
+        echo "vol_alignment=$(BR2_TARGET_ROOTFS_UBI_VOL_ALIGNMENT)" \
+                >> $(BUILD_DIR)/_ubinize.cfg ; \
 	echo "image=$$@fs" \
-		>> ./ubinize.cfg ;\
-	$(HOST_DIR)/usr/sbin/ubinize -o $$@ $(UBI_UBINIZE_OPTS) ubinize.cfg ;\
-	rm ubinize.cfg
+		>> $(BUILD_DIR)/_ubinize.cfg ;\
+	$(HOST_DIR)/usr/sbin/ubinize -o $$@ $(UBI_UBINIZE_OPTS) $(BUILD_DIR)/_ubinize.cfg ;\
+        rm $(BUILD_DIR)/_ubinize.cfg
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
