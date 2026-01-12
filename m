Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FA6D25046
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65B08614C9;
	Mon, 12 Jan 2026 08:30:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SZNvCjgxqSCn; Mon, 12 Jan 2026 08:30:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 907E8614CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206607;
	bh=fhEMFhoMcuOW40OiwcWnaMVleIheAkvOrHYe8Yqus2s=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q7wWymGvQM0LtisNO/KHxQqh02rlJZr8MkrxGEjPVDy1MTJQ1byXSgGyW7FGFwNto
	 EqQE+NGE5Ub34qx2GoM8igVBdWGo8QP/l77NkYc203vf15qIX9ejGp+9ZLGBhsL3/U
	 gz2BgzccdlL5+odK4WAVmEIZnULY7eK49bDXfSBSuyXEjC4rlx21T/gfq2+kbjFmv8
	 eAx3s0a/wcnjeIH7oPgkf6vKdKdSSL7pZ2V+SYaluZ3WCC3hBUd7aALCHQN0XkVM7r
	 1T1nwcXGjVgdXnAkAuEjcPS3vcVDYi4grderxu9oo33lPP9jlXOzSoVxtM93U4oO5f
	 svzxwPVfJt52A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 907E8614CA;
	Mon, 12 Jan 2026 08:30:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B5E51CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DD9F41528
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:30:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zVazbf94s9-v for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:30:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 34F7841527
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34F7841527
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34F7841527
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:30:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 22C85A4C30A0
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:29:51 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJ8-000000007z0-3Kri
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:09 +0100
Message-ID: <20260112082950.2528445-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206591;
 bh=fFIw0fKdNMbiVMI4P3q+tCH6PGvx/0oBw3uCS2avfDA=;
 h=From:To:Subject:Date:From;
 b=lYby1IB0VkfWUkOSqN4bm58WY6YpO5diC0UtTBy1bssOghIkLPBswlG4PdSk1TEwD
 Jm9EivRRSNmyqOxSqqY50PTo+97AAKsaIDCeUPtS//0EUgks6/4e75UjC1bnDd3mPT
 4dZNiWmquhCoQ17AnvuwQskQ7JNlcYRGOgaUrahMn1HiSPf7pisNSphvkarFquB3E5
 4mxXnfuS6QGvL4LbB2wuaRVBl2ea4eF5DN7yVF9BRNwpsvm+cgXuRR+cbIo0xZNcgw
 q6SVXu/N/jei9ubeOJWoKCcoy/R9To2pjdcKAbPEMZZuPf9bybGkGhMGN2y0P0aBzy
 pKz7ca2Rhbwqg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=lYby1IB0
Subject: [Buildroot] [PATCH 001/102] package/x11r7/xcb-proto: bump version
 to 1.17.0
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

https://lists.x.org/archives/xorg-announce/2023-August/003414.html
https://lists.x.org/archives/xorg-announce/2024-April/003506.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xcb-proto/xcb-proto.hash | 6 +++---
 package/x11r7/xcb-proto/xcb-proto.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xcb-proto/xcb-proto.hash b/package/x11r7/xcb-proto/xcb-proto.hash
index 1a49710d7a..2c2a33bb82 100644
--- a/package/x11r7/xcb-proto/xcb-proto.hash
+++ b/package/x11r7/xcb-proto/xcb-proto.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-June/003170.html
-sha256  7072beb1f680a2fe3f9e535b797c146d22528990c72f63ddb49d2f350a3653ed  xcb-proto-1.15.2.tar.xz
-sha512  9d0b2f0a4dbbf2d64e32ff4658d1663e13d7e5f1bffc1e8d45be7b9dd5bab46e29fc1c2f6e66a7a569e374ba6756faf3c39b0b5e5560df6d7f8b68beec97659d  xcb-proto-1.15.2.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-April/003506.html
+sha256  2c1bacd2110f4799f74de6ebb714b94cf6f80fb112316b1219480fd22562148c  xcb-proto-1.17.0.tar.xz
+sha512  34c3795e5a48a66d89b72ee1777fb0bede489d5ec07018e6c9ef3c13bdd60b0358fc2c04a1f0ed0acb5b681aeeb92033db579036e4f5edd967fe56714c03acdf  xcb-proto-1.17.0.tar.xz
 # Locally computed
 sha256  c5ffbfeaa501071ceeb97b7de2c0d703fdaa35de01c0fb6cbac1c28453a3e9fd  COPYING
diff --git a/package/x11r7/xcb-proto/xcb-proto.mk b/package/x11r7/xcb-proto/xcb-proto.mk
index 324b29427d..2688822fa3 100644
--- a/package/x11r7/xcb-proto/xcb-proto.mk
+++ b/package/x11r7/xcb-proto/xcb-proto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XCB_PROTO_VERSION = 1.15.2
+XCB_PROTO_VERSION = 1.17.0
 XCB_PROTO_SOURCE = xcb-proto-$(XCB_PROTO_VERSION).tar.xz
 XCB_PROTO_SITE = https://xorg.freedesktop.org/archive/individual/proto
 XCB_PROTO_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
