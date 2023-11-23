Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F37C27C40
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 00:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E9FD81FB0;
	Thu, 23 Nov 2023 00:10:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E9FD81FB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x924wD1LPva5; Thu, 23 Nov 2023 00:10:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56BC281F95;
	Thu, 23 Nov 2023 00:10:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56BC281F95
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 03AD61BF4D6
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 00:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE59B4168E
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 00:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE59B4168E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id njsK7z68rLwu for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 00:08:42 +0000 (UTC)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4AB04415FB
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 00:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AB04415FB
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6cb749044a2so382425b3a.0
 for <buildroot@buildroot.org>; Wed, 22 Nov 2023 16:08:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700698121; x=1701302921;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vqg/HLK0LUWjmS5hTuAKTGpqtd+f/aCGPb85CWnJXNs=;
 b=fXnESUlVHYkJBfIcW35Xv6Z4vVd/zw8AOxWAVaarDZ+C5JXPZCoJWb6rvFqL7oGOxa
 v5iOagYJUlks3sngbdiyIiOTkQHw8FehjA/7QhHmyr9/8MCBWIoLop8dABWHt20LvpfI
 QBzmF+9vpiJDao/7RBlQxEDETUnr/x2okwrDI3IxTaPe9mP5+b6MDam1o6bV7XXMB6aN
 R8ntXvYeqlsdY6cDoRiConjqu+IvoVdfbALqecOXlCDH+h6ahKNLiK+Pjo/bDMf82bNG
 W7v/pF/O01y9AwRslSFMUUY5e8EDbeocE1nd///lDoyZ6lDKZ9TnFr5oo4bOgQaJCZ6c
 HzIA==
X-Gm-Message-State: AOJu0Yxfe0mR32cye/SKaJ5GXc8ZpTiNlB7gfiB0N5E/HXXvv7gq4YTu
 4DDI6JFQDRl6ycDZqqa9BlSQBP3KHgnTF0xXS1I=
X-Google-Smtp-Source: AGHT+IEAoXMzFyjkdP4eRwjUjVGK4N4NCNoooDGvcUultufIXDnvef95yomRewiMhjB2Whk30N0zBQ==
X-Received: by 2002:a05:6a20:2595:b0:18b:8475:410a with SMTP id
 k21-20020a056a20259500b0018b8475410amr1214513pzd.7.1700698121328; 
 Wed, 22 Nov 2023 16:08:41 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.200.138])
 by smtp.gmail.com with ESMTPSA id
 fb6-20020a056a002d8600b006cb907e8059sm56858pfb.9.2023.11.22.16.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 16:08:40 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 Nov 2023 17:08:17 -0700
Message-ID: <20231123000819.488595-12-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231123000819.488595-1-adam.duskett@amarulasolutions.com>
References: <20231123000819.488595-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700698121; x=1701302921;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vqg/HLK0LUWjmS5hTuAKTGpqtd+f/aCGPb85CWnJXNs=;
 b=HUiq36aqZt+ShvUKcsik/9zcBzGvPEFbHh+LbGBLhsKeQjQ5Vvk8tIXTAaQ1gK7iKG
 0SVr2IF4dpxgUhkl2C8aLplch/60NSbRzM+rU6iH7fkPCwqcQJkZZCbe8O07sRCrIoru
 emYUbgA6cazk1IrRx+n/prUwmbELPZZj5xm2k=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=HUiq36aq
Subject: [Buildroot] [PATCH/next 11/13] package/sway: enable swaybar tray
 support
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a config option to build swaybar with tray support.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/sway/Config.in | 9 +++++++++
 package/sway/sway.mk   | 7 ++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index 4e3bf576a4..eef9b2a74d 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -39,6 +39,15 @@ config BR2_PACKAGE_SWAY_SWAYBAR
 	help
 	  Enable support for swaybar
 
+if BR2_PACKAGE_SWAY_SWAYBAR
+
+config BR2_PACKAGE_SWAY_SWAYBAR_TRAY
+	bool "swaybar tray"
+	help
+	  Enable support for swaybar tray
+
+endif # BR2_PACKAGE_SWAY_SWAYBAR
+
 endif # BR2_PACKAGE_SWAY
 
 comment "sway needs systemd, udev, EGL w/ Wayland backend and OpenGL ES support"
diff --git a/package/sway/sway.mk b/package/sway/sway.mk
index 12b039885f..39098797eb 100644
--- a/package/sway/sway.mk
+++ b/package/sway/sway.mk
@@ -14,7 +14,6 @@ SWAY_CONF_OPTS = \
 	-Dzsh-completions=false \
 	-Dfish-completions=false \
 	-Dswaynag=false \
-	-Dtray=disabled \
 	-Dman-pages=disabled \
 	-Dsd-bus-provider=libsystemd
 
@@ -49,4 +48,10 @@ else
 SWAY_CONF_OPTS += -Dswaybar=false
 endif
 
+ifeq ($(BR2_PACKAGE_SWAY_SWAYBAR_TRAY),y)
+SWAY_CONF_OPTS += -Dtray=enabled
+else
+SWAY_CONF_OPTS += -Dtray=disabled
+endif
+
 $(eval $(meson-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
