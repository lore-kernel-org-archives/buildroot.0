Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AEDE92FCA
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 17:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8646860B64;
	Mon, 29 Dec 2025 17:57:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id olcvBxiHdh8P; Mon, 29 Dec 2025 17:57:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED54B60B21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767031031;
	bh=U6P4HEoeTErnPS5GoMk6kn1bPOB1Esui2wbztkpg1Ss=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o9I0i+s1RrUtOUAmfRUs+sTgCHv1CJn//e/2zPVzTrGlywnK5CGVGydHuBhKOS+ET
	 pxi6i/L9GhPr8xTatuh9KmzrWxr+H7Ndaaz5BZWKhhZ8nkmT0e4d55Et+rqFRAghrA
	 E0bjtLwagnFOf/PCAezjacB8W5RX3wMGa1j0HVdEMpiJZHkGTvJ+SmfNm3T+nn5ty1
	 nIkrdaxoR1ljv2/VIw7rwtOKqpEhFU1gFJ4nMtcmvuIaJJ7fe+rh/HeyGFF8st3f5y
	 swI7mDF4DwFc6gZp+mS5upQPIP4xNs5Ol0yMWmYXDOzMjWvuHfBYbpbsqLLosndN0u
	 kREVhGx9zB/zQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED54B60B21;
	Mon, 29 Dec 2025 17:57:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E412D8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24BF360B21
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:57:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x3Yuf_HQ_1xI for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 17:57:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0C38C60B0F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C38C60B0F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C38C60B0F
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:57:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 867ECA4C25F7;
 Mon, 29 Dec 2025 18:52:12 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38202)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaHPY-0000000012P-20Lu;
 Mon, 29 Dec 2025 17:52:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Romain Naour <romain.naour@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Mon, 29 Dec 2025 18:51:50 +0100
Message-ID: <20251229175158.3548903-23-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251229175158.3548903-1-bernd@kuhls.net>
References: <20251229175158.3548903-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767030732;
 bh=2Rosh1waEQOq6zah/AQ1h8681DLMmEOpRHsFxP22GjE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=QHMnp+mpdFHPG1QOQMO1SAZtmbGvHPe2l1s3AE6Z7PsumWBc8tLYJhiC8dGc/FIRn
 eRjxu2LGFtDq/iW4gamAS4g0w30Opx2qpr3NdnHgjXVTgh3WJFRCSTR0FgUxLM1rIr
 nk3oJpvPbq+2naTF01jqg2OORD9JT2Kl6XPyVVmYrFZMqCjkIvGht7gtVXOmg96Ki7
 s3bLr/hzpxpvL1MXGlLEmE8B8I+9So9JBuasC2tSLk9+djF2+Po1cdRkpACvO9MWzN
 J70VRD7tygJfvmJFzc/VQUZX54gCY6uwIFKzVwOZ+euCOoZobcSQCSIkDISLFiUWa9
 K6/iE2qGsFBNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=QHMnp+mp
Subject: [Buildroot] [PATCH v7 22/29] package/freeswitch: remove optional
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
