Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D0DC7115A
	for <buildroot@archiver.kernel.org>; Sun, 22 Jun 2025 10:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E51841C68;
	Sun, 22 Jun 2025 10:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WwH0x47BDzl5; Sun, 22 Jun 2025 10:36:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 969B8410B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 969B8410B3;
	Sun, 22 Jun 2025 10:36:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B4F8912C
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 10:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B3DA410B3
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 10:36:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ouIACALTUuJ for <buildroot@buildroot.org>;
 Sun, 22 Jun 2025 10:36:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A941E40EB4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A941E40EB4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A941E40EB4
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 10:36:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bd3.dip0.t-ipconnect.de [91.58.11.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4915EA4C1F3B;
 Sun, 22 Jun 2025 12:36:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34410)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uTI47-000000002K2-1aIV;
 Sun, 22 Jun 2025 10:36:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun, 22 Jun 2025 12:36:42 +0200
Message-Id: <20250622103642.1006429-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750588608;
 bh=bC4oq7MgAAyaXwC3tojxMDT/WqpjjHTVb15JzmMboU8=;
 h=From:To:Cc:Subject:Date:From;
 b=oCGT6rx/c7s9jTx/OomoxMZPoXTsqeQS0H8GX063Phfx7ZLD+4jeIahbkr5C/pd8m
 1HZftJlhLrweJrmmj1Yg6tYi3JJq/nHTJtek0m50AmyowJ5b7+S17IC37HcIbvrSLQ
 7i3CElYjxwtZ9XtTAmIH62qwwqexbmFcd0QRynvsTESsHMYnAXcHxVG/b9UZFW4ikc
 j1bjvXUL7QvDi7vduypwma6/JAfcyeNbOJ1Aq/gv6Cyf9HAUuTbAb9mQm8BrTsZClK
 /U4vQSsL6YKjR4O3vmZG8sDDC2gAv7sbkMyAID00TZdXIce/khaqvef4/2ugKPqbbG
 isxcCqTH1nW9g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=oCGT6rx/
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: enable OpenCV4 support
 only when dnn support was enabled
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

Fixes Kconfig warnings:

    WARNING: unmet direct dependencies detected for BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
      Depends on [n]: BR2_PACKAGE_OPENCV4 [=y] && !BR2_TOOLCHAIN_USES_UCLIBC [=n] && BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS [=n] && BR2_TOOLCHAIN_GCC_AT_LEAST_8 [=y]
      Selected by [y]:
      - BR2_PACKAGE_FREESWITCH [=y] && BR2_INSTALL_LIBSTDCPP [=y] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y] && BR2_PACKAGE_OPENCV4 [=y]

Reported-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/freeswitch/Config.in     | 6 +++---
 package/freeswitch/freeswitch.mk | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
index 4d700e549f..4282cff031 100644
--- a/package/freeswitch/Config.in
+++ b/package/freeswitch/Config.in
@@ -14,9 +14,9 @@ config BR2_PACKAGE_FREESWITCH
 	select BR2_PACKAGE_OPENCV3_LIB_HIGHGUI if BR2_PACKAGE_OPENCV3
 	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC if BR2_PACKAGE_OPENCV3
 	select BR2_PACKAGE_OPENCV3_LIB_OBJDETECT if BR2_PACKAGE_OPENCV3
-	select BR2_PACKAGE_OPENCV4_LIB_HIGHGUI if BR2_PACKAGE_OPENCV4
-	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC if BR2_PACKAGE_OPENCV4
-	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT if BR2_PACKAGE_OPENCV4
+	select BR2_PACKAGE_OPENCV4_LIB_HIGHGUI if BR2_PACKAGE_OPENCV4_LIB_DNN
+	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC if BR2_PACKAGE_OPENCV4_LIB_DNN
+	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT if BR2_PACKAGE_OPENCV4_LIB_DNN
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_SOFIA_SIP
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 02cbacab88..25b1bb452c 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -283,7 +283,7 @@ FREESWITCH_DEPENDENCIES += opencv3
 FREESWITCH_ENABLED_MODULES += applications/mod_cv
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV4),y)
+ifeq ($(BR2_PACKAGE_OPENCV4_LIB_DNN),y)
 FREESWITCH_DEPENDENCIES += opencv4
 FREESWITCH_ENABLED_MODULES += applications/mod_cv
 endif
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
