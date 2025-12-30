Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E7FE95A77
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 11:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB4F340862;
	Tue, 30 Dec 2025 11:48:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GXG1_sY527om; Tue, 30 Dec 2025 11:48:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 725804083C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767095308;
	bh=U6P4HEoeTErnPS5GoMk6kn1bPOB1Esui2wbztkpg1Ss=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HbfVl2Q1Er+80gjErbRDs/MrAl3hLvj3Oml+zfTAxHw3vFKoBIOsNS6q8Y8YCKX41
	 K5wJxYBzgQ1/Lcg+KxMV9mbi3qSRYqDBqDNNRSmt/g496fcdWHTY6xQGBaooVojE5h
	 SOCQI4IJNhAo7d4F1rVqfiUNvW+0/NeyYYtCaUNT+uutbxSc6zvzJzqUihSAIav5dT
	 qud3mPUaZkNrXNCc65FepetfMRQmUmEDP6HbNgQura6h5tSZLT0z1fywR0jPcVNwYZ
	 IjzQ/iVF5/buS72jnbkQ2csW3RAPr+Al1+D6YGfVB0NDdYDnLWP/M2y1nq4/pzk6rU
	 QetNNxtC9IFfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 725804083C;
	Tue, 30 Dec 2025 11:48:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 14DAF35B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED1D94083C
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:48:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dY79NZWxXxA9 for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 11:48:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E9B2940821
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9B2940821
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9B2940821
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:48:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1C9B3A4C2AA0;
 Tue, 30 Dec 2025 12:46:39 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54702)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaYBM-000000003Vt-09pC;
 Tue, 30 Dec 2025 11:46:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Romain Naour <romain.naour@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Tue, 30 Dec 2025 12:45:33 +0100
Message-ID: <20251230114545.2236640-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251230114545.2236640-1-bernd@kuhls.net>
References: <20251230114545.2236640-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767095199;
 bh=2Rosh1waEQOq6zah/AQ1h8681DLMmEOpRHsFxP22GjE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ET0mnrUFVBdm1cU0wvBSoGHvN80UdkDI4a6zIblmoupF6/0CmarggP7SjbHDLPuRq
 W11U9U120o1H1B1uRX8z1Pk8xzAWstmDTkYQWmf9GfndEw9MYZWu/YEhiKjGfVvptL
 Uq57J8Wg5ZvkJXFzC8mGbj40VZCV8MSZWHIxhMmkiv1qLFyAp1Byld/0qyYv3ScDtO
 GbJTCw+SQVkaGtTALDj+6dA8UmF5UKRf8HZIjuhvBw4+evA1e/zhEDADqBWTqhkHNK
 YCMlPgQObYCHwHI22jdXOePCXwdeWQOTHt/I5Fl/G3+KRMdiyTMw5I/nLOFEijEXyb
 +jEFY+TieZqxA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ET0mnrUF
Subject: [Buildroot] [PATCH v9 12/19] package/freeswitch: remove optional
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
