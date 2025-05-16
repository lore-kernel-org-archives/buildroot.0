Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD30C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B7AF70EA3;
	Mon, 19 May 2025 11:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 07TS9IBKOuH5; Mon, 19 May 2025 11:01:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05B4170EA7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05B4170EA7;
	Mon, 19 May 2025 11:01:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 22FE9E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77BD941A3C
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 87ntY_XwniFY for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D88641A3E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D88641A3E
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5990582A2E; Mon, 19 May 2025 10:40:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 17:17:56 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b0a703a974503b59881630a6b36ee8f5a1d37248
X-Git-Newrev: 4662553088b81dbf35fa43aaeef098ac2c7f41f9
X-Patchwork-Hint: ignore
Message-Id: <20250519104005.5990582A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sdl2: add wayland
 support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4662553088b81dbf35fa43aaeef098ac2c7f41f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This adds a configuration option to enable the Wayland
video driver support in SDL2.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
[Peter: move after KMS/DRM]
Tested-by: Alexander Shiyan <eagle.alexander923@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl2/Config.in | 17 +++++++++++++++++
 package/sdl2/sdl2.mk   |  8 +++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
index f1c22e4f80..432b34b9e4 100644
--- a/package/sdl2/Config.in
+++ b/package/sdl2/Config.in
@@ -38,6 +38,23 @@ comment "KMS/DRM video driver needs a GBM provider, and OpenGL or OpenGLES+EGL"
 		!BR2_PACKAGE_HAS_LIBEGL || \
 		!(BR2_PACKAGE_SDL2_OPENGL || BR2_PACKAGE_SDL2_OPENGLES)
 
+config BR2_PACKAGE_SDL2_WAYLAND
+	bool "Wayland video driver"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
+	depends on BR2_PACKAGE_WAYLAND
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_SDL2_OPENGLES
+	select BR2_PACKAGE_LIBXKBCOMMON
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
+
+comment "Wayland video driver needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "Wayland video driver needs wayland with an OpenGLES+EGL backend"
+	depends on !BR2_PACKAGE_WAYLAND || \
+		!BR2_PACKAGE_HAS_LIBEGL || \
+		!BR2_PACKAGE_SDL2_OPENGLES
+
 config BR2_PACKAGE_SDL2_OPENGL
 	bool "OpenGL (GLX)"
 	depends on BR2_PACKAGE_HAS_LIBGL
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 8e4d7700c0..9b4a19571c 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -23,7 +23,6 @@ SDL2_CONF_OPTS += \
 	--disable-video-vivante \
 	--disable-video-cocoa \
 	--disable-video-metal \
-	--disable-video-wayland \
 	--disable-video-dummy \
 	--disable-video-offscreen \
 	--disable-video-vulkan \
@@ -105,6 +104,13 @@ else
 SDL2_CONF_OPTS += --disable-video-x11-xcursor
 endif
 
+ifeq ($(BR2_PACKAGE_SDL2_WAYLAND),y)
+SDL2_DEPENDENCIES += libegl libxkbcommon wayland wayland-protocols
+SDL2_CONF_OPTS += --enable-video-wayland
+else
+SDL2_CONF_OPTS += --disable-video-wayland
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBXI),y)
 SDL2_DEPENDENCIES += xlib_libXi
 SDL2_CONF_OPTS += --enable-video-x11-xinput
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
