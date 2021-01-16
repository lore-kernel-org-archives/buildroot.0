From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 22:45:34 +0100
Subject: [Buildroot] [git commit] fs/cpio: add zstd as compression option
Message-ID: <20210116213246.46AE8874FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b717952074d213f5bcfdb87c905d92afb0949d11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

U-Boot mkimage zstd is available since v2020.10:
https://gitlab.denx.de/u-boot/u-boot/-/commit/26073f9ed3ab0aaf3c2a2b433fecb30a95a067d6

Signed-off-by: Jos?? Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 fs/common.mk      | 5 +++++
 fs/cpio/Config.in | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/fs/common.mk b/fs/common.mk
index 84e13d1b7e..afab7b50fb 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -154,6 +154,11 @@ ifeq ($(BR2_REPRODUCIBLE),)
 ROOTFS_$(2)_COMPRESS_CMD += -T $(PARALLEL_JOBS)
 endif
 endif
+ifeq ($(BR2_TARGET_ROOTFS_$(2)_ZSTD),y)
+ROOTFS_$(2)_DEPENDENCIES += host-zstd
+ROOTFS_$(2)_COMPRESS_EXT = .zst
+ROOTFS_$(2)_COMPRESS_CMD = zstd -19 -z -f -T$(PARALLEL_JOBS)
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
