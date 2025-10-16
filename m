Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DD4CCD199
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 17:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72EC1404F7;
	Thu, 16 Oct 2025 17:34:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7DHgHujPzGJ3; Thu, 16 Oct 2025 17:34:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C56D404E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C56D404E8;
	Thu, 16 Oct 2025 17:34:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CD56D8
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 17:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E9FE803C1
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 17:34:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Udl5JeABFceE for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 17:34:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CC774803B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC774803B2
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC774803B2
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 17:34:08 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47103b6058fso7549335e9.1
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 10:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760636046; x=1761240846;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3XkO6M9jcLeqCeCA4YOq6y3ZidJrX0fKW4X2WCDtm3Q=;
 b=ZIno2m8xkAlt8da+HT8e55f0LkuCQ1S97L1gxMKO0rGtkREj4B7Lhmx6b/3YXDuknu
 93fg4jC4e2xBnDQkTOaNbKa++WbBGMDyEftHviijno5ggrtIBmce+x1J8lmPIZCQxxxS
 ajjm/953aTecJHx/wBpQlKBEFVjBdK//u62amk224mWGqifcQIujPLyaYuLbPVxpxdHl
 nkMDwqwAqQBku6/6KPXt36xfouaK7UOS2R+8F/e0iIfcsog5Zg46fMjRzuIsUR8Fku2x
 PnuCYoZoag/gm9jjcwf6ILxgg8u+ZI/gZF/tMKDt85ajOov52jc4pwUynhFu0svj85+L
 E5+w==
X-Gm-Message-State: AOJu0YxAShiRJUUCX8IJN/yAV864r33PQ/uxu1ND5S4BHfr632GeJF8/
 QXpHZCeVgqaSFHsion40fbSDt2J9MJPKmR0BH8o/VVWcSPHmDjL394HnbCT+unehL8Ys/g3akPN
 GPZf4cb0=
X-Gm-Gg: ASbGncvyd7+3qTiA+Lfm/NvReGo2F031GkiII2b6R/r4EPHghCBYBkOrK1rPkuzvlQD
 w3EF4/09kfQ3tJJ7wo9lInvL43OrRUAs/JqhhV4eKixva3WgnwyftMvyKtMKb5e4tAtZtAvW/ol
 +bkUUvddxt3xkNVblpJxKOFGUk+g+b37SB7Xq6o/6pDOSHAT4e/U8SaCuLr2UX3SQe9QJ4DpvVW
 RqWru8U4A6tZ18Zo156cGxI0TKBAXFVIO159ukBMvDyo2lLOpbq0n466vy7Dg0pr7x2BcJlvsVY
 ADuW+KGkmXD9UyDsUddaVCaBwDfpDJdaM77pi6Q0BhASK6uYRJzzLZ9vTodg8CJCrOeKsCrkgVZ
 rLL8l+eyPRAFuDV3rK33xc9F+vzSBIu+YvRrnsF/1HLv3vFbuN1/8MH1kVCn9aSH3hvmJMiy/36
 e6nG7ffhn9nGKfrNJaGMHR5a+Fam9XNeCouxW2Lz8=
X-Google-Smtp-Source: AGHT+IGtPw88btHnjJjgwzjkOxjWS7YAUQOZUfhtyG630vNIPynFG2gBj8xckeGyaxWjL5qSTI09rQ==
X-Received: by 2002:a05:600d:62eb:b0:471:6d1:9895 with SMTP id
 5b1f17b1804b1-47109b58f90mr21601185e9.14.1760636045326; 
 Thu, 16 Oct 2025 10:34:05 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.42.252])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4710eeaa236sm25391795e9.4.2025.10.16.10.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 10:34:04 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Anand Gadiyar <gadiyar@ti.com>, Bryan Brattlof <bb@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 16 Oct 2025 19:34:01 +0200
Message-ID: <20251016173401.163407-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760636046; x=1761240846;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3XkO6M9jcLeqCeCA4YOq6y3ZidJrX0fKW4X2WCDtm3Q=;
 b=VFL1xwVHpm5wUR8ruBWNRVo9PCtfLJp3cfbgrM37mNMUwccC9yUCMpF/3kY5wOPHZ+
 Yt0Bq6RxWyA24lfpOKKCCXfAaGyV4p6ZkYFeGkgOcY4uITJDuexkXMZOECohniDJtf+N
 BurD7UF9FdkSPtsSWpGeXIkDxPVr4fHPQjquo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=VFL1xwVH
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

- U-Boot to version v2025.10
- Linux kernel to version 6.12.53 (LTS)

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/ti/am62x-sk/patches/linux/linux.hash | 2 +-
 board/ti/am62x-sk/patches/uboot/uboot.hash | 2 +-
 configs/ti_am62x_sk_defconfig              | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/ti/am62x-sk/patches/linux/linux.hash b/board/ti/am62x-sk/patches/linux/linux.hash
index df60f9a5823d..4ac46f027b20 100644
--- a/board/ti/am62x-sk/patches/linux/linux.hash
+++ b/board/ti/am62x-sk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0fcbbbbcd456e87bbbfc8bf37af541fda62ccfcce76903503424fd101ef7bdee  linux-6.12.43.tar.xz
+sha256  663507accae673afcf4e210b4ae8d4352e61d926202e5da3f04bf71ca1d2c0b5  linux-6.12.53.tar.xz
diff --git a/board/ti/am62x-sk/patches/uboot/uboot.hash b/board/ti/am62x-sk/patches/uboot/uboot.hash
index 440526977bd9..98a5c53aaf97 100644
--- a/board/ti/am62x-sk/patches/uboot/uboot.hash
+++ b/board/ti/am62x-sk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
+sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 211d58a66f3c..4349c966ace4 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -l am62x
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.43"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.53"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
@@ -26,12 +26,12 @@ BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
-BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2025.07"
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2025.10"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
