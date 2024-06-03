Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E575C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 11:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAC2941369;
	Mon,  3 Jun 2024 11:52:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KjWHPTirspUz; Mon,  3 Jun 2024 11:52:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53252414D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53252414D5;
	Mon,  3 Jun 2024 11:52:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B44561BF383
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 11:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6BD040AF7
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 11:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a1OovhsY0tiz for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 11:52:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::601;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 08F2B40AB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08F2B40AB8
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::601])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08F2B40AB8
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 11:52:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGRIef7d3btcKSNqxOau56d3vMnlHSTTXKi3cepmljHjcYFje2c27w+N0YSZuy3X4+TjFZ1VdlwkU/fWhDRxzeh1yOjI2AIjnwjrjmCgY3p8IGbjLSnx3ibz2HNcSSPoYLsjwHw/1caFVI1RsnilH5vgBrkGVJoJFARmNXLdb+4MT0u5h3ehnbFtCMpBy1heTeyoDt+WwWTXTeNeDEcvpFAX28BRS0oIXfRZvhu4N8yFmeQ1L85CqMpw6laiscoAJ7b4YvbV/aW9+4u7++pO4BtahlztOmMUpoAfWXXPLYNG9FzTcvVbCRaNo0vyKI30R/T64mcFe3QNdg3A/2GB8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVUZD4XgPlJ/affU7ufqU8f/RqbZ8VoEChGfWnujOCs=;
 b=obblWpF72/GlBjidXB/rEXnAEYb244EQNANh30/mi7TgERa1NgAe92UZORMm+CK9hMdPWwSFiAVVfoMZO3wFRfHSB0DW2OlcGTo3htFNfgvxoOUsEcfcsj53/McIt3xBiJ8T6QYzwJpAQp5f7ArIyg4FbSykgHzymhAvbCIA9QvSQNpZ2N+zqej68u874jhImBuU7TqXFbU1/QS6ScYb3Yc1cNqGUf4F8mBWZ18wYDeCbcAo4/MoqLE6Fesrjtu0VdSfuageReCbyv1vFlQX1vQhJ763Ib+5fgJ0T24TrWA6FrUwOKmO8t0+SSnLGviWXalkmgrPmuZ1L7uW1+PaYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BLAPR03CA0031.namprd03.prod.outlook.com (2603:10b6:208:32d::6)
 by BY5PR12MB4100.namprd12.prod.outlook.com (2603:10b6:a03:200::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Mon, 3 Jun
 2024 11:52:19 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:32d:cafe::9b) by BLAPR03CA0031.outlook.office365.com
 (2603:10b6:208:32d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.30 via Frontend
 Transport; Mon, 3 Jun 2024 11:52:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Mon, 3 Jun 2024 11:52:18 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 3 Jun
 2024 06:52:17 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 3 Jun
 2024 06:52:17 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 3 Jun 2024 06:52:16 -0500
To: <buildroot@buildroot.org>
Date: Mon, 3 Jun 2024 12:52:11 +0100
Message-ID: <20240603115212.184529-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240603115212.184529-1-neal.frager@amd.com>
References: <20240603115212.184529-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|BY5PR12MB4100:EE_
X-MS-Office365-Filtering-Correlation-Id: 87629a59-49e5-4b89-9155-08dc83c39e99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|376005|36860700004|1800799015; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GfN4hhn0GCxFuYGR+llf+0M7kkAPtDLZsgMIJp2n8agGZF9fwL+0u6/29O+T?=
 =?us-ascii?Q?iRlyEGcVDGGjvxLgYqKhpiJmFul14VZx3GTS/vSKLiL6WYZhuPtXQMi8wyUG?=
 =?us-ascii?Q?1eIkkqvVcLseJP55e7V/OrLF4WADKmZSlwm0+Zdwk7w/GO5oFINJRuYstvRI?=
 =?us-ascii?Q?u+31ExTZZy5FjCmq2prw9GwD1rXDiKsb7Qe394MuFsLs2w/GKylYfdjrKklo?=
 =?us-ascii?Q?xtjnZAdP3SqC1kOMqfcMI5r4rKPq+y9k8pdz1ebdPNbnx2fRmEcCvmQbxlUW?=
 =?us-ascii?Q?uId5xHKzg+reMHYOnR1umJG+P0URQbBMYIOxCxDe6VESkNx1hVx2qOBhK6+T?=
 =?us-ascii?Q?2ganbEBYCNxdSMRORxqLA3GdkNwUEOLEKQJEDg7ObbXCodtv6pidmMHs6mgn?=
 =?us-ascii?Q?AbT2mM8vgjdxk+nz0noGGsOvoht/xxBclf6QVvMgh8Ki/zwo0zcKg3wHtXGe?=
 =?us-ascii?Q?GW1/v7F4DlmNRjq8HaZt8KN46w8TXF9QsgeHiSBm6ToLE+ejAPKWIa99hDRO?=
 =?us-ascii?Q?F4cRjypG3kPfZNXWJF70tZ7CMabX2Z4Nsm2CgdMDv2DrCReZHj/j3m9i8h4c?=
 =?us-ascii?Q?Fy5pxtq+AmaQ6oHJZExapVUt53a2eETqQjjngH9Cf7NGwSBvZe4PkKRvWfn3?=
 =?us-ascii?Q?i2Q2YaTzUOjhjy6rXRzF8KEWKEONCS8j+XakbiLN0bUqCklhjbIOJcTslZRn?=
 =?us-ascii?Q?Z9UbKcW3wu2DaK1SgvI/VkEe2QvcFX1YoW5ZLHLhxcUqu46Zzj7L/8C/9owZ?=
 =?us-ascii?Q?2BWdq5kayOZVz04R0iCUTlAWAQ7f918ijijfV6pgusmXbrSV/5dy173y4vQf?=
 =?us-ascii?Q?fsEMKZp6IS3kc26QSEQJ9sFqIy9+OvpTRBIPJHKgUSXHMkhzKkQutxLbyTv7?=
 =?us-ascii?Q?PJbbKikkA7l6bp9XH5ByB4HOWAl3lfiYGywZ9cBCLTvY0IGG8l3PhxNBuVhP?=
 =?us-ascii?Q?v7rM7DE3L4Wtc1Aih+CQ52hSyQxwbVo0cmQxAEXu4+xY0XAhkcteIYuZcqCe?=
 =?us-ascii?Q?6fkujwIoYot1/HNVQygFoz73sfdsfiQ+NoG0yRAQ4nBbVmkIlY4tZWJDoWZK?=
 =?us-ascii?Q?72ZYD8l/MD3iaarH97QAEzpQQHEaVUOebaiLiVTxDICoP78SaCS/Onvb3aQm?=
 =?us-ascii?Q?jXeReW3w2ciW5Cb79FEjYlSY5j4cWjuGZT9Ly7cdc6NnU0o/YbUH9hKz4P6Q?=
 =?us-ascii?Q?s9oMiWDrkkTal3vg2I4qjUb9KYg7cHDGImjTaD44H4H4brgYEtt3/jVLjQQU?=
 =?us-ascii?Q?GIAyC8ebKyCW4nr25qHXuJRnnJQL3egskkWGvAHRunKK/EsDk4+Z+0fBIxKr?=
 =?us-ascii?Q?vnkBF43gUxtIgJgcg8hfUTSqf1k3vkL1flNjwABk4fYTOZO0+84RbgYoX65h?=
 =?us-ascii?Q?Izh/qGADdpFd6flC1XZP/RFva3ew?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400017)(376005)(36860700004)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 11:52:18.2024 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87629a59-49e5-4b89-9155-08dc83c39e99
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4100
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVUZD4XgPlJ/affU7ufqU8f/RqbZ8VoEChGfWnujOCs=;
 b=w706Jeh5tdSdYKOCEZDUoLugY53Z3wppzlv+MuYiyvq9pwm5wYbyMbvkNkUTkIlTuYquEGdDXvEOUccIdyz8NgppCTPfWxz1fDELD6Crl09V++8rr+LvUii1uIq2ElwDuPcUkKcua+rSex4yLL6bIZzdHX4CuvTyPxeC/9HRQKo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=w706Jeh5
Subject: [Buildroot] [PATCH v1 2/3] configs/zynqmp_zcu104_defconfig: bump to
 xilinx-v2024.1
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
 Neal Frager <neal.frager@amd.com>, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynqmp_zcu104_defconfig to xilinx-v2024.1 which includes
the following updates:

- Linux v6.6.10
- U-Boot v2024.01
- ATF v2.10
- PMUFW xilinx-v2024.1

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_zcu104_defconfig | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index 452f2343c8..ef9c9bad49 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -1,11 +1,11 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.2)/xlnx_rebase_v6.1_LTS_2023.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu104-revC"
@@ -15,13 +15,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.8_2023.2)/xlnx_rebase_v2.8_2023.2.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.1)/xlnx_rebase_v2.10_2024.1.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.2)/xlnx_rebase_v2023.01_2023.2.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu104-revC"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
@@ -30,11 +30,10 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.2/zcu104-zynqmp/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2024.1/zcu104-zynqmp/pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu104/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
