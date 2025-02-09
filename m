Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6C2C0219E
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 18:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 120C241267;
	Sun,  9 Feb 2025 18:16:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e5z37HuWzTWv; Sun,  9 Feb 2025 18:16:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB8334126D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB8334126D;
	Sun,  9 Feb 2025 18:16:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BEC62C2
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 18:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F3FE403F6
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 18:16:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P95Gf4fWBjdH for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 18:16:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.45;
 helo=mail-wm1-f45.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 562A640253
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 562A640253
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 562A640253
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 18:16:36 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso24294315e9.0
 for <buildroot@buildroot.org>; Sun, 09 Feb 2025 10:16:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739124994; x=1739729794;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fPHtA7s/ey55yWTO5oSmsnsB+pI/QoAjabQF+XwuIaE=;
 b=LnC9p6NpN9WakWQ+kx9YgdbUrzuBJWABg1rVwiKfsTr48wDu8EdHYq83ilZwXHWLVV
 dCZFQC/mW42dNWkCmKNm2qu602P2Qn1uzZ6+uZbu4KRreWGlYJhDwMA3QPhwXr2LBxas
 8/H43yJ0zXodMK0SSq37I7VAhHLIpNHY9MT/zIUB5W+8o6u6+EvbbZ8tTPDvKA4oIN2u
 6I1V6k4CeaRXhMIpEkloRCCFQbsdktIPpZxfC8/sjuErttyCaZ4voVI0CLJ2GVO1nvXV
 viIc6CZMU2aSIOO7c46EIRrv10sn0bo6aVvKjoHLVTuY7ZraQYdvvcrcQAOOgIhVbKfX
 R1Xw==
X-Gm-Message-State: AOJu0YzkEor+DTDeA0Dcn3X4ld7GabH7yPUmuADCviYHGAGk0Ppiu1Xr
 FmcTBGSyrXr9KzOjzUL8Fy2EpQ6hEdFcqOJIIL8b9tr7lke98i6EVHIS53W3
X-Gm-Gg: ASbGncsFC/EOz2xLhLL3tEY1iD/rFCUg9xCPUrsHxQYBWHlm9fB3r3xn2/vkyWYm4ON
 W9RPGNgSxFiTcQykThi04We0fMwq82ZukMxNFV+DKQvZL9R7SEB3WILtCjssMtRzpef1c4Z9LjZ
 Nh/N4kFocfaLV6Q07aW4VrgmcaZtVGP526yh1TOuW9BzOko94cYyFwf+yYqyl4x01hsI5YOhRjR
 YYrzbWLXNQdbKfvB3zW/lkZXAv4ibto5kpOdOHQUKwwB546k1KoEtCY2TtAb0t3H56C4w2kMIOL
 CP0ivEsxtwgQdNPuNv0plmQIvFihELgL
X-Google-Smtp-Source: AGHT+IHM5pK/UBI6t8Gj7+owzsGVDbF15oqMPAuijf+evd75vxxzMnMjhdEo537lkTigvCoM89MrqQ==
X-Received: by 2002:a05:600c:6dd7:b0:439:31e0:d9a2 with SMTP id
 5b1f17b1804b1-43931e0dfeamr43259525e9.3.1739124992388; 
 Sun, 09 Feb 2025 10:16:32 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:7ada:5f12:facf:db67])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391da965b3sm125203055e9.5.2025.02.09.10.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2025 10:16:31 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Michael Fischer <mf@go-sys.de>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Sun,  9 Feb 2025 19:16:25 +0100
Message-ID: <20250209181625.87351-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240830175229.2619362-1-thomas@devoogdt.com>
References: <20240830175229.2619362-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v2] package/sdl2: add wayland support
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

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

This adds a configuration option to enable the Wayland
video driver support in SDL2.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Tested-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
v2:
- Added tested sign-off, see https://patchwork.ozlabs.org/comment/3457513/.
- Slightly changed the git message.
---
 package/sdl2/Config.in | 17 +++++++++++++++++
 package/sdl2/sdl2.mk   |  8 +++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
index f1c22e4f80..018e64a8d8 100644
--- a/package/sdl2/Config.in
+++ b/package/sdl2/Config.in
@@ -22,6 +22,23 @@ comment "X11 video driver needs X.org"
 	depends on !BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU
 
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
 config BR2_PACKAGE_SDL2_KMSDRM
 	bool "KMS/DRM video driver"
 	depends on BR2_TOOLCHAIN_HAS_THREADS  # libdrm
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 50f80c68d7..b648eb6ab8 100644
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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
