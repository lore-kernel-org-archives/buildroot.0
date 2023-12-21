Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EA4C3DA6E
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 00:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 025AD41EB1;
	Thu, 21 Dec 2023 00:20:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 025AD41EB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1pBFOqRLjGMj; Thu, 21 Dec 2023 00:20:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DC88421D0;
	Thu, 21 Dec 2023 00:20:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DC88421D0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C89E51BF408
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 00:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADC6240BEC
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 00:19:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADC6240BEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rbKV8dowYcjG for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 00:19:35 +0000 (UTC)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7569D40323
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 00:19:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7569D40323
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-28bc20cb501so1032083a91.1
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 16:19:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703117974; x=1703722774;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PkWFTxyiixS9PJyyoUblc8RwUTzvB+isXb0q2ArZbAY=;
 b=PPyFPJiwKDowIcSDjIIfRxqbkafZAl/JR2Hgsq8SVw9wGKWdItchIycO1bunnf44Uk
 S1cAMCv+Q4+AI4FQVjcVrHq9r2bmW5eHvugTYd07wdpradpsLJsoS2gXAOon/+mqKdBh
 Dpr4BD6bHn9skhJx+cAh3wZafAn1MTtRe5cVIG1iUW6cImitdymArQAs5oh2glnsjeK8
 DL59GgS574xiLqdNagbkBFdRK8V1FhoOxqSiv594mRMHGJ9XeW/x5CzH6uksgQJxDBF4
 xU8CfHf2En3SO3Tf5qBx4Uzo2VYxVOqlJBHi3EAti4HSe/yeiVXCgyoQCPQrSzlnHfAS
 9lWg==
X-Gm-Message-State: AOJu0YzqXU3VgWGNGUSEmiS11iixjCK9vWVCrLizD4H3+hjYtNMMH7oI
 KQHaavAHf8v2cxn8BVg8WH1O//MMIvSYWFxU624uMMPxuVE=
X-Google-Smtp-Source: AGHT+IFMZgBCZJC1M+4k4fA7FYeeT3zn72qajep14KIr8+eXVs61rsvRqOW1pZW4FSSHaL/hn2Tnbg==
X-Received: by 2002:a17:90b:4fc1:b0:28b:e2c1:8eaf with SMTP id
 qa1-20020a17090b4fc100b0028be2c18eafmr1151975pjb.2.1703117974379; 
 Wed, 20 Dec 2023 16:19:34 -0800 (PST)
Received: from DESKTOP-OI0KN2B.ht.home (174-126-58-188.cpe.sparklight.net.
 [174.126.58.188]) by smtp.gmail.com with ESMTPSA id
 a5-20020a170902ecc500b001d364210979sm294459plh.224.2023.12.20.16.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 16:19:33 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 17:19:20 -0700
Message-ID: <20231221001924.1356215-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221001924.1356215-1-adam.duskett@amarulasolutions.com>
References: <20231221001924.1356215-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703117974; x=1703722774;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PkWFTxyiixS9PJyyoUblc8RwUTzvB+isXb0q2ArZbAY=;
 b=JOFtFXPEu94J6XBFmhKcZ73KF6TDM63Qw5vRWQl4aTdrOmpnYIIXOD7sRclmv+Lnya
 wXfljSI16RqVVXMngbJ8hzzVq/53q7EI9BDwJc/n1uMhW5HZ/BF+gc+WMDNhD0/GyFQA
 uiEy/gjfJjTULclEYVfRYxW7zTx5nbvYk6NRo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=JOFtFXPE
Subject: [Buildroot] [PATCH v3 06/10] package/sway: enable default-wallpaper
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
index 08b6911069..0aab3cbacd 100644
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
