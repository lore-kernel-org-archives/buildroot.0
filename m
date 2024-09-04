Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4489CD4847
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 18:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D81881236;
	Wed,  4 Sep 2024 18:26:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C61TqXBf-QKr; Wed,  4 Sep 2024 18:26:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8707E81239
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8707E81239;
	Wed,  4 Sep 2024 18:26:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 01D871BF47F
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 18:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4248608B6
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 18:26:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V0EG1f9EN-UU for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 18:26:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5A684608B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A684608B4
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A684608B4
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 18:26:27 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1fc47abc040so10600765ad.0
 for <buildroot@buildroot.org>; Wed, 04 Sep 2024 11:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725474386; x=1726079186;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qBFEz18EYdDfEukfgqtb/dGQ/9DtPdW5usBjWbqrSYk=;
 b=YTSlv7vsd0/qf4hwcZSw4QKEz8esB1n1sEoPI014s+uRZzVeOLvyT1UfLx4YGbo/wj
 S359AVQDMh3Z7C0UvTps4+xMeunEsAfVpIFDfWC8vCr0WQacnNPdscfhzGw8r2j1986F
 5ZeejBPBE0Zx4qE57K/zyQIfNccuuZGdAIcowPP3icjD6ekO8dqEP9P4cOl2gkMjHHvi
 eqX2oh41BA2wdfPMpWsaZcQBmbrsRJ0H08t8Si4m1+2I/OYv0hiKQxd2RO3llK6wcV5n
 r1rsx0/MVyBt8BwIyHuNSwsfsp9eJ1jK2tHGhXgcrhRYjzAazfjgaHVrao7wWlwsoQsY
 Z3jA==
X-Gm-Message-State: AOJu0YwVw/tjIcdTa7ptXT8eCdPYm18DC7xGJa/LwewNaxknsGOvXZOJ
 4Sv22Stc//0D/2zv00uFpIbmZ81AANMYZhtSzaNy6IoshrvQCZOyOTTiLg==
X-Google-Smtp-Source: AGHT+IEq/JtYO1OsENGqeW6F3IWBXxCF9Qw9rVv1UKUsyD0BXRCExAxWiHrswO7DLB14fHA794ZBUg==
X-Received: by 2002:a17:902:ec91:b0:205:5bc9:37fb with SMTP id
 d9443c01a7336-2055bc93a0emr144856845ad.61.1725474385736; 
 Wed, 04 Sep 2024 11:26:25 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:b37a:332a:2373:a683])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-206ae90f076sm16567935ad.7.2024.09.04.11.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 11:26:25 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Sep 2024 15:26:19 -0300
Message-Id: <20240904182619.3013605-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725474386; x=1726079186; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qBFEz18EYdDfEukfgqtb/dGQ/9DtPdW5usBjWbqrSYk=;
 b=LKo2VkQWo9WcnTZJy3KhnbDxLgGpPpSGw1sQaERnCw0uBrTMVowMurtV3q1bMn5mYD
 3gwC+Z7s8INN9ooJxZA3miNPIZik/rs2JjCzqCZ25B2EPb9LIBV0+xTUwm9+LVFuGR4D
 H/NYZmZTAx29QZy+WaAXiq5xUIl3sMa3fmYYlMmbLskDUoIseIygu4Z6YPDoIYIquI7K
 840DBXsLp+p1wD7ySP8R4+gX56ffiLween6YIkE8PHz3yCgT/7brQ9IdWMx5NZ2UCUlB
 5Izya+bjfGMKFX7aZDdHqFNJOEWOB+aIaoVwYrwN0zHR3e2lPXHh5xKb0ju876iFbaOV
 2JIg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LKo2VkQW
Subject: [Buildroot] [PATCH] configs/imx7dpico: update U-Boot and kernel
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
Cc: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update to U-Boot 2024.07 and kernel 6.6.48 versions.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx7dpico_defconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/configs/imx7dpico_defconfig b/configs/imx7dpico_defconfig
index c6ea04b6836f..b0a4b3dd12d1 100644
--- a/configs/imx7dpico_defconfig
+++ b/configs/imx7dpico_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.13 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc4"
@@ -12,10 +12,10 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc4"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.48"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7d-pico-pi"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx7d-pico-pi"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
@@ -25,7 +25,7 @@ BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
 BR2_TARGET_UBOOT_BOARDNAME="pico-pi-imx7d"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
 
 # wifi firmware for brcm43439
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
