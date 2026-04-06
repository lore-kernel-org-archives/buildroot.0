Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37578F46C6D
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 18:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00C2C40A15;
	Mon,  6 Apr 2026 18:23:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rpSFcoQ4rGqn; Mon,  6 Apr 2026 18:23:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 358C340A00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775499786;
	bh=CvpoBdKJUUi2hTj+aXuhgHh27MxK6kC0C+aCQljxZD0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sjLvBdVwxBZoET8hoUb0VccRxFJ4CJtlyxdk474JQ14FFv5AIkNwlDdcGQBFIxgB8
	 ujI+TFDuwwd8xBpoU+qI6PDY4rV5yMlQTCkuQ9BPd3Xx/opAjXRR6/BXrDDpfRdhVZ
	 mzS+7QUBBYt40Gahz6V6CujLsWOfqD+gLzmK0wv4IVXvRibHfF4lD5ajnuCGUUh1JM
	 mLzg41UKKyfh3eo34wVmRS27dMu8aUaYkVo7fnPaanNIjmOsxf9a2pET/sEEMG0uu0
	 jFk2ICwGo4sYVW12nxP9vzxC1pvr90Ax0aknbhNTL+p3pSGkszCYuXm2eN1l8/jSYD
	 ckH+428DAfpYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 358C340A00;
	Mon,  6 Apr 2026 18:23:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ACA25219
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9DF081045
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:23:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iMi39k8aS29K for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 18:23:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A56268103B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A56268103B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A56268103B
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:23:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a012a.dip0.t-ipconnect.de [91.58.1.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CE4AEA4C362E;
 Mon,  6 Apr 2026 20:23:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40236)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w9oaX-000000001kA-2F5E;
 Mon, 06 Apr 2026 18:22:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David GOUARIN <dgouarin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Laurent Cans <laurent.cans@gmail.com>, Maxim Kochetkov <fido_max@inbox.ru>,
 Phil Eichinger <phil.eichinger@gmail.com>
Date: Mon,  6 Apr 2026 20:22:12 +0200
Message-ID: <20260406182217.1853895-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260406182217.1853895-1-bernd@kuhls.net>
References: <20260406182217.1853895-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775499781;
 bh=+l2zTpYLB6iTrtmf1Yx5vROYRQQZbY0g2Zn9wV7/BEY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=nboJCSZvN5ZOzlQtr1b2KTN6V06HAY1nuB6gbI9Kkt9HNmxbF+n11hJp3P4YR1QiO
 vvC8PlPooiUmEKt9S079fZ515FK/y9wndmKVzHnITj6rMrnyY56ehiWfrAzlQZ6e6T
 Q2S9D1d/Mcbf/SsBxxAz2Sjz5kDDT1U4aFghX0e1Fu6F3PYRoXtYGV/HbKF1Z9Dndw
 v+5OEPsPZtwArAXEAyy1Fj8vB7xzLSpyHzYrvVWU6+auoFefuDB62yoD+QayetPP1y
 WS4TG49jg24eT+p13q82kWxZe3hQl0OdgdWwFVOG0jX7cw2D1Mg6a8OjSJ3d5LybZD
 UtUZAxpEOTw7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=nboJCSZv
Subject: [Buildroot] [PATCH 08/11] package/postgis: switch to pcre2
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

Upstream added additional and optional support for pcre2 in version
3.2.0:
https://github.com/postgis/postgis/commit/6cf2fba94a434e79d6526a6a5cfdb6057a91bff8
which was added to buildroot in 2021 with commit
5084994d3f6dce350de091cd813047e658b9363d.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/postgis/postgis.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index 42511536aa..0a55ee0e58 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -33,8 +33,8 @@ else
 POSTGIS_CONF_OPTS += --without-raster
 endif
 
-ifeq ($(BR2_PACKAGE_PCRE),y)
-POSTGIS_DEPENDENCIES += pcre
+ifeq ($(BR2_PACKAGE_PCRE2),y)
+POSTGIS_DEPENDENCIES += pcre2
 endif
 
 ifeq ($(BR2_PACKAGE_PROTOBUF_C),y)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
