Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007F4C61D99
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 00:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B015580BBE;
	Thu, 23 Nov 2023 00:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B015580BBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kKS5BditCmIe; Thu, 23 Nov 2023 00:10:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C61980E07;
	Thu, 23 Nov 2023 00:10:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C61980E07
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 360841BF4D6
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 00:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A9EB408C5
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 00:08:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A9EB408C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qpy7NH9OZpfD for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 00:08:40 +0000 (UTC)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13BAE4015A
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 00:08:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13BAE4015A
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6cb749044a2so382395b3a.0
 for <buildroot@buildroot.org>; Wed, 22 Nov 2023 16:08:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700698118; x=1701302918;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w2X/y97kO+JGx+s5McB2YvFDLqnM2lf1Ts+WRNFcUP4=;
 b=cA9yTow86cZeIkDrw6z+RwTLwWtJHM+IaiOZfolRX6EWONXZ69O692CCfnX1vPFq8U
 ZzKQQSYvtVzxmrwknByL5qnmcXVH3Yx5BhhDC4hKnCAtqC5Atspw2PeIYO6YgUinqXvk
 OQXPSFDODdPpTjXeZAQ/UJqF6E6TBcDh1VtvUkxjLobLYakftKQJARMEZhuCaJywk+BD
 TN+4IYWZl72fKxrcvHxlVnxnr+Vt6Dl5UdpxqaIidOJ0dzi5NCYqYmiQ8GdogN6Th9t1
 YHhZd3hZHWmUnD2PD4TwHyTcpBsxJtJ3KyoIi41hHE7SW/BHgm9nvKM351suGuJDiF5y
 xQ9w==
X-Gm-Message-State: AOJu0YynjBM4ZwbLJzuzhuHwouvBoiMZWJcgYZtRZiqO9kH6i6ad+8cR
 xn0RYE/dW150XSnAhNxnQWX4EP2FukT5H2exwxQ=
X-Google-Smtp-Source: AGHT+IEdKzv3S/i7tTDgVARJDWUcPcJ4ff8WL+85MFYuNRC80T1ovZ6raO+g8GQGovHRrelHCPOl+A==
X-Received: by 2002:aa7:9a86:0:b0:6c3:1c74:9c5 with SMTP id
 x6-20020aa79a86000000b006c31c7409c5mr4441924pfi.0.1700698118624; 
 Wed, 22 Nov 2023 16:08:38 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.200.138])
 by smtp.gmail.com with ESMTPSA id
 fb6-20020a056a002d8600b006cb907e8059sm56858pfb.9.2023.11.22.16.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 16:08:38 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 Nov 2023 17:08:15 -0700
Message-ID: <20231123000819.488595-10-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231123000819.488595-1-adam.duskett@amarulasolutions.com>
References: <20231123000819.488595-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700698118; x=1701302918;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w2X/y97kO+JGx+s5McB2YvFDLqnM2lf1Ts+WRNFcUP4=;
 b=BynKsozEA2KV7sJWuYtEtVmFSCy2vtYx09z5vm5rG0Z6qlT2BnE3qtmo8ZjfjGzwn7
 1IJDDatIn80FoPW6hSnBTPKwRz9BMMPuwKs5m+SYomCWUaTrZzCUnk4MzyoaaDsKmYx+
 lx5rmo8kR5kU3VUY/u0nwWqsWhJDNUe76b25M=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=BynKsozE
Subject: [Buildroot] [PATCH/next 09/13] package/sway: enable
 default-wallpaper support
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

Add a config option to enable the default-wallpaper.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/sway/Config.in | 8 ++++++++
 package/sway/sway.mk   | 7 ++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index 7c1e849bbc..950ad82b05 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -26,6 +26,14 @@ config BR2_PACKAGE_SWAY
 
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
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
