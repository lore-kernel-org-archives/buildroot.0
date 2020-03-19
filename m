From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Mar 2020 18:43:15 +0100
Subject: [Buildroot] [git commit] fs/erofs: add support for creating EROFS
 rootfs image
Message-ID: <20200319173655.2156D82879@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f69f1fc3022b88330f421b5802db3d71f09fba42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch makes possible to create rootfs image using
EROFS filesystem.

Signed-off-by: Gao Xiang <hsiangkao@aol.com>
[yann.morin.1998 at free.fr:
  - simplify help text of filesystem entry
  - drop the compression choice, keep the single boolean
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 fs/Config.in       |  1 +
 fs/erofs/Config.in | 14 ++++++++++++++
 fs/erofs/erofs.mk  | 17 +++++++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/fs/Config.in b/fs/Config.in
index 527051ef54..37a2aa21f8 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -5,6 +5,7 @@ source "fs/btrfs/Config.in"
 source "fs/cloop/Config.in"
 source "fs/cpio/Config.in"
 source "fs/cramfs/Config.in"
+source "fs/erofs/Config.in"
 source "fs/ext2/Config.in"
 source "fs/f2fs/Config.in"
 source "fs/initramfs/Config.in"
diff --git a/fs/erofs/Config.in b/fs/erofs/Config.in
new file mode 100644
index 0000000000..d7360edeab
--- /dev/null
+++ b/fs/erofs/Config.in
@@ -0,0 +1,14 @@
+config BR2_TARGET_ROOTFS_EROFS
+	bool "erofs root filesystem"
+	select BR2_PACKAGE_HOST_EROFS_UTILS
+	help
+	  Build a EROFS root filesystem.
+
+if BR2_TARGET_ROOTFS_EROFS
+
+config BR2_TARGET_ROOTFS_EROFS_LZ4HC
+	bool "lz4hc compression"
+	help
+	  Use lz4 high-compression to compress data in the filesystem.
+
+endif # BR2_TARGET_ROOTFS_EROFS
diff --git a/fs/erofs/erofs.mk b/fs/erofs/erofs.mk
new file mode 100644
index 0000000000..58559d4833
--- /dev/null
+++ b/fs/erofs/erofs.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# Build the EROFS root filesystem image
+#
+################################################################################
+
+ROOTFS_EROFS_DEPENDENCIES = host-erofs-utils
+
+ifeq ($(BR2_TARGET_ROOTFS_EROFS_LZ4HC),y)
+ROOTFS_EROFS_ARGS += -zlz4hc
+endif
+
+define ROOTFS_EROFS_CMD
+	$(HOST_DIR)/bin/mkfs.erofs $(ROOTFS_EROFS_ARGS) $@ $(TARGET_DIR)
+endef
+
+$(eval $(rootfs))
