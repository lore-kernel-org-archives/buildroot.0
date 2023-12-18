Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5957AC35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 19:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07DE641AE0;
	Mon, 18 Dec 2023 19:54:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07DE641AE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HXzLum8yJ5y5; Mon, 18 Dec 2023 19:54:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CB2C4096D;
	Mon, 18 Dec 2023 19:54:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CB2C4096D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 300C91BF3DC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 168B060F30
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:54:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 168B060F30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c5LZb1vmiaSz for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 19:54:12 +0000 (UTC)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D44F6606C0
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 19:54:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D44F6606C0
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1d3cfa8369eso5827175ad.3
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 11:54:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702929252; x=1703534052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H+eJC+15/F5+TCxnwf/+ahqe0TY9dx57oyMeUiVbD3Q=;
 b=xQFV3piEfKOGvcsKxItu2HoIYStM6UQnjJSO64cESVmfrXGSn0+jWD83O3+bwGe4xA
 Rs8EA8TS5q/roiPFq6nAB1fCioIvWXjVXhIVdtObTQaAYvy0oLoT/jadHHxcaPTVcfoX
 elaSWJPAAsYNb4MC/HgY28PTyZ4ooGTF0Z9Boq1PMECjf5jzXEu5Dnsp1o9EJMh8iF1i
 R7vXne/Vf8NpqFs2wa519lwxNYQEgFU1OxbH8rVaCCOQ3LFxnV97LquOFJygeGBwgEox
 BLhXJ54ZjGiPX5VMp2H35Su9MrIEJMcOjkc2SNrbSY/6qDE0XELf6VgqIB3EiKXC3e58
 aNTw==
X-Gm-Message-State: AOJu0YwEonJ2KPBNdYTprd9xbpa5pSuV9UC0LCjgwCoa6GQJTU2YUmW7
 55SQ7CtRHkueQTLHF8LFE45NyEauRso74MMhVIQ=
X-Google-Smtp-Source: AGHT+IG4CoWBBc+k00c20d4xtA83N4rOYji6D8Vr5WxG9gkHLDja8YGp2ZhGotdggP6XWOfI7sYSvQ==
X-Received: by 2002:a17:902:bcc4:b0:1d0:7147:ccc5 with SMTP id
 o4-20020a170902bcc400b001d07147ccc5mr7647940pls.94.1702929251543; 
 Mon, 18 Dec 2023 11:54:11 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a170902e80200b001acae9734c0sm2037283plg.266.2023.12.18.11.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 11:54:10 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 12:54:06 -0700
Message-ID: <20231218195406.553072-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218195406.553072-1-adam.duskett@amarulasolutions.com>
References: <20231218195406.553072-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702929252; x=1703534052;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H+eJC+15/F5+TCxnwf/+ahqe0TY9dx57oyMeUiVbD3Q=;
 b=pkyaelOZnj+lb+gnWoQFv+RFjcdHqFcwB6Zl7iCUvoKDFHIX7sKGCbxqT6PuZhzMgy
 ia++ls+UBhaaEPEaBpkQatplv8wEJhEJtswR5gzamcGocbcZWoqVRs2Vu9oqGXaKDIBb
 StibXZr4eyrTZAYE/r0DrdlMIA8Vkdzu0OKio=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=pkyaelOZ
Subject: [Buildroot] [PATCH v3 3/3] package/ivi-homescreen: new package
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

flutter-pi is great for small projects, but has a few shortcomings:
 - It doesn't work at all with wayland.
 - It lacks several plugins that ivi-homescreen supports.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v2 -> v3: Add the following options:
  - DLT logging
  - xdg client
  - agl client
  - ivi-shell client
  - egl transparency
  - 3d support
  - multisample
  - layer playground
  - audio players

 DEVELOPERS                                 |   1 +
 package/Config.in                          |   1 +
 package/ivi-homescreen/Config.in           | 181 +++++++++++++++
 package/ivi-homescreen/ivi-homescreen.hash |   3 +
 package/ivi-homescreen/ivi-homescreen.mk   | 252 +++++++++++++++++++++
 5 files changed, 438 insertions(+)
 create mode 100644 package/ivi-homescreen/Config.in
 create mode 100644 package/ivi-homescreen/ivi-homescreen.hash
 create mode 100644 package/ivi-homescreen/ivi-homescreen.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 688142f398..17d8d73f22 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -38,6 +38,7 @@ F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
 F:	package/itstool/
+F:	package/ivi-homescreen/
 F:	package/python-kmod/
 F:	package/python-versioneer/
 F:	package/zenity/
diff --git a/package/Config.in b/package/Config.in
index 6f6e2bb56d..3794cbab24 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -318,6 +318,7 @@ comment "Graphic applications"
 	source "package/glmark2/Config.in"
 	source "package/glslsandbox-player/Config.in"
 	source "package/gnuplot/Config.in"
+	source "package/ivi-homescreen/Config.in"
 	source "package/jhead/Config.in"
 	source "package/kmscube/Config.in"
 	source "package/libva-utils/Config.in"
diff --git a/package/ivi-homescreen/Config.in b/package/ivi-homescreen/Config.in
new file mode 100644
index 0000000000..e804bd0bd5
--- /dev/null
+++ b/package/ivi-homescreen/Config.in
@@ -0,0 +1,181 @@
+menuconfig BR2_PACKAGE_IVI_HOMESCREEN
+	bool "ivi-homescreen"
+	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_FLUTTER_ENGINE
+	select BR2_PACKAGE_HOST_FLUTTER_SDK_BIN
+	select BR2_PACKAGE_LIBXKBCOMMON
+	select BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
+	select BR2_PACKAGE_WAYLAND_UTILS
+	help
+	  Toyota's Flutter Embedder that communicates with Wayland
+	  compositors.
+	  Features:
+	  - Strongly Typed (C++)
+	  - Lightweight
+	  - Platform Channels enabled/disabled via CMake
+	  - OpenGL Texture Framework
+	  - Compositor Sub-surface/Region support
+	  - Vulkan / EGL backend support
+
+	  https://github.com/toyota-connected/ivi-homescreen
+
+if BR2_PACKAGE_IVI_HOMESCREEN
+
+config BR2_PACKAGE_IVI_HOMESCREEN_DART_VM_LOGGING
+	bool "Dart VM console redirection"
+
+config BR2_PACKAGE_IVI_HOMESCREEN_DLT
+	bool "DLT logging"
+
+comment "Clients"
+
+config BR2_PACKAGE_IVI_HOMESCREEN_XDG_CLIENT
+	bool "xdg"
+
+config BR2_PACKAGE_IVI_HOMESCREEN_AGL_CLIENT
+	bool "AGL"
+
+config BR2_PACKAGE_IVI_HOMESCREEN_IVI_SHELL
+	bool "ivi-shell"
+
+comment "EGL options"
+
+config BR2_PACKAGE_IVI_HOMESCREEN_EGL_TRANSPARENCY
+	bool "Transparency"
+	depends on BR2_PACKAGE_HAS_LIBEGL
+
+comment "Transparency support needs an EGL backend"
+	depends on !BR2_PACKAGE_HAS_LIBEGL
+
+config BR2_PACKAGE_IVI_HOMESCREEN_EGL_ENABLE_3D
+	bool "3D support"
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	help
+	  Build with EGL Stencil, Depth, and Stencil
+
+comment "3D support needs an EGL backend"
+	depends on !BR2_PACKAGE_HAS_LIBEGL
+
+config BR2_PACKAGE_IVI_HOMESCREEN_EGL_MULTISAMPLE
+	bool "Multisample support"
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	help
+	  Build with EGL Sample set to 4
+
+comment "Multisample support needs an EGL backend"
+	depends on !BR2_PACKAGE_HAS_LIBEGL
+comment "dependency-less plugins"
+
+config BR2_PACKAGE_IVI_HOMESCREEN_ACCESSIBILITY_PLUGIN
+	bool "Accessibility"
+
+config BR2_PACKAGE_IVI_HOMESCREEN_COMP_REGION_PLUGIN
+	bool "Compositor Region"
+
+config BR2_PACKAGE_IVI_HOMESCREEN_COMP_SURF_PLUGIN
+	bool "Compositor Surface"
+
+config BR2_PACKAGE_IVI_HOMESCREEN_DESKTOP_WINDOW_PLUGIN
+	bool "Desktop Window"
+
+config BR2_PACKAGE_IVI_HOMESCREEN_GO_ROUTER_PLUGIN
+	bool "Go Router"
+
+config BR2_PACKAGE_IVI_HOMESCREEN_INTEGRATION_TEST_PLUGIN
+	bool "Flutter Integration Test support"
+
+config BR2_PACKAGE_IVI_HOMESCREEN_ISOLATE_PLUGIN
+	bool "Isolate"
+
+config BR2_PACKAGE_IVI_HOMESCREEN_KEYBOARD_MANAGER_PLUGIN
+	bool "Keyboard Manager"
+
+config BR2_PACKAGE_IVI_HOMESCREEN_KEY_EVENT_PLUGIN
+	bool "Key Event"
+config BR2_PACKAGE_IVI_HOMESCREEN_LAYER_PLAYGROUND_PLUGIN
+	bool "Layer Playground"
+
+config BR2_PACKAGE_IVI_HOMESCREEN_LOGGING_PLUGIN
+	bool "Logging"
+
+config BR2_PACKAGE_IVI_HOMESCREEN_MOUSE_CURSOR_PLUGIN
+	bool "Mouse Cursor"
+
+config BR2_PACKAGE_IVI_HOMESCREEN_PACKAGE_INFO_PLUGIN
+	bool "PackageInfo"
+
+config BR2_PACKAGE_IVI_HOMESCREEN_PLATFORM_PLUGIN
+	bool "Platform"
+
+config BR2_PACKAGE_IVI_HOMESCREEN_PLATFORM_VIEWS_PLUGIN
+	bool "Platform Views"
+
+config BR2_PACKAGE_IVI_HOMESCREEN_RESTORATION_PLUGIN
+	bool "Restoration"
+
+config BR2_PACKAGE_IVI_HOMESCREEN_TEXT_INPUT_PLUGIN
+	bool "Text Input"
+
+config BR2_PACKAGE_IVI_HOMESCREEN_URL_LAUNCHER_PLUGIN
+	bool "URL Launcher"
+
+comment "plugins with external dependencies"
+config BR2_PACKAGE_IVI_HOMESCREEN_AUDIO_PLAYERS
+	bool "Audio Players"
+	select BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOCONVERT
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME
+
+config BR2_PACKAGE_IVI_HOMESCREEN_FILE_SELECTOR_PLUGIN
+	bool "File Selector"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # zenity
+	depends on BR2_USE_MMU # zenity
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # zenity
+	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+	select BR2_PACKAGE_ZENITY
+
+comment "File Selector needs an OpenGL-EGL wayland backend"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+
+config BR2_PACKAGE_IVI_HOMESCREEN_FLUTTER_SECURE_STORAGE_PLUGIN
+	bool "Flutter Secure Storage"
+	select BR2_PACKAGE_LIBSECRET
+
+config BR2_PACKAGE_IVI_HOMESCREEN_GOOGLE_SIGN_IN_PLUGIN
+	bool "Google Sign In manager"
+	select BR2_PACKAGE_LIBCURL
+
+config BR2_PACKAGE_IVI_HOMESCREEN_GSTREAMER_EGL_PLUGIN
+	bool "GStreamer"
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_EGL
+
+comment "GStreamer plugin needs an EGL backend"
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_HAS_LIBEGL
+
+config BR2_PACKAGE_IVI_HOMESCREEN_OPENGL_TEXTURE_PLUGIN
+	bool "OpenGL Texture"
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_IVI_HOMESCREEN_EGL_TEXTURE
+
+comment "OpenGL texture plugin needs an EGL backend"
+	depends on !BR2_PACKAGE_HAS_LIBEGL
+
+endif # BR2_PACKAGE_IVI_HOMESCREEN
+
+comment "flutter-auto needs flutter-engine"
+	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_FLUTTER_ENGINE
diff --git a/package/ivi-homescreen/ivi-homescreen.hash b/package/ivi-homescreen/ivi-homescreen.hash
new file mode 100644
index 0000000000..c28de3ae1f
--- /dev/null
+++ b/package/ivi-homescreen/ivi-homescreen.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  1ab2e7ab5f947482cb5529dbb6392e7e1945ceb0b593abde6b6279d7bd2fdb79  ivi-homescreen-5ab78a19e95c88cc5d6b173ab1260a211e78cf0a-br1.tar.gz
+sha256  6b96fa0a3def85caaf466caa2bd82d4ca4f22d106ff88f97a00c537c00cc714b  LICENSE
diff --git a/package/ivi-homescreen/ivi-homescreen.mk b/package/ivi-homescreen/ivi-homescreen.mk
new file mode 100644
index 0000000000..896cd566e4
--- /dev/null
+++ b/package/ivi-homescreen/ivi-homescreen.mk
@@ -0,0 +1,252 @@
+################################################################################
+#
+# ivi-homescreen
+#
+################################################################################
+
+IVI_HOMESCREEN_VERSION = 5ab78a19e95c88cc5d6b173ab1260a211e78cf0a
+IVI_HOMESCREEN_SITE = https://github.com/toyota-connected/ivi-homescreen.git
+IVI_HOMESCREEN_SITE_METHOD = git
+IVI_HOMESCREEN_LICENSE = Apache-2.0
+IVI_HOMESCREEN_LICENSE_FILES = LICENSE
+IVI_HOMESCREEN_DEPENDENCIES = \
+	host-flutter-sdk-bin \
+	flutter-engine \
+	libxkbcommon \
+	wayland \
+	wayland-protocols \
+	wayland-utils
+
+IVI_HOMESCREEN_CONF_OPTS = \
+	-DBUILD_CRASH_HANDLER=OFF \
+	-DBUILD_TEXTURE_NAVI_EGL_ROUTING=OFF \
+	-DBUILD_UNIT_TESTS=OFF \
+	-DBUILD_PLUGIN_FIREBASE_CORE=OFF \
+	-DBUILD_TEXTURE_NAVI_RENDER_EGL=OFF \
+	-DBUILD_TEXTURE_NAVI_EGL_ROUTING=OFF \
+	-DBUILD_TEXTURE_TEST_EGL=OFF
+
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_BACKEND_WAYLAND_EGL=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_BACKEND_WAYLAND_EGL=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_EGL_TRANSPARENCY),y)
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_EGL_TRANSPARENCY=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_EGL_TRANSPARENCY=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_EGL_ENABLE_3D),y)
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_EGL_ENABLE_3D=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_EGL_ENABLE_3D=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_EGL_MULTISAMPLE),y)
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_EGL_ENABLE_MULTISAMPLE=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_EGL_ENABLE_MULTISAMPLE=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),y)
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_BACKEND_WAYLAND_VULKAN=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_BACKEND_WAYLAND_VULKAN=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_BACKEND_WAYLAND_DRM=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_BACKEND_WAYLAND_DRM=OFF
+endif
+
+# Clients
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_XDG_CLIENT),y)
+IVI_HOMESCREEN_CONF_OPTS += -DENABLE_XDG_CLIENT=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DENABLE_XDG_CLIENT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_AGL_CLIENT),y)
+IVI_HOMESCREEN_CONF_OPTS += -DENABLE_AGL_CLIENT=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DENABLE_AGL_CLIENT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_IVI_SHELL),y)
+IVI_HOMESCREEN_CONF_OPTS += -DENABLE_IVI_SHELL_CLIENT=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DENABLE_IVI_SHELL_CLIENT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_DART_VM_LOGGING),y)
+IVI_HOMESCREEN_CONF_OPTS += -DENABLE_DART_VM_LOGGING=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DENABLE_DART_VM_LOGGING=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_DLT),y)
+IVI_HOMESCREEN_CONF_OPTS += -DENABLE_DLT=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DENABLE_DLT=OFF
+endif
+# dependency-less plugins
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_ACCESSIBILITY_PLUGIN),y)
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_ACCESSIBILITY=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_ACCESSIBILITY=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_COMP_REGION_PLUGIN),y)
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_COMP_REGION=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_COMP_REGION=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_COMP_SURF_PLUGIN),y)
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_COMP_SURF=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_COMP_SURF=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_DESKTOP_WINDOW_PLUGIN),y)
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_DESKTOP_WINDOW=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_DESKTOP_WINDOW=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_GO_ROUTER_PLUGIN),y)
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_GO_ROUTER=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_GO_ROUTER=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_INTEGRATION_TEST_PLUGIN),y)
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_INTEGRATION_TEST=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_INTEGRATION_TEST=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_ISOLATE_PLUGIN),y)
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_ISOLATE=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_ISOLATE=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_KEYBOARD_MANAGER_PLUGIN),y)
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_KEYBOARD_MANAGER=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_KEYBOARD_MANAGER=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_KEY_EVENT_PLUGIN),y)
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_KEY_EVENT=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_KEY_EVENT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_LAYER_PLAYGROUND_PLUGIN),y)
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_LAYER_PLAYGROUND=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_LAYER_PLAYGROUND=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_LOGGING_PLUGIN),y)
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_LOGGING=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_LOGGING=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_MOUSE_CURSOR_PLUGIN),y)
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_MOUSE_CURSOR=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_MOUSE_CURSOR=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_PACKAGE_INFO_PLUGIN),y)
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_PACKAGE_INFO=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_PACKAGE_INFO=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_PLATFORM_PLUGIN),y)
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_PLATFORM=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_PLATFORM=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_PLATFORM_VIEWS_PLUGIN),y)
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_PLATFORM_VIEWS=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_PLATFORM_VIEWS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_RESTORATION_PLUGIN),y)
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_RESTORATION=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_RESTORATION=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_TEXT_INPUT_PLUGIN),y)
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_TEXT_INPUT=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_TEXT_INPUT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_URL_LAUNCHER_PLUGIN),y)
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_URL_LAUNCHER=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_URL_LAUNCHER=OFF
+endif
+
+# "plugins with external dependencies"
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_AUDIO_PLAYERS),y)
+IVI_HOMESCREEN_DEPENDENCIES += gstreamer1 gst1-plugins-base
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_AUDIO_PLAYERS=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_AUDIO_PLAYERS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_FILE_SELECTOR_PLUGIN),y)
+IVI_HOMESCREEN_DEPENDENCIES += zenity
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_FILE_SELECTOR=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_FILE_SELECTOR=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_FLUTTER_SECURE_STORAGE_PLUGIN),y)
+IVI_HOMESCREEN_DEPENDENCIES += libsecret
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_SECURE_STORAGE=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_SECURE_STORAGE=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_GOOGLE_SIGN_IN_PLUGIN),y)
+IVI_HOMESCREEN_DEPENDENCIES += libcurl
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_GOOGLE_SIGN_IN=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_GOOGLE_SIGN_IN=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_GSTREAMER_EGL_PLUGIN),y)
+IVI_HOMESCREEN_DEPENDENCIES += ffmpeg gstreamer1 gst1-plugins-base
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_GSTREAMER_EGL=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_GSTREAMER_EGL=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_OPENGL_TEXTURE_PLUGIN),y)
+IVI_HOMESCREEN_CONF_OPTS += \
+	-DBUILD_PLUGIN_OPENGL_TEXTURE=ON \
+	-DBUILD_TEXTURE_EGL=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += \
+	-DBUILD_PLUGIN_OPENGL_TEXTURE=OFF \
+	-DBUILD_TEXTURE_EGL=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
