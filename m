From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
Date: Wed, 3 Dec 2014 18:10:53 +0100
Subject: [Buildroot] [PATCH] fs: allow to specify compression options
Message-ID: <1417626653-13516-1-git-send-email-vincent.stehle@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add $BR2_TARGET_ROOTFS_xxx_OPTS options to allow changing the rootfs
compression options.

This allows to trade compression ratio versus compression speed for example.

We default to the previous settings.

Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---


Hi,

I would like to propose this patch, to allow specifying rootfs compression
options. I use it to reduce lzop compression level for faster rootfs
compression.

Best regards,

V.


 fs/Config.in | 34 ++++++++++++++++++++++++++++++++++
 fs/common.mk | 10 +++++-----
 2 files changed, 39 insertions(+), 5 deletions(-)

diff --git a/fs/Config.in b/fs/Config.in
index 5853113..9bd70e0 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -13,4 +13,38 @@ source "fs/tar/Config.in"
 source "fs/ubifs/Config.in"
 source "fs/yaffs2/Config.in"
 
+menu "Filesystem compression options"
+
+config BR2_TARGET_ROOTFS_GZIP_OPTS
+	string "Gzip options"
+	default "-9"
+	help
+	  Options to use when compressing the root filesystem with gzip.
+
+config BR2_TARGET_ROOTFS_BZIP2_OPTS
+	string "Bzip2 options"
+	default "-9"
+	help
+	  Options to use when compressing the root filesystem with bzip2.
+
+config BR2_TARGET_ROOTFS_LZMA_OPTS
+	string "Lzma options"
+	default "-9"
+	help
+	  Options to use when compressing the root filesystem with lzma.
+
+config BR2_TARGET_ROOTFS_LZOP_OPTS
+	string "Lzop options"
+	default "-9"
+	help
+	  Options to use when compressing the root filesystem with lzop.
+
+config BR2_TARGET_ROOTFS_XZ_OPTS
+	string "Xz options"
+	default "-9 -C crc32"
+	help
+	  Options to use when compressing the root filesystem with xz.
+
+endmenu
+
 endmenu
diff --git a/fs/common.mk b/fs/common.mk
index d40f5ae..c8a71d6 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -45,25 +45,25 @@ ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs \
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_GZIP),y)
 ROOTFS_$(2)_COMPRESS_EXT = .gz
-ROOTFS_$(2)_COMPRESS_CMD = gzip -9 -c
+ROOTFS_$(2)_COMPRESS_CMD = gzip $$(call qstrip,$$(BR2_TARGET_ROOTFS_GZIP_OPTS)) -c
 endif
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_BZIP2),y)
 ROOTFS_$(2)_COMPRESS_EXT = .bz2
-ROOTFS_$(2)_COMPRESS_CMD = bzip2 -9 -c
+ROOTFS_$(2)_COMPRESS_CMD = bzip2 $$(call qstrip,$$(BR2_TARGET_ROOTFS_BZIP2_OPTS)) -c
 endif
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_LZMA),y)
 ROOTFS_$(2)_DEPENDENCIES += host-lzma
 ROOTFS_$(2)_COMPRESS_EXT = .lzma
-ROOTFS_$(2)_COMPRESS_CMD = $$(LZMA) -9 -c
+ROOTFS_$(2)_COMPRESS_CMD = $$(LZMA) $$(call qstrip,$$(BR2_TARGET_ROOTFS_LZMA_OPTS)) -c
 endif
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_LZO),y)
 ROOTFS_$(2)_DEPENDENCIES += host-lzop
 ROOTFS_$(2)_COMPRESS_EXT = .lzo
-ROOTFS_$(2)_COMPRESS_CMD = $$(LZOP) -9 -c
+ROOTFS_$(2)_COMPRESS_CMD = $$(LZOP) $$(call qstrip,$$(BR2_TARGET_ROOTFS_LZOP_OPTS)) -c
 endif
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_XZ),y)
 ROOTFS_$(2)_COMPRESS_EXT = .xz
-ROOTFS_$(2)_COMPRESS_CMD = xz -9 -C crc32 -c
+ROOTFS_$(2)_COMPRESS_CMD = xz $$(call qstrip,$$(BR2_TARGET_ROOTFS_XZ_OPTS)) -c
 endif
 
 $$(BINARIES_DIR)/rootfs.$(1): target-finalize $$(ROOTFS_$(2)_DEPENDENCIES)
-- 
2.1.3
