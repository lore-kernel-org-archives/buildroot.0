Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C7DF46C6D
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 18:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00659409E4;
	Mon,  6 Apr 2026 18:22:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 95O7D451ll-o; Mon,  6 Apr 2026 18:22:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E2E2409F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775499742;
	bh=bA/PVVFb8Nqtn3vF4O8cBJE9aSyAq22gk1j/L1NDswI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QFxpURP+MKPTpSSAGuYF4lPSBumiGgxa6yMeFFZkprxr4kuP274aAOL2pJHRosWxt
	 bksJulfRpkmjr3xq+7p9tiblB/WMQZa6sWD+xpGImi9AcA0VLx+TzwWpkeQ8wtSs+L
	 HHMynyDhYMg5V6KfZg9YMoRCiwdh0DhCGjmYNJYh6jNKbHcn9HB/qEXRGIH7kyxr9a
	 /XnowWhlmuiUdy7Hcbrj2kBMT7AwF3sADiGl+Ngoq2cuNQId4QALpm0IdZABSW/wZW
	 zeSC25guZG0nVAI4q882npKHBVW0Kuqvt/n68BhUB0AFboyCi3JdLcNjr1EVSwdp1H
	 UShI4QM2lBddg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E2E2409F8;
	Mon,  6 Apr 2026 18:22:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FE4E1EB
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01B91409F8
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:22:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8UH8z-Uom-Jx for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 18:22:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9D286409E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D286409E4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D286409E4
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:22:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a012a.dip0.t-ipconnect.de [91.58.1.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 82F78A4C3956;
 Mon,  6 Apr 2026 20:22:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40236)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w9oaX-000000001kA-0ja7;
 Mon, 06 Apr 2026 18:22:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David GOUARIN <dgouarin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Laurent Cans <laurent.cans@gmail.com>, Maxim Kochetkov <fido_max@inbox.ru>,
 Phil Eichinger <phil.eichinger@gmail.com>
Date: Mon,  6 Apr 2026 20:22:06 +0200
Message-ID: <20260406182217.1853895-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260406182217.1853895-1-bernd@kuhls.net>
References: <20260406182217.1853895-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775499737;
 bh=9/4jBcMdMngwR6pnFDRpor/c7cAr1cgjhnFm+OgFios=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=SEOkHxUkfjGzappwr39vG7R6aYQpOvxnZfOt0djNsDToyxNBaryt8xypa20O4dptw
 aSh5f2FPx7S/4A5FE5xBNuCwTyaSQwMZkkoANPdq0SFdqSK6PzfFzxfirCLDZVwjLH
 H55nGiKgDAzw6g/utJeFLaPt/Y9EhBRqlzWQSiLRSL9S1837KOO0ttf0aniUevGoUj
 /e6j5IUW9DSkO9C4tZ5sL3bcy7CVLiEjQO8DsmQaCeYZGZw9xh37S1LBTcvGUg4DV6
 DX9pM4RxfxmPukMfB9zA+BL1qaJx59sA2FTXlqpuANMXXYdxOxmJQYR+X1keJiCUHE
 4IPqZF9vFQ4rw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=SEOkHxUk
Subject: [Buildroot] [PATCH 02/11] package/tvheadend: remove optional
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
