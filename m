From: Michael Fischer <mf@go-sys.de>
Date: Thu, 24 Jun 2021 11:04:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/busybox: bump version to 1.33.1
Message-ID: <20210624090405.32761-1-mf@go-sys.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

patch 0003: already applied upstream
patch 0004: already applied upstream

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 ...3-update_passwd-fix-context-variable.patch | 41 -------------
 ...ss_gunzip-Fix-DoS-if-gzip-is-corrupt.patch | 58 -------------------
 package/busybox/busybox.hash                  |  4 +-
 package/busybox/busybox.mk                    |  5 +-
 4 files changed, 3 insertions(+), 105 deletions(-)
 delete mode 100644 package/busybox/0003-update_passwd-fix-context-variable.patch
 delete mode 100644 package/busybox/0004-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch

diff --git a/package/busybox/0003-update_passwd-fix-context-variable.patch b/package/busybox/0003-update_passwd-fix-context-variable.patch
deleted file mode 100644
index 25c07d7054..0000000000
--- a/package/busybox/0003-update_passwd-fix-context-variable.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From b4828612abe378491693c9036db19e4f64768307 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 10 Jan 2021 13:15:04 +0100
-Subject: [PATCH] update_passwd: fix context variable
-
-Commit
-https://git.busybox.net/busybox/commit/libbb/update_passwd.c?id=2496616b0a8d1c80cd1416b73a4847b59b9f969a
-
-changed the variable used from context to seuser but forgot this
-change resulting in build errors detected by buildroot autobuilders:
-
-http://autobuild.buildroot.net/results/b89/b89b7d0f0601bb706e76cea31cf4e43326e5540c//build-end.log
-
-libbb/update_passwd.c:51:11: error: 'context' undeclared (first use in
- this function); did you mean 'ucontext'?
-   freecon(context);
-
-Patch sent upstream:
-http://lists.busybox.net/pipermail/busybox/2021-January/088467.html
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- libbb/update_passwd.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libbb/update_passwd.c b/libbb/update_passwd.c
-index 7b67f30cd..a228075cc 100644
---- a/libbb/update_passwd.c
-+++ b/libbb/update_passwd.c
-@@ -48,7 +48,7 @@ static void check_selinux_update_passwd(const char *username)
- 			bb_simple_error_msg_and_die("SELinux: access denied");
- 	}
- 	if (ENABLE_FEATURE_CLEAN_UP)
--		freecon(context);
-+		freecon(seuser);
- }
- #else
- # define check_selinux_update_passwd(username) ((void)0)
--- 
-2.29.2
-
diff --git a/package/busybox/0004-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch b/package/busybox/0004-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch
deleted file mode 100644
index d40cb4d6cd..0000000000
--- a/package/busybox/0004-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From f25d254dfd4243698c31a4f3153d4ac72aa9e9bd Mon Sep 17 00:00:00 2001
-From: Samuel Sapalski <samuel.sapalski@nokia.com>
-Date: Wed, 3 Mar 2021 16:31:22 +0100
-Subject: [PATCH] decompress_gunzip: Fix DoS if gzip is corrupt
-
-On certain corrupt gzip files, huft_build will set the error bit on
-the result pointer. If afterwards abort_unzip is called huft_free
-might run into a segmentation fault or an invalid pointer to
-free(p).
-
-In order to mitigate this, we check in huft_free if the error bit
-is set and clear it before the linked list is freed.
-
-Signed-off-by: Samuel Sapalski <samuel.sapalski@nokia.com>
-Signed-off-by: Peter Kaestle <peter.kaestle@nokia.com>
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- archival/libarchive/decompress_gunzip.c | 12 ++++++++++--
- 1 file changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/archival/libarchive/decompress_gunzip.c b/archival/libarchive/decompress_gunzip.c
-index eb3b64930..e93cd5005 100644
---- a/archival/libarchive/decompress_gunzip.c
-+++ b/archival/libarchive/decompress_gunzip.c
-@@ -220,10 +220,20 @@ static const uint8_t border[] ALIGN1 = {
-  * each table.
-  * t: table to free
-  */
-+#define BAD_HUFT(p) ((uintptr_t)(p) & 1)
-+#define ERR_RET     ((huft_t*)(uintptr_t)1)
- static void huft_free(huft_t *p)
- {
- 	huft_t *q;
- 
-+	/*
-+	 * If 'p' has the error bit set we have to clear it, otherwise we might run
-+	 * into a segmentation fault or an invalid pointer to free(p)
-+	 */
-+	if (BAD_HUFT(p)) {
-+		p = (huft_t*)((uintptr_t)(p) ^ (uintptr_t)(ERR_RET));
-+	}
-+
- 	/* Go through linked list, freeing from the malloced (t[-1]) address. */
- 	while (p) {
- 		q = (--p)->v.t;
-@@ -289,8 +299,6 @@ static unsigned fill_bitbuffer(STATE_PARAM unsigned bitbuffer, unsigned *current
-  * or a valid pointer to a Huffman table, ORed with 0x1 if incompete table
-  * is given: "fixed inflate" decoder feeds us such data.
-  */
--#define BAD_HUFT(p) ((uintptr_t)(p) & 1)
--#define ERR_RET     ((huft_t*)(uintptr_t)1)
- static huft_t* huft_build(const unsigned *b, const unsigned n,
- 			const unsigned s, const struct cp_ext *cp_ext,
- 			unsigned *m)
--- 
-2.20.1
-
diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index dffab21400..3e9c30cad0 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,5 +1,5 @@
-# From https://busybox.net/downloads/busybox-1.33.0.tar.bz2.sha256
-sha256  d568681c91a85edc6710770cebc1e80e042ad74d305b5c2e6d57a5f3de3b8fbd  busybox-1.33.0.tar.bz2
+# From https://busybox.net/downloads/busybox-1.33.1.tar.bz2.sha256
+sha256  12cec6bd2b16d8a9446dd16130f2b92982f1819f6e1c5f5887b6db03f5660d28  busybox-1.33.1.tar.bz2
 # Locally computed
 sha256  bbfc9843646d483c334664f651c208b9839626891d8f17604db2146962f43548  LICENSE
 sha256  b5a136ed67798e51fe2e0ca0b2a21cb01b904ff0c9f7d563a6292e276607e58f  archival/libarchive/bz/LICENSE
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index e979ac4f4b..413939e28d 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.33.0
+BUSYBOX_VERSION = 1.33.1
 BUSYBOX_SITE = https://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPL-2.0, bzip2-1.0.4
 BUSYBOX_LICENSE_FILES = LICENSE archival/libarchive/bz/LICENSE
 BUSYBOX_CPE_ID_VENDOR = busybox
 
-# 0004-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch
-BUSYBOX_IGNORE_CVES += CVE-2021-28831
-
 define BUSYBOX_HELP_CMDS
 	@echo '  busybox-menuconfig     - Run BusyBox menuconfig'
 endef
-- 
2.20.1
