Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B3AE77184
	for <buildroot@archiver.kernel.org>; Sat, 21 Dec 2024 14:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22E034EF6B;
	Sat, 21 Dec 2024 14:14:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vTIysv-SC57c; Sat, 21 Dec 2024 14:14:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB3ED4EF84
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB3ED4EF84;
	Sat, 21 Dec 2024 14:14:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8181D757
 for <buildroot@buildroot.org>; Sat, 21 Dec 2024 14:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6378C40BAD
 for <buildroot@buildroot.org>; Sat, 21 Dec 2024 14:14:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dSc31FVLQh6P for <buildroot@buildroot.org>;
 Sat, 21 Dec 2024 14:14:03 +0000 (UTC)
X-Greylist: delayed 485 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 21 Dec 2024 14:14:02 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9DC4A41CAD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DC4A41CAD
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DC4A41CAD
 for <buildroot@buildroot.org>; Sat, 21 Dec 2024 14:14:02 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout01.mail.de (Postfix) with ESMTP id F39DB240F06;
 Sat, 21 Dec 2024 15:05:56 +0100 (CET)
Received: from smtp01.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix03.mail.de (Postfix) with ESMTP id D0CF826016F;
 Sat, 21 Dec 2024 15:05:56 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 308A2240DC1;
 Sat, 21 Dec 2024 15:05:56 +0100 (CET)
To: buildroot@buildroot.org
Cc: quentin.schulz@cherry.de, niklas.cassel@wdc.com,
 Kilian Zinnecker <kilian.zinnecker@mail.de>
Date: Sat, 21 Dec 2024 15:05:03 +0100
Message-ID: <20241221140503.9861-2-kilian.zinnecker@mail.de>
In-Reply-To: <20241221140503.9861-1-kilian.zinnecker@mail.de>
References: <20241221140503.9861-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1780
X-purgate-ID: 154282::1734789956-857722C4-8AEC82D4/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1734789956;
 bh=H6qKTd3SYLnQI55XCEZfdAahGOHNFiZHrK6rWl/q/cM=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=VVcR2z7eqG0OXjtI2qYHrNib2hXui4pGUFFpr1haIWagIGiAHKxYPqRwIYDjp/w8v
 P5QyMGXSOLtx6bptbptK7PHAVj0T5ItjxTBOk/C/H3vysDME3Cw9rEZioIoMYYhBRG
 GxVeu8PhzybrDSy9xKtTrWiELInMZatBy5anG/5fikgAtl36fwGjWaaYQQLWeHgmUo
 wSKgahlQ7RD/uUhOiKdiqQh4cScE8coyQvn+xNnOOcsq4aZqqA7HHIVnXHASQVgqjX
 cnxcfVsZTdZCO8vih3+dPVi4RU6HCPHjDQVai0nQ874qWYJQw5gpfDuZGyzrL1Al8d
 V2/JkHNH14fGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=VVcR2z7e
Subject: [Buildroot] [PATCH v2 1/1] configs/rock5b: Switch to mainline
 TrustedFirmware
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
From: "kilian.zinnecker--- via buildroot" <buildroot@buildroot.org>
Reply-To: kilian.zinnecker@mail.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Kilian Zinnecker <kilian.zinnecker@mail.de>

The Rock 5b board support currently uses a binary trusted firmware
blob from the rockchip-rkbin package. Recently, the Rock 5b's SoC,
i.e., the rk3588, received mainline TrustedFirmware-A support:

https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/21840
https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/29363

This support was recently released as part of the v2.12 version of
the TrustedFirmware-A. This patch changes the defconfig from using
the rockchip-rkbin atf binary blob to building the TrustedFirmware-A
v2.12 for the rk3588 from source.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
---
 configs/rock5b_defconfig | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index f898e86c8c..47a7acc083 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -23,9 +23,15 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3=y
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
 BR2_PACKAGE_ROCKCHIP_RKBIN=y
 BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.12.bin"
-BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME="bin/rk35/rk3588_bl31_v1.40.elf"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.12"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3588"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="bl31/bl31.elf"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
