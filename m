From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 Jan 2013 08:03:43 -0300
Subject: [Buildroot] [PATCHv2 3/3] fs/common: add support for LZO and XZ
	compression methods
In-Reply-To: <1358852623-10388-1-git-send-email-gustavo@zacarias.com.ar>
References: <1358852623-10388-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1358852623-10388-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for LZO and XZ compression methods to cpio, ext2, tar and
ubifs filesystem targets.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 fs/common.mk       |  8 +++++++-
 fs/cpio/Config.in  | 18 ++++++++++++++----
 fs/ext2/Config.in  | 10 ++++++++++
 fs/tar/Config.in   | 18 ++++++++++++++----
 fs/ubifs/Config.in | 10 ++++++++++
 5 files changed, 55 insertions(+), 9 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 8b5b2f2..3d74d08 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -39,7 +39,7 @@ ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE)) \
 define ROOTFS_TARGET_INTERNAL
 
 # extra deps
-ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs $$(if $$(BR2_TARGET_ROOTFS_$(2)_LZMA),host-lzma)
+ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs $$(if $$(BR2_TARGET_ROOTFS_$(2)_LZMA),host-lzma) $$(if $$(BR2_TARGET_ROOTFS_$(2)_LZO),host-lzop) $$(if $$(BR2_TARGET_ROOTFS_$(2)_XZ),host-xz)
 
 $$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES)
 	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
@@ -70,6 +70,12 @@ endif
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_LZMA),y)
 	$$(LZMA) -9 -c $$@ > $$@.lzma
 endif
+ifeq ($$(BR2_TARGET_ROOTFS_$(2)_LZO),y)
+	$$(LZOP) -9 -c $$@ > $$@.lzo
+endif
+ifeq ($$(BR2_TARGET_ROOTFS_$(2)_XZ),y)
+	$(XZ) -9 -C crc32 -c $$@ > $$@.xz
+endif
 
 rootfs-$(1)-show-depends:
 	@echo $$(ROOTFS_$(2)_DEPENDENCIES)
diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
index 0669a44..87dde64 100644
--- a/fs/cpio/Config.in
+++ b/fs/cpio/Config.in
@@ -18,22 +18,32 @@ choice
 config BR2_TARGET_ROOTFS_CPIO_NONE
         bool "no compression"
         help
-         Do not compress the cpio filesystem.
+          Do not compress the cpio filesystem.
 
 config BR2_TARGET_ROOTFS_CPIO_GZIP
         bool "gzip"
         help
-         Do compress the cpio filesystem with gzip.
+          Do compress the cpio filesystem with gzip.
 
 config BR2_TARGET_ROOTFS_CPIO_BZIP2
         bool "bzip2"
         help
-         Do compress the cpio filesystem with bzip2.
+          Do compress the cpio filesystem with bzip2.
 
 config BR2_TARGET_ROOTFS_CPIO_LZMA
         bool "lzma"
         help
-         Do compress the cpio filesystem with lzma.
+          Do compress the cpio filesystem with lzma.
+
+config BR2_TARGET_ROOTFS_CPIO_LZO
+	bool "lzo"
+	help
+	  Do compress the cpio filesystem with lzop.
+
+config BR2_TARGET_ROOTFS_CPIO_XZ
+	bool "xz"
+	help
+	  Do compress the cpio filesystem with xz.
 
 endchoice
 
diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index 2af44a8..ef2e887 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -45,5 +45,15 @@ config BR2_TARGET_ROOTFS_EXT2_LZMA
 	help
 	  Do compress the ext2 filesystem with lzma.
 
+config BR2_TARGET_ROOTFS_EXT2_LZO
+	bool "lzo"
+	help
+	  Do compress the ext2 filesystem with lzop.
+
+config BR2_TARGET_ROOTFS_EXT2_XZ
+	bool "xz"
+	help
+	  Do compress the ext2 filesystem with xz.
+
 endchoice
 
diff --git a/fs/tar/Config.in b/fs/tar/Config.in
index 60b8bf4..63663ec 100644
--- a/fs/tar/Config.in
+++ b/fs/tar/Config.in
@@ -14,22 +14,32 @@ choice
 config BR2_TARGET_ROOTFS_TAR_NONE
 	bool "no compression"
 	help
-	 Do not compress the tarball.
+	  Do not compress the tarball.
 
 config BR2_TARGET_ROOTFS_TAR_GZIP
 	bool "gzip"
 	help
-	 Do compress the tarball with gzip.
+	  Do compress the tarball with gzip.
 
 config BR2_TARGET_ROOTFS_TAR_BZIP2
 	bool "bzip2"
 	help
-	 Do compress the tarball with bzip2.
+	  Do compress the tarball with bzip2.
 
 config BR2_TARGET_ROOTFS_TAR_LZMA
 	bool "lzma"
 	help
-	 Do compress the tarball with lzma.
+	  Do compress the tarball with lzma.
+
+config BR2_TARGET_ROOTFS_TAR_LZO
+	bool "lzo"
+	help
+	  Do compress the tarball with lzop.
+
+config BR2_TARGET_ROOTFS_TAR_XZ
+	bool "xz"
+	help
+	  Do compress the tarball with xz.
 
 endchoice
 
diff --git a/fs/ubifs/Config.in b/fs/ubifs/Config.in
index a5ef5f2..0a798d8 100644
--- a/fs/ubifs/Config.in
+++ b/fs/ubifs/Config.in
@@ -75,6 +75,16 @@ config BR2_TARGET_ROOTFS_UBIFS_LZMA
 	help
 	  Do compress the ubifs filesystem with lzma.
 
+config BR2_TARGET_ROOTFS_UBIFS_LZO
+	bool "lzo"
+	help
+	  Do compress the ubifs filesystem with lzop.
+
+config BR2_TARGET_ROOTFS_UBIFS_XZ
+	bool "xz"
+	help
+	  Do compress the ubifs filesystem with xz.
+
 endchoice
 
 config BR2_TARGET_ROOTFS_UBI
-- 
1.7.12.4
