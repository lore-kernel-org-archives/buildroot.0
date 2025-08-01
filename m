Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DB4C87FCA
	for <buildroot@archiver.kernel.org>; Fri,  1 Aug 2025 19:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8937561BC5;
	Fri,  1 Aug 2025 19:52:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WBoKR82jaIMV; Fri,  1 Aug 2025 19:52:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB81660BA2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB81660BA2;
	Fri,  1 Aug 2025 19:52:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 58E23160
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 19:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F65A400EC
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 19:51:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cdP6poQI29S6 for <buildroot@buildroot.org>;
 Fri,  1 Aug 2025 19:51:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D2CC440082
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2CC440082
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2CC440082
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 19:51:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0723.dip0.t-ipconnect.de [91.58.7.35])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 02A6FA4C2717
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 21:51:53 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49822)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uhvnE-0000000082w-2R9A
 for buildroot@buildroot.org; Fri, 01 Aug 2025 19:51:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 Aug 2025 21:51:52 +0200
Message-Id: <20250801195152.2612477-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1754077914;
 bh=TWGBVnHxvgTX4nJBzc0SmqlA9biey2DrS+I/q2Y4B48=;
 h=From:To:Subject:Date:From;
 b=UU55r4RhejLAdD40eMsWt+0CaCd7jS4zRKtJa9f1NSf8LhsDcl+ydhn+HRwehbs+7
 lz30VwOrrGJGSDi+QgoCKUGlDhH/bCetwg9IezB141gs90wqacAjfYccBeH/SCsRr7
 wbC6qDwzjdBaXq8h4QAIR93aApz3hBL8aP5YnH8ZIBLhsQYTXWQKvAtustX7tzkZv2
 GiHAA/rTH5Tnrc34wg9AOQSW+kCP/CgriKEb6GI2ZaUZH/Zy7/gMhog54UjRokNMZl
 GC86ALsIR/EStsq+eppODtvB3QtV2f9JrmsySdnyFLvFeqEzkkjvdEC2XeSX8Am008
 rbpzL7AQ7hM7A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=UU55r4Rh
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{6, 12,
 15}.x series
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
 linux/linux.hash                     | 7 +++----
 package/linux-headers/Config.in.host | 6 +++---
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 8401af95e4..dd6febc25c 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,9 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  1a4be2fe6b5246aa4ac8987a8a4af34c42a8dd7d08b46ab48516bcc1befbcd83  linux-6.16.tar.xz
-sha256  d37e92bc16b962a3025df156647bdad90b2db4ff36c7a6137817fe81ef3f28a6  linux-6.15.8.tar.xz
-sha256  4811af1317f98d2cccea3c7695969a2c03a27cb02fd2d5327032dd5341842933  linux-6.12.40.tar.xz
-sha256  d6c0ec4d55b14814f55b62a0b23a2d95faf66877e48fbfb4b83523e4afdf97ba  linux-6.6.100.tar.xz
-sha256  218f25663a41e3d811e84fa1c4acec50684898b2f6d0c8c0deb531d937e466f7  linux-6.1.147.tar.xz
+sha256  e94f3af85492302f7a819441458f80bca0ad9912e5a4c83c699ff3c63c52957d  linux-6.15.9.tar.xz
+sha256  6b19a3ae99423de2416964d67251d745910277af258b4c4c63e88fd87dbf0e27  linux-6.12.41.tar.xz
+sha256  8c4ff2869736538b9b0d88ea8dbf0332b79c6ecc40a32066768a754df1fae1c0  linux-6.6.101.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  e3d0025b87278e14733cb326700f17c7cceb54d920622b0d5fcd58a88c6850c3  linux-5.15.189.tar.xz
 sha256  8d88c3977226d666554b75f480d1e6c5f4e4d2acdf2a3462840c6bac88634d13  linux-5.10.240.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 37a44c2e3c..b49eeb1e94 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -456,9 +456,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.240"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.189"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.147"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.100"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.40"	if BR2_KERNEL_HEADERS_6_12
-	default "6.15.8"	if BR2_KERNEL_HEADERS_6_15
+	default "6.6.101"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.41"	if BR2_KERNEL_HEADERS_6_12
+	default "6.15.9"	if BR2_KERNEL_HEADERS_6_15
 	default "6.16"		if BR2_KERNEL_HEADERS_6_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
