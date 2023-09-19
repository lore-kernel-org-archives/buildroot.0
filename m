Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25214CD3425
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 00:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD72E41691;
	Tue, 19 Sep 2023 00:34:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD72E41691
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NQPqn6Sz8cC5; Tue, 19 Sep 2023 00:34:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F903409DD;
	Tue, 19 Sep 2023 00:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F903409DD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8BE5B1BF95F
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 00:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72AB640EC1
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 00:33:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72AB640EC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oz9LEYWZeHTV for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 00:33:49 +0000 (UTC)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E95A440961
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 00:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E95A440961
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1bf6ea270b2so38430365ad.0
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 17:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695083628; x=1695688428;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HCtpALD3WXsXMEh6losCREU2l4Yqzfo2UTAStiqvL9g=;
 b=i4Pk3+5Pt6pfyyL6xlKRycSsB+zCpw4LM8D+7iGfVyG2riXQoyx1TrJaFb0qbiMgGH
 dny+MspDQAQ+1/xWZO57yn7lQe36cE7fKXA2rZis69ZlK+8E19XSlPQrBRWi2r1mMbOU
 FByJOe4E5HQsS7+M2M2bhZst3awRGcFH09AJDvepJ/YjFLNs9U/Kwi987Lb/k2IiiKUM
 qbhkthI5n7ePp3Gle6ag5hjfQW5sC9UOMa98iPXR9fSVNlLpBOFa8XBwutwQpSaHl1Xw
 Vbjw6EfKbFJvMKdteAIbOf9VhMH+uHI08Inl70nDtKAHUVIRX9k1hnkjfTSlD3w2Hoqq
 Oz7g==
X-Gm-Message-State: AOJu0YxU3HqlxEDxaiPBFnCseOsl3vGD2vcHA/k/H6FmYl2jJQWGZl1u
 NefZuXVV04RSJ3ZycOhh2I2hvROuwqANAXDUPBogwQ==
X-Google-Smtp-Source: AGHT+IHG9+bPvlolUT5V7AEMQDHfT5SCEdiBU8dAVegle9Oa2Y1U9ugNQ4ts8LB5/qy4krx5K/ENow==
X-Received: by 2002:a17:902:d50c:b0:1c3:6e38:3943 with SMTP id
 b12-20020a170902d50c00b001c36e383943mr10441310plg.56.1695083628029; 
 Mon, 18 Sep 2023 17:33:48 -0700 (PDT)
Received: from Adam-laptop.amarulasolutions.com ([172.56.200.164])
 by smtp.gmail.com with ESMTPSA id
 iw13-20020a170903044d00b001c582de968dsm1558001plb.72.2023.09.18.17.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 17:33:47 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Sep 2023 18:33:35 -0600
Message-Id: <20230919003337.565432-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230919003337.565432-1-adam.duskett@amarulasolutions.com>
References: <20230919003337.565432-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1695083628; x=1695688428;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HCtpALD3WXsXMEh6losCREU2l4Yqzfo2UTAStiqvL9g=;
 b=D0Ysy+MdgwZAKuoAKRTjEuUY57o84CijOQOFO4xeC8hZ9G8alNM0ZFUybWphtD6ELN
 quowS9IvRs7vyOyE0hy69HkuC0fK3mNRBd/JbQBaP41wGPXHAoPGvrxw+ID1UJ/LbQYG
 OeyVMfwU/BPtF/aeOq2eJrnOJTUTmgNwoKZ0Q=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=D0Ysy+Md
Subject: [Buildroot] [PATCH v8 5/7] package/flutter-pi: new package
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

flutter-pi is one of many flutter-embedders. However, flutter-pi is unique
because it doesn't require X or Wayland to run. So long as there is support for
KMS and DRI flutter-pi should run on any platform that flutter-engine supports.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v7 -> v8:
  - Update from 11c4fdc9 to d62e8435

v6 -> v7:
  - Update from 004efdaa to 11c4fdc9
  - Change to a menuconfig package. There are a lot of plugins and options.
  - Add the following plugins:
    - gstreamer audio
    - gstreamer video
    - raw keyboard
    - test
    - text input
  - Add missing dependencies
  - Fill in all config options
  - Explicitly disable vulkan support, as we do not have vulkan-loader.
  - Add session_switching support if seatd is selected.

v2 -> v3:
  - Add -DFILESYSTEM_LAYOUT=meta-flutter to conf_opts. This is used to check
    where the icudtl.dat file is located. Without this change, flutter apps
    fail to start.

 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/flutter-pi/Config.in       | 84 +++++++++++++++++++++++++++++
 package/flutter-pi/flutter-pi.hash |  3 ++
 package/flutter-pi/flutter-pi.mk   | 85 ++++++++++++++++++++++++++++++
 5 files changed, 174 insertions(+)
 create mode 100644 package/flutter-pi/Config.in
 create mode 100644 package/flutter-pi/flutter-pi.hash
 create mode 100644 package/flutter-pi/flutter-pi.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 258add1400..c9b972e8ab 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -34,6 +34,7 @@ F:	package/vulkan-tools/
 N:	Adam Duskett <adam.duskett@amarulasolutions.com>
 F:	package/depot-tools/
 F:	package/flutter-engine/
+F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
 
 N:	Adam Heinrich <adam@adamh.cz>
diff --git a/package/Config.in b/package/Config.in
index 066e621ab9..b73bb33bf6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -343,6 +343,7 @@ comment "Graphic libraries"
 	source "package/fbset/Config.in"
 	source "package/fbterm/Config.in"
 	source "package/fbv/Config.in"
+	source "package/flutter-pi/Config.in"
 	source "package/freerdp/Config.in"
 	source "package/graphicsmagick/Config.in"
 	source "package/imagemagick/Config.in"
diff --git a/package/flutter-pi/Config.in b/package/flutter-pi/Config.in
new file mode 100644
index 0000000000..a869faf053
--- /dev/null
+++ b/package/flutter-pi/Config.in
@@ -0,0 +1,84 @@
+menuconfig BR2_PACKAGE_FLUTTER_PI
+	bool "flutter-pi"
+	depends on BR2_PACKAGE_FLUTTER_ENGINE
+	depends on BR2_PACKAGE_HAS_LIBGBM
+	depends on BR2_PACKAGE_SYSTEMD # Event loop and dbus support
+	depends on BR2_PACKAGE_HAS_UDEV # libinput
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBINPUT
+	select BR2_PACKAGE_LIBXKBCOMMON
+	help
+	  A light-weight Flutter Engine Embedder. Flutter-pi also
+	  runs without X11, so you don't need to boot into a
+	  Desktop & have X11 or Wayland load up; just boot into the
+	  command-line.
+
+	  Although flutter-pi is only tested on a Rasberry Pi 4
+	  2GB, it should work fine on other linux platforms supported
+	  by Flutter so long as there is support for KMS and DRI.
+
+	  https://github.com/ardera/flutter-pi
+
+if BR2_PACKAGE_FLUTTER_PI
+
+comment "plugins"
+
+config BR2_PACKAGE_FLUTTER_PI_GSTREAMER_AUDIO_PLAYER_PLUGIN
+	bool "gstreamer audio player"
+	depends on BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOCONVERT
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME
+	help
+	  Include the gstreamer based video plugins in the finished
+	  binary. Allows for more stable, hardware accelerated
+	  video playback in flutter using gstreamer.
+
+config BR2_PACKAGE_FLUTTER_PI_GSTREAMER_VIDEO_PLAYER_PLUGIN
+	bool "gstreamer video player"
+	depends on BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLES2
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERTSCALE
+	help
+	  Include the gstreamer based video plugins in the finished
+	  binary. Allows for more stable, hardware accelerated
+	  video playback in flutter using gstreamer.
+
+comment "gstreamer video player plugin needs an OpenGL ES backend"
+	depends on !BR2_PACKAGE_HAS_LIBGLES
+
+config BR2_PACKAGE_FLUTTER_PI_RAW_KEYBOARD_PLUGIN
+	bool "raw keyboard"
+	help
+	  Include the raw keyboard plugin in the finished binary.
+	  Enables raw keycode listening in flutter via the flutter
+	  RawKeyboard interface.
+
+config BR2_PACKAGE_FLUTTER_PI_TEST_PLUGIN
+	bool "Test plugin"
+	help
+	  Include the test plugin in the finished binary.
+	  Allows testing platform channel communication.
+
+config BR2_PACKAGE_FLUTTER_PI_TEXT_INPUT_PLUGIN
+	bool "text input"
+	help
+	  Include the text input plugin in the finished binary.
+	  Enables text input (to flutter text fields, for example)
+	  via attached keyboards.
+
+endif
+
+comment "flutter-pi needs flutter-engine"
+	depends on !BR2_PACKAGE_FLUTTER_ENGINE
+
+comment "flutter-pi needs GBM, systemd, and udev"
+	depends on !BR2_PACKAGE_HAS_LIBGBM || \
+		!BR2_PACKAGE_SYSTEMD || \
+		!BR2_PACKAGE_HAS_UDEV
diff --git a/package/flutter-pi/flutter-pi.hash b/package/flutter-pi/flutter-pi.hash
new file mode 100644
index 0000000000..f7148963a4
--- /dev/null
+++ b/package/flutter-pi/flutter-pi.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  e4af79c8f53c15913f52a83a221f099a2a750d023a0bc4560d0db6f15def79a2  flutter-pi-d62e84350d2869b3ec1dfb1af21bfe234c4b817f-br1.tar.gz
+sha256  b34df9d3e1b4e5d1ba70b1740ec74b69f1189b44efd0c96b898b074ef8db1c70  LICENSE
diff --git a/package/flutter-pi/flutter-pi.mk b/package/flutter-pi/flutter-pi.mk
new file mode 100644
index 0000000000..27f140c177
--- /dev/null
+++ b/package/flutter-pi/flutter-pi.mk
@@ -0,0 +1,85 @@
+################################################################################
+#
+# flutter-pi
+#
+################################################################################
+
+FLUTTER_PI_VERSION = d62e84350d2869b3ec1dfb1af21bfe234c4b817f
+FLUTTER_PI_SITE = https://github.com/ardera/flutter-pi.git
+FLUTTER_PI_SITE_METHOD = git
+FLUTTER_PI_LICENSE = MIT
+FLUTTER_PI_LICENSE_FILES = LICENSE
+FLUTTER_PI_DEPENDENCIES = \
+	flutter-engine \
+	libinput \
+	libxkbcommon \
+	systemd
+
+FLUTTER_PI_CONF_OPTS = \
+	-DDEBUG_DRM_PLANE_ALLOCATIONS=OFF \
+	-DDUMP_ENGINE_LAYERS=OFF \
+	-DENABLE_ASAN=OFF \
+	-DENABLE_MTRACE=OFF \
+	-DENABLE_SOFTWARE=OFF \
+	-DENABLE_TESTS=OFF \
+	-DENABLE_TSAN=OFF \
+	-DENABLE_UBSAN=OFF \
+	-DENABLE_VULKAN=OFF \
+	-DFILESYSTEM_LAYOUT=meta-flutter \
+	-DLINT_EGL_HEADERS=OFF \
+	-DTRY_BUILD_GSTREAMER_AUDIO_PLAYER_PLUGIN=OFF \
+	-DTRY_BUILD_GSTREAMER_VIDEO_PLAYER_PLUGIN=OFF \
+	-DTRY_ENABLE_OPENGL=OFF \
+	-DTRY_ENABLE_SESSION_SWITCHING=OFF \
+	-DTRY_ENABLE_VULKAN=OFF \
+	-DVULKAN_DEBUG="OFF" \
+	-DUSE_LEGACY_KMS=OFF \
+	-DWARN_MISSING_FIELD_INITIALIZERS=OFF
+
+ifeq ($(BR2_ENABLE_LTO),y)
+FLUTTER_PI_CONF_OPTS += -DLTO=ON
+else
+FLUTTER_PI_CONF_OPTS += -DLTO=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_FLUTTER_PI_GSTREAMER_AUDIO_PLAYER_PLUGIN),y)
+FLUTTER_PI_DEPENDENCIES += gstreamer1 gst1-plugins-base
+FLUTTER_PI_CONF_OPTS += -DBUILD_GSTREAMER_AUDIO_PLAYER_PLUGIN=ON
+else
+FLUTTER_PI_CONF_OPTS += -DBUILD_GSTREAMER_AUDIO_PLAYER_PLUGIN=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_FLUTTER_PI_GSTREAMER_VIDEO_PLAYER_PLUGIN),y)
+FLUTTER_PI_DEPENDENCIES += gstreamer1 gst1-plugins-base
+FLUTTER_PI_CONF_OPTS += -DBUILD_GSTREAMER_VIDEO_PLAYER_PLUGIN=ON
+else
+FLUTTER_PI_CONF_OPTS += -DBUILD_GSTREAMER_VIDEO_PLAYER_PLUGIN=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_FLUTTER_PI_RAW_KEYBOARD_PLUGIN),y)
+FLUTTER_PI_CONF_OPTS += -DBUILD_RAW_KEYBOARD_PLUGIN=ON
+else
+FLUTTER_PI_CONF_OPTS += -DBUILD_RAW_KEYBOARD_PLUGIN=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_FLUTTER_PI_TEXT_INPUT_PLUGIN),y)
+FLUTTER_PI_DEPENDENCIES += libinput libxkbcommon
+FLUTTER_PI_CONF_OPTS += -DBUILD_TEXT_INPUT_PLUGIN=ON
+else
+FLUTTER_PI_CONF_OPTS += -DBUILD_TEXT_INPUT_PLUGIN=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
+FLUTTER_PI_CONF_OPTS += -DENABLE_OPENGL=ON
+else
+FLUTTER_PI_CONF_OPTS += -DENABLE_OPENGL=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SEATD),y)
+FLUTTER_PI_DEPENDENCIES += seatd
+FLUTTER_PI_CONF_OPTS += -DENABLE_SESSION_SWITCHING=ON
+else
+FLUTTER_PI_CONF_OPTS += -DENABLE_SESSION_SWITCHING=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
