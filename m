Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04121E7AD44
	for <buildroot@archiver.kernel.org>; Thu, 25 Dec 2025 14:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A196D81358;
	Thu, 25 Dec 2025 14:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OdaJH5sBrf_M; Thu, 25 Dec 2025 14:32:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97A2B81314
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766673155;
	bh=doqzAm3kGg91CGanRbmMowwlOp22LgI9PxSvvj6FvXY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A8LwebIHAuZ8B3pUYooWEw+SxfVWU77rtOB1EbFF6W2JafnL+j6OhObtb2GyFIOJ+
	 JEEhqKF+OEvADJsc5Q6SrI0TZH5keIIrzvZ3oTxaetAWLrbgfzolM5/SECefk6kDpN
	 8WwAFQ+tfLWaCNz+rHI8i8E/3m96ZspERFA02GUjL3N8woyM/5ycj67dUBd9lXWKqb
	 zdnezu4fLvkfF7MNlitqwB3nqUNSP12e80cd1VWf+BY2GparSwFSeJtmpl3x/97xgT
	 Q05BUpgOSh0cxFdUL54bpVHAUX6FP439UlRmCTCScpgc/+hqqTiH1aNFTE2f7n0yLo
	 oyNV47CkAL8oA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97A2B81314;
	Thu, 25 Dec 2025 14:32:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D905DEC
 for <buildroot@buildroot.org>; Thu, 25 Dec 2025 14:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2AA9407B6
 for <buildroot@buildroot.org>; Thu, 25 Dec 2025 14:32:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2bHT0mw7ubGU for <buildroot@buildroot.org>;
 Thu, 25 Dec 2025 14:32:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 098A0406C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 098A0406C8
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 098A0406C8
 for <buildroot@buildroot.org>; Thu, 25 Dec 2025 14:32:31 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1295040796; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 25 Dec 2025 14:32:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1vYmOB-00000000g6p-2Htk;
 Thu, 25 Dec 2025 15:32:27 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 25 Dec 2025 15:32:25 +0100
Message-ID: <20251225143225.161851-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=WUaP5gwvayLmL17XGMdKKWHmEMs0IoqczrgHXfv6ctvboEgHXZZgvfGYIxNGJQyuR4cFmnWpuqrwJJihZHdJSkEbDgShX1eQnpQcNe53Cl/Su4Vdy4y18HPWShbp2LAuCH4roPtZgGlrLDA69t3lATlbYxPCLRsxvG/5n0tPZQCOYP2A5gqr3h4XGsp/89t6iHlrPc9a5laazbdXRCh132cPXgjRLtbAD4p73zGIpAIwvyt7/GQUW6PO/ZofJpprK0Mnd+UKy6j2VgS/yktQd5N7ptvJZJhH5gyETT4Hcy2k66qt6Y1HBXHkUQK/8wTy8Fvhjadlh74Ga7Cgkp6JcQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=KhJSlFaLzpCmEsYLmJ630H3P+B1rnqkGjv9tfT+xh6E=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=WUaP5gwv
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/dump1090: bump version to 10.2
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

Drop now upstreamed patch 0001:
https://github.com/flightaware/dump1090/commit/84d68c628508360c47aa47691ec9d98dc6026ed5

And rename remaining patches.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ... => 0001-Fix-compilation-with-GCC15.patch} |  0
 .../0001-swap-size-arguments-to-calloc.patch  | 43 -------------------
 package/dump1090/dump1090.hash                |  2 +-
 package/dump1090/dump1090.mk                  |  2 +-
 4 files changed, 2 insertions(+), 45 deletions(-)
 rename package/dump1090/{0002-Fix-compilation-with-GCC15.patch => 0001-Fix-compilation-with-GCC15.patch} (100%)
 delete mode 100644 package/dump1090/0001-swap-size-arguments-to-calloc.patch

diff --git a/package/dump1090/0002-Fix-compilation-with-GCC15.patch b/package/dump1090/0001-Fix-compilation-with-GCC15.patch
similarity index 100%
rename from package/dump1090/0002-Fix-compilation-with-GCC15.patch
rename to package/dump1090/0001-Fix-compilation-with-GCC15.patch
diff --git a/package/dump1090/0001-swap-size-arguments-to-calloc.patch b/package/dump1090/0001-swap-size-arguments-to-calloc.patch
deleted file mode 100644
index 1c2d502793..0000000000
--- a/package/dump1090/0001-swap-size-arguments-to-calloc.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From be8f5b7ab1223076ba0086f14aeeb53ace2d4b5c Mon Sep 17 00:00:00 2001
-From: Jeff Lawson <jeff.lawson@flightaware.com>
-Date: Tue, 18 Jun 2024 15:58:24 +0000
-Subject: [PATCH] swap size arguments to calloc
-
-fixes #241
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-Upstream: https://github.com/flightaware/dump1090/pull/243
----
- adaptive.c | 2 +-
- net_io.c   | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/adaptive.c b/adaptive.c
-index f16e16c..d656433 100644
---- a/adaptive.c
-+++ b/adaptive.c
-@@ -195,7 +195,7 @@ void adaptive_init()
-     adaptive_burst_window_remaining = adaptive_samples_per_window;
-     adaptive_burst_window_counter = 0;
- 
--    adaptive_range_radix = calloc(sizeof(unsigned), 65536);
-+    adaptive_range_radix = calloc(65536, sizeof(unsigned));
-     adaptive_range_state = RANGE_RESCAN_UP;
- 
-     // select and enforce gain limits
-diff --git a/net_io.c b/net_io.c
-index bf98028..8abd510 100644
---- a/net_io.c
-+++ b/net_io.c
-@@ -104,7 +104,7 @@ struct net_service *serviceInit(const char *descr, struct net_writer *writer, he
- {
-     struct net_service *service;
- 
--    if (!(service = calloc(sizeof(*service), 1))) {
-+    if (!(service = calloc(1, sizeof(*service)))) {
-         fprintf(stderr, "Out of memory allocating service %s\n", descr);
-         exit(1);
-     }
--- 
-2.39.2
-
diff --git a/package/dump1090/dump1090.hash b/package/dump1090/dump1090.hash
index a493e76560..0683e6ef62 100644
--- a/package/dump1090/dump1090.hash
+++ b/package/dump1090/dump1090.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6190622c3625713ec9cff882a9d6f6a51b6d2f83ef20e6e1905a3902c7b08483  dump1090-9.0.tar.gz
+sha256  1135588ea8f3d045601e8ab45702648e339168eee0792b2c4f62fae3d2cc9f3b  dump1090-10.2.tar.gz
 sha256  804f68c803eb5c127c53ad17c4f4e5033ef158e514bb76950dc7b1773f9ce4b0  LICENSE
diff --git a/package/dump1090/dump1090.mk b/package/dump1090/dump1090.mk
index e06babb082..1ecdfca47f 100644
--- a/package/dump1090/dump1090.mk
+++ b/package/dump1090/dump1090.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DUMP1090_VERSION = 9.0
+DUMP1090_VERSION = 10.2
 DUMP1090_SITE = $(call github,flightaware,dump1090,v$(DUMP1090_VERSION))
 DUMP1090_LICENSE = GPL-2.0+
 DUMP1090_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
