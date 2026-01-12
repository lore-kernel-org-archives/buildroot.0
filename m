Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377EDD25050
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E066845EC;
	Mon, 12 Jan 2026 08:42:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YYgXJwVlEeAg; Mon, 12 Jan 2026 08:42:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39C898123E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207365;
	bh=om5Kjt9umVHcM7ropTSx0NDALd4uRUiyrCIh6Uh0Cz0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cRLLJ+xWlhhaeffojmLrV09IW5MYlpMfBMPRJNwD1+cfuci5e1RwOOS1XeDPKxrDp
	 oPriFkV6vsS191eoBCmzLO4gjTLlmgi6iKAFsZDJiXfWvpd8gFX+uP6LeTZ4U4P6zE
	 r/8yZO0z+0NaGFY1AUhkly+W8FTK3IYP331oKtFpv4n3UhN/COmy3QdtweRPHFW8UW
	 Zic5Wim7zGhJKYI0pzCEMk0xd28g7+/6mvcX0zqsQMSUf3YnOmTbLHYpzeybX17Gtx
	 BK3X31KdBqZ2r7qbmnsvzd/A3gbr2z22ju4wvh6blMza0CMU4Zy4dPQnZdG0GW0TVn
	 vNaWkeuSZX6FA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39C898123E;
	Mon, 12 Jan 2026 08:42:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 505D618D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36D1C61529
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:42:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dNI6GnX_iFuS for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:42:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2AA8561516
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AA8561516
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2AA8561516
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:42:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 401A4A4C402A
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJB-000000007z0-3Q5Y
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:24 +0100
Message-ID: <20260112082950.2528445-16-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206655;
 bh=JiZ5nTJY3YVOkNRLUdXiS5IrZZrwqLIjnIjt+VJNUzE=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=dCLPCrYLan5vNnbM0s+SNym1Fm1WU3OX1Vte/xK7wSGUvXVl2cELlV8cCmBj2PIfY
 aHr2+QrT63ltMWIYVL2qyi3EsbTkuZjfWOJOBjQeP1w+m0UvV3cI+yghvAD4URty9c
 jLqzs3FCS0QO40+n4suMHNB0tK32TFMlDuhhzT9SnJ2sWg6IxN5e0KpsmDeHOf+OXK
 0wovaBzv9Amvka7TT5LEi5TPdEfXBs9RxSTQQODXUaOFHypKfqtqM3pnZlqHbIwuy+
 HW7mCvhitfXCNpcnzTvBWWUIptxDtTMGyp5CdSokwcU3O2ySH9gaxvPaxcPdG4ZtQ2
 gstBo6vZ8JCxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=dCLPCrYL
Subject: [Buildroot] [PATCH 016/102] package/x11r7/xapp_xgc: bump version to
 1.0.7
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

https://lists.x.org/archives/xorg-announce/2025-July/003621.html

Updated license hash due to upstream commits:
https://gitlab.freedesktop.org/xorg/app/xgc/-/commit/ff0106429414d845d72c723fc69123ee2beebaf1
https://gitlab.freedesktop.org/xorg/app/xgc/-/commit/3e699516059eaebbd9a65b7844b052c0bd71aaa0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xgc/xapp_xgc.hash | 8 ++++----
 package/x11r7/xapp_xgc/xapp_xgc.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xgc/xapp_xgc.hash b/package/x11r7/xapp_xgc/xapp_xgc.hash
index 7664e31186..896fd29068 100644
--- a/package/x11r7/xapp_xgc/xapp_xgc.hash
+++ b/package/x11r7/xapp_xgc/xapp_xgc.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003221.html
-sha256  7b87bbdbce4ec858738a3b81b8a3943aff01036001e2a1d00bb5384392a8b240  xgc-1.0.6.tar.xz
-sha512  f449b9b2d313aeba1fe9bf33fef90291776403f1fdf4afc507c4b973045c97fc8ded65ddec4f8c58727e7e4c7c4ad6a65ae79581eb4bdfe9c79a5f909dbc0a1f  xgc-1.0.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-July/003621.html
+sha256  d858258c05eaac2d1f48bb44820dc2dce0a68601a14fff97853c72b48d1b7d08  xgc-1.0.7.tar.xz
+sha512  2d994c1dfa93b8c99756336d099737025d97ae0e6ec102e964ffe4a46209e518917fb2bc57bf0274010e099742bd50fcdebdaf9add0d9c02849edb220bced4a7  xgc-1.0.7.tar.xz
 # Locally computed
-sha256  13ebeb3e59e406064d46e94a707ed5ec5d8d2bf840971265dd46db0850d22d02  COPYING
+sha256  db697e5e99f065bb3602a16fb7e60789cbd34c5cce49c5d4a4577e73d733bb12  COPYING
diff --git a/package/x11r7/xapp_xgc/xapp_xgc.mk b/package/x11r7/xapp_xgc/xapp_xgc.mk
index fc055f57dd..8248daf8db 100644
--- a/package/x11r7/xapp_xgc/xapp_xgc.mk
+++ b/package/x11r7/xapp_xgc/xapp_xgc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XGC_VERSION = 1.0.6
+XAPP_XGC_VERSION = 1.0.7
 XAPP_XGC_SOURCE = xgc-$(XAPP_XGC_VERSION).tar.xz
 XAPP_XGC_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XGC_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
