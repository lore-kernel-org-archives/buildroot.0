From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  5 Jul 2019 07:32:13 +0300
Subject: [Buildroot] [PATCH 2/3] package/libarchive: bump to version 3.4.0
In-Reply-To: <42ce7221ac70a831016205e8111c2cb313403054.1562301134.git.baruch@tkos.co.il>
References: <42ce7221ac70a831016205e8111c2cb313403054.1562301134.git.baruch@tkos.co.il>
Message-ID: <d13046b53516c329868d4a37907fcfea04516456.1562301134.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use a mirror download site.
https://github.com/libarchive/libarchive/issues/1216

Drop upstream patches.

Mention additional licenses for new RARv5 code. Update license file
hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...ree-when-a-window-size-of-0-is-speci.patch | 40 ---------
 ...cross-multi-part-archives-must-match.patch | 81 -------------------
 .../0003-Skip-0-length-ACL-fields.patch       | 52 ------------
 .../0004-warc-consume-data-once-read.patch    | 46 -----------
 ...n-expected-Rockridge-extensions-is-m.patch | 62 --------------
 ...-crash-when-parsing-certain-archives.patch | 62 --------------
 package/libarchive/libarchive.hash            |  6 +-
 package/libarchive/libarchive.mk              |  6 +-
 8 files changed, 6 insertions(+), 349 deletions(-)
 delete mode 100644 package/libarchive/0001-Avoid-a-double-free-when-a-window-size-of-0-is-speci.patch
 delete mode 100644 package/libarchive/0002-rar-file-split-across-multi-part-archives-must-match.patch
 delete mode 100644 package/libarchive/0003-Skip-0-length-ACL-fields.patch
 delete mode 100644 package/libarchive/0004-warc-consume-data-once-read.patch
 delete mode 100644 package/libarchive/0005-iso9660-Fail-when-expected-Rockridge-extensions-is-m.patch
 delete mode 100644 package/libarchive/0006-7zip-fix-crash-when-parsing-certain-archives.patch

diff --git a/package/libarchive/0001-Avoid-a-double-free-when-a-window-size-of-0-is-speci.patch b/package/libarchive/0001-Avoid-a-double-free-when-a-window-size-of-0-is-speci.patch
deleted file mode 100644
index 76096f7a45f0..000000000000
--- a/package/libarchive/0001-Avoid-a-double-free-when-a-window-size-of-0-is-speci.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 021efa522ad729ff0f5806c4ce53e4a6cc1daa31 Mon Sep 17 00:00:00 2001
-From: Daniel Axtens <dja@axtens.net>
-Date: Tue, 20 Nov 2018 17:56:29 +1100
-Subject: [PATCH] Avoid a double-free when a window size of 0 is specified
-
-new_size can be 0 with a malicious or corrupted RAR archive.
-
-realloc(area, 0) is equivalent to free(area), so the region would
-be free()d here and the free()d again in the cleanup function.
-
-Found with a setup running AFL, afl-rb, and qsym.
----
- libarchive/archive_read_support_format_rar.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-[for import into Buildroot]
-Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
-Upstream-status: backport
-
-CVE-2018-1000877
-
-diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
-index 23452222..6f419c27 100644
---- a/libarchive/archive_read_support_format_rar.c
-+++ b/libarchive/archive_read_support_format_rar.c
-@@ -2300,6 +2300,11 @@ parse_codes(struct archive_read *a)
-       new_size = DICTIONARY_MAX_SIZE;
-     else
-       new_size = rar_fls((unsigned int)rar->unp_size) << 1;
-+    if (new_size == 0) {
-+      archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
-+                        "Zero window size is invalid.");
-+      return (ARCHIVE_FATAL);
-+    }
-     new_window = realloc(rar->lzss.window, new_size);
-     if (new_window == NULL) {
-       archive_set_error(&a->archive, ENOMEM,
--- 
-2.19.2
-
diff --git a/package/libarchive/0002-rar-file-split-across-multi-part-archives-must-match.patch b/package/libarchive/0002-rar-file-split-across-multi-part-archives-must-match.patch
deleted file mode 100644
index 4bf68d61d329..000000000000
--- a/package/libarchive/0002-rar-file-split-across-multi-part-archives-must-match.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From bfcfe6f04ed20db2504db8a254d1f40a1d84eb28 Mon Sep 17 00:00:00 2001
-From: Daniel Axtens <dja@axtens.net>
-Date: Tue, 4 Dec 2018 00:55:22 +1100
-Subject: [PATCH] rar: file split across multi-part archives must match
-
-Fuzzing uncovered some UAF and memory overrun bugs where a file in a
-single file archive reported that it was split across multiple
-volumes. This was caused by ppmd7 operations calling
-rar_br_fillup. This would invoke rar_read_ahead, which would in some
-situations invoke archive_read_format_rar_read_header.  That would
-check the new file name against the old file name, and if they didn't
-match up it would free the ppmd7 buffer and allocate a new
-one. However, because the ppmd7 decoder wasn't actually done with the
-buffer, it would continue to used the freed buffer. Both reads and
-writes to the freed region can be observed.
-
-This is quite tricky to solve: once the buffer has been freed it is
-too late, as the ppmd7 decoder functions almost universally assume
-success - there's no way for ppmd_read to signal error, nor are there
-good ways for functions like Range_Normalise to propagate them. So we
-can't detect after the fact that we're in an invalid state - e.g. by
-checking rar->cursor, we have to prevent ourselves from ever ending up
-there. So, when we are in the dangerous part or rar_read_ahead that
-assumes a valid split, we set a flag force read_header to either go
-down the path for split files or bail. This means that the ppmd7
-decoder keeps a valid buffer and just runs out of data.
-
-Found with a combination of AFL, afl-rb and qsym.
----
- libarchive/archive_read_support_format_rar.c | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-[for import into Buildroot]
-Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
-Upstream-status: backport
-
-CVE-2018-1000878
-
-diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
-index 6f419c27..a8cc5c94 100644
---- a/libarchive/archive_read_support_format_rar.c
-+++ b/libarchive/archive_read_support_format_rar.c
-@@ -258,6 +258,7 @@ struct rar
-   struct data_block_offsets *dbo;
-   unsigned int cursor;
-   unsigned int nodes;
-+  char filename_must_match;
- 
-   /* LZSS members */
-   struct huffman_code maincode;
-@@ -1560,6 +1561,12 @@ read_header(struct archive_read *a, struct archive_entry *entry,
-     }
-     return ret;
-   }
-+  else if (rar->filename_must_match)
-+  {
-+    archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
-+      "Mismatch of file parts split across multi-volume archive");
-+    return (ARCHIVE_FATAL);
-+  }
- 
-   rar->filename_save = (char*)realloc(rar->filename_save,
-                                       filename_size + 1);
-@@ -2933,12 +2940,14 @@ rar_read_ahead(struct archive_read *a, size_t min, ssize_t *avail)
-     else if (*avail == 0 && rar->main_flags & MHD_VOLUME &&
-       rar->file_flags & FHD_SPLIT_AFTER)
-     {
-+      rar->filename_must_match = 1;
-       ret = archive_read_format_rar_read_header(a, a->entry);
-       if (ret == (ARCHIVE_EOF))
-       {
-         rar->has_endarc_header = 1;
-         ret = archive_read_format_rar_read_header(a, a->entry);
-       }
-+      rar->filename_must_match = 0;
-       if (ret != (ARCHIVE_OK))
-         return NULL;
-       return rar_read_ahead(a, min, avail);
--- 
-2.19.2
-
diff --git a/package/libarchive/0003-Skip-0-length-ACL-fields.patch b/package/libarchive/0003-Skip-0-length-ACL-fields.patch
deleted file mode 100644
index 796bfbdeb67c..000000000000
--- a/package/libarchive/0003-Skip-0-length-ACL-fields.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 15bf44fd2c1ad0e3fd87048b3fcc90c4dcff1175 Mon Sep 17 00:00:00 2001
-From: Daniel Axtens <dja@axtens.net>
-Date: Tue, 4 Dec 2018 14:29:42 +1100
-Subject: [PATCH] Skip 0-length ACL fields
-
-Currently, it is possible to create an archive that crashes bsdtar
-with a malformed ACL:
-
-Program received signal SIGSEGV, Segmentation fault.
-archive_acl_from_text_l (acl=<optimised out>, text=0x7e2e92 "", want_type=<optimised out>, sc=<optimised out>) at libarchive/archive_acl.c:1726
-1726				switch (*s) {
-(gdb) p n
-$1 = 1
-(gdb) p field[n]
-$2 = {start = 0x0, end = 0x0}
-
-Stop this by checking that the length is not zero before beginning
-the switch statement.
-
-I am pretty sure this is the bug mentioned in the qsym paper [1],
-and I was able to replicate it with a qsym + AFL + afl-rb setup.
-
-[1] https://www.usenix.org/conference/usenixsecurity18/presentation/yun
----
- libarchive/archive_acl.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-[for import into Buildroot]
-Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
-Upstream-status: backport
-
-CVE-2018-1000879
-
-diff --git a/libarchive/archive_acl.c b/libarchive/archive_acl.c
-index 512beee1..7beeee86 100644
---- a/libarchive/archive_acl.c
-+++ b/libarchive/archive_acl.c
-@@ -1723,6 +1723,11 @@ archive_acl_from_text_l(struct archive_acl *acl, const char *text,
- 			st = field[n].start + 1;
- 			len = field[n].end - field[n].start;
- 
-+			if (len == 0) {
-+				ret = ARCHIVE_WARN;
-+				continue;
-+			}
-+
- 			switch (*s) {
- 			case 'u':
- 				if (len == 1 || (len == 4
--- 
-2.19.2
-
diff --git a/package/libarchive/0004-warc-consume-data-once-read.patch b/package/libarchive/0004-warc-consume-data-once-read.patch
deleted file mode 100644
index f07d6c08ca16..000000000000
--- a/package/libarchive/0004-warc-consume-data-once-read.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 9c84b7426660c09c18cc349f6d70b5f8168b5680 Mon Sep 17 00:00:00 2001
-From: Daniel Axtens <dja@axtens.net>
-Date: Tue, 4 Dec 2018 16:33:42 +1100
-Subject: [PATCH] warc: consume data once read
-
-The warc decoder only used read ahead, it wouldn't actually consume
-data that had previously been printed. This means that if you specify
-an invalid content length, it will just reprint the same data over
-and over and over again until it hits the desired length.
-
-This means that a WARC resource with e.g.
-Content-Length: 666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666665
-but only a few hundred bytes of data, causes a quasi-infinite loop.
-
-Consume data in subsequent calls to _warc_read.
-
-Found with an AFL + afl-rb + qsym setup.
----
- libarchive/archive_read_support_format_warc.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-[for import into Buildroot]
-Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
-Upstream-status: backport
-
-CVE-2018-1000880
-
-diff --git a/libarchive/archive_read_support_format_warc.c b/libarchive/archive_read_support_format_warc.c
-index e8753853..e8fc8428 100644
---- a/libarchive/archive_read_support_format_warc.c
-+++ b/libarchive/archive_read_support_format_warc.c
-@@ -386,6 +386,11 @@ _warc_read(struct archive_read *a, const void **buf, size_t *bsz, int64_t *off)
- 		return (ARCHIVE_EOF);
- 	}
- 
-+	if (w->unconsumed) {
-+		__archive_read_consume(a, w->unconsumed);
-+		w->unconsumed = 0U;
-+	}
-+
- 	rab = __archive_read_ahead(a, 1U, &nrd);
- 	if (nrd < 0) {
- 		*bsz = 0U;
--- 
-2.19.2
-
diff --git a/package/libarchive/0005-iso9660-Fail-when-expected-Rockridge-extensions-is-m.patch b/package/libarchive/0005-iso9660-Fail-when-expected-Rockridge-extensions-is-m.patch
deleted file mode 100644
index bd36ce4b53a5..000000000000
--- a/package/libarchive/0005-iso9660-Fail-when-expected-Rockridge-extensions-is-m.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 8312eaa576014cd9b965012af51bc1f967b12423 Mon Sep 17 00:00:00 2001
-From: Daniel Axtens <dja@axtens.net>
-Date: Tue, 1 Jan 2019 17:10:49 +1100
-Subject: [PATCH] iso9660: Fail when expected Rockridge extensions is missing
-
-A corrupted or malicious ISO9660 image can cause read_CE() to loop
-forever.
-
-read_CE() calls parse_rockridge(), expecting a Rockridge extension
-to be read. However, parse_rockridge() is structured as a while
-loop starting with a sanity check, and if the sanity check fails
-before the loop has run, the function returns ARCHIVE_OK without
-advancing the position in the file. This causes read_CE() to retry
-indefinitely.
-
-Make parse_rockridge() return ARCHIVE_WARN if it didn't read an
-extension. As someone with no real knowledge of the format, this
-seems more apt than ARCHIVE_FATAL, but both the call-sites escalate
-it to a fatal error immediately anyway.
-
-Found with a combination of AFL, afl-rb (FairFuzz) and qsym.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 8312eaa57601
-
- libarchive/archive_read_support_format_iso9660.c | 11 ++++++++++-
- 1 file changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/libarchive/archive_read_support_format_iso9660.c b/libarchive/archive_read_support_format_iso9660.c
-index 28acfefbba8a..bad8f1dfef3a 100644
---- a/libarchive/archive_read_support_format_iso9660.c
-+++ b/libarchive/archive_read_support_format_iso9660.c
-@@ -2102,6 +2102,7 @@ parse_rockridge(struct archive_read *a, struct file_info *file,
-     const unsigned char *p, const unsigned char *end)
- {
- 	struct iso9660 *iso9660;
-+	int entry_seen = 0;
- 
- 	iso9660 = (struct iso9660 *)(a->format->data);
- 
-@@ -2257,8 +2258,16 @@ parse_rockridge(struct archive_read *a, struct file_info *file,
- 		}
- 
- 		p += p[2];
-+		entry_seen = 1;
-+	}
-+
-+	if (entry_seen)
-+		return (ARCHIVE_OK);
-+	else {
-+		archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
-+				  "Tried to parse Rockridge extensions, but none found");
-+		return (ARCHIVE_WARN);
- 	}
--	return (ARCHIVE_OK);
- }
- 
- static int
--- 
-2.20.1
-
diff --git a/package/libarchive/0006-7zip-fix-crash-when-parsing-certain-archives.patch b/package/libarchive/0006-7zip-fix-crash-when-parsing-certain-archives.patch
deleted file mode 100644
index bad33d9526ae..000000000000
--- a/package/libarchive/0006-7zip-fix-crash-when-parsing-certain-archives.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 65a23f5dbee4497064e9bb467f81138a62b0dae1 Mon Sep 17 00:00:00 2001
-From: Daniel Axtens <dja@axtens.net>
-Date: Tue, 1 Jan 2019 16:01:40 +1100
-Subject: [PATCH] 7zip: fix crash when parsing certain archives
-
-Fuzzing with CRCs disabled revealed that a call to get_uncompressed_data()
-would sometimes fail to return at least 'minimum' bytes. This can cause
-the crc32() invocation in header_bytes to read off into invalid memory.
-
-A specially crafted archive can use this to cause a crash.
-
-An ASAN trace is below, but ASAN is not required - an uninstrumented
-binary will also crash.
-
-==7719==ERROR: AddressSanitizer: SEGV on unknown address 0x631000040000 (pc 0x7fbdb3b3ec1d bp 0x7ffe77a51310 sp 0x7ffe77a51150 T0)
-==7719==The signal is caused by a READ memory access.
-    #0 0x7fbdb3b3ec1c in crc32_z (/lib/x86_64-linux-gnu/libz.so.1+0x2c1c)
-    #1 0x84f5eb in header_bytes (/tmp/libarchive/bsdtar+0x84f5eb)
-    #2 0x856156 in read_Header (/tmp/libarchive/bsdtar+0x856156)
-    #3 0x84e134 in slurp_central_directory (/tmp/libarchive/bsdtar+0x84e134)
-    #4 0x849690 in archive_read_format_7zip_read_header (/tmp/libarchive/bsdtar+0x849690)
-    #5 0x5713b7 in _archive_read_next_header2 (/tmp/libarchive/bsdtar+0x5713b7)
-    #6 0x570e63 in _archive_read_next_header (/tmp/libarchive/bsdtar+0x570e63)
-    #7 0x6f08bd in archive_read_next_header (/tmp/libarchive/bsdtar+0x6f08bd)
-    #8 0x52373f in read_archive (/tmp/libarchive/bsdtar+0x52373f)
-    #9 0x5257be in tar_mode_x (/tmp/libarchive/bsdtar+0x5257be)
-    #10 0x51daeb in main (/tmp/libarchive/bsdtar+0x51daeb)
-    #11 0x7fbdb27cab96 in __libc_start_main /build/glibc-OTsEL5/glibc-2.27/csu/../csu/libc-start.c:310
-    #12 0x41dd09 in _start (/tmp/libarchive/bsdtar+0x41dd09)
-
-This was primarly done with afl and FairFuzz. Some early corpus entries
-may have been generated by qsym.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 65a23f5dbee
-
- libarchive/archive_read_support_format_7zip.c | 8 +-------
- 1 file changed, 1 insertion(+), 7 deletions(-)
-
-diff --git a/libarchive/archive_read_support_format_7zip.c b/libarchive/archive_read_support_format_7zip.c
-index bccbf896603b..b6d1505d372e 100644
---- a/libarchive/archive_read_support_format_7zip.c
-+++ b/libarchive/archive_read_support_format_7zip.c
-@@ -2964,13 +2964,7 @@ get_uncompressed_data(struct archive_read *a, const void **buff, size_t size,
- 	if (zip->codec == _7Z_COPY && zip->codec2 == (unsigned long)-1) {
- 		/* Copy mode. */
- 
--		/*
--		 * Note: '1' here is a performance optimization.
--		 * Recall that the decompression layer returns a count of
--		 * available bytes; asking for more than that forces the
--		 * decompressor to combine reads by copying data.
--		 */
--		*buff = __archive_read_ahead(a, 1, &bytes_avail);
-+		*buff = __archive_read_ahead(a, minimum, &bytes_avail);
- 		if (bytes_avail <= 0) {
- 			archive_set_error(&a->archive,
- 			    ARCHIVE_ERRNO_FILE_FORMAT,
--- 
-2.20.1
-
diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index cde48c842366..04c577775313 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,4 +1,4 @@
-# From http://www.libarchive.org/downloads/libarchive-3.3.3.sha512.txt
-sha512	9d12b47d6976efa9f98e62c25d8b85fd745d4e9ca7b7e6d36bfe095dfe5c4db017d4e785d110f3758f5938dad6f1a1b009267fd7e82cb7212e93e1aea237bab7  libarchive-3.3.3.tar.gz
+# From https://www.libarchive.de/downloads/libarchive-3.4.0.tar.gz.sums.txt
+sha256  8643d50ed40c759f5412a3af4e353cffbce4fdf3b5cf321cb72cacf06b2d825e  libarchive-3.4.0.tar.gz
 # Locally computed:
-sha256  ae6f35cc1979beb316e4d6431fc34c6fc59f0dd126b425c8552bb41c86e4825d  COPYING
+sha256  e1e3d4ba9d0b0ccba333b5f5539f7c6c9a3ef3d57a96cd165d2c45eaa1cd026d  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index b7619b03dbbb..ccda18386fb7 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.3.3
-LIBARCHIVE_SITE = http://www.libarchive.org/downloads
+LIBARCHIVE_VERSION = 3.4.0
+LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
-LIBARCHIVE_LICENSE = BSD-2-Clause, BSD-3-Clause
+LIBARCHIVE_LICENSE = BSD-2-Clause, BSD-3-Clause, CC0-1.0, OpenSSL, Apache-2.0
 LIBARCHIVE_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDTAR),y)
-- 
2.20.1
