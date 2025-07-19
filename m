Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62340C83F1A
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 07:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AB4A40BB8;
	Sun, 20 Jul 2025 07:02:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DhzI7Sfhatme; Sun, 20 Jul 2025 07:01:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 392C140B97
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 392C140B97;
	Sun, 20 Jul 2025 07:01:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 04BB31F7
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 07:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8D42841D9
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 07:01:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i3exHXbzTCPJ for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 07:01:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F0E84841D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0E84841D8
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0E84841D8
 for <buildroot@busybox.net>; Sun, 20 Jul 2025 07:01:56 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4555f89b236so32575175e9.1
 for <buildroot@busybox.net>; Sun, 20 Jul 2025 00:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752994914; x=1753599714;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xCU5d/H48Jd3fy6fFE4v1qB4f4JEfJOTgELS7vl24Fk=;
 b=jBk7D4p6pJtVvkXudoAAdb2oXGLuOKVK6BpbhbS05ToPGT8EuQ1aknqZ78spvSbL/7
 VhGfGmsDdm/R89S8htWMmc9wtk0ZZTweEhZFYvFulx2p+GP1rh1vilGSseW/c1juBSsr
 lOHxI6uoM1J4DnETsVtMLlTjrtbsQot5OnyKWzqqZ8vF+a+pcrOQ/Ds24pO1xGwkjJfn
 5zyNzGKWD3zMxPx19xfxn4ibeWcASg1W7GLE5CYQ1zBlSnxUeQUBQypmXYU7wufoSN57
 wEhX5KJljAKIoc3B+UIlrMZR0eNzdV5YJzmeIOa+IMuhQqFKslUnXTWf6+NwUAtMdU/E
 3qPw==
X-Gm-Message-State: AOJu0YzBlpbhvwMZC18KMzU983z+oysd9U6yYdc3iCO/rEl2hR2CojWN
 WCOJZ22cjwAPcXp5+YntsRBz8iW8AE2bsq+GiwAAq5XDIbZ1pZiMPHFYwYgB9QVtiEaL7X/gSwE
 J6outTA==
X-Gm-Gg: ASbGncuAhf1BIQ7Tr7K+4m+H8/uqNuXO24fxmg6rAnVro8aamTSGzlNlNY09Z6alxrM
 /WktBL23DlrjwTNSpibZJhBezbhEGJkEoVgZQk2EkxmXwjXgOm9JCh8pp2GTYI/ZgACcGhqSMTQ
 p69ZQ3p7n5zCd6o8YZrWo61o4Db5U/HjDsJC8355LrhpmE1u1p3fQljIYG0IepDIpPqCf5/HNFL
 U2cDJGsRkJisP/dQif4rVcdG2EbL6fNZNaD/u27+0yO/gK0c7SNTWzrW4+iOT7vfiT8AIgCF7Y9
 4qk6Vi2BxHaWsUa9KwzmDbLKvwaFyxfSG40hw0zjYz8lZyz0jIudtH6B2FqBTZHPjmadzCXQnvn
 gPvYCvI3mSmOsU0nVIZVi2ZAV0XdqZJmMxTqv/EH6z5RI/sqvrK5Ew0Hb
X-Google-Smtp-Source: AGHT+IGm2xUOrk4Rw8AUr7j6Jy1jXnbV54sUhLGjAajkslJUP1arwR03oYiXOTQBicmg0/RThx6+Yg==
X-Received: by 2002:a05:600c:8b84:b0:455:fc16:9eb3 with SMTP id
 5b1f17b1804b1-4562e3c27bdmr124472505e9.33.1752994914372; 
 Sun, 20 Jul 2025 00:01:54 -0700 (PDT)
Received: from vm-2404.. (10.187.66.37.rev.sfr.net. [37.66.187.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4563b5a4055sm66787765e9.5.2025.07.20.00.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 00:01:54 -0700 (PDT)
To: buildroot@busybox.net
Date: Sat, 19 Jul 2025 10:59:22 +0200
Message-ID: <20250719085922.2150017-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1752994914; x=1753599714; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xCU5d/H48Jd3fy6fFE4v1qB4f4JEfJOTgELS7vl24Fk=;
 b=VdcZxTxTDVcrIBLc2ani4WBhdwEzHVTTE7Ys/8QaqAnZRvIjrzRq7BYyuzgdHWsAgo
 hiRxiXkbX7fZxot3XhnCwSiOummn9w352tbzZEmRtg1jTgxlR10C2qnnnBWmTgCuAkxa
 PutLGCN/ndcGuoR0o8MubDAX4DBTphLX0b8Q/T0k4fIZGeGNUO5rqxVtSAzHC7FDvU2A
 RZOa33/ZScTwh5SexmHRGTVVqjA7Xn88G8+/sVXNmsyWtFoc6qjHzuVRDIvIrjYfv2GW
 EIlaj4PR4A9FTKOcvYmbHqexNzGGF8Rl+QPhXrsK36FyK6S9ka92JoK0l2RPACrglkQx
 a9KA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=VdcZxTxT
Subject: [Buildroot] [PATCH] configs/olimex_a20_olinuxino_lime*: bump Linux
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 board/olimex/a20_olinuxino/patches/linux/linux.hash | 2 +-
 configs/olimex_a20_olinuxino_lime2_defconfig        | 2 +-
 configs/olimex_a20_olinuxino_lime_defconfig         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/olimex/a20_olinuxino/patches/linux/linux.hash b/board/olimex/a20_olinuxino/patches/linux/linux.hash
index f8829b0ff..49740ece9 100644
--- a/board/olimex/a20_olinuxino/patches/linux/linux.hash
+++ b/board/olimex/a20_olinuxino/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  9ee45843d43adb2e2ac5f6a8cb10a334e39e3e3384af8a0ce383a37f78221bdd  linux-6.6.96.tar.xz
+sha256  4a168aed2de5a81aadd90ba2b153860a98d99bfc34651936e17f18e54f01ba8c  linux-6.12.36.tar.xz
diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index 161b03000..3e86696b4 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -14,7 +14,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.96"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.36"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 066224742..524dc0800 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -14,7 +14,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.96"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.36"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
