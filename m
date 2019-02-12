From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Feb 2019 20:02:03 +0100
Subject: [Buildroot] [git commit branch/next] package/libarchive: add
 upstream security fixes
Message-ID: <20190213214530.ACA298A34D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0526c9f7819722b2deebf7a15821689ac4ead56a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

CVE-2019-1000019: Crash when parsing some 7zip archives.

CVE-2019-1000020: A corrupted or malicious ISO9660 image can cause
read_CE() to loop forever.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...l-when-expected-Rockridge-extensions-is-m.patch | 62 ++++++++++++++++++++++
 ...p-fix-crash-when-parsing-certain-archives.patch | 62 ++++++++++++++++++++++
 2 files changed, 124 insertions(+)

diff --git a/package/libarchive/0005-iso9660-Fail-when-expected-Rockridge-extensions-is-m.patch b/package/libarchive/0005-iso9660-Fail-when-expected-Rockridge-extensions-is-m.patch
new file mode 100644
index 0000000000..bd36ce4b53
--- /dev/null
+++ b/package/libarchive/0005-iso9660-Fail-when-expected-Rockridge-extensions-is-m.patch
@@ -0,0 +1,62 @@
+From 8312eaa576014cd9b965012af51bc1f967b12423 Mon Sep 17 00:00:00 2001
+From: Daniel Axtens <dja@axtens.net>
+Date: Tue, 1 Jan 2019 17:10:49 +1100
+Subject: [PATCH] iso9660: Fail when expected Rockridge extensions is missing
+
+A corrupted or malicious ISO9660 image can cause read_CE() to loop
+forever.
+
+read_CE() calls parse_rockridge(), expecting a Rockridge extension
+to be read. However, parse_rockridge() is structured as a while
+loop starting with a sanity check, and if the sanity check fails
+before the loop has run, the function returns ARCHIVE_OK without
+advancing the position in the file. This causes read_CE() to retry
+indefinitely.
+
+Make parse_rockridge() return ARCHIVE_WARN if it didn't read an
+extension. As someone with no real knowledge of the format, this
+seems more apt than ARCHIVE_FATAL, but both the call-sites escalate
+it to a fatal error immediately anyway.
+
+Found with a combination of AFL, afl-rb (FairFuzz) and qsym.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 8312eaa57601
+
+ libarchive/archive_read_support_format_iso9660.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/libarchive/archive_read_support_format_iso9660.c b/libarchive/archive_read_support_format_iso9660.c
+index 28acfefbba8a..bad8f1dfef3a 100644
+--- a/libarchive/archive_read_support_format_iso9660.c
++++ b/libarchive/archive_read_support_format_iso9660.c
+@@ -2102,6 +2102,7 @@ parse_rockridge(struct archive_read *a, struct file_info *file,
+     const unsigned char *p, const unsigned char *end)
+ {
+ 	struct iso9660 *iso9660;
++	int entry_seen = 0;
+ 
+ 	iso9660 = (struct iso9660 *)(a->format->data);
+ 
+@@ -2257,8 +2258,16 @@ parse_rockridge(struct archive_read *a, struct file_info *file,
+ 		}
+ 
+ 		p += p[2];
++		entry_seen = 1;
++	}
++
++	if (entry_seen)
++		return (ARCHIVE_OK);
++	else {
++		archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
++				  "Tried to parse Rockridge extensions, but none found");
++		return (ARCHIVE_WARN);
+ 	}
+-	return (ARCHIVE_OK);
+ }
+ 
+ static int
+-- 
+2.20.1
+
diff --git a/package/libarchive/0006-7zip-fix-crash-when-parsing-certain-archives.patch b/package/libarchive/0006-7zip-fix-crash-when-parsing-certain-archives.patch
new file mode 100644
index 0000000000..bad33d9526
--- /dev/null
+++ b/package/libarchive/0006-7zip-fix-crash-when-parsing-certain-archives.patch
@@ -0,0 +1,62 @@
+From 65a23f5dbee4497064e9bb467f81138a62b0dae1 Mon Sep 17 00:00:00 2001
+From: Daniel Axtens <dja@axtens.net>
+Date: Tue, 1 Jan 2019 16:01:40 +1100
+Subject: [PATCH] 7zip: fix crash when parsing certain archives
+
+Fuzzing with CRCs disabled revealed that a call to get_uncompressed_data()
+would sometimes fail to return at least 'minimum' bytes. This can cause
+the crc32() invocation in header_bytes to read off into invalid memory.
+
+A specially crafted archive can use this to cause a crash.
+
+An ASAN trace is below, but ASAN is not required - an uninstrumented
+binary will also crash.
+
+==7719==ERROR: AddressSanitizer: SEGV on unknown address 0x631000040000 (pc 0x7fbdb3b3ec1d bp 0x7ffe77a51310 sp 0x7ffe77a51150 T0)
+==7719==The signal is caused by a READ memory access.
+    #0 0x7fbdb3b3ec1c in crc32_z (/lib/x86_64-linux-gnu/libz.so.1+0x2c1c)
+    #1 0x84f5eb in header_bytes (/tmp/libarchive/bsdtar+0x84f5eb)
+    #2 0x856156 in read_Header (/tmp/libarchive/bsdtar+0x856156)
+    #3 0x84e134 in slurp_central_directory (/tmp/libarchive/bsdtar+0x84e134)
+    #4 0x849690 in archive_read_format_7zip_read_header (/tmp/libarchive/bsdtar+0x849690)
+    #5 0x5713b7 in _archive_read_next_header2 (/tmp/libarchive/bsdtar+0x5713b7)
+    #6 0x570e63 in _archive_read_next_header (/tmp/libarchive/bsdtar+0x570e63)
+    #7 0x6f08bd in archive_read_next_header (/tmp/libarchive/bsdtar+0x6f08bd)
+    #8 0x52373f in read_archive (/tmp/libarchive/bsdtar+0x52373f)
+    #9 0x5257be in tar_mode_x (/tmp/libarchive/bsdtar+0x5257be)
+    #10 0x51daeb in main (/tmp/libarchive/bsdtar+0x51daeb)
+    #11 0x7fbdb27cab96 in __libc_start_main /build/glibc-OTsEL5/glibc-2.27/csu/../csu/libc-start.c:310
+    #12 0x41dd09 in _start (/tmp/libarchive/bsdtar+0x41dd09)
+
+This was primarly done with afl and FairFuzz. Some early corpus entries
+may have been generated by qsym.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 65a23f5dbee
+
+ libarchive/archive_read_support_format_7zip.c | 8 +-------
+ 1 file changed, 1 insertion(+), 7 deletions(-)
+
+diff --git a/libarchive/archive_read_support_format_7zip.c b/libarchive/archive_read_support_format_7zip.c
+index bccbf896603b..b6d1505d372e 100644
+--- a/libarchive/archive_read_support_format_7zip.c
++++ b/libarchive/archive_read_support_format_7zip.c
+@@ -2964,13 +2964,7 @@ get_uncompressed_data(struct archive_read *a, const void **buff, size_t size,
+ 	if (zip->codec == _7Z_COPY && zip->codec2 == (unsigned long)-1) {
+ 		/* Copy mode. */
+ 
+-		/*
+-		 * Note: '1' here is a performance optimization.
+-		 * Recall that the decompression layer returns a count of
+-		 * available bytes; asking for more than that forces the
+-		 * decompressor to combine reads by copying data.
+-		 */
+-		*buff = __archive_read_ahead(a, 1, &bytes_avail);
++		*buff = __archive_read_ahead(a, minimum, &bytes_avail);
+ 		if (bytes_avail <= 0) {
+ 			archive_set_error(&a->archive,
+ 			    ARCHIVE_ERRNO_FILE_FORMAT,
+-- 
+2.20.1
+
