From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  7 Dec 2018 14:13:55 +0100
Subject: [Buildroot] [PATCH] squashfs: do not force gzip support if
 lz4/xz/zstd is selected
Message-ID: <20181207131356.14366-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The logic to ensure at least one compression backend is selected was not
updated when lz4, xz and zstd were introduced -  Fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squashfs/Config.in | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/squashfs/Config.in b/package/squashfs/Config.in
index c16ebbf27f..fdd8833060 100644
--- a/package/squashfs/Config.in
+++ b/package/squashfs/Config.in
@@ -2,7 +2,12 @@ config BR2_PACKAGE_SQUASHFS
 	bool "squashfs"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_SQUASHFS_GZIP if !(BR2_PACKAGE_SQUASHFS_LZMA || BR2_PACKAGE_SQUASHFS_LZO)
+	select BR2_PACKAGE_SQUASHFS_GZIP if !( \
+	       BR2_PACKAGE_SQUASHFS_LZ4 || \
+	       BR2_PACKAGE_SQUASHFS_LZMA || \
+	       BR2_PACKAGE_SQUASHFS_LZO || \
+	       BR2_PACKAGE_SQUASHFS_XZ || \
+	       BR2_PACKAGE_SQUASHFS_ZSTD)
 	help
 	  Tools to generate SquashFS filesystems.
 
-- 
2.11.0
