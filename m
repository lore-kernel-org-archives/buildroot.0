Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D117CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 160E9844F5;
	Fri, 15 May 2026 17:17:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id znD2Pu3KQXTl; Fri, 15 May 2026 17:17:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EE0A844F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778865436;
	bh=3BhmPCXgA9yxqNmHzyc8v2Ak6pF4NwfgQg8QDwXC2ps=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rmh506Lgppcal+YW5sqiXLYXVIdG43UvQK911z+oxBdZAy4OKHZO73LNczlO/xAb7
	 +Yrm4HEmMKavm5f44GXeH+LxQixiHq/PCV/Ju4FopgUWZ9prWKsZxEQteEfOuDKDN5
	 6Rv+xoVGkQNAjJppm6M1nyjdzHI7yEQjDG9o39jE/gfFUV4CcuGoNHPRhasgvWczNY
	 EXOm7sPRGM7GBhgp6GHjxXRkYGMCcCGiibCiesMziUP3nqLCOFS5DtOwJdA6dHnrSk
	 zNDpz/hbq8635mXaFnWTX/ipFmOe7ymUR7mZfDlzT7y1dKqALAgY3ZTfwGGJykSLvl
	 7pgUdHyjAgLKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EE0A844F1;
	Fri, 15 May 2026 17:17:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BDE0523F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A406641CE6
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:17:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s_L9_KZmCP4P for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:17:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D848341CD4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D848341CD4
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:17:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15674863C7; Fri, 15 May 2026 17:17:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 19:14:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 955fb2f7c41f49e8d7fc8c60b8557f6f7c1d84c4
X-Git-Newrev: 6b1b1d6380536e1b01f78535ac3a0a1c19c4f0b7
X-Patchwork-Hint: ignore
Message-Id: <20260515171708.15674863C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnfs: fix build on strict
 alignment archs
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6b1b1d6380536e1b01f78535ac3a0a1c19c4f0b7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Building libnfs fails on targets that have alignment requirements via
-Wcast-align even though the underlying buffers are sufficiently
aligned. Import the upstream fix that silences those warnings.

Fixes: https://autobuild.buildroot.org/results/d7c/d7c0bc5861afdf9bc26906e9abd217bef898fc48

Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 ...-use-void-cast-to-allow-compile-for-arm32.patch | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/package/libnfs/0003-socket-use-void-cast-to-allow-compile-for-arm32.patch b/package/libnfs/0003-socket-use-void-cast-to-allow-compile-for-arm32.patch
new file mode 100644
index 0000000000..1f71a391e7
--- /dev/null
+++ b/package/libnfs/0003-socket-use-void-cast-to-allow-compile-for-arm32.patch
@@ -0,0 +1,68 @@
+From c66dc9a65723e610fd02da38471d68b8289eb074 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Tue, 14 Jan 2025 14:09:36 +0000
+Subject: [PATCH] socket: use void cast to allow compile for arm32
+
+When compiling for arm32 the error: cast increases required alignment
+of target type occurs.
+
+/lib/socket.c: In function 'rpc_read_from_socket':
+lib/socket.c:586:49: error: cast increases required alignment of target type [-Werror=cast-align]
+  586 |                         rpc->rm_xid[1] = ntohl(*(uint32_t *)&buf[0]);
+      |                                                 ^
+lib/socket.c:587:61: error: cast increases required alignment of target type [-Werror=cast-align]
+  587 |                         rpc->pdu = rpc_find_pdu(rpc, ntohl(*(uint32_t *)&buf[0]));
+      |                                                             ^
+lib/socket.c:799:35: error: cast increases required alignment of target type [-Werror=cast-align]
+  799 |                                 *((uint32_t *)rpc->inbuf) = htonl(rpc->rm_xid[1]);
+      |                                   ^
+lib/socket.c:861:71: error: cast increases required alignment of target type [-Werror=cast-align]
+  861 |                                                 const READ3res *res = (READ3res *) rpc->pdu->zdr_decode_buf;
+      |                                                                       ^
+
+cast via (void *) to allow the compile to suceed, as all of the source buffers should be 32bit aligned.
+
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+
+Upstream: https://github.com/sahlberg/libnfs/commit/a01d42a0d9682d3e506d3c78680db8c7d158fe88
+Signed-off-by: Florian Larysch <fl@n621.de>
+---
+ lib/socket.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/lib/socket.c b/lib/socket.c
+index f51ca4d..5b9fce5 100644
+--- a/lib/socket.c
++++ b/lib/socket.c
+@@ -583,8 +583,8 @@ rpc_read_from_socket(struct rpc_context *rpc)
+ 		}
+ 		if (!rpc->is_server_context) {
+ 			rpc->rm_xid[0] = count;
+-			rpc->rm_xid[1] = ntohl(*(uint32_t *)&buf[0]);
+-			rpc->pdu = rpc_find_pdu(rpc, ntohl(*(uint32_t *)&buf[0]));
++			rpc->rm_xid[1] = ntohl(*(uint32_t *)(void *)&buf[0]);
++			rpc->pdu = rpc_find_pdu(rpc, ntohl(*(uint32_t *)(void *)&buf[0]));
+ 			if (rpc->pdu == NULL) {
+ 				rpc_set_error(rpc, "Failed to match incoming PDU/XID."
+ 						" Ignoring PDU");
+@@ -796,7 +796,7 @@ rpc_read_from_socket(struct rpc_context *rpc)
+                                 }
+ 
+                                 /* Copy the next 4 bytes into inbuf */
+-                                *((uint32_t *)rpc->inbuf) = htonl(rpc->rm_xid[1]);
++                                *((uint32_t *)(void *)rpc->inbuf) = htonl(rpc->rm_xid[1]);
+ 
+                                 /* but set inpos to 0, we will update it above
+                                  * that we have already read these 4 bytes in
+@@ -858,7 +858,7 @@ rpc_read_from_socket(struct rpc_context *rpc)
+                                                  * If the READ failed, bail out here as there is no
+                                                  * data.
+                                                  */
+-                                                const READ3res *res = (READ3res *) rpc->pdu->zdr_decode_buf;
++                                                const READ3res *res = (READ3res *)(void *) rpc->pdu->zdr_decode_buf;
+                                                 if (res->status != NFS3_OK) {
+                                                         goto payload_finished;
+                                                 }
+-- 
+2.53.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
