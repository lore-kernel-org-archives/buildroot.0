Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D3FCCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 18:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE33283E98;
	Fri,  1 May 2026 18:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nTChO5eG4SG0; Fri,  1 May 2026 18:35:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6A4B85826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777660518;
	bh=/9o8ZA7Ca1RqhPMfcKAmS+8RsLQLVCpMLK83pjHyhF0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RiJIkKIgyCQQ3LzUFAaCjLCcKB0nAkY6gA7tAY6/n5Dg1AhFrK2UbJ+gEk32R1/UE
	 1iOkttrPp/Yrk3kUZvK8oZvcVGlBBHgWcuHpeDEvZOw6G2YQLFri3u/qaz/KNoHyBj
	 yg3MGIwQEzCI/JjZPUR0ipjHsxpIRGdevmdTFYJslF7Cig9BcJgNsCNwCtQN/pv3TV
	 l5J3dRTEI5aiqau/RXSuH+02Z+/4zp5jsy4RPRnP9VRy4ywTkkiqHK72i4jr7UyxYR
	 fT0Dy4fra/toiZu5UB4heaEd+e7MOGT1Jp3JG/J7F1OGUE5ADzvBypCKleAgPyKXC7
	 Bp1aEkNuRCTyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6A4B85826;
	Fri,  1 May 2026 18:35:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C8F84293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 18:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2132983E7F
 for <buildroot@buildroot.org>; Fri,  1 May 2026 18:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KBPGKWvWE7SF for <buildroot@buildroot.org>;
 Fri,  1 May 2026 18:35:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 031F683E7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 031F683E7C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 031F683E7C
 for <buildroot@buildroot.org>; Fri,  1 May 2026 18:35:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CA6D2A4C022A;
 Fri,  1 May 2026 20:35:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55110)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIsgv-000000000Qz-44IC;
 Fri, 01 May 2026 18:34:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  1 May 2026 20:34:21 +0200
Message-ID: <20260501183421.2459291-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501183421.2459291-1-bernd@kuhls.net>
References: <20260501183421.2459291-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777660501;
 bh=w0k6X3lDs1y8taMfwjzCbhcRSaV9aPChki33hIDgA24=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=FwGKQzR7D0sahR5WvA9fMqo98Fer0gAYnivVcwXKhHZmBTaHI1iwwKPVFr7s5y7me
 p5z340oTpJzvthPZ5At3kxDMf/lr96S/vjO9QEgXZ3mgZPvJT1yXM1I0/CcXkFTAM5
 c77+tYZjje9YXHpfOJ5QuzQZ1KHqHa7azqyYPp55ebR38vxsm5oZQNK7ooWtv2qeci
 RkplgpR3/T2tGf0uUVusV1DNydDESwhdTDu2kXNE+oXQ5d+x+wmH+xFwLU3FyzqGAv
 QAnqgxKfHCnDm8CqOgAE4ZJReeR6ZZktK8SzvZAYyam/2CioDXTSYNsqLv09BEyJFf
 T30YR6zG2awRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=FwGKQzR7
Subject: [Buildroot] [PATCH 5/5] package/stellarium: allow build with qt6
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
 package/stellarium/Config.in     | 38 ++++++++++++++++++++------------
 package/stellarium/stellarium.mk | 28 ++++++++++++++++++-----
 2 files changed, 47 insertions(+), 19 deletions(-)

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
index 07d4a775db..37f1499ad0 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -23,18 +23,31 @@ endef
 STELLARIUM_POST_EXTRACT_HOOKS = STELLARIUM_COPY_EXTRA_DOWNLOADS
 
 STELLARIUM_DEPENDENCIES = \
+	zlib
+
+ifeq ($(BR2_PACKAGE_QT5),y)
+STELLARIUM_DEPENDENCIES += \
 	qt5base \
 	qt5charts \
 	qt5location \
 	qt5multimedia \
-	qt5svg \
-	zlib
+	qt5svg
+STELLARIUM_CONF_OPTS = -DENABLE_QT6=OFF
+else
+STELLARIUM_DEPENDENCIES += \
+	qt6base \
+	qt6charts \
+	qt6multimedia \
+	qt6positioning \
+	qt6svg
+STELLARIUM_CONF_OPTS = -DENABLE_QT6=ON
+endif
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
