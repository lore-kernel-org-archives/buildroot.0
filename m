Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73055F8E48C
	for <buildroot@archiver.kernel.org>; Thu, 16 Apr 2026 22:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 123B581214;
	Thu, 16 Apr 2026 22:52:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P_Tpc1T_Tp8l; Thu, 16 Apr 2026 22:52:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1FA481211
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776379926;
	bh=kq4dI7pdEfrcveDxO4BVAEYwrO1datEt2EY/BvLuE8o=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lPxaRSDl5ODZHcEYzCUs0x35Ad0chBtYni5nBgcUurpdV9ptCSsP2C0+d9Z/sjmIW
	 AK7qirRtjN3eIL8TDv0fhX+kWVgie3FhsSICgpyDQP5uto/OO/6eAu68zCO0H981s8
	 ABqQy86KSajyYvK6NNPUO1R/mT29Jmgyj5obZbYuUBBil806LFjVONgPDGoqw0F2q2
	 F7b1nYh/yrtCZYBpxQazJt7H5Ul4Jjaqs5s1mWlkFYdcOZfPJPaxky7pLiHNd0hzoY
	 yOAi3eIWcNk8gWcAG05O2oDvrPh+85j3fp2Qvwjb24kvtGtr+NgfD0D60dlTeDifxQ
	 ygtU0d1X4iHVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1FA481211;
	Thu, 16 Apr 2026 22:52:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7ED944E0
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 22:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D54781211
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 22:52:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id axrQjqcbGACo for <buildroot@buildroot.org>;
 Thu, 16 Apr 2026 22:52:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 425CE81210
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 425CE81210
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 425CE81210
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 22:52:03 +0000 (UTC)
Received: from eos.home.n621.de (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 01D1EE00108;
 Fri, 17 Apr 2026 00:51:58 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Florian Larysch <fl@n621.de>
Date: Fri, 17 Apr 2026 00:51:09 +0200
Message-ID: <20260416225157.25398-1-fl@n621.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1776379919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=o0P8iaG/NBpP4U7i7q1B1FiLfGfvd/0uNkNb3ad+ec0=;
 b=ixtRkwXkhGBxOdjKdZrrkjn9BRAWxCmU7zt0NxYZTtNCSzP2eZERxaSgfxxgaoB2yhMupn
 gjkGfaofnTCnRSQKnenJ+P/Cx+vMElTgIdDZkoU3+Oa1cw8z4rJHTKy93JohY1GNNExuPl
 twzvRDBWfUZezYHOFKNbR+AjDUId1Us=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=ixtRkwXk
Subject: [Buildroot] [PATCH 1/2] package/libnfs: fix build on strict
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Building libnfs fails on targets that have alignment requirements via
-Wcast-align even though the underlying buffers are sufficiently
aligned. Import the upstream fix that silences those warnings.

Fixes: https://autobuild.buildroot.org/results/d7c/d7c0bc5861afdf9bc26906e9abd217bef898fc48

Signed-off-by: Florian Larysch <fl@n621.de>
---
 ...void-cast-to-allow-compile-for-arm32.patch | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 package/libnfs/0003-socket-use-void-cast-to-allow-compile-for-arm32.patch

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
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
