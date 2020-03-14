From: Gao Xiang <hsiangkao@aol.com>
Date: Sat, 14 Mar 2020 19:43:06 +0800
Subject: [Buildroot] [PATCH RESEND 2/2] fs/erofs: add support for creating
 erofs rootfs image
In-Reply-To: <20200314114306.3289-1-hsiangkao@aol.com>
References: <20200314114306.3289-1-hsiangkao@aol.com>
Message-ID: <20200314114306.3289-2-hsiangkao@aol.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch makes possible to create rootfs image using
EROFS filesystem.

Signed-off-by: Gao Xiang <hsiangkao@aol.com>
---
 fs/Config.in       |  1 +
 fs/erofs/Config.in | 24 ++++++++++++++++++++++++
 fs/erofs/erofs.mk  | 17 +++++++++++++++++
 3 files changed, 42 insertions(+)
 create mode 100644 fs/erofs/Config.in
 create mode 100644 fs/erofs/erofs.mk

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
index 0000000000..dad2498a15
--- /dev/null
+++ b/fs/erofs/Config.in
@@ -0,0 +1,24 @@
+config BR2_TARGET_ROOTFS_EROFS
+	bool "erofs root filesystem"
+	select BR2_PACKAGE_HOST_EROFS_UTILS
+	help
+	  Build a EROFS root filesystem. If you enable this option,
+	  you probably want to enable the erofs-utils package too.
+
+if BR2_TARGET_ROOTFS_EROFS
+
+choice
+	prompt "Compression algorithm"
+	default BR2_TARGET_ROOTFS_EROFS_LZ4HC
+	help
+	  Select the primary compression algorithm to use when
+	  generating EROFS filesystem image.
+
+config BR2_TARGET_ROOTFS_EROFS_NONE
+	bool "none"
+
+config BR2_TARGET_ROOTFS_EROFS_LZ4HC
+	bool "lz4hc"
+
+endchoice
+endif # BR2_TARGET_ROOTFS_EROFS
diff --git a/fs/erofs/erofs.mk b/fs/erofs/erofs.mk
new file mode 100644
index 0000000000..c9eb0d8e8f
--- /dev/null
+++ b/fs/erofs/erofs.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# Build the erofs root filesystem image
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
-- 
2.20.1
