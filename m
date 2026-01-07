Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5634D0D16E
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 19:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72F5D810ED;
	Wed,  7 Jan 2026 19:42:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xU1gAvWidSW4; Wed,  7 Jan 2026 19:42:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99EE1810F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767814959;
	bh=e/m8qxR+VpOYVSYaJMMIU4AAHWc3YnymFJOSwknkTqw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gxg7Z8iWXBkJK0AyIIOR4Lz1YNGpLzkKihJDdkCLifsV8CgAwAifh6dXGSliYkAfO
	 SILpgAe+LKCnhFHjURWBLqBIgXisIZ/7dVS9Nf7p9yR4DlXIp0N/2CYuKg0xIL9eOt
	 erLsKg8X3tadICTZQ2nsMEseLPtLqHRYiptjMOrfnALt8qn9KV2Y8u0Hk/3QEB2Ytd
	 1ngvE94UQJRRgO+6NpcOGY94X7HqRWUbVSF/UGSmuyuimh8o/Lyapn6Iti99w7Q9Me
	 QpwIaUi7YF86o1Lgm4RBfxMmODHNrhhIpx9Lm8wu8Ouhshne3BmI3ddzMzssNGNJgo
	 JKy+nNZzNJw9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99EE1810F0;
	Wed,  7 Jan 2026 19:42:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D4CEB9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 19:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAE72810F0
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 19:42:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D4pKSdTYUMOl for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 19:42:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D616E810ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D616E810ED
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D616E810ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 19:42:37 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b8440cb2dbeso201632466b.3
 for <buildroot@buildroot.org>; Wed, 07 Jan 2026 11:42:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767814956; x=1768419756;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wYHqeYyPRt1L66AUTQ2MS2Ej2MJb88J92PwEPCP5Gbc=;
 b=F+Y25NY29PCayJ91Jmch/ygJp1S6tccnKZJ/H6uAIichSHY1o7Hqi5TY2SSveJCNAq
 fRBwXLPDw0hEja1lk9sOWhsUPWF8gGcv+6bno6OX8JwIAPEL1WU8c4naY3GVbCUMQ+FF
 fTsYXXqo56IAPDj6BQFsJiSxFm7PiFcCSJHxI5zhPwPG9ILx9aeT17Qi0VAHBkBPDgm1
 ym5u1CV4iMxZdTm5rkps0F0PGlLk5SJpF9oT4zZNGOgV6XEygjDY6bsNAuWftGV5BJct
 z8OeJ/AAex5qV4MAs67tClOUFz1DPwL3wxE0BibaKc8wLENKGBjyv/6O5170vZuA4meS
 ppZg==
X-Gm-Message-State: AOJu0YziKxxmM1JM1LtPnupWPX3CTP+K5Twb3ZfJ+D+xEz86+zuB7hHH
 89jC0laJH7qrKrSzZXjVgBcuQyvv5eEWb+uPQ6xN4LEN58SxkuhjPnvV6zrfv6neAYyJ+ycwAth
 dAtie
X-Gm-Gg: AY/fxX7uhj95v0sfC8D6JCmwFddcZjp3OYe0D8Tm5F1SWUNZCn+3wZnlC6OOxuIrg26
 6FbhviKaN+g9RAWsCppitD30cL6qJ80y6h5UVGkhI8uOLIZMQD5c46rcohnShyLUYVC0SI4iGb8
 7Db/d2qUWxJthcaQKezeI1OZOd7bKKu0o6R4EMDUFZwq6ibB8NBqrmY6RgFG0bJXQQa4WpKZ8Xu
 HVsZdIG+Bh6j//bfgK9wkvyjzjsMHnCp6P0MVOJy65xDmLCv5rBDENVa9Z4vcpOfEcguG5+mD76
 3qbWqbe6Zc2yjRDSiZgAO42dyjTm0lM3pLNsOI8jy370+BLE+t3s4Ub0bK7AQnJP4IvafKbThOd
 q31eKHATeNKY9Ur7PHF/miF9f4V2H1J31tRB1LdTQjr/ONGl8k14LEeWNhuCZgR8oTTBZoxYBGf
 Sp0/gi1pLEqd7nlZwr84Dgt2MuFk5JjCjlxUvYBQC7PUAQSxqCuUxBOzwRZReypIhGqKEV/OhVF
 dRwdlFsHqmEKmqv5g2QGeFUdfbdNnrMwNI=
X-Google-Smtp-Source: AGHT+IE7uirtGyEWfft9LoMd3nrH+cFBgdoRURDaJz8YaTGGdC6pwr6lC0MdKBEmSnEPY4oEvA/q0w==
X-Received: by 2002:a17:907:1c0d:b0:b7a:6eed:b590 with SMTP id
 a640c23a62f3a-b84451f397cmr415858966b.25.1767814955654; 
 Wed, 07 Jan 2026 11:42:35 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.41.122])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a5126d6sm594079866b.50.2026.01.07.11.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 11:42:35 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Anand Gadiyar <gadiyar@ti.com>, Bryan Brattlof <bb@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed,  7 Jan 2026 20:42:29 +0100
Message-ID: <20260107194230.1842866-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1767814956; x=1768419756;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wYHqeYyPRt1L66AUTQ2MS2Ej2MJb88J92PwEPCP5Gbc=;
 b=iGqRIXQnKkmnMxIFE13OO5/pSMCoPaKSlXTkJWZ4tjgFOdpaIvkjBjPtDP6Sd/FXcC
 vIQd1GUwjFud7ZlUFs6g0HUelsA/hUhQFGK98DgpjXPhGUYzE6OBzgUyEodGHkLEvu1c
 UdFp8PE5wq+cVRQolrYuzAcWRQvwtIZTiGWls=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=iGqRIXQn
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

- U-Boot to version v2026.01
- Linux kernel to version 6.12.63 (LTS)

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/ti/am62x-sk/patches/linux/linux.hash | 2 +-
 board/ti/am62x-sk/patches/uboot/uboot.hash | 2 +-
 configs/ti_am62x_sk_defconfig              | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/ti/am62x-sk/patches/linux/linux.hash b/board/ti/am62x-sk/patches/linux/linux.hash
index 4ac46f027b20..9339a304ab70 100644
--- a/board/ti/am62x-sk/patches/linux/linux.hash
+++ b/board/ti/am62x-sk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  663507accae673afcf4e210b4ae8d4352e61d926202e5da3f04bf71ca1d2c0b5  linux-6.12.53.tar.xz
+sha256  9502c5ffe4b894383c97abfccf74430a84732f04ee476b9c0d87635b29df7db3  linux-6.12.63.tar.xz
diff --git a/board/ti/am62x-sk/patches/uboot/uboot.hash b/board/ti/am62x-sk/patches/uboot/uboot.hash
index 98a5c53aaf97..b6a925ea4e89 100644
--- a/board/ti/am62x-sk/patches/uboot/uboot.hash
+++ b/board/ti/am62x-sk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 4349c966ace4..1a6afa544d8c 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -l am62x
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.53"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.63"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
@@ -26,12 +26,12 @@ BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
-BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2025.10"
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
