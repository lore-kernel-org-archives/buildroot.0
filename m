From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?= <salvador.joseluis@gmail.com>
Date: Sun, 10 Jan 2021 20:05:59 +0100
Subject: [Buildroot] [PATCH v2] fs/cpio: add zstd as compression option
In-Reply-To: <20210110111217.GP3044608@scaer>
References: <20210110111217.GP3044608@scaer>
Message-ID: <20210110190559.1434055-1-salvador.joseluis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

U-Boot mkimage zstd is available since v2020.10:
https://gitlab.denx.de/u-boot/u-boot/-/commit/26073f9ed3ab0aaf3c2a2b433fecb30a95a067d6

Signed-off-by: Jos? Luis Salvador Rufo <salvador.joseluis@gmail.com>
---
 fs/common.mk      | 5 +++++
 fs/cpio/Config.in | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/fs/common.mk b/fs/common.mk
index 84e13d1b7e..da008ef9e8 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -154,6 +154,11 @@ ifeq ($(BR2_REPRODUCIBLE),)
 ROOTFS_$(2)_COMPRESS_CMD += -T $(PARALLEL_JOBS)
 endif
 endif
+ifeq ($(BR2_TARGET_ROOTFS_$(2)_ZSTD),y)
+ROOTFS_$(2)_DEPENDENCIES += host-zstd
+ROOTFS_$(2)_COMPRESS_EXT = .zst
+ROOTFS_$(2)_COMPRESS_CMD = zstd --ultra -22 -z -f -T$(PARALLEL_JOBS)
+endif
 
 $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): ROOTFS=$(2)
 $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): FAKEROOT_SCRIPT=$$(ROOTFS_$(2)_DIR)/fakeroot
diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
index 83a7fa5824..c1151a2881 100644
--- a/fs/cpio/Config.in
+++ b/fs/cpio/Config.in
@@ -51,6 +51,11 @@ config BR2_TARGET_ROOTFS_CPIO_XZ
 	help
 	  Do compress the cpio filesystem with xz.
 
+config BR2_TARGET_ROOTFS_CPIO_ZSTD
+	bool "zstd"
+	help
+	  Do compress the cpio filesystem with zstd.
+
 endchoice
 
 config BR2_TARGET_ROOTFS_CPIO_UIMAGE
-- 
2.30.0
