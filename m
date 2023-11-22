Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAF3C61D85
	for <buildroot@archiver.kernel.org>; Wed, 22 Nov 2023 01:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE3D8408C9;
	Wed, 22 Nov 2023 01:47:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE3D8408C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jWeiWaYMvRZZ; Wed, 22 Nov 2023 01:47:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6519E408DA;
	Wed, 22 Nov 2023 01:47:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6519E408DA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 225301BF3B0
 for <buildroot@lists.busybox.net>; Wed, 22 Nov 2023 01:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEFA281393
 for <buildroot@lists.busybox.net>; Wed, 22 Nov 2023 01:47:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEFA281393
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LUBS_uWs0ZEK for <buildroot@lists.busybox.net>;
 Wed, 22 Nov 2023 01:47:36 +0000 (UTC)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A24C481371
 for <buildroot@buildroot.org>; Wed, 22 Nov 2023 01:47:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A24C481371
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1ce627400f6so35585825ad.2
 for <buildroot@buildroot.org>; Tue, 21 Nov 2023 17:47:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700617655; x=1701222455;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xn/g3lYIn+TNmTeXazD9dtbRrV8io0mbAdFJ/+w4kQk=;
 b=q8p5CcrMq+UeqJct3uBRCHxZg1TBJ5AZZsITRwoRneV5X2YtWJHm5pjLqE1T27kNyP
 JP+aZR90GMph5ZIUa4pMe2Dz5Wc6SzAblCnhEr2Z0dDeareNXNP5RvoRcKo6wlUL1APa
 YrK6Xg4FiVTSEMn+EZMsnIiAukPp8npZiDyOreYb/cRyHK7U48m65krezQ3kdkUIoYIP
 DptGHTvxIAECPIjHlR1SRj9a3PDucelvFb7G2eIUTw2E2IJVG9r5OV/jnqWvZbMhOsVP
 UwhCGsvBv1AICZMLBvUcQnzKw4t5HEsmvNbk7gInaqhO8WxQG4BTQTzOvSH3ZH4F2sgl
 dgbw==
X-Gm-Message-State: AOJu0YyMzyfLhRh7utg3Akp1wcDveFN3VlnBWO9M4ukTEHYTH+pe9z3F
 7Lhw8bE2qrRNXVrCfndkWq/L3VdZjR+kNPa6+MfpeA==
X-Google-Smtp-Source: AGHT+IFYc3addjoojvRbtar8IUgQ83oSEn162wivYXU9TWLrHfPZsAow/LvpEUZaOydidHTBym5EsQ==
X-Received: by 2002:a17:902:9f8f:b0:1cf:678a:6536 with SMTP id
 g15-20020a1709029f8f00b001cf678a6536mr954647plq.6.1700617654922; 
 Tue, 21 Nov 2023 17:47:34 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.106])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a170902d90500b001bc5dc0cd75sm8549565plz.180.2023.11.21.17.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 17:47:34 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 21 Nov 2023 18:47:30 -0700
Message-ID: <20231122014730.2795697-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122014730.2795697-1-adam.duskett@amarulasolutions.com>
References: <20231122014730.2795697-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700617655; x=1701222455;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xn/g3lYIn+TNmTeXazD9dtbRrV8io0mbAdFJ/+w4kQk=;
 b=T2aTOJMxs36uEkOm3mMMnvXIU/OmWhHXkOHSeCOO0XVQSO6LyMU+AfCUTITmvh9JWe
 Id24uEhnrcniR1NyBtNynFzi4AlGbIkBI/ct4pXVzGu8ENm6uuYaPiyQEMPiykktyC8V
 pFhlMiQqvY4hKpR+VOuMgez86benNOpek0LPY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=T2aTOJMx
Subject: [Buildroot] [PATCH/next 2/2] package/ivi-homescreen: new package
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
 DEVELOPERS                                 |   1 +
 package/Config.in                          |   1 +
 package/ivi-homescreen/Config.in           | 142 ++++++++++++++
 package/ivi-homescreen/ivi-homescreen.hash |   3 +
 package/ivi-homescreen/ivi-homescreen.mk   | 216 +++++++++++++++++++++
 5 files changed, 363 insertions(+)
 create mode 100644 package/ivi-homescreen/Config.in
 create mode 100644 package/ivi-homescreen/ivi-homescreen.hash
 create mode 100644 package/ivi-homescreen/ivi-homescreen.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1f26e9bc81..a09037636c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -37,6 +37,7 @@ F:	package/flutter-engine/
 F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
+F:	package/ivi-homescreen/
 F:	package/python-kmod/
 F:	package/python-versioneer/
 F:	support/testing/tests/package/test_firewalld.py
diff --git a/package/Config.in b/package/Config.in
index c971127759..9c2bd1dfa8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -350,6 +350,7 @@ comment "Graphic libraries"
 	source "package/freerdp/Config.in"
 	source "package/graphicsmagick/Config.in"
 	source "package/imagemagick/Config.in"
+	source "package/ivi-homescreen/Config.in"
 	source "package/libglvnd/Config.in"
 	source "package/linux-fusion/Config.in"
 	source "package/lite/Config.in"
diff --git a/package/ivi-homescreen/Config.in b/package/ivi-homescreen/Config.in
new file mode 100644
index 0000000000..fc625adf64
--- /dev/null
+++ b/package/ivi-homescreen/Config.in
@@ -0,0 +1,142 @@
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
+config BR2_PACKAGE_IVI_HOMESCREEN_FILE_SELECTOR_PLUGIN
+	bool "File Selector"
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
