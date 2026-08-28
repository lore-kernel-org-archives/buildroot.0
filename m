Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DC1C61DB9
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 19:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B99780F95;
	Fri, 28 Aug 2026 19:41:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9VKsNgWmPGPW; Fri, 28 Aug 2026 19:41:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787946070;
	bh=GxF2xqd+LE50JmJwliO8oYSrdh1e+FVvvzWV28i6FdA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ReYmN2b2nTToialVh3plToMx5yKEl9sUbvifrS/EdLPHNDzopG1pN6h+zozwJHVk1
	 vjbcyy0Ylo8QnBBFuRBsxKgwEaoILSVM45U7rPKBWfGd3RR2QafqQGJUl8A4VdNv97
	 183c0ufi4LdGw5l7LM5yHtWRbRAhoidue7W2xc8gCysk1reefZjBvO5IWu04n7acyh
	 uADOPwM/nfmDOMEobHmAYBRXQcwpnn7Hdq4Bwk8UQ/HW8cdRBnaluh22IJd79KjiT5
	 H0FOUV4rAl5okXz0Ov1TktQ5AwMKVcOckkVumwWsK1LrtaRwqDXSSANl9Ux9aZbZwi
	 FK312lH23LO9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD31480F7E;
	Fri, 28 Aug 2026 19:41:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8055623E
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 19:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6725F40854
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 19:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rnv2XBWlt-EH for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 19:41:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA1054081C
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 19:41:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 22BE14E41408
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 19:41:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id ED9FB60537;
 Fri, 28 Aug 2026 19:41:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BA48F11C78068; 
 Fri, 28 Aug 2026 21:41:02 +0200 (CEST)
To: Buildroot List <buildroot@buildroot.org>
Cc: Andreas Ziegler <br025@umbiko.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Aug 2026 21:40:57 +0200
Message-ID: <20260828194058.2405217-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828194058.2405217-1-thomas.petazzoni@bootlin.com>
References: <20260828194058.2405217-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH v3 2/2] package/libnfs: bump version to 7.0.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Andreas Ziegler <br025@umbiko.net>

Change log:
https://github.com/sahlberg/libnfs/compare/libnfs-6.0.2...libnfs-7.0.1

All patches are dropped as they are all included in 7.0.1.

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
[Thomas: bump to 7.0.1]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...t-and-use-const-qualifier-from-point.patch |  37 ------
 ...t-qualifier-from-pointer-target-type.patch | 117 ------------------
 ...void-cast-to-allow-compile-for-arm32.patch |  68 ----------
 ...t-gnutls-into-main-library-as-it-is-.patch |  26 ----
 ...t-gnutls-into-main-library-as-it-is-.patch |  29 -----
 ...defined-reference-if-libnfs-was-buil.patch |  41 ------
 package/libnfs/libnfs.hash                    |   2 +-
 package/libnfs/libnfs.mk                      |   2 +-
 8 files changed, 2 insertions(+), 320 deletions(-)
 delete mode 100644 package/libnfs/0001-Do-not-edit-const-and-use-const-qualifier-from-point.patch
 delete mode 100644 package/libnfs/0002-use-const-qualifier-from-pointer-target-type.patch
 delete mode 100644 package/libnfs/0003-socket-use-void-cast-to-allow-compile-for-arm32.patch
 delete mode 100644 package/libnfs/0004-move-link-against-gnutls-into-main-library-as-it-is-.patch
 delete mode 100644 package/libnfs/0005-move-link-against-gnutls-into-main-library-as-it-is-.patch
 delete mode 100644 package/libnfs/0006-autotools-fix-undefined-reference-if-libnfs-was-buil.patch

diff --git a/package/libnfs/0001-Do-not-edit-const-and-use-const-qualifier-from-point.patch b/package/libnfs/0001-Do-not-edit-const-and-use-const-qualifier-from-point.patch
deleted file mode 100644
index d463ecd356..0000000000
--- a/package/libnfs/0001-Do-not-edit-const-and-use-const-qualifier-from-point.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 89a795fee97a3da348c28dbd58500100a13dcec0 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Sun, 25 Jan 2026 08:30:43 +0000
-Subject: [PATCH] Do not edit const and use const qualifier from pointer target
- type
-
-Fixes:
-    ../../lib/libnfs.c: In function 'nfs_set_context_args':
-    ../../lib/libnfs.c:301:30: error: initialization discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
-      301 |                 char *strp = strchr(val, ',');
-          |                              ^~~~~~
-
-Upstream: https://github.com/sahlberg/libnfs/commit/89a795fee97a3da348c28dbd58500100a13dcec0
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- lib/libnfs.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/lib/libnfs.c b/lib/libnfs.c
-index bbe6666..162492b 100755
---- a/lib/libnfs.c
-+++ b/lib/libnfs.c
-@@ -316,9 +316,8 @@ nfs_set_context_args(struct nfs_context *nfs, const char *arg, const char *val)
- 	} else if (!strcmp(arg, "wsize")) {
- 		nfs_set_writemax(nfs, atoi(val));
- 	} else if (!strcmp(arg, "readdir-buffer")) {
--		char *strp = strchr(val, ',');
-+		const char *strp = strchr(val, ',');
- 		if (strp) {
--			*strp = 0;
- 			strp++;
- 			nfs_set_readdir_max_buffer_size(nfs, atoi(val), atoi(strp));
- 		} else {
--- 
-2.47.3
-
diff --git a/package/libnfs/0002-use-const-qualifier-from-pointer-target-type.patch b/package/libnfs/0002-use-const-qualifier-from-pointer-target-type.patch
deleted file mode 100644
index 6fe8f6433b..0000000000
--- a/package/libnfs/0002-use-const-qualifier-from-pointer-target-type.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-From 6a06cb6dba0065705179329729cca2f95a842a63 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Sun, 25 Jan 2026 08:42:18 +0000
-Subject: [PATCH] use const qualifier from pointer target type
-
-Fixes:
-    ../../lib/nfs_v3.c: In function 'nfs3_mknod_async':
-    ../../lib/nfs_v3.c:3260:13: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
-     3260 |         ptr = strrchr(path, '/');
-          |             ^
-    ../../lib/nfs_v3.c: In function 'nfs3_unlink_async':
-    ../../lib/nfs_v3.c:3361:13: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
-     3361 |         ptr = strrchr(path, '/');
-          |             ^
-    ../../lib/nfs_v3.c: In function 'nfs3_rmdir_async':
-    ../../lib/nfs_v3.c:3472:13: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
-     3472 |         ptr = strrchr(path, '/');
-          |             ^
-    ../../lib/nfs_v3.c: In function 'nfs3_mkdir2_async':
-    ../../lib/nfs_v3.c:3574:13: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
-     3574 |         ptr = strrchr(path, '/');
-          |             ^
-
-Upstream: https://github.com/sahlberg/libnfs/commit/6a06cb6dba0065705179329729cca2f95a842a63
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- lib/nfs_v3.c | 24 ++++++++++++------------
- 1 file changed, 12 insertions(+), 12 deletions(-)
-
-diff --git a/lib/nfs_v3.c b/lib/nfs_v3.c
-index addd0ae..2c32fff 100644
---- a/lib/nfs_v3.c
-+++ b/lib/nfs_v3.c
-@@ -3244,7 +3244,7 @@ int
- nfs3_mknod_async(struct nfs_context *nfs, const char *path, int mode, int dev,
-                  nfs_cb cb, void *private_data)
- {
--	char *ptr;
-+	const char *ptr;
- 	struct mknod_cb_data *cb_data;
- 
- 	cb_data = malloc(sizeof(struct mknod_cb_data));
-@@ -3262,8 +3262,8 @@ nfs3_mknod_async(struct nfs_context *nfs, const char *path, int mode, int dev,
-                                       "buffer for mknod path");
-                         return -1;
-                 }
--                ptr = strrchr(cb_data->path, '/');
--                *ptr = 0;
-+                char *ptr2 = strrchr(cb_data->path, '/');
-+                *ptr2 = 0;
-         } else {
-                 cb_data->path = malloc(strlen(path) + 2);
-                 if (cb_data->path == NULL) {
-@@ -3353,7 +3353,7 @@ nfs3_unlink_async(struct nfs_context *nfs, const char *path, nfs_cb cb,
-                   void *private_data)
- {
- 	char *new_path;
--	char *ptr;
-+	const char *ptr;
- 
-         ptr = strrchr(path, '/');
-         if (ptr) {
-@@ -3363,8 +3363,8 @@ nfs3_unlink_async(struct nfs_context *nfs, const char *path, nfs_cb cb,
-                                       "buffer for unlink path");
-                         return -1;
-                 }
--                ptr = strrchr(new_path, '/');
--                *ptr = 0;
-+                char *ptr2 = strrchr(new_path, '/');
-+                *ptr2 = 0;
-         } else {
-                 new_path = malloc(strlen(path) + 2);
-                 if (new_path == NULL) {
-@@ -3464,7 +3464,7 @@ nfs3_rmdir_async(struct nfs_context *nfs, const char *path, nfs_cb cb,
-                  void *private_data)
- {
- 	char *new_path;
--	char *ptr;
-+	const char *ptr;
- 
-         ptr = strrchr(path, '/');
-         if (ptr) {
-@@ -3474,8 +3474,8 @@ nfs3_rmdir_async(struct nfs_context *nfs, const char *path, nfs_cb cb,
-                                       "buffer for rmdir path");
-                         return -1;
-                 }
--                ptr = strrchr(new_path, '/');
--                *ptr = 0;
-+                char *ptr2 = strrchr(new_path, '/');
-+                *ptr2 = 0;
-         } else {
-                 new_path = malloc(strlen(path) + 2);
-                 if (new_path == NULL) {
-@@ -3566,7 +3566,7 @@ nfs3_mkdir2_async(struct nfs_context *nfs, const char *path, int mode,
-                  nfs_cb cb, void *private_data)
- {
- 	char *new_path;
--	char *ptr;
-+	const char *ptr;
- 
-         ptr = strrchr(path, '/');
-         if (ptr) {
-@@ -3576,8 +3576,8 @@ nfs3_mkdir2_async(struct nfs_context *nfs, const char *path, int mode,
-                                       "buffer for mkdir path");
-                         return -1;
-                 }
--                ptr = strrchr(new_path, '/');
--                *ptr = 0;
-+                char *ptr2 = strrchr(new_path, '/');
-+                *ptr2 = 0;
-         } else {
-                 new_path = malloc(strlen(path) + 2);
-                 if (new_path == NULL) {
--- 
-2.47.3
-
diff --git a/package/libnfs/0003-socket-use-void-cast-to-allow-compile-for-arm32.patch b/package/libnfs/0003-socket-use-void-cast-to-allow-compile-for-arm32.patch
deleted file mode 100644
index 1f71a391e7..0000000000
--- a/package/libnfs/0003-socket-use-void-cast-to-allow-compile-for-arm32.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From c66dc9a65723e610fd02da38471d68b8289eb074 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Tue, 14 Jan 2025 14:09:36 +0000
-Subject: [PATCH] socket: use void cast to allow compile for arm32
-
-When compiling for arm32 the error: cast increases required alignment
-of target type occurs.
-
-/lib/socket.c: In function 'rpc_read_from_socket':
-lib/socket.c:586:49: error: cast increases required alignment of target type [-Werror=cast-align]
-  586 |                         rpc->rm_xid[1] = ntohl(*(uint32_t *)&buf[0]);
-      |                                                 ^
-lib/socket.c:587:61: error: cast increases required alignment of target type [-Werror=cast-align]
-  587 |                         rpc->pdu = rpc_find_pdu(rpc, ntohl(*(uint32_t *)&buf[0]));
-      |                                                             ^
-lib/socket.c:799:35: error: cast increases required alignment of target type [-Werror=cast-align]
-  799 |                                 *((uint32_t *)rpc->inbuf) = htonl(rpc->rm_xid[1]);
-      |                                   ^
-lib/socket.c:861:71: error: cast increases required alignment of target type [-Werror=cast-align]
-  861 |                                                 const READ3res *res = (READ3res *) rpc->pdu->zdr_decode_buf;
-      |                                                                       ^
-
-cast via (void *) to allow the compile to suceed, as all of the source buffers should be 32bit aligned.
-
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-
-Upstream: https://github.com/sahlberg/libnfs/commit/a01d42a0d9682d3e506d3c78680db8c7d158fe88
-Signed-off-by: Florian Larysch <fl@n621.de>
----
- lib/socket.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/lib/socket.c b/lib/socket.c
-index f51ca4d..5b9fce5 100644
---- a/lib/socket.c
-+++ b/lib/socket.c
-@@ -583,8 +583,8 @@ rpc_read_from_socket(struct rpc_context *rpc)
- 		}
- 		if (!rpc->is_server_context) {
- 			rpc->rm_xid[0] = count;
--			rpc->rm_xid[1] = ntohl(*(uint32_t *)&buf[0]);
--			rpc->pdu = rpc_find_pdu(rpc, ntohl(*(uint32_t *)&buf[0]));
-+			rpc->rm_xid[1] = ntohl(*(uint32_t *)(void *)&buf[0]);
-+			rpc->pdu = rpc_find_pdu(rpc, ntohl(*(uint32_t *)(void *)&buf[0]));
- 			if (rpc->pdu == NULL) {
- 				rpc_set_error(rpc, "Failed to match incoming PDU/XID."
- 						" Ignoring PDU");
-@@ -796,7 +796,7 @@ rpc_read_from_socket(struct rpc_context *rpc)
-                                 }
- 
-                                 /* Copy the next 4 bytes into inbuf */
--                                *((uint32_t *)rpc->inbuf) = htonl(rpc->rm_xid[1]);
-+                                *((uint32_t *)(void *)rpc->inbuf) = htonl(rpc->rm_xid[1]);
- 
-                                 /* but set inpos to 0, we will update it above
-                                  * that we have already read these 4 bytes in
-@@ -858,7 +858,7 @@ rpc_read_from_socket(struct rpc_context *rpc)
-                                                  * If the READ failed, bail out here as there is no
-                                                  * data.
-                                                  */
--                                                const READ3res *res = (READ3res *) rpc->pdu->zdr_decode_buf;
-+                                                const READ3res *res = (READ3res *)(void *) rpc->pdu->zdr_decode_buf;
-                                                 if (res->status != NFS3_OK) {
-                                                         goto payload_finished;
-                                                 }
--- 
-2.53.0
-
diff --git a/package/libnfs/0004-move-link-against-gnutls-into-main-library-as-it-is-.patch b/package/libnfs/0004-move-link-against-gnutls-into-main-library-as-it-is-.patch
deleted file mode 100644
index b61f162670..0000000000
--- a/package/libnfs/0004-move-link-against-gnutls-into-main-library-as-it-is-.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From f054ce197a286fdd2fcb33ec1d9c236c5976adfb Mon Sep 17 00:00:00 2001
-From: fundawang <fundawang@yeah.net>
-Date: Sun, 26 Jan 2025 16:39:03 +0800
-Subject: [PATCH] move link against gnutls into main library, as it is
- referenced by tls/libtls.la
-
-Upstream: d205297a10bf8d7f8846bf42f0ed618543a561a9
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- lib/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/Makefile.am b/lib/Makefile.am
-index 82376cb..33be5e4 100644
---- a/lib/Makefile.am
-+++ b/lib/Makefile.am
-@@ -48,5 +48,5 @@ libnfs_la_LIBADD = \
- 
- if HAVE_TLS
- libnfs_la_CPPFLAGS += -I$(abs_top_srcdir)/tls
--libnfs_la_LIBADD += ../tls/libtls.la
-+libnfs_la_LIBADD += ../tls/libtls.la -lgnutls
- endif
--- 
-2.55.0
-
diff --git a/package/libnfs/0005-move-link-against-gnutls-into-main-library-as-it-is-.patch b/package/libnfs/0005-move-link-against-gnutls-into-main-library-as-it-is-.patch
deleted file mode 100644
index b4446115d4..0000000000
--- a/package/libnfs/0005-move-link-against-gnutls-into-main-library-as-it-is-.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 74437cb4e9d47daeeb3f851c5b14eb0d207ceb17 Mon Sep 17 00:00:00 2001
-From: fundawang <fundawang@yeah.net>
-Date: Sun, 26 Jan 2025 16:39:59 +0800
-Subject: [PATCH] move link against gnutls into main library, as it is
- referenced by tls/libtls.la
-
-Upstream: 546c9ed8624403078ef993138b56dce4c3558523
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- utils/Makefile.am | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/utils/Makefile.am b/utils/Makefile.am
-index bd584b8..2ae7636 100644
---- a/utils/Makefile.am
-+++ b/utils/Makefile.am
-@@ -16,9 +16,6 @@ AM_CPPFLAGS = \
- 	"-D_U_=__attribute__((unused))"
- 
- COMMON_LIBS = ../lib/libnfs.la $(LIBSOCKET)
--if HAVE_TLS
--COMMON_LIBS += -lgnutls
--endif
- 
- nfs_cat_LDADD = $(COMMON_LIBS)
- nfs_ls_LDADD = $(COMMON_LIBS)
--- 
-2.55.0
-
diff --git a/package/libnfs/0006-autotools-fix-undefined-reference-if-libnfs-was-buil.patch b/package/libnfs/0006-autotools-fix-undefined-reference-if-libnfs-was-buil.patch
deleted file mode 100644
index e8080a60b8..0000000000
--- a/package/libnfs/0006-autotools-fix-undefined-reference-if-libnfs-was-buil.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 8c6bf2f173fdca0a954ed206b3a386e33b5de47b Mon Sep 17 00:00:00 2001
-From: Andreas Ziegler <15275159+aeolio@users.noreply.github.com>
-Date: Sun, 28 Jun 2026 06:20:48 +0000
-Subject: [PATCH] autotools: fix 'undefined reference' if libnfs was built with
- gnutls support (#587)
-
-Signed-off-by: Andreas Ziegler <15275159+aeolio@users.noreply.github.com>
-Upstream: a3e86449217fe5429c38e2b06c4f7e6b3cd3be32
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- configure.ac | 2 ++
- libnfs.pc.in | 2 +-
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index a012004..6e5100f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -284,6 +284,8 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
- [[const char *v = GNUTLS_VERSION;]])],[libnfs_cv_HAVE_TLS=yes],[libnfs_cv_HAVE_TLS=no])])
- if test x"$libnfs_cv_HAVE_TLS" = x"yes"; then
-     AC_DEFINE(HAVE_TLS,1,[Whether we have linux tls support])
-+    # tell pkg-config that gnutls needs to be linked also
-+    AC_SUBST(tls_library,"-lgnutls")
- fi
- AM_CONDITIONAL([HAVE_TLS], [test $libnfs_cv_HAVE_TLS = yes])
- 
-diff --git a/libnfs.pc.in b/libnfs.pc.in
-index fdc012c..42be7b2 100644
---- a/libnfs.pc.in
-+++ b/libnfs.pc.in
-@@ -10,5 +10,5 @@ Description: libnfs is a client library for accessing NFS shares over a network.
- Version: @VERSION@
- Requires:
- Conflicts:
--Libs: -L${libdir} -lnfs
-+Libs: -L${libdir} -lnfs @tls_library@
- Cflags: -I${includedir}
--- 
-2.55.0
-
diff --git a/package/libnfs/libnfs.hash b/package/libnfs/libnfs.hash
index c0e5ef5c81..a94cc07337 100644
--- a/package/libnfs/libnfs.hash
+++ b/package/libnfs/libnfs.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  4e5459cc3e0242447879004e9ad28286d4d27daa42cbdcde423248fad911e747  libnfs-6.0.2.tar.gz
+sha256  ba62a2705f7100727b8ea37741e6bb6d5e2ff9ec61fee4d77360793eca5eddc2  libnfs-7.0.1.tar.gz
 sha256  edd960c0142b8ada98b43b6396b78f4e557b0bc70ac601a51e397ad04070e2c5  COPYING
 sha256  d9406ced95457941032aa11d04623b8ab71f2827a3395ebef137aec475be35b1  LICENCE-BSD.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENCE-LGPL-2.1.txt
diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
index 12afb7c697..8333521214 100644
--- a/package/libnfs/libnfs.mk
+++ b/package/libnfs/libnfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFS_VERSION = 6.0.2
+LIBNFS_VERSION = 7.0.1
 LIBNFS_SITE = $(call github,sahlberg,libnfs,libnfs-$(LIBNFS_VERSION))
 LIBNFS_INSTALL_STAGING = YES
 LIBNFS_AUTORECONF = YES
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
