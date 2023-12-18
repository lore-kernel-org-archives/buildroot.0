Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A10C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 19:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C75F141B5E;
	Mon, 18 Dec 2023 19:42:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C75F141B5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QlevjOMsscV1; Mon, 18 Dec 2023 19:42:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23A3441B5B;
	Mon, 18 Dec 2023 19:42:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23A3441B5B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA9291BF3DC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2A5F40648
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2A5F40648
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sHnTdn-fE_me for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 19:40:20 +0000 (UTC)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C290D40463
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 19:40:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C290D40463
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1d3b81d9719so8309005ad.2
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 11:40:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702928420; x=1703533220;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bK+v7S2h2s5a4jGpLLuUaMSUCkJ6AMTlilhGAcf8XgE=;
 b=omdqFZiY4q6C2CQsbeRe/JG+bnAsyxMgC75kC+SI3zSSeKI/8yI0Q8TTvDoYKlVH56
 JI1SD+eTxyGQgcBqiaTxdFMkIAZUJnZs2fDJReds+H4Ed8o+/bM9CjTpEy3sfCXlY1sN
 BxFJvoMwEvv/IiZ++a1obN9PwYTRV29VFHYMfQ6GGd3vEV3m2iCoya2u5TZpD7Izgv7h
 Px6LDKf2fLPhY5k02sgPFVoBjezteIBTxzVOLqIAXwXBm9Rwt6i49JcwHIzRIbntar6w
 l/A+efBYbLHq7EB986IO2xb7r/S3QuDTzNJjkS4MAlcB4/lVdYg7f5Dz0TlsCpOAxOAD
 TxAA==
X-Gm-Message-State: AOJu0YzYJdfIWUSS5Hnk4RR37hHkaIi0rZAPP1S8lbGJriqGBZPWARI4
 bElWBuIGC3VwWW59bTDTSkn0ztsYFTWv5V4nURc=
X-Google-Smtp-Source: AGHT+IG0oIXe+TNYWpnfN+zgrr59oX7P5m7moANt12P7P9LLxFbrJSJgZ9a7Yro8gZzUCP1ogcvb2w==
X-Received: by 2002:a17:902:b197:b0:1d0:c345:c1d7 with SMTP id
 s23-20020a170902b19700b001d0c345c1d7mr8455719plr.77.1702928419722; 
 Mon, 18 Dec 2023 11:40:19 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 jj20-20020a170903049400b001cfbd3f38dcsm2983808plb.225.2023.12.18.11.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 11:40:18 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 12:39:57 -0700
Message-ID: <20231218194001.544887-12-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218194001.544887-1-adam.duskett@amarulasolutions.com>
References: <20231218194001.544887-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702928420; x=1703533220;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bK+v7S2h2s5a4jGpLLuUaMSUCkJ6AMTlilhGAcf8XgE=;
 b=TebeTHI4ICJHCdbBE69tptkqi6dzEvBcdAzdzpVmG6WM4uRiLrpTID8GFiqD1+dtPz
 1Ll08DJPyTLfglLi8qgY/nIIt0weVnIv3DnJPr++Bjl5TifDDKPSPr+S/FQDYfVQC3qE
 Bsr3KGjGzRU79t7f5FqNjWlA3nurOROoNQhCA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=TebeTHI4
Subject: [Buildroot] [PATCH v2 12/14] package/sway: enable swaybar tray
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

Add a config option to build swaybar with tray support.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/sway/Config.in | 9 +++++++++
 package/sway/sway.mk   | 7 ++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index cca9c4a21e..49fca8dba0 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -38,6 +38,15 @@ config BR2_PACKAGE_SWAY_SWAYBAR
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
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
