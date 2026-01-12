Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F3DD2503F
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B75B80B30;
	Mon, 12 Jan 2026 08:04:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1OqjwoGAKpwW; Mon, 12 Jan 2026 08:04:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59FDD843AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205092;
	bh=fhEMFhoMcuOW40OiwcWnaMVleIheAkvOrHYe8Yqus2s=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UNq6onHFYUOCX1eejA3R/44JYzaq6hXjlZWCUQnmPWXpdgE9dlufBxlI6t++cn5sD
	 029WCSmt483Oma2RjxImZg+c6JfjnVnv+LNzMh/nFMNQvFnjBEKEhfDSi/CeN/kTwm
	 EFgaQ4uGEcxwitBegERpp3vlZHhkd0piHf9Ym1+fvZ+1mjsiScNwX+LSzgZ8kyRiaL
	 /7pcXqgtuzzR2G+5eEWNPkoapizOJaM3WrL4QzY40zcaDDeQSYjGo7XLPh3fH75NYq
	 8U17ShaFcqOIdi/32cXVdzAZu+FOuoM74Oud+IBiflN2Z/1mG6HxlxeYqvMKPR+JAI
	 i8IKyzKZ6YCHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59FDD843AB;
	Mon, 12 Jan 2026 08:04:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E72712E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40934614C1
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:04:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KCFubQIEBAXP for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:04:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 36728614B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36728614B4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36728614B4
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:04:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BE765A4C411E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:04:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuR-000000003M6-1Rw5
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:02:36 +0100
Message-ID: <20260112080419.2516889-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205059;
 bh=fFIw0fKdNMbiVMI4P3q+tCH6PGvx/0oBw3uCS2avfDA=;
 h=From:To:Subject:Date:From;
 b=l/zYaIw8E6QB8zFjK/03ITujxzmykGPHu7bQG1YNYjJXJfq16BBrMimsdKdG2ZYF6
 JpH0k4Top77mKnB/W0OERgn2JhMpxVKUwHUpPvrAsEGDRhGQkk29PDUPaG/KuGd0PS
 Omu89HbXH6EjmsbI5prvzzOmVY7YjZd0YHs+rEUms/CSbR6RQAPhjb+SlWwIKLnMX8
 7T4LAPAoXBVfZslYyvCX51P541h9DJ2wd6fZyzSHR1zXD+L/8Aa6uvDh9bP62qpQA2
 84qfYbFZB/G4t9RCZq2SqcSHJop7lROJGStYG/LOptu+ods9bMky96uEBPyNCDmJYr
 FOtMvqghkmBQA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=l/zYaIw8
Subject: [Buildroot] [PATCH 001/104] package/x11r7/xcb-proto: bump version
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
