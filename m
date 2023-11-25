Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E6AC61DF4
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 01:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21BE2409B3;
	Sat, 25 Nov 2023 01:02:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21BE2409B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3CbgABVGnkbJ; Sat, 25 Nov 2023 01:02:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D07B042201;
	Sat, 25 Nov 2023 01:02:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D07B042201
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C2AA71BF29F
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 01:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BB6760B90
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 01:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BB6760B90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fbvGoPKYoChz for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 01:01:25 +0000 (UTC)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6826960AC6
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 01:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6826960AC6
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1cfa8f7c356so6320825ad.2
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 17:01:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700874084; x=1701478884;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NV/KfJXp6hMqSvXOLfn2toxA27VKahHcauIZedMNEd0=;
 b=pg9ZsKmGGTCgssohAHRA2G+GyDN4LsqVvhukHCQxmH6ktUHfeKhrWGaK4ODUDxVWTG
 hShEoIAjmvT4yLaxoraXorulKuuBNqQ93J8EyDyej/SjIY1UqUPd3PC3iGncn7Q3d6Eo
 Zc6ES9IbCO93/MiMCeAMBtRoUIXKFXtqu9zLnPTflJsZHHxxw+fnfdgZ1e7ouk/289Sc
 VzuK7FXVUY7PEwOfnfCyXBuvxjZrg8AqmkWj5p+ovxWhgnziqgLbjgMt6nf4c3LVHR9k
 Wc/GfF7C5ctnMz3Cy5moS+A/PKq0GbC6tiff4OYktYzNrTdtXko/hqaBF5prcIOHju30
 JNiQ==
X-Gm-Message-State: AOJu0YySp/Obv1wI5FV93lzsNET8fN9u2d/gLwuyPlAnfioVOFJlo71w
 h2+6FUOIFmRJgRXsJnpi2JOw8vcSvF85L9Uy6EA=
X-Google-Smtp-Source: AGHT+IFyUehre8uK/Q5cqVr2dA7e7zSjEPjp/QfzeTKn14hciSVuRrBXHB0evbho2OiT5zXLrFYWJQ==
X-Received: by 2002:a17:903:11d1:b0:1cf:66a3:16c with SMTP id
 q17-20020a17090311d100b001cf66a3016cmr4772070plh.21.1700874084309; 
 Fri, 24 Nov 2023 17:01:24 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.200.138])
 by smtp.gmail.com with ESMTPSA id
 jk2-20020a170903330200b001b8b1f6619asm3807749plb.75.2023.11.24.17.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 17:01:23 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 18:01:13 -0700
Message-ID: <20231125010113.1758786-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231125010113.1758786-1-adam.duskett@amarulasolutions.com>
References: <20231125010113.1758786-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700874084; x=1701478884;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NV/KfJXp6hMqSvXOLfn2toxA27VKahHcauIZedMNEd0=;
 b=NVHv1xkx72Ustif1c7uchxGrj8xpkO/J2ks+bixepLmgqCHPiNspBQy5DZfcx8O8oD
 jQbuRTUqtoYKHbYBsz8lXEBzhlJrVXnbBw9Q10GKFdONJz2g7pAAmU6F+bhQk8qCHn99
 i9t26o884rOMwqD5U1LcJ5DdaWGUYf2IhiFo8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=NVHv1xkx
Subject: [Buildroot] [PATCH/next v2 5/5] package/ivi-homescreen: new package
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
Changes v1 -> v2: Move file selector plugin from dependency-less to
                  plugins with external dependencies

 DEVELOPERS                                 |   1 +
 package/Config.in                          |   1 +
 package/ivi-homescreen/Config.in           | 153 +++++++++++++++
 package/ivi-homescreen/ivi-homescreen.hash |   3 +
 package/ivi-homescreen/ivi-homescreen.mk   | 216 +++++++++++++++++++++
 5 files changed, 374 insertions(+)
 create mode 100644 package/ivi-homescreen/Config.in
 create mode 100644 package/ivi-homescreen/ivi-homescreen.hash
 create mode 100644 package/ivi-homescreen/ivi-homescreen.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d1578e5ad3..547b0d5e3c 100644
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
index f59eab5616..5685ada73e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -320,6 +320,7 @@ comment "Graphic applications"
 	source "package/glmark2/Config.in"
 	source "package/glslsandbox-player/Config.in"
 	source "package/gnuplot/Config.in"
+	source "package/ivi-homescreen/Config.in"
 	source "package/jhead/Config.in"
 	source "package/kmscube/Config.in"
 	source "package/libva-utils/Config.in"
diff --git a/package/ivi-homescreen/Config.in b/package/ivi-homescreen/Config.in
new file mode 100644
index 0000000000..4c6aec071e
--- /dev/null
+++ b/package/ivi-homescreen/Config.in
@@ -0,0 +1,153 @@
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
+
+config BR2_PACKAGE_IVI_HOMESCREEN_LOGGING_PLUGIN
+	bool "Logging Plugin"
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
+config BR2_PACKAGE_IVI_HOMESCREEN_PLATFORM_VIEW_PLUGIN
+	bool "PlatformView"
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
+
+comment "OpenGL texture plugin needs an EGL backend"
+	depends on !BR2_PACKAGE_HAS_LIBEGL
+
+comment "textures"
+
+config BR2_PACKAGE_IVI_HOMESCREEN_EGL_TEXTURE
+	bool "EGL"
+	depends on BR2_PACKAGE_HAS_LIBEGL
+
+comment "EGL textures needs an EGL backend"
+	depends on !BR2_PACKAGE_HAS_LIBEGL
+
+config BR2_PACKAGE_IVI_HOMESCREEN_NAVI_RENDER_EGL_TEXTURE
+	bool "Navi"
+	depends on BR2_PACKAGE_HAS_LIBEGL
+
+comment "Navi textures needs an EGL backend"
+	depends on !BR2_PACKAGE_HAS_LIBEGL
+
+config BR2_PACKAGE_IVI_HOMESCREEN_TEST_EGL_TEXTURE
+	bool "Test"
+	depends on BR2_PACKAGE_HAS_LIBEGL
+
+comment "Test textures needs an EGL backend"
+	depends on !BR2_PACKAGE_HAS_LIBEGL
+
+endif # BR2_PACKAGE_IVI_HOMESCREEN
+
+comment "flutter-auto needs flutter-engine"
+	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_FLUTTER_ENGINE
diff --git a/package/ivi-homescreen/ivi-homescreen.hash b/package/ivi-homescreen/ivi-homescreen.hash
new file mode 100644
index 0000000000..8803bcf2cd
--- /dev/null
+++ b/package/ivi-homescreen/ivi-homescreen.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  c5a920894e8102a1838a1a46499cb94fda3a80a4e4e30e976e15b7d2e99eab51  ivi-homescreen-569b1b53873cea0a3dc0584a63824038cfb01a52-br1.tar.gz
+sha256  6b96fa0a3def85caaf466caa2bd82d4ca4f22d106ff88f97a00c537c00cc714b  LICENSE
diff --git a/package/ivi-homescreen/ivi-homescreen.mk b/package/ivi-homescreen/ivi-homescreen.mk
new file mode 100644
index 0000000000..ae4435fedd
--- /dev/null
+++ b/package/ivi-homescreen/ivi-homescreen.mk
@@ -0,0 +1,216 @@
+################################################################################
+#
+# ivi-homescreen
+#
+################################################################################
+
+IVI_HOMESCREEN_VERSION = 569b1b53873cea0a3dc0584a63824038cfb01a52
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
+	-DBUILD_DOC=OFF \
+	-DBUILD_TEXTURE_NAVI_EGL_ROUTING=OFF \
+	-DBUILD_UNIT_TESTS=OFF
+
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
+IVI_HOMESCREEN_CONF_OPTS += \
+	-DBUILD_BACKEND_WAYLAND_EGL=ON \
+	-DBUILD_EGL_TRANSPARENCY=ON \
+	-DBUILD_EGL_ENABLE_3D=ON \
+	-DBUILD_EGL_ENABLE_MULTISAMPLE=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += \
+	-DBUILD_BACKEND_WAYLAND_EGL=OFF \
+	-DBUILD_EGL_TRANSPARENCY=OFF \
+	-DBUILD_EGL_ENABLE_3D=OFF \
+	-DBUILD_EGL_ENABLE_MULTISAMPLE=OFF
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
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_DART_VM_LOGGING),y)
+IVI_HOMESCREEN_CONF_OPTS += -DENABLE_DART_VM_LOGGING=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DENABLE_DART_VM_LOGGING=OFF
+endif
+
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
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_FILE_SELECTOR_PLUGIN),y)
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_FILE_SELECTOR=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_FILE_SELECTOR=OFF
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
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_PLATFORM_VIEW_PLUGIN),y)
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_PLATFORM_VIEW=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_PLATFORM_VIEW=OFF
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
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_OPENGL_TEXTURE=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_PLUGIN_OPENGL_TEXTURE=OFF
+endif
+
+# Textures
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_EGL_TEXTURE),y)
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_TEXTURE_EGL=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_TEXTURE_EGL=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_NAVI_RENDER_EGL_TEXTURE),y)
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_TEXTURE_NAVI_RENDER_EGL=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_TEXTURE_NAVI_RENDER_EGL=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_IVI_HOMESCREEN_TEST_EGL_TEXTURE),y)
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_TEXTURE_TEST_EGL=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_TEXTURE_TEST_EGL=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
