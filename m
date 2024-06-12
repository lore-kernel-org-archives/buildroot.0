Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5841DC27C53
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 07:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0705E822E2;
	Wed, 12 Jun 2024 07:56:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KX-iJYVSzFpm; Wed, 12 Jun 2024 07:56:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AA7382342
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AA7382342;
	Wed, 12 Jun 2024 07:56:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF9D61BF3A1
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 07:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A91784025E
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 07:56:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uL1OnpNO6fqS for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 07:56:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f400:7ea9::622;
 helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2417C40259
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2417C40259
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::622])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2417C40259
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 07:56:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O51ukz4Hyd9EWmaxwwJigxO4Zb4pxYbYuadKG0Ad7Zs0CSFE2naqPUeveyGuXK5kA4biCMucvytP+4Mg7+jJ1fPrnWve++yUTIVyXHHiwh4WplV/EDKPZ3rN1Wyzp7vm0isCbkH4CpVMNCFrLj2YkuYUeEB1qskkd27S35ADaw8VFvHg4L9nBadPSSuJ9V5EEk1ppPiXn8l2FSUmGy/pFRkdZfttMY5LdJblHKafl9H3L4lVWThwRdMwX0nb+uVbgluoY1wdlMjzj+/M6woP/dxMRdEHn0u8Q0zSBn1wzFLCuBK4g6yeKbDMi45QWnwlYxoBKgAyR27MPXqbGnjK9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fB4hivD+JZT9y89BlwAuqQFM2YtBeEXrvSZaCvTPUkE=;
 b=DMAsyz0aiJoTdLKsVlPRj1d0MsUSRIiqEAj92xPzku+dUW4wvTxQ/TNabeCk7GtPE95xygCOWeQ5l1k5RZn+WcE8pi+lTfq7fEqXgTRU3Q/DdsBvTlgkUSTMJav988iwF/3PNX4Qv1uW6Xesci8Ww9HzB3RHI55+svCzfZbvdnMYLEgdieQQJMkPuZykdfOumq0ADGW9uoAqnf/2RH0XxpeGMm8PDc3PRHlWz4LzWdsZfuAEf66bxowiu1X1M+2O/6ZST6fdOGIa/m0DBnVpi0eJnvjYGC0dZLo5cdl+c+Sspqbec74QZZr8FebqcOwj8PNVhOhglW9X8I18HOBazQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DM6PR04CA0011.namprd04.prod.outlook.com (2603:10b6:5:334::16)
 by SJ0PR12MB8166.namprd12.prod.outlook.com (2603:10b6:a03:4e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 07:56:11 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:5:334:cafe::5f) by DM6PR04CA0011.outlook.office365.com
 (2603:10b6:5:334::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20 via Frontend
 Transport; Wed, 12 Jun 2024 07:56:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Wed, 12 Jun 2024 07:56:09 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Jun
 2024 02:56:08 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Jun
 2024 02:56:08 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 12 Jun 2024 02:56:06 -0500
To: <buildroot@buildroot.org>
Date: Wed, 12 Jun 2024 08:55:56 +0100
Message-ID: <20240612075559.436482-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240612075559.436482-1-neal.frager@amd.com>
References: <20240612075559.436482-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|SJ0PR12MB8166:EE_
X-MS-Office365-Filtering-Correlation-Id: ec92d26e-2355-44ca-7852-08dc8ab51f63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230032|376006|82310400018|1800799016|36860700005|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kErpEiBPzShxzLdl/yBsDpA7rLWcn/oxfRDgzkH8SPWlbjZse+HcBSXkf5Yx?=
 =?us-ascii?Q?GZ6OJb6CECyrdJrBTHWsrJHXyG30nv99qvv10z7dyIplFIiZI5vQmrjX/EFm?=
 =?us-ascii?Q?rWisRWKpeq+st7nvpDXHXsrvErRz2HebzRyYskNO6RSaYD9KvYq1sNS/w+Ch?=
 =?us-ascii?Q?cpAE970AQJSu1XJ+ccRLx3wQlq4P6MwbORFMU6wlAnEVhtrp7zEpg3mfwr01?=
 =?us-ascii?Q?NvRXjMeqq+KT2NdL3MKeIJN8uZqO7chjOrwXnOsBkUEMvAzb7Sc8oz0iWYvS?=
 =?us-ascii?Q?FeLj+OsEiTGY7xpaBVayZdlLheywBClCosaAetGFhVYGUjyFV75bAp9UITHK?=
 =?us-ascii?Q?JDBofwpuiHrm60laOS72GqtyFG1WbtkMjaMArK7WRTLc/SubuGygLA7lsJzI?=
 =?us-ascii?Q?o43zfkNu9/yyK10pnvqq4icWulQ8ddGg/Uo6je6OAhPWjqCkpKPtINHGXIGh?=
 =?us-ascii?Q?4cULc+KWU/LwFg3OprDfc2Cxgi+YFVV3vNo3T022Rrr1lDW2XUhbABcUS48Z?=
 =?us-ascii?Q?3UHx/yILieMUCZ4RCImNZOkOobV4gpp5AjkcZsukhX8HjMGNseocKVbzP2lw?=
 =?us-ascii?Q?B9tY6D2R8uMuEa7aXJxsGdCi2oIIMJQ3kAMZWD0+slp0Tm0ESSU0g2refbbg?=
 =?us-ascii?Q?ILy0EIfRCfKt/vkXNNL0tcUdzMHmxvnT3Cn3F5bXz3SZcWGclSxbvzpwdjMt?=
 =?us-ascii?Q?qsGXihxb1L46qALedcbuMf3MIyvVI+96aTR4Et/luopWeWLAArW/RGoYSY6Z?=
 =?us-ascii?Q?y7iCTFAfiQvCnIO6AAccwPPhI86s3RBSjxD3Qv5c1O9rk1oHIcCbqVp5Qdzw?=
 =?us-ascii?Q?JFouNumfdxFiMKg0eSIJt/JG/WDSeBGRGVRd+ZE11LE+O/FZHO6kNeu1/8ow?=
 =?us-ascii?Q?AhMvhvpFinvGOTJDbl9yj5bzVKYSidYgk9uDqnDMHPbWZ1RKk/SkNfuha0Ii?=
 =?us-ascii?Q?RlIvmt9V6+l9H2b8Hrerkoyky7kpm3GThR47QVL4yjsnZsyYBarV/ZSGtjHh?=
 =?us-ascii?Q?Q1kZvlJcz4gxsASJQQ1uGFdIE+yDsAmoY16S1cEkYILxL4vqT6WqdYfBw43l?=
 =?us-ascii?Q?1XRZhJ7OQaY+KD4evAKmaDoFNyEDkIWiOdRyhlOGj4toSJxlVccB5CLVLOJW?=
 =?us-ascii?Q?OvDrngAchzPtr81QZsCn7lxLSnCAhvia8R3Opbl9jm1302daGbbY7WUuobef?=
 =?us-ascii?Q?bzEbd6LPtFKgup8FjqpvShHST5UhwYMacl36mExTTb2MfZy5xci5GhuGmdu+?=
 =?us-ascii?Q?mvAjrhjG+6jvO4oUtacjxZbjr0L56KDgwPpc0yigSWhjccwoG2svgkJxzDWk?=
 =?us-ascii?Q?FDUT8y+pDMKwczRwzrjwvotvhNEkoIn3a4MnUhHZt47jYT7KYs9BD1rwz0T9?=
 =?us-ascii?Q?8sbHMjreZ4kTN/zc50W399nNSUhsoMuX1ZCVy/2Mzs4p7dgC7w=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230032)(376006)(82310400018)(1800799016)(36860700005)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 07:56:09.7437 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec92d26e-2355-44ca-7852-08dc8ab51f63
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8166
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fB4hivD+JZT9y89BlwAuqQFM2YtBeEXrvSZaCvTPUkE=;
 b=HDl9XzHN6MpDILcsqmw5RnrUpfDNOQms0Bcbh9Sh3nMPGVWcyNmU4oQeKp6wBGhZWbAprg9COczrg2DQ/h5MHksCF56JRkCc+bKYc1hB0nyXaV0FPbqIm43ZV4vYN90XPNg8pHhMC92aJIgmo2klMmiqhs/4GgXvn3NwMyg6Alw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=HDl9XzHN
Subject: [Buildroot] [PATCH v1 3/5] configs/zynqmp_*: migrate to
 xilinx-prebuilt
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

Migrate zynqmp defconfigs to xilinx-prebuilt.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 .checkpackageignore                 | 5 -----
 configs/zynqmp_kria_kr260_defconfig | 8 +++++++-
 configs/zynqmp_kria_kv260_defconfig | 8 +++++++-
 configs/zynqmp_zcu102_defconfig     | 8 +++++++-
 configs/zynqmp_zcu104_defconfig     | 8 +++++++-
 configs/zynqmp_zcu106_defconfig     | 8 +++++++-
 6 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index eea412d01d..6d0011a299 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -362,11 +362,6 @@ configs/visionfive_defconfig lib_defconfig.ForceCheckHash
 configs/wandboard_defconfig lib_defconfig.ForceCheckHash
 configs/warp7_defconfig lib_defconfig.ForceCheckHash
 configs/zynqmp_kria_kd240_defconfig lib_defconfig.ForceCheckHash
-configs/zynqmp_kria_kr260_defconfig lib_defconfig.ForceCheckHash
-configs/zynqmp_kria_kv260_defconfig lib_defconfig.ForceCheckHash
-configs/zynqmp_zcu102_defconfig lib_defconfig.ForceCheckHash
-configs/zynqmp_zcu104_defconfig lib_defconfig.ForceCheckHash
-configs/zynqmp_zcu106_defconfig lib_defconfig.ForceCheckHash
 linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch lib_patch.Upstream
 package/18xx-ti-utils/0001-plt.h-fix-build-with-gcc-10.patch lib_patch.Upstream
 package/4th/0001-avoid-regen-during-install.patch lib_patch.Upstream
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index 3bf269ab6b..b7b5b4d432 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -31,10 +31,16 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2024.1/kr260-kria/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kr260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
+BR2_TARGET_XILINX_PREBUILT_BOARD="kr260"
+BR2_TARGET_XILINX_PREBUILT_KRIA=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 7b402e032c..a16da66e38 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -31,10 +31,16 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2024.1/kv260-kria/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kv260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
+BR2_TARGET_XILINX_PREBUILT_BOARD="kv260"
+BR2_TARGET_XILINX_PREBUILT_KRIA=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index f40002f6d9..faee93b1c6 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -30,10 +30,16 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2024.1/zcu102-zynqmp/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu102/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
+BR2_TARGET_XILINX_PREBUILT_BOARD="zcu102"
+BR2_TARGET_XILINX_PREBUILT_ZYNQMP=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index ef9c9bad49..466527695b 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -30,10 +30,16 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2024.1/zcu104-zynqmp/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu104/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
+BR2_TARGET_XILINX_PREBUILT_BOARD="zcu104"
+BR2_TARGET_XILINX_PREBUILT_ZYNQMP=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 07c595436f..686b7f9f94 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -30,10 +30,16 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2024.1/zcu106-zynqmp/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
+BR2_TARGET_XILINX_PREBUILT_BOARD="zcu106"
+BR2_TARGET_XILINX_PREBUILT_ZYNQMP=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
