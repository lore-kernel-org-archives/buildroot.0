Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67F9C46CD2
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 02:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31CC081EA9;
	Wed,  3 Jan 2024 02:06:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31CC081EA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1j_5pS9PsOLo; Wed,  3 Jan 2024 02:06:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5CDE81EBE;
	Wed,  3 Jan 2024 02:06:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5CDE81EBE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 491391BF2AF
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 02:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D3D881EB1
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 02:06:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D3D881EB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XPhMqlRl7N6R for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 02:06:18 +0000 (UTC)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7D9080D20
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 02:06:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7D9080D20
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-28ca8a37adeso3386306a91.3
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 18:06:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704247577; x=1704852377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u8D/COJwyud3Z18nhO4+Lf0VtI6YnBRIvQL0dbJz6sk=;
 b=sJ3Afye3AUdy0KXh/y8ezFa/WriFWu5hC7RBN7O1sD6L9+MKbxY64wbm4JEtE8yF14
 0BF8hxglmdj73IL+sCCHRJGUVwGGlH9LtcKLL37+tvOtiqWJlSCfZpZLRzNxGQYgmMrT
 eEZ2RVguY1ouRDMa6gQdgoXTshgyH8KjYofPCrQBQ4XthP15uQZpv/hfF/HLYu/WF2C7
 19WUKXmJRu6WIA735Gl3c2YIIwNxoxfe0D7PMNj9Eerpr6RXV7HVHiiO+BGqi+eMqHEl
 j6nxlpAu1Ka4OmAmIwQuf9gIXAvpLmEQxs3sdj9T6tB3nB0Of/b6ufTx93EHHZnfK8Xd
 w3og==
X-Gm-Message-State: AOJu0Yw6BYrb6QpoW39zizhSnm2dFKL4nQrGsbO7Z7Ggv4x9/is0xCnj
 sDl1DZ/5RoTnJGW8mkSF3jjAbPDRFGu4mUrNxTy4n0S5NJ4=
X-Google-Smtp-Source: AGHT+IGVZJQnd3iXFshDmHkPmPKbUwzprma1I3+lVQ0XrVwqRNJOI3yvn4H24euVfk6ZGYGGBFyXzg==
X-Received: by 2002:a17:90a:3988:b0:28c:3071:d034 with SMTP id
 z8-20020a17090a398800b0028c3071d034mr7565441pjb.0.1704247577105; 
 Tue, 02 Jan 2024 18:06:17 -0800 (PST)
Received: from desktop-oi0kn2b.lan (75-174-33-82.boid.qwest.net.
 [75.174.33.82]) by smtp.gmail.com with ESMTPSA id
 f4-20020a17090ac28400b0028c060d5c59sm309428pjt.15.2024.01.02.18.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 18:06:16 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 19:06:13 -0700
Message-ID: <20240103020613.4084011-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103020613.4084011-1-adam.duskett@amarulasolutions.com>
References: <20240103020613.4084011-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704247577; x=1704852377;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u8D/COJwyud3Z18nhO4+Lf0VtI6YnBRIvQL0dbJz6sk=;
 b=b0oWlIWhKIgu7GQadlRDzitMMx6zsfmvZ+I0nar5NBz2Umit2gNBzjvDEGWkOgDdV5
 OsotWF8vAzGvSm9V5TIhEMu02sn7OZYQgBNwgY7GQc5qLlT72cK67BIyDSs2QG1kSRvp
 IBKgzGNk5GFVJRk53jdYE0x301h2uzvLnJGGc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=b0oWlIWh
Subject: [Buildroot] [PATCH v5 1/1] package/ivi-homescreen: new package
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
  - URL Launcher

The following plugins and options are hardcoded to off:
  - Crash handler: Requires a newer version of sentry-native.
  - File selector: Requires the zenity package.
  - Firebase-core: Requires the firebase-cpp-sdk package.
  - BUILD_TEXTURE_NAVI_EGL_ROUTING: Fails to build.
  - BUILD_TEXTURE_NAVI_RENDER_EGL: Fales to build.
  - BUILD_TEXTURE_TEST_EGL: Fails to build.

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

With the following defconfig:
```
BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE=y
BR2_CCACHE=y
BR2_INIT_SYSTEMD=y
BR2_TARGET_GENERIC_GETTY_PORT="tty1"
BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
BR2_GENERATE_LOCALE="en_US.UTF-8"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi.sh"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.24"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
BR2_PACKAGE_FOOT=y
BR2_PACKAGE_IVI_HOMESCREEN=y
BR2_PACKAGE_IVI_HOMESCREEN_DART_VM_LOGGING=y
BR2_PACKAGE_IVI_HOMESCREEN_DLT=y
BR2_PACKAGE_IVI_HOMESCREEN_XDG_CLIENT=y
BR2_PACKAGE_IVI_HOMESCREEN_AGL_CLIENT=y
BR2_PACKAGE_IVI_HOMESCREEN_IVI_SHELL=y
BR2_PACKAGE_IVI_HOMESCREEN_EGL_TRANSPARENCY=y
BR2_PACKAGE_IVI_HOMESCREEN_EGL_ENABLE_3D=y
BR2_PACKAGE_IVI_HOMESCREEN_EGL_MULTISAMPLE=y
BR2_PACKAGE_IVI_HOMESCREEN_ACCESSIBILITY_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_COMP_REGION_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_COMP_SURF_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_DESKTOP_WINDOW_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_GO_ROUTER_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_INTEGRATION_TEST_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_ISOLATE_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_KEYBOARD_MANAGER_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_KEY_EVENT_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_LAYER_PLAYGROUND_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_LOGGING_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_MOUSE_CURSOR_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_PACKAGE_INFO_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_PLATFORM_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_PLATFORM_VIEWS_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_RESTORATION_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_TEXT_INPUT_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_URL_LAUNCHER_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_AUDIO_PLAYERS=y
BR2_PACKAGE_IVI_HOMESCREEN_FLUTTER_SECURE_STORAGE_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_GOOGLE_SIGN_IN_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_GSTREAMER_EGL_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_OPENGL_TEXTURE_PLUGIN=y
BR2_PACKAGE_SWAY=y
BR2_PACKAGE_SWAY_SWAYBAR=y
BR2_PACKAGE_SWAY_SWAYBAR_TRAY=y
BR2_PACKAGE_SWAY_SWAYNAG=y
BR2_PACKAGE_FLUTTER_GALLERY=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL=y
BR2_PACKAGE_MESA3D_OSMESA_GALLIUM=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_ACPID=y
BR2_PACKAGE_FLUTTER_ENGINE=y
BR2_PACKAGE_CONNMAN=y
BR2_PACKAGE_CONNMAN_WIFI=y
BR2_PACKAGE_CONNMAN_CLIENT=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
BR2_TARGET_GRUB2=y
BR2_TARGET_GRUB2_X86_64_EFI=y
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y
```

The image is then booted using qemu with the following
command:
```
LIBGL_DRIVERS_PATH=/usr/lib64/dri \
FONTCONFIG_PATH=/etc/fonts \
qemu-system-x86_64 \
  -enable-kvm \
  -M pc \
  -cpu host \
  -m 1024M \
  -bios /usr/share/OVMF/OVMF_CODE.fd \
  -drive file=output/images/disk.img,if=virtio,format=raw \
  -net nic,model=virtio \
  -net user \
  -device virtio-vga-gl \
  -display gtk,gl=es,show-cursor=on \
  -usb \
  -device usb-ehci,id=ehci \
  -device usb-tablet,bus=usb-bus.0
```

After logging in, type:
 - mkdir -p /tmp/sway && export XDG_RUNTIME_DIR=/tmp/sway && sway
 - bring up a terminal with `windows key + return`
 - Type `homescreen --b=/usr/share/flutter/gallery/release/`

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS                                 |   1 +
 package/Config.in                          |   1 +
 package/ivi-homescreen/Config.in           | 167 ++++++++++++++
 package/ivi-homescreen/ivi-homescreen.hash |   3 +
 package/ivi-homescreen/ivi-homescreen.mk   | 245 +++++++++++++++++++++
 5 files changed, 417 insertions(+)
 create mode 100644 package/ivi-homescreen/Config.in
 create mode 100644 package/ivi-homescreen/ivi-homescreen.hash
 create mode 100644 package/ivi-homescreen/ivi-homescreen.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 646b8ee5a2..33f49fcddc 100644
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
index 38c36428b9..5f3848d860 100644
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
index 0000000000..b007ea47af
--- /dev/null
+++ b/package/ivi-homescreen/Config.in
@@ -0,0 +1,167 @@
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
index 0000000000..760390c125
--- /dev/null
+++ b/package/ivi-homescreen/ivi-homescreen.mk
@@ -0,0 +1,245 @@
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
+	-DBUILD_PLUGIN_FILE_SELECTOR=OFF \
+	-DBUILD_PLUGIN_FIREBASE_CORE=OFF \
+	-DBUILD_TEXTURE_NAVI_EGL_ROUTING=OFF \
+	-DBUILD_TEXTURE_NAVI_RENDER_EGL=OFF \
+	-DBUILD_TEXTURE_TEST_EGL=OFF \
+	-DBUILD_UNIT_TESTS=OFF
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
