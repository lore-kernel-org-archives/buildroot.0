Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A0BC46CD2
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 15:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AA8B40295;
	Thu, 21 Dec 2023 15:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AA8B40295
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ryjNCZb57XyZ; Thu, 21 Dec 2023 15:38:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BD924259B;
	Thu, 21 Dec 2023 15:38:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BD924259B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 38F491BF381
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 15:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FB5240A50
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 15:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FB5240A50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6wzg-ZfQVTVO for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 15:36:33 +0000 (UTC)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE2A14031D
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 15:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE2A14031D
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1d3e84fded7so6322635ad.1
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 07:36:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703172992; x=1703777792;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ip+hxK3XLLCf5QueWnz8yYOe/pvufVfT5580/mdnUq8=;
 b=Cj+FAY4Hd//L4N7n+wCn4kCVLHkI09VAO6pR/junxObaU3j9uLragrHOERMYt8wfdi
 1nWMJlcW1LHSyEzZ24/Hn+LMfD/ccGkHKnW3R2vAMIm3lmwGOfXy+oMaV9uwEhDbDPCZ
 TLbE81zwXSNxD7lOzK1TUco+wMAuifmi1M843MmfRv2ZsuE6LGzVEcmouiy24tIHusQr
 b/t10S+h1NZgjLHZ7vRmFwrXV3Ef1fzfLgXHgFGsNGGgEWW1j3q0Mg3rXWCKxQ86Am9w
 q6aTkFJ2ocYmlmCiy4JJ+Pon+vtoaMlNW/m2ORfJfyFNnfSsQQ8VK2OYfWFqDAZnPkFL
 NoSQ==
X-Gm-Message-State: AOJu0YwME9XHcr1SblKiB7Y6dX5o0z+WQnMGO0hCwvJ9bjoEvG5atk4w
 I8cOczdy08KOwwHtBkRYMChVbcnSwHjt1VN7OmQ=
X-Google-Smtp-Source: AGHT+IGWxgPWxQt+l4RRbnQTOrylDv+A1f3FIzWhp+uLCfRBayRm5d7xQNFjG1dEwDCycWQUEISjhA==
X-Received: by 2002:a17:902:e5cc:b0:1d3:e78a:3f05 with SMTP id
 u12-20020a170902e5cc00b001d3e78a3f05mr3621497plf.38.1703172992003; 
 Thu, 21 Dec 2023 07:36:32 -0800 (PST)
Received: from DESKTOP-OI0KN2B.ht.home (174-126-58-188.cpe.sparklight.net.
 [174.126.58.188]) by smtp.gmail.com with ESMTPSA id
 g24-20020a170902fe1800b001d0c41b1d03sm1792029plj.32.2023.12.21.07.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 07:36:31 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 21 Dec 2023 08:36:18 -0700
Message-ID: <20231221153620.237439-9-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221153620.237439-1-adam.duskett@amarulasolutions.com>
References: <20231221153620.237439-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703172992; x=1703777792;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ip+hxK3XLLCf5QueWnz8yYOe/pvufVfT5580/mdnUq8=;
 b=Iou1sbFbXAIwpxTxX4FG/Kximjjp12oMtjFj2LgqWUixFqOBkJe/4wdhIuO3usRwuS
 VCwNxEECjDI58IUtjJ0GcbDUJH7MCzRzuU33+FkBDj2WIdhapZrPcFImtNQDnsY9OqWe
 TrM8h6u8517Y3Ouw4l+iFHC51BugVfp7PUydg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Iou1sbFb
Subject: [Buildroot] [PATCH v4 09/10] package/sway: enable swaynag support
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

Add a config option to build sway with swaynag support.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/sway/Config.in | 5 +++++
 package/sway/sway.mk   | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index 76f8ce3836..21840dce17 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -43,6 +43,11 @@ config BR2_PACKAGE_SWAY_SWAYBAR_TRAY
 
 endif # BR2_PACKAGE_SWAY_SWAYBAR
 
+config BR2_PACKAGE_SWAY_SWAYNAG
+	bool "swaynag"
+	help
+	  Enable support for swaynag
+
 endif # BR2_PACKAGE_SWAY
 
 comment "sway needs systemd, udev, EGL w/ Wayland backend and OpenGL ES support"
diff --git a/package/sway/sway.mk b/package/sway/sway.mk
index 5de4c32a04..0aad9de712 100644
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
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
