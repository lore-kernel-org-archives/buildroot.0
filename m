Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F9AC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 15:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03953831E3;
	Fri, 16 May 2025 15:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HSMJp8id0-4r; Fri, 16 May 2025 15:18:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20D76821EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20D76821EA;
	Fri, 16 May 2025 15:18:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BC6E185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 15:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CCCE4093B
 for <buildroot@buildroot.org>; Fri, 16 May 2025 15:18:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sa-2Hmd-dLBz for <buildroot@buildroot.org>;
 Fri, 16 May 2025 15:18:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89C4540983
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89C4540983
 for <buildroot@buildroot.org>; Fri, 16 May 2025 15:18:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 841C786C3F; Fri, 16 May 2025 15:18:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 17:17:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b0a703a974503b59881630a6b36ee8f5a1d37248
X-Git-Newrev: 4662553088b81dbf35fa43aaeef098ac2c7f41f9
X-Patchwork-Hint: ignore
Message-Id: <20250516151809.841C786C3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl2: add wayland support
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
