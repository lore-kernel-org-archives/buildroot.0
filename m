From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 May 2016 14:55:43 -0300
Subject: [Buildroot] [PATCH] libarchive: add security patch for CVE-2016-1541
Message-ID: <1462989343-9459-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2016-1541 - heap-based buffer overflow vulnerability in the
zip_read_mac_metadata function in libarchive, a multi-format archive and
compression library, which may lead to the execution of arbitrary code
if a user or automated system is tricked into processing a specially
crafted ZIP file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libarchive/0001-fix-CVE-2016-1541.patch | 71 +++++++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 package/libarchive/0001-fix-CVE-2016-1541.patch

diff --git a/package/libarchive/0001-fix-CVE-2016-1541.patch b/package/libarchive/0001-fix-CVE-2016-1541.patch
new file mode 100644
index 0000000..ef2448c
--- /dev/null
+++ b/package/libarchive/0001-fix-CVE-2016-1541.patch
@@ -0,0 +1,71 @@
+From d0331e8e5b05b475f20b1f3101fe1ad772d7e7e7 Mon Sep 17 00:00:00 2001
+From: Tim Kientzle <kientzle@acm.org>
+Date: Sun, 24 Apr 2016 17:13:45 -0700
+Subject: [PATCH] Issue #656:  Fix CVE-2016-1541, VU#862384
+
+When reading OS X metadata entries in Zip archives that were stored
+without compression, libarchive would use the uncompressed entry size
+to allocate a buffer but would use the compressed entry size to limit
+the amount of data copied into that buffer.  Since the compressed
+and uncompressed sizes are provided by data in the archive itself,
+an attacker could manipulate these values to write data beyond
+the end of the allocated buffer.
+
+This fix provides three new checks to guard against such
+manipulation and to make libarchive generally more robust when
+handling this type of entry:
+ 1. If an OS X metadata entry is stored without compression,
+    abort the entire archive if the compressed and uncompressed
+    data sizes do not match.
+ 2. When sanity-checking the size of an OS X metadata entry,
+    abort this entry if either the compressed or uncompressed
+    size is larger than 4MB.
+ 3. When copying data into the allocated buffer, check the copy
+    size against both the compressed entry size and uncompressed
+    entry size.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+Status: from upstream https://github.com/libarchive/libarchive/issues/656
+
+ libarchive/archive_read_support_format_zip.c | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/libarchive/archive_read_support_format_zip.c b/libarchive/archive_read_support_format_zip.c
+index 0f8262c..0a0be96 100644
+--- a/libarchive/archive_read_support_format_zip.c
++++ b/libarchive/archive_read_support_format_zip.c
+@@ -2778,6 +2778,11 @@ zip_read_mac_metadata(struct archive_read *a, struct archive_entry *entry,
+ 
+ 	switch(rsrc->compression) {
+ 	case 0:  /* No compression. */
++		if (rsrc->uncompressed_size != rsrc->compressed_size) {
++			archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
++			    "Malformed OS X metadata entry: inconsistent size");
++			return (ARCHIVE_FATAL);
++		}
+ #ifdef HAVE_ZLIB_H
+ 	case 8: /* Deflate compression. */
+ #endif
+@@ -2798,6 +2803,12 @@ zip_read_mac_metadata(struct archive_read *a, struct archive_entry *entry,
+ 		    (intmax_t)rsrc->uncompressed_size);
+ 		return (ARCHIVE_WARN);
+ 	}
++	if (rsrc->compressed_size > (4 * 1024 * 1024)) {
++		archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
++		    "Mac metadata is too large: %jd > 4M bytes",
++		    (intmax_t)rsrc->compressed_size);
++		return (ARCHIVE_WARN);
++	}
+ 
+ 	metadata = malloc((size_t)rsrc->uncompressed_size);
+ 	if (metadata == NULL) {
+@@ -2836,6 +2847,8 @@ zip_read_mac_metadata(struct archive_read *a, struct archive_entry *entry,
+ 			bytes_avail = remaining_bytes;
+ 		switch(rsrc->compression) {
+ 		case 0:  /* No compression. */
++			if ((size_t)bytes_avail > metadata_bytes)
++				bytes_avail = metadata_bytes;
+ 			memcpy(mp, p, bytes_avail);
+ 			bytes_used = (size_t)bytes_avail;
+ 			metadata_bytes -= bytes_used;
-- 
2.7.3
