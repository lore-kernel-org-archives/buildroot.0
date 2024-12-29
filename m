Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DE2E77191
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 14:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D28380F47;
	Sun, 29 Dec 2024 14:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JaZbpl6EKM22; Sun, 29 Dec 2024 14:56:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF5CC80D34
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF5CC80D34;
	Sun, 29 Dec 2024 14:56:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C29E1C8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 14:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B13FB60859
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 14:55:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bjxBhGh8-Wq2 for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 14:55:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7864F60783
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7864F60783
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7864F60783
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 14:55:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id A015DE0003;
 Sun, 29 Dec 2024 14:55:48 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Dec 2024 15:55:30 +0100
Message-ID: <20241229145542.742168-8-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229145542.742168-1-thomas.petazzoni@bootlin.com>
References: <20241229145542.742168-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735484148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p1xyj7OqIfaZyz7aRmrnnYuWMWXg3wLJfT51YjxGYp0=;
 b=aYhe0GfTW63yFvUjb0YBYpE9V+zaFiVGl/EX/Zxt8Bu7lm9o2jcXbYdtbCbR/hY0JImFJ7
 3i+vw1YAWKczzDlPdLqFA9AGMoRaRcdmpcCyW2zCa6YhW3H+im1yHCK+OyCzZ+wylcE868
 ZixqD7dksH7JzwpEGxSHVUCmxB5/Dh4j4WbLBkcim1qkVvNbWVKtSH9AHG1sew6ylVuj6k
 k+rkLvUXDVY3XJgB1k7WwaSE/nYClAIlQ1nsaBoD0VXRYLN0GevtIxuAuRCBlK/JOTzWge
 lg04jsNzc2W6qjnUAjdZX/sa4wUAwpYSjcNrbSoRCOruPoxrFseq3xjGMGdp3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aYhe0GfT
Subject: [Buildroot] [PATCH 07/12] package/sdl: drop directfb support
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

As we're about to remove the DirectFB package, let's drop DirectFB
support in sdl.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                           |  5 ++--
 Config.in.legacy                              |  7 ++++++
 ...=> 0001-fix-compilation-with-libx11.patch} |  0
 .../0001-use-correct-directfb-config.patch    | 25 -------------------
 ...11yuv.c-fix-possible-use-after-free.patch} |  0
 package/sdl/Config.in                         |  4 ---
 package/sdl/sdl.mk                            | 12 +++------
 7 files changed, 12 insertions(+), 41 deletions(-)
 rename package/sdl/{0002-fix-compilation-with-libx11.patch => 0001-fix-compilation-with-libx11.patch} (100%)
 delete mode 100644 package/sdl/0001-use-correct-directfb-config.patch
 rename package/sdl/{0003-SDL_x11yuv.c-fix-possible-use-after-free.patch => 0002-SDL_x11yuv.c-fix-possible-use-after-free.patch} (100%)

diff --git a/.checkpackageignore b/.checkpackageignore
index b17ed1b7fb..d2d96c66ba 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1112,9 +1112,8 @@ package/screen/0002-Change-binary-permission-flags-even-if-chown-fails.patch lib
 package/screen/0003-Support-overriding-SCREEN-to-get-a-non-versioned-bin.patch lib_patch.Upstream
 package/screen/0004-Renamed-sched.h-to-eventqueue.h.patch lib_patch.Upstream
 package/scrub/0001-configure-ac-make-sure-m4-macros-are-included-in-the-build.patch lib_patch.Upstream
-package/sdl/0001-use-correct-directfb-config.patch lib_patch.Upstream
-package/sdl/0002-fix-compilation-with-libx11.patch lib_patch.Upstream
-package/sdl/0003-SDL_x11yuv.c-fix-possible-use-after-free.patch lib_patch.Upstream
+package/sdl/0001-fix-compilation-with-libx11.patch lib_patch.Upstream
+package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch lib_patch.Upstream
 package/sdl_mixer/0001-Add-Libs.private-field-to-pkg-config-file.patch lib_patch.Upstream
 package/sdl_mixer/0002-configure__set_macro_directory.patch lib_patch.Upstream
 package/sdl_mixer/0003-configure.ac-fix-static-linking-with-tremor.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 76d656846e..1a1ee21424 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_PACKAGE_SDL_DIRECTFB
+	bool "sdl directfb support removed"
+	select BR2_LEGACY
+	help
+	  The directfb support from SDL is no longer available, as
+	  directfb is no longer packaged in Buildroot.
+
 config BR2_PACKAGE_QT5BASE_DIRECTFB
 	bool "qt5base directfb support removed"
 	select BR2_LEGACY
diff --git a/package/sdl/0002-fix-compilation-with-libx11.patch b/package/sdl/0001-fix-compilation-with-libx11.patch
similarity index 100%
rename from package/sdl/0002-fix-compilation-with-libx11.patch
rename to package/sdl/0001-fix-compilation-with-libx11.patch
diff --git a/package/sdl/0001-use-correct-directfb-config.patch b/package/sdl/0001-use-correct-directfb-config.patch
deleted file mode 100644
index ef671a1ddd..0000000000
--- a/package/sdl/0001-use-correct-directfb-config.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-[PATCH] configure.in: use correct directfb-config in version check
-
-The configure script has just checked for the correct directfb-config
-script, so also use it for the version check instead of whatever
-might be in the path.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- configure.in |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-Index: SDL-1.2.15/configure.in
-===================================================================
---- SDL-1.2.15.orig/configure.in
-+++ SDL-1.2.15/configure.in
-@@ -1276,7 +1276,7 @@
-         else
-             set -- `echo $DIRECTFB_REQUIRED_VERSION | sed 's/\./ /g'`
-             NEED_VERSION=`expr $1 \* 10000 + $2 \* 100 + $3`
--            set -- `directfb-config --version | sed 's/\./ /g'`
-+            set -- `$DIRECTFBCONFIG --version | sed 's/\./ /g'`
-             HAVE_VERSION=`expr $1 \* 10000 + $2 \* 100 + $3`
-             if test $HAVE_VERSION -ge $NEED_VERSION; then
-                 DIRECTFB_CFLAGS=`$DIRECTFBCONFIG --cflags`
-
diff --git a/package/sdl/0003-SDL_x11yuv.c-fix-possible-use-after-free.patch b/package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch
similarity index 100%
rename from package/sdl/0003-SDL_x11yuv.c-fix-possible-use-after-free.patch
rename to package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch
diff --git a/package/sdl/Config.in b/package/sdl/Config.in
index 9f1e34de5c..1d9887f324 100644
--- a/package/sdl/Config.in
+++ b/package/sdl/Config.in
@@ -13,10 +13,6 @@ config BR2_PACKAGE_SDL_FBCON
 	bool "SDL framebuffer console video driver"
 	default y
 
-config BR2_PACKAGE_SDL_DIRECTFB
-	bool "SDL DirectFB video driver"
-	depends on BR2_PACKAGE_DIRECTFB
-
 config BR2_PACKAGE_SDL_X11
 	bool "SDL X11 video driver"
 	depends on BR2_PACKAGE_XORG7
diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 462600debb..439c30b2a5 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -28,7 +28,9 @@ HOST_SDL_PRE_CONFIGURE_HOOKS += SDL_RUN_AUTOGEN
 SDL_DEPENDENCIES += host-automake host-autoconf host-libtool
 HOST_SDL_DEPENDENCIES += host-automake host-autoconf host-libtool
 
-SDL_CONF_OPTS += --enable-video-qtopia=no
+SDL_CONF_OPTS += \
+	--enable-video-qtopia=no \
+	--enable-video-directfb=no
 
 ifeq ($(BR2_PACKAGE_SDL_FBCON),y)
 SDL_CONF_OPTS += --enable-video-fbcon=yes
@@ -36,14 +38,6 @@ else
 SDL_CONF_OPTS += --enable-video-fbcon=no
 endif
 
-ifeq ($(BR2_PACKAGE_SDL_DIRECTFB),y)
-SDL_DEPENDENCIES += directfb
-SDL_CONF_OPTS += --enable-video-directfb=yes
-SDL_CONF_ENV = ac_cv_path_DIRECTFBCONFIG=$(STAGING_DIR)/usr/bin/directfb-config
-else
-SDL_CONF_OPTS += --enable-video-directfb=no
-endif
-
 ifeq ($(BR2_PACKAGE_SDL_X11),y)
 SDL_CONF_OPTS += --enable-video-x11=yes
 SDL_DEPENDENCIES += \
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
