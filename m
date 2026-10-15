Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C78CC6B33
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 12:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E713608BA;
	Thu, 15 Oct 2026 12:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t0Oeblb6v8Al; Thu, 15 Oct 2026 12:54:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 20429608B2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792068849;
	b=nOgLwICe97IPegY5L2C3V9LpSSUthh4xZqU9x4omgTSpAuKuL0DIg1tVv2ZXsTJ5vQv7
	 e31D1ppXCyLOT73z3VeK16y3h6bGu4yDc6nvNtrtjpmGd5hnQjj+kHCQJbSy8IRs0/5xf
	 gj+j0d9QT0PTbkwAaIwDR0UIw43WWbFtQy6kux6D/0C3H9LAnUogWrQ/JrK4vXEjxp49q
	 3VX9HcYY0MN3yu5xgYqyTVrp1Sj3I4hI90uxO9btRgwa3vhJ08+cQ7yucw5S7sqIDSUeb
	 PYi3t+X0LVn6ltwDqClnKzZ6Ds+9j23X3pXKSups10NINPWNv0L4n2yCEVufW147ULQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792068849;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=tvUkhpiCjDr+9OUbXWMn963lX8qr3UBNOzDyqRTqaxo=;
	b=f4C1SmL1xRqPV9kuB+s+FCRlZ+pJXEtHbIGlqLpwHhEZbKu1i6LwMt1FW64GgBVHV242
	 tLh+kyuIoUFhAtf2UftXdzJWOTmbVmB23M5zWVJCDdBsIyhVKb9y/QrNv7PnSJ8XO6vKu
	 85Cbls/6i0c7f/HrfnlTChWOO1lFCeBYp8Z0nwejq8KMHcyHnavjL0pEgZjy4Lv+Y5X4v
	 B+tlNTmP/mDUZThKZunTBrHxg+onZj2Hmvphkd4ZPgrUds8nsftJrSmej7FI8n76FBgdp
	 DnwosmDAD85VzFJzRQkcRpKTqXBYLgHcu0THGqsc9ZQpJD5HcfIr7KGiMUkPA3R85rg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792068849;
	bh=tvUkhpiCjDr+9OUbXWMn963lX8qr3UBNOzDyqRTqaxo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=seFTGEKeDLH2FdN6uTjNdBKJqLepkVCpgkdKmEToj13G9K7mx/WTqW6zutp+9Ruak
	 Zfx7NX1eVGbaEHu7e+XW9sMcVfstDbmOBxvspDn1Yneh0Tc9U5ETZc3gqiSXEakfUi
	 FO4jTCp2kJcfyL2zrpb118d0dhrKlLQi+s5SZb4VDWI1933ybxpswGadbBq3D/IXZy
	 w7S8bkingRE4IvkngKnffpeX9TKu+iw7iBusUdWBlKZhqQ7cEyLs54oI8zL/lvdyXO
	 515z1Oz1rqgfGlNPCOqZ80giGKrQGiWj5bIrdgF7YHRaLWiSOyq/KBKfiJ+Tn2Ws+w
	 aRPkK5yL6AVmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20429608B2;
	Thu, 15 Oct 2026 12:54:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 79184A58
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 12:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A5E5811C5
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 12:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v9RD3yqCziYf for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 12:54:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 362CF811B5
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792068846;
 b=BIBODY/94Z3gdGopsufdpnqcpnY5Z1DaK7EilKPMGdQjzZc54MOIjf7bzoJ2nnSQgbcJ
 ycY03/wvgSITE+PM/LtGPMgHV0/XK46G2Xb1Ue1ZngqjkcIcMFLfKiTcjOrraGZraGSih
 ZSRkuu2t1RzRTqGCs6a+RATc6dGEzZBHZtivLyz4Tw0MRGUjomgjT7RcRIQqqZElpfR6v
 6+PHIBFdkXch96X0oz8mEqb0jW3sS+StiG9OABiJdy09NWE48PVkGoqFWZRAow5NZUntT
 5/2GJAFRYumNN/ImBFQQluQenYJ3effCr0PV20oWdHl7MYNJ9J/0UlCNH0F2vZxwklw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792068846;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=bLLgko+ZPBFUa3axOHWSgcrKzTkY/sI1czQm1dO8heI=;
 b=UYVUgHn3WWv0bONwMjq5B1mUtuEABRCHNJpllXPN7uwdnnqB9TWOiCLSfCfYIQ67c341
 2NXZlBwQD5kLo4wxIkYcikbPSrFjOw554m2rpw55Ynrco2EQw9LxYNBD40K0aMj9I0x4e
 cgV0sYfkvMoVSF2wu1lH7VzURliqXRRZFn/UROO1J4Ayue36tJpilVyIVQSJYa2SrSkfS
 L0hNCd84qiAp+RdGUUmaPv7Wr1GQGoFK9eB7xqtCRRSOKS7Fm7LJXUbKithMAZhrdp4gk
 +Xkx2+tPXf7LbNv+Vx5XrLZvGFFbnRLoz+aubgvRWkSMrLzKLPGu9EzI2o5YsfMLRPA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=EZGdhPDY; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=EZGdhPDY
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 362CF811B5
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 12:54:04 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a0213948d3so32315785e9.2
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 05:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1792068843; x=1792673643;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=bLLgko+ZPBFUa3axOHWSgcrKzTkY/sI1czQm1dO8heI=;
 b=EZGdhPDYSDdA4d7h0HICkIgiD8X38RTp/Gz2acvMRfv9r8LqpW9cUvs/1eNaOrTAfM
 yLDDUyjwwnz9Tyxg7KF0Q6v2hYVO46JWDD1JgyeDSnaxJnyYKFCrcx1vK0XTUUQGirUh
 lzb5/AOfhTUo00CK/hOs+M15Dz9eU9K1PpowM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792068843; x=1792673643;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bLLgko+ZPBFUa3axOHWSgcrKzTkY/sI1czQm1dO8heI=;
 b=Ej/t/h1N8fZMtdGagXIIGWevO9eJDB4btFenEf3EQJnDiBZ/LY6mXAMwIK/9PlVSsc
 bT4N+kSRaqPDDW+l4Sep/AxFlTWqDGPWn1sInDMbhYTLZIAavUzp1gejSzBfad6FkEXT
 bUvTBii+4QcVLnwW0a2Hf2i3hDCv923nN6GCaTYC1w9ctr0vQiGEsdvo5iIXNu2tJhTo
 tRB8ixNfmgI0J7otQA66haORwgheVbFRr2FTs5OZ3vliCq+e/xqMuFo/Gb9uOSGeFSHS
 f2vSl97RyHaDTouztoU4hSXdB3H8HLVhA97nysx33JQ4cwHwpIxtm2PhuszBKi+e35mQ
 BR8w==
X-Gm-Message-State: AFq9FYKyEF7AVI/t+CHxE9V2+LoMP2+gjN+VMXjBa52wVKtq/WtHCIGE
 h969xF0T3G/f9fo2YF8ep94g4DmHAh+CKiLWILYzikJh0GFKClemWqLytPqSlKFrjybuGYPsCg0
 n72t3
X-Gm-Gg: AYBFou2w3ns+LamZz3NOK4JX5K9G7WRiJ8oQdC88hIYAv7tOFdOvu7rdicgQe0hwkgb
 RtiJ2mTTmqVpCrX8PmGoBGljPsNXeOfm0OjDGrX0de/Yw6YmkREPVDdCsWTZhrBi9EurT8dXNzW
 A7LCYfqa2RBgmETdSKgYBk53oEX3KsL72DwXwkKSTVPTSkj0L3FCHZsvkx1ZwwbU0P9YcVTO0/H
 787T0FSZ3VRTOLQ/ve24Ovg/0j4eFRDnbt6YW2XpvE1JDjxfnmTdb36p42DHzY/ZG2dRn+Gjwvz
 AvlF3CNYnbhOAQOkJT/2shUxVUuqpV6MyPGCiA1kMBRwwweVbFypf/u8O+ywrrhJ2fYBRdz/cfU
 C1BfERGdP1UziGAKL6HMBcXwGZB2WUzC01oFtmQDhvvezgcr9z1SJjXHyfRxFptljtxs8mHyu/t
 GuKRhNYpaBUW0VloBGUmuRRMh4cmxCP9vZCoNKsecBzyfrwfkJeEMYpC5SGVqhDzGkNyMzMPooQ
 UrJaZpwDwzAAQNuSmOAsooRli3DOEMITs/xD40cQyilAI3OsqihLO3xJRkWfd39Gdg=
X-Received: by 2002:a05:600c:4ecb:b0:4a0:c01:1902 with SMTP id
 5b1f17b1804b1-4a18e43a29fmr383948615e9.2.1792068842792; 
 Thu, 15 Oct 2026 05:54:02 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:81b2:a12a:b337:b231])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0aaabc3sm18803863f8f.16.2026.10.15.05.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 05:54:01 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 15 Oct 2026 14:53:56 +0200
Message-ID: <20261015125356.1917757-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] configs/stm32f469_disco_{sd,
 xip}: bump Linux to 5.15.222
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

The patch bumps the Linux kernel to version 5.15.222 and, for the SD
configuration, also updates U-Boot to version 2026.10.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stm32f469-disco/patches/linux/linux.hash                  | 2 +-
 .../stm32f469-disco/patches/uboot/uboot.hash                  | 2 +-
 configs/stm32f469_disco_sd_defconfig                          | 4 ++--
 configs/stm32f469_disco_xip_defconfig                         | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
index b4a6bbd3f783..20f03bc1d4df 100644
--- a/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  beb954e53617928b751944a89b6670bf9a9c7177c641b24c5dba504e46f1d961  linux-5.15.211.tar.xz
+sha256  4d6ec07679bd008524391cb67597106018646c6378b3953c23ec69b9259cdf84  linux-5.15.222.tar.xz
diff --git a/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
index ff6e4ed2e2f6..66c72d3afd51 100644
--- a/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
+sha256  3f856da3cbbc93af51ff95fde18588a348b4a26723b01d9841e999d988481015  u-boot-2026.10.tar.bz2
diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
index 70a214a10825..af3782dd401f 100644
--- a/configs/stm32f469_disco_sd_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f469-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.211"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.222"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0x00000000.config board/stmicroelectronics/stm32f469-disco/linux-sd.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f469-discovery"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
index 578cecadbe50..605f7afdef00 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -8,7 +8,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.211"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.222"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f469-disco/linux-xip.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
