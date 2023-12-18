Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28ED4C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 19:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D111D41B56;
	Mon, 18 Dec 2023 19:42:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D111D41B56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iDcn1ogKsVCS; Mon, 18 Dec 2023 19:42:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31801419D6;
	Mon, 18 Dec 2023 19:42:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31801419D6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 661521BF3DC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CE3D60BEB
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CE3D60BEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4AvEYWaRpNzp for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 19:40:18 +0000 (UTC)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 67E8460B50
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 19:40:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67E8460B50
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1d39e2f1089so18920175ad.1
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 11:40:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702928417; x=1703533217;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=asduD17pHjQIbrwIgRF6O3H+xw4s44QbsAZesgT9NQs=;
 b=h9rkh519VArvlPuQWFLMXRaM+S/9t+dQ1QL/dHDUpFDA/eR/xvK3XKF/Zx/MO8VLT8
 fX2/vz8oRDfvTfvrcLtCYs6KA3FDjv37gJT87YyyTZagFCKylU28Mf650OQ0ktsB+I1g
 kutgvJ60iX9rzyh2GlmC61ltaVdkQgvDxdM/c3hBe9ptl67euAFC2lgDT+MQbnz55INo
 bcK5oAy709GlzYhLkNRHjLRLNG47whs93vWX5VOCYbCOSLr/VsowmgUlWGraxtUyNc9C
 wzR8thfN5ViLDVtxjdbZ1PkHjT2ABVHyIfw140vyqfhA56S/f1rRVEVbpRzqY46Vdd9P
 eAeQ==
X-Gm-Message-State: AOJu0Yz5/qgEQ2VzUOXxxgkFYhYF3sQxbF0QetvL9y+UFJ+J7CUvglhz
 Bjubg4I1FcV33wIEMDOLE5rSx1WgU4DXCHYegpo=
X-Google-Smtp-Source: AGHT+IFbqMWWzCv8RTp4k/7Avun+oVKsFTptDzQGxK5t5y98lc4KKA9U8wTuokGftaWhMKh/Du2iHQ==
X-Received: by 2002:a17:902:b197:b0:1d0:7f06:1751 with SMTP id
 s23-20020a170902b19700b001d07f061751mr17280071plr.79.1702928416960; 
 Mon, 18 Dec 2023 11:40:16 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 jj20-20020a170903049400b001cfbd3f38dcsm2983808plb.225.2023.12.18.11.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 11:40:16 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 12:39:55 -0700
Message-ID: <20231218194001.544887-10-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218194001.544887-1-adam.duskett@amarulasolutions.com>
References: <20231218194001.544887-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702928417; x=1703533217;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=asduD17pHjQIbrwIgRF6O3H+xw4s44QbsAZesgT9NQs=;
 b=P9D1/ZwiKCj90Fa9Hn1lTbsv45e/Ap9LF676zdaoGXLRpPWU4B3paw1Vbb4qQCHO41
 rCknpsmNX/kuO76kzXKavbyNNpVflY2G+gq3OJ1VEKxHguE0U/QlGi8g0mh9bNl1h41s
 iUZD/FASjllrvAd0fnQ3V4jR05J1kxRBMz2AQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=P9D1/Zwi
Subject: [Buildroot] [PATCH v2 10/14] package/sway: enable default-wallpaper
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a config option to enable the default-wallpaper.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/sway/Config.in | 8 ++++++++
 package/sway/sway.mk   | 7 ++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index 95b19dd464..933a065075 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -24,6 +24,14 @@ config BR2_PACKAGE_SWAY
 
 	  https://github.com/swaywm/sway
 
+if BR2_PACKAGE_SWAY
+
+config BR2_PACKAGE_SWAY_DEFAULT_WALLPAPER
+	bool "Install default wallpaper"
+	select BR2_PACKAGE_SWAYBG
+
+endif # BR2_PACKAGE_SWAY
+
 comment "sway needs systemd, udev, EGL w/ Wayland backend and OpenGL ES support"
 	depends on !BR2_PACKAGE_SYSTEMD || \
 		!BR2_PACKAGE_HAS_UDEV || \
diff --git a/package/sway/sway.mk b/package/sway/sway.mk
index 677b101f1d..e2065c4d4f 100644
--- a/package/sway/sway.mk
+++ b/package/sway/sway.mk
@@ -11,7 +11,6 @@ SWAY_LICENSE_FILES = LICENSE
 SWAY_DEPENDENCIES = systemd host-pkgconf wlroots json-c pcre cairo pango
 SWAY_CONF_OPTS = \
 	-Dwerror=false \
-	-Ddefault-wallpaper=false \
 	-Dzsh-completions=false \
 	-Dfish-completions=false \
 	-Dswaybar=false \
@@ -39,4 +38,10 @@ else
 SWAY_CONF_OPTS += -Dbash-completions=false
 endif
 
+ifeq ($(BR2_PACKAGE_SWAY_DEFAULT_WALLPAPER),y)
+SWAY_CONF_OPTS += -Ddefault-wallpaper=true
+else
+SWAY_CONF_OPTS += -Ddefault-wallpaper=false
+endif
+
 $(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
