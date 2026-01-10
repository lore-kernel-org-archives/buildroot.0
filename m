Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31297D277DB
	for <buildroot@archiver.kernel.org>; Sat, 10 Jan 2026 11:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 479DE83C1F;
	Sat, 10 Jan 2026 11:23:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qWMc1IyNz5DZ; Sat, 10 Jan 2026 11:23:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 668E283C0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768044183;
	bh=/OUmFdlITmHvHTkak5WKdbtkk/sVtyAJjK8yqJssX0U=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KqYntMvIddeCSQXHRbqSsswIHD0n3lIL8RGEgxDbwCjZqa2U4X/Ri8PMmhb04lF/0
	 iakNlQi5g8b8vlRhy4HlG0u8C/OKOQ9D//Ehn9qk8xc5+BwJxp/RJguE4ARNqrDQdM
	 ZHMWnlX15fN7dUJfvBKymv1dZXqapGXwQV53fNb0/bFZALQxiHNey6ICr8T3+JuO8k
	 R32zGSSDRt2/qk9bs70nDEth6gN/ovUJOk7jB1ud6HKq5pBDIGaLjQ0ASh6DHZHT8p
	 OfhKKBuTzhvtbHC+TMR4AbYhW6CTx/v/HcEOOg1i49Wtm/JITOwlCwNZYCU17M3379
	 3Uw9rFiwWixTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 668E283C0F;
	Sat, 10 Jan 2026 11:23:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DD684131
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 11:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD0C2401B0
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 11:23:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jnluYiJ3czoh for <buildroot@buildroot.org>;
 Sat, 10 Jan 2026 11:23:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 07D2B40094
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07D2B40094
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07D2B40094
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 11:23:00 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-64b791b5584so8194463a12.0
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 03:23:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768044179; x=1768648979;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/IyXDl/c/MerOja7y+VpxZN8BRfWLnwQifJZBGyzmuQ=;
 b=Wnm0TOb8R2hd9309qNAz3bH0FMfyN7BfNR+w7OkCmMtnLSdtCxbqPS5rfIQbS+8lDU
 nkTXvhfMOcmhxJhpssuOJ3RCdwJyI/vqbmej68C9gQZ7OTPQ7+Vtg4XgWc9Omf+QHGYR
 XESkxZx6kd3Y/0UnIbcIIvO5fImJdgd6gAhUWlLoDFKqj4Cd35Wcsc2fY+UgMPnrWgFb
 hfOF1xuZTGI+Th5o51YpNJOGP1uLiLAKUpN8qGEcN8ZuUO5fq6P196gi6fCU3jUUlryV
 nxs253XQZwaP1hi4dRicyB5ERDHQIQ4nhtO4ahdh/qO26K/S1rrqfnk1Ab7X6vVdlhr4
 +2ww==
X-Gm-Message-State: AOJu0Yxa9aEdR8ZVUkHiJzp2rQJXJuFYEriQOJNZXp1JtpDqu9j+B88H
 Wo3tKBHVUMrmQ3KiduEB86d6M9pJS3ZjPU/2QYDM5jbQV1EPdorEFbbh8fRJHXg5Jvtb+tSt6ko
 wt3JJ
X-Gm-Gg: AY/fxX65c6B+EkEEWhQtDc4JPpgk4QOYiUEPx8vxG3c3E6Cb6nQioV6tT39hkuz9t3l
 JrPrTvaTiOxqpQTpV8l3zpVW2dM9gJN6/zTAhO9fUBwY8HMhmhlN1anPD2/B8iVVI/TIndXDuFQ
 nvguKPfk2HauKm5FUNp0XdWRkWftGSGxr9HwqUDgcbmri7WlG/GW+oCrlpYuRbOir+3hhYFkRCt
 fnGNqASDBxThqwfyDLx2eDmnlyD7TU211UIFU9+zutP+OT8ZLbSIDfvpHnJD+2lyIGKip8tjhue
 +Hf1h5d3137IP53kZPs4qxI3HRJ+rsmFlmQdPkx/wsbEGAFf5wDkzKhgH6kzaPSeBqrmOMoBx7Y
 x9H2+xSQFNWXsJkk58dld32i40iZBIngvkOWO/fUKSiq0NnsaDSxw3hrkjhUdG/LNSzv8Q1lcan
 t90CpNYD7vxFO5xi+1xdvFzGkOXeRSidsTAHK1fTOAqLb3vtHR1PsOc4prytJx7vzXufFML2jTJ
 8/2IJ7xGyAAL93/Ks8TO/4qxT7106ws2gsyuQaK9Q/zu8NOiVQ8+6wJErxU2IFyuOpbyrI+61ja
 7Q8IOvBaT6xv6U1/6WuAFg==
X-Google-Smtp-Source: AGHT+IEZ6KPEN1iytFoZQtmjgIsJCx76GKIEVk3SbZE79cmBKoaxmGS8Cs5RV787/RUAzs0Z6gWclw==
X-Received: by 2002:a17:907:94cd:b0:b77:1b03:66a1 with SMTP id
 a640c23a62f3a-b844517a078mr1326150766b.41.1768044178549; 
 Sat, 10 Jan 2026 03:22:58 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b84591b6240sm831391966b.10.2026.01.10.03.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jan 2026 03:22:58 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Sat, 10 Jan 2026 12:22:55 +0100
Message-ID: <20260110112255.190445-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1768044179; x=1768648979;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/IyXDl/c/MerOja7y+VpxZN8BRfWLnwQifJZBGyzmuQ=;
 b=jbzMZsQc2kwV2OVlM9LRUo6XUPhCi/5Wy3W7F4rqXOAigW5XyR+RbV1hCIOUaPejI3
 PmoYaOtsxAHcdO3LM5QoG6o1mXWvOcq1TJSOAG5ZtVOad3N6HCCQZAV2zG3/+SJVxPzG
 tEHrtrOT//ak4/egEN+SQPTt7ipsTtav05i3U=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=jbzMZsQc
Subject: [Buildroot] [PATCH 1/1] configs/imx6ulz_bsh_smm_m2: bump Linux to
 6.12.64 and U-Boot to 2026.01
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

The patch bumps the Linux kernel to version 6.12.64 and U-Boot to
version 2026.01.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash | 2 +-
 board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash | 2 +-
 configs/imx6ulz_bsh_smm_m2_defconfig                  | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash b/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
index 75072f26f71e..cec51f675f3c 100644
--- a/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
+++ b/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  55432b2af352f7bf3053c348d8549df2f2deeaa4a361c65d638c2f3b2ca7ec96  linux-6.12.56.tar.xz
+sha256  d1ad94a33681148efe884f4028970d69e332f2b003f0e8be53a1d25de38e49a2  linux-6.12.64.tar.xz
diff --git a/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash b/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
index 98a5c53aaf97..b6a925ea4e89 100644
--- a/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
+++ b/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/imx6ulz_bsh_smm_m2_defconfig b/configs/imx6ulz_bsh_smm_m2_defconfig
index 9ced7c51ec55..0bcea4acad84 100644
--- a/configs/imx6ulz_bsh_smm_m2_defconfig
+++ b/configs/imx6ulz_bsh_smm_m2_defconfig
@@ -9,7 +9,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx6ulz-bsh-smm-m2/post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.56"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.64"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/bsh/imx6ulz-bsh-smm-m2/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6ulz_smm_m2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
