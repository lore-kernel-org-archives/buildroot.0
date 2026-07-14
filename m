Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FF7C44508
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 12:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6A91608FD;
	Tue, 14 Jul 2026 12:17:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1TfK5qJ1x7dD; Tue, 14 Jul 2026 12:17:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D700A60909
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784031437;
	bh=/5+zDsYYNv+cIORhilH1KAZoAINmw+f5AljMsWlFvEc=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qvJUW73P+ZKF7J91w6zEM4jHrF4K2k2QYTnf2NlBHYpPWofRQpcDNr6+obJtFu8yo
	 hn2O6QXZjHGWVENWmJzpVypRg0B345Zhz2mskxkhi9rCwZCUDd7ZZtqzJ2/z1xtbr1
	 /SOGjat20o4nmZVG77fNtGKSXfWeE7UZkftOS42iHYbUsByeDeph67PfU5KxzlCP2G
	 aJk5w47KWm7lWxFakbqLCLDnxPUqF/Ve8Wg0gX3TvcxTSmBw5ne3TJFuhfMGIo2Bm5
	 gSrDswLCsZ+/LWZ7T+kbyPeKiRc/Fd5c7jbL5grzfxIGbOf5+zeVvW6FTKBQKs+hnq
	 QsM9wWxH9RERg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D700A60909;
	Tue, 14 Jul 2026 12:17:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2223D9CF
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 12:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1476F408AC
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 12:17:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4sTRRWD-EaHU for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 12:17:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=134.119.228.102;
 helo=smtprelay07.ispgateway.de; envelope-from=mf@go-sys.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D3E874080E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3E874080E
Received: from smtprelay07.ispgateway.de (smtprelay07.ispgateway.de
 [134.119.228.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3E874080E
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 12:17:13 +0000 (UTC)
Received: from [84.191.230.110] (helo=mail.go-sys.de)
 by smtprelay07.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.99.1)
 (envelope-from <mf@go-sys.de>) id 1wjbgq-000000005VS-17mC
 for buildroot@buildroot.org; Tue, 14 Jul 2026 13:52:44 +0200
Received: from mail.go-sys.de (192.168.1.9) by mail.go-sys.de (192.168.1.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Tue, 14 Jul
 2026 13:52:07 +0200
Received: from go-sys.de (192.168.1.122) by mail.go-sys.de (192.168.1.9) with
 Microsoft SMTP Server id 15.1.2507.61 via Frontend Transport;
 Tue, 14 Jul 2026 13:52:07 +0200
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@buildroot.org>
CC: Michael Fischer <mf@go-sys.de>
Date: Tue, 14 Jul 2026 13:52:02 +0200
Message-ID: <20260714115205.29838-1-mf@go-sys.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-C2ProcessedOrg: 5fa85167-cd6f-46be-bafe-19070fe3dac3
X-CrossPremisesHeadersFilteredBySendConnector: mail.go-sys.de
X-OrganizationHeadersPreserved: mail.go-sys.de
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=go-sys.de
Subject: [Buildroot] [PATCH 1/4] package/sdl3: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Simple DirectMedia Layer 3 is a library that allows programs
portable low level access to a video framebuffer, audio output,
mouse, and keyboard. It is not compatible with SDL2.

https://www.libsdl.org/
https://wiki.libsdl.org/SDL3/README-migration

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/sdl3/Config.in | 79 +++++++++++++++++++++++++++++++++++
 package/sdl3/sdl3.hash |  4 ++
 package/sdl3/sdl3.mk   | 95 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 180 insertions(+)
 create mode 100644 package/sdl3/Config.in
 create mode 100644 package/sdl3/sdl3.hash
 create mode 100644 package/sdl3/sdl3.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index fdfab8b489..9f44548ea0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2406,6 +2406,7 @@ F:	configs/arcturus_ucls1012a_defconfig
 N:	Michael Fischer <mf@go-sys.de>
 F:	package/gnuplot/
 F:	package/sdl2/
+F:	package/sdl3/
 
 N:	Michael Nosthoff <buildroot@heine.tech>
 F:	package/boost/
diff --git a/package/Config.in b/package/Config.in
index b6f23308af..91903361c5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -363,6 +363,7 @@ comment "Graphic libraries"
 	source "package/sdl2_mixer/Config.in"
 	source "package/sdl2_net/Config.in"
 	source "package/sdl2_ttf/Config.in"
+	source "package/sdl3/Config.in"
 	source "package/spirv-headers/Config.in"
 	source "package/tk/Config.in"
 	source "package/virglrenderer/Config.in"
diff --git a/package/sdl3/Config.in b/package/sdl3/Config.in
new file mode 100644
index 0000000000..109bb5678e
--- /dev/null
+++ b/package/sdl3/Config.in
@@ -0,0 +1,79 @@
+config BR2_PACKAGE_SDL3
+	bool "sdl3"
+	depends on !BR2_STATIC_LIBS
+	help
+	  Simple DirectMedia Layer 3 - SDL3 is a library that allows
+	  programs portable low level access to a video framebuffer,
+	  audio output, mouse, and keyboard. It is not compatible with
+	  SDL2.
+
+	  http://www.libsdl.org/
+
+if BR2_PACKAGE_SDL3
+
+config BR2_PACKAGE_SDL3_X11
+	bool "X11 video driver"
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+
+comment "X11 video driver needs X.org"
+	depends on !BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU
+
+config BR2_PACKAGE_SDL3_KMSDRM
+	bool "KMS/DRM video driver"
+	depends on BR2_TOOLCHAIN_HAS_THREADS  # libdrm
+	depends on BR2_PACKAGE_HAS_LIBGBM
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_SDL3_OPENGL || BR2_PACKAGE_SDL3_OPENGLES
+	select BR2_PACKAGE_LIBDRM
+
+comment "KMS/DRM video driver needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "KMS/DRM video driver needs a GBM provider, and OpenGL or OpenGLES+EGL"
+	depends on !BR2_PACKAGE_HAS_LIBGBM || \
+		!BR2_PACKAGE_HAS_LIBEGL || \
+		!(BR2_PACKAGE_SDL3_OPENGL || BR2_PACKAGE_SDL3_OPENGLES)
+
+config BR2_PACKAGE_SDL3_WAYLAND
+	bool "Wayland video driver"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
+	depends on BR2_PACKAGE_WAYLAND
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_SDL3_OPENGLES
+	select BR2_PACKAGE_LIBXKBCOMMON
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
+
+comment "Wayland video driver needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "Wayland video driver needs wayland with an OpenGLES+EGL backend"
+	depends on !BR2_PACKAGE_WAYLAND || \
+		!BR2_PACKAGE_HAS_LIBEGL || \
+		!BR2_PACKAGE_SDL3_OPENGLES
+
+config BR2_PACKAGE_SDL3_OPENGL
+	bool "OpenGL (GLX)"
+	depends on BR2_PACKAGE_HAS_LIBGL
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU # X11 video driver
+	select BR2_PACKAGE_SDL3_X11
+
+comment "OpenGL support needs X11 and an OpenGL provider"
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_HAS_LIBGL || !BR2_PACKAGE_XORG7
+
+config BR2_PACKAGE_SDL3_OPENGLES
+	bool "OpenGL ES"
+	depends on BR2_PACKAGE_HAS_LIBGLES
+
+comment "OpenGL ES support needs an OpenGL ES provider"
+	depends on !BR2_PACKAGE_HAS_LIBGLES
+
+endif
+
+comment "sdl3 needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/sdl3/sdl3.hash b/package/sdl3/sdl3.hash
new file mode 100644
index 0000000000..27197ae594
--- /dev/null
+++ b/package/sdl3/sdl3.hash
@@ -0,0 +1,4 @@
+# Locally calculated after checking http://www.libsdl.org/release/SDL3-3.4.12.tar.gz.sig
+sha256  f07b958a9ac5020fb7a44cadb957f658b2149c3c8abb4f63145fac9303249db7  SDL3-3.4.12.tar.gz
+# Locally calculated
+sha256  1c040b8271b37e5076359f8fd54240e371114112924d2df81ef87c7d6a1dfdfd  LICENSE.txt
diff --git a/package/sdl3/sdl3.mk b/package/sdl3/sdl3.mk
new file mode 100644
index 0000000000..85defe10be
--- /dev/null
+++ b/package/sdl3/sdl3.mk
@@ -0,0 +1,95 @@
+################################################################################
+#
+# sdl3
+#
+################################################################################
+
+SDL3_VERSION = 3.4.12
+SDL3_SOURCE = SDL3-$(SDL3_VERSION).tar.gz
+SDL3_SITE = http://www.libsdl.org/release
+SDL3_LICENSE = Zlib
+SDL3_LICENSE_FILES = LICENSE.txt
+SDL3_CPE_ID_VENDOR = libsdl
+SDL3_CPE_ID_PRODUCT = simple_directmedia_layer
+SDL3_INSTALL_STAGING = YES
+
+SDL3_CONF_OPTS = \
+	-DSDL_RPATH=OFF \
+	-DSDL_DBUS=OFF \
+	-DSDL_PULSEAUDIO=OFF \
+	-DSDL_VIVANTE=OFF \
+	-DSDL_VULKAN=OFF \
+	-DSDL_DUMMYVIDEO=OFF \
+	-DSDL_OFFSCREEN=OFF \
+	-DSDL_HIDAPI=OFF \
+	-DSDL_IBUS=OFF \
+	-DSDL_JOYSTICK_MFI=OFF \
+	-DSDL_JOYSTICK_VIRTUAL=OFF \
+	-DSDL_RENDER_D3D=OFF \
+	-DSDL_UNIX_CONSOLE_BUILD=ON \
+	-DSDL_INSTALL_DOCS=OFF \
+	-DSDL_STATIC=ON
+
+# SDL3 fails to build in Thumb mode on some ARM architectures
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+SDL3_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+SDL3_DEPENDENCIES += udev
+SDL3_CONF_OPTS += -DSDL_LIBUDEV=ON
+else
+SDL3_CONF_OPTS += -DSDL_LIBUDEV=OFF
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSE),y)
+SDL3_CONF_OPTS += -DSDL_SSE=ON
+else
+SDL3_CONF_OPTS += -DSDL_SSE=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SDL3_X11),y)
+SDL3_DEPENDENCIES += xlib_libX11 xlib_libXext
+SDL3_CONF_OPTS += -DSDL_X11=ON
+else
+SDL3_CONF_OPTS += -DSDL_X11=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SDL3_WAYLAND),y)
+SDL3_DEPENDENCIES += libegl libxkbcommon wayland wayland-protocols
+SDL3_CONF_OPTS += -DSDL_WAYLAND=ON
+else
+SDL3_CONF_OPTS += -DSDL_WAYLAND=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SDL3_OPENGL),y)
+SDL3_DEPENDENCIES += libgl
+SDL3_CONF_OPTS += -DSDL_OPENGL=ON
+else
+SDL3_CONF_OPTS += -DSDL_OPENGL=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SDL3_OPENGLES),y)
+SDL3_DEPENDENCIES += libgles libegl
+SDL3_CONF_OPTS += -DSDL_OPENGLES=ON
+else
+SDL3_CONF_OPTS += -DSDL_OPENGLES=OFF
+endif
+
+# The explicit dependencies make sure libdrm/gbm/egl are built before
+# sdl3, otherwise the kmsdrm video driver is silently disabled at
+# configure time.
+ifeq ($(BR2_PACKAGE_SDL3_KMSDRM),y)
+SDL3_DEPENDENCIES += libdrm libgbm libegl
+SDL3_CONF_OPTS += -DSDL_KMSDRM=ON
+else
+SDL3_CONF_OPTS += -DSDL_KMSDRM=OFF
+endif
+
+# SDL3 installs a copy of its license on the target, drop it
+define SDL3_REMOVE_LICENSES
+	rm -rf $(TARGET_DIR)/usr/share/licenses/SDL3
+endef
+SDL3_POST_INSTALL_TARGET_HOOKS += SDL3_REMOVE_LICENSES
+
+$(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
