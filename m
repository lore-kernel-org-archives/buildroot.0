Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0C6C433FE
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 07:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8E8640A02;
	Tue,  8 Nov 2022 07:36:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8E8640A02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RmvEq2IwXfGI; Tue,  8 Nov 2022 07:36:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4992F402E7;
	Tue,  8 Nov 2022 07:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4992F402E7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5121B1BF35E
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 07:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27D48402E7
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 07:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27D48402E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aEfVGFyAVF94 for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 07:36:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9029C402E1
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9029C402E1
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 07:36:36 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id h9so19593846wrt.0
 for <buildroot@buildroot.org>; Mon, 07 Nov 2022 23:36:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gwopxemDnIKzalBs2c9bOpyleX0ZSCETPT3ICNVW7h4=;
 b=r7EqVsMdxf5GUEDyeALnvraCPgqPWuOJKnihc0tEyXXwDREHsqx94PdA4cl5kLRJ3i
 SXGUZCGFLwCLQatpPvsTHZeSs8sUcwhPJnuhBHf4YeEqRRCYEaRm0nBM9OkPpssPyNGT
 7EqQuSjwxWZ6nhB9Oxtz/kkcviI8RiEHHUY3QFHrBciXKqKPYKayuaDw42y7hE+0Qq6y
 idRujXuG0XPLfVwXfrHCEpRHX6ygWuci9kZuSdODqXfSUvvUp+j0lYhISCEL0UCmboTO
 Db5jlnHziP4Pt04v1aIloBsOd79kQZepqVhaAQlqjCiQmXxjUyh7Y1idZhZEYvbLhhiO
 qk0A==
X-Gm-Message-State: ACrzQf0Oov/+wKLxEGVefPa0UHx0VmmX2C9OIVDq1+6iElulCBhIxCvw
 4xI2pL31C7PEU9C/VT4D9KpTqq5jFrI=
X-Google-Smtp-Source: AMsMyM6OQwrJwkB8LZW6NtY7CzfYXSN+w0VLJUsfBcXP+w5uNxqaaLG86MIvcPSco+JpfU/pAJ/AgQ==
X-Received: by 2002:a5d:6d89:0:b0:236:6e52:4fa with SMTP id
 l9-20020a5d6d89000000b002366e5204famr34404132wrs.395.1667892993867; 
 Mon, 07 Nov 2022 23:36:33 -0800 (PST)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 bs17-20020a056000071100b002364c77bcacsm9454256wrb.38.2022.11.07.23.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 23:36:33 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  8 Nov 2022 08:36:07 +0100
Message-Id: <20221108073606.166060-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gwopxemDnIKzalBs2c9bOpyleX0ZSCETPT3ICNVW7h4=;
 b=OR4zbK/MJqyt691J90uaGDyebAww9u5z7QIMYsog+2E/B3r7bhYAzeKC+LO0io+8Vd
 2vRwy83bwPiyAvczKEjS7FoEUMXzSui2rTnR3rky6sNZUT4HkE6xWJic9YXcGWQZ8b59
 oeiarPHVsKlQ3nS/o7CO60y5jrmT9NFkEzc6FroE0GPIV0xor+66d3jhOVssmiEz0OeL
 0pzOEFoBISKk1cHG/IAryaoIAzAR4NWv20SnfAf/s5OGzoDqEN25JiAV4MrwPW24ECPt
 3+4tcf8ZhLNyiNViwiJscXOu24FklBQL/4BRmVXfAi48AgwspwlwJs+7VZTcqlOf0TzE
 rQSQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OR4zbK/M
Subject: [Buildroot] [PATCH v2] configs/kontron_bl_imx8mm_defconfig: bump
 U-boot to 2022.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The U-Boot makefile for the host tools does not handle the
compiler/linker options properly. There are some patches [1][2] that fixes
that issue already applied in the newer U-Boot version 2022.10. So we have to
bump U-Boot to fix an autobuilder fail.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233833

[1] U-Boot: a638bd349ea43825 (kbuild: add KBUILD_HOSTLDFLAGS to cmd_host-csingle)
[2] U-Boot: 31a7688cbe0ed5ed (tools: mkeficapsule: use pkg-config to get -luuid and -lgnutls)

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 configs/kontron_bl_imx8mm_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configs/kontron_bl_imx8mm_defconfig b/configs/kontron_bl_imx8mm_defconfig
index ff376662e9..240cb52245 100644
--- a/configs/kontron_bl_imx8mm_defconfig
+++ b/configs/kontron_bl_imx8mm_defconfig
@@ -38,7 +38,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30880
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="kontron-sl-mx8mm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
@@ -48,6 +48,7 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31_BIN=y
 BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
+BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
 BR2_TARGET_UBOOT_SPL=y
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
