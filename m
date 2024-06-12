Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B79AC27C53
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 07:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 283FC82224;
	Wed, 12 Jun 2024 07:56:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4-bidCkCG44J; Wed, 12 Jun 2024 07:56:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FC8D824E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FC8D824E3;
	Wed, 12 Jun 2024 07:56:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 334791BF3A1
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 07:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C7B540319
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 07:56:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LxNKjhj_3NzN for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 07:56:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::601;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B2FE740259
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2FE740259
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::601])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B2FE740259
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 07:56:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gtgKJjUl/XCvnukSG4FGPoJkUd5SZT2UIaCYl2UNp9IpjLmZkUaath8Bj6WxSgPJESH3N5Q6Wm5IYAzz8XdY90M8ng08/7r9cHCnlJGNomHS2tEjjQn20xgIKHR+Vk2fls7lEJl2e+3CwtUlnWoq7XOA/w5RMvcq/Rud7EbMWwCJTeMTRwuoCgNB3MuGiG1BNtAn5gcXD/jDRMyJkFRD2q2zKM3FfspI+KgUYf4UezJ8tfjGJfWqtA2gO7XPpaeLv2xrLceF8aMf9wffDDxHTXv5nTYio9WSdRCBjX+cG1D361PiGy5T+GntmwWy3YxmRdhVxt6XSuW71xinEz5ibg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+T432AUApQne7FK0AMMZBWqTnMF7V/q2lt5hKoG3ncs=;
 b=QlMUSqwdUf4/v7OaHCwhfDuQ9INoXXxulpzCSkPGU9wTnKLVgRtRpT3DGnQDd8cr21MTgT/EkHvC8LUrd06SWrektNyXDqrCoSJxRI3dMpk4fWS1Wqkpkuldv9sRYXiPiaoy9Q70te/klHp6bMWeHtdVUWExvyv/2Y/Hdl2MzDpxNEIv5AmsF393fHtFQTak67BE+U6OoN9dxj3SCKtI8sicFywDiikGWrxPJfEEai/4Uzmeknq/oyvSI70w7VG1WopxADlDxCKRCumsn8E+RpgNmOpPYPaXlHqQcSvrIxkTaiZlQX+LZB9jtgit5kIl8D9U8woxJ4OqCEHKU3Ys2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DM6PR04CA0030.namprd04.prod.outlook.com (2603:10b6:5:334::35)
 by PH0PR12MB7908.namprd12.prod.outlook.com (2603:10b6:510:28e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Wed, 12 Jun
 2024 07:56:15 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:5:334:cafe::3) by DM6PR04CA0030.outlook.office365.com
 (2603:10b6:5:334::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.17 via Frontend
 Transport; Wed, 12 Jun 2024 07:56:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Wed, 12 Jun 2024 07:56:14 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Jun
 2024 02:56:12 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Jun
 2024 02:56:12 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 12 Jun 2024 02:56:11 -0500
To: <buildroot@buildroot.org>
Date: Wed, 12 Jun 2024 08:55:58 +0100
Message-ID: <20240612075559.436482-5-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240612075559.436482-1-neal.frager@amd.com>
References: <20240612075559.436482-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|PH0PR12MB7908:EE_
X-MS-Office365-Filtering-Correlation-Id: e7d0010c-8e38-4109-dd2f-08dc8ab52254
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230032|82310400018|36860700005|376006|1800799016|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nqVascvf8mVvShvXm9yvf5a1qCx8IYaVpPa0BkBvfiuML2dje2ZVVxJd9QEd?=
 =?us-ascii?Q?OiXTyUF8adu+FO6aqqrGv339ulUppcd8WJjVtaaaUQYaK8EoHx+hVoD/O5xA?=
 =?us-ascii?Q?X/hl5sm85zHacRHv47zgA5UlNfa9+j/z1qflhH/aurDnPRoWD4fhoKyMebTv?=
 =?us-ascii?Q?m8hcsaGYSfguR3d/yInc+M7bgQnHdJDxYbp54SXLN/TA7AibN9T+fXlyH2Qe?=
 =?us-ascii?Q?iyAFpfjcPlvk8TcP0x/3d6pm8CsYkqAGiRMuad1ViSgAAK/gN4/2Bm9DNOxN?=
 =?us-ascii?Q?m5ITxR+JhYR2YM1ZsIY1unse45fBXWNZKnIGT0PRnarcwxCAuYTROFK1TfT+?=
 =?us-ascii?Q?rGkufmr1O87cHZr3YcJRB/QDcHGurx3Rv3B7DK9wiexCzINg2I2nFy9iAY6k?=
 =?us-ascii?Q?l3F6sRdIrDQXcj0Hmvf5WBi/+KUUr/XbkcMwyNThNFNLbGEhb470qf3okTEK?=
 =?us-ascii?Q?IFihCZjtv/Kko41Y1AUnZBPWqsT3T/yHGY/WpuNDZfLSPJk3GSGP8JXLQei4?=
 =?us-ascii?Q?jgKWT38UsqhO3xQziI7j3J5UjGR3m72DYy1q7SWaeAsEKI/lZNbAl+tkNKGL?=
 =?us-ascii?Q?ortKIBJ37dXwGQOqK56/l7P2JcN5pARlUPPbnK6qiNZgIvvtWMu7mNiEo3Ml?=
 =?us-ascii?Q?qDvtvLy3/CgTIqV0R8CnzxH358coh4MmHwNzk+mByb3SIuud6yVkTISr9c+V?=
 =?us-ascii?Q?KuXQv9Rv3++Im69jg6zejajBuJ3yPQ2WIQiNfvGMA1VAkV2BAx7yuADtLEi2?=
 =?us-ascii?Q?Q25dXhijkqbMekEcN9eX7dtw53PKaD9Ce2pTKRSzFrgNiP8/B7X3rZ9w0Iq/?=
 =?us-ascii?Q?dZqYzgtV3H9m8qhRtFZyRaavXXBiOtHXYINttK/4vtEYP8LzOBA3EV4v5Pmm?=
 =?us-ascii?Q?WwC8sU84r7Ej5eRcWBxP88UcAacyLrkEstfGgZ1J01cJRnQGsajsE/MwHQpH?=
 =?us-ascii?Q?RV850QxuY6axki2t0L84AEf3kxOZmUSHs7c6RU1EaPlJ/eq7iiXFUyPn/dny?=
 =?us-ascii?Q?geAOmF94O8spQ58xzfoSGToOO7PAN3closghttcQDh6rp6q3quZZYRtO9e0K?=
 =?us-ascii?Q?IxEvrNMk8Qqx4ZvMnb/E/8e34465ElcrSTHPvEPwoD8rE72hO24XwKjYUecw?=
 =?us-ascii?Q?RzI7GrMx3lNJgWRsfe8sSe93NDjBo0SSSOXVjZVOtFs6Beqmw/OHzwUACwCT?=
 =?us-ascii?Q?B6wbvoVlUyv6+idLVayXgIOta9kGZlMF6y706yFKYdz2/ubmzWQmaV0cHied?=
 =?us-ascii?Q?9M46YOUEMstCfCC5zATnxAEzdpiG1wCNoF6IoOaikgRJuNZXWY1AdgXEyi5F?=
 =?us-ascii?Q?rTC/5NRnrileVXXn4nVmwSWc60w47pvCuxbqQAUyiWsOBF3FzIqecYoxTy9w?=
 =?us-ascii?Q?1NickOBTzs+F8lguiDWJ7hCgo6B4V+5L43Ks1Ty7iHRro9zyrgkFgP/qqea+?=
 =?us-ascii?Q?Eq1700aBzjpm8khAokgCtGRSJjlR+0JU?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230032)(82310400018)(36860700005)(376006)(1800799016)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 07:56:14.6812 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d0010c-8e38-4109-dd2f-08dc8ab52254
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7908
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+T432AUApQne7FK0AMMZBWqTnMF7V/q2lt5hKoG3ncs=;
 b=cOOjchnwgibsAK56A7Sd0UgH7ui4e9G10K6/omwmfZqKLqQ50zEeTvogxWrmgtLB2n5uKWRpvHs/bQ9jhKBhXfPbSoFa2xWYbshQYN7L/mELeFI9ylwbOCjX5B2DrnI63DhhCuQe9Gfu4JBT5xefyBv+cDF2m24d/DMD+U0Y+Is=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=cOOjchnw
Subject: [Buildroot] [PATCH v1 5/5] package/versal-firmware: remove package
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
From: Neal Frager via buildroot <buildroot@buildroot.org>
Reply-To: Neal Frager <neal.frager@amd.com>
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch removes the package/versal-firmware as this package is replaced
by the boot/xilinx-prebuilt target boot firmware package.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 DEVELOPERS                                    |  1 -
 .../versal-firmware/versal-firmware.hash      |  2 --
 package/Config.in                             |  1 -
 package/versal-firmware/Config.in             | 24 -------------------
 package/versal-firmware/versal-firmware.mk    | 21 ----------------
 5 files changed, 49 deletions(-)
 delete mode 100644 board/xilinx/patches/versal-firmware/versal-firmware.hash
 delete mode 100644 package/versal-firmware/Config.in
 delete mode 100644 package/versal-firmware/versal-firmware.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 93627a0064..e5706e493b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2352,7 +2352,6 @@ F:	package/binutils-bare-metal/
 F:	package/bootgen/
 F:	package/gcc-bare-metal/
 F:	package/newlib-bare-metal/
-F:	package/versal-firmware/
 F:	toolchain/toolchain-bare-metal-buildroot/
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
diff --git a/board/xilinx/patches/versal-firmware/versal-firmware.hash b/board/xilinx/patches/versal-firmware/versal-firmware.hash
deleted file mode 100644
index c4d745f22c..0000000000
--- a/board/xilinx/patches/versal-firmware/versal-firmware.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  7abcba4e0e44e3a4adf9c1f971d918575226d7604dfd64a386baaa00c1c6c35f  versal-firmware-xilinx_v2024.1.tar.gz
diff --git a/package/Config.in b/package/Config.in
index 1b6a5b0dab..13af2978dd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -460,7 +460,6 @@ menu "Firmware"
 	source "package/sunxi-boards/Config.in"
 	source "package/ts4900-fpga/Config.in"
 	source "package/ux500-firmware/Config.in"
-	source "package/versal-firmware/Config.in"
 	source "package/wilc-firmware/Config.in"
 	source "package/wilink-bt-firmware/Config.in"
 	source "package/zd1211-firmware/Config.in"
diff --git a/package/versal-firmware/Config.in b/package/versal-firmware/Config.in
deleted file mode 100644
index 01daefd204..0000000000
--- a/package/versal-firmware/Config.in
+++ /dev/null
@@ -1,24 +0,0 @@
-config BR2_PACKAGE_VERSAL_FIRMWARE
-	bool "versal-firmware"
-	depends on BR2_aarch64
-	help
-	  Pre-built firmware files for Xilinx Versal boards.
-
-	  https://github.com/Xilinx/soc-prebuilt-firmware
-
-if BR2_PACKAGE_VERSAL_FIRMWARE
-
-config BR2_PACKAGE_VERSAL_FIRMWARE_VERSION
-	string "firmware version"
-	default "xilinx_v2023.1"
-	help
-	  Release version of Versal firmware.
-
-config BR2_PACKAGE_VERSAL_FIRMWARE_BOARD
-	string "board name"
-	default "vck190"
-	help
-	  Name of Versal target board.
-	  Used for installing the appropriate firmware.
-
-endif # BR2_PACKAGE_VERSAL_FIRMWARE
diff --git a/package/versal-firmware/versal-firmware.mk b/package/versal-firmware/versal-firmware.mk
deleted file mode 100644
index 1ced259be1..0000000000
--- a/package/versal-firmware/versal-firmware.mk
+++ /dev/null
@@ -1,21 +0,0 @@
-################################################################################
-#
-# versal-firmware
-#
-################################################################################
-
-VERSAL_FIRMWARE_VERSION = $(call qstrip,$(BR2_PACKAGE_VERSAL_FIRMWARE_VERSION))
-VERSAL_FIRMWARE_SITE = $(call github,Xilinx,soc-prebuilt-firmware,$(VERSAL_FIRMWARE_VERSION))
-VERSAL_FIRMWARE_LICENSE = MIT
-VERSAL_FIRMWARE_LICENSE_FILES = LICENSE
-VERSAL_FIRMWARE_INSTALL_TARGET = NO
-VERSAL_FIRMWARE_INSTALL_IMAGES = YES
-
-define VERSAL_FIRMWARE_INSTALL_IMAGES_CMDS
-	$(foreach f,plm.elf psmfw.elf vpl_gen_fixed.pdi,\
-		$(INSTALL) -D -m 0755 $(@D)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)-versal/$(f) \
-			$(BINARIES_DIR)/$(f)
-	)
-endef
-
-$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
