Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D031C27C4F
	for <buildroot@archiver.kernel.org>; Thu, 13 Jun 2024 06:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3F5360B68;
	Thu, 13 Jun 2024 06:15:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h98RdUVVY4Qb; Thu, 13 Jun 2024 06:15:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8783660B6B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8783660B6B;
	Thu, 13 Jun 2024 06:15:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 741901BF966
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 06:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6016D81E2D
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 06:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6GHi-fybmnuM for <buildroot@lists.busybox.net>;
 Thu, 13 Jun 2024 06:15:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::606;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 09A6D81E2C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09A6D81E2C
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::606])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09A6D81E2C
 for <buildroot@buildroot.org>; Thu, 13 Jun 2024 06:14:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nrvtKIOCiYh2AvMS2Zk0L9b+zMT3GY/c3ThqYmFrKdEyWSpsfAm9JCOM/N4embjAWUBIUTYyHX3sOcsnLUTe6uPOF17m43zvhyIe/lczc0BHS5A7L6Ez7wuYeGkrykYBRJCzFUCy/klZovYLJF6KJnq9pH4/68qlHmuedO6A0wqOWmtqua1Hxenv0a899DM7C7MrRTQa9hbTi0qBpec7rnPHz9pnD8wy7QAJg4zgYKjOzkA5jFtbWkJNVod0dtwsHkaibJgGN8uR6uJqGtP56uChhATDdM29p6qbEuIjZeWWPi2acuWcSxk3YE8C4gxLAPGTPL9hrktTD5cHPPoOUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKuEyuQfXEjAuSCZI8oRxvlqj/MiUw4rp+wv3ePmM0I=;
 b=COvJ/H0ji1RyVHt7W/sUvYBF0BveNoqS9HCvfSz3zI1Umc6tgR13tYjr/sjVGOwKU/xCLaJAGBmPqgu9WOjmRteGMHseT0A7PytFpHCTYINmjLssxnSCsYhXcbMqxe97lOSufiD3jUEY4FET3lu7jaGMTybbCwhc9ao4HPEiMNlFAx6zAPWa2YItsFABzMyBrYabcUI9+C/aqUQD1wuCX1VqIGWmn11NKxEZbm+JuFB2cN2ph9+PDGKHce4Kt25dtgEtoQlR/CjNdoMx+mz5xCst3RZjnllD+HvZNbvmlk8/e34G+YPrOcwWKvdkXoXVpJxXm3mNfO78TUXTdRZgBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DS7P222CA0005.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::17) by
 DS0PR12MB6415.namprd12.prod.outlook.com (2603:10b6:8:cc::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.20; Thu, 13 Jun 2024 06:14:56 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:8:2e:cafe::f0) by DS7P222CA0005.outlook.office365.com
 (2603:10b6:8:2e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.21 via Frontend
 Transport; Thu, 13 Jun 2024 06:14:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 06:14:56 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Jun
 2024 01:14:54 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 13 Jun 2024 01:14:53 -0500
To: <buildroot@buildroot.org>
Date: Thu, 13 Jun 2024 07:14:21 +0100
Message-ID: <20240613061423.1737631-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613061423.1737631-1-neal.frager@amd.com>
References: <20240613061423.1737631-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|DS0PR12MB6415:EE_
X-MS-Office365-Filtering-Correlation-Id: 71797e32-bc9f-423e-11ae-08dc8b7025df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230034|376008|1800799018|82310400020|36860700007|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GkUqO/wiIR7oQ68nS1skvgzAqoKWY1FEFkFCofSV7kopILIzTijtgRwdFz5G?=
 =?us-ascii?Q?FNFnXB0VKGR3d695letFHzRqGTzJEn/pXfo/AhfzahEKHjmnngP8v8wbwt1z?=
 =?us-ascii?Q?Ax8ajzrFLspAgXufFd0vh4Wg6nVuie2uo57tJrFxtJz/zWddCjsJ7izb4H2l?=
 =?us-ascii?Q?1s0Xfc+iQ/k26ypQnlFcuVDv8vUYS0wIYEQkz7UBYLWdWNUvrQHyvIPVc6i8?=
 =?us-ascii?Q?LS3kQv4Brx0KoQpV0QeA1HKFiE1JHyJq8bWEZVxWa4M7xPN7zov2Um6RhcVH?=
 =?us-ascii?Q?mKfRmGGK6eolq0WJRvOPUdua23Z1SXZGSItLd8oy1SQtSW5BRuQzL3yzoAgp?=
 =?us-ascii?Q?ta7kXjkZLojOHAwf6hXAZC3xg4KVviqUJwb3qTgrx6jrbNHitS0dRCbW8kRw?=
 =?us-ascii?Q?riPvIjliyL6VdsMlNfBH7FEBj1bbflVbDZ/aJMctPVqGuP0C5gFGTodb4ITe?=
 =?us-ascii?Q?PrHVbL8bfx12su+bK/CLcCR+lsKOgHU/pDVPS5FtQBS/CzIqLH5lSnCcK9wW?=
 =?us-ascii?Q?LWHowL94n4Wvzr4QV5UV+ohpMbF3MWANwjlqlvspelUf1w4quBY1SdAOhSnk?=
 =?us-ascii?Q?Iu/ohEwegH8vDWrbF1yxGMyaR2Aip57IvWEVRkQd88g8GmJD996a1YxBAlz7?=
 =?us-ascii?Q?tDW9jkcW6C5WafZB1X30b2wuauvA6eOFpQNstyFqWf8d4CaZQGayJ7mebjRt?=
 =?us-ascii?Q?YlMCoQjiIEv1uIGfYpxgiw5KUaOeTnpZQQK17cHTotKxQb1jh5iZtraDuqPP?=
 =?us-ascii?Q?SvSWpvzL3vb3hnFyBLWlb17V7l9AveLKldBUvlxOW3iiOqtuY5tYjL3PN39J?=
 =?us-ascii?Q?ywnPtPCVSZLlMFGgPi61Xr1qQN5GO/u362tmL2RXyC7CMFvddrUOyqyVeW1A?=
 =?us-ascii?Q?iAckUuEKVHzc3auU94aKkyfWqLNXWmAMR9E3p+cR3tFIjc3QLR0NFwezWunE?=
 =?us-ascii?Q?LszhxQYWNEm9g4wU8YNT28mYPUCHc2oFAsAE4wI4hoVjXsjHkEtD+TFd47H2?=
 =?us-ascii?Q?+NP4ir5eiMHQnTRQf7hJeWShMqAj7vXir3aJYhOnQDnf4u9FK5sQJXYD4k5q?=
 =?us-ascii?Q?rkXM/625SPONzXpCKDBnHQ7tIzO7G0yI6bIGV1t26Te4bxnFjQjXQpypvXNl?=
 =?us-ascii?Q?5pSmQKEVppTcfiD5+ZlPDzqAQRQFmOGtvvRbGgYzRyRiSE1n3rH3Mw7T1DrK?=
 =?us-ascii?Q?pZAEtTZ8Ei/kyU55Mk4NQnmmWcjacOWxcBBSne8UvvZ1e1N58xPbiS4wJ5JK?=
 =?us-ascii?Q?Egp3/q7+Z+f7NyJdT7od5gyPLm+Xe8ft8nglvqml4c639LjxfzplQL05/AZY?=
 =?us-ascii?Q?gCq+PeR+iLAVm9u39+9AqRR6Y4l1mLeeqeGlRZb/QxyRXW0xLePpnWSeRFJm?=
 =?us-ascii?Q?f7TWjfNcXfSVOU8wjF2kXt9iN9C1?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230034)(376008)(1800799018)(82310400020)(36860700007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 06:14:56.4773 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71797e32-bc9f-423e-11ae-08dc8b7025df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6415
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKuEyuQfXEjAuSCZI8oRxvlqj/MiUw4rp+wv3ePmM0I=;
 b=sJ2vfRItfeqyectLIugnT/wLaQt7pC9XrU2NYtVCp9aEuqRW2tTemCunrAYJCismXoHmL1Lp2CfVnhYEr78cBbVJyH/3AO3lqwUa8YrzUDSr3kuSrBvI+DdxJwObZh4zXl4Kmw9l4fAEtw42Qj7cdKbXjlk+zRHmAkBXeulVsdo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=sJ2vfRIt
Subject: [Buildroot] [PATCH v2 3/5] configs/zynqmp_*: migrate to
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
V1->V2:
- no changes
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
