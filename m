Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7916C83F12
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 21:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67A0260FD1;
	Tue, 29 Aug 2023 21:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67A0260FD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lDPMfWWE28nC; Tue, 29 Aug 2023 21:38:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 241D660FAD;
	Tue, 29 Aug 2023 21:38:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 241D660FAD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D04621BF97E
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 21:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA64560F44
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 21:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA64560F44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S8DmjR1R3PTB for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 21:37:37 +0000 (UTC)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9453D60F2E
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 21:37:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9453D60F2E
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1c1f8aaab9aso13673615ad.1
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 14:37:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693345056; x=1693949856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=86reMB4OM/seUk4vU3EnjveM096mrT0tovEWdFIzRa0=;
 b=RgoQR3db9YV2GfdgYwjkMimXzsUzSuUt2nLqB9x06kQ0cWmXC9SHmW3OuRQkxX/rZy
 rNa2R+1FggEeYM3LPR2Tq98zUjbDjMgLI3RMBW5NgCa9iSyAuyi5NoyWkCzqG1DmOciW
 rYnNUbI6hb+oPJK5I1cCE5konCPi71co1zCeeufFUTjgHCNTYYgc9MuWdM8qdkZsIoYK
 YU4Cl/CUX5uw7TyENZ/YspaZuCMHtVyn+G8bys/5Ap7E3Cdquqpp97JNsfXWgx/ucply
 bkMzBKUo6PsGbgh0Z0qLxsih43gj6cKisX1+CE34fwPNxbdM8iTnkKb+79vpFkes2YWy
 QR1Q==
X-Gm-Message-State: AOJu0YxhoK8wBDCq+b1NE1W68Ziyib9Qp02tVSJ59NJt7/5qqiffDwTN
 U8udeCOZf0MDwKGCFALeVhTz2/yp4+Fhgey3ukk=
X-Google-Smtp-Source: AGHT+IFVCIcKq4VzDsZ7pzr+VKfNJ2RSLWjChi06eAcdjWaePBowAwmhg9EVblA23NsGXw3gh70xJg==
X-Received: by 2002:a17:902:7d94:b0:1c0:cbaf:6930 with SMTP id
 a20-20020a1709027d9400b001c0cbaf6930mr298750plm.54.1693345056438; 
 Tue, 29 Aug 2023 14:37:36 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.202])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a170902a70500b001ae0152d280sm9691516plq.193.2023.08.29.14.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 14:37:36 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 15:37:24 -0600
Message-ID: <20230829213726.1957587-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230829213726.1957587-1-adam.duskett@amarulasolutions.com>
References: <20230829213726.1957587-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1693345056; x=1693949856;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=86reMB4OM/seUk4vU3EnjveM096mrT0tovEWdFIzRa0=;
 b=Ix9KvapLXoeCZvkIOSL42A1laOQ2IbUGIKl7+NhBz4JQI4JMcU13U6qgN6HYqVjfRp
 hvDz/94gev51i9P0xaYz0z4+N3BjB6x9QzisPqquS7Mr3SYwT7g4gE0y6Cv0+mrI54ki
 ZKMNAwBknrnJhk4gXBXKNg808we6PT5VkPRVI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Ix9KvapL
Subject: [Buildroot] [PATCH v7 5/7] package/flutter-pi: new package
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
index 8eaac70429..5137764f5a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -29,6 +29,7 @@
 N:	Adam Duskett <adam.duskett@amarulasolutions.com>
 F:	package/depot-tools/
 F:	package/flutter-engine/
+F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
 
 N:	Adam Duskett <aduskett@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 4f62f17323..0cdb8d4ea4 100644
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
index 0000000000..99eaf78cea
--- /dev/null
+++ b/package/flutter-pi/flutter-pi.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  d28db780ec99554726488d491cd426c3454246b54dca7aa819d5762e0ee7d413  flutter-pi-11c4fdc9d064c22e0f27a78de4adb5d6e19d56c4-br1.tar.gz
+sha256  b34df9d3e1b4e5d1ba70b1740ec74b69f1189b44efd0c96b898b074ef8db1c70  LICENSE
diff --git a/package/flutter-pi/flutter-pi.mk b/package/flutter-pi/flutter-pi.mk
new file mode 100644
index 0000000000..fa449aabbd
--- /dev/null
+++ b/package/flutter-pi/flutter-pi.mk
@@ -0,0 +1,85 @@
+################################################################################
+#
+# flutter-pi
+#
+################################################################################
+
+FLUTTER_PI_VERSION = 11c4fdc9d064c22e0f27a78de4adb5d6e19d56c4
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
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
