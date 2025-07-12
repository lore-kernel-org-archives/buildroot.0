Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59943C83F10
	for <buildroot@archiver.kernel.org>; Sat, 12 Jul 2025 16:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 106D84110A;
	Sat, 12 Jul 2025 16:06:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vwejLiXYulzO; Sat, 12 Jul 2025 16:06:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A8FD410E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A8FD410E7;
	Sat, 12 Jul 2025 16:06:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 27D6CDF
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 16:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DFDE40130
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 16:06:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xv3wd8kgH0a7 for <buildroot@buildroot.org>;
 Sat, 12 Jul 2025 16:06:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4B6EB40296
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B6EB40296
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B6EB40296
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 16:06:29 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ae360b6249fso523514166b.1
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 09:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752336387; x=1752941187;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DW/8EgkzjYRsxCU3OHDZiTTj5kZ3ar9+3zrJ902Y8nE=;
 b=aj+gFRb37Oy8/BnusjJ2ekOJt+xu3E2rH8g5RdOGUohKK65xU7hdievDMQBxlW51Va
 sC83EZ3R9sqZdsBrqrHWtuzkDfiu5xMwN6+nthJodpIXnpP6+SyzJMnHGUynR6CmvUIk
 hh0SjeKwyVpnTjMxdRtMvDpohBwyTNstF+dvGpWprCawAH5Dv24m9t1jNQHeIf/Y0Dpw
 BIRN6k7o5ZlIKHmiRKNP6a/jm/+rHyC9HZhaiWwmYLYj9uRB70F/5SmT1Bt7F25lMdre
 OSf1FtP3DU+NAYs0ootT7Im019qgyNytXdPYBUHkGv5ZaghTON/6yFV12nw4N7RSTjxx
 V84A==
X-Gm-Message-State: AOJu0YxydEmkJ26JpDNKfsPOGwXYsE3vbZlo/WkFZYFe2n4uIRflCV3S
 THav12bQkTYNJcCPUCWyl3If/37PcX1VAVrdvxi6ysms7/yF9qWstKaE7kCBz51+FQavkH9cmYB
 KcfS+
X-Gm-Gg: ASbGncs5SYPii1pqC7jHUYXKxBIuLqzrFgqOJDFu3+cMUnieNaLmtNNrs5bFwYBb1KB
 q7YFNpWLK90zD09gfaAH6K+M1ans+HgLskxuqyN2ChL7gta4FEKgadcvLTl4jKJHXGyk2jvF6Lx
 uNsgiAHyRJ4+I4lV4waZ4tnXSvZJkxcZf3lfSneDJFkQ42LhoIbBSZyb8BAXTWeLTgCoN5pC8p9
 Fx/GBh7+NM+f38+SpdwjWDQA7KPF3yMyDYlf6bdDBv32FCGhcIAOG/EBN06SigE87urnJGjkh3Z
 49NHQbVxFXSpbCtopsB0q3Wh+xM5OI8jNPe/AZCAlUo1xrueeu+zGELIUmPY8wIOz2l7nrzE0CF
 yLLKBRgcsbZ3OiJKQCzN8Ub1XIpblhX3Ly14GqdbZe6lA2hoOWiNNx3KXjbLLHa372EjFZqQwek
 zHx6/bwubCYLNY7xR1Ku5doAYHFoAwnPqUdl5OaFm+aMP41WraA/rWKagXj+TkkQbniY9S
X-Google-Smtp-Source: AGHT+IEMiTegiZdSdMqWdnEcSk7JPmDWx9feJxNGvFr0u3jYLCYNHMw5WXmVE5k4ydRI/n3kjenZgQ==
X-Received: by 2002:a17:906:c106:b0:ae0:a359:a95c with SMTP id
 a640c23a62f3a-ae6fbf722f8mr776584066b.34.1752336387164; 
 Sat, 12 Jul 2025 09:06:27 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e82dedf4sm512782966b.148.2025.07.12.09.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Jul 2025 09:06:26 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Sat, 12 Jul 2025 18:06:22 +0200
Message-ID: <20250712160622.1820322-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1752336387; x=1752941187;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DW/8EgkzjYRsxCU3OHDZiTTj5kZ3ar9+3zrJ902Y8nE=;
 b=aAJtREQIjgcCqV2Q9VgWUCHPg+k9QtpZ1W0oTPDtQDysv5aFZBpJcG15aWqsS5FZr9
 5Q6r/Q+hfXBDN8TSmtBve/0q4QlQeJ3cxFBa/d/nZacyxFawVaZiqA2kFRO6IA3dwIY0
 wlM+9bciM3ZV2ZvT1ag7Kc/QnO8USlwlf5l90=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=aAJtREQI
Subject: [Buildroot] [PATCH 1/1] configs/stm32f769_disco_sd: bump Linux to
 5.15.186 and U-Boot to 2025.07
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

The patch bumps the Linux kernel to version 5.15.186 and U-Boot to
version 2025.07.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stm32f769-disco/patches/linux/linux.hash                  | 2 +-
 .../stm32f769-disco/patches/uboot/uboot.hash                  | 2 +-
 configs/stm32f769_disco_sd_defconfig                          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
index 4e0aeb77d880..68e85f8a21d1 100644
--- a/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  9319a47b1e9b5d344ff6015431856d0c9640e4faedc527c87f9129061a27136f  linux-5.15.179.tar.xz
+sha256  9c4efdd7ee550d524c017b5dae27725374526311e983661850cd880af671cb2a  linux-5.15.186.tar.xz
diff --git a/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
index 80ea21b7cb4c..440526977bd9 100644
--- a/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
+sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
diff --git a/configs/stm32f769_disco_sd_defconfig b/configs/stm32f769_disco_sd_defconfig
index e0c592ad82c8..edd429f758cb 100644
--- a/configs/stm32f769_disco_sd_defconfig
+++ b/configs/stm32f769_disco_sd_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f769-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.179"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.186"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0xc0000000.config board/stmicroelectronics/stm32f769-disco/linux-sd.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -23,7 +23,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f769-disco"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
