Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92152E9DE6C
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 08:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D965410E0;
	Thu,  9 Apr 2026 08:46:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ttEONr21pKMt; Thu,  9 Apr 2026 08:46:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8967E410AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775724364;
	bh=bA/PVVFb8Nqtn3vF4O8cBJE9aSyAq22gk1j/L1NDswI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XDgzw2KTMKI9Wyr/01O2rRRZrAad5zc+9PrymlFxEW+Cp3zpwyIfCl3njweQxTdCI
	 36n19AWXMszytAc3BqAkHZM1SXl2DputKnrJaYwbWGQopReQVRN40p08mnoP10dhCj
	 OVIsYQkK2DwwdfsRixgUPmYL/BItVH4VIP78RXskn+PFr8rJRaFymtlyS2JvIzP6Sw
	 ocxofvmbBlmGBf/xxkqjTdNKyj3poXpXfCC9kIOV/8kcoQvGVuP6yFMIMrP01k0uHx
	 qEhe66faUjRr7T21j14U5itaVJ0p9oB4qZJ77biXsTiXVwjX70KLMATG3M7JXbT4Mv
	 7eaGw3jh3pR5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8967E410AE;
	Thu,  9 Apr 2026 08:46:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D6451F6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1AE860819
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AEpn7aNO8Y-L for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 08:46:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EC48E6087E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC48E6087E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC48E6087E
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:46:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca66.dip0.t-ipconnect.de [79.214.202.102])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EAB0DA4C0933;
 Thu,  9 Apr 2026 10:43:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35588)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wAkyh-000000004SH-1WMC;
 Thu, 09 Apr 2026 08:43:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David GOUARIN <dgouarin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Laurent Cans <laurent.cans@gmail.com>, Mario Lang <mlang@blind.guru>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Phil Eichinger <phil.eichinger@gmail.com>
Date: Thu,  9 Apr 2026 10:42:55 +0200
Message-ID: <20260409084305.3960494-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409084305.3960494-1-bernd@kuhls.net>
References: <20260409084305.3960494-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775724198;
 bh=9/4jBcMdMngwR6pnFDRpor/c7cAr1cgjhnFm+OgFios=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=dg4a6EEAQrO+7URPqSZDbPThXKj/CV6fFuHPH6+hpVdpUepXC8MFZahOW3iIx/ze8
 EU0VGF2dbsCqbgoOCogL3kFFpltm1d2yxWfpkfB0lE59QPnMGDQYiJpoiYH93dhzkh
 4EkR4eQbPoOK6o8PTlXxXuR+J0DjmcPsrJiWhekvrRTHPIKGA94mvGb8TxxPjNEmqr
 u+VEkjVH6BtdR7BXIXp6bCCUHLRe2RsAp53HsfPxbIkKQXgimEsfD3Ci5MxbN/Tk9l
 vdXps7/ca6hOLwRRXB06gpJcrCzLEPPPQlnpFCWrA6iw/839i81FKL7mu8f1BJFH/T
 fePz64oR6uSOQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=dg4a6EEA
Subject: [Buildroot] [PATCH 11/20] package/tvheadend: remove optional
 support for pcre, keep pcre2
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tvheadend/tvheadend.mk | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 76fa7d8cc0..87d99bbb72 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -15,7 +15,8 @@ TVHEADEND_DEPENDENCIES = \
 	host-python3 \
 	openssl
 TVHEADEND_CONF_OPTS = \
-	--disable-omx
+	--disable-omx \
+	--disable-pcre
 
 ifeq ($(BR2_PACKAGE_AVAHI),y)
 TVHEADEND_DEPENDENCIES += avahi
@@ -125,12 +126,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_PCRE2),y)
 TVHEADEND_DEPENDENCIES += pcre2
-TVHEADEND_CONF_OPTS += --disable-pcre --enable-pcre2
-else ifeq ($(BR2_PACKAGE_PCRE),y)
-TVHEADEND_DEPENDENCIES += pcre
-TVHEADEND_CONF_OPTS += --enable-pcre --disable-pcre2
+TVHEADEND_CONF_OPTS += --enable-pcre2
 else
-TVHEADEND_CONF_OPTS += --disable-pcre --disable-pcre2
+TVHEADEND_CONF_OPTS += --disable-pcre2
 endif
 
 ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
