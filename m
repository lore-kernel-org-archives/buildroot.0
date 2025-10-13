Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22688CCD185
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 20:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D42E6613F6;
	Mon, 13 Oct 2025 20:23:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ViAcfjnvTopV; Mon, 13 Oct 2025 20:23:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D2EB613BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D2EB613BB;
	Mon, 13 Oct 2025 20:23:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ADD27294
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 20:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E885613BB
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 20:23:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Akuw1N5H3wHA for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 20:23:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 70E3560E5D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70E3560E5D
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 70E3560E5D
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 20:23:47 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-46e430494ccso26671715e9.1
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 13:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760387025; x=1760991825;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rTkgpU8/5EXR3nUVPKsVaCnBTctww9JPJjUw8VeY9sY=;
 b=qCC+Ow9cJ8Pz3LbJiHFIfaLcUuV14QJuRg//HonvLFqAclUDypuQWsvgQVelN0LwQ1
 9a9thyCIyOCd04Vsvx9jJhsMh2pefzOzgdifoQRC2ig7A8OEJdzVevdl/AMuPSXPSVgl
 6oesnoFoDhf4fY7gMfwFZEIwTQ4JJLzbY70/fFPmr6bCW+KVxGLpLkZnrSzxidgsDaKo
 qNHrUaUurO0EfpW6jM8kDIf/YRFAsksnOYVlvHQJ8hbwFScFuIs37Xtfh/przbG9C7cf
 Jj7zPS5fMaOfqzutiazzUzc7sTNiJeXOFb13QDJQTbZ3Fkc1zoXE8/Jr8/g9O+ljQwU7
 OIbQ==
X-Gm-Message-State: AOJu0Yy+1hdsuR+HWCKrUctwMddBCY1igMLtzBHhCvuQAB1k3/iOL2v4
 LbOtOYEr5aHNmMeRY41BkcoQj5/gu1r7uqOn2qrBiMC8xyS9jPr8ziFjNoVZQ1J+8VFTYzLIcaT
 clf1bnW4=
X-Gm-Gg: ASbGnctXJDUlisbpH7ZZCz2GBH4s0m2Gpz9XgaUw48jtoXC7Y1FicG3G2C3pyyN6Y4Z
 QI1XfuONg9Hwst5tMiRaUqqIwwPvVSKx/OeimiKf+iXDp17tKPnWwqc4zMXfcfIWi3/6C8B+zAI
 tdVRelea8vFEkHm1VZj3v29QHxv8j0OSIi91hgwpbF00ttLtBo6Ch4QZEBqmc3/cM+ewfe0LBFR
 bH5lbv3TZEgxFbTVLRR7DkEFHDgLGWnhjzv55/GvOohaMLheHF8S8dKz7h5rf+oEgRXnlhY6ACg
 sGMEHRBMDHKoOqd93rSRBuBSX/3UbVsmWeEdJnh91k1RdFWiP+1go7g+fXtyKa9Wn9m9KX+no8O
 zsNXjoBNCpPzVEHz7wt4TY1fdlxuRAz7J257TlcsBxQ+T1E02BdXPfEbf/Suhn+ROwowRLXLJPm
 ohNQKB3l8BjTdW
X-Google-Smtp-Source: AGHT+IEj/Wrlpiy6FtfstYwgkicPNvD0DQ/4lv6rmw5r/tj9MgofVMErUPlZyRgn/x9UmvYXX0Qxmw==
X-Received: by 2002:a05:600c:4e93:b0:459:d3ce:2cbd with SMTP id
 5b1f17b1804b1-46fa9aa20b9mr146700925e9.13.1760387025280; 
 Mon, 13 Oct 2025 13:23:45 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.42.9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce57cd11sm20270588f8f.5.2025.10.13.13.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 13:23:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 13 Oct 2025 22:23:35 +0200
Message-ID: <20251013202335.3835882-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760387025; x=1760991825;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rTkgpU8/5EXR3nUVPKsVaCnBTctww9JPJjUw8VeY9sY=;
 b=fGzjFHBP3I+ShF3vZ881BqLl607qGNtDaGI2pbshWq2LpHC2RcuWbc+kcNGqDQS17m
 xSiY/EDvRoWE8IBd0s7wkCtnNEjiSPng5g4X758MzwRtym+LCg6fpXLRJGt6ew7AiAyX
 RpKCrWxxMQkBdEweLqlLKLGXlmph1jva//n8M=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=fGzjFHBP
Subject: [Buildroot] [PATCH 1/1] configs/stm32f429_disco_xip: bump Linux to
 6.1.155
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

The patch bumps the Linux kernel to version 6.1.155. The size of
xipImage has increased by only 1126 bytes (1673444 bytes compared to
1672318 in version 6.1.143).

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stmicroelectronics/stm32f429-disco/patches/linux/linux.hash | 2 +-
 configs/stm32f429_disco_xip_defconfig                           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
index a5f5f9d20919..6450f4b2d48c 100644
--- a/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  e25bdac4d77e6b1079f899e2ecb24c7e850f295e735ea7b5654b900d85c03b0a  linux-6.1.143.tar.xz
+sha256  c29387aeee085fbcbd91236224b9df805063bac43615e75cea2c6b29604a5c73  linux-6.1.155.tar.xz
diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
index 087308abdedd..c22b6e1135ee 100644
--- a/configs/stm32f429_disco_xip_defconfig
+++ b/configs/stm32f429_disco_xip_defconfig
@@ -8,7 +8,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.143"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.155"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f429-disco/linux.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
