From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 20 Jun 2016 15:47:39 -0400
Subject: [Buildroot] [PATCH 1/1] libarchive: bump to version 3.2.0
Message-ID: <1466452059-24280-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The CVE patch is now included in this release.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/libarchive/0001-fix-CVE-2016-1541.patch | 71 -------------------------
 package/libarchive/libarchive.hash              |  2 +-
 package/libarchive/libarchive.mk                |  2 +-
 3 files changed, 2 insertions(+), 73 deletions(-)
 delete mode 100644 package/libarchive/0001-fix-CVE-2016-1541.patch

diff --git a/package/libarchive/0001-fix-CVE-2016-1541.patch b/package/libarchive/0001-fix-CVE-2016-1541.patch
deleted file mode 100644
index ef2448c..0000000
--- a/package/libarchive/0001-fix-CVE-2016-1541.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From d0331e8e5b05b475f20b1f3101fe1ad772d7e7e7 Mon Sep 17 00:00:00 2001
-From: Tim Kientzle <kientzle@acm.org>
-Date: Sun, 24 Apr 2016 17:13:45 -0700
-Subject: [PATCH] Issue #656:  Fix CVE-2016-1541, VU#862384
-
-When reading OS X metadata entries in Zip archives that were stored
-without compression, libarchive would use the uncompressed entry size
-to allocate a buffer but would use the compressed entry size to limit
-the amount of data copied into that buffer.  Since the compressed
-and uncompressed sizes are provided by data in the archive itself,
-an attacker could manipulate these values to write data beyond
-the end of the allocated buffer.
-
-This fix provides three new checks to guard against such
-manipulation and to make libarchive generally more robust when
-handling this type of entry:
- 1. If an OS X metadata entry is stored without compression,
-    abort the entire archive if the compressed and uncompressed
-    data sizes do not match.
- 2. When sanity-checking the size of an OS X metadata entry,
-    abort this entry if either the compressed or uncompressed
-    size is larger than 4MB.
- 3. When copying data into the allocated buffer, check the copy
-    size against both the compressed entry size and uncompressed
-    entry size.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-Status: from upstream https://github.com/libarchive/libarchive/issues/656
-
- libarchive/archive_read_support_format_zip.c | 13 +++++++++++++
- 1 file changed, 13 insertions(+)
-
-diff --git a/libarchive/archive_read_support_format_zip.c b/libarchive/archive_read_support_format_zip.c
-index 0f8262c..0a0be96 100644
---- a/libarchive/archive_read_support_format_zip.c
-+++ b/libarchive/archive_read_support_format_zip.c
-@@ -2778,6 +2778,11 @@ zip_read_mac_metadata(struct archive_read *a, struct archive_entry *entry,
- 
- 	switch(rsrc->compression) {
- 	case 0:  /* No compression. */
-+		if (rsrc->uncompressed_size != rsrc->compressed_size) {
-+			archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
-+			    "Malformed OS X metadata entry: inconsistent size");
-+			return (ARCHIVE_FATAL);
-+		}
- #ifdef HAVE_ZLIB_H
- 	case 8: /* Deflate compression. */
- #endif
-@@ -2798,6 +2803,12 @@ zip_read_mac_metadata(struct archive_read *a, struct archive_entry *entry,
- 		    (intmax_t)rsrc->uncompressed_size);
- 		return (ARCHIVE_WARN);
- 	}
-+	if (rsrc->compressed_size > (4 * 1024 * 1024)) {
-+		archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
-+		    "Mac metadata is too large: %jd > 4M bytes",
-+		    (intmax_t)rsrc->compressed_size);
-+		return (ARCHIVE_WARN);
-+	}
- 
- 	metadata = malloc((size_t)rsrc->uncompressed_size);
- 	if (metadata == NULL) {
-@@ -2836,6 +2847,8 @@ zip_read_mac_metadata(struct archive_read *a, struct archive_entry *entry,
- 			bytes_avail = remaining_bytes;
- 		switch(rsrc->compression) {
- 		case 0:  /* No compression. */
-+			if ((size_t)bytes_avail > metadata_bytes)
-+				bytes_avail = metadata_bytes;
- 			memcpy(mp, p, bytes_avail);
- 			bytes_used = (size_t)bytes_avail;
- 			metadata_bytes -= bytes_used;
diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index 5f96211..6a782c6 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  eb87eacd8fe49e8d90c8fdc189813023ccc319c5e752b01fb6ad0cc7b2c53d5e  libarchive-3.1.2.tar.gz
+sha256  7bce45fd71ff01dc20d19edd78322d4965583d81b8bed8e26cacb65d6f5baa87  libarchive-3.2.0.tar.gz
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index e20a737..0e1e517 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.1.2
+LIBARCHIVE_VERSION = 3.2.0
 LIBARCHIVE_SITE = http://www.libarchive.org/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
 LIBARCHIVE_LICENSE = BSD-2c, BSD-3c
-- 
2.5.0
