Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC7CC3DA6E
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 00:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90230421E4;
	Thu, 21 Dec 2023 00:20:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90230421E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jhVh06oxv5kq; Thu, 21 Dec 2023 00:20:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E282F421DC;
	Thu, 21 Dec 2023 00:20:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E282F421DC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 94A821BF408
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 00:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E33D8135D
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 00:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E33D8135D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jjznpo2Szq2s for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 00:19:36 +0000 (UTC)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B98748133F
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 00:19:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B98748133F
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1d3eb299e2eso2102005ad.2
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 16:19:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703117975; x=1703722775;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HZLWj1ex6H35f0VCS3hSbte0eJgiYj6iFyRbkTimJpQ=;
 b=iB0VlR1DnN8kfCoTkhn4xFnBGnk3MjgqTE5dgROTF0escGUKdEBj/vtdRfIl8kOpVU
 1gXYL3oBXSyNj4VfUrLcR7vt6BRnZp2UNCuGpiiam2C+PY4nwha/2gQaRYKKbhFG+gXt
 uDdNfyhXxZZqP0WUwwvBmgMjkJu1TARTWGncRVS0NbwbhID6ZVawzL5FPS9JcYkx2shn
 5UMkL86RsMWJUeIy5AIY3q9fCI5id4D6EdN8+Y5sv8Z/D2GRtUYzcQzzDwD5PLZH4EXi
 yaeBn3KFniaN1bOYZ5J80vmdRJJCu6Xcqg5dzUK/QfkTZgzUck/JqeVVYaf2j2CxI51x
 yupw==
X-Gm-Message-State: AOJu0Yxvb6LURIxivau6/+/Dsjd0VJhPqYN5kbif673QCN+9+2lIakEw
 FUWwjy79SPmtYUdpWOk0jEDikW66o1WlCLsvy44=
X-Google-Smtp-Source: AGHT+IEkGD0LH7xDFSKxJRIayVHgUtcnS6qn26pslU2Kk8H2fg5SGAXT//5QjpqRO83yWXAe4u4Syw==
X-Received: by 2002:a17:903:11d2:b0:1d3:1afb:fe57 with SMTP id
 q18-20020a17090311d200b001d31afbfe57mr12065310plh.29.1703117975454; 
 Wed, 20 Dec 2023 16:19:35 -0800 (PST)
Received: from DESKTOP-OI0KN2B.ht.home (174-126-58-188.cpe.sparklight.net.
 [174.126.58.188]) by smtp.gmail.com with ESMTPSA id
 a5-20020a170902ecc500b001d364210979sm294459plh.224.2023.12.20.16.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 16:19:35 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 17:19:21 -0700
Message-ID: <20231221001924.1356215-7-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221001924.1356215-1-adam.duskett@amarulasolutions.com>
References: <20231221001924.1356215-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703117975; x=1703722775;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HZLWj1ex6H35f0VCS3hSbte0eJgiYj6iFyRbkTimJpQ=;
 b=riwQrzbWCe5JEMISrHo0bW0z/iejwFZV1ecFlLBOoVjJqx26xiX6qBa02FvpuTiUn+
 zSCe5x36H9IsXI8BWvGAruOBY+urx9ynfz44n5+v92b8THOXStQk8Rg7qBNFak8jarWn
 0easFsL28Ql/vS2br5JU/PMBzNOMQYim4PjRM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=riwQrzbW
Subject: [Buildroot] [PATCH v3 07/10] package/sway: enable swaybar support
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
 package/sway/Config.in | 8 ++++++++
 package/sway/sway.mk   | 7 ++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index 0aab3cbacd..93eaf26ce7 100644
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
