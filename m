Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5C5E92FCB
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 18:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC8B060B1E;
	Mon, 29 Dec 2025 18:00:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HEuXw3CeHY1K; Mon, 29 Dec 2025 18:00:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E54E760B69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767031244;
	bh=U6P4HEoeTErnPS5GoMk6kn1bPOB1Esui2wbztkpg1Ss=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hph8biVwYk2XlDVf7yJ4NsYcOlwjfZxNanCnyxkqTAOhhtnZZX5VLpW5quR9CiQkS
	 7RtQACbo6efcP7GGRnZG7bm3egc4TLW5EcaqY2M0H3bNdpskGC0l4oBHFFm3dpiU10
	 95agWsa2v2xPdsAYU/GxFpQ3vXAuEKz6tpjiq0+1zFJ263+HE/ds9b1oUN9q8hlgwS
	 DhxJ/4EdV5TPxH42EWwjeMrom0K8h6Wrx667KJtJd0i5TSdJru4LmqnWRaLy0HvPi+
	 ZcwlUlUCvePxvaNzxu5n9whTgrWPQ2q76TnQCUWKZ56jbEECDBDikOfeV8bPdrlzcC
	 Wb0ZrqdMDDgRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E54E760B69;
	Mon, 29 Dec 2025 18:00:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B4EA7177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A777F81A92
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:00:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q8btRPW7oJAa for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 18:00:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 994C1809EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 994C1809EB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 994C1809EB
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:00:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 44762A4C2594;
 Mon, 29 Dec 2025 18:59:45 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53686)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaHWw-000000002P5-22p3;
 Mon, 29 Dec 2025 17:59:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Romain Naour <romain.naour@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Mon, 29 Dec 2025 18:59:30 +0100
Message-ID: <20251229175938.3549882-23-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251229175938.3549882-1-bernd@kuhls.net>
References: <20251229175938.3549882-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767031185;
 bh=2Rosh1waEQOq6zah/AQ1h8681DLMmEOpRHsFxP22GjE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=fu8LbH82cEHJU7QbXoPCPJh/p42fcbslI8aPy9M1K4SgftrdTJ8C9wZQynQqcy0NY
 JPQ3cB0wGIPuQcNJW/ofqoXRFkwsrt2Cvx6SSdC+YS6Y1iIDC5FWk02znfciWIBxIN
 zmPzVDtoYn1TLmVcr9VOwFZmFPyR4BuixwFEM1OwpUkQGTomWlrBkVxcBBpzd5s0kx
 XIVUNrBjVLVeTP3yUmzMdcSIV69RTdj8kW8ICOUyKn43Ij5M6omQP+RSJc8zZ6RzAo
 0tJ7qgBiij6VKhWfJVtVuLMlq0/unOadpLvacK2+Tfp5lWShHdryrpeliO5hvWqXTF
 n61AAcrijnGfg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=fu8LbH82
Subject: [Buildroot] [PATCH v8 22/29] package/freeswitch: remove optional
 dependency to opencv3
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

OpenCV3 is unmaintained and will be removed from buildroot.

Select needed OpenCV4 modules in Config.in and adjust freeswitch.mk.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/freeswitch/Config.in     | 6 +++---
 package/freeswitch/freeswitch.mk | 7 +------
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
index 80d18e064d..f636024f32 100644
--- a/package/freeswitch/Config.in
+++ b/package/freeswitch/Config.in
@@ -11,9 +11,9 @@ config BR2_PACKAGE_FREESWITCH
 	select BR2_PACKAGE_JPEG
 	# src/mod/applications/mod_cv/mod_cv.cpp includes
 	# highgui.h, imgproc.hpp & objdetect.hpp
-	select BR2_PACKAGE_OPENCV3_LIB_HIGHGUI if BR2_PACKAGE_OPENCV3
-	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC if BR2_PACKAGE_OPENCV3
-	select BR2_PACKAGE_OPENCV3_LIB_OBJDETECT if BR2_PACKAGE_OPENCV3
+	select BR2_PACKAGE_OPENCV4_LIB_HIGHGUI if BR2_PACKAGE_OPENCV4
+	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC if BR2_PACKAGE_OPENCV4
+	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT if BR2_PACKAGE_OPENCV4
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_SOFIA_SIP
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 58ebc22298..81a25b3fe2 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -278,12 +278,7 @@ FREESWITCH_DEPENDENCIES += libsoundtouch
 FREESWITCH_ENABLED_MODULES += applications/mod_soundtouch
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV3),y)
-FREESWITCH_DEPENDENCIES += opencv3
-FREESWITCH_ENABLED_MODULES += applications/mod_cv
-endif
-
-ifeq ($(BR2_PACKAGE_OPENCV4_LIB_HIGHGUI)$(BR2_PACKAGE_OPENCV4_LIB_IMGPROC)$(BR2_PACKAGE_OPENCV4_LIB_OBJDETECT),yyy)
+ifeq ($(BR2_PACKAGE_OPENCV4),y)
 FREESWITCH_DEPENDENCIES += opencv4
 FREESWITCH_ENABLED_MODULES += applications/mod_cv
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
