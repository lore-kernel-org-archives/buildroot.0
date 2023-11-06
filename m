Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC55DC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 16:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BCA7820D5;
	Mon,  6 Nov 2023 16:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BCA7820D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n5bl-RORLWqU; Mon,  6 Nov 2023 16:21:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 640BC8203F;
	Mon,  6 Nov 2023 16:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 640BC8203F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6B12A1BF3A9
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 16:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 532A64151C
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 16:21:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 532A64151C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U_nHSNFSA_Wi for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 16:21:09 +0000 (UTC)
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5CD664150D
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 16:21:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CD664150D
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-da34f90f6e3so986407276.0
 for <buildroot@buildroot.org>; Mon, 06 Nov 2023 08:21:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699287668; x=1699892468;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TZNAGY5TIjHUZwvrUxgHQwDlOAJQQCT+tn/giJqwqRA=;
 b=ApbVfuxVWbl+aDhM2KJ5OB9QSTWKgxKpYfZItYv1E0yPm/vRtomv7Aa0m7S+NUIbNT
 2MFtKnREH++uI9uN5aLqnnwm5x0gHc6Qea7x2797ELrdN9HuiOVBCaY8IUs/TfeXkDqD
 LN3zy5pVAVVo+hBCYHZv0Ei1qhAdMFc/ZpYSexFQAWY0YOIayNpLXTiGwi4jueek4xcb
 rtD8Q4oXXUxhcNA/KQWWTll/2l7tMX3P+xbka8rAG7OiceD6VbadzwNZRxQ19Eant/Ki
 hFhnLlIhKTXo5t3s2ZFUjOFqitjksSNQsFEafNzARCsqqowxYHgwwHweuol7cOfPN7vk
 +Zfw==
X-Gm-Message-State: AOJu0YyXsJa4Zqtv/8kVqlnJFDB/QSpd0KoipW6iFmvTFEIezpbK7ugT
 QpPTtkhhmk4j/wEyh9noOA1SBgHc7rs=
X-Google-Smtp-Source: AGHT+IEPz767NfzofD1p9c7wxgwZS3hdScOVFlo+Q66dw3uISXYznQWBRDjPyjbowM+XNdSz6LXtnA==
X-Received: by 2002:a25:1189:0:b0:da6:e755:b530 with SMTP id
 131-20020a251189000000b00da6e755b530mr5159564ybr.6.1699287667470; 
 Mon, 06 Nov 2023 08:21:07 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:91e3:ce2:e2f8:4628])
 by smtp.gmail.com with ESMTPSA id
 l130-20020a252588000000b00da0501b497asm4130840ybl.18.2023.11.06.08.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 08:21:06 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Nov 2023 13:21:02 -0300
Message-Id: <20231106162102.2874943-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699287668; x=1699892468; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TZNAGY5TIjHUZwvrUxgHQwDlOAJQQCT+tn/giJqwqRA=;
 b=FWJy5D1gkoT/C+9hVa1q/P5JgZEpzOT8YX04Vh7bynASYIWQrLyu+k2Q+uazoxqpTb
 I1EkfgVJne7jSomBroFj8A4xcHdv8GyfPMe7Kmzqh0wiDnfvOLFvHxOTuWoQZSuhZ+XX
 4YvppXOR2DJXp8KNtgW6XnQ5Bh7Z+TuHqcinIArb4V6g7IKrDw1z7EiiTJlq+QezkroE
 +2XUmqKPL/FTohVGMfHTEXwqpwB8EsW2sORIV7eapBH8xxzNv9Nwi2a2NkA1fiA7/+rj
 z0kN3srQNTj+e4yGuoT1M9kS6oNu8kZ7rNhra8k026/1X4A7e6dON27D6KkEpJkNS2nO
 8xcQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FWJy5D1g
Subject: [Buildroot] [PATCH] configs/warp7: bump Kernel and U-Boot version
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

Bump U-Boot to 2023.10 and kernel to version 6.6.

There was a change in the location of the devicetrees for arm32
platforms, so adjust it accordingly.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/warp7_defconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
index 04dfc94f7dd5..7389919396a9 100644
--- a/configs/warp7_defconfig
+++ b/configs/warp7_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -15,17 +15,17 @@ BR2_ROOTFS_OVERLAY="board/warp7/rootfs_overlay"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7s-warp"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx7s-warp"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # U-Boot
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="warp7"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
 BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
