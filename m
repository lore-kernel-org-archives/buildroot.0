From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Mon,  6 Jan 2020 20:56:37 +0100
Subject: [Buildroot] [PATCH] package/libarchive: security bump to version
 3.4.1
Message-ID: <1578340597-31153-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security vulnerabilities:

- CVE-2019-19221: In Libarchive 3.4.0, archive_wstring_append_from_mbs in archive_string.c
 has an out-of-bounds read because of an incorrect mbrtowc or mbtowc call. For example,
 bsdtar crashes via a crafted archive.

And adds various security fixes.  For details, see :

https://github.com/libarchive/libarchive/releases/tag/v3.4.1

Also remove upstreamed patch.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
v1 -> v2 :
	- update commit title "libarchive to package/libarchive"

 .../0001-Unbreak-compilation-without-zlib.patch    | 167 ---------------------
 package/libarchive/libarchive.hash                 |   4 +-
 package/libarchive/libarchive.mk                   |   2 +-
 3 files changed, 3 insertions(+), 170 deletions(-)
 delete mode 100644 package/libarchive/0001-Unbreak-compilation-without-zlib.patch

diff --git a/package/libarchive/0001-Unbreak-compilation-without-zlib.patch b/package/libarchive/0001-Unbreak-compilation-without-zlib.patch
deleted file mode 100644
index b4da520..0000000
--- a/package/libarchive/0001-Unbreak-compilation-without-zlib.patch
+++ /dev/null
@@ -1,167 +0,0 @@
-From 64333cef68d7bcc67bef6ecf177fbeaa549b9139 Mon Sep 17 00:00:00 2001
-From: Martin Matuska <martin@matuska.org>
-Date: Sat, 29 Jun 2019 00:20:58 +0200
-Subject: [PATCH] Unbreak compilation without zlib
-
-Fixes #1214
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 64333cef68d7
-
- libarchive/archive_read_support_filter_gzip.c | 54 ++++++++++++-------
- libarchive/test/test_read_format_raw.c        |  4 ++
- 2 files changed, 39 insertions(+), 19 deletions(-)
-
-diff --git a/libarchive/archive_read_support_filter_gzip.c b/libarchive/archive_read_support_filter_gzip.c
-index 458b6f729164..9fa9e2b0ddb8 100644
---- a/libarchive/archive_read_support_filter_gzip.c
-+++ b/libarchive/archive_read_support_filter_gzip.c
-@@ -131,12 +131,20 @@ archive_read_support_filter_gzip(struct archive *_a)
-  */
- static ssize_t
- peek_at_header(struct archive_read_filter *filter, int *pbits,
--	       struct private_data *state)
-+#ifdef HAVE_ZLIB_H
-+	       struct private_data *state
-+#else
-+	       void *state
-+#endif
-+	      )
- {
- 	const unsigned char *p;
- 	ssize_t avail, len;
- 	int bits = 0;
- 	int header_flags;
-+#ifndef HAVE_ZLIB_H
-+	(void)state; /* UNUSED */
-+#endif
- 
- 	/* Start by looking at the first ten bytes of the header, which
- 	 * is all fixed layout. */
-@@ -153,8 +161,10 @@ peek_at_header(struct archive_read_filter *filter, int *pbits,
- 	bits += 3;
- 	header_flags = p[3];
- 	/* Bytes 4-7 are mod time in little endian. */
-+#ifdef HAVE_ZLIB_H
- 	if (state)
- 		state->mtime = archive_le32dec(p + 4);
-+#endif
- 	/* Byte 8 is deflate flags. */
- 	/* XXXX TODO: return deflate flags back to consume_header for use
- 	   in initializing the decompressor. */
-@@ -171,7 +181,9 @@ peek_at_header(struct archive_read_filter *filter, int *pbits,
- 
- 	/* Null-terminated optional filename. */
- 	if (header_flags & 8) {
-+#ifdef HAVE_ZLIB_H
- 		ssize_t file_start = len;
-+#endif
- 		do {
- 			++len;
- 			if (avail < len)
-@@ -181,11 +193,13 @@ peek_at_header(struct archive_read_filter *filter, int *pbits,
- 				return (0);
- 		} while (p[len - 1] != 0);
- 
-+#ifdef HAVE_ZLIB_H
- 		if (state) {
- 			/* Reset the name in case of repeat header reads. */
- 			free(state->name);
- 			state->name = strdup((const char *)&p[file_start]);
- 		}
-+#endif
- 	}
- 
- 	/* Null-terminated optional comment. */
-@@ -236,24 +250,6 @@ gzip_bidder_bid(struct archive_read_filter_bidder *self,
- 	return (0);
- }
- 
--static int
--gzip_read_header(struct archive_read_filter *self, struct archive_entry *entry)
--{
--	struct private_data *state;
--
--	state = (struct private_data *)self->data;
--
--	/* A mtime of 0 is considered invalid/missing. */
--	if (state->mtime != 0)
--		archive_entry_set_mtime(entry, state->mtime, 0);
--
--	/* If the name is available, extract it. */
--	if (state->name)
--		archive_entry_set_pathname(entry, state->name);
--
--	return (ARCHIVE_OK);
--}
--
- #ifndef HAVE_ZLIB_H
- 
- /*
-@@ -277,6 +273,24 @@ gzip_bidder_init(struct archive_read_filter *self)
- 
- #else
- 
-+static int
-+gzip_read_header(struct archive_read_filter *self, struct archive_entry *entry)
-+{
-+	struct private_data *state;
-+
-+	state = (struct private_data *)self->data;
-+
-+	/* A mtime of 0 is considered invalid/missing. */
-+	if (state->mtime != 0)
-+		archive_entry_set_mtime(entry, state->mtime, 0);
-+
-+	/* If the name is available, extract it. */
-+	if (state->name)
-+		archive_entry_set_pathname(entry, state->name);
-+
-+	return (ARCHIVE_OK);
-+}
-+
- /*
-  * Initialize the filter object.
-  */
-@@ -306,7 +320,9 @@ gzip_bidder_init(struct archive_read_filter *self)
- 	self->read = gzip_filter_read;
- 	self->skip = NULL; /* not supported */
- 	self->close = gzip_filter_close;
-+#ifdef HAVE_ZLIB_H
- 	self->read_header = gzip_read_header;
-+#endif
- 
- 	state->in_stream = 0; /* We're not actually within a stream yet. */
- 
-diff --git a/libarchive/test/test_read_format_raw.c b/libarchive/test/test_read_format_raw.c
-index 0dac8bfbab4a..3961723b48a1 100644
---- a/libarchive/test/test_read_format_raw.c
-+++ b/libarchive/test/test_read_format_raw.c
-@@ -36,7 +36,9 @@ DEFINE_TEST(test_read_format_raw)
- 	const char *reffile1 = "test_read_format_raw.data";
- 	const char *reffile2 = "test_read_format_raw.data.Z";
- 	const char *reffile3 = "test_read_format_raw.bufr";
-+#ifdef HAVE_ZLIB_H
- 	const char *reffile4 = "test_read_format_raw.data.gz";
-+#endif
- 
- 	/* First, try pulling data out of an uninterpretable file. */
- 	extract_reference_file(reffile1);
-@@ -119,6 +121,7 @@ DEFINE_TEST(test_read_format_raw)
- 	assertEqualIntA(a, ARCHIVE_OK, archive_read_close(a));
- 	assertEqualInt(ARCHIVE_OK, archive_read_free(a));
- 
-+#ifdef HAVE_ZLIB_H
- 	/* Fourth, try with gzip which has metadata. */
- 	extract_reference_file(reffile4);
- 	assert((a = archive_read_new()) != NULL);
-@@ -144,4 +147,5 @@ DEFINE_TEST(test_read_format_raw)
- 	assertEqualIntA(a, ARCHIVE_EOF, archive_read_next_header(a, &ae));
- 	assertEqualIntA(a, ARCHIVE_OK, archive_read_close(a));
- 	assertEqualInt(ARCHIVE_OK, archive_read_free(a));
-+#endif
- }
--- 
-2.20.1
-
diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index 04c5777..b01d636 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,4 +1,4 @@
-# From https://www.libarchive.de/downloads/libarchive-3.4.0.tar.gz.sums.txt
-sha256  8643d50ed40c759f5412a3af4e353cffbce4fdf3b5cf321cb72cacf06b2d825e  libarchive-3.4.0.tar.gz
+# From https://www.libarchive.de/downloads/sha256sums
+sha256  fcf87f3ad8db2e4f74f32526dee62dd1fb9894782b0a503a89c9d7a70a235191  libarchive-3.4.1.tar.gz
 # Locally computed:
 sha256  e1e3d4ba9d0b0ccba333b5f5539f7c6c9a3ef3d57a96cd165d2c45eaa1cd026d  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index ccda183..e256b72 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.4.0
+LIBARCHIVE_VERSION = 3.4.1
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
 LIBARCHIVE_LICENSE = BSD-2-Clause, BSD-3-Clause, CC0-1.0, OpenSSL, Apache-2.0
-- 
2.7.4
