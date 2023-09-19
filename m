Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB7E8CE79A9
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 20:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2D7C82107;
	Tue, 19 Sep 2023 20:44:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2D7C82107
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LE5-Cn-YOOYq; Tue, 19 Sep 2023 20:44:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE712838F0;
	Tue, 19 Sep 2023 20:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE712838F0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D9571BF20B
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 20:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 770DD416FC
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 20:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 770DD416FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S5b5P16h11JW for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 20:43:04 +0000 (UTC)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B24540C01
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 20:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B24540C01
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-577e62e2adfso4715323a12.2
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 13:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695156183; x=1695760983;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jrpt9ZQGmcdo9ewkWlyOWWAieP4yzbdGHM3d7lyN24o=;
 b=O3CSIoQy9XIu8WmtlXkEicvuTYrYkxXTBpn1eNJ1vOyfUst1+8OGtIpmK7mwv/yzbA
 4I/zbBgHMa5ru2FEDIQyKN2luZS54x0UcP+KItWKbu6i1Fj7fP5xUARFvqcJ5myv9/k9
 d3qTFvvVARinVpByt7m08Ez5QWpsZtwXt6ydgNyTHbEG5y1h79eN7UocFwv8isghnMrp
 c12039A2kOeAeMfsFDGnsDilIfMLOaaNnMx7e+4p+joeoEl2a/lpLQONHUjUkF76wd8G
 baFweSmH60skyYr/RP6UikAI9ILAjiWR9PjXoQpx3Ph/WiUhYYILB0UOzzlrGLMHBo13
 3SIw==
X-Gm-Message-State: AOJu0YyZxt7S/mC6hipj/NgUnZH5wgIVtc7vf0rK+044IP/WsWhC5vKu
 B8d6UO6YROC6NIquAdrDW8IzTv5mG6Qn/pLLZsvjBw==
X-Google-Smtp-Source: AGHT+IGSV5+mEii0Uu90x/PHwKHkzcOlwmgse2j+TX8rJ1ZxHfCK9BM9A7QBURpbkFSOvxFMoGkZeg==
X-Received: by 2002:a05:6a20:728c:b0:153:8983:d8bf with SMTP id
 o12-20020a056a20728c00b001538983d8bfmr779779pzk.16.1695156183490; 
 Tue, 19 Sep 2023 13:43:03 -0700 (PDT)
Received: from Adam-laptop.amarulasolutions.com ([172.56.201.58])
 by smtp.gmail.com with ESMTPSA id
 18-20020a056a00073200b0068844ee18dfsm8918700pfm.83.2023.09.19.13.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Sep 2023 13:43:03 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 19 Sep 2023 14:42:50 -0600
Message-Id: <20230919204252.2272594-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230919204252.2272594-1-adam.duskett@amarulasolutions.com>
References: <20230919204252.2272594-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1695156183; x=1695760983;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jrpt9ZQGmcdo9ewkWlyOWWAieP4yzbdGHM3d7lyN24o=;
 b=RgR5MMKQ53es95HRdT0foHuLMC8viHnOqV4/lJhss2LHzxIw3DhFo4MMeslXeHywsy
 2wydBG6wBW/r6y8WyZktKPjq7xCOoTAXA35cIAkHjBQmZG3evi9fW7fB/UpfZd1rHI/1
 cf44LN3jxECuID76HEzsKipcoukXzT/UEbIbQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=RgR5MMKQ
Subject: [Buildroot] [PATCH v9 5/7] package/flutter-pi: new package
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
