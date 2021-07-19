From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 19 Jul 2021 22:34:21 +0200
Subject: [Buildroot] [git commit] fs/erofs: add big pcluster support
Message-ID: <20210719200108.6D2B6883CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=90dfc0a59660020c21fdb5567e45d4edf3e66660
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This enables EROFS big pcluster images for buildroot.

Signed-off-by: Gao Xiang <hsiangkao@aol.com>
[yann.morin.1998 at free.fr: must be a multiple of 4KiB]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 fs/erofs/Config.in | 10 ++++++++++
 fs/erofs/erofs.mk  |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/fs/erofs/Config.in b/fs/erofs/Config.in
index d7360edeab..e112572688 100644
--- a/fs/erofs/Config.in
+++ b/fs/erofs/Config.in
@@ -11,4 +11,14 @@ config BR2_TARGET_ROOTFS_EROFS_LZ4HC
 	help
 	  Use lz4 high-compression to compress data in the filesystem.
 
+config BR2_TARGET_ROOTFS_EROFS_PCLUSTERSIZE
+	int "pcluster size"
+	default 0
+	help
+	  Specify the maximum size of physical cluster in bytes, as a
+	  multiple of 4KiB, for the big pcluster feature in order to
+	  get much better compression ratios (thus better sequential
+	  read performance for common storage devices), which has been
+	  introduced since Linux 5.13.
+
 endif # BR2_TARGET_ROOTFS_EROFS
diff --git a/fs/erofs/erofs.mk b/fs/erofs/erofs.mk
index 58559d4833..0e9d4401a9 100644
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
