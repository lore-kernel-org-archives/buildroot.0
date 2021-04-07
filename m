From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Apr 2021 09:26:16 +0200
Subject: [Buildroot] [git commit] package/busybox: add upstream gunzip
 security fix
Message-ID: <20210407070141.50F25838EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f4ec05ed07865c86a261e453e78a508afca8ce4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issue:

- CVE-2021-28831: decompress_gunzip.c in BusyBox through 1.32.1 mishandles
  the error bit on the huft_build result pointer, with a resultant invalid
  free or segmentation fault, via malformed gzip data.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch | 58 ++++++++++++++++++++++
 package/busybox/busybox.mk                         |  3 ++
 2 files changed, 61 insertions(+)

diff --git a/package/busybox/0004-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch b/package/busybox/0004-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch
new file mode 100644
index 0000000000..d40cb4d6cd
--- /dev/null
+++ b/package/busybox/0004-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch
@@ -0,0 +1,58 @@
+From f25d254dfd4243698c31a4f3153d4ac72aa9e9bd Mon Sep 17 00:00:00 2001
+From: Samuel Sapalski <samuel.sapalski@nokia.com>
+Date: Wed, 3 Mar 2021 16:31:22 +0100
+Subject: [PATCH] decompress_gunzip: Fix DoS if gzip is corrupt
+
+On certain corrupt gzip files, huft_build will set the error bit on
+the result pointer. If afterwards abort_unzip is called huft_free
+might run into a segmentation fault or an invalid pointer to
+free(p).
+
+In order to mitigate this, we check in huft_free if the error bit
+is set and clear it before the linked list is freed.
+
+Signed-off-by: Samuel Sapalski <samuel.sapalski@nokia.com>
+Signed-off-by: Peter Kaestle <peter.kaestle@nokia.com>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ archival/libarchive/decompress_gunzip.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/archival/libarchive/decompress_gunzip.c b/archival/libarchive/decompress_gunzip.c
+index eb3b64930..e93cd5005 100644
+--- a/archival/libarchive/decompress_gunzip.c
++++ b/archival/libarchive/decompress_gunzip.c
+@@ -220,10 +220,20 @@ static const uint8_t border[] ALIGN1 = {
+  * each table.
+  * t: table to free
+  */
++#define BAD_HUFT(p) ((uintptr_t)(p) & 1)
++#define ERR_RET     ((huft_t*)(uintptr_t)1)
+ static void huft_free(huft_t *p)
+ {
+ 	huft_t *q;
+ 
++	/*
++	 * If 'p' has the error bit set we have to clear it, otherwise we might run
++	 * into a segmentation fault or an invalid pointer to free(p)
++	 */
++	if (BAD_HUFT(p)) {
++		p = (huft_t*)((uintptr_t)(p) ^ (uintptr_t)(ERR_RET));
++	}
++
+ 	/* Go through linked list, freeing from the malloced (t[-1]) address. */
+ 	while (p) {
+ 		q = (--p)->v.t;
+@@ -289,8 +299,6 @@ static unsigned fill_bitbuffer(STATE_PARAM unsigned bitbuffer, unsigned *current
+  * or a valid pointer to a Huffman table, ORed with 0x1 if incompete table
+  * is given: "fixed inflate" decoder feeds us such data.
+  */
+-#define BAD_HUFT(p) ((uintptr_t)(p) & 1)
+-#define ERR_RET     ((huft_t*)(uintptr_t)1)
+ static huft_t* huft_build(const unsigned *b, const unsigned n,
+ 			const unsigned s, const struct cp_ext *cp_ext,
+ 			unsigned *m)
+-- 
+2.20.1
+
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 032e487267..e979ac4f4b 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -11,6 +11,9 @@ BUSYBOX_LICENSE = GPL-2.0, bzip2-1.0.4
 BUSYBOX_LICENSE_FILES = LICENSE archival/libarchive/bz/LICENSE
 BUSYBOX_CPE_ID_VENDOR = busybox
 
+# 0004-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch
+BUSYBOX_IGNORE_CVES += CVE-2021-28831
+
 define BUSYBOX_HELP_CMDS
 	@echo '  busybox-menuconfig     - Run BusyBox menuconfig'
 endef
