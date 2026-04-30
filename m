Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6245CD13D3
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 16:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88FF042B20;
	Thu, 30 Apr 2026 16:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id siXfAQLb-LbE; Thu, 30 Apr 2026 16:24:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4F7442B41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777566265;
	bh=G2IQkKLQbBp+JaezwA8DCrh0FbHk2dKrx5Y/KAxkYD4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qwINEFHpDeDsnVSiLw1g02F4/CJaHTg9Ykk3C0xldMGpoN3Vz9tkiI75T1eDE0Ydc
	 wT2qwdM4ecVNOiOcLtE8Yr/7BwKZVijfDQnHzAmQrxRaOvhf+JUQwTk9LTJhDGoNP5
	 SSVfLiDlhWknI0Wbie/86pi2E4J4zXgWAulyENkFP1VKlPlJBQd4amCNZsEqB9FUoK
	 ZjRgbb5zw45qJZBA2gVrlHaHUUzhoaD/1S1aEZSOjaLmE+vrTEmt9TbGSTms9HE1lV
	 pCmxUWykANYH2Usm8ToYHhOuj9pfnx5MduKiOjBNByVyhY/qtClVbvlLEZbvXXDsV9
	 3u0gkaHw3f9yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4F7442B41;
	Thu, 30 Apr 2026 16:24:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B5DDE18E
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 16:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C20742B41
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 16:24:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CWsJQR8TDEeA for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 16:24:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4F69F42B20
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F69F42B20
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F69F42B20
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 16:24:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2CF33A4C2D52;
 Thu, 30 Apr 2026 18:22:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45580)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIU9F-000000004jw-1gH0;
 Thu, 30 Apr 2026 16:21:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 18:21:47 +0200
Message-ID: <20260430162156.3456640-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260430162156.3456640-1-bernd@kuhls.net>
References: <20260430162156.3456640-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777566125;
 bh=zUTAvfe87Z6501cBu58zEg50IpGp6WpU7Af0ilIEuq8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=OobMKjZXn4afXXwo4afaqVguBFwKmVD+2lN2OxrdUMpLj28yIN8Mcni1L4Ainn5hs
 Mtf2v2/XdnNMOPGBhc4MD9OP/XnmRCFapjV7YntD8Su3NFpHWSGKiEXg1EhPVRpSgG
 /toMLUhAfYKUKTwKZfglj4r3YJUR2W6uiZVyTfx5lNzkSOCw1SCt0FMu5fqnixSS6q
 KtxrWFp+eHjIRSq998G80ttKXvckC/HEEa+0VIJowsVHONOOr30kC8Hv/qVsBT+szA
 wCD/bRGmXFCRkebi2tSTqRndjBmKf8Qz46KtRwfxNpIE/abieR0NyBvwgNDrBMDczn
 QvOIEGoi0I7iQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=OobMKjZX
Subject: [Buildroot] [PATCH 05/14] package/cups-filters: Fix build with gcc
 16.x
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cups-filters/cups-filters.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index dcfb2e9500..74df5968b9 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -10,6 +10,9 @@ CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+,
 CUPS_FILTERS_LICENSE_FILES = COPYING
 CUPS_FILTERS_CPE_ID_VENDOR = linuxfoundation
 
+# ax_cxx_compile_stdcxx.m4 needs to be updated for gcc 16.x (C++20)
+CUPS_FILTERS_AUTORECONF = YES
+
 # 0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch
 CUPS_FILTERS_IGNORE_CVES += CVE-2023-24805
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
