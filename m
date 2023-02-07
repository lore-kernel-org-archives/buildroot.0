Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72A8C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B70181E96;
	Tue,  7 Feb 2023 17:19:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B70181E96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9A9lJkq6BOBd; Tue,  7 Feb 2023 17:19:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94BAE813A2;
	Tue,  7 Feb 2023 17:19:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94BAE813A2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 65B9D1BF95C
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4020B40A68
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4020B40A68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NLmHnRuCYY3j for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:17:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40FA440120
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 40FA440120
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:17:36 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id g6so6290934wrv.1
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 09:17:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+in/pJMMsTvzZI+nrYKuTsPyvPD8XzJjqcUhmgGSO+E=;
 b=PPom9zcgVy9rp8g33Nt6cMvW7C0e0NKL08CQI+mu9HmmDNo8j5OZm1M41lKX13ScDB
 JcBIgzE9owUq2jXhpGsqb5ssuT+oaIw3NJpP1woyJaIUfRIHoaZ00pp16rBIj/FJUXLB
 eRpXDZkjLNNAEm392QOHF3vxWH6U5T219aCshLSZQJuGqt7/BZ4jLQMfWtRed/LHW/Ud
 SZQrSOPoPodhp+kijlW78Xmlt5w4YTJ57/qbSkjQnyzKcTdHOY4dW61BZwxZHgYNLECY
 KbqMAq6Uyf+ia9XQMtxMxtn0AHt7K859wLeUwzO50miDpu6bAyBLfplZ2gCnRIqTS0QC
 9dMA==
X-Gm-Message-State: AO0yUKWR8TJjanZeejPBLzkvw/xisVbj9QvUViV0I9CwVd9gX+ykqAKr
 stwtqzduRGPl74AqUO83b7azRrt2RllKXu31Q69mAA==
X-Google-Smtp-Source: AK7set+w3Bd24I4USScnx2Wa/mXVg0EYBZy9x8OXBSp9VcolXaVhzLyVkplLcnGmU5EFOKeQgvgMcg==
X-Received: by 2002:a5d:4a12:0:b0:2c3:c647:a520 with SMTP id
 m18-20020a5d4a12000000b002c3c647a520mr3898287wrq.36.1675790255374; 
 Tue, 07 Feb 2023 09:17:35 -0800 (PST)
Received: from angeloc.wifiguest.local (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 q16-20020adff950000000b002bff574a250sm11708801wrr.2.2023.02.07.09.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 09:17:34 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 18:17:14 +0100
Message-Id: <20230207171721.2973997-7-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207171721.2973997-1-angelo@amarulasolutions.com>
References: <20230207171721.2973997-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+in/pJMMsTvzZI+nrYKuTsPyvPD8XzJjqcUhmgGSO+E=;
 b=WOJEDhATZcifEmDHPppHO2bLjIlibpe38I5kK8wWj3O1c8WgjmHm8WEOnAU1XR9r8d
 s+C04hmbZmMcgzB75PUhWWR8sHgfJOrx5wS0XC6ViEVNpoxOfKSp4RUpirZigK1NrSkA
 DEkUVlIuxjr+ep1jzjm8OQz26zuKuusTmHPBQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=WOJEDhAT
Subject: [Buildroot] [PATCH v6 06/13] package/qt6/qt6base: add opengl support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: jesseevg@gmail.com, Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
v6:
* Moving eglfs backend selection here (Thomas P.)

 package/qt6/Config.in          |  5 ++++
 package/qt6/qt6base/Config.in  | 49 +++++++++++++++++++++++++++++++++-
 package/qt6/qt6base/qt6base.mk | 17 ++++++++++++
 3 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index b0cc008df5..655fa8392a 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -12,6 +12,11 @@ config BR2_PACKAGE_QT6_ARCH_SUPPORTS
 	default y if BR2_sparc64
 	depends on BR2_USE_MMU
 
+config BR2_PACKAGE_QT6_GL_SUPPORTS
+	bool
+	default y
+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
+
 comment "qt6 needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 8, host gcc >= 8"
 	depends on !BR2_PACKAGE_QT5
 	depends on BR2_PACKAGE_QT6_ARCH_SUPPORTS
diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 0f7e936162..a33ffcd511 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -36,7 +36,8 @@ config BR2_PACKAGE_QT6BASE_GUI
 	# At least one graphic backend must be enabled, so enable
 	# linuxfb if nothing is enabled.
 	select BR2_PACKAGE_QT6BASE_LINUXFB if \
-	       !BR2_PACKAGE_QT6BASE_XCB
+	       !BR2_PACKAGE_QT6BASE_XCB && \
+	       !BR2_PACKAGE_QT6BASE_EGLFS
 	help
 	  This option enables the Qt6Gui library.
 
@@ -59,6 +60,52 @@ config BR2_PACKAGE_QT6BASE_XCB
 comment "X.org XCB backend available if X.org is enabled"
 	depends on !BR2_PACKAGE_XORG7
 
+config BR2_PACKAGE_QT6BASE_OPENGL
+	bool "OpenGL support"
+	depends on BR2_PACKAGE_QT6_GL_SUPPORTS
+	help
+	  This option enables OpenGL support.
+
+comment "OpenGL support needs an OpenGL-capable backend"
+	depends on !BR2_PACKAGE_QT6_GL_SUPPORTS
+
+if BR2_PACKAGE_QT6BASE_OPENGL
+
+choice
+	prompt "OpenGL API"
+	help
+	  Select OpenGL API.
+
+config BR2_PACKAGE_QT6BASE_OPENGL_DESKTOP
+	bool "Desktop OpenGL"
+	depends on BR2_PACKAGE_HAS_LIBGL
+	help
+	  Use desktop OpenGL.
+
+config BR2_PACKAGE_QT6BASE_OPENGL_ES2
+	bool "OpenGL ES 2.0+"
+	depends on BR2_PACKAGE_HAS_LIBGLES
+	help
+	  Use OpenGL ES 2.0 and later versions.
+
+endchoice
+
+config BR2_PACKAGE_QT6BASE_OPENGL_LIB
+	bool "opengl module"
+	select BR2_PACKAGE_QT6BASE_WIDGETS
+	help
+	  This option enables the Qt6OpenGL library. This library
+	  includes OpenGL support classes provided to ease porting
+	  from Qt 4.x.
+
+config BR2_PACKAGE_QT6BASE_EGLFS
+	bool "eglfs support"
+	default y
+	depends on BR2_PACKAGE_HAS_LIBGBM
+	select BR2_PACKAGE_QT6BASE_OPENGL
+
+endif
+
 config BR2_PACKAGE_QT6BASE_FONTCONFIG
 	bool "fontconfig support"
 	select BR2_PACKAGE_FONTCONFIG
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index f936d19c68..e9a3396fb6 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -228,6 +228,23 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_widgets=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_EGLFS),y)
+QT6BASE_CONF_OPTS += -DFEATURE_egl=ON -DFEATURE_eglfs=ON
+QT6BASE_DEPENDENCIES += libegl
+else
+QT6BASE_CONF_OPTS += -DFEATURE_eglfs=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_OPENGL_DESKTOP),y)
+QT6BASE_CONF_OPTS += -DFEATURE_opengl=ON -DFEATURE_opengl_desktop=ON
+QT6BASE_DEPENDENCIES += libgl
+else ifeq ($(BR2_PACKAGE_QT6BASE_OPENGL_ES2),y)
+QT6BASE_CONF_OPTS += -DFEATURE_opengl=ON -DFEATURE_opengles2=ON
+QT6BASE_DEPENDENCIES += libgles
+else
+QT6BASE_CONF_OPTS += -DFEATURE_opengl=OFF -DINPUT_opengl=no
+endif
+
 else
 QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
 endif
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
