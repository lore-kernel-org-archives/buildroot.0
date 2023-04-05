Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F4CC7619A
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 09:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DF3340363;
	Wed,  5 Apr 2023 09:33:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DF3340363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T7p46NBuHGUs; Wed,  5 Apr 2023 09:33:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87F7E4012C;
	Wed,  5 Apr 2023 09:33:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87F7E4012C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 02B561C2A1D
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 09:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83FEE60ADF
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 09:33:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83FEE60ADF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Aas8P0m1kYe8 for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 09:33:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7597F60592
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7597F60592
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 09:33:23 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id fi11so16007941edb.10
 for <buildroot@buildroot.org>; Wed, 05 Apr 2023 02:33:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680687201;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wBZQfIpcU66/nd/wlRSlBuV6GIopbzerVIURNERGmRs=;
 b=P/poLeshuSi4fpdzTsehcY4F7Yfw0kbrHWnB04Eh1GIQA0e5cvKgSa4IpDSYMbg1DY
 i0Jf1YzXWXxybLSiXbUC5S83NuLoLyCaW2CiaEbwpo4q8gYQnAwnm9hVkII3lx6+w2Xw
 O96fKja566qeXuRTiXD4dM4GyHru+IsueSxCjiMTVocd5BOrcR0SMwaq6SDLqIvnx6E3
 oyYT11X41pqMqklwAxzj1uWFQWijd/DNfwWM73lTfy0d5I0mZxYvZF7BYnqXV5Got9pp
 CbdMiojKmV38DkEojEUYQJTE+ZkwKJw8a+qJ2VUUgpde3TKp7XtKYQQ4BXrABvnK/XmN
 yhzA==
X-Gm-Message-State: AAQBX9fCGhntFKvtdlAI4oZx7FhFbKatk9EX/P7AfVE01sykNWsKJTAC
 G6RZ0kdhfzDAKVlkhgy+xCbDXk8JtsgEC59sPiY=
X-Google-Smtp-Source: AKy350Zc5ixgvrVfJstNhXFzI6UsSoz+wu5xoIDqQz/fcKwh+MN0PdSgm1hj7nUqXzsQWQQpzEEGmg==
X-Received: by 2002:a17:906:a38f:b0:932:a14e:4c57 with SMTP id
 k15-20020a170906a38f00b00932a14e4c57mr2423030ejz.76.1680687201219; 
 Wed, 05 Apr 2023 02:33:21 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-60-28-18.retail.telecomitalia.it. [82.60.28.18])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a50d517000000b004af720b855fsm6993297edi.82.2023.04.05.02.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 02:33:20 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  5 Apr 2023 11:33:16 +0200
Message-Id: <20230405093317.13045-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680687201;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wBZQfIpcU66/nd/wlRSlBuV6GIopbzerVIURNERGmRs=;
 b=YXMIysDHMNhR1Rd9AOH8QdLZXQIs+dyityRqPfkL0P1LHL6AJdgncilaUHUxKPI5OP
 rwd59vBZ1KGmaHHnTGP0WqfdsQScqKbF57+X+/bftdgB0X0niqk8DjpRkX/XxD+nTkQe
 T27nvkTdYr2ATU9ZncrSb+YuLapGr5zxdrny0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=YXMIysDH
Subject: [Buildroot] [PATCH 1/2] configs/imx8mn_bsh_smm_s2_defconfig: bump
 U-Boot version to 2023.04
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
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump U-Boot to version 2023.04 and remove the patch that has already
been upstreamed.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...Remove-rootwait-1-to-all-the-affecte.patch | 160 ------------------
 configs/imx8mn_bsh_smm_s2_defconfig           |   3 +-
 2 files changed, 1 insertion(+), 162 deletions(-)
 delete mode 100644 board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0001-include-configs-Remove-rootwait-1-to-all-the-affecte.patch

diff --git a/board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0001-include-configs-Remove-rootwait-1-to-all-the-affecte.patch b/board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0001-include-configs-Remove-rootwait-1-to-all-the-affecte.patch
deleted file mode 100644
index 59db559b9301..000000000000
--- a/board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0001-include-configs-Remove-rootwait-1-to-all-the-affecte.patch
+++ /dev/null
@@ -1,160 +0,0 @@
-From 3878b941c6bde84e29b2725e4261d85bea828752 Mon Sep 17 00:00:00 2001
-From: Michael Trimarchi <michael@amarulasolutions.com>
-Date: Sun, 22 May 2022 15:22:08 +0200
-Subject: [PATCH] include/configs: Remove rootwait=1 to all the affected boards
-
-rootwait=1 is not a valid kernel boot parameters. According
-to the documenation is only rootwait
-
-rootwait	[KNL]	Wait (indefinitely) for root device to show up.
-			Useful for devices that are detected asynchronously
-			(e.g. USB and MMC devices).
-
-Fix:
-Unknown kernel command line parameters "rootwait=1", will be passed to user space.
-
-Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
-Reviewed-by: Heiko Schocher <hs@denx.de>
-Link: https://patchwork.ozlabs.org/project/uboot/patch/20220520110013.32811-1-michael@amarulasolutions.com/
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
----
- include/configs/am335x_evm.h           | 2 +-
- include/configs/am43xx_evm.h           | 2 +-
- include/configs/baltos.h               | 2 +-
- include/configs/chiliboard.h           | 2 +-
- include/configs/etamin.h               | 2 +-
- include/configs/imx8mn_bsh_smm_s2.h    | 2 +-
- include/configs/siemens-am33x-common.h | 4 ++--
- include/configs/ti_armv7_keystone2.h   | 2 +-
- include/environment/ti/nand.h          | 2 +-
- 9 files changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
-index fd5b209a52db..f301a6dc835b 100644
---- a/include/configs/am335x_evm.h
-+++ b/include/configs/am335x_evm.h
-@@ -34,7 +34,7 @@
- 		"root=${nandroot} " \
- 		"rootfstype=${nandrootfstype}\0" \
- 	"nandroot=ubi0:rootfs rw ubi.mtd=NAND.file-system,2048\0" \
--	"nandrootfstype=ubifs rootwait=1\0" \
-+	"nandrootfstype=ubifs rootwait\0" \
- 	"nandboot=echo Booting from nand ...; " \
- 		"run nandargs; " \
- 		"nand read ${fdtaddr} NAND.u-boot-spl-os; " \
-diff --git a/include/configs/am43xx_evm.h b/include/configs/am43xx_evm.h
-index 5057441f7506..1f5c3cd04e88 100644
---- a/include/configs/am43xx_evm.h
-+++ b/include/configs/am43xx_evm.h
-@@ -166,7 +166,7 @@
- 		"root=${nandroot} " \
- 		"rootfstype=${nandrootfstype}\0" \
- 	"nandroot=ubi0:rootfs rw ubi.mtd=NAND.file-system,4096\0" \
--	"nandrootfstype=ubifs rootwait=1\0" \
-+	"nandrootfstype=ubifs rootwait\0" \
- 	"nandboot=echo Booting from nand ...; " \
- 		"run nandargs; " \
- 		"nand read ${fdtaddr} NAND.u-boot-spl-os; " \
-diff --git a/include/configs/baltos.h b/include/configs/baltos.h
-index b881d8c03fd7..7b43741fde7c 100644
---- a/include/configs/baltos.h
-+++ b/include/configs/baltos.h
-@@ -37,7 +37,7 @@
- 		"root=${nandroot} " \
- 		"rootfstype=${nandrootfstype}\0" \
- 	"nandroot=ubi0:rootfs rw ubi.mtd=5\0" \
--	"nandrootfstype=ubifs rootwait=1\0" \
-+	"nandrootfstype=ubifs rootwait\0" \
- 	"nandboot=echo Booting from nand ...; " \
- 		"run nandargs; " \
- 		"setenv loadaddr 0x84000000; " \
-diff --git a/include/configs/chiliboard.h b/include/configs/chiliboard.h
-index 82acda595f09..8bad0f9ac4b6 100644
---- a/include/configs/chiliboard.h
-+++ b/include/configs/chiliboard.h
-@@ -20,7 +20,7 @@
- 		"root=${nandroot} " \
- 		"rootfstype=${nandrootfstype}\0" \
- 	"nandroot=ubi0:rootfs rw ubi.mtd=NAND.file-system\0" \
--	"nandrootfstype=ubifs rootwait=1\0" \
-+	"nandrootfstype=ubifs rootwait\0" \
- 	"nandboot=echo Booting from nand ...; " \
- 		"run nandargs; " \
- 		"nand read ${fdt_addr} NAND.u-boot-spl-os; " \
-diff --git a/include/configs/etamin.h b/include/configs/etamin.h
-index 9cf93924df93..1c0a86d1ed10 100644
---- a/include/configs/etamin.h
-+++ b/include/configs/etamin.h
-@@ -113,7 +113,7 @@
- 	"nand_active_ubi_vol=rootfs_a\0" \
- 	"rootfs_name=rootfs\0" \
- 	"kernel_name=uImage\0"\
--	"nand_root_fs_type=ubifs rootwait=1\0" \
-+	"nand_root_fs_type=ubifs rootwait\0" \
- 	"nand_args=run bootargs_defaults;" \
- 		"mtdparts default;" \
- 		"setenv ${partitionset_active} true;" \
-diff --git a/include/configs/imx8mn_bsh_smm_s2.h b/include/configs/imx8mn_bsh_smm_s2.h
-index d09c2ab01610..0dc514f00684 100644
---- a/include/configs/imx8mn_bsh_smm_s2.h
-+++ b/include/configs/imx8mn_bsh_smm_s2.h
-@@ -22,7 +22,7 @@
- 		"root=${nandroot} " \
- 		"rootfstype=${nandrootfstype}\0" \
- 	"nandroot=ubi0:root rw ubi.mtd=nandrootfs\0" \
--	"nandrootfstype=ubifs rootwait=1\0" \
-+	"nandrootfstype=ubifs rootwait\0" \
- 	"nandboot=echo Booting from nand ...; " \
- 		"run nandargs; " \
- 		"nand read ${fdt_addr_r} nanddtb; " \
-diff --git a/include/configs/siemens-am33x-common.h b/include/configs/siemens-am33x-common.h
-index 08c4d52d658f..9f1a6cd51b40 100644
---- a/include/configs/siemens-am33x-common.h
-+++ b/include/configs/siemens-am33x-common.h
-@@ -237,7 +237,7 @@
- 	"nand_active_ubi_vol=rootfs_a\0" \
- 	"nand_active_ubi_vol_A=rootfs_a\0" \
- 	"nand_active_ubi_vol_B=rootfs_b\0" \
--	"nand_root_fs_type=ubifs rootwait=1\0" \
-+	"nand_root_fs_type=ubifs rootwait\0" \
- 	"nand_src_addr=0x280000\0" \
- 	"nand_src_addr_A=0x280000\0" \
- 	"nand_src_addr_B=0x780000\0" \
-@@ -314,7 +314,7 @@
- 	"nand_active_ubi_vol=rootfs_a\0" \
- 	"rootfs_name=rootfs\0" \
- 	"kernel_name=uImage\0"\
--	"nand_root_fs_type=ubifs rootwait=1\0" \
-+	"nand_root_fs_type=ubifs rootwait\0" \
- 	"nand_args=run bootargs_defaults;" \
- 		"mtdparts default;" \
- 		"setenv ${partitionset_active} true;" \
-diff --git a/include/configs/ti_armv7_keystone2.h b/include/configs/ti_armv7_keystone2.h
-index 57f013cbf846..133daecf7164 100644
---- a/include/configs/ti_armv7_keystone2.h
-+++ b/include/configs/ti_armv7_keystone2.h
-@@ -180,7 +180,7 @@
- 		"sf write ${loadaddr} 0 ${filesize}\0"		\
- 	"burn_uboot_nand=nand erase 0 0x100000; "			\
- 		"nand write ${loadaddr} 0 ${filesize}\0"		\
--	"args_all=setenv bootargs console=ttyS0,115200n8 rootwait=1 "	\
-+	"args_all=setenv bootargs console=ttyS0,115200n8 rootwait "	\
- 		KERNEL_MTD_PARTS					\
- 	"args_net=setenv bootargs ${bootargs} rootfstype=nfs "		\
- 		"root=/dev/nfs rw nfsroot=${serverip}:${nfs_root},"	\
-diff --git a/include/environment/ti/nand.h b/include/environment/ti/nand.h
-index 11dcefcc41ca..7d00afa2b10f 100644
---- a/include/environment/ti/nand.h
-+++ b/include/environment/ti/nand.h
-@@ -14,7 +14,7 @@
- 		"root=${nandroot} " \
- 		"rootfstype=${nandrootfstype}\0" \
- 	"nandroot=ubi0:rootfs rw ubi.mtd=NAND.file-system,2048\0" \
--	"nandrootfstype=ubifs rootwait=1\0" \
-+	"nandrootfstype=ubifs rootwait\0" \
- 	"nandboot=echo Booting from nand ...; " \
- 		"run nandargs; " \
- 		"nand read ${fdtaddr} NAND.u-boot-spl-os; " \
--- 
-2.32.0
-
diff --git a/configs/imx8mn_bsh_smm_s2_defconfig b/configs/imx8mn_bsh_smm_s2_defconfig
index 9b8ac8bfe2da..8b2b74395efc 100644
--- a/configs/imx8mn_bsh_smm_s2_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_defconfig
@@ -1,6 +1,5 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
-BR2_GLOBAL_PATCH_DIR="board/bsh/imx8mn-bsh-smm-s2/patches"
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2/post-build.sh"
 BR2_LINUX_KERNEL=y
@@ -28,7 +27,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_bsh_smm_s2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
