From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Aug 2018 16:19:28 +0200
Subject: [Buildroot] [git commit] libarchive: add upstream security patches
Message-ID: <20180808142437.A35B48B518@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=760fbe789c77571b2baf1ddbb3b10207ece7fd7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add patches for the following security issues:

CVE-2017-14501 - An out-of-bounds read flaw exists in parse_file_info in
archive_read_support_format_iso9660.c when extracting a specially
crafted iso9660 iso file.

CVE-2017-14502 - Off-by-one error for UTF-16 names in RAR archives,
leading to an out-of-bounds read in archive_read_format_rar_read_header.

CVE-2017-14503 - Out-of-bounds read within lha_read_data_none() in
archive_read_support_format_lha.c when extracting a specially crafted
lha archive.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-iso9660-validate-directory-record-length.patch | 78 ++++++++++++++++++++++
 ...d-off-by-one-error-for-UTF16-names-in-RAR.patch | 34 ++++++++++
 ...ct-LHA-archive-entries-with-negative-size.patch | 32 +++++++++
 3 files changed, 144 insertions(+)

diff --git a/package/libarchive/0002-iso9660-validate-directory-record-length.patch b/package/libarchive/0002-iso9660-validate-directory-record-length.patch
new file mode 100644
index 0000000000..8a0c34f257
--- /dev/null
+++ b/package/libarchive/0002-iso9660-validate-directory-record-length.patch
@@ -0,0 +1,78 @@
+From f9569c086ff29259c73790db9cbf39fe8fb9d862 Mon Sep 17 00:00:00 2001
+From: John Starks <jostarks@microsoft.com>
+Date: Wed, 25 Jul 2018 12:16:34 -0700
+Subject: [PATCH] iso9660: validate directory record length
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit f9569c086ff
+
+ .../archive_read_support_format_iso9660.c       | 17 +++++++++++------
+ 1 file changed, 11 insertions(+), 6 deletions(-)
+
+diff --git a/libarchive/archive_read_support_format_iso9660.c b/libarchive/archive_read_support_format_iso9660.c
+index f01d37bf682e..089bb7236cd1 100644
+--- a/libarchive/archive_read_support_format_iso9660.c
++++ b/libarchive/archive_read_support_format_iso9660.c
+@@ -409,7 +409,8 @@ static int	next_entry_seek(struct archive_read *, struct iso9660 *,
+ 		    struct file_info **);
+ static struct file_info *
+ 		parse_file_info(struct archive_read *a,
+-		    struct file_info *parent, const unsigned char *isodirrec);
++		    struct file_info *parent, const unsigned char *isodirrec,
++		    size_t reclen);
+ static int	parse_rockridge(struct archive_read *a,
+ 		    struct file_info *file, const unsigned char *start,
+ 		    const unsigned char *end);
+@@ -1022,7 +1023,7 @@ read_children(struct archive_read *a, struct file_info *parent)
+ 			if (*(p + DR_name_len_offset) == 1
+ 			    && *(p + DR_name_offset) == '\001')
+ 				continue;
+-			child = parse_file_info(a, parent, p);
++			child = parse_file_info(a, parent, p, b - p);
+ 			if (child == NULL) {
+ 				__archive_read_consume(a, skip_size);
+ 				return (ARCHIVE_FATAL);
+@@ -1112,7 +1113,7 @@ choose_volume(struct archive_read *a, struct iso9660 *iso9660)
+ 	 */
+ 	seenJoliet = iso9660->seenJoliet;/* Save flag. */
+ 	iso9660->seenJoliet = 0;
+-	file = parse_file_info(a, NULL, block);
++	file = parse_file_info(a, NULL, block, vd->size);
+ 	if (file == NULL)
+ 		return (ARCHIVE_FATAL);
+ 	iso9660->seenJoliet = seenJoliet;
+@@ -1144,7 +1145,7 @@ choose_volume(struct archive_read *a, struct iso9660 *iso9660)
+ 			return (ARCHIVE_FATAL);
+ 		}
+ 		iso9660->seenJoliet = 0;
+-		file = parse_file_info(a, NULL, block);
++		file = parse_file_info(a, NULL, block, vd->size);
+ 		if (file == NULL)
+ 			return (ARCHIVE_FATAL);
+ 		iso9660->seenJoliet = seenJoliet;
+@@ -1749,7 +1750,7 @@ archive_read_format_iso9660_cleanup(struct archive_read *a)
+  */
+ static struct file_info *
+ parse_file_info(struct archive_read *a, struct file_info *parent,
+-    const unsigned char *isodirrec)
++    const unsigned char *isodirrec, size_t reclen)
+ {
+ 	struct iso9660 *iso9660;
+ 	struct file_info *file, *filep;
+@@ -1763,7 +1764,11 @@ parse_file_info(struct archive_read *a, struct file_info *parent,
+ 
+ 	iso9660 = (struct iso9660 *)(a->format->data);
+ 
+-	dr_len = (size_t)isodirrec[DR_length_offset];
++	if (reclen == 0 || reclen < (dr_len = (size_t)isodirrec[DR_length_offset])) {
++		archive_set_error(&a->archive, ARCHIVE_ERRNO_MISC,
++			"Invalid directory record length");
++		return (NULL);
++	}
+ 	name_len = (size_t)isodirrec[DR_name_len_offset];
+ 	location = archive_le32dec(isodirrec + DR_extent_offset);
+ 	fsize = toi(isodirrec + DR_size_offset, DR_size_size);
+-- 
+2.18.0
+
diff --git a/package/libarchive/0003-Avoid-a-read-off-by-one-error-for-UTF16-names-in-RAR.patch b/package/libarchive/0003-Avoid-a-read-off-by-one-error-for-UTF16-names-in-RAR.patch
new file mode 100644
index 0000000000..13a80d1fb3
--- /dev/null
+++ b/package/libarchive/0003-Avoid-a-read-off-by-one-error-for-UTF16-names-in-RAR.patch
@@ -0,0 +1,34 @@
+From 5562545b5562f6d12a4ef991fae158bf4ccf92b6 Mon Sep 17 00:00:00 2001
+From: Joerg Sonnenberger <joerg@bec.de>
+Date: Sat, 9 Sep 2017 17:47:32 +0200
+Subject: [PATCH] Avoid a read off-by-one error for UTF16 names in RAR
+ archives.
+
+Reported-By: OSS-Fuzz issue 573
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 5562545b5562
+
+ libarchive/archive_read_support_format_rar.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
+index cbb14c32dc3b..751de6979ba5 100644
+--- a/libarchive/archive_read_support_format_rar.c
++++ b/libarchive/archive_read_support_format_rar.c
+@@ -1496,7 +1496,11 @@ read_header(struct archive_read *a, struct archive_entry *entry,
+         return (ARCHIVE_FATAL);
+       }
+       filename[filename_size++] = '\0';
+-      filename[filename_size++] = '\0';
++      /*
++       * Do not increment filename_size here as the computations below
++       * add the space for the terminating NUL explicitly.
++       */
++      filename[filename_size] = '\0';
+ 
+       /* Decoded unicode form is UTF-16BE, so we have to update a string
+        * conversion object for it. */
+-- 
+2.18.0
+
diff --git a/package/libarchive/0004-Reject-LHA-archive-entries-with-negative-size.patch b/package/libarchive/0004-Reject-LHA-archive-entries-with-negative-size.patch
new file mode 100644
index 0000000000..628e74aed4
--- /dev/null
+++ b/package/libarchive/0004-Reject-LHA-archive-entries-with-negative-size.patch
@@ -0,0 +1,32 @@
+From 2c8c83b9731ff822fad6cc8c670ea5519c366a14 Mon Sep 17 00:00:00 2001
+From: Joerg Sonnenberger <joerg@bec.de>
+Date: Thu, 19 Jul 2018 21:14:53 +0200
+Subject: [PATCH] Reject LHA archive entries with negative size.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 2c8c83b9731
+
+ libarchive/archive_read_support_format_lha.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/libarchive/archive_read_support_format_lha.c b/libarchive/archive_read_support_format_lha.c
+index b8ef4ae10ece..95c99bb1f31e 100644
+--- a/libarchive/archive_read_support_format_lha.c
++++ b/libarchive/archive_read_support_format_lha.c
+@@ -701,6 +701,12 @@ archive_read_format_lha_read_header(struct archive_read *a,
+ 	 * Prepare variables used to read a file content.
+ 	 */
+ 	lha->entry_bytes_remaining = lha->compsize;
++	if (lha->entry_bytes_remaining < 0) {
++		archive_set_error(&a->archive,
++		    ARCHIVE_ERRNO_FILE_FORMAT,
++		    "Invalid LHa entry size");
++		return (ARCHIVE_FATAL);
++	}
+ 	lha->entry_offset = 0;
+ 	lha->entry_crc_calculated = 0;
+ 
+-- 
+2.18.0
+
