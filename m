Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5B2C3600B
	for <buildroot@archiver.kernel.org>; Thu, 27 Mar 2025 11:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 655F842EED;
	Thu, 27 Mar 2025 11:17:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O9Q43dhuOWzm; Thu, 27 Mar 2025 11:17:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0DC042EC6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0DC042EC6;
	Thu, 27 Mar 2025 11:17:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CFBC91B7
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 11:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD9F340190
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 11:17:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2sXNf4-D6JP1 for <buildroot@buildroot.org>;
 Thu, 27 Mar 2025 11:17:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2407::623;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 03FFD40919
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03FFD40919
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::623])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03FFD40919
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 11:17:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMdUu8+FUXcHikqaY/49N19qlW2BukBgUGG7OnkDym56X8mns+AkLusKz5LXa4ximhtvhclGD0+4hwA0apY+EqvOlPjZJyKBbb4eH+FUx3kkZ/sk98VR5BvesII71icCTLZES68TOdW6e4BHI8di60xCLYeJze5kgNDGOtOnD1CDkdkaooTzJEfF+kBTxK3+qOh2XLNJNOTWhg3VhHfc5P+dnTXlEhCpW2wC6hdxZ36NvqA2Hruuwm9b6yhkiAcYkm4tS0eVL5c3osxkEt9EvtpAppPe4j+3iUBE5j6h3z4CgeEJvTne3ymiTdOpV9Tq7geqSE11vn1UTiLuFlebhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZ88z0vrXsqdA5s9R5PC9F1DZ879XTLACSpKz5+4dpc=;
 b=GT4RolSUWUDRx0GwUa5qwbrkxGFWTiDYSb1bixbfqCXKT2B6Nj1Dvq/Cu5vaIDOS9ajApp6hf2TfyRWoKBwwWeHFNhMexSwbQBvGvOBBkhVrD+YLM4jU68grsbKsg3oV4IGYNnLfUUlqAX444DYRaEw5n2yc6/Aohf2/P8omH/+dtp5G0AqTbBxa8ja3khyoal+t9TFq7krw3gAk9fV3WuFkTz9C+852HE/ke0ojEczriFCdI2EQ+WYQgt++4Bt/ZN9qIaDne7ddj05nsX8NekYTO4e/fblZvP3qtPw3g2bzmGQwntCzfvLxs48ztKQuL0swwRMBQGo5Wr0Nlc3SjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SN7PR04CA0094.namprd04.prod.outlook.com (2603:10b6:806:122::9)
 by DS7PR12MB6360.namprd12.prod.outlook.com (2603:10b6:8:93::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 11:16:56 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:806:122:cafe::87) by SN7PR04CA0094.outlook.office365.com
 (2603:10b6:806:122::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.45 via Frontend Transport; Thu,
 27 Mar 2025 11:16:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 27 Mar 2025 11:16:55 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Mar
 2025 06:16:54 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Mar
 2025 06:16:53 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 27 Mar 2025 06:16:52 -0500
To: <buildroot@buildroot.org>
Date: Thu, 27 Mar 2025 11:16:45 +0000
Message-ID: <20250327111645.1430919-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250327111645.1430919-1-neal.frager@amd.com>
References: <20250327111645.1430919-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|DS7PR12MB6360:EE_
X-MS-Office365-Filtering-Correlation-Id: a244b8a9-ead4-4c69-3793-08dd6d20e1de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DG1LDzgR+jWXVpKJdCUEt6bgMJrXTsiz7tYMbWlgR7mgGBT9W3jCWClB/+6Z?=
 =?us-ascii?Q?3UFTq5fyoVIbz5mHKmmfRBE51sWsxtj7MLSZSzIgRrCRQZS1WqqKDZQakHTj?=
 =?us-ascii?Q?1xqxEaq4NVsCi00hQqlxTfqHqX4fG9EhpZLPAgXVQOsqXFD/fVcFFsQ3cQEJ?=
 =?us-ascii?Q?zUN2H1WgcVxe3liJ41GGenO/heeQUXjC32W9Ub7xGppPGIPB9jOZjb0zwCtR?=
 =?us-ascii?Q?i8c5PbGrqgiTFf4DvYqw4BRbDUwVfoHKebgBW5b1AgyUlvgrZn9UBAlkErUR?=
 =?us-ascii?Q?mMdqQO5Ys3WAdorhCmCdoSNotcYAsc3bUEmdy+mIJNuAolTMloWNz1WKQDHF?=
 =?us-ascii?Q?2ujsU54RQFi645tgTjH2EQ5n6sDxEHLdKfkjOGBfs5IR/a51xd6F09uQhMng?=
 =?us-ascii?Q?un4qBraI6kqFTwFO0x6Zhi2j/Nqh/R/peKnLAmGT8iJtQ4iXpZ/ef0JcG6Hu?=
 =?us-ascii?Q?SjQkjmHi13WfG+cn5iqOo0n7I3/B9LumLNgiaYVUhModjG025Us8yNraIuaD?=
 =?us-ascii?Q?WRGcwE9Fwyr+VcltDNwGh5FT/xWG63+OX15IRag6sQcuiWCfT4Ro2GvEavin?=
 =?us-ascii?Q?aEIauH8gdARl20Xdr7vOC/pRM2QGSvqT7lEDLKSenCoQ6NjyB+FqR7u2XUls?=
 =?us-ascii?Q?2rSNqhFOqrEva34pChXqy+7UZVk5frIgaxkRnFTp3xV1U4EbA2xKXRR23pFi?=
 =?us-ascii?Q?PfUd1RP48CmPq1A9hxzzZCgeBScdzHrQ1E0BpxVEHQw6UgymLQkwMQFUYGtf?=
 =?us-ascii?Q?sXFiOdFjWcnS841L9H/NiNJkuYxlYMQWcnPnivBCRm0G8kSwLYDYVvXDbZO7?=
 =?us-ascii?Q?rrhQznLMGol+W3hoofIUWAzqsCoPwoAz3qPIkBqGsuVFJZPWY9X+0rlgbsil?=
 =?us-ascii?Q?Vme3H7loenAPcdlAclrp3qafXxzlWlTtD7mPJ9/ljLTO8U/XuA3bBA/D/8w0?=
 =?us-ascii?Q?ywmMgJrK9tYY5mkbs55J6ZMk/xN1/tzdF17yxQS9DQtOPkto3h1HwuHU36Wn?=
 =?us-ascii?Q?QlJzRWszsPnJFVzRxW57FSwcLoLGtmUi2hvw1UzY67VkKtvT/1Ns3h/KHVsz?=
 =?us-ascii?Q?+BYoYRLXBJxFbQAMoaSG80PtP4x56e5kz9kGGRjZHTyyyaIjj+xcabMPhaZq?=
 =?us-ascii?Q?HeMjZ2PJnuivuYDmFJY476AESMuf70EVIxAwKWZ+nlF7tVE4QlHgVkgPgyOd?=
 =?us-ascii?Q?obDLHcHaSgKmNVL/Dlds5enx3IxMj2d4J9xiwtHG5O6Kfdcb1Z8G6JAw2saA?=
 =?us-ascii?Q?/xnTfKaZTjVxi8nGAdnfGnDebaiXPMuNKayYylQf/M9AOz6Wgog6IwtlQQce?=
 =?us-ascii?Q?2FUA59shH8XPW4rrahBLe1uTe7/bf/LJY8eoz1KDTQsuyG6EFR7z4fBAuMcb?=
 =?us-ascii?Q?aO99ypubl+Ewjr8yScfUfuQ80d8eQofVDoT1m3VaPXWVyypeNEqUDqg7wtiC?=
 =?us-ascii?Q?hBQAgk6XC7A0VaK7aL9jSqYgxOcuHF0+ceVW6s/W+9VAMXwvv6BO+zAsA5kG?=
 =?us-ascii?Q?LVg99fNEyzdYTAHzRjA5jPagS5R275aQzCpn?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 11:16:55.1671 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a244b8a9-ead4-4c69-3793-08dd6d20e1de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6360
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZ88z0vrXsqdA5s9R5PC9F1DZ879XTLACSpKz5+4dpc=;
 b=sdotBhHSHDPKYymUKJl0ltuD621ec8m8ca031P9M8wgW2lFuRuKX15OTrPnIzcDfsdx40057UaCWqMoWNZueUxk7M/azGNT0XDQtCE4NW9TbDNHCCzDlQWl4TypkJa+jopuWo8YdcoHvfXKyWa7Xo+idnUqVV+1a2GBWFyJj0II=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=sdotBhHS
Subject: [Buildroot] [PATCH v4 3/3] configs/versal|zynqmp: migrate to
 microblazeel-buildroot-elf tuple
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

This patch migrates all the versal and zynqmp defconfigs to use the
microblazeel-buildroot-elf arch tuple for the toolchain-bare-metal-buildroot
toolchain.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V3:
- new to series with V3
V3->V4:
- no changes
---
 configs/versal_vck190_defconfig     | 2 +-
 configs/versal_vek280_defconfig     | 2 +-
 configs/versal_vpk180_defconfig     | 2 +-
 configs/zynqmp_kria_kd240_defconfig | 2 +-
 configs/zynqmp_kria_kr260_defconfig | 2 +-
 configs/zynqmp_kria_kv260_defconfig | 2 +-
 configs/zynqmp_zcu102_defconfig     | 2 +-
 configs/zynqmp_zcu104_defconfig     | 2 +-
 configs/zynqmp_zcu106_defconfig     | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 2f40c210a8..f1b4e15bb5 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -2,7 +2,7 @@ BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index af8bed884f..0b45bad945 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -2,7 +2,7 @@ BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/versal/vek280/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index afa606ec8c..acad9516ce 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -2,7 +2,7 @@ BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 261b73d6cf..69571a53bd 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/zynqmp/kria/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index 2cf2b98aa5..b7b9691fc7 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/zynqmp/kria/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index ef6a23f2a2..78d4a882c5 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/zynqmp/kria/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 762a54d968..5010aee2dc 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index 92e0d41736..7352148603 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 51287fdffb..b8ec4c983e 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
