Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29EBC83F1D
	for <buildroot@archiver.kernel.org>; Sat, 12 Jul 2025 14:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C85F8119A;
	Sat, 12 Jul 2025 14:53:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w7b-lE_cDyQa; Sat, 12 Jul 2025 14:53:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B79F8115F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B79F8115F;
	Sat, 12 Jul 2025 14:53:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A72D1436
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 14:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98E756081B
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 14:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ht_89DQbhTC for <buildroot@buildroot.org>;
 Sat, 12 Jul 2025 14:53:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BF8F060813
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF8F060813
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF8F060813
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 14:53:46 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-60c5b7cae8bso4795976a12.1
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 07:53:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752332024; x=1752936824;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cfjx7WAxONw9djUKTkPXj9RIgLgEXmISO2CSWznDhgg=;
 b=K7S0H0pHIqtc/8HZ/ZzDNInszn29EbdznWlXGWpJr1oAWauJsTLl8qvWMSFC5E+MH4
 /FuJ7FiCEs1tsTGivO6IeKCCuoB4Ezxt0Mwb7awuUEjgfEAqWBA1y7mut+PhgXmNpgYo
 F8gwuFH+Av67qzsyZxjA56MT4szxFsFP4gdL79+aD8gJF5ZcpNwGmfWJU377vbRHGG9v
 CuRPZuDi6Mm2fFovZxWT7lVfIRgGmCYLVyPMzFEu2k/a//gcVk4LgSogxLXCTbe+8LLR
 c1iWcVjfNDXOBN79p8pQJhLn8EjXVMNiSHfF9AVSYkz1/RgNWyls0me/sWgOV1d5siP6
 FqeQ==
X-Gm-Message-State: AOJu0YyGlATLr+FjsGf/FrhUBAd2Zg0vUxsh7G9MUS52mfL0mBYis+fH
 MpSwek/nV20miSe2SRg8PaR6LvQsmhu/KByzXQopzPYLikEh5rFp6IqqhkLiDDwUkEkLmgH7HjD
 YVjxo
X-Gm-Gg: ASbGncu838I2kwKC0pgbqDYm4uWPpzF2buBDX1RcIccawSNiqWbgX5nnRH+apvDGY9d
 MYeLbqk/JL9ONUaBplOfqbMYjPlgBaA2nCW3DeNOZr1p1vJIZOksIonsdlH/VxAGIhiI5ujcpjP
 PIt+Jsr60bwjY8PQa87K+yqiISpzetcHLfYi70VverslFOk8h0gAFOfXEXfDtEJY6WFcUD7pZ/T
 pQopetH4WE+aogM5Z/za6P8M3ZeDqHaPm7tR6P0fe4xdEwd7dyPX5nhV25BZCATJJvBeFFur/Kd
 0qHy2pYQTA+Z6ZQMHNbY/Uy44IkUHLX8clg+qePKfm/oz5o92Rbw/AyUw7MHnhoz547Sy+/QQLe
 y6Irr2zmO5MMQ559par3e+BWzVk/rR4urN2siPEJpRWynG2XTDaGyQ4kFydD9W8IBN09atmMxqu
 SesvplDATCJzucaSH8eFgkFjT7KYLDcapy5+Z9NTv3YYc9dy+lYpzv+exuLQ83YLSnQU9S
X-Google-Smtp-Source: AGHT+IFYAvUVqEYRbMZoX1bECGN82inP0v6ADeT2ki8vcIjTUJox0d9dh6M1I3Ixd+mBQesQOXtylw==
X-Received: by 2002:a05:6402:ca8:b0:60c:62ec:670b with SMTP id
 4fb4d7f45d1cf-611e84ae864mr5026099a12.23.1752332023854; 
 Sat, 12 Jul 2025 07:53:43 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-611c95246e2sm3608262a12.17.2025.07.12.07.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Jul 2025 07:53:43 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 12 Jul 2025 16:50:00 +0200
Message-ID: <20250712145000.1814421-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1752332024; x=1752936824;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cfjx7WAxONw9djUKTkPXj9RIgLgEXmISO2CSWznDhgg=;
 b=VFsGjRWVRKGgwpq5+HOhxxuHMtF6KAPQefVqHFDzebETSIGUH9U9TKNF8fEVn9IBmV
 mx5cxj3N0KHeIYiMzKsfx6bvoCqdzQhSUh/5Oabrjf84dMT+OFCAIIJ3+cREHaIFnNeT
 IPs6MFNG2rDNy9sRk/lryTZfThZ5uoC/KWvBU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=VFsGjRWV
Subject: [Buildroot] [PATCH 1/1] configs/stm32f429_disco_xip: bump Linux to
 6.1.143
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

The patch bumps the Linux kernel to version 6.1.143. The size of xipImage
has increased by only 514 bytes (1672318 bytes compared to 1671804 in
version 6.1.133).

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stmicroelectronics/stm32f429-disco/patches/linux/linux.hash | 2 +-
 configs/stm32f429_disco_xip_defconfig                           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
index 7855de012d5c..a5f5f9d20919 100644
--- a/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  97b59faf3f1925f296442a73a64439a447366f1d434be579803877097c5abe70  linux-6.1.133.tar.xz
+sha256  e25bdac4d77e6b1079f899e2ecb24c7e850f295e735ea7b5654b900d85c03b0a  linux-6.1.143.tar.xz
diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
index 69266f567ea9..087308abdedd 100644
--- a/configs/stm32f429_disco_xip_defconfig
+++ b/configs/stm32f429_disco_xip_defconfig
@@ -8,7 +8,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.133"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.143"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f429-disco/linux.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
