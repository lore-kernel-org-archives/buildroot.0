Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2A4CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 15:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F32842F14;
	Sat, 30 May 2026 15:58:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ctg3Ok3BzuUW; Sat, 30 May 2026 15:58:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C210C42F0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780156685;
	bh=OwaxSmBKgel7r6jyp+lHdw3Dw+9l1jrUMpxHtVx+7i8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HWCWkUd3qw0ySiHaFcXw7gdCCHiyfLoozE6Pa2AtQMZeSYKScj0ecbDtiVEw8NAgs
	 AsCYfHN2Wb/+9kn/KgxF6chM5A+0Gxik9syt7OEmuAGq5PuhmbgpB9xtb7NASD/PXG
	 x8XDBkqVyRWJoDO4oPNQfGNFVwqQ0nDNSMZDCTfLLe986+8DJk13K5/hNdz94tDJ1Q
	 TAMIdqaGKPsl45uI/M9Ly3+d35rUFbFIvDVkUydivCZpj/N0qst775z3HC8Gzv2e6M
	 bPJTBKeOUOv7Dwl4MMVqPNVLmxaIrwh66jTTeg7sWfSg6bZaOHXy04O34T2e2C95Ti
	 VQ4bqTHNsgbhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C210C42F0A;
	Sat, 30 May 2026 15:58:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D4FBB12F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB88260EAC
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:58:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jrPjYH6IS-HO for <buildroot@buildroot.org>;
 Sat, 30 May 2026 15:58:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AAD4860EA2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAD4860EA2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AAD4860EA2
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:58:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 96BFBA4C3414;
 Sat, 30 May 2026 17:58:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42626)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wTM3r-000000001Js-18mQ;
 Sat, 30 May 2026 15:57:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 May 2026 17:57:18 +0200
Message-ID: <20260530155718.657095-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260530155718.657095-1-bernd@kuhls.net>
References: <20260530155718.657095-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780156681;
 bh=mkAa1+fT+ojdUjdJTqboQUkxK5JDXK+1v/ftZ1lw8rQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Dj501czkd9jSFCjCQmDU3RO8sCEFo+GcHn78GGaUmeUfJbztRURnBmaXBcFn0D3PE
 9sB0uHRMInbFYnaWGlXEC/eFKwYxQRF4VOqkAGfyXWYDqitJUlCGPix5FHYcZoagvl
 W8BHcSMh6UWtEcbjMu6puNIgtSquwPJRZH+730peJ4VKdbsnQ1GzfECV7KyGxcJc7r
 SCDDb/Ca5+dKkkBvcAsma8hAegQK2tvZfuKBMOVtYDF0XlXhHbDDSJCKxa3BkI2Ayh
 rLJiSQcx96/9AIQ+NGN4cLQRXqGzoyCp7Z61SF9jtIzFCX06Rqzt+U7bdNKMJeJwXb
 zK9v6SOPb9v4A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Dj501czk
Subject: [Buildroot] [PATCH v2 5/5] package/stellarium: allow build with qt6
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
A qt6-based Gitlab pipeline partially passed:
https://gitlab.com/bkuhls/buildroot/-/pipelines/2563735290

The broken defconfigs are build errors in qt6base and unrelated to
Stellarium.

 package/stellarium/Config.in     | 38 ++++++++++++++++++++------------
 package/stellarium/stellarium.mk | 34 +++++++++++++++++++++-------
 2 files changed, 50 insertions(+), 22 deletions(-)

diff --git a/package/stellarium/Config.in b/package/stellarium/Config.in
index 20f32e747a..e39454c079 100644
--- a/package/stellarium/Config.in
+++ b/package/stellarium/Config.in
@@ -1,18 +1,28 @@
 config BR2_PACKAGE_STELLARIUM
 	bool "stellarium"
-	depends on BR2_PACKAGE_QT5
-	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
+	depends on BR2_PACKAGE_QT5 || BR2_PACKAGE_QT6
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_PACKAGE_QT6_GL_SUPPORTS
 	depends on BR2_PACKAGE_HAS_LIBGL # does not support OpenGL ES
-	select BR2_PACKAGE_QT5BASE_CONCURRENT
-	select BR2_PACKAGE_QT5BASE_GUI
-	select BR2_PACKAGE_QT5BASE_NETWORK
-	select BR2_PACKAGE_QT5BASE_OPENGL
-	select BR2_PACKAGE_QT5BASE_PRINTSUPPORT
-	select BR2_PACKAGE_QT5BASE_WIDGETS
-	select BR2_PACKAGE_QT5CHARTS
-	select BR2_PACKAGE_QT5LOCATION
-	select BR2_PACKAGE_QT5MULTIMEDIA
-	select BR2_PACKAGE_QT5SVG
+	select BR2_PACKAGE_QT5BASE_CONCURRENT if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_NETWORK if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_OPENGL if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_PRINTSUPPORT if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_WIDGETS if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5CHARTS if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5LOCATION if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5MULTIMEDIA if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5SVG if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT6BASE_CONCURRENT if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_GUI if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_NETWORK if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_OPENGL if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_PRINTSUPPORT if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_WIDGETS if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6CHARTS if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6MULTIMEDIA if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6POSITIONING if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6SVG if BR2_PACKAGE_QT6
 	select BR2_PACKAGE_ZLIB
 	help
 	  Stellarium is a free open source planetarium for your
@@ -21,5 +31,5 @@ config BR2_PACKAGE_STELLARIUM
 
 	  https://stellarium.org
 
-comment "stellarium needs Qt5 and an OpenGL provider"
-	depends on !BR2_PACKAGE_QT5 || !BR2_PACKAGE_HAS_LIBGL
+comment "stellarium needs Qt5/6 and an OpenGL provider"
+	depends on (!BR2_PACKAGE_QT5 && !BR2_PACKAGE_QT6) || !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index 07d4a775db..906f434935 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -23,22 +23,35 @@ endef
 STELLARIUM_POST_EXTRACT_HOOKS = STELLARIUM_COPY_EXTRA_DOWNLOADS
 
 STELLARIUM_DEPENDENCIES = \
-	qt5base \
-	qt5charts \
-	qt5location \
-	qt5multimedia \
-	qt5svg \
 	zlib
+
 STELLARIUM_CONF_OPTS = \
 	-DENABLE_MEDIA=ON \
 	-DENABLE_NLS=OFF \
 	-DENABLE_SHOWMYSKY=OFF \
 	-DENABLE_QTWEBENGINE=OFF \
-	-DENABLE_QT6=OFF \
 	-DENABLE_XLSX=OFF \
 	-DUSE_PLUGIN_TELESCOPECONTROL=OFF \
 	-DUSE_SYSTEM_ZLIB=ON
 
+ifeq ($(BR2_PACKAGE_QT5),y)
+STELLARIUM_DEPENDENCIES += \
+	qt5base \
+	qt5charts \
+	qt5location \
+	qt5multimedia \
+	qt5svg
+STELLARIUM_CONF_OPTS += -DENABLE_QT6=OFF
+else
+STELLARIUM_DEPENDENCIES += \
+	qt6base \
+	qt6charts \
+	qt6multimedia \
+	qt6positioning \
+	qt6svg
+STELLARIUM_CONF_OPTS += -DENABLE_QT6=ON
+endif
+
 ifeq ($(BR2_PACKAGE_QT5SCRIPT),y)
 STELLARIUM_DEPENDENCIES += qt5script
 STELLARIUM_CONF_OPTS += -DENABLE_SCRIPTING=ON
@@ -46,8 +59,13 @@ else
 STELLARIUM_CONF_OPTS += -DENABLE_SCRIPTING=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_GPSD)$(BR2_PACKAGE_QT5SERIALPORT),yy)
-STELLARIUM_DEPENDENCIES += gpsd qt5serialport
+ifeq ($(BR2_PACKAGE_GPSD)$(BR2_PACKAGE_QT5SERIALPORT)$(BR2_PACKAGE_QT6SERIALPORT),yy)
+STELLARIUM_DEPENDENCIES += gpsd
+ifeq ($(BR2_PACKAGE_QT5SERIALPORT),y)
+STELLARIUM_DEPENDENCIES += qt5serialport
+else
+STELLARIUM_DEPENDENCIES += qt6serialport
+endif
 STELLARIUM_CONF_OPTS += -DENABLE_GPS=ON
 else
 STELLARIUM_CONF_OPTS += -DENABLE_GPS=OFF
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
