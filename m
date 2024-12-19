Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF439E77184
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 17:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85E10412BB;
	Thu, 19 Dec 2024 17:34:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PJ-5CeEQQMlm; Thu, 19 Dec 2024 17:34:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DA36412BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DA36412BC;
	Thu, 19 Dec 2024 17:34:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 15DE2730
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 17:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E96AB83A5E
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 17:34:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o9ZRRqRUvrh4 for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 17:34:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E6A2E83A5F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6A2E83A5F
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6A2E83A5F
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 17:34:13 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-aa684b6d9c7so186644666b.2
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 09:34:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734629651; x=1735234451;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EGO/61bcKxidV8PdTOvyLM5UzxOUOV+D8pn44I4Whfs=;
 b=j9BajUGpPKqX+oen0sVbHRSHs3PyQwe2HsjnyKudt6uZUsseoBVL3VS1CdFONQxhOS
 G8Ox7xnz87JTdN62VSlhkHg+slaQ3b74hAMHPF/uY+Ge+KkEJ71Aff1gQJl7AnzxKpp+
 WnlswPSwju3MVzPp1B9QLhcXhHhNouePUrrUmdmFS7y2KQ4JCyRGjWaVLNSFXuhbE9qg
 ckVwCcTFgYrf0Vi10M4osIBVfN66e3KHWRODD+t28FjSeig92SZwowvZAcK2N65js8Wu
 bRnGIO6wYhq2YoNAYLQNHK+6GE2vXZPss5SimmP0wRHQ6VNIvb28Ewgl0MoI+21ZMOzu
 0ZUA==
X-Gm-Message-State: AOJu0Yx5XL4ISMzsMRbUasKf27B2sSqeXmJ9YPrPa0aKW0HwkcJhlIWh
 uha+nXV38tb4but0Z4x1iC784dQRki5O/7jYQUgvbld8tqJxcxWdv3XBhENuSUlsROB4hcL0eKh
 l
X-Gm-Gg: ASbGncuTFDHeSeSN1daBckjoMTaWXjimTpeDV+vW4HfpaT85R68dCTBQjh94w4yezX1
 tWVmxiWucRXKbGm+PSErpZ6nJy7RaQ0dCF7Ny5WquqZWxChT02jzb10xbuU2W9y4iSYLdbSW70k
 3vOfuo975wF9bROohw83n+bArwgn1ycYVxcXbDD4d1fCyVsUHthWlq4V3s6mtNAfQvh0viTFa8O
 +Ue5C/S/OUi/atBrSpVQ8F9EcWPz8kzNOv7FmN6eGIZydVzdY3Tz2j7gTChCSRRAjlpoiPumlyP
 SILjF+hi6yNkvoS32M+NkJq+Cgd12j+S77ywqZHf4gmk8w==
X-Google-Smtp-Source: AGHT+IGfgj9Yy/xzEkXypTt/PIdwlClZsmcVvsA6MBFp4QwKiO6aNVYDOujbNWIRhFGvV78JxRQKbg==
X-Received: by 2002:a17:907:7206:b0:aa6:96ad:f8ff with SMTP id
 a640c23a62f3a-aac23688ac3mr16980866b.52.1734629651468; 
 Thu, 19 Dec 2024 09:34:11 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e82eb8fsm87472666b.35.2024.12.19.09.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 09:34:11 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Thu, 19 Dec 2024 18:34:08 +0100
Message-ID: <20241219173408.3349860-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1734629651; x=1735234451;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EGO/61bcKxidV8PdTOvyLM5UzxOUOV+D8pn44I4Whfs=;
 b=HrLbgkVPpeeavuhjm4OOmbytrnu3YZANMaFKOkkfPc+zjB/UWCnDA/eQBqUynIwOnN
 Y/c7d8hq/jRQj+r7S0JzCjWCmldKy123U7FRCMSQJTeiwkFu8AKT825/L6sKTxlodCzP
 6BfOf3q9tFGP2VgkcNCi+iyACddATM45H0qWg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=HrLbgkVP
Subject: [Buildroot] [PATCH 1/1] configs/imx6ulz_bsh_smm_m2: bump U-Boot to
 2024.10 and Linux to 6.1.120
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

- Bump Linux kernel to 6.1.120
- Bump U-Boot to 2024.10 and add the dependency on GnuTLS and
  util-linux (for uuid)

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash | 2 +-
 configs/imx6ulz_bsh_smm_m2_defconfig                  | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash b/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
index c0b3bcdd0404..904fa56c02a3 100644
--- a/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
+++ b/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  e00e6c6f014e046101739d08d06f328811cebcf5ae101348f409cbbd55ce6900  u-boot-2023.10.tar.bz2
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/configs/imx6ulz_bsh_smm_m2_defconfig b/configs/imx6ulz_bsh_smm_m2_defconfig
index 29177c475656..f12dc8383d80 100644
--- a/configs/imx6ulz_bsh_smm_m2_defconfig
+++ b/configs/imx6ulz_bsh_smm_m2_defconfig
@@ -9,7 +9,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx6ulz-bsh-smm-m2/post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.68"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.120"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/bsh/imx6ulz-bsh-smm-m2/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,10 +28,12 @@ BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6ulz_smm_m2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-with-spl.imx"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
