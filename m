Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C008C83F10
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 22:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9FDB8098D;
	Wed,  9 Jul 2025 22:27:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fIa_zsVRzJaL; Wed,  9 Jul 2025 22:27:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0115780994
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0115780994;
	Wed,  9 Jul 2025 22:27:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D199615F
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 22:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEA804085F
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 22:27:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 27z-EODjTvQs for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 22:27:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E28774085E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E28774085E
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E28774085E
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 22:27:47 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-60c60f7eeaaso499336a12.0
 for <buildroot@buildroot.org>; Wed, 09 Jul 2025 15:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752100065; x=1752704865;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b5NHC33/q9RLhuSBbSkwIdYN2aDUeNhkHl9A06B5qJs=;
 b=Ddey2zblPVKoO/FOuEK2sOfphM+tXfutv6B7IpZr1CVI39ZZPlRf3QQjm6Xd3/Jv5Q
 CApHVVCZeHxnRAeqkE7Yok+mZzShTGekww03TYVOXdv6U7Ho6CBpKPGWKtjyz/hzwZCS
 5KmifJdfO/vTNteGxCderwz1hMuXrp80AfNtTPh8hkNA+uOb1W53qta+RC6GJwQS4zmO
 0hxTJXmO3a4BWU23YMN0EgPjwuf/Fk8hMVsMKDGfrVYiF+vfIdRtZOTH8gGCUZkJuLe5
 d9b+kGMHXzi7xtQnViSIHkv5qJpHHNFR/e0VcZGFKON+g90k4vlVd2ik3FdTB3w0ym/6
 NV2g==
X-Gm-Message-State: AOJu0Yz2KbdYx0Xle2sNWb6d9MY/Z3ETxMaxq6nMkSUkx890x8VlLcP/
 8envK1qyiBwfq4yzS29vEpexnVuQe4Fu0EnzwgEZC1iv7bGlxhTxZlcHcGFrj2MOkk6gWcLfA7k
 qXsJW
X-Gm-Gg: ASbGncvjkLiE/ffVBhh9ArHZmYHiwH54MPv1iM9IXKyyv/m+wVbLrxC8y+PoZV7a/v1
 nmtux8n2VA2AeuhXaJfDPMCOx1sbvl4m4LYmqHDdoIsJJufLysqc94IY2Jbba21D0vWC6IY7enl
 t75MdmPOlSO47jXX8yboQrOYLDc4Yu4Tl2HACbvBzHSHIdntI4QM6s2Z3qSuxSYG8IgIWLV76WH
 StU9t5aqzk3aWsu7pIoRIn3K0ZJake5BFyQyeJfSTUcUvJ2QQAvn5oH2oRr+3LcboA78mbEIIkr
 AQqJmo/c48JuqMWix/9apEoDENLfoKy4Tt0e3ZChETekssN+LBg2OdfsfADgf9p5duckjFaUzQL
 JiaKzumyq6LN2rI9aosW7nIHqXQjnK4iNRs0SODy/h9gNZcZLNrh1uujH7ppUYvd2uEZ814IPWC
 4ujmFghp1/6uPitWUSV5udQA==
X-Google-Smtp-Source: AGHT+IFcNp7QKDpuQB9ncpR2S0svoupR/zg0OTjVfyFXyjEjupoS75ezVZy0+8Fs9zfjpDyNBeBkPg==
X-Received: by 2002:a05:6402:1941:b0:60c:84ae:5034 with SMTP id
 4fb4d7f45d1cf-611a7360141mr3770724a12.25.1752100065348; 
 Wed, 09 Jul 2025 15:27:45 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-611c977018bsm12402a12.68.2025.07.09.15.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 15:27:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Anand Gadiyar <gadiyar@ti.com>, Bryan Brattlof <bb@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 10 Jul 2025 00:26:24 +0200
Message-ID: <20250709222624.9650-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1752100065; x=1752704865;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b5NHC33/q9RLhuSBbSkwIdYN2aDUeNhkHl9A06B5qJs=;
 b=UJHgAxSP4vUDNo8K41WTrQ/eUHdXQbt4UDj5NgjNXvu2Z3DH84Hrie7O3riR7pm0TI
 7SLpy7pKlQ7w6gtBQPoAe390kFmw9J+LYrw0BN12KKtsbRuQmzqQ18Jll8JvzsrXOobZ
 XZXpZYfkcr8hlu1PY/TTljRn0zzRUvfwe4oIY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=UJHgAxSP
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

- U-Boot to version v2025.07
- Linux kernel to version 6.12.36 (LTS)

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/ti/am62x-sk/patches/linux/linux.hash | 2 +-
 board/ti/am62x-sk/patches/uboot/uboot.hash | 2 +-
 configs/ti_am62x_sk_defconfig              | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/ti/am62x-sk/patches/linux/linux.hash b/board/ti/am62x-sk/patches/linux/linux.hash
index 1213da86b178..6c7685ad4d07 100644
--- a/board/ti/am62x-sk/patches/linux/linux.hash
+++ b/board/ti/am62x-sk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  643142c1b5991560dd12f950825cc19e4497b95b82641918ecff1177f4130c1d  linux-6.12.24.tar.xz
+sha256  4a168aed2de5a81aadd90ba2b153860a98d99bfc34651936e17f18e54f01ba8c  linux-6.12.36.tar.xz
diff --git a/board/ti/am62x-sk/patches/uboot/uboot.hash b/board/ti/am62x-sk/patches/uboot/uboot.hash
index 80ea21b7cb4c..440526977bd9 100644
--- a/board/ti/am62x-sk/patches/uboot/uboot.hash
+++ b/board/ti/am62x-sk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
+sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 98c4839179c0..28e6fc03ba1c 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -l am62x
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.24"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.36"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
@@ -26,12 +26,12 @@ BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
-BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2025.04"
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2025.07"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
