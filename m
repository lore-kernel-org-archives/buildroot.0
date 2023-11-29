Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE40CC4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 07:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CE4F4181F;
	Wed, 29 Nov 2023 07:46:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CE4F4181F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UEzfYrBb-yL6; Wed, 29 Nov 2023 07:46:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E6DA41816;
	Wed, 29 Nov 2023 07:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E6DA41816
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C63B1BF32D
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 07:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E78C8134C
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 07:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E78C8134C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6DE9T3Sx6vAo for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 07:46:48 +0000 (UTC)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24E298134E
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 07:46:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24E298134E
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c9b5e50c1fso18992711fa.0
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 23:46:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701244005; x=1701848805;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=neI1VrSXruNJI+qq2pLm5W4tZi9JArko01ggrGVc8d4=;
 b=q6Fokm2psK8ZETQ9xV8PzkKbtKdv8ivBdVEv+KbSao2mcLerjsZbhqBTyh599Kc9Y8
 Ksp/xaNKFXEZtF59Jx9GqgDenKZa1WIUeYxxgBULS+nK/6HYBN7gEVZWxfRSIUKPHBde
 0X59Xt4qftPl/i35gxcyx4Vs6pznV4fo+tIuP/p/1xm2wzcEhkzU+lPOOObCt7IUTl1X
 pajghwSGXMB8b8RTe4z1cGcO24G6LML98jq4kIi2TtVlOTdAnH78pctFkqfvMj/emPfA
 HUbCJNRGLHmxf1N9EehwlkEeRWP4lolzeCNkTNtausZkFDbGFp0Qa5Yz8cRtbqjMP4EY
 TpkA==
X-Gm-Message-State: AOJu0YwdS4ITlW2df4o2Z9nlk/NKZampsd5XVara1w8qqBfg4ETC3xYy
 ts71RS478xX112FuS++iuzod46f9E00=
X-Google-Smtp-Source: AGHT+IGoDSIuIQK+RNBFl0y2LNWlonVSByTvuiG6Hyn8F+xiEG+Cj+MXxVNqMC/zPIG6Hw2stLRd0Q==
X-Received: by 2002:ac2:54ad:0:b0:50b:c6a8:a4aa with SMTP id
 w13-20020ac254ad000000b0050bc6a8a4aamr333068lfk.55.1701244004873; 
 Tue, 28 Nov 2023 23:46:44 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 df2-20020a5d5b82000000b0032fbe5b1e45sm16772310wrb.61.2023.11.28.23.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 23:46:44 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Nov 2023 08:46:35 +0100
Message-ID: <20231129074635.9797-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701244005; x=1701848805; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=neI1VrSXruNJI+qq2pLm5W4tZi9JArko01ggrGVc8d4=;
 b=IeRoeLvemzzsYjhSxG5imPH1wnx19SeBL/B1FCE+OIixCm2VHJFGv7TP62AeX6DQKt
 kTmj0fTxRBaVIN1fvsAGjTTlOWJL87uWlx6zmogA6V1MiHNnCwIBujx6TN7triYzou/B
 bvd0e/UZTAYu1JpnED/d8LMsT0+R7CiVw8ygCoxKXietxqN4UlgFM1JPivmL4jRuTZph
 4BQ95J70csX9NE6wiYSxp/79K0BcvidDO+RILXPSlswAVU0w/3piC+JpcPDowgssMUlc
 Ww00m6SCi0n9afphkPrpqeo79fetaN/chZf+agDn8LKkAKGKNsgNeO+JouTWUZ0PqKf4
 515A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IeRoeLve
Subject: [Buildroot] [PATCH 1/1] package/openrc: fix uclibc handling
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix issues spotted by Yann E. Morin in commit
ca169d1d0a5df92e6a1f0850e6969cc525849e6f:
 - BR2_TOOLCHAIN_BUILDROOT_UCLIBC -> BR2_TOOLCHAIN_USES_UCLIBC
 - Add dependency to openrc package and not only to init system

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openrc/Config.in | 5 +++--
 system/Config.in         | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/openrc/Config.in b/package/openrc/Config.in
index 4691be63a2..adc61d2546 100644
--- a/package/openrc/Config.in
+++ b/package/openrc/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_OPENRC
 	bool "openrc"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_INIT_OPENRC
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod tools
 	select BR2_PACKAGE_KMOD # runtime
@@ -23,7 +24,7 @@ config BR2_PACKAGE_OPENRC
 
 	  https://github.com/OpenRC/openrc
 
-comment "openrc needs a toolchain w/ dynamic library"
+comment "openrc needs a glibc or musl toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_INIT_OPENRC
-	depends on BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS && BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/system/Config.in b/system/Config.in
index b90e40e415..33ca69b933 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -105,13 +105,13 @@ config BR2_INIT_OPENRC
 	bool "OpenRC"
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_BUILDROOT_UCLIBC
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # openrc
 	select BR2_PACKAGE_OPENRC
 	select BR2_PACKAGE_SKELETON_INIT_OPENRC if BR2_ROOTFS_SKELETON_DEFAULT
 
 comment "openrc needs a glibc or musl toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS && BR2_TOOLCHAIN_BUILDROOT_UCLIBC
+	depends on BR2_STATIC_LIBS && BR2_TOOLCHAIN_USES_UCLIBC
 
 # In Buildroot, we decided not to support a split-usr when systemd is
 # used as an init system. This is a design decision, not a systemd
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
