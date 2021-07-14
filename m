From: Gao Xiang <hsiangkao@aol.com>
Date: Wed, 14 Jul 2021 22:55:28 +0800
Subject: [Buildroot] [PATCH] fs/erofs: add big pcluster support
References: <20210714145528.25255-1-hsiangkao.ref@aol.com>
Message-ID: <20210714145528.25255-1-hsiangkao@aol.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This enables EROFS big pcluster images for buildroot.

Signed-off-by: Gao Xiang <hsiangkao@aol.com>
---
 fs/erofs/Config.in | 10 ++++++++++
 fs/erofs/erofs.mk  |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/fs/erofs/Config.in b/fs/erofs/Config.in
index d7360edeabfd..7619037c4775 100644
--- a/fs/erofs/Config.in
+++ b/fs/erofs/Config.in
@@ -11,4 +11,14 @@ config BR2_TARGET_ROOTFS_EROFS_LZ4HC
 	help
 	  Use lz4 high-compression to compress data in the filesystem.
 
+config BR2_TARGET_ROOTFS_EROFS_PCLUSTERSIZE
+	int "pcluster size"
+	default 0
+	help
+	  Specify the maximum size of physical cluster in bytes for
+	  the big pcluster feature in order to get much better
+	  compression ratios (thus better sequential read performance
+	  for common storage devices), which has been introduced since
+	  Linux 5.13.
+
 endif # BR2_TARGET_ROOTFS_EROFS
diff --git a/fs/erofs/erofs.mk b/fs/erofs/erofs.mk
index 58559d483340..0e9d4401a939 100644
--- a/fs/erofs/erofs.mk
+++ b/fs/erofs/erofs.mk
@@ -10,6 +10,10 @@ ifeq ($(BR2_TARGET_ROOTFS_EROFS_LZ4HC),y)
 ROOTFS_EROFS_ARGS += -zlz4hc
 endif
 
+ifneq ($(BR2_TARGET_ROOTFS_EROFS_PCLUSTERSIZE),0)
+ROOTFS_EROFS_ARGS += -C$(strip $(BR2_TARGET_ROOTFS_EROFS_PCLUSTERSIZE))
+endif
+
 define ROOTFS_EROFS_CMD
 	$(HOST_DIR)/bin/mkfs.erofs $(ROOTFS_EROFS_ARGS) $@ $(TARGET_DIR)
 endef
-- 
2.20.1
