From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Dec 2018 00:11:36 +0100
Subject: [Buildroot] [git commit] squashfs: do not force gzip support if
 lz4/xz/zstd is selected
Message-ID: <20181207230830.4BEDA8B452@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84aeb4419f394b2eb11a22a962bc20e05b311b5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The logic to ensure at least one compression backend is selected was not
updated when lz4, xz and zstd were introduced -  Fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
[Peter: add comment as suggested by Peter Seiderer]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squashfs/Config.in | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/squashfs/Config.in b/package/squashfs/Config.in
index c16ebbf27f..f5ae5d9bec 100644
--- a/package/squashfs/Config.in
+++ b/package/squashfs/Config.in
@@ -2,7 +2,13 @@ config BR2_PACKAGE_SQUASHFS
 	bool "squashfs"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_SQUASHFS_GZIP if !(BR2_PACKAGE_SQUASHFS_LZMA || BR2_PACKAGE_SQUASHFS_LZO)
+	# ensure at least on compression backend (defaults to gzip)
+	select BR2_PACKAGE_SQUASHFS_GZIP if !( \
+	       BR2_PACKAGE_SQUASHFS_LZ4 || \
+	       BR2_PACKAGE_SQUASHFS_LZMA || \
+	       BR2_PACKAGE_SQUASHFS_LZO || \
+	       BR2_PACKAGE_SQUASHFS_XZ || \
+	       BR2_PACKAGE_SQUASHFS_ZSTD)
 	help
 	  Tools to generate SquashFS filesystems.
 
