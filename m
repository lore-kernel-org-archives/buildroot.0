Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52F6D26D8F
	for <buildroot@archiver.kernel.org>; Fri,  9 Jan 2026 18:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 841A440C36;
	Fri,  9 Jan 2026 18:52:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yhqn3J2qh8ZX; Fri,  9 Jan 2026 18:52:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B179940C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767984764;
	bh=cDmk3GgF6hYDE73hlBq3z25FSuuepcAe6mvtZ69KHWQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KTZUTaj/mapcoO9M97aC8UYOLukxAlg2m1bxObaTBB5p1SnYfjo4SYsV5YkbUKL6E
	 UQCsbrXR8BRfntoAKYMvN+BJ2AAnVYfXQm5+Iv2W7vBSgIObt0YKcNeJuvp16x6xD6
	 FHUhqW3der5Ur1TPCTWUKY7wMBH5ieIAsNbeZW3QtGzr0/hAHkXbFuWgtgZsxe73tO
	 fDDyyYEzKTc/3MmA20e/EfErczObdvrn4Lb+usBri4Vt9bQ2WQG7gcoOAkmONUCtge
	 d4M6q8/hgSJiPZm8mkqyYJpYGq+Xr8J59W1mqXRBVil9vKZhzUB2vOPAOe1kjuWKdf
	 2Sy4wjQaG+EAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B179940C40;
	Fri,  9 Jan 2026 18:52:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C3A7612E
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 18:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B57F260C07
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 18:52:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cqu49uMhvMII for <buildroot@buildroot.org>;
 Fri,  9 Jan 2026 18:52:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C041E60BEE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C041E60BEE
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C041E60BEE
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 18:52:41 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b79af62d36bso805916266b.3
 for <buildroot@buildroot.org>; Fri, 09 Jan 2026 10:52:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767984759; x=1768589559;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UWe8y/RSq7u26uR9hx1fTq46CEu5TAxgx2/N+bCUEYY=;
 b=tMc0dl7Nw88+SxARxIdjCyDkF9zZf2hZ31fZLTitwu0uFR3K543+J3RHwfJFpH79fw
 vQdYRr2g11NIFN1ygjqo6VEyORSVuk7+gh85h35wNak/ab28a8gEuF+cO7mlXvTGoNTX
 jRdw6aXDXbylQs8cXS+AgTSaF5+Q6RRhak3H4LlBlvEqkGizYwe7AvktwNL+qmUGh4ZN
 SplPi8BLHJGpogAOvTnwFfPOQuu0PTX9x1gMQ5fncl7hnuey0tCETLSgyHe+5Z5Egxdd
 F0Q2yKHPxpY7YJgKJxpWEpUn8VaxP8FgbCXMVJWREz8OCUP2KyVDX125uiHzYkBsGGrW
 k38g==
X-Gm-Message-State: AOJu0Ywu0SpcvoX7corZpDcWtHXXpJ1DdPnd1YHBME0p9EKaW8fu6PO1
 46t6jdImpxe097ItLhzfLBZfWDBh+K/LdEV+PottB8/dyUSOXFuLR8ToiFMAG0ejabXyaNI9DrK
 Sbtkk
X-Gm-Gg: AY/fxX79syrYugTlf8KvMCnVtjiS2MKVJFQ+LBiLyjkbjhQGSMq78byPSD4v9O9XV+u
 GQ7hmmPZBvRtVgnwZbaJGxOD8zNExSxF6Px5NfXVkG2ffZYgbTT030pYfuicpYeEB3e3ORtncJc
 DcW15/edWlgtRpdAyPRnVSedq0X0LDUzMeBnjXFvaQOFBUMDhRc3ijn7ijRh0LkMxuQkRFl7mOy
 YbpN0kq77u8RIe0NBjHL0FEnlK6g7TZIPkNHKhJNy7ZkGRKf7YZs/t3vGRmLSImddSWqXJtC5sS
 oG0bDgtF0LQY/yN52cFJxyvzOM0diMqlpCs6cMzzN0rMwCkT2yyhfIKROqqKoNkIB4HbJZ92+5Y
 fiU5ysl/LuidXIbuYq/ezgUlZWiHQgWFu3QmeOzYUChzzRg0yx553eXD8l8j/JnSVBhX9GM5xyD
 lUpscoVUfnR4GO4APpznrQkkWxes4y8e9BEfvTgVs8Y8Lr0j9Xcr0XbQBqNopEqA+DkJHgkAZQY
 4/ymdyXJvUeBeeUWw0Jf+LEpA/WTWQ8
X-Google-Smtp-Source: AGHT+IGs0KI0KkUshrxxn9qmCladkyyz50wo3Bv4B0tQoqMZf1UlDjcZB1KCU65teL6d8SKYoV13ug==
X-Received: by 2002:a17:906:fe4c:b0:b73:826a:9102 with SMTP id
 a640c23a62f3a-b8444fd0a3dmr1046013766b.49.1767984759481; 
 Fri, 09 Jan 2026 10:52:39 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.40.2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507b9d508csm12377124a12.13.2026.01.09.10.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 10:52:38 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Fri,  9 Jan 2026 19:52:35 +0100
Message-ID: <20260109185235.1319640-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1767984759; x=1768589559;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UWe8y/RSq7u26uR9hx1fTq46CEu5TAxgx2/N+bCUEYY=;
 b=g2I2wRNHo5r/d7XEa9tN/Sjzpp7ky8tdktUyuKzSJUW7DYSZHHwLFNRN8ZcDgkHTys
 ensgW3ymlUmqvbYq9udwUk7i0ec/jyuYWbcl/9cLOm7t4VG33YIuDyizVV7y2cgStpVE
 dMTfRelzOe1Bw2dAX3atVkqNl6+9lfA/dCCjY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=g2I2wRNH
Subject: [Buildroot] [PATCH 1/1] configs/stm32f769_disco_sd: bump Linux to
 5.15.197 and U-Boot to 2026.01
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

The patch bumps the Linux kernel to version 5.15.197 and U-Boot to
version 2026.01.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stm32f769-disco/patches/linux/linux.hash                  | 2 +-
 .../stm32f769-disco/patches/uboot/uboot.hash                  | 2 +-
 configs/stm32f769_disco_sd_defconfig                          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
index 27549bda9349..50c6664f950c 100644
--- a/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  348d6faada05fd4684450cd7c4e666c3c98cdb96f2309b1520c9a92a378c267e  linux-5.15.194.tar.xz
+sha256  fd218df8e2107a4443b6c29fef7f95aad167031e0fbdbc7a858ae8471360668a  linux-5.15.197.tar.xz
diff --git a/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
index 98a5c53aaf97..b6a925ea4e89 100644
--- a/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/stm32f769_disco_sd_defconfig b/configs/stm32f769_disco_sd_defconfig
index 54ee93aa1979..3cc6354ed626 100644
--- a/configs/stm32f769_disco_sd_defconfig
+++ b/configs/stm32f769_disco_sd_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f769-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.194"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.197"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0xc0000000.config board/stmicroelectronics/stm32f769-disco/linux-sd.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -23,7 +23,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f769-disco"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
