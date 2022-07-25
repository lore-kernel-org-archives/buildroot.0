Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0DB5C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 15:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B79A84C69;
	Mon, 25 Jul 2022 15:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B79A84C69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YboDUk7nxa0x; Mon, 25 Jul 2022 15:23:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46E6984C55;
	Mon, 25 Jul 2022 15:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46E6984C55
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D67F1BF2BD
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 15:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 765CD419F8
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 15:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 765CD419F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uP1nbcrgBtWO for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 15:22:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DFE341A08
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6DFE341A08
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 15:22:34 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id v13so8685176wru.12
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 08:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UdqS7Fedh6skijdKZcjoBSzMWU7td13N0uMFq5CK5Hs=;
 b=qUjb6mUwmGufXUWCJbYYO1QBZkY1+2dH59T5kkXC2aJJ+A+jWMkM/GcHHIpw8OrAI3
 v/7uml37kim0HQCQXRuFXi+PkDZPN5SyI9rsCxgnmLFQiwJlSzY2Vxca/Q6tMhylplZS
 1ckwk3X/5ScocULDYYyqt88AtjKYMa3GULGldBUJ1MsgudU2YG+SLzcX3VSij9fTAYc+
 hrPziYEEyPJuzGliIulsiYo61Y6F0uMMalBdQfwUcQBy1sNbwfOM3eyONAglhqx67neY
 19fnxhIQ2D4R9ItOF1i9VEcmJ9lQowswB6OgTpKhCDOm1JD+beLwtkGUEGwQsh4uot7Z
 RkFg==
X-Gm-Message-State: AJIora+sPNT2K4fYLTYa7sB7RLHClQTAg1Fl2XnhdhOrSl62C9NK6x99
 I9Z8UiokTo3iyEC5mPGHtUIpk7dEQUYruQ==
X-Google-Smtp-Source: AGRyM1s9h0ZiNtrKzF1duC2/moKUjqq/dW2F0N1MaRwRJRPt/43ZGcj06uePotwy2MwtMWtFZvs1LQ==
X-Received: by 2002:a5d:67ca:0:b0:21e:5ba8:a067 with SMTP id
 n10-20020a5d67ca000000b0021e5ba8a067mr8259239wrw.650.1658762552403; 
 Mon, 25 Jul 2022 08:22:32 -0700 (PDT)
Received: from arnoutx1.home ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c378800b003a2e7c13a3asm14244983wmr.42.2022.07.25.08.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 08:22:32 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 17:22:27 +0200
Message-Id: <20220725152229.3370033-3-arnout@mind.be>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220725152229.3370033-1-arnout@mind.be>
References: <20220725152229.3370033-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UdqS7Fedh6skijdKZcjoBSzMWU7td13N0uMFq5CK5Hs=;
 b=e4G7SowaDncA7hSKTX2CVEkij+ZItESefNSKALpyNnAHT8wJL2Fo3ynpHLHnAbir3K
 cGSipPwRjZt/X7/APqkoxUMgNZmUUEZZcprVAR4sGCuulJmdnmhrEn62sKQStKxdCqyq
 534dkBHPjb0jA9n+9ID0YhtNzD2t9c1dlioeREChNyW61MHVV3puIrBCQyOPzIV7+X5+
 z0WKAMhWQhVdk+qTpV3V5/L+igKIV4cXsBYcKkPtAwvWEtYCFZncN7lGGFIW0v6IPl4m
 so0Zbrd7U0K/FpNN1yb7EYiLzpXLRqmFtDw+gt+GTuJgUGua5E3DPKAf4fcicNkAR9iO
 ZA3A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=e4G7Sowa
Subject: [Buildroot] [PATCH 3/5] configs/*: use BR2_ENABLE_LTO to enable LTO
 instead of BR2_GCC_ENABLE_LTO
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
Cc: =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>,
 Douglas RAILLARD <public.douglas.raillard@gmail.com>,
 Dario Binacchi <dariobin@libero.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_GCC_ENABLE_LTO only enables LTO in the toolchain, not in packages.
Use BR2_ENABLE_LTO instead to enable it in packages as well.

Note that BR2_GCC_ENABLE_LTO is currently non-functional (LTO is still
enabled in the toolchain even if it's not set), so we *do* have LTO
available in the toolchain.

Note that the option has no effect at all on these defconfigs anyway,
since they don't contain any package that is affected by the
BR2_ENABLE_LTO option. Still, it makes sense to enable it for these
really memory-constrained targets for when packages are added.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 configs/stm32f429_disco_xip_defconfig | 2 +-
 configs/stm32f469_disco_xip_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
index 01b54c02cc..f9b3270ecd 100644
--- a/configs/stm32f429_disco_xip_defconfig
+++ b/configs/stm32f429_disco_xip_defconfig
@@ -2,7 +2,7 @@ BR2_arm=y
 BR2_cortex_m4=y
 BR2_KERNEL_HEADERS_5_15=y
 # BR2_UCLIBC_INSTALL_UTILS is not set
-BR2_GCC_ENABLE_LTO=y
+BR2_ENABLE_LTO=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
index d95b7759f3..fc3b3f9213 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -2,7 +2,7 @@ BR2_arm=y
 BR2_cortex_m4=y
 BR2_KERNEL_HEADERS_5_15=y
 # BR2_UCLIBC_INSTALL_UTILS is not set
-BR2_GCC_ENABLE_LTO=y
+BR2_ENABLE_LTO=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
