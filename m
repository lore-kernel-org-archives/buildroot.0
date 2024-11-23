Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556F0E6ADF4
	for <buildroot@archiver.kernel.org>; Sat, 23 Nov 2024 11:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 159B442E22;
	Sat, 23 Nov 2024 11:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fsb-xq5iJECQ; Sat, 23 Nov 2024 11:12:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 779C742D5F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 779C742D5F;
	Sat, 23 Nov 2024 11:12:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FD30E11
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 11:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7341940A94
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 11:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Xj0kHgbC6l9 for <buildroot@buildroot.org>;
 Sat, 23 Nov 2024 11:12:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::627;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 50630409D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50630409D6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::627])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 50630409D6
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 11:12:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjutEuqxkkL1ViI0WCFwcfQT/ePP0lxc312xjFhd2TLGC9mcfSFO0Mbcf6wiJbNsJKtMsU9d6z8biOxvnMWRTPJdOpQYLdZxzd3wr247jE+GloPatRWc1ay7RJIeHCpAo+kY9FLNJejz3V2Oq3YgL5o2OWZ5BO5YAZITMG/I6LPY5qKzvTUOiqghHOBhd92QxwEdsfo9Fq12vPQa50zySw9D+RLMwjEfbNSTuVG5sfL7Gf+diUFtDO2dVHRJ9X4rccUABklzZ++oDfl6noXlNG/zL6eL0i9MUHWw3YuQS/hUMS7bt3pu9VTUkKUwiw+ZqVj+ypggfDRse9M9MncL5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwqyWe6DRB40lVJtrkv9yNjJ/OTxbewp+0UkqBFhhvQ=;
 b=PLAVnx+0s1PLWXLm0Oqx2NUsEAxrOcLfs5RJlhviF2K3SaUySk0QbIS4Yp2GJUM1wlrL6PodknV9aHhezyVBnJymAstb6rqy1Zqak/RS5cQV9OB8Fj3McJ+tAgzitTXSFxALdYqhzXyrJpTcFxCxj1ne6MxYwX6pUzpBimGkOOrD1ckOEiougrehLUJwT1hKMpitQwfJgKG0/l1AKmpr+zSTitce91hHfZLEfHzvjasYyR60Rt/epVBFYeGauV9nO38WG2CCmldn3GYaNib+ikdM6UssMFTYwIYVWjbropCKBrvuk65qec50YVbblisTXzfsBIpRyNut6eqWzDV46Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0220.namprd03.prod.outlook.com (2603:10b6:a03:39f::15)
 by SN7PR12MB8147.namprd12.prod.outlook.com (2603:10b6:806:32e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.17; Sat, 23 Nov
 2024 11:12:14 +0000
Received: from MWH0EPF000971E4.namprd02.prod.outlook.com
 (2603:10b6:a03:39f:cafe::14) by SJ0PR03CA0220.outlook.office365.com
 (2603:10b6:a03:39f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.16 via Frontend
 Transport; Sat, 23 Nov 2024 11:12:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.12) by
 MWH0EPF000971E4.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8182.16 via Frontend Transport; Sat, 23 Nov 2024 11:12:12 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 23 Nov
 2024 05:12:03 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 23 Nov
 2024 05:12:03 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 23 Nov 2024 05:12:02 -0600
To: <buildroot@buildroot.org>
Date: Sat, 23 Nov 2024 11:11:47 +0000
Message-ID: <20241123111150.2124027-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241123111150.2124027-1-neal.frager@amd.com>
References: <20241123111150.2124027-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E4:EE_|SN7PR12MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: d28fec29-3e57-4326-94c2-08dd0bafae53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PaXxYu/ACbdbqCRtsnIErs93lP+PcTidaE4Bdr2kVxXGmkr28VZ48BpVGsjB?=
 =?us-ascii?Q?0/ND9+/lPUsbMA0sHpzhzy8cHx8aaaDta4POz2ZAsja6uN/cGeS2/lFVb0gk?=
 =?us-ascii?Q?FhIACE57lJAahF1NSLvbNHlsOGFTYsW3ssViU8qqCuskDcpJRUFdkEIbdEVX?=
 =?us-ascii?Q?VYX97TZ7RRvyWItGwxOGpNGt/Oz7dfFOWawuhh1EfSqsuA1wQYi55DVoAEXE?=
 =?us-ascii?Q?FW5GPJJsnGQXLgIOfxUE+ydWEsazdTM2QsglB1Hf0oBykQcYj0ozah6498bu?=
 =?us-ascii?Q?evHCZPcfH4CGUDx1WwWd02bB/jawLFe+mBPOqdLbxW4uJlPAVOVepqFasnTq?=
 =?us-ascii?Q?SYMYplvUCi/25m2VA5GTPm6lC+yIjpXvIAc1KNztNPQ2dzimshWxXjM4ijwH?=
 =?us-ascii?Q?LgPE2T6GOodsodxTWwwLqPefORf30iMUAAJpVJf4DbjXEI74xMvQ3ecbzn89?=
 =?us-ascii?Q?Kjy1rgPEyB6Q2GizYJxLF8vn8KRuAeyvZupg3OH95vr95rUkeIVilYvpBs4D?=
 =?us-ascii?Q?Z5Ucqfs1ykYY9tJ5U1IEWJDXynBkSxgsOs4nERREwJJN5pWQnsg4eYIvy6Cz?=
 =?us-ascii?Q?3T1YX2+7NCGF5LkhTvKO7j2aM4Aj1SUvDopvQQec2ty3qHrmANSOFz6xxFtU?=
 =?us-ascii?Q?WKTpHHnk954JzhIQPhu2I9hGhX/0ULh7gEp37sPJRuhxXGmS/4Nr7xaXU4ry?=
 =?us-ascii?Q?IrIWEZ6sWX5M77uRUz8ralckUPGzRY+0Q+qJRW5sM3ThSw85Bko9ROlCUGGf?=
 =?us-ascii?Q?xH0NA7nikpMEBQ3+cgJ1EDDJ5cro1p+Ucd+ihgMRIZ8M9HLxl4qujOkvxfvm?=
 =?us-ascii?Q?ORI5f+N+THwpW9w2oBYPkHkaTlwOqL1obBd5d3T9umK5SZUzJQSa+NLm1Kzb?=
 =?us-ascii?Q?grOESubLe59OqJ5Cjwy4pz8vV3WKhRc48MDrHAhBUvzUfiZXgR7FWuaIf04E?=
 =?us-ascii?Q?j0Ip7zji0Ff9FgqMsbXpWu0fxoF1P4XXaVGEyEjeKAen15Ly6zG/63evYuRi?=
 =?us-ascii?Q?IIOcJeDimqQe78+BGKMbFTI3pkeUlzsuAChqYPx5QBJdE40WycVoZxEe7kwz?=
 =?us-ascii?Q?RSkbgLqrEfHDPVuJ+cGUtDWDJEVurK78UEoxiTx/O5/Ievh/eOAKUh9ap9xX?=
 =?us-ascii?Q?YbhKtOBwX2GDzrJ0AoHOPbbknbgfV8uYvM3FNGNJlDCo3FLRxCut1zzagcgH?=
 =?us-ascii?Q?dWQnktzYEDqx9rsH7d2MoW5diyxrncTphrP1xvJ5UMEh3YoXzNiaT3WDE0SL?=
 =?us-ascii?Q?Qb8GarDDwlSmHG1JG0ILy4swx+1jaJYd9qUtg7m6eBfgi60lUf3wbWTjreSl?=
 =?us-ascii?Q?c05ZRL3oCT2ehnqLHnUjKLPa7hUBquH2nDsLyBM1OKcChZVptCx/KariwVM/?=
 =?us-ascii?Q?LQkt2uLKFuzqxIAUnH8gKXOmklgRoqWh5h8xMYsIixpUCWLhBfDVafJ1cGHn?=
 =?us-ascii?Q?lr24A83FlSaCEGx4oWa/RSAUGV/zeLA5X+bpdJGxskoXfCIfHKVn9g=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.12; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:atlvpn-bp.amd.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2024 11:12:12.6811 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d28fec29-3e57-4326-94c2-08dd0bafae53
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.12];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8147
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwqyWe6DRB40lVJtrkv9yNjJ/OTxbewp+0UkqBFhhvQ=;
 b=Xnxt2K+22kJHiNEWqGLPlmkQVPtirtyY24ts9PmBH/jq3GK74fweOCaFa7J8VI49TQuBrorh2pHeRjkxL7F+c1dUGveyN/ko2+KOGfx5//r/nP/N2VBjiPRemdgYsjS7mTUVuSt8BeydqOluaFYqOrmcvdp+jmEHUPUZgpwdjqI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Xnxt2K+2
Subject: [Buildroot] [PATCH v1 3/6] configs/zynqmp_zcu104_defconfig: bump to
 xilinx-v2024.2
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
From: Neal Frager via buildroot <buildroot@buildroot.org>
Reply-To: Neal Frager <neal.frager@amd.com>
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 romain.naour@smile.fr, michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynqmp_zcu104_defconfig to xilinx-v2024.2 which includes
the following updates:

- ATF v2.10
- Linux v6.6.40
- PMUFW xilinx-v2024.2
- U-Boot v2024.01

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_zcu104_defconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index bcd6b16488..4856c9b958 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.2)/xlnx_rebase_v6.6_LTS_2024.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu104-revC"
@@ -17,13 +17,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.1)/xlnx_rebase_v2.10_2024.1.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.2)/xlnx_rebase_v2.10_2024.2.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.2)/xlnx_rebase_v2024.01_2024.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
@@ -38,6 +38,7 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu104/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu104-revC"
 BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.2"
 BR2_TARGET_XILINX_PREBUILT_BOARD="zcu104"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
