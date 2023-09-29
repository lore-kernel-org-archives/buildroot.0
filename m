Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34223E77343
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 22:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8FB842F7B;
	Fri, 29 Sep 2023 22:13:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8FB842F7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OISOvZ3rMp8b; Fri, 29 Sep 2023 22:13:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DA1842F87;
	Fri, 29 Sep 2023 22:13:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DA1842F87
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D72411BF99A
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 22:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0F3060B00
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 22:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0F3060B00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mOOUtYA0sXD4 for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 22:13:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6C5360AB0
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 22:13:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6C5360AB0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95004837B1; Fri, 29 Sep 2023 22:13:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 00:12:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 827da2242cf6ad34941ea911e224738bc8633b20
X-Git-Newrev: 99a50a8c98046bb449aef1a3a7e9d8101e0adbe3
X-Patchwork-Hint: ignore
Message-Id: <20230929221310.95004837B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flutter-pi: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=99a50a8c98046bb449aef1a3a7e9d8101e0adbe3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

flutter-pi is one of many flutter-embedders. However, flutter-pi is unique
because it doesn't require X or Wayland to run. So long as there is support for
KMS and DRI flutter-pi should run on any platform that flutter-engine supports.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[yann.morin.1998@free.fr: drop unused BR2_PACKAGE_FLUTTER_PI_TEST_PLUGIN]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ..._render_surface-properly-fallback-to-surf.patch | 59 +++++++++++++++
 package/flutter-pi/Config.in                       | 78 ++++++++++++++++++++
 package/flutter-pi/flutter-pi.hash                 |  3 +
 package/flutter-pi/flutter-pi.mk                   | 85 ++++++++++++++++++++++
 6 files changed, 227 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 625bcf42a7..20d35e6233 100644
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
index 08775f12f4..35eb8c90dd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -344,6 +344,7 @@ comment "Graphic libraries"
 	source "package/fbset/Config.in"
 	source "package/fbterm/Config.in"
 	source "package/fbv/Config.in"
+	source "package/flutter-pi/Config.in"
 	source "package/freerdp/Config.in"
 	source "package/graphicsmagick/Config.in"
 	source "package/imagemagick/Config.in"
diff --git a/package/flutter-pi/0001-src-egl_gbm_render_surface-properly-fallback-to-surf.patch b/package/flutter-pi/0001-src-egl_gbm_render_surface-properly-fallback-to-surf.patch
new file mode 100644
index 0000000000..7a1a49b3d4
--- /dev/null
+++ b/package/flutter-pi/0001-src-egl_gbm_render_surface-properly-fallback-to-surf.patch
@@ -0,0 +1,59 @@
+From 856f9849763535d62ed01b538ba23905875c93f4 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Tue, 26 Sep 2023 20:31:17 +0200
+Subject: [PATCH] src/egl_gbm_render_surface: properly fallback to surface with
+ no modifier
+
+In 869fa7fcfbeb, we added a fallback to be able to create an EGL sruface
+when the driver do not support modifiers, like the llvmpipe software
+renderer (or like some proprietary drivers, like the MALI ones), as
+reported in #269 [0].
+
+However, in c6537673c9b6, there was a big overhaul of renderer
+infrastructure. That commit lost the with-modifiers code path and only
+kept the without-modifiers fallback one (i.e. it only kept the call to
+gbm_surface_create(), not to gbm_surface_create_with_modifiers()).
+
+Then in b0d09f5032a4, the with-modifier code path was re-instated, but
+in a way that made it exclusive with the without-modifiers one. That is,
+the without-modifiers code path was not a fallback to when the other
+failed.
+
+Re-instate the fallback mechanism as intiially implemented.
+
+[0] https://github.com/ardera/flutter-pi/issues/269
+
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+Upstream: https://github.com/ardera/flutter-pi/pull/367
+---
+ src/egl_gbm_render_surface.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/egl_gbm_render_surface.c b/src/egl_gbm_render_surface.c
+index ce9e5e7..8a58667 100644
+--- a/src/egl_gbm_render_surface.c
++++ b/src/egl_gbm_render_surface.c
+@@ -146,6 +146,7 @@ static int egl_gbm_render_surface_init(
+     }
+ #endif
+ 
++    gbm_surface = NULL;
+     if (allowed_modifiers != NULL) {
+         gbm_surface = gbm_surface_create_with_modifiers(
+             gbm_device,
+@@ -158,9 +159,10 @@ static int egl_gbm_render_surface_init(
+         if (gbm_surface == NULL) {
+             ok = errno;
+             LOG_ERROR("Couldn't create GBM surface for rendering. gbm_surface_create_with_modifiers: %s\n", strerror(ok));
+-            return ok;
++            LOG_ERROR("Will retry without modifiers\n");
+         }
+-    } else {
++    }
++    if (gbm_surface == NULL) {
+         gbm_surface = gbm_surface_create(
+             gbm_device,
+             size.x,
+-- 
+2.25.1
+
diff --git a/package/flutter-pi/Config.in b/package/flutter-pi/Config.in
new file mode 100644
index 0000000000..ecebfad89b
--- /dev/null
+++ b/package/flutter-pi/Config.in
@@ -0,0 +1,78 @@
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
