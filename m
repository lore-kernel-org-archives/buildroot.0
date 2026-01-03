Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B326C2A061
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 22:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D44804054F;
	Sat,  3 Jan 2026 22:43:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1x3QddK_GE5e; Sat,  3 Jan 2026 22:43:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEF2440577
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767480228;
	bh=hlLCgkMeO1vpQX2q3CdV3JgOU4Ka6tA888Yx2h9E8uA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DzRzPlBZmDDmPyCcGqv+Fh+fXlyJkEEdEXlGFaqgpQBFCM77lqH29Mint1JMkWMTS
	 KtgwOP0aWFOnOiEoOSm4dvS6GtEm1SoxRnBfhUPhSTuXITiNvismMFyeyfhSb8Ml8O
	 CRCkj8iSK8f3VioJzbAhw6y46jvjnTs1qBs9tmsy+cG81Xudc2pdTRnKef8smApFsh
	 hgGieph4o7pcBwf6jgjc4EBjZ9uinbq+GUPGQywSxMAQ8Hu81EU1Y8I3EGJZjUkshH
	 ODSfUcsTJL6sTm1nQIOguEw+4YTvYO2BLntUjF+Mp3syZICV8zuml9QAREFyLIHnSa
	 1t49bHk2vrO9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEF2440577;
	Sat,  3 Jan 2026 22:43:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CAB5B25B
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE1534057D
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wu9ULQd0mKkn for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 22:43:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ADAC240577
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADAC240577
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ADAC240577
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 17868C1C95A;
 Sat,  3 Jan 2026 22:43:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F24E16072B;
 Sat,  3 Jan 2026 22:43:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3C893113B06CC; Sat,  3 Jan 2026 23:43:43 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>
Date: Sat,  3 Jan 2026 23:43:18 +0100
Message-ID: <20260103224330.2933161-5-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260103224330.2933161-1-thomas.petazzoni@bootlin.com>
References: <20260103224330.2933161-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767480223; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=ICJ8cSxj+IVquWLtlj3zhlvS/hOH009I9GrlVOGzqLA=;
 b=O1ibcCGr8ceLykdIf1HFIq2/bxR+nbuilotOtpSjLIPq+1s4iRLZjjlXgWkZTDi93vMHHW
 DRkYoiYp9frTmIL4bwddAlY7rHmDMRJ9vfi8hbX/QcX71mjA3HwIgQJWmgH+bDt1b1KcSL
 8loPc7DIRmDUBGqvNgDvNoxY5mw9r8KOrhZ+zsteyBuT+3YG4Dbtnak5TH2CcRm2oalA43
 YARoejNcs54+IVgYp/PMRwp+T0SMSWTGklsdQGpvtcWloRRttS77I1hebbRMtFxy4ztgq/
 vR2yDancvqrADtbIjM+lIFiOS5bGRIQ8hTTgm1Fy251t0iZCFjksbh3F28y9Jw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=O1ibcCGr
Subject: [Buildroot] [PATCH 05/11] package/freeswitch: fixup dependency on
 OpenCV4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The recent changes in freeswitch following the removal of OpenCV 3.x
in commit
a6db6af9ffa7134b1f132dfd07dd53e7138e86b6 ("package/freeswitch: remove
optional dependency to opencv3") caused some invalid dependencies.

Indeed, the new logic selects BR2_PACKAGE_OPENCV4_LIB_OBJDETECT as
soon as BR2_PACKAGE_OPENCV4 is enabled, without worrying about the
dependencies of BR2_PACKAGE_OPENCV4_LIB_OBJDETECT.

This causes the following Kconfig warning:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
  Depends on [n]: BR2_PACKAGE_OPENCV4 [=y] && !BR2_TOOLCHAIN_USES_UCLIBC [=n] && BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_8 [=n]
  Selected by [y]:
  - BR2_PACKAGE_FREESWITCH [=y] && BR2_INSTALL_LIBSTDCPP [=y] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y] && BR2_PACKAGE_OPENCV4 [=y]

Since freeswitch as no visible sub-options to select extra features
and we wanted to keep it this way, we introduce a hidden sub-option
that informs freeswitch.mk whether OpenCV 4 support is usable. It
makes it easier to express the dependencies that are needed for this
OpenCV 4 to be usable.

Fixes: a6db6af9ffa7134b1f132dfd07dd53e7138e86b6 ("package/freeswitch: remove optional dependency to opencv3")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freeswitch/Config.in     | 18 +++++++++++++-----
 package/freeswitch/freeswitch.mk |  2 +-
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
index f636024f32..3633a29903 100644
--- a/package/freeswitch/Config.in
+++ b/package/freeswitch/Config.in
@@ -9,11 +9,6 @@ config BR2_PACKAGE_FREESWITCH
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_JPEG
-	# src/mod/applications/mod_cv/mod_cv.cpp includes
-	# highgui.h, imgproc.hpp & objdetect.hpp
-	select BR2_PACKAGE_OPENCV4_LIB_HIGHGUI if BR2_PACKAGE_OPENCV4
-	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC if BR2_PACKAGE_OPENCV4
-	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT if BR2_PACKAGE_OPENCV4
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_SOFIA_SIP
@@ -33,6 +28,19 @@ config BR2_PACKAGE_FREESWITCH
 
 	  https://www.freeswitch.org
 
+config BR2_PACKAGE_FREESWITCH_OPENCV4
+	bool
+	default y
+	depends on BR2_PACKAGE_OPENCV4
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # objdetect
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # objdetect
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # objdetect
+	# src/mod/applications/mod_cv/mod_cv.cpp includes
+	# highgui.h, imgproc.hpp & objdetect.hpp
+	select BR2_PACKAGE_OPENCV4_LIB_HIGHGUI
+	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
+
 comment "freeswitch needs a toolchain w/ C++, dynamic library, threads, wchar"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS \
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 81a25b3fe2..7e5dc3d872 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -278,7 +278,7 @@ FREESWITCH_DEPENDENCIES += libsoundtouch
 FREESWITCH_ENABLED_MODULES += applications/mod_soundtouch
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV4),y)
+ifeq ($(BR2_PACKAGE_FREESWITCH_OPENCV4),y)
 FREESWITCH_DEPENDENCIES += opencv4
 FREESWITCH_ENABLED_MODULES += applications/mod_cv
 endif
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
