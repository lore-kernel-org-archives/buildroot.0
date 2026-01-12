Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7317D25051
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFB6680EC0;
	Mon, 12 Jan 2026 08:41:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2KrVoQX03df6; Mon, 12 Jan 2026 08:41:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA8EA80EF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207292;
	bh=0HOSJwZ1Cau6Y7gEMI1rvhVQmXi3AvtBG4mGMa0u+YA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NiHzE2NZb4JAXSZ9xqhoni/8dFxeUXdoDmOmn36711X7WiU7rglPO8enzzUYTie4t
	 0W0PPV4mofTEcknLXQcsbFar10DU/8T3hAuEEXr4EdVOp6rj1CdFLW+ljKZlZvxLW8
	 hbStcCiS+yPisXIAWO2FSNC4yB7X8V1Nh6DKZjVd8NG0DUxZEE04X+VCzTt03ovQhE
	 nSz1MXFmGR39d6Bwir338B3kdTZoS4hvNnzKGSCtI5iJ2dLgIgLdLCDw5KQqu3Ib7i
	 j1lMXQouWXVUDjdmPNAedD8Bl6wDtZRtpdt3iEyjW3oBZVK532fN/EE1aaVp4XzQj9
	 kvZ7nI8me9Liw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA8EA80EF6;
	Mon, 12 Jan 2026 08:41:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CC2EC1CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2EE54061B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:41:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6N90gS5wlYyQ for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:41:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ABE9F40581
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABE9F40581
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABE9F40581
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:41:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BFF1BA4C3F95
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:49 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJ9-000000007z0-013x
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:12 +0100
Message-ID: <20260112082950.2528445-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206649;
 bh=qdWYPdDdnrAnsKQDt7Or6mSPqaXsNB7v0lsDHoyNt6U=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=RvmuhzJ7lVyR3g1vrQu6N+bf2a8zNNMMA0o6lHG1y44E75QWDawNP7B8X0CbM8Pw5
 GKWnTfPFe8HO+IhSZ9e3fxAl6RC7TL3wz76KH4bbBQ1lfofjS2P6dek22HC17rRBNY
 BUpjSYFHpEZlQd1PieDOxk2LUOoKWoj4w+xObDHalyc7bsLhRqe+7CsrMjwINYu9lx
 bYozwwvwdYJWGZsj5hssEMlJhrhrF/38nY4l//vLulbwTXUhayRjw+wCCGFtn2qRff
 3VXszn4ZeaR3vZB5ZOr4HbnHseUiq8rSmEi0a7DPqTB2b/UfjaRLkY3bZucNdaP41X
 FPlr6AMNPzpuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=RvmuhzJ7
Subject: [Buildroot] [PATCH 004/102] package/x11r7/xapp_rgb: bump version to
 1.1.1
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

https://lists.x.org/archives/xorg-announce/2025-December/003652.html

Updated license hash due to upstream commit
https://cgit.freedesktop.org/xorg/app/rgb/commit/COPYING?h=rgb-1.1.1&id=fb06ee0b71ec15d63b6ee4797f954187ec014a37

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_rgb/xapp_rgb.hash | 8 ++++----
 package/x11r7/xapp_rgb/xapp_rgb.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_rgb/xapp_rgb.hash b/package/x11r7/xapp_rgb/xapp_rgb.hash
index 11b2a83905..3e96bf999b 100644
--- a/package/x11r7/xapp_rgb/xapp_rgb.hash
+++ b/package/x11r7/xapp_rgb/xapp_rgb.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003245.html
-sha256  fc03d7f56e5b2a617668167f8927948cce54f93097e7ccd9f056077f479ed37b  rgb-1.1.0.tar.xz
-sha512  640888d64b2d328fff4a1652ba1299436e348bc3cbc90710d79c635acfa7f2fce0018adb818123b41ca008197ff1cbf87aab60501de36c163bed2d80d8556008  rgb-1.1.0.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-December/003652.html
+sha256  c80ff280a02f56c30fadc2dfa210fc6979c4ab968afa315278cb97768b64ecab  rgb-1.1.1.tar.xz
+sha512  8dd40232e149105d680b5689875da8e7444942265b4f64c4f91a5018193d0eb92af4035e51c6457ea57262fe2cab39d85024f70f3f649e17af78644f00a1d0ae  rgb-1.1.1.tar.xz
 # Locally computed
-sha256  1d08eb3384f5dedc7735bcfae1aa58cb64643ca9389edce3312b1c3cefbfdaa7  COPYING
+sha256  eb3b0a2c9810a0a364cd813377713a223651c17ae8be97c62c2e5d680f71f843  COPYING
diff --git a/package/x11r7/xapp_rgb/xapp_rgb.mk b/package/x11r7/xapp_rgb/xapp_rgb.mk
index 4b6399fc76..a59c97dd72 100644
--- a/package/x11r7/xapp_rgb/xapp_rgb.mk
+++ b/package/x11r7/xapp_rgb/xapp_rgb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_RGB_VERSION = 1.1.0
+XAPP_RGB_VERSION = 1.1.1
 XAPP_RGB_SOURCE = rgb-$(XAPP_RGB_VERSION).tar.xz
 XAPP_RGB_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_RGB_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
