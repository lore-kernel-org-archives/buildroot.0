From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Jun 2020 23:01:23 +0200
Subject: [Buildroot] [git commit] fs: squashfs: Add config option to pass
 nopad parameter to mksquashfs
Message-ID: <20200617205953.561EC83DAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c57c1952f0528e8e738eaebb0f25bfd69fabbd6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an option to enable/disable padding to a multiple of 4k. Padding is
the default as it also was the past default behaviour.

Signed-off-by: Christoph Muellner <christoph.muellner@theobroma-systems.com>
Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 fs/squashfs/Config.in   | 8 ++++++++
 fs/squashfs/squashfs.mk | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
index dde2097cb7..70d4a20cf0 100644
--- a/fs/squashfs/Config.in
+++ b/fs/squashfs/Config.in
@@ -5,6 +5,13 @@ config BR2_TARGET_ROOTFS_SQUASHFS
 
 if BR2_TARGET_ROOTFS_SQUASHFS
 
+config BR2_TARGET_ROOTFS_SQUASHFS_PAD
+	bool "pad to a 4K boundary"
+	default y # legacy was always ON
+	help
+	  Say 'y' here (the default) to pad the the filesystem image
+	  to a 4K boundary. Say 'n' to disable padding.
+
 choice
 	prompt "Compression algorithm"
 	default BR2_TARGET_ROOTFS_SQUASHFS4_GZIP
@@ -31,4 +38,5 @@ config BR2_TARGET_ROOTFS_SQUASHFS4_ZSTD
 	bool "zstd"
 
 endchoice
+
 endif
diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index 34ab048603..7a5e3e313e 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -8,6 +8,10 @@ ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs
 
 ROOTFS_SQUASHFS_ARGS = -noappend -processors $(PARALLEL_JOBS)
 
+ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS_PAD),)
+ROOTFS_SQUASHFS_ARGS += -nopad
+endif
+
 ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZ4),y)
 ROOTFS_SQUASHFS_ARGS += -comp lz4 -Xhc
 else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZO),y)
