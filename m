From: Heiko Stuebner <heiko@sntech.de>
Date: Fri, 12 Jun 2020 15:32:49 +0200
Subject: [Buildroot] [PATCH] fs: squashfs: Add config option to pass
 mksquashfs cmdln paramters.
Message-ID: <20200612133249.4127906-1-heiko@sntech.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Christoph Muellner <christoph.muellner@theobroma-systems.com>

This can be use to specify additional command line argument to
mksquashfs (e.g. -nopad). The implementation is inspired by
a similar mechanism for ext file system images.

Signed-off-by: Christoph Muellner <christoph.muellner@theobroma-systems.com>
Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
---
 fs/squashfs/Config.in   | 11 +++++++++++
 fs/squashfs/squashfs.mk |  8 +++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
index dde2097cb7..789b2cd24a 100644
--- a/fs/squashfs/Config.in
+++ b/fs/squashfs/Config.in
@@ -5,6 +5,16 @@ config BR2_TARGET_ROOTFS_SQUASHFS
 
 if BR2_TARGET_ROOTFS_SQUASHFS
 
+config BR2_TARGET_ROOTFS_SQUASHFS_MKFS_OPTIONS
+	string "additional mksquashfs options"
+	default ""
+	help
+	  Specify a space-separated list of mksquashfs options, including
+	  any squashfs filesystem features.
+
+	  For more information about the mke2fs options, see the manual
+	  page mksquashfs(1).
+
 choice
 	prompt "Compression algorithm"
 	default BR2_TARGET_ROOTFS_SQUASHFS4_GZIP
@@ -31,4 +41,5 @@ config BR2_TARGET_ROOTFS_SQUASHFS4_ZSTD
 	bool "zstd"
 
 endchoice
+
 endif
diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index 34ab048603..4bc6b338b0 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -6,7 +6,13 @@
 
 ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs
 
-ROOTFS_SQUASHFS_ARGS = -noappend -processors $(PARALLEL_JOBS)
+SQUASHFS_MKFS_OPTS = $(call qstrip,$(BR2_TARGET_ROOTFS_SQUASHFS_MKFS_OPTIONS))
+
+ROOTFS_SQUASHFS_ARGS = \
+	-noappend \
+	-processors \
+	$(PARALLEL_JOBS) \
+	$(SQUASHFS_MKFS_OPTS)
 
 ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZ4),y)
 ROOTFS_SQUASHFS_ARGS += -comp lz4 -Xhc
-- 
2.26.2
