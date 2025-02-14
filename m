Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D8DC02198
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 11:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32FE2811E2;
	Fri, 14 Feb 2025 11:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LhMu60z1nN7c; Fri, 14 Feb 2025 11:46:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BA8581310
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BA8581310;
	Fri, 14 Feb 2025 11:46:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C99CDC2
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B75E8405D9
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:46:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lBQmJDPc99Hp for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 11:46:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2A2C6415BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A2C6415BB
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A2C6415BB
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:46:24 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5de63846e56so3635801a12.1
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 03:46:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739533583; x=1740138383;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q25VqvtmTplUIrk4w0Zb53VeFqL8BLvVonKiihz80vI=;
 b=wCVvW7/ezOkA6d6Cg8uUB9aTBepxbxx/ftwn0F3CZHCY37hkOi4ZSTB61pX88TT6Pi
 cQLJJYVeZN04SrrVPOP6tz0K3nTkP2ot8sIx1eDP1Pdrq1tARYOEeJRum0KQ+hv7jxiY
 Z3aMidi4x1SsbpwymjYhcKcnHB0SoUA3FM4is4FalPS6tqabOOe9wqpb+JseN8pNZW7D
 y6rwRzAVnRHvZsa4wUd8g2nOVXC6YZsYWariu+f0Ubz47dy40L0c3ltlSD6EOHrH3EbI
 khp8PB4MBHZrpRqfexyVlnvpXiPBi9pWWP3qVUGf+2+RB5Ub62s0vNPQysMLn1pZB1Nc
 qXVg==
X-Gm-Message-State: AOJu0Yy2pxAmmR1FzGLV3roUcWTX/E8Xp1U+jdIdyTiuXemR1RvMNZot
 It5zUCwiTRwqjGUOAWrVyq9YiYRfj24AK2MI+3l3lCfF/s97rtCnYzRY1gxAuDQ9FFA/QRfymWD
 w
X-Gm-Gg: ASbGncvV4QkzXyeDd4oh722lZNegOlC4SwD48PMJowPVNazde4FmPuF6LBYfbZUgie5
 AH8OkChz1rgXMndxvQUGSRgu0gwAhcHTmYribGFcH0X3q9+TR5+DZhfH9fTNxheqQWOpwQlZTbd
 7uuwX/2Rf7uywxkjfy6KnzgzvQmmNwyNi++KPqzWm6CGuXcA7r5dQ8QODdFc8MFBNzuGszpfQk4
 YhefLHHL/9zX2n18REhpxlpFCKZSxdhbRtP6/2lYkJH27bwO3Yk/7Pb5Bd4yeHhCzp0WQYeyipP
 nQ3vIKapc9FXfnqitLMZcFVXR80JHSwGgRB13ZVgu4syhCKOFgjEZRWiXa/xPx/8eLxSiycCgtq
 zt7MLrC8E
X-Google-Smtp-Source: AGHT+IHAhOjE+4eUMm9hECnemuNCINY0Fv+H2uBTNmY61XqfiJ8w0SUwno9H0UHuDQQcc+iF9K/5NA==
X-Received: by 2002:a05:6402:234c:b0:5d2:8f70:75f6 with SMTP id
 4fb4d7f45d1cf-5deb0bfb160mr10032263a12.30.1739533582988; 
 Fri, 14 Feb 2025 03:46:22 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([176.200.207.55]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece2867a1sm2785805a12.66.2025.02.14.03.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 03:46:22 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 14 Feb 2025 12:46:12 +0100
Message-ID: <20250214114612.3682462-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1739533583; x=1740138383;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q25VqvtmTplUIrk4w0Zb53VeFqL8BLvVonKiihz80vI=;
 b=aTDhu1O9autZdsDliudmrKc7BB4Vc/h9CAG/n5K+VzJ25W9jyOQsO45rUhUXW+aso4
 noJyDaVm7PoP7ChpSmCt+PrIdyaPydXPQSmowaNPddv0bwSInx29mKFM9HdJWol+sweT
 0YdQM3szfeB9SGevru3tawWwlsD1ZmiNPh6lM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=aTDhu1O9
Subject: [Buildroot] [PATCH 1/1] board/stm32f469-disco: speed up U-Boot
 bootup
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updating the framebuffer takes quite a long time on this slow platform.
The added patch allow to avoid the following cyclic warning:

 cyclic function video_init took too long: 46784us vs 5000us max

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...9-disco-Set-CYCLIC_MAX_CPU_TIME_US-t.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/uboot/0001-configs-stm32f469-disco-Set-CYCLIC_MAX_CPU_TIME_US-t.patch

diff --git a/board/stmicroelectronics/stm32f469-disco/patches/uboot/0001-configs-stm32f469-disco-Set-CYCLIC_MAX_CPU_TIME_US-t.patch b/board/stmicroelectronics/stm32f469-disco/patches/uboot/0001-configs-stm32f469-disco-Set-CYCLIC_MAX_CPU_TIME_US-t.patch
new file mode 100644
index 000000000000..c9e331256229
--- /dev/null
+++ b/board/stmicroelectronics/stm32f469-disco/patches/uboot/0001-configs-stm32f469-disco-Set-CYCLIC_MAX_CPU_TIME_US-t.patch
@@ -0,0 +1,35 @@
+From 2a903b0141b99bb41756d01a0a1a5463e2c4f365 Mon Sep 17 00:00:00 2001
+From: Patrice Chotard <patrice.chotard@foss.st.com>
+Date: Wed, 11 Dec 2024 09:09:36 +0100
+Subject: [PATCH] configs: stm32f469-disco: Set CYCLIC_MAX_CPU_TIME_US to 50000
+ for stm32f469-disco
+
+Updating the framebuffer takes quite a long time on this slow patform,
+set CYCLIC_MAX_CPU_TIME_US to 50000 for stm32f469-disco to avoid
+following cyclic warning:
+
+"cyclic function video_init took too long: 46784us vs 5000us max"
+
+Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
+Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
+Upstream: https://gitlab.com/u-boot/u-boot/-/commit/2a903b0141b99bb41756d01a0a1a5463e2c4f365
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+---
+ configs/stm32f469-discovery_defconfig | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configs/stm32f469-discovery_defconfig b/configs/stm32f469-discovery_defconfig
+index 98399416fa57..b0144763d376 100644
+--- a/configs/stm32f469-discovery_defconfig
++++ b/configs/stm32f469-discovery_defconfig
+@@ -14,6 +14,7 @@ CONFIG_DISTRO_DEFAULTS=y
+ CONFIG_BOOTDELAY=3
+ CONFIG_SYS_PBSIZE=1050
+ # CONFIG_DISPLAY_CPUINFO is not set
++CONFIG_CYCLIC_MAX_CPU_TIME_US=50000
+ CONFIG_MISC_INIT_R=y
+ CONFIG_SYS_PROMPT="U-Boot > "
+ CONFIG_CMD_IMLS=y
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
