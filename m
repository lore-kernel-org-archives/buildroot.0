Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E7BC636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 14:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7767260FB0;
	Tue,  7 Feb 2023 14:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7767260FB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RpFwxrkpAiDy; Tue,  7 Feb 2023 14:31:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A507260B6C;
	Tue,  7 Feb 2023 14:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A507260B6C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 65DC11BF2CA
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 14:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FB7681E44
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 14:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FB7681E44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KZmvipHHS7Mq for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 14:30:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BFDE81759
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0BFDE81759
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 14:30:16 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id u10so8110849wmj.3
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 06:30:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O4YXjCE8eHpY//Ff3nGfnBtEMtK8JbvLsSB6L9xAvrE=;
 b=646URejqKGzO+NinnVz48kb5S1VoI12NhsAJo5wctFy60gsEU690dEPQK+3bUcit7k
 paXhnkeAvXiKFq/L4NJnzPW20/p4fHEXWptHJRIBNV6rJgrG6DjGhSlVdbffkkdwSoZI
 VqGGy1up8Y9e+9Upk97ZYFMOuPMrd7FyVBa8LqE4gGQeLkEURAyD+uuNPpHogROJQSOl
 BZn6Ow6jtWe6WKoXgrik1EoFnFrBfm2W8/jV184uC5/WbUZxGMCIM7gdaRw1M1SHMibj
 NzI6CMPDxLfpTvNla1fKaQNIIuJDPeUBC6Q75VDrGtPqasB4YGjsgRS2XDCEkX+eLKB3
 bffA==
X-Gm-Message-State: AO0yUKWmga+OOY71Q/buWDaD8aoLqNNFydiwTI/TixBI3/kM1vVEwTzN
 yOB42r51vrZvkDNRLiiHDaXEEex//KqbheH/T2eLlg==
X-Google-Smtp-Source: AK7set/wcfInXWKVXjlOczntsjxkoIwR1qdVrc2elUdGR9qxXYi0+IlcCKhBoWB35QKsUNj7e1oDQg==
X-Received: by 2002:a05:600c:4d92:b0:3df:dea7:8e3 with SMTP id
 v18-20020a05600c4d9200b003dfdea708e3mr3459538wmp.21.1675780216149; 
 Tue, 07 Feb 2023 06:30:16 -0800 (PST)
Received: from angeloc.wifiguest.local (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 l16-20020a1c7910000000b003dc1d668866sm18537074wme.10.2023.02.07.06.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 06:30:15 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 15:30:00 +0100
Message-Id: <20230207143006.2681335-7-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207143006.2681335-1-angelo@amarulasolutions.com>
References: <20230207143006.2681335-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O4YXjCE8eHpY//Ff3nGfnBtEMtK8JbvLsSB6L9xAvrE=;
 b=O26VC0z3iwm0s9ji6VPp6VJz6XO/zfXETRBIB3SLtUdgRjDvCHM2C7UxXyNcvDmE7Y
 gXSDIG3IXZRlX7yaq+K/k28o/HhdPwZ20iKdDadt+/QWDASbQjLIJosjnk12TE031h2Z
 mDn9ea8ry56Fqbm5Kct0whdaRPwIO8psJhUig=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=O26VC0z3
Subject: [Buildroot] [PATCH v5 06/12] package/qt6/qt6base: add opengl support
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
 package/qt6/Config.in          |  5 ++++
 package/qt6/qt6base/Config.in  | 46 ++++++++++++++++++++++++++++++++++
 package/qt6/qt6base/qt6base.mk | 17 +++++++++++++
 3 files changed, 68 insertions(+)

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
index 0332783500..732b81abe3 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -61,6 +61,52 @@ config BR2_PACKAGE_QT6BASE_XCB
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
index bc2202fb2d..bfa44ae74c 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -231,6 +231,23 @@ else
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
