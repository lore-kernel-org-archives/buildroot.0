Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B8AECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 14:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77A5C827CA;
	Fri, 26 Aug 2022 14:00:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77A5C827CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WTq9LHk6h8pF; Fri, 26 Aug 2022 14:00:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34F76813B6;
	Fri, 26 Aug 2022 14:00:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34F76813B6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C6631BF5F5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77D6E83F12
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77D6E83F12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4nb_KJbBZbWW for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 13:55:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B80D82FA9
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B80D82FA9
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:55:32 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id u9so3324139ejy.5
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=xhk5jpWqyqLvbvkU1ujKM6KYpMQCc7nLzDybcZEFQi4=;
 b=bbOSGVqaa43nnUw+d+At8bbuQ8V0f/WbAPkhNTwGolThaKZLaxF8TzaSCvgzLrFLjx
 YVDfOLkyZ36GpHby45XzALxKuuUFOqlZjBDQiIx7it2X+KY9icYNA4L5ch7DzjlQ+EkQ
 y6osFQ8ZpvN0y2NlzpO7CKRzYIZFwCr1b0aDEDIcJ3u+/vWa/2SrxQ+8JKQI30IP4IP0
 Q/L+8epyyKBHFoFdz3+hgHN6y+I9E0GOh/PMV7uuUxNZ5RzLKGbl3mwDugw/ZxU0/LBF
 /lp+Zvjg04AiNGJxVSdL2BDhdggqydXvrcQVF0EHSqXxLuwFUVp0oRf3+gwdjlNjVPvR
 RZ7g==
X-Gm-Message-State: ACgBeo1Mu0oIt9lRjsjAdXQFmS3ZjS2wno5kZ7bBuvl9eIz7VnxumWVp
 rTKkmluodItmK44zm1uEaFxW7SHxKQROdYB+
X-Google-Smtp-Source: AA6agR5KbkoHtol1aSBtAyR0Urgx78wevcOj3BjabJQ9KjHuXGxRFDLhU+WpAVeIva0secM0HdgzoQ==
X-Received: by 2002:a17:906:b2d4:b0:731:4594:8ba1 with SMTP id
 cf20-20020a170906b2d400b0073145948ba1mr5557464ejb.288.1661522130300; 
 Fri, 26 Aug 2022 06:55:30 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b00446bf462203sm1347928edh.1.2022.08.26.06.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 06:55:29 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 15:54:58 +0200
Message-Id: <20220826135503.20612-25-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826135503.20612-1-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=xhk5jpWqyqLvbvkU1ujKM6KYpMQCc7nLzDybcZEFQi4=;
 b=CQoHOEDn7humOhz9MWnuJdPOR70Ch3KwMpZHjynOw7oTY1n+G2smeQu3vGz0uZ5Oit
 WChSfvBHjeagyr+xc5C2aaczzkgmwFkALlqZhQjOhCaRjbzt1/Q2jzzoEftM+GLrTpqH
 TWEEN/qg2Xz4lxZh0Ab2z/Nz7nLrEMaN4TMnl8hYVhT6NsTEXcKRHKwjPCo5RM0913d8
 1LW9KY60dTE/sWEHt172Ti0BbPZotSssT+6xscRAxH7+r6zawGu2sFc2R8mbu19l4vO1
 VIDHMch3ZlxnlM7ZlRon9lpcuTurt8D+TfYoKLK/jfzxhoTAFF6nKHoEeSpKTBem8HRF
 Ea0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CQoHOEDn
Subject: [Buildroot] [PATCH v4 24/29] package/qt6/qt6base: add support for
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
