Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95213C3DA6E
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 00:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E50841DEF;
	Thu, 21 Dec 2023 00:21:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E50841DEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 73KiGGppT3kj; Thu, 21 Dec 2023 00:21:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A4BE421CE;
	Thu, 21 Dec 2023 00:21:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A4BE421CE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 18EA81BF408
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 00:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E53B740BEC
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 00:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E53B740BEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FXUf3mderZQa for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 00:19:38 +0000 (UTC)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08C9D40323
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 00:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08C9D40323
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1d3aa0321b5so2440135ad.2
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 16:19:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703117976; x=1703722776;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uDn+v5HKB0jNi5NESAeU99hRUIorxCu+cANFsMkRCTQ=;
 b=S4abkaSe+YmRk2mFI0rEXSzkCNEnu8wW8h7APD8zNk4C/AD5Ul8U4sS43o8XGmdXsJ
 EDxW0agWd8DVvVCin5zXPbTO7+m85aaNo3yThSSTJGFufYdN3qYHn+XwZG5UKuhT+SyI
 IICrEu6Tx6YU/YopaWyan5iplFTVAUJ2YQfr/eidI5wbPf8lLN01+y2zmihYQFivZmGS
 ez950EOcTrU3rypmKVlj+9iFi6j45F6e0ECLbw9qOQfcbrrqyRadb4F6sDhzBK6utkjb
 eAc3K1eLSklp+89OrF3tmLKdwFXgoB6BeS0Lddic512Hjdw/zH9jSAjqivhorblMng03
 BOWg==
X-Gm-Message-State: AOJu0YzwJXnenEBmv8V/GYG3u0+TDYXuNNsY7NC3rB0YC3X8INJIsaDO
 ccJI9+6HFhTyp/s4uIrfPo0dBl/SKQy71nfu8QQ=
X-Google-Smtp-Source: AGHT+IEXLDVI5OkAdnD2DSsSI2mHOGvtpciw0Gfe3i0dS9BmRMYyxP3ZHU/YvqXrvvNmvvnQ6gg9rQ==
X-Received: by 2002:a17:902:be15:b0:1d3:f363:b487 with SMTP id
 r21-20020a170902be1500b001d3f363b487mr1381000pls.30.1703117976683; 
 Wed, 20 Dec 2023 16:19:36 -0800 (PST)
Received: from DESKTOP-OI0KN2B.ht.home (174-126-58-188.cpe.sparklight.net.
 [174.126.58.188]) by smtp.gmail.com with ESMTPSA id
 a5-20020a170902ecc500b001d364210979sm294459plh.224.2023.12.20.16.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 16:19:35 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 17:19:22 -0700
Message-ID: <20231221001924.1356215-8-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221001924.1356215-1-adam.duskett@amarulasolutions.com>
References: <20231221001924.1356215-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703117976; x=1703722776;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uDn+v5HKB0jNi5NESAeU99hRUIorxCu+cANFsMkRCTQ=;
 b=Lqsx1QLw2IA1KUF4VO3JLVLX7BGFc6mi/AUbwvLP0QQGOit0T8agfQv8sB0pdi4W/B
 vneE4XbCT2+eD3JlZYw1a2D2ui2bo5LyfBax4i+eTz4m24FApdKmXgMFJu25Kc/X3K2N
 lRFY54LskQ3fJvfST6fbQypsA0KU07d9BNOJE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Lqsx1QLw
Subject: [Buildroot] [PATCH v3 08/10] package/sway: enable swaybar tray
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
index 93eaf26ce7..f60d55f190 100644
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
