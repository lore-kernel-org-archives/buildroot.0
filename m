Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AD4E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 14:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52C5E405A5;
	Sun, 29 Dec 2024 14:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OyBWFF2BD7Bq; Sun, 29 Dec 2024 14:56:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43B4D405B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43B4D405B1;
	Sun, 29 Dec 2024 14:56:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E62072
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 14:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C214960783
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 14:55:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KipaaqP_xcXL for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 14:55:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CCEAE60852
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCEAE60852
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CCEAE60852
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 14:55:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 43341E0004;
 Sun, 29 Dec 2024 14:55:49 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Fischer <mf@go-sys.de>
Date: Sun, 29 Dec 2024 15:55:31 +0100
Message-ID: <20241229145542.742168-9-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229145542.742168-1-thomas.petazzoni@bootlin.com>
References: <20241229145542.742168-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735484149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VyYMBqHKzXSncmIxX2zaoPmBKLKfXwHjuvHWbbAkX4c=;
 b=d+tkfR02Mxxp8bAoPNGcSgUfQlw4IZAhopq0OZiGwW843GKSt4HGULtd7m1ZnZNx2fmP7U
 u5khJHemKRLPqJuPPk9uk4fFq4t57p/ZJECLQjDTDK3kHzA/vL3c5U007QNpHpKSGASNbt
 G6VRTIxLN7P77HHgcbO1O5wqAPVw+p9+6cn5H14N0BgJuUe8pxQ2le6nrml/558xmotrCZ
 dNl7tVfS+Or1SXUb/LkEWOUmyJQSzDaQw2xnMArffFm64Yf+1gzM1rbmKNzz7GbdOSEJSq
 SEY74H1jtsQPOakMqe8oItLgEqYD59ExYADXmai1qFVEVNRcK6fTVfq0xWWthA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=d+tkfR02
Subject: [Buildroot] [PATCH 08/12] package/sdl2: drop directfb support
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
support in sdl2.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy       | 7 +++++++
 package/sdl2/Config.in | 7 -------
 package/sdl2/sdl2.mk   | 9 +--------
 3 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 1a1ee21424..f610f1311b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_PACKAGE_SDL2_DIRECTFB
+	bool "sdl2 directfb support removed"
+	select BR2_LEGACY
+	help
+	  The directfb support from SDL2 is no longer available, as
+	  directfb is no longer packaged in Buildroot.
+
 config BR2_PACKAGE_SDL_DIRECTFB
 	bool "sdl directfb support removed"
 	select BR2_LEGACY
diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
index 7c8258fe73..f1c22e4f80 100644
--- a/package/sdl2/Config.in
+++ b/package/sdl2/Config.in
@@ -11,13 +11,6 @@ config BR2_PACKAGE_SDL2
 
 if BR2_PACKAGE_SDL2
 
-config BR2_PACKAGE_SDL2_DIRECTFB
-	bool "DirectFB video driver"
-	depends on BR2_PACKAGE_DIRECTFB
-
-comment "DirectFB video driver needs directfb"
-	depends on !BR2_PACKAGE_DIRECTFB
-
 config BR2_PACKAGE_SDL2_X11
 	bool "X11 video driver"
 	depends on BR2_PACKAGE_XORG7
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 9eee5c7123..62d6e91894 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -27,6 +27,7 @@ SDL2_CONF_OPTS += \
 	--disable-video-dummy \
 	--disable-video-offscreen \
 	--disable-video-vulkan \
+	--disable-video-directfb \
 	--disable-ime \
 	--disable-ibus \
 	--disable-fcitx \
@@ -77,14 +78,6 @@ else
 SDL2_CONF_OPTS += --disable-3dnow
 endif
 
-ifeq ($(BR2_PACKAGE_SDL2_DIRECTFB),y)
-SDL2_DEPENDENCIES += directfb
-SDL2_CONF_OPTS += --enable-video-directfb
-SDL2_CONF_ENV += ac_cv_path_DIRECTFBCONFIG=$(STAGING_DIR)/usr/bin/directfb-config
-else
-SDL2_CONF_OPTS += --disable-video-directfb
-endif
-
 ifeq ($(BR2_PACKAGE_SDL2_OPENGLES)$(BR2_PACKAGE_RPI_USERLAND),yy)
 SDL2_DEPENDENCIES += rpi-userland
 SDL2_CONF_OPTS += --enable-video-rpi
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
