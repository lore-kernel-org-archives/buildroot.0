Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F41EC61D99
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 00:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58DA980C57;
	Thu, 23 Nov 2023 00:10:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58DA980C57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wJqXBElbFGlK; Thu, 23 Nov 2023 00:10:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A782B81318;
	Thu, 23 Nov 2023 00:10:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A782B81318
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2400F1BF4D6
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 00:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFF1C4015A
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 00:08:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFF1C4015A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id re7VIvtlhGtW for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 00:08:41 +0000 (UTC)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C097400D8
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 00:08:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C097400D8
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6c4eaa5202aso369924b3a.1
 for <buildroot@buildroot.org>; Wed, 22 Nov 2023 16:08:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700698120; x=1701302920;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ufBMX+c97c6DwDvsqRocQDqPRFibE7zczdBXz20Bdjk=;
 b=gBU3ZNSwQROBCuMrg7cvmCmghpSUNAp4iiULFGtPChMHwOSFzFtscLKlyGYdYZcyWB
 d/A5zCBneLGaAmBvquCDplikT9qEhOR8NPeE5xeEFah0GsVFJmq8VJStcNEovWCeduzp
 fwukT22dTV/oAXtRP/6a60b2ZS6I1Z5W2bI+UCltPyL7Buu0JIfKt0ikXFqm4DBS+PFD
 1+XZAMdP3NkumhbCB0V+JCeTGWeOE7OKHvF2AXAOu2ZU4uFDfbNwTR6YWWCWvSbbNBGA
 dI2OmjOlyN9DrFQVyapwUO/gbKszQBIQW0uMNPhUrxoTxJ/7XIf65JjR5rlz2GCIdxWm
 7m4A==
X-Gm-Message-State: AOJu0Yw4QWrRjH+4q4M1XiFIlZvCrhS9cN4JDsYMJGbIdpfQcKclHj8n
 BkhQxaaO3OMmluw8HC/coz//txDqPVzZZcMijvE=
X-Google-Smtp-Source: AGHT+IGuPrgmt/fw5PqC+bxdZPFA6zGuzlQ9/ClHptyDwnUK+8oWVtzt5wc2Fv4rXGt+rH1y8Nd/tA==
X-Received: by 2002:a05:6a21:99a4:b0:140:f6c4:aa71 with SMTP id
 ve36-20020a056a2199a400b00140f6c4aa71mr4790655pzb.8.1700698120060; 
 Wed, 22 Nov 2023 16:08:40 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.200.138])
 by smtp.gmail.com with ESMTPSA id
 fb6-20020a056a002d8600b006cb907e8059sm56858pfb.9.2023.11.22.16.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 16:08:39 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 Nov 2023 17:08:16 -0700
Message-ID: <20231123000819.488595-11-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231123000819.488595-1-adam.duskett@amarulasolutions.com>
References: <20231123000819.488595-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700698120; x=1701302920;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ufBMX+c97c6DwDvsqRocQDqPRFibE7zczdBXz20Bdjk=;
 b=DcMhAjtfWRcagNzGEYsYou2OVyMNVILoXAiQOcBt7y/ZoxTSiBWQEhorbcP8vOFWlo
 +qruHLtAdQgFcrBRwg07jP6V4LrF403paNSYNORqO8jGphTMUjgXb8UGOJClIpY0AuSR
 SMKU4TU2CuOxXkKF3oLacGQc0LUiPOX79Xsf4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=DcMhAjtf
Subject: [Buildroot] [PATCH/next 10/13] package/sway: enable swaybar support
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

Add a config option to build sway with swaybar support.
  - The bar requires dejavu fonts.
  - If bash-completions is selected, JQ is required.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/sway/Config.in | 7 +++++++
 package/sway/sway.mk   | 7 ++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index 950ad82b05..4e3bf576a4 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -32,6 +32,13 @@ config BR2_PACKAGE_SWAY_DEFAULT_WALLPAPER
 	bool "Install default wallpaper"
 	select BR2_PACKAGE_SWAYBG
 
+config BR2_PACKAGE_SWAY_SWAYBAR
+	bool "swaybar"
+	select BR2_PACKAGE_DEJAVU
+	select BR2_PACKAGE_JQ if BR2_PACKAGE_BASH_COMPLETION
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
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
