Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E8EFF8860
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 19:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2A3A805C7;
	Mon, 27 Apr 2026 19:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IUGB6Mvwx7NV; Mon, 27 Apr 2026 19:19:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F39F480593
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777317596;
	bh=g4nfkGKXYDaMql9AKnu0HaCe+LfLBfeGfGfBNPQwW3c=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pZePFTpTBWKEBqLo17hrgTuXsUhCnW5y5M1yV7d1gY2DEgBb0d2E7vVATRMcj3/Mh
	 oX9E03fHJ/5ev6eo2u1HHuJUMD/aR7WB86yToGFbQ2NfzcUgH50mCJiKw3UVaHe6AU
	 ZlZ5PyiMEcsPRw2DHRu188//dADuWgFp+fvCEriS3onGa21drI0HMuzH1z6GzG2kGf
	 oDOFREndJhmFz5eU/47dTVxl9d+g4CqodIR1sC91f4S1g/QD3DPR5Xh6CotCgwT8ce
	 H874otIRcv97o+M4+sP8z9gggvIbTGvuDQm6FLhjskTVVwPikiAekIe7JZp4DEJMip
	 sI6rrdkCbfCDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F39F480593;
	Mon, 27 Apr 2026 19:19:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A8F482DF
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 19:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F26B8058A
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 19:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id isgARNNN_THR for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 19:19:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7296F80581
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7296F80581
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7296F80581
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 19:19:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8AFC1A4C106C;
 Mon, 27 Apr 2026 21:19:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34638)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wHRUk-000000004dA-3KTq;
 Mon, 27 Apr 2026 19:19:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Mon, 27 Apr 2026 21:19:51 +0200
Message-ID: <20260427191951.571150-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777317591;
 bh=HyO30d/DfO7LcE2WyLBzGJooQlZqe9TIIh9QSmCLAJ4=;
 h=From:To:Cc:Subject:Date:From;
 b=c1Z78HoSenrYbTScbk3Fjk03KKta4CUevbQBke/DiOth0c9lMTFJENl+ZIgJJekUg
 eipvC3og8LxFlC/zZqajcwI7YFEU20lNnKLoEqd8e6/A6ShnC83UNXa0X4WSBQaG+d
 ER0voN5Lyd4AzNhlvqs2MLc4p7R9Vv23EIelhPf6UgF4WT0TOl2WhnOXVRI4ksFBQ2
 hrO5QTY2rYikSgAKL0bdPP27Lh+cA281BVaKgptXUtdl6DZ6+K9kQ07Rh1ilw9gma2
 yze2eQQs/k8H5g0Ujx0C/CVL2Bn0ObP5VTvtD0AmAjUUqkdLX6L5ekLxezyCfIUrEN
 yJhnbFup5o5PQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=c1Z78HoS
Subject: [Buildroot] [PATCH 1/1] package/ccache: bump version to 4.13.5
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

https://ccache.dev/releasenotes.html#_ccache_4_13_5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ccache/ccache.hash | 4 ++--
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index f4c81bbe4c..c01bcd8f1b 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ccache/ccache/releases/tag/v4.13.4
-sha256  4a7ef278b39d031b9ec524c0778d24bdb3e761940ed368060b54594f15559537  ccache-4.13.4.tar.xz
+# From https://github.com/ccache/ccache/releases/tag/v4.13.5
+sha256  7a8945f4ac7d4bb79c0055cd3db7857a6934c2b7ab3d80bb11a0f5271e36fd94  ccache-4.13.5.tar.xz
 # sha256 computed locally
 sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
 sha256  072c40891d4ec8e1bcc93420031ebbbeb90b8f2c49fcd7c872d1bb05564c345c  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 744d962abc..74fa2fbf90 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 4.13.4
+CCACHE_VERSION = 4.13.5
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
