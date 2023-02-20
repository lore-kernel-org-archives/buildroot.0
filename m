Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53C7C636CC
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 10:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F67B81421;
	Mon, 20 Feb 2023 10:30:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F67B81421
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TpY-cXVJ1tQr; Mon, 20 Feb 2023 10:30:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97312817F5;
	Mon, 20 Feb 2023 10:30:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97312817F5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AE1DC1BF3E9
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 10:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88889404BA
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 10:30:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88889404BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T87jtBhoPkxf for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 10:30:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 750AE400CF
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 750AE400CF
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 10:30:07 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id t15so703002wrz.7
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 02:30:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JXwZLwqaysaDgsq+D6pmfduMgpT9cydrAcdtey4xtOM=;
 b=kHA23D/Nv5YmMB/K00TYlKFeJCGWJOUy4wyBD4etgzFAV96r+vB3z9HsAeMSSAAB1b
 BPJ9D1Gy9ba3eND0P0IHBJ1TgeMnesWkEThk3ZNOLkwTNvs+Z+/MJsW+XKgIaxIkyQrP
 yD2PjhSQPgNL/P0/mllsGCMDaBZIbPoQi0iOxmGPK8tfzkJOc4irmNb+basEDf/TTad/
 AqylAu3txt4e/1mzTgCH5oQtJhSbbIFHFHzBW4Qt/8HmMFopx86/Jpejl0/t4SX/zHyG
 52w3ceEQ8e9EDtFdq7PBfk+VKSsSEbp/N05II/EewlfHufOVPysEdZhHbSnEKLA/gzQv
 G5Ew==
X-Gm-Message-State: AO0yUKVpm+EaJ1XLmt2sQsSQL2PvrJFhiISpiREu/Y/1W37XeKfe64FA
 4t0x1qnB5B+GnNBzNhJjuitgJ0Dunng=
X-Google-Smtp-Source: AK7set9Ek5Qd07pBt7IQEWJ87F0p7DSygz9ZCMurnX5yGP9LimuppE/aHRk7XoPF/KYt9fRdeLy5SQ==
X-Received: by 2002:a05:6000:617:b0:2c5:5822:96d4 with SMTP id
 bn23-20020a056000061700b002c5582296d4mr1824526wrb.30.1676889005167; 
 Mon, 20 Feb 2023 02:30:05 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j2-20020adfea42000000b002c5804b6afasm11788235wrn.67.2023.02.20.02.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 02:30:04 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 11:30:01 +0100
Message-Id: <20230220103001.607877-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JXwZLwqaysaDgsq+D6pmfduMgpT9cydrAcdtey4xtOM=;
 b=H3trf9x0H+vLJTF+PFF4vcL9/3ZtfBR4gaA3+4khmcW2GymCM4xBv6BLSg5FAKNCpE
 RtXM5e+I8rS5qXN41PVWIiCNf+jtWazhBUgea+qtRAR0UAC6+w3SpR+gBeaIPQxCilUg
 dbfLhDocf90WzT9Oh8lvc+YfVVPkEKblS8BtXihMbIDc8k149uvmmxPDRT/66mEdx5oQ
 bLcK/Rko4VJAaRt53a5Km6afn7A/RuM7rIw6Q+mn4EDpfCAAxerpa9duGUjXbN0sR3v2
 Z/ragxQpwWNwGpvw3kOCXTAw8m4uc13ZvwV37tyy7h/uEEghxT2xNhrlPKokvmYjrhEX
 ZVqg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=H3trf9x0
Subject: [Buildroot] [PATCH 1/1] package/glslsandbox-player: add
 wayland-protocols optional dependency
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

wayland-protocols is an optional dependency which is enabled by default
resulting in the following wayland build failure since the addition of
the package in commit f201ca9d0d25b491ec5e1ed4e1d02fd52d027997:

checking for wayland_client... yes
checking for wayland_egl... yes
configure: Wayland EGL support enabled
checking for wayland_protocols... no
configure: error: Package requirements (wayland-protocols >= 1.12) were not met:

Package 'wayland-protocols', required by 'virtual:world', not found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables wayland_protocols_CFLAGS
and wayland_protocols_LIBS to avoid the need to call pkg-config.

Fixes:
 - http://autobuild.buildroot.org/results/865af860f9e52fe5311bb0c6a246ff871ae5a989

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/glslsandbox-player/Config.in             | 5 ++++-
 package/glslsandbox-player/glslsandbox-player.mk | 6 ++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/glslsandbox-player/Config.in b/package/glslsandbox-player/Config.in
index 53646cde1f..9b6f8447f9 100644
--- a/package/glslsandbox-player/Config.in
+++ b/package/glslsandbox-player/Config.in
@@ -112,8 +112,11 @@ endchoice
 if BR2_PACKAGE_GLSLSANDBOX_PLAYER_WL
 config BR2_PACKAGE_GLSLSANDBOX_PLAYER_WL_IVI
 	bool "Wayland IVI shell support"
-endif
 
+config BR2_PACKAGE_GLSLSANDBOX_PLAYER_WL_XDG
+	bool "Wayland XDG shell support"
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
+endif
 endif
 
 comment "glslsandbox-player needs openGL ES and EGL driver"
diff --git a/package/glslsandbox-player/glslsandbox-player.mk b/package/glslsandbox-player/glslsandbox-player.mk
index f0a9475aa6..241f3475d2 100644
--- a/package/glslsandbox-player/glslsandbox-player.mk
+++ b/package/glslsandbox-player/glslsandbox-player.mk
@@ -72,6 +72,12 @@ GLSLSANDBOX_PLAYER_CONF_OPTS += --enable-ivi
 else
 GLSLSANDBOX_PLAYER_CONF_OPTS += --disable-ivi
 endif
+ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_WL_XDG),y)
+GLSLSANDBOX_PLAYER_DEPENDENCIES += wayland-protocols
+GLSLSANDBOX_PLAYER_CONF_OPTS += --enable-wlxdg
+else
+GLSLSANDBOX_PLAYER_CONF_OPTS += --disable-wlxdg
+endif
 else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_X11),y)
 GLSLSANDBOX_PLAYER_DEPENDENCIES += xlib_libX11
 GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=x11
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
