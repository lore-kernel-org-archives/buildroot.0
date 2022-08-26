Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77C2ECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 12:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79A8340503;
	Fri, 26 Aug 2022 12:57:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79A8340503
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G5AEEmPUb-26; Fri, 26 Aug 2022 12:57:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5183540FDA;
	Fri, 26 Aug 2022 12:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5183540FDA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C7EDA1BF27E
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B024583EEC
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B024583EEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xyIG6ADGJgn0 for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 12:53:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEE2783EE9
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AEE2783EE9
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 12:53:21 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id og21so3010823ejc.2
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 05:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=xhk5jpWqyqLvbvkU1ujKM6KYpMQCc7nLzDybcZEFQi4=;
 b=N2q+jU0zW7bBISUdxgF/5UidQxeUfAA4wIc3GnD4Q2Zf8VPQ8Y2/HurQUIPnWsWsIn
 olGBXHuNnzS8MCDIEc2yoR3z27W8vhg8tuuSPKv58Jv0lHTXKF7VJErKZspnU7TmyO+8
 ANmaLNppEH9NIayOUa1MFZ/MW+h4vrj+DL2kDoqnW+Lfk72Bod7F6OIJEeAVDzLWyvya
 icDSef8MEm8/rN4Vku28KPAkZgGZTsJDbZ7dsbcDnn9p+4Hqyv9mLpnMUkYsVYI44McJ
 e9qOxPBim9EspDlsOulDzRRKxAFv7NTt+76i4phxw2MXOeOCs3s29bt9MGTIfp6ZccLd
 OcyA==
X-Gm-Message-State: ACgBeo3rmsSD6YWiUo87at57xtHcC3eZTLGXDbmthEZak8mgVVDCvsuD
 Y6m71azP1QLeVs0RM3XfDDWZQbWchepi3PSd
X-Google-Smtp-Source: AA6agR6RGdP/69wsb2dOFg8WplpAOngPQhLZSul1jKLj3cKVPi9g6iCmpDUiLIYMPM0TK+FIphCllA==
X-Received: by 2002:a17:907:2c47:b0:73c:6312:a4e0 with SMTP id
 hf7-20020a1709072c4700b0073c6312a4e0mr5485755ejc.72.1661518400770; 
 Fri, 26 Aug 2022 05:53:20 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1709064d8200b0073923a68974sm829573eju.206.2022.08.26.05.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:53:20 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 14:52:47 +0200
Message-Id: <20220826125252.16782-25-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125252.16782-1-jesseevg@gmail.com>
References: <20220826125252.16782-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=xhk5jpWqyqLvbvkU1ujKM6KYpMQCc7nLzDybcZEFQi4=;
 b=d3SbfKCMCsUmebHsnh8TRNeJfQ0XZOoA9gIN3dnzVU+Mxwhh0JUhOZoM8xbgFSMfZo
 97AYEKhFFuTRFgYPaB2ZHgxwZ5NhOpjKsBeKcL2+vXkFVjqOd5yKHk09FdWb7NZCIlZz
 BgVZ0HCgNkhI3t+1gpMhfPPyhmslBwKuhP/S1sSe6NJ2EvR0MGBX/3zVx6XHd1ekiNYc
 w+Urk3ZGHU0gh5DO5zP9BlGk5oDeEcxdkGtIglhHe5NM5mnfI6V8IbsQyg72T2y7JBJ5
 G2Z9x0U/GYk28weH0o0TOJECk/Cx9TZJTzhewaCvZQqymfDt3GZ+HmkqwTcGcCZZoGrS
 zYPQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=d3SbfKCM
Subject: [Buildroot] [PATCH v3 24/29] package/qt6/qt6base: add support for
 gui module widgets/opengl/graphics backends
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a rather large patch as most of these options interact with each
other one way or another, so it's very difficult to split it much
further into sensible patches that still work

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 package/qt6/Config.in          |  5 ++
 package/qt6/qt6base/Config.in  | 98 ++++++++++++++++++++++++++++++++++
 package/qt6/qt6base/qt6base.mk | 84 +++++++++++++++++++++++++++++
 3 files changed, 187 insertions(+)

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 4b2b9a1174..32f32eb162 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -12,6 +12,11 @@ config BR2_PACKAGE_QT6_ARCH_SUPPORTS
 	default y if BR2_sparc64
 	depends on BR2_USE_MMU
 
+config BR2_PACKAGE_QT6_GL_AVAILABLE
+	bool
+	default y
+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
+
 comment "qt6 needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 8, host gcc >= 8"
 	depends on !BR2_PACKAGE_QT5
 	depends on BR2_PACKAGE_QT6_ARCH_SUPPORTS
diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 9533076f54..52c1ba1421 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -43,11 +43,109 @@ config BR2_PACKAGE_QT6BASE_DBUS
 config BR2_PACKAGE_QT6BASE_GUI
 	bool "gui module"
 	select BR2_PACKAGE_FREETYPE
+	# At least one graphic backend must be enabled, so enable
+	# linuxfb if nothing is enabled.
+	select BR2_PACKAGE_QT6BASE_LINUXFB if \
+	       !BR2_PACKAGE_QT6BASE_DIRECTFB && \
+	       !BR2_PACKAGE_QT6BASE_XCB && \
+	       !BR2_PACKAGE_QT6BASE_EGLFS
 	help
 	  This option enables the Qt6Gui library.
 
 if BR2_PACKAGE_QT6BASE_GUI
 
+config BR2_PACKAGE_QT6BASE_WIDGETS
+	bool "widgets module"
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_QT6BASE_XCB
+	help
+	  This option enables the Qt6Widgets library.
+
+comment "OpenGL support needs an OpenGL-capable backend"
+	depends on !BR2_PACKAGE_QT6_GL_AVAILABLE
+
+config BR2_PACKAGE_QT6BASE_OPENGL
+	bool "OpenGL support"
+	depends on BR2_PACKAGE_QT6_GL_AVAILABLE
+	help
+	  This option enables OpenGL support.
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
+endif
+
+config BR2_PACKAGE_QT6BASE_LINUXFB
+	bool "linuxfb support"
+
+config BR2_PACKAGE_QT6BASE_DIRECTFB
+	bool "directfb support"
+	depends on BR2_PACKAGE_DIRECTFB
+
+comment "directfb backend available if directfb is enabled"
+	depends on !BR2_PACKAGE_DIRECTFB
+
+config BR2_PACKAGE_QT6BASE_XCB
+	bool "X.org XCB support"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_LIBXCB
+	select BR2_PACKAGE_XCB_UTIL_IMAGE
+	select BR2_PACKAGE_XCB_UTIL_KEYSYMS
+	select BR2_PACKAGE_XCB_UTIL_RENDERUTIL
+	select BR2_PACKAGE_XCB_UTIL_WM
+	select BR2_PACKAGE_LIBXKBCOMMON
+
+comment "X.org XCB backend available if X.org is enabled"
+	depends on !BR2_PACKAGE_XORG7
+
+config BR2_PACKAGE_QT6BASE_EGLFS
+	bool "eglfs support"
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_QT6_GL_AVAILABLE
+	select BR2_PACKAGE_QT6BASE_OPENGL
+
+comment "eglfs backend available if OpenGL and EGL are enabled"
+	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_QT6_GL_AVAILABLE
+
+config BR2_PACKAGE_QT6BASE_DEFAULT_QPA
+	string "Default graphical platform"
+	help
+	  Choose the default platform abstraction to use for graphical
+	  applications (e.g xcb, linuxfb, eglfs, ...). If this is
+	  empty, the default for your architecture will be used
+	  (usually this is eglfs).
+
+	  You can get a list of supported platforms by running a Qt
+	  application with the option "-platform help" on your
+	  target. You can choose a different platform at runtime with
+	  the -platform option.
+
 config BR2_PACKAGE_QT6BASE_FONTCONFIG
 	bool "fontconfig support"
 	select BR2_PACKAGE_FONTCONFIG
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 029afdd79b..c4b4876d53 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -182,10 +182,94 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_fontconfig=OFF
 endif
 
+# Uses libgbm from mesa3d
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
+QT6BASE_CONF_OPTS += -DFEATURE_gbm=ON
+QT6BASE_DEPENDENCIES += mesa3d
+else ifeq ($(BR2_PACKAGE_GCNANO_BINARIES),y)
+QT6BASE_CONF_OPTS += -DFEATURE_gbm=ON
+QT6BASE_DEPENDENCIES += gcnano-binaries
+else ifeq ($(BR2_PACKAGE_TI_SGX_LIBGBM),y)
+QT6BASE_CONF_OPTS += -DFEATURE_gbm=ON
+QT6BASE_DEPENDENCIES += ti-sgx-libgbm
+else ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL),y)
+QT6BASE_CONF_OPTS += -DFEATURE_gbm=ON
+QT6BASE_DEPENDENCIES += imx-gpu-viv
+else
+QT6BASE_CONF_OPTS += -DFEATURE_gbm=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_EGLFS),y)
+QT6BASE_CONF_OPTS += -DFEATURE_eglfs=ON
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
+# only enable gtk support if libgtk3 X11 backend is enabled
+ifeq ($(BR2_PACKAGE_LIBGTK3)$(BR2_PACKAGE_LIBGTK3_X11),yy)
+QT6BASE_CONF_OPTS += -DFEATURE_gtk3=ON
+QT6BASE_DEPENDENCIES += libgtk3
+else
+QT6BASE_CONF_OPTS += -DFEATURE_gtk3=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_WIDGETS),y)
+QT6BASE_CONF_OPTS += -DFEATURE_widgets=ON
+
+ifeq ($(BR2_PACKAGE_QT6BASE_LINUXFB),y)
+QT6BASE_CONF_OPTS += -DFEATURE_linuxfb=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_linuxfb=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_DIRECTFB),y)
+QT6BASE_CONF_OPTS += -DFEATURE_directfb=ON
+QT6BASE_DEPENDENCIES += directfb
+else
+QT6BASE_CONF_OPTS += -DFEATURE_directfb=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_XCB),y)
+QT6BASE_CONF_OPTS += \
+	-DFEATURE_xcb=ON \
+	-DFEATURE_xcb_xlib=ON \
+	-DFEATURE_xkbcommon=ON \
+	-DFEATURE_xkbcommon_x11=ON
+QT6BASE_DEPENDENCIES += \
+	libxcb \
+	xcb-util-wm \
+	xcb-util-image \
+	xcb-util-keysyms \
+	xcb-util-renderutil \
+	xlib_libX11 \
+	libxkbcommon
+QT6BASE_DEPENDENCIES += xlib_libXext
+else
+QT6BASE_CONF_OPTS += -DFEATURE_xcb=OFF
+endif
+
+else
+QT6BASE_CONF_OPTS += -DFEATURE_widgets=OFF
+endif
+
 else
 QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
 endif
 
+QT6BASE_DEFAULT_QPA = $(call qstrip,$(BR2_PACKAGE_QT6BASE_DEFAULT_QPA))
+QT6BASE_CONF_OPTS += $(if $(QT6BASE_DEFAULT_QPA),-DQT_QPA_DEFAULT_PLATFORM=$(QT6BASE_DEFAULT_QPA))
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 QT6BASE_CONF_OPTS += -DINPUT_openssl=yes
 QT6BASE_DEPENDENCIES += openssl
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
