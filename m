Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D7CC4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 21:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23D24400C1;
	Wed, 10 Jan 2024 21:30:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23D24400C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sCzOrJnUuc06; Wed, 10 Jan 2024 21:30:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FF52436D7;
	Wed, 10 Jan 2024 21:30:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FF52436D7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 86D841BF2CA
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 21:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FE4B614D0
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 21:30:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FE4B614D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ej_EkkjhQqyS for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 21:30:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CACD261481
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 21:30:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CACD261481
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6FCB85E05; Wed, 10 Jan 2024 21:30:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 22:30:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b7c163f1903db0eeeba6d49b3a977b2f021c5396
X-Git-Newrev: 9d8497e79de3ced144877ba6ee38cc5b7181aaeb
X-Patchwork-Hint: ignore
Message-Id: <20240110213045.B6FCB85E05@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ivi-homescreen: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d8497e79de3ced144877ba6ee38cc5b7181aaeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Much like flutter-pi, this package is a Flutter embedder used to run Flutter
applications. However, unlike Flutter-pi, this package requires a Wayland
compositor to run, which flutter-pi does not support. Furthermore, flutter-pi
lacks several plugins and features that ivi-homescreen supports, such as:
  - Dart VM console redirection
  - DLT logging
  - Accessibility
  - Compositor region
  - Compositor surface
  - Desktop Window
  - Go Router
  - Isolate
  - Keyboard Manager
  - Layer Playground
  - Mouse Cursor
  - PackageInfo
  - Platform
  - Platform Views
  - Restoration

The following plugins and options are hardcoded to off:
  - Crash handler: Requires a newer version of sentry-native.
  - File selector: Requires the zenity package.
  - Firebase-core: Requires the firebase-cpp-sdk package.
  - URL Launcher: Requires a runtime-dependency on xdg-open.
  - BUILD_TEXTURE_NAVI_RENDER_EGL: Failes to build.
  - BUILD_TEXTURE_TEST_EGL: Fails to build.
  - ENABLE_AGL_CLIENT: Used for Automitve Grade Linux (AGL).

The ENABLE_XDG_CLIENT=ON option is a requirement to run Flutter apps.
If this option is disabled, ivi-homescreen segfaults when starting an
application.

Finally, there is a need for a patch that fixes the audio-players plugin:
If the audio-players plugin is the only plugin selected, several compilation
errors occure because of undeclared definitions, as the standard_method_codec.h
header file is missing.

Upstream-status: https://github.com/toyota-connected/ivi-homescreen/pull/133

This package has been tested on a x86_64 host with an AMD Ryzen 9 6900HS
with Docker 24.0.5:
  - The following distributions:
    - Fedora 39: Host system
    - Ubuntu 22.04: Docker
    - Debian 11: Docker

  - The following targets:
    - BR2_aarch64
    - BR2_arm
    - BR2_x86_64

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[yann.morin.1998@free.fr:
  - propagate BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS to comments
  - drop NPTL, implied by glibc
  - reorder dependencies in a more logical way
  - reorder comments
  - drop undefined BR2_PACKAGE_IVI_HOMESCREEN_HAS_CLIENT
  - grammar ("for to change")
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                         |   1 +
 package/Config.in                                  |   1 +
 ...ssing-headers-to-the-audio-players-plugin.patch |  82 +++++++
 package/ivi-homescreen/Config.in                   | 270 +++++++++++++++++++++
 package/ivi-homescreen/ivi-homescreen.hash         |  21 ++
 package/ivi-homescreen/ivi-homescreen.mk           | 136 +++++++++++
 6 files changed, 511 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d7543247f2..94a89c63d5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -35,6 +35,7 @@ F:	package/flutter-engine/
 F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
+F:	package/ivi-homescreen/
 F:	package/libutempter/
 F:	package/tllist/
 F:	support/testing/tests/package/test_flutter.py
diff --git a/package/Config.in b/package/Config.in
index f5d0c06334..0009256298 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -322,6 +322,7 @@ comment "Graphic applications"
 	source "package/glmark2/Config.in"
 	source "package/glslsandbox-player/Config.in"
 	source "package/gnuplot/Config.in"
+	source "package/ivi-homescreen/Config.in"
 	source "package/jhead/Config.in"
 	source "package/kmscube/Config.in"
 	source "package/libva-utils/Config.in"
diff --git a/package/ivi-homescreen/0001-add-missing-headers-to-the-audio-players-plugin.patch b/package/ivi-homescreen/0001-add-missing-headers-to-the-audio-players-plugin.patch
new file mode 100644
index 0000000000..c26fdba7f2
--- /dev/null
+++ b/package/ivi-homescreen/0001-add-missing-headers-to-the-audio-players-plugin.patch
@@ -0,0 +1,82 @@
+From 7e35ea4fbd94a1604907069bb9cc2e2dff4b43c7 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Sat, 6 Jan 2024 14:18:56 -0700
+Subject: [PATCH] add missing headers to the audio-players plugin
+
+Fixes flutter::StandardMethodCodec not being declared on the following lines:
+plugins/audio_players/audio_players_registry.cc:83
+plugins/audio_players/audio_players_registry.cc:94
+plugins/audio_players/audio_players_registry.cc:152
+plugins/audio_players/audio_player.cc:257
+plugins/audio_players/audio_player.cc:623
+
+Upstream: https://github.com/toyota-connected/ivi-homescreen/pull/133
+
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ shell/plugins/audio_players/audio_player.cc           | 3 ++-
+ shell/plugins/audio_players/audio_players.cc          | 4 +++-
+ shell/plugins/audio_players/audio_players_registry.cc | 3 ++-
+ 3 files changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/shell/plugins/audio_players/audio_player.cc b/shell/plugins/audio_players/audio_player.cc
+index 56027eb..a85e9ae 100644
+--- a/shell/plugins/audio_players/audio_player.cc
++++ b/shell/plugins/audio_players/audio_player.cc
+@@ -20,6 +20,7 @@
+ #include <map>
+ #include <sstream>
+ 
++#include <flutter/standard_method_codec.h>
+ #include <flutter/standard_message_codec.h>
+ 
+ #include <gst/audio/audio.h>
+@@ -639,4 +640,4 @@ void AudioPlayer::OnPlatformMessage(const FlutterPlatformMessage* message,
+   engine->SendPlatformMessageResponse(message->response_handle, result->data(),
+                                       result->size());
+ }
+-}  // namespace Plugins
+\ No newline at end of file
++}  // namespace Plugins
+diff --git a/shell/plugins/audio_players/audio_players.cc b/shell/plugins/audio_players/audio_players.cc
+index 0605576..4290f5a 100644
+--- a/shell/plugins/audio_players/audio_players.cc
++++ b/shell/plugins/audio_players/audio_players.cc
+@@ -19,6 +19,8 @@
+ #include <memory>
+ #include <vector>
+ 
++#include <flutter/standard_method_codec.h>
++
+ #include "audio_player.h"
+ #include "audio_players_registry.h"
+ #include "engine.h"
+@@ -314,4 +316,4 @@ void AudioPlayers::OnPlatformMessage(const FlutterPlatformMessage* message,
+               : "Unknown AudioPlayersLinux error");
+   }
+ }
+-}
+\ No newline at end of file
++}
+diff --git a/shell/plugins/audio_players/audio_players_registry.cc b/shell/plugins/audio_players/audio_players_registry.cc
+index 6c9ef33..00c4f45 100644
+--- a/shell/plugins/audio_players/audio_players_registry.cc
++++ b/shell/plugins/audio_players/audio_players_registry.cc
+@@ -19,6 +19,7 @@
+ #include <memory>
+ #include <mutex>
+ 
++#include <flutter/standard_method_codec.h>
+ #include <flutter/standard_message_codec.h>
+ 
+ #include "audio_player.h"
+@@ -168,4 +169,4 @@ void AudioPlayersRegistry::OnPlatformMessageEvents(
+   engine->SendPlatformMessageResponse(message->response_handle, result->data(),
+                                       result->size());
+ }
+-}  // namespace Plugins
+\ No newline at end of file
++}  // namespace Plugins
+-- 
+2.43.0
+
diff --git a/package/ivi-homescreen/Config.in b/package/ivi-homescreen/Config.in
new file mode 100644
index 0000000000..de7509320f
--- /dev/null
+++ b/package/ivi-homescreen/Config.in
@@ -0,0 +1,270 @@
+menuconfig BR2_PACKAGE_IVI_HOMESCREEN
+	bool "ivi-homescreen"
+	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
+	depends on BR2_HOST_GCC_AT_LEAST_5 # flutter-engine
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # flutter-engine
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # flutter-engine
+	depends on BR2_TOOLCHAIN_USES_GLIBC # flutter-engine
+	depends on BR2_INSTALL_LIBSTDCPP # flutter-engine
+	depends on !BR2_STATIC_LIBS # flutter-engine, wayland
+	depends on BR2_USE_WCHAR # flutter-engine
+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES # flutter-engine
+	select BR2_PACKAGE_HOST_FLUTTER_SDK_BIN
+	select BR2_PACKAGE_FLUTTER_ENGINE
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
+config BR2_PACKAGE_IVI_HOMESCREEN_IVI_SHELL_CLIENT
+	bool "ivi-shell client"
+
+comment "Logging"
+config BR2_PACKAGE_IVI_HOMESCREEN_DART_VM_LOGGING
+	bool "Enable Dart VM Logging"
+
+config BR2_PACKAGE_IVI_HOMESCREEN_DLT_LOGGING
+	bool "DLT logging"
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
+	help
+	  Flutter plugin to change window size.
+
+	  https://pub.dev/packages/desktop_window
+
+config BR2_PACKAGE_IVI_HOMESCREEN_GO_ROUTER_PLUGIN
+	bool "Go Router"
+	help
+	  A declarative routing package for Flutter that uses the
+	  Router API to provide a convenient, url-based API for
+	  navigating between different screens. You can define URL
+	  patterns, navigate using a URL, handle deep links, and a
+	  number of other navigation-related scenarios.
+
+	  https://pub.dev/packages/go_router
+
+config BR2_PACKAGE_IVI_HOMESCREEN_INTEGRATION_TEST_PLUGIN
+	bool "Flutter Integration Test support"
+	help
+	  https://docs.flutter.dev/cookbook/testing/integration/introduction
+
+config BR2_PACKAGE_IVI_HOMESCREEN_ISOLATE_PLUGIN
+	bool "Isolate"
+
+config BR2_PACKAGE_IVI_HOMESCREEN_KEYBOARD_MANAGER_PLUGIN
+	bool "Keyboard Manager"
+	select BR2_PACKAGE_IVI_HOMESCREEN_TEXT_INPUT_PLUGIN # runtime
+	help
+	  This is a wrapper for the raw keyboard listener made to
+	  simplify intercept external keyboard button press.
+
+	  https://pub.dev/packages/keyboard_manager
+
+config BR2_PACKAGE_IVI_HOMESCREEN_KEY_EVENT_PLUGIN
+	bool "Key Event"
+	select BR2_PACKAGE_IVI_HOMESCREEN_TEXT_INPUT_PLUGIN # runtime
+	help
+	  KeyEvent plugin to support RawKeyEvent.
+
+config BR2_PACKAGE_IVI_HOMESCREEN_LAYER_PLAYGROUND_PLUGIN
+	bool "Layer Playground"
+	select BR2_PACKAGE_IVI_HOMESCREEN_PLATFORM_VIEWS_PLUGIN
+	help
+	  This plugin enables the platform views plugin and also
+	  provides a simple-box-view-type option.
+
+	  https://github.com/toyota-connected/ivi-homescreen/tree/main/shell/plugins/platform_views
+
+config BR2_PACKAGE_IVI_HOMESCREEN_LOGGING_PLUGIN
+	bool "Logging"
+
+config BR2_PACKAGE_IVI_HOMESCREEN_MOUSE_CURSOR_PLUGIN
+	bool "Mouse Cursor"
+	help
+	  Add mouse cursor support.
+
+config BR2_PACKAGE_IVI_HOMESCREEN_PACKAGE_INFO_PLUGIN
+	bool "PackageInfo"
+	help
+	  Prints the ivi-homescreen package information.
+
+config BR2_PACKAGE_IVI_HOMESCREEN_PLATFORM_PLUGIN
+	bool "Platform"
+	help
+	  Get information about the platform the Flutter application
+	  is running on.
+
+config BR2_PACKAGE_IVI_HOMESCREEN_PLATFORM_VIEWS_PLUGIN
+	bool "Platform Views"
+	help
+	  This plugin supports the AndroidView interface. Meaning you
+	  can take any Platform View Dart code, change the definition
+	  to use AndroidView, and you will have a working interface.
+
+	  Benefits of using this interface:
+	    - pre-defined interface that is supported in Flutter SDK
+	    - params are easily augmented in Dart to add for given use
+	      case
+	    - pass touch to another process/library without additional
+	      work
+
+	  For a backing implementation there are a number of approaches:
+	    - Have a PlatformView implementation render to a Texture
+	    - Compositor Region support
+	      (poke a hole for another process)
+	    - Compositor sub-surface and manage Z-order
+
+	  The above is already supported today using either an OpenGL
+	  texture, or a Compositor Sub-Surface. Using Platform Views
+	  just re-uses an existing interface.
+
+	  https://github.com/toyota-connected/ivi-homescreen/tree/main/shell/plugins/platform_views
+
+config BR2_PACKAGE_IVI_HOMESCREEN_RESTORATION_PLUGIN
+	bool "Restoration"
+	help
+	  Handles the Flutter restoration callback
+
+config BR2_PACKAGE_IVI_HOMESCREEN_TEXT_INPUT_PLUGIN
+	bool "Text Input"
+	help
+	  Allow for text input
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
+	help
+	  A Flutter plugin to play multiple simultaneously audio files.
+	  Based on audioplayers-v5.2.1
+
+	  https://pub.dev/packages/audioplayers
+
+config BR2_PACKAGE_IVI_HOMESCREEN_FLUTTER_SECURE_STORAGE_PLUGIN
+	bool "Flutter Secure Storage"
+	select BR2_PACKAGE_LIBSECRET
+	help
+	  Store data in secure storage
+
+	  https://pub.dev/packages/flutter_secure_storage
+
+config BR2_PACKAGE_IVI_HOMESCREEN_GOOGLE_SIGN_IN_PLUGIN
+	bool "Google Sign In manager"
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBCURL_FORCE_TLS
+	select BR2_PACKAGE_OPENSSL
+	help
+	  This static plugin is to support this pub.dev package:
+	  https://pub.dev/packages/google_sign_in
+
+	  https://github.com/toyota-connected/ivi-homescreen/tree/main/shell/plugins/google_sign_in
+
+config BR2_PACKAGE_IVI_HOMESCREEN_GSTREAMER_EGL_PLUGIN
+	bool "GStreamer EGL"
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_EGL
+	help
+	  A GStreamer-powered alternative to Flutter's video_player that
+	  support Linux, iOS and Android.
+
+	  https://pub.dev/packages/flutter_gstreamer_player
+
+comment "GStreamer plugin needs an EGL backend"
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_HAS_LIBEGL
+
+config BR2_PACKAGE_IVI_HOMESCREEN_OPENGL_TEXTURE_PLUGIN
+	bool "OpenGL Texture"
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	help
+	  A Flutter OpenGL ES plugin using a Texture() widget.
+	  Many shaders from ShaderToy.com can be copy/pasted
+
+	  https://pub.dev/packages/flutter_opengl
+
+comment "OpenGL texture plugin needs an EGL backend"
+	depends on !BR2_PACKAGE_HAS_LIBEGL
+
+endif # BR2_PACKAGE_IVI_HOMESCREEN
+
+comment "ivi-homescreen needs a glibc toolchain w/ wchar, C++, gcc >= 5, dynamic library, host gcc >= 5, NPTL"
+	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
+		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR \
+		|| !BR2_HOST_GCC_AT_LEAST_5
+
+comment "ivi-homescreen needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
+comment "ivi-homescreen needs an OpenGL or OpenGLES backend"
+	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_HAS_LIBGL && !BR2_PACKAGE_HAS_LIBGLES
diff --git a/package/ivi-homescreen/ivi-homescreen.hash b/package/ivi-homescreen/ivi-homescreen.hash
new file mode 100644
index 0000000000..a0d0162948
--- /dev/null
+++ b/package/ivi-homescreen/ivi-homescreen.hash
@@ -0,0 +1,21 @@
+# Locally calculated
+sha256  1ab2e7ab5f947482cb5529dbb6392e7e1945ceb0b593abde6b6279d7bd2fdb79  ivi-homescreen-5ab78a19e95c88cc5d6b173ab1260a211e78cf0a-br1.tar.gz
+
+# Apache-2.0
+sha256  6b96fa0a3def85caaf466caa2bd82d4ca4f22d106ff88f97a00c537c00cc714b  LICENSE
+sha256  943c358cb6d086e4bc0937941b8f8d766db7d4e5f06583efd45dca0ca6a645f3  third_party/filament/libs/bluevk/include/bluevk/BlueVK.h
+
+# BSD-3-Clause
+sha256  fdff25c8a4147791114584a45d56621336d294601da77656e83504a71747c8c2  third_party/flutter/shell/platform/common/client_wrapper/core_implementations.cc
+
+# BSD-Style
+sha256  baa98cbcc03e3e745c4ad9ac2d3fb3464424486b2e420081181013034a7e6406  third_party/flutter/third_party/dart/runtime/include/dart_api.h
+
+# BSL-1.0
+sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  third_party/asio-1-28-1/asio/LICENSE_1_0.txt
+
+# MIT
+sha256  240f786071b64c28c0a1dae3e3b05fc3ca93fa4882b1e36e56ee49fee3037b0a  third_party/flutter/third_party/rapidjson/include/rapidjson/rapidjson.h
+sha256  4b67e7ae8c91e68e1a929eb1cbaa4c773c6d19aa91aaa12c390cf9560d1c9799  third_party/sanitizers-cmake/LICENSE
+sha256  a7241a379cb98d37788f82c2fc2e484c3ae85dae881fd3406f0637644850926f  third_party/spdlog-1.12.0/LICENSE
+sha256  8b79f17fa7cf47adeeb8277965267e3932155fdfcab81a0ed5d583438bdf9135  third_party/weston/protocol/ivi-application.xml
diff --git a/package/ivi-homescreen/ivi-homescreen.mk b/package/ivi-homescreen/ivi-homescreen.mk
new file mode 100644
index 0000000000..4293b2bc35
--- /dev/null
+++ b/package/ivi-homescreen/ivi-homescreen.mk
@@ -0,0 +1,136 @@
+################################################################################
+#
+# ivi-homescreen
+#
+################################################################################
+
+IVI_HOMESCREEN_VERSION = 5ab78a19e95c88cc5d6b173ab1260a211e78cf0a
+IVI_HOMESCREEN_SITE = https://github.com/toyota-connected/ivi-homescreen.git
+IVI_HOMESCREEN_SITE_METHOD = git
+IVI_HOMESCREEN_LICENSE = Apache-2.0, BSD-3-Clause, BSD-Style, BSL-1.0, MIT
+
+# Keep order as listed in ivi-homescreen.hash
+IVI_HOMESCREEN_LICENSE_FILES = \
+	LICENSE \
+	third_party/filament/libs/bluevk/include/bluevk/BlueVK.h \
+	third_party/flutter/shell/platform/common/client_wrapper/core_implementations.cc \
+	third_party/flutter/third_party/dart/runtime/include/dart_api.h \
+	third_party/asio-1-28-1/asio/LICENSE_1_0.txt \
+	third_party/flutter/third_party/rapidjson/include/rapidjson/rapidjson.h \
+	third_party/sanitizers-cmake/LICENSE \
+	third_party/spdlog-1.12.0/LICENSE \
+	third_party/weston/protocol/ivi-application.xml
+
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
+	-DBUILD_PLUGIN_FILE_SELECTOR=OFF \
+	-DBUILD_PLUGIN_FIREBASE_CORE=OFF \
+	-DBUILD_PLUGIN_URL_LAUNCHER=OFF \
+	-DBUILD_TEXTURE_NAVI_RENDER_EGL=OFF \
+	-DBUILD_TEXTURE_TEST_EGL=OFF \
+	-DBUILD_UNIT_TESTS=OFF \
+	-DENABLE_AGL_CLIENT=OFF \
+	-DENABLE_XDG_CLIENT=ON \
+	-DENABLE_IVI_SHELL_CLIENT=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_IVI_SHELL_CLIENT),ON,OFF)
+
+# Logging
+IVI_HOMESCREEN_CONF_OPTS += \
+	-DENABLE_DART_VM_LOGGING=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_DART_VM_LOGGING),ON,OFF) \
+	-DENABLE_DLT=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_DLT_LOGGING),ON,OFF)
+
+# EGL
+IVI_HOMESCREEN_CONF_OPTS += \
+	-DBUILD_EGL_TRANSPARENCY=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_EGL_TRANSPARENCY),ON,OFF) \
+	-DBUILD_EGL_ENABLE_3D=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_EGL_ENABLE_3D),ON,OFF) \
+	-DBUILD_EGL_ENABLE_MULTISAMPLE=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_EGL_MULTISAMPLE),ON,OFF)
+
+# dependency-less plugins
+IVI_HOMESCREEN_CONF_OPTS += \
+	-DBUILD_PLUGIN_ACCESSIBILITY=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_ACCESSIBILITY_PLUGIN),ON,OFF) \
+	-DBUILD_PLUGIN_COMP_REGION=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_COMP_REGION_PLUGIN),ON,OFF) \
+	-DBUILD_PLUGIN_COMP_SURF=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_COMP_SURF_PLUGIN),ON,OFF) \
+	-DBUILD_PLUGIN_DESKTOP_WINDOW=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_DESKTOP_WINDOW_PLUGIN),ON,OFF) \
+	-DBUILD_PLUGIN_GO_ROUTER=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_GO_ROUTER_PLUGIN),ON,OFF) \
+	-DBUILD_PLUGIN_INTEGRATION_TEST=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_INTEGRATION_TEST_PLUGIN),ON,OFF) \
+	-DBUILD_PLUGIN_ISOLATE=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_ISOLATE_PLUGIN),ON,OFF) \
+	-DBUILD_PLUGIN_KEYBOARD_MANAGER=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_KEYBOARD_MANAGER_PLUGIN),ON,OFF) \
+	-DBUILD_PLUGIN_KEY_EVENT=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_KEY_EVENT_PLUGIN),ON,OFF) \
+	-DBUILD_PLUGIN_LAYER_PLAYGROUND=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_LAYER_PLAYGROUND_PLUGIN),ON,OFF) \
+	-DBUILD_PLUGIN_LOGGING=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_LOGGING_PLUGIN),ON,OFF) \
+	-DBUILD_PLUGIN_MOUSE_CURSOR=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_MOUSE_CURSOR_PLUGIN),ON,OFF) \
+	-DBUILD_PLUGIN_PACKAGE_INFO=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_PACKAGE_INFO_PLUGIN),ON,OFF) \
+	-DBUILD_PLUGIN_PLATFORM=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_PLATFORM_PLUGIN),ON,OFF) \
+	-DBUILD_PLUGIN_PLATFORM_VIEWS=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_PLATFORM_VIEWS_PLUGIN),ON,OFF) \
+	-DBUILD_PLUGIN_RESTORATION=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_RESTORATION_PLUGIN),ON,OFF) \
+	-DBUILD_PLUGIN_TEXT_INPUT=$(if $(BR2_PACKAGE_IVI_HOMESCREEN_TEXT_INPUT_PLUGIN),ON,OFF)
+
+# Wayland backend options
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
+IVI_HOMESCREEN_DEPENDENCIES += libegl
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_BACKEND_WAYLAND_EGL=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_BACKEND_WAYLAND_EGL=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),y)
+IVI_HOMESCREEN_DEPENDENCIES += mesa3d
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_BACKEND_WAYLAND_VULKAN=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_BACKEND_WAYLAND_VULKAN=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+IVI_HOMESCREEN_DEPENDENCIES += libdrm
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_BACKEND_WAYLAND_DRM=ON
+else
+IVI_HOMESCREEN_CONF_OPTS += -DBUILD_BACKEND_WAYLAND_DRM=OFF
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
