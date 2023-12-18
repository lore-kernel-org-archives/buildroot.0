Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A760CC35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 19:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DDD4404E1;
	Mon, 18 Dec 2023 19:42:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DDD4404E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k_me9GuLVuI2; Mon, 18 Dec 2023 19:42:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE02841B56;
	Mon, 18 Dec 2023 19:42:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE02841B56
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 81BEA1BF3DC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6862860BEB
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:40:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6862860BEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GBn0-y5kXIwL for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 19:40:19 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA14360B50
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 19:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA14360B50
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1d3b4b803f4so7538075ad.1
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 11:40:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702928418; x=1703533218;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wqAT1sJCF2GObpdv0saFjfe1SVoemuvstyYhWxFhhps=;
 b=bnZkYHGt443YMT1UvqAj1nUcD6vuf5nbHmCoGCsT/JDmgskbOl/gVhkVuG/3Y1ffQV
 zeVUHT8+S368+4Maz/eJ7rAhSTaGgysiMQRn6TPg/WzgeQ3iYalrsE3PZc9H0Or8s7f5
 PQY4BQxMXApeQaRHcG9fy2D/ZhxUcMqPv9pnSdY/Efi+N+rh773ShY/3uJBZlEl+vkM1
 d6fQedR97XHTe4BTke9u6PlQvMGEZsnRVaCdMNDS/4yrKYWsjg9gjrvfie+3i6d+7CiM
 RH2Mbit5Zk3FBlywpvjQnD5eWVWVQJJHdytpIygHaBh8UeOJlANnmF4cn5JNT3AsQhG1
 oV0w==
X-Gm-Message-State: AOJu0YyUue00RrUdML3KuLaxdcnnkzloxaMg3awInxOlXWdzvRlCkx43
 yKCJKxxJJgyUQ46I+gB7FwpiRruOQgOmMkBQIY8=
X-Google-Smtp-Source: AGHT+IHBvLL3ilwKIM0bhxzLJ71ilcqpGDa6k9bwoL923OCBnFkC9dXpsaN1BuaTfhSRkksdl29oEQ==
X-Received: by 2002:a17:902:64d6:b0:1d3:b542:1f1d with SMTP id
 y22-20020a17090264d600b001d3b5421f1dmr1218563pli.43.1702928418373; 
 Mon, 18 Dec 2023 11:40:18 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 jj20-20020a170903049400b001cfbd3f38dcsm2983808plb.225.2023.12.18.11.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 11:40:17 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 12:39:56 -0700
Message-ID: <20231218194001.544887-11-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218194001.544887-1-adam.duskett@amarulasolutions.com>
References: <20231218194001.544887-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702928418; x=1703533218;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wqAT1sJCF2GObpdv0saFjfe1SVoemuvstyYhWxFhhps=;
 b=IyC5TZVetNsnaU8JqqWYYLC4jpmxuw5drtZpNRDjdnQD4sK7g6gVz7rbtxlYjiD4mL
 aCQIzR7q7Yv6czB9liUULiLhtH/xuZcZNnJE3l8CEKjMrrI4uMKx/86D4VkqWVoj8rPe
 tV7vdf34M1jexPLeCB/lAW8NzZzLoeUZ2SsZU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=IyC5TZVe
Subject: [Buildroot] [PATCH v2 11/14] package/sway: enable swaybar support
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

Add a config option to build sway with swaybar support.
  - The bar requires dejavu fonts.
  - If bash-completions is selected, JQ is required.
  - Select dmenu-wayland as a runtime dependency.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: select BR2_PACKAGE_DMENU_WAYLAND as a runtime dependency

 package/sway/Config.in | 8 ++++++++
 package/sway/sway.mk   | 7 ++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index 933a065075..cca9c4a21e 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -30,6 +30,14 @@ config BR2_PACKAGE_SWAY_DEFAULT_WALLPAPER
 	bool "Install default wallpaper"
 	select BR2_PACKAGE_SWAYBG
 
+config BR2_PACKAGE_SWAY_SWAYBAR
+	bool "swaybar"
+	select BR2_PACKAGE_DEJAVU
+	select BR2_PACKAGE_JQ if BR2_PACKAGE_BASH_COMPLETION
+	select BR2_PACKAGE_DMENU_WAYLAND # Runtime
+	help
+	  Enable support for swaybar
+
 endif # BR2_PACKAGE_SWAY
 
 comment "sway needs systemd, udev, EGL w/ Wayland backend and OpenGL ES support"
diff --git a/package/sway/sway.mk b/package/sway/sway.mk
index e2065c4d4f..12b039885f 100644
--- a/package/sway/sway.mk
+++ b/package/sway/sway.mk
@@ -13,7 +13,6 @@ SWAY_CONF_OPTS = \
 	-Dwerror=false \
 	-Dzsh-completions=false \
 	-Dfish-completions=false \
-	-Dswaybar=false \
 	-Dswaynag=false \
 	-Dtray=disabled \
 	-Dman-pages=disabled \
@@ -44,4 +43,10 @@ else
 SWAY_CONF_OPTS += -Ddefault-wallpaper=false
 endif
 
+ifeq ($(BR2_PACKAGE_SWAY_SWAYBAR),y)
+SWAY_CONF_OPTS += -Dswaybar=true
+else
+SWAY_CONF_OPTS += -Dswaybar=false
+endif
+
 $(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
