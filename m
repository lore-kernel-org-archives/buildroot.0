Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136C510F995C
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 17:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1262C405D3;
	Wed,  8 Apr 2026 17:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UO8ouOFtzjR4; Wed,  8 Apr 2026 17:50:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A5EF403E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775670601;
	bh=GQP0yQtpzremW5cJS+pcL8PR0qvfks27FzzKaWYDR7Q=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EqtrPhTDeM9eYKPHeEuXgOOoqUCtQA2pVcnlkspn+JzL0ojM8tiVnUx9OQ/tWMJD3
	 jCStUxYLfe5kiyrPAKSnXKhvL5M/Qj0pcKwJqZyk+BAvPR/U1dCsZac8Oif0pZyrJ+
	 W8ZfGQdG4oOa2lkwesrYcp90IKRBGbI7gzwsmwuLpAxhlEEw/u9767o5YF3EWaIdrR
	 4ZNzfw3t4WlIGgaV5aTSnOlSkb3eoP+SJhFojw08AKAzujimLsV0uomEWIM3aJckEe
	 NJ2/WrpztKRxmwVP+3z8cK19Yb1910s+Lg16KzI45CuvqkAR2SQpOoUopa5onUVFrM
	 /zdG88HmAeL2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A5EF403E0;
	Wed,  8 Apr 2026 17:50:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 79B59237
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 17:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F8D340446
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 17:49:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GZ6nB2H3gdag for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 17:49:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6A60440385
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A60440385
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A60440385
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 17:49:58 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso819875e9.1
 for <buildroot@buildroot.org>; Wed, 08 Apr 2026 10:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775670596; x=1776275396;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hU6buhsRp5DLLtsizZuI0YrD80Zf6eIaGzJ1Bz8HWCs=;
 b=tWuq7QOGy2qZJ+a5e/yK9amIqXOyZrHZWQVKnpnV0kbiHH+eBToZRsdaH2awWWVC4f
 BeFSJeiv6+FI2XqfSJnfJqssZ5rqvgAEBBy2JhFXSJLUd/ELyNqE3qJbbQZJrz0uqSPp
 haw30288x4oL1TT3wvianth+5aUHIUSEhmJQVsAc70jNiyh3y6JhMinAkCVb9XYFURJ1
 TZlwP2zjCdNMX1T3SDICPovF6tXh6yEq89rDXCbAg7AffQff0kk8JufTONj9rPdumRem
 nT/354df8SU9DWP+BrUby6WmSeeGFR7Pcg9M5q7GVg6WqEU15d9kOXV8RI7MkN3zjS3m
 s2dA==
X-Gm-Message-State: AOJu0YwFxIth0U8hyy4l4nb2XE0a192lpuHLoNiEPCUn9H07QwHbDZKa
 AcMNgrefodzkxHbsB6ASXXgxUGjYvjtbsX8fUCMqr+M6JUSu6At2KxCmvbUps65pnnEr2cNxrIC
 XkDVo
X-Gm-Gg: AeBDievHjBUqHZXumvOxs2e5X0H1ZFU0noz6dDgPo/hDJIR1dsvBTIEIvwrTBXuNB0T
 bMsIRnUCsajE4/te6sm4/03XvtWRL4d0hbyZWrtLVvrRJYRekDomYolBvnw8URCL4SvevS3urjt
 uZVuxy4mSXxerV3LbqlyptjSqOq140z0zgy3VpalyAMzl1hhavi2uXkMwkn1KrAT+U+nG/kdaWN
 bTMNLuywKV+DrPWKvoRPWu0sIe3vJ/q5W/i/1P+S/FJYCTjLsjvWtc8FyJ5XR9bP3gNSryqJY8S
 FDm7RHoNgQtoJi5/spPQXuq1qD9Ggz6bsqiAXcaHlHJBTqNyxd+sOv02BCSbXm4ZpQ/OcELmIqM
 ZNvC2AWh0QrC4qFB0f2xVVYSrwqC3CjPuv+Sp2Q8gsM66AVRXB0bmWsZ7P9IKGVZ2K6DfEFsKtW
 nTarpKchaNuIC09HOIqb0jkduitbWlFrf6/SKL3NujhCX+nFfAyoMFwlQjd9r6tMS7nCVhC3fyI
 mgWi8WsORbnpNq9R5knLIMYlT7aEyqWgGF8I7Sqpu/qd7A=
X-Received: by 2002:a05:600c:8216:b0:488:ac01:72de with SMTP id
 5b1f17b1804b1-488ac0175camr194637865e9.5.1775670595895; 
 Wed, 08 Apr 2026 10:49:55 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488cd1c4f3csm8623665e9.12.2026.04.08.10.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2026 10:49:55 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Anand Gadiyar <gadiyar@ti.com>, Bryan Brattlof <bb@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed,  8 Apr 2026 19:49:48 +0200
Message-ID: <20260408174948.1069230-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1775670596; x=1776275396;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hU6buhsRp5DLLtsizZuI0YrD80Zf6eIaGzJ1Bz8HWCs=;
 b=l87SPsMPEqrF9PyzekOuShC7wL8vgy8M3f7XtGiOhPMSHjzAiK578ydLrkVneiLkjR
 bKmDWRdX4CMZmibWq4CIf4M2aD4xL/aAxGbTC6Q920hiC50XgS+nRmmRo5Z2YTvY7XmG
 Jv+xBG8wu8sHwCPQw0I3ROZZMPhiT65Bc7Mfk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=l87SPsMP
Subject: [Buildroot] [PATCH 1/1] configs/ti_am62x_sk: bump U-Boot and Linux
 versions
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

This patch bumps:

- U-Boot to version v2026.04
- Linux kernel to version 6.12.80 (LTS)

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/ti/am62x-sk/patches/linux/linux.hash | 2 +-
 board/ti/am62x-sk/patches/uboot/uboot.hash | 2 +-
 configs/ti_am62x_sk_defconfig              | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/ti/am62x-sk/patches/linux/linux.hash b/board/ti/am62x-sk/patches/linux/linux.hash
index 9339a304ab70..ad4ad8db13f9 100644
--- a/board/ti/am62x-sk/patches/linux/linux.hash
+++ b/board/ti/am62x-sk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  9502c5ffe4b894383c97abfccf74430a84732f04ee476b9c0d87635b29df7db3  linux-6.12.63.tar.xz
+sha256  c92591d896e79ecddbc3319136f0c2f855e832b397de7593f013ad7590a43e53  linux-6.12.80.tar.xz
diff --git a/board/ti/am62x-sk/patches/uboot/uboot.hash b/board/ti/am62x-sk/patches/uboot/uboot.hash
index b6a925ea4e89..36322a6a904c 100644
--- a/board/ti/am62x-sk/patches/uboot/uboot.hash
+++ b/board/ti/am62x-sk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
+sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 1a6afa544d8c..ac73a2da5c60 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -l am62x
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.63"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.80"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
@@ -26,12 +26,12 @@ BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
-BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2026.01"
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2026.04"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
