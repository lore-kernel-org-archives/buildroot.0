Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1F2E784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 07:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C510B608C8;
	Sun, 28 Dec 2025 07:52:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dHM80hnLxrUe; Sun, 28 Dec 2025 07:52:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 635E160853
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766908378;
	bh=U6P4HEoeTErnPS5GoMk6kn1bPOB1Esui2wbztkpg1Ss=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MgHG70QMloPkLr0lDelXKL2dShBUz70w1LtVsUHGdtCuomutyshQXSyyN0ZCTmj0U
	 cYgab5fNuq+GfigOxWxicUx5uoMWjDor2BNXcIzSViojSneiioAuPxGQM5AdvxnsMo
	 92gLYaLoWldlZJ60YCRLcXa+NH//WOqd2jf66vxonSm97BD2gnqda6K3bPeQEpOP/r
	 lZ/bA09Y8HegtZAenFntbYPLvWngMjPw5WJCpRi8IPx/gEzUlIejFSbzOg6GJ3JpvV
	 91nd7Jrmu067FRVL/cRx/UCP+vn9NI5sXP5h/BE4fndvL1IdhR4xRHcuTtrhC8pXM0
	 W+UItsrznW2tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 635E160853;
	Sun, 28 Dec 2025 07:52:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F347630D
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3F856086D
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:52:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sKU-ezOIFFKg for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 07:52:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CD17D606E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD17D606E9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD17D606E9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:52:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D4276A4C231E;
 Sun, 28 Dec 2025 08:48:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35324)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vZlVr-000000004ex-2SGp;
 Sun, 28 Dec 2025 07:48:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Sun, 28 Dec 2025 08:48:17 +0100
Message-ID: <20251228074822.3370464-23-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251228074822.3370464-1-bernd@kuhls.net>
References: <20251228074822.3370464-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766908118;
 bh=2Rosh1waEQOq6zah/AQ1h8681DLMmEOpRHsFxP22GjE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=l8KXJ7EgGln817nSc3EW3VxNevR86LHteOCszKZBXDoyQ/Am+JiXufYy274uXzdAN
 P5mhHGcq3/8uT9TSLnf6IbamYwYvA8aUgVq4Ll+YVPqYfSE6MIpEBo928748BZfdE4
 h7AQs1ukQRyppLfo2pEsGpA0vALsEv3/ucsMGpCP0AewxDAlvzXdrB7j29++n3XQsX
 mOA5f63t7QAk6FCeOF871d+0mIiDEf5DrE19j/S91GArBhzcqf/5x/IRbZOLA2HrVP
 AVIR3xlo4qeUOpDWkw9Th0R2jIQG1IumeFCMt1erABkRnZ4O26FRHI8/5C6xoXtivs
 Zv5kqpsMfGb3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=l8KXJ7Eg
Subject: [Buildroot] [PATCH v6 22/26] package/freeswitch: remove optional
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
