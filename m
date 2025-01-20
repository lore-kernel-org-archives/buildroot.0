Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB508C02181
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 11:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB08782375;
	Mon, 20 Jan 2025 11:34:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id we73DiankMuq; Mon, 20 Jan 2025 11:34:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E90082144
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E90082144;
	Mon, 20 Jan 2025 11:34:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 42F9569
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 11:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2255881E34
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 11:34:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zujYzhTxUWc5 for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 11:34:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::627;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4B36A82144
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B36A82144
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::627])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B36A82144
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 11:34:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=imhSfvVQGgyEFYA68AKYT7eRwdfk9joaxvJSNDvCA3VDllqyIL3UNdcUqSlNvMY79wIPeaCn5Zum+ImKgxasbxql56S9+Xif/Qnk5WGudg+/IP6mNmkf9sgXIbV98PqSkIFp03e5a4BejEetD10d+y61t7H6omCJ/h5O7z1B1QKRSGKd9YlV5SGaYtVh+RBLe+BE9q6CtkMZYfu81TpPkdXqfOjLtezveedo/ZaqoW4lucLAPj/1065tVhfSGTAoUAJUZgNSR4Md/b2ZxFCa9ZywsmDcB6MYNBrPryPPoWqp+Bj4Iojq2gLRsAqf4VlVaKSEeDDPSm2Ws6lCTsfbKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3K5vVNH3NSBqo9XN6KVrZsgZT9bLzhF8XcmTXgslmgo=;
 b=h++JqUkw3XkY9tQaPwj7LCvHMXWbw+9zDgXPzDrLr9Hb41eFdH0FxeBN12UiiJe/CmDHkeE8y6fIKibm4RMGzonWZb1O1LugGm+KnGqsWSasEv3L9pHt36T8f3LFzaYvH8ibqfpZO7bbY53/v53EmoAzbg6ybeifc8lQinUdNvV/1i3ZSzKmH9BTd0eYz/z2j4R4p3tocDhGBtI1LlMW/zW4WIAXxErvVQLpImB+Dc6uiay+h9vqqIzKSG73/HzYfV+SpspXqfpFokMSZodGUN6jDFQFtzAv0tya/Q0en6A3q+RQ/V2D5QbEMOhiWEuptWs6+q3KYGo/dTAqJX+nng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::9)
 by LV2PR12MB5846.namprd12.prod.outlook.com (2603:10b6:408:175::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 11:34:19 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:a03:41b:cafe::f5) by SJ0P220CA0004.outlook.office365.com
 (2603:10b6:a03:41b::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Mon,
 20 Jan 2025 11:34:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.0 via Frontend Transport; Mon, 20 Jan 2025 11:34:17 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 20 Jan
 2025 05:34:16 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 20 Jan
 2025 05:34:15 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 20 Jan 2025 05:34:14 -0600
To: <buildroot@buildroot.org>
Date: Mon, 20 Jan 2025 11:34:05 +0000
Message-ID: <20250120113405.3938838-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250120113405.3938838-1-neal.frager@amd.com>
References: <20250120113405.3938838-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|LV2PR12MB5846:EE_
X-MS-Office365-Filtering-Correlation-Id: 12b93a61-21dc-4a2a-b654-08dd39466038
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?X2VtFO7BHDC9qSAP/IxwHP8HU+2q+OM/UiRMIL0Q2RaMQE8MvGug1nDMjWdR?=
 =?us-ascii?Q?CSdiNtPdMaNcnoskFmFgXDWczxid2BGxbyaAjSzfIG7cslk8veCEgNMrFq+u?=
 =?us-ascii?Q?mKJkAL7x1ID0X0AxSW5Oupi0ic+8I4gjMflbFlXVcyFGsR3+1dcEsh9eY9a9?=
 =?us-ascii?Q?PznMUMZRGyj8x0eYaEyyL2SoBPEAehuAL7SjxXEnsQAPk7vPXWiqy4Nzz6vk?=
 =?us-ascii?Q?p+sLnZavgQ5vhHCFIZo9B3X3l1yaijucKN/KNBVJ76U04L6Vp0SDgRJML7K7?=
 =?us-ascii?Q?cOMoKbibKZOEqJVJ/A+Imf9BxaSIprKSSy4pkBGblNU0kgDeNtUnRd/vRK6/?=
 =?us-ascii?Q?JF1k4PeQSS/VhbG55m84zjytfhTGrA2Kid46Fb3Nnin5vL7P1+WcuG1FCa/n?=
 =?us-ascii?Q?aSZWj+G2SPWtTacbuSqBIoEhHTccb8+xobcdZo2mDbhijGjs+Uldhs+YCCQI?=
 =?us-ascii?Q?cplFgaAAy9m6/L5htGjX8ote+/kV/pcLXl62/njskvlE8fCHji+C0H+vsqOf?=
 =?us-ascii?Q?bWeTedtMsUieA/6EOJA+IwzN3TkeAZVLxdCkdhsK4IN3VkjQE+c4KSBdkmZ2?=
 =?us-ascii?Q?vx+x+LtD0E5j5X2Huhb4ymZh5uIbZN1dvqUAmZ6Bjo/3UpRYDHcFaOJw1uO3?=
 =?us-ascii?Q?W1c/c1UvwVNtAwFLm4apQmy94ZvRb4fEbXtK5cg412ZU6vbTJ21oddnztJj1?=
 =?us-ascii?Q?UGfwv3/U0uAExJOxvQJlQNlWPfemLGOS4HE1UiYCu/TKHufkOJ/iNuvBMx+Y?=
 =?us-ascii?Q?gsEkibEZ4uTTaQyhEXBgENSrw1ki3l6Q52EjVHtjpbQkQVb8LiiSZPyWLxzo?=
 =?us-ascii?Q?DtEkvRLgFSTc9LQ16s0Ugw/u9sM3ZAGBx1sue2tktCakJQYKsy4UmjfLXCKB?=
 =?us-ascii?Q?jlsPzYt1homNSbAN0yAU4PZAp0PGs+tXW3cYvZVq7nnadPMMWjbhJz5W3nLn?=
 =?us-ascii?Q?ix61r4XIebjHebeLVQulS/wF636RO+NbFR9iRAjHNwAuNlb7ncTroUi5uVFH?=
 =?us-ascii?Q?IPiwmWe9ppKvpGkb7x4ysDc92od+kZP+9JLfWOl4zhr0MGSIa5kvdvPC+yYG?=
 =?us-ascii?Q?lPZETDyaLvAZI8mnP1DEc2vkrby5uof6uPnI3YGUI4pXuRtQK8IlyizR7Y0q?=
 =?us-ascii?Q?1eD4clM4fwrSmwz2XaM0Qu/K6xePqBdGg/71eGM1sN4ZAF1nT32FRyGNXb1p?=
 =?us-ascii?Q?wIeK9xaZAJaiRKjlpaEb8Dp+oRoHpFqA5yuzMcUNUF+KCNFoiaI7fHTUJ4Ul?=
 =?us-ascii?Q?L41Y493dSUygvtim7Lo/5ZJjni8zMYba1BMARqHx4nblQpERizf4EO4Eyd0k?=
 =?us-ascii?Q?gYfuXtX6nTGelJlbyJ705nA64NN/D+vWNM+ZkwhxTkU2RxiXYHieTKQ35IkA?=
 =?us-ascii?Q?x3CbXXr/FXYK0qPts8sjU89x9ARGYCiQn6Q7BN6Czitw8QORdwg3am91LCiS?=
 =?us-ascii?Q?ffFQobjdpeNJkVj3xRqNAqcFYH8Kb49fNEOJJLivV5C0Tf9zhEB75fxgcaMe?=
 =?us-ascii?Q?pVuMuyW2kS3paP342D6QkIhdgJTgpZtUJC2q?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 11:34:17.9739 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12b93a61-21dc-4a2a-b654-08dd39466038
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5846
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3K5vVNH3NSBqo9XN6KVrZsgZT9bLzhF8XcmTXgslmgo=;
 b=Prf1a79Xuq7B1jPNhfch6jaXE/q8Bgjt89sAFN8HVQbPcVWcGHDOmhEt1ZYOKYqEJtYmBA+FgBGXfdH31PorQu8dnb2MO8mbeZZ/yro5n6Pi83iowdmWjzDBKL0gSkQC9y6CfA9WzOAEqUVNOZoAa13d1OehD+c190qinOYhbec=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Prf1a79X
Subject: [Buildroot] [PATCH v2 4/4] configs/versal_*: migrate to
 xilinx-embeddedsw
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate versal defconfigs to xilinx-embeddedsw package for building
versal plm and versal psmfw applications.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- no changes
---
 configs/versal_vck190_defconfig | 5 +++++
 configs/versal_vek280_defconfig | 5 +++++
 configs/versal_vpk180_defconfig | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index c046d53010..100fa1fa35 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -1,6 +1,8 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
@@ -34,6 +36,9 @@ BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
 BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vck190-rev1.1"
+BR2_TARGET_XILINX_EMBEDDEDSW=y
+BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
+BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
 BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.2"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index 0ca9d30b2d..38bb7c0e75 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -1,6 +1,8 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
 BR2_GLOBAL_PATCH_DIR="board/versal/vek280/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
@@ -34,6 +36,9 @@ BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
 BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vek280-revB"
+BR2_TARGET_XILINX_EMBEDDEDSW=y
+BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
+BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
 BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.2"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index 1367760325..e70b3aa0f8 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -1,6 +1,8 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
@@ -34,6 +36,9 @@ BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
 BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vpk180-revA"
+BR2_TARGET_XILINX_EMBEDDEDSW=y
+BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
+BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
 BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.2"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
