From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 22:53:41 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/libarchive: add
 four security patches
Message-ID: <20190129215241.1606F8225E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be6fcb12ff923e72fd6a4f54f01b4eb6ea8c4204
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Add backported patches for the following four security issues in libarchive.
There is no new release yet including these patches.

- CVE-2018-1000877 (https://nvd.nist.gov/vuln/detail/CVE-2018-1000877)

"libarchive version commit 416694915449219d505531b1096384f3237dd6cc onwards
(release v3.1.0 onwards) contains a CWE-415: Double Free vulnerability in
RAR decoder - libarchive/archive_read_support_format_rar.c, parse_codes(),
realloc(rar->lzss.window, new_size) with new_size = 0 that can result in
Crash/DoS. This attack appear to be exploitable via the victim must open a
specially crafted RAR archive."

- CVE-2018-1000878 (https://nvd.nist.gov/vuln/detail/CVE-2018-1000878)

"libarchive version commit 416694915449219d505531b1096384f3237dd6cc onwards
(release v3.1.0 onwards) contains a CWE-416: Use After Free vulnerability in
RAR decoder - libarchive/archive_read_support_format_rar.c that can result
in Crash/DoS - it is unknown if RCE is possible. This attack appear to be
exploitable via the victim must open a specially crafted RAR archive."

- CVE-2018-1000879 (https://nvd.nist.gov/vuln/detail/CVE-2018-1000879)

"libarchive version commit 379867ecb330b3a952fb7bfa7bffb7bbd5547205 onwards
(release v3.3.0 onwards) contains a CWE-476: NULL Pointer Dereference
vulnerability in ACL parser - libarchive/archive_acl.c,
archive_acl_from_text_l() that can result in Crash/DoS. This attack appear
to be exploitable via the victim must open a specially crafted archive
file."

- CVE-2018-1000880 (https://nvd.nist.gov/vuln/detail/CVE-2018-1000880)

"libarchive version commit 9693801580c0cf7c70e862d305270a16b52826a7 onwards
(release v3.2.0 onwards) contains a CWE-20: Improper Input Validation
vulnerability in WARC parser -
libarchive/archive_read_support_format_warc.c, _warc_read() that can result
in DoS - quasi-infinite run time and disk usage from tiny file. This attack
appear to be exploitable via the victim must open a specially crafted WARC
file."

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 17ba24bac10b4f09820259f442e4f7e1e59c1b2d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ble-free-when-a-window-size-of-0-is-speci.patch | 40 +++++++++++
 ...lit-across-multi-part-archives-must-match.patch | 81 ++++++++++++++++++++++
 .../libarchive/0003-Skip-0-length-ACL-fields.patch | 52 ++++++++++++++
 .../0004-warc-consume-data-once-read.patch         | 46 ++++++++++++
 4 files changed, 219 insertions(+)

diff --git a/package/libarchive/0001-Avoid-a-double-free-when-a-window-size-of-0-is-speci.patch b/package/libarchive/0001-Avoid-a-double-free-when-a-window-size-of-0-is-speci.patch
new file mode 100644
index 0000000000..76096f7a45
--- /dev/null
+++ b/package/libarchive/0001-Avoid-a-double-free-when-a-window-size-of-0-is-speci.patch
@@ -0,0 +1,40 @@
+From 021efa522ad729ff0f5806c4ce53e4a6cc1daa31 Mon Sep 17 00:00:00 2001
+From: Daniel Axtens <dja@axtens.net>
+Date: Tue, 20 Nov 2018 17:56:29 +1100
+Subject: [PATCH] Avoid a double-free when a window size of 0 is specified
+
+new_size can be 0 with a malicious or corrupted RAR archive.
+
+realloc(area, 0) is equivalent to free(area), so the region would
+be free()d here and the free()d again in the cleanup function.
+
+Found with a setup running AFL, afl-rb, and qsym.
+---
+ libarchive/archive_read_support_format_rar.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+[for import into Buildroot]
+Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+Upstream-status: backport
+
+CVE-2018-1000877
+
+diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
+index 23452222..6f419c27 100644
+--- a/libarchive/archive_read_support_format_rar.c
++++ b/libarchive/archive_read_support_format_rar.c
+@@ -2300,6 +2300,11 @@ parse_codes(struct archive_read *a)
+       new_size = DICTIONARY_MAX_SIZE;
+     else
+       new_size = rar_fls((unsigned int)rar->unp_size) << 1;
++    if (new_size == 0) {
++      archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
++                        "Zero window size is invalid.");
++      return (ARCHIVE_FATAL);
++    }
+     new_window = realloc(rar->lzss.window, new_size);
+     if (new_window == NULL) {
+       archive_set_error(&a->archive, ENOMEM,
+-- 
+2.19.2
+
diff --git a/package/libarchive/0002-rar-file-split-across-multi-part-archives-must-match.patch b/package/libarchive/0002-rar-file-split-across-multi-part-archives-must-match.patch
new file mode 100644
index 0000000000..4bf68d61d3
--- /dev/null
+++ b/package/libarchive/0002-rar-file-split-across-multi-part-archives-must-match.patch
@@ -0,0 +1,81 @@
+From bfcfe6f04ed20db2504db8a254d1f40a1d84eb28 Mon Sep 17 00:00:00 2001
+From: Daniel Axtens <dja@axtens.net>
+Date: Tue, 4 Dec 2018 00:55:22 +1100
+Subject: [PATCH] rar: file split across multi-part archives must match
+
+Fuzzing uncovered some UAF and memory overrun bugs where a file in a
+single file archive reported that it was split across multiple
+volumes. This was caused by ppmd7 operations calling
+rar_br_fillup. This would invoke rar_read_ahead, which would in some
+situations invoke archive_read_format_rar_read_header.  That would
+check the new file name against the old file name, and if they didn't
+match up it would free the ppmd7 buffer and allocate a new
+one. However, because the ppmd7 decoder wasn't actually done with the
+buffer, it would continue to used the freed buffer. Both reads and
+writes to the freed region can be observed.
+
+This is quite tricky to solve: once the buffer has been freed it is
+too late, as the ppmd7 decoder functions almost universally assume
+success - there's no way for ppmd_read to signal error, nor are there
+good ways for functions like Range_Normalise to propagate them. So we
+can't detect after the fact that we're in an invalid state - e.g. by
+checking rar->cursor, we have to prevent ourselves from ever ending up
+there. So, when we are in the dangerous part or rar_read_ahead that
+assumes a valid split, we set a flag force read_header to either go
+down the path for split files or bail. This means that the ppmd7
+decoder keeps a valid buffer and just runs out of data.
+
+Found with a combination of AFL, afl-rb and qsym.
+---
+ libarchive/archive_read_support_format_rar.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+[for import into Buildroot]
+Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+Upstream-status: backport
+
+CVE-2018-1000878
+
+diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
+index 6f419c27..a8cc5c94 100644
+--- a/libarchive/archive_read_support_format_rar.c
++++ b/libarchive/archive_read_support_format_rar.c
+@@ -258,6 +258,7 @@ struct rar
+   struct data_block_offsets *dbo;
+   unsigned int cursor;
+   unsigned int nodes;
++  char filename_must_match;
+ 
+   /* LZSS members */
+   struct huffman_code maincode;
+@@ -1560,6 +1561,12 @@ read_header(struct archive_read *a, struct archive_entry *entry,
+     }
+     return ret;
+   }
++  else if (rar->filename_must_match)
++  {
++    archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
++      "Mismatch of file parts split across multi-volume archive");
++    return (ARCHIVE_FATAL);
++  }
+ 
+   rar->filename_save = (char*)realloc(rar->filename_save,
+                                       filename_size + 1);
+@@ -2933,12 +2940,14 @@ rar_read_ahead(struct archive_read *a, size_t min, ssize_t *avail)
+     else if (*avail == 0 && rar->main_flags & MHD_VOLUME &&
+       rar->file_flags & FHD_SPLIT_AFTER)
+     {
++      rar->filename_must_match = 1;
+       ret = archive_read_format_rar_read_header(a, a->entry);
+       if (ret == (ARCHIVE_EOF))
+       {
+         rar->has_endarc_header = 1;
+         ret = archive_read_format_rar_read_header(a, a->entry);
+       }
++      rar->filename_must_match = 0;
+       if (ret != (ARCHIVE_OK))
+         return NULL;
+       return rar_read_ahead(a, min, avail);
+-- 
+2.19.2
+
diff --git a/package/libarchive/0003-Skip-0-length-ACL-fields.patch b/package/libarchive/0003-Skip-0-length-ACL-fields.patch
new file mode 100644
index 0000000000..796bfbdeb6
--- /dev/null
+++ b/package/libarchive/0003-Skip-0-length-ACL-fields.patch
@@ -0,0 +1,52 @@
+From 15bf44fd2c1ad0e3fd87048b3fcc90c4dcff1175 Mon Sep 17 00:00:00 2001
+From: Daniel Axtens <dja@axtens.net>
+Date: Tue, 4 Dec 2018 14:29:42 +1100
+Subject: [PATCH] Skip 0-length ACL fields
+
+Currently, it is possible to create an archive that crashes bsdtar
+with a malformed ACL:
+
+Program received signal SIGSEGV, Segmentation fault.
+archive_acl_from_text_l (acl=<optimised out>, text=0x7e2e92 "", want_type=<optimised out>, sc=<optimised out>) at libarchive/archive_acl.c:1726
+1726				switch (*s) {
+(gdb) p n
+$1 = 1
+(gdb) p field[n]
+$2 = {start = 0x0, end = 0x0}
+
+Stop this by checking that the length is not zero before beginning
+the switch statement.
+
+I am pretty sure this is the bug mentioned in the qsym paper [1],
+and I was able to replicate it with a qsym + AFL + afl-rb setup.
+
+[1] https://www.usenix.org/conference/usenixsecurity18/presentation/yun
+---
+ libarchive/archive_acl.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+[for import into Buildroot]
+Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+Upstream-status: backport
+
+CVE-2018-1000879
+
+diff --git a/libarchive/archive_acl.c b/libarchive/archive_acl.c
+index 512beee1..7beeee86 100644
+--- a/libarchive/archive_acl.c
++++ b/libarchive/archive_acl.c
+@@ -1723,6 +1723,11 @@ archive_acl_from_text_l(struct archive_acl *acl, const char *text,
+ 			st = field[n].start + 1;
+ 			len = field[n].end - field[n].start;
+ 
++			if (len == 0) {
++				ret = ARCHIVE_WARN;
++				continue;
++			}
++
+ 			switch (*s) {
+ 			case 'u':
+ 				if (len == 1 || (len == 4
+-- 
+2.19.2
+
diff --git a/package/libarchive/0004-warc-consume-data-once-read.patch b/package/libarchive/0004-warc-consume-data-once-read.patch
new file mode 100644
index 0000000000..f07d6c08ca
--- /dev/null
+++ b/package/libarchive/0004-warc-consume-data-once-read.patch
@@ -0,0 +1,46 @@
+From 9c84b7426660c09c18cc349f6d70b5f8168b5680 Mon Sep 17 00:00:00 2001
+From: Daniel Axtens <dja@axtens.net>
+Date: Tue, 4 Dec 2018 16:33:42 +1100
+Subject: [PATCH] warc: consume data once read
+
+The warc decoder only used read ahead, it wouldn't actually consume
+data that had previously been printed. This means that if you specify
+an invalid content length, it will just reprint the same data over
+and over and over again until it hits the desired length.
+
+This means that a WARC resource with e.g.
+Content-Length: 666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666665
+but only a few hundred bytes of data, causes a quasi-infinite loop.
+
+Consume data in subsequent calls to _warc_read.
+
+Found with an AFL + afl-rb + qsym setup.
+---
+ libarchive/archive_read_support_format_warc.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+[for import into Buildroot]
+Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+Upstream-status: backport
+
+CVE-2018-1000880
+
+diff --git a/libarchive/archive_read_support_format_warc.c b/libarchive/archive_read_support_format_warc.c
+index e8753853..e8fc8428 100644
+--- a/libarchive/archive_read_support_format_warc.c
++++ b/libarchive/archive_read_support_format_warc.c
+@@ -386,6 +386,11 @@ _warc_read(struct archive_read *a, const void **buf, size_t *bsz, int64_t *off)
+ 		return (ARCHIVE_EOF);
+ 	}
+ 
++	if (w->unconsumed) {
++		__archive_read_consume(a, w->unconsumed);
++		w->unconsumed = 0U;
++	}
++
+ 	rab = __archive_read_ahead(a, 1U, &nrd);
+ 	if (nrd < 0) {
+ 		*bsz = 0U;
+-- 
+2.19.2
+
