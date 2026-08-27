Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8C8C5DF9D
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 04:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 227D6809F5;
	Thu, 27 Aug 2026 04:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iVYEFUoF9G7L; Thu, 27 Aug 2026 04:05:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787803530;
	bh=d/W9LM1V3eEF37xG2P8EWitICDsADE9GyFq5coytx08=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Qi/MNilm3AJepphLNmD5tPsNgWAvX6WWQijC7tT3tn7H4B9al24aw2dXA53sXOPP/
	 +Xld8iC5Z6joyqCTiEn8ZscGZ4g+0PdWlbSFiJ1vWkew7gZYP4GxtQ7mhRqDsmZjnn
	 F56NHo4qEaBHcdiRCgspOulKniz4/Za7783ZPyNGopAtccKWZxmXWmgHEI3icJUj7R
	 AQDU3qhEm2bZ1fJmZJqdLtdB+DcpS4tSZMch0TNF94vrVF4hx1+5kGMWSNbu0D3ZZg
	 dSLvzON3CcMmzPFzzRIHOwb7VPMJXnn5IE/LVWqRMpUYnA/oSizCMuECJ/rOhQrxua
	 jbrUaiqkmNNmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BDC0809F8;
	Thu, 27 Aug 2026 04:05:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E7FF4334
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 04:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C84524009E
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 04:05:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IFUvCSy16_6p for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 04:05:27 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=bZ4khHhK
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A885B4009C
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 04:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1787803520; bh=xWP7pWc0z4IvrysPWh93MggWntNKnp8LdhCv28U9GsM=;
 h=From:To:Cc:Subject:Date;
 b=bZ4khHhKuj1o6Ywwrdip1g/tvjyeCE05+xmzqpcy13vnpXnUoZCv6f1CefAD5vRuc
 8Ud14G4r3DfM4Ej4/s2+OLWRiZNPArEjQF73huXD/eI3c06yTY5dvrn9sEmSfyJbdX
 9HZtt3aoUrhlVMKHxtRE+1jQho0nqyFUN97tOk6c=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id DF7ACBDE2C23;
 Thu, 27 Aug 2026 06:05:19 +0200 (CEST)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>
Date: Thu, 27 Aug 2026 06:05:12 +0200
Message-ID: <20260827040513.3903-1-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] [PATCH 1/1] package/libnfs: update version to 7.0.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

New version contains all current patches, plus one that fixes
"undefined reference to 'gnutls_*'" if libnfs was built with
GnuTLS support

Change log:
https://github.com/sahlberg/libnfs/compare/libnfs-6.0.2...libnfs-7.0.0

Fixes:
https://autobuild.buildroot.net/results/b07/b070248b2bceaceaaed8e826b1247ccfba1ba9fb
https://autobuild.buildroot.net/results/e14/e1461b76121addd8f04f08819b2e3e453a12c679
https://autobuild.buildroot.net/results/87c/87c79193d2ea86f47e36232fe514837ad99c5f30

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
---
 ...t-and-use-const-qualifier-from-point.patch |  37 ------
 ...t-qualifier-from-pointer-target-type.patch | 117 ------------------
 ...void-cast-to-allow-compile-for-arm32.patch |  68 ----------
 package/libnfs/libnfs.hash                    |   2 +-
 package/libnfs/libnfs.mk                      |   2 +-
 5 files changed, 2 insertions(+), 224 deletions(-)
 delete mode 100644 package/libnfs/0001-Do-not-edit-const-and-use-const-qualifier-from-point.patch
 delete mode 100644 package/libnfs/0002-use-const-qualifier-from-pointer-target-type.patch
 delete mode 100644 package/libnfs/0003-socket-use-void-cast-to-allow-compile-for-arm32.patch

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
diff --git a/package/libnfs/libnfs.hash b/package/libnfs/libnfs.hash
index c0e5ef5c81..4aefc83f80 100644
--- a/package/libnfs/libnfs.hash
+++ b/package/libnfs/libnfs.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  4e5459cc3e0242447879004e9ad28286d4d27daa42cbdcde423248fad911e747  libnfs-6.0.2.tar.gz
+sha256  d25c70537d60f1ab307b9cb5e9fb01acff71065fc9547b54dfaec109ba993003  libnfs-7.0.0.tar.gz
 sha256  edd960c0142b8ada98b43b6396b78f4e557b0bc70ac601a51e397ad04070e2c5  COPYING
 sha256  d9406ced95457941032aa11d04623b8ab71f2827a3395ebef137aec475be35b1  LICENCE-BSD.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENCE-LGPL-2.1.txt
diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
index 12afb7c697..57ccbf1c2b 100644
--- a/package/libnfs/libnfs.mk
+++ b/package/libnfs/libnfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFS_VERSION = 6.0.2
+LIBNFS_VERSION = 7.0.0
 LIBNFS_SITE = $(call github,sahlberg,libnfs,libnfs-$(LIBNFS_VERSION))
 LIBNFS_INSTALL_STAGING = YES
 LIBNFS_AUTORECONF = YES
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
