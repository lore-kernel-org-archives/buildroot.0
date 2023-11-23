Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18044C61D99
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 00:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4EDB812A5;
	Thu, 23 Nov 2023 00:11:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4EDB812A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yxImU3N0vLP5; Thu, 23 Nov 2023 00:11:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0369481F8E;
	Thu, 23 Nov 2023 00:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0369481F8E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D602C1BF4D6
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 00:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA6FC81F5A
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 00:08:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA6FC81F5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cW4JltsugEfz for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 00:08:44 +0000 (UTC)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A7DD81F11
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 00:08:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A7DD81F11
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6b709048d8eso359241b3a.2
 for <buildroot@buildroot.org>; Wed, 22 Nov 2023 16:08:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700698123; x=1701302923;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Yxl5XAGh3mkp6ArRUh0hLqw3iEpLXaigRlGHewXkEI=;
 b=NKLZgW+itL7KYXbMepjqIvt/o779PP1qlyBxSFVGKbnjmEz+V4acxNliUpF/+xAkjM
 GvWPUY6INob7PtQUjyGU4V7Je+J2GQdEgceGm/O7X7WwhxptHw06kptYFML1JqyOvcAl
 Ey+ZedNOL2EXI5O9i80R7epA5K+0BF5ZYrM6v8Tk3vRLK7YwXA75ldwLb+hpLOtL7aYI
 IaHz1bCfnS5aNY+0oY96nGdDZtS5KQyO2xeInw+JlnHdwMNd5t0FVdT53LQSXNOehjpC
 8ZPCBa4iulW33Iz9bAX/TWBtZaB+YORl6hD5feERPrHGVU2NbxOQEa9oUXX6Ax+vMqAY
 QT9w==
X-Gm-Message-State: AOJu0YxgYFRUxzQtX3jiZBg5K1kkCst9ajrfSuqXO+pk5OJkrm+1xnP8
 oGDiwCewxRFuNCoHrIhiyW/jAsUGy+qUw4H6P64=
X-Google-Smtp-Source: AGHT+IHIJNM2lOP8IxuNwGqJm+eVoFnYLCpZmeCv4rD7tRrK1zmjAb3EioE0P1XKA3rlxkpBdBT3CQ==
X-Received: by 2002:a05:6a20:72a4:b0:188:8a66:8e8d with SMTP id
 o36-20020a056a2072a400b001888a668e8dmr4563713pzk.45.1700698122791; 
 Wed, 22 Nov 2023 16:08:42 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.200.138])
 by smtp.gmail.com with ESMTPSA id
 fb6-20020a056a002d8600b006cb907e8059sm56858pfb.9.2023.11.22.16.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 16:08:42 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 Nov 2023 17:08:18 -0700
Message-ID: <20231123000819.488595-13-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231123000819.488595-1-adam.duskett@amarulasolutions.com>
References: <20231123000819.488595-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700698123; x=1701302923;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Yxl5XAGh3mkp6ArRUh0hLqw3iEpLXaigRlGHewXkEI=;
 b=bJQ1HAdnlP1+SkmNyHFCvInXzw7wD3fm0iOv+uvfNDH7oACT6cV6MoYbFTQgz7AHxe
 jvRsgjzgFBJtDu6KGytAWZb3Q7KEvz2AXY6nc5U0CJJd8u1npMBtKELKBP7gJSpNCBWA
 2bK3eCjXegw3il7QHzUMH/1BtFvASaDF7jKbA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=bJQ1HAdn
Subject: [Buildroot] [PATCH/next 12/13] package/sway: enable swaynag support
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

Add a config option to build sway with swaynag support.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/sway/Config.in | 5 +++++
 package/sway/sway.mk   | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index eef9b2a74d..3c573f83d5 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -48,6 +48,11 @@ config BR2_PACKAGE_SWAY_SWAYBAR_TRAY
 
 endif # BR2_PACKAGE_SWAY_SWAYBAR
 
+config BR2_PACKAGE_SWAY_SWAYNAG
+	bool "swaynag"
+	help
+	  Enable support for swaynag
+
 endif # BR2_PACKAGE_SWAY
 
 comment "sway needs systemd, udev, EGL w/ Wayland backend and OpenGL ES support"
diff --git a/package/sway/sway.mk b/package/sway/sway.mk
index 39098797eb..7e1bd61a40 100644
--- a/package/sway/sway.mk
+++ b/package/sway/sway.mk
@@ -13,7 +13,6 @@ SWAY_CONF_OPTS = \
 	-Dwerror=false \
 	-Dzsh-completions=false \
 	-Dfish-completions=false \
-	-Dswaynag=false \
 	-Dman-pages=disabled \
 	-Dsd-bus-provider=libsystemd
 
@@ -48,6 +47,12 @@ else
 SWAY_CONF_OPTS += -Dswaybar=false
 endif
 
+ifeq ($(BR2_PACKAGE_SWAY_SWAYNAG),y)
+SWAY_CONF_OPTS += -Dswaynag=true
+else
+SWAY_CONF_OPTS += -Dswaynag=false
+endif
+
 ifeq ($(BR2_PACKAGE_SWAY_SWAYBAR_TRAY),y)
 SWAY_CONF_OPTS += -Dtray=enabled
 else
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
