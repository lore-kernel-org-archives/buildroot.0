From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Jan 2013 19:55:43 -0300
Subject: [Buildroot] [PATCH 3/3] initramfs: add support for LZO and XZ
	compression methods
In-Reply-To: <1358808943-17063-1-git-send-email-gustavo@zacarias.com.ar>
References: <1358808943-17063-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1358808943-17063-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 fs/common.mk      |  8 +++++++-
 fs/cpio/Config.in | 18 ++++++++++++++----
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 8b5b2f2..0c171fc 100644
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
+	$$(XZ) -9 -c $$@ > $$@.xz
+endif
 
 rootfs-$(1)-show-depends:
 	@echo $$(ROOTFS_$(2)_DEPENDENCIES)
diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
index 0669a44..d9e1733 100644
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
+	  Do compress the cpio filesystem with lzo.
+
+config BR2_TARGET_ROOTFS_CPIO_XZ
+	bool "xz"
+	help
+	  Do compress the cpio filesystem with xz.
 
 endchoice
 
-- 
1.7.12.4
