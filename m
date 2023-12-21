Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA4BC35274
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 15:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA1EB40219;
	Thu, 21 Dec 2023 15:37:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA1EB40219
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EHqjazhW5bqk; Thu, 21 Dec 2023 15:37:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23EB0402B5;
	Thu, 21 Dec 2023 15:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23EB0402B5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CCAFF1BF381
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 15:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3D7760F7A
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 15:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3D7760F7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AgQc182vaEFT for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 15:36:32 +0000 (UTC)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19DF560DF9
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 15:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19DF560DF9
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1d3e8a51e6bso7744765ad.3
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 07:36:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703172991; x=1703777791;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sW1y+b8Hs2+AdlIeMvmdulyISvUTyeuS1J26FVR9g+A=;
 b=ZU+XL0aDllcZW/YdetN1w7qQK5CSPwvr/3LBLtk6FGDxwtX0NrpxnZYVDtWd8QIv/m
 noC6cTJiBcpqi4jB/oKoIHfxeFMBqgIYAuOE1t696RrIs9gqPNDt4vJEL3FOzzJ2Smhg
 QDZUhNyUIDLF9Qam85QXf4lACigWBP12bt3zOa+u/1MUnpyJb21riUL0QZ+dbrH3/0nh
 7enrHtGvM6UhvDDc1zbb+I9fMXU1S7gR0DxjdlEOlvZMFrcgWL2k3kiRim29uUtT6OZc
 C1K7P5dvDSN6wfrdqmC2bIF3v8top5b9s+tMUl1BppopUMqpVTDYTvb3T8or70y9kZac
 mmQg==
X-Gm-Message-State: AOJu0YwXDg1h5oLrVGJhx4ayebFQUWtLvHHcQhZQ7NS4M5qm+cbVxsT3
 D2KSchZr1hf+eu+G1dcSAGJxz1TRrVo2SIxUc74=
X-Google-Smtp-Source: AGHT+IFPCoH3J1HQ/PsKF/PE/W0wjQNKIAswSTPOHuAZ9xvtww9V4N6aVEQKgiDUqvEs6uS4NpRH3A==
X-Received: by 2002:a17:903:2a84:b0:1d3:f8ca:754e with SMTP id
 lv4-20020a1709032a8400b001d3f8ca754emr2485334plb.26.1703172991141; 
 Thu, 21 Dec 2023 07:36:31 -0800 (PST)
Received: from DESKTOP-OI0KN2B.ht.home (174-126-58-188.cpe.sparklight.net.
 [174.126.58.188]) by smtp.gmail.com with ESMTPSA id
 g24-20020a170902fe1800b001d0c41b1d03sm1792029plj.32.2023.12.21.07.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 07:36:30 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 21 Dec 2023 08:36:17 -0700
Message-ID: <20231221153620.237439-8-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221153620.237439-1-adam.duskett@amarulasolutions.com>
References: <20231221153620.237439-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703172991; x=1703777791;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sW1y+b8Hs2+AdlIeMvmdulyISvUTyeuS1J26FVR9g+A=;
 b=UoRunBUxErZvEh7gy2rbFQDBgYp+rKKtk7THHnCBK/xlnN4hsgZvZKUjnzA85gWcrh
 UZFmmjWUpCO9Kc/U7pMRUbaXFTzTu+e/TmJ86Lg+ghBqLlWNmiDTAcKk3eIF1fOLeAhe
 JozyNNWWAXgLPvIPsPModPTVgJHyN30QgSD6g=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=UoRunBUx
Subject: [Buildroot] [PATCH v4 08/10] package/sway: enable swaybar tray
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
index 6b2368ddc2..76f8ce3836 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -34,6 +34,15 @@ config BR2_PACKAGE_SWAY_SWAYBAR
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
index 6d924ca92e..5de4c32a04 100644
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
