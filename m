Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97ADE77198
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 11:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2174360A82;
	Tue,  7 Jan 2025 11:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QLPUoF-2jV_s; Tue,  7 Jan 2025 11:16:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CCDC608BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CCDC608BE;
	Tue,  7 Jan 2025 11:16:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F9E77AA
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 11:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 536DD404CA
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 11:16:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6dfR4ZIKsb1R for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 11:16:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::607;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 703EB4049B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 703EB4049B
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::607])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 703EB4049B
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 11:16:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sY6nKovgytdQ3wFngFZywL2FhewFUCz4A3BRug1i4bgwLj+l/iMZd8SsT1ArjxA8Jwh/P/oDZdeWA19zoXQTqfDxD9M9LTyQ1V9EzqvOeHRwwAEqqki/Wnub+jwGPMPORVWhrvv4Ltzv9E+GcOG9DxDsQcnJReNOVOV6TcNDO3nzRn9Xx3ixbL4jXuSToS3HQ+0N7DZoeet3gI5iOdejw2Ll+uxuaT1zk2Zge7C8uzky3lBRbUGGEPp8mgDZWijya6RbaosLYO7EJfA0gnJ495o7Rnj7DzpFjyVy8jVgqO+zrdvCc4pqGBAYFiWdfr4juXRnV+1uCVLb8QBt0Poong==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKHHCVHNEr5+4rxzH5bTVmo4FaE+QxM83lgJSb5hS+s=;
 b=teQ6KyrCnDQDiu7gWWSa9XXfgi4ptf1EAIaVNBYAnLfHRyN3eelHvX5xMuMiz9hZ8KWIcItKjI9he8rJ+HL8PfV8s/OelHDJmC6oV+a8bhrKvagcoEpP5bcc9SFqZxmKZWBtd0W2VJ1u0LegqouHwbHng84+zuC1oWShiqXZTK+p9S38OyJ0cRLRtFILLCjjvt4p5jWdS2EM3sc0AB3/7YveAuDUVyXUDy9vTxtLWCjERNTbXVRiC6TBQUzKl1mcx4flZe8fkwcSBGG+eK73hvViKxufsFdNFZqFCg8qbaHF1WCw3jTfsAYFUUMd0mjbKyPvebgh2btoc3uaa/mnRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN9PR03CA0468.namprd03.prod.outlook.com (2603:10b6:408:139::23)
 by CH3PR12MB8934.namprd12.prod.outlook.com (2603:10b6:610:17a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 11:15:53 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:408:139:cafe::3c) by BN9PR03CA0468.outlook.office365.com
 (2603:10b6:408:139::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.17 via Frontend Transport; Tue,
 7 Jan 2025 11:15:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Tue, 7 Jan 2025 11:15:52 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 05:15:52 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 05:15:51 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 7 Jan 2025 05:15:50 -0600
To: <buildroot@buildroot.org>
Date: Tue, 7 Jan 2025 11:15:40 +0000
Message-ID: <20250107111540.1548042-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250107111540.1548042-1-neal.frager@amd.com>
References: <20250107111540.1548042-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|CH3PR12MB8934:EE_
X-MS-Office365-Filtering-Correlation-Id: 18a89131-d73d-4c07-5b50-08dd2f0ca5f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cWWrEp7p/gSuPIJS45G+kl6avJ9+fRFzXTWtQ0h0pkhyGHy7ydiO9fnCGPhN?=
 =?us-ascii?Q?rhVeXIWgVpf9mooIUNVX+byG00GTPtl/i5a6wQwbcP9kAr+XjzdqwJhN/qsn?=
 =?us-ascii?Q?2SaxOpz1DPW6KGUtXBGu8U4qqzqn9vSKuaC1JZe/e6X7DtgFMHcrE30XxLzt?=
 =?us-ascii?Q?/Q82/RSnqzrph2SPxcZRf7dz8JinDBeWTEOjjrN4o4Uq0Y9aHMoKoo1ekZ64?=
 =?us-ascii?Q?JXnMu0Dmxh5Y4ZAUG9d98u+K4Hnw00lT/d4C0S+Ye2s0g198xYYckVRDYc3z?=
 =?us-ascii?Q?YvRzkWAIaiR1y2JsPGoOlYy7mIbHcT4I6PPhZU2mzKT9Zs4UVwTXxrBcETRb?=
 =?us-ascii?Q?Yx3UPL1nPQvi7oWVS8dTz8LqMYXdN8JAKjGP2/qyBLyY72DJ4nvr4VgyjjPj?=
 =?us-ascii?Q?OeAbSV8gVFiF9q1V1b8w668Gw15fAOFEXLTSsTfiWHaNqEklgNu+RCzWRC7z?=
 =?us-ascii?Q?a9TgT9F1r1hUtps+N8CdEmRfkd9aBE3RiQcfIbiJNsFho5ulRonG7Z/PBjtf?=
 =?us-ascii?Q?P2PqcehZMS4qc6PIaVINWSkhbqYSKHkoorxah0l1jGFS/xuNzPgZanBur+xJ?=
 =?us-ascii?Q?V3DvqbSrv6UQGHfSMN6+XBSlGaL+ORWVJvxd7O5E9xBOX4ACkp6VgnjO1Pte?=
 =?us-ascii?Q?rApo6qLN8vhVh2T91TkzUxu+gA/ccJSdmbVyTJzsoBKMw/oMbPXNyzLxwEEk?=
 =?us-ascii?Q?8xxpc4Z8gd14WWuC3LQjjwiZD0B3Raipdya7WKhQE3RtVJtDDCmekn3VSIug?=
 =?us-ascii?Q?hLPokO9SK/AHWZO9t2YmnBTlZ7s5jG7K28r4aCd2WNpV9bfCEuUK4qDP9Ca3?=
 =?us-ascii?Q?QkrsxPW+IHaUCOGBC1z4hhsObNwnHh4Kl7SsfAvWitNXDlH/AeFfMeaLSBk1?=
 =?us-ascii?Q?bl52o41KdIpIacA+hc1x8ceFz/5tN8EdFWuZ/v9AOgXzLXbXmPR2TKkPeZAv?=
 =?us-ascii?Q?LwCAtGo8YQEo2ahpLyiFKa58cOQ8tS9OJMz8mjobRxtW0u6xLhKWyBL/wbXw?=
 =?us-ascii?Q?O/Wc+nRN5pSyhRyKs+BXoGO8INX6h20HG4Svlq49pDjI7AVdeeScTc/S4Fi6?=
 =?us-ascii?Q?BfFV0ZHmfV0xTBlbHMaubT5YVEZ+iUd7VU6IGmNkwnHbK+jiQbJij0uVMucQ?=
 =?us-ascii?Q?WwZuL2zL6XGMiI6U1e4StfBkCrmPydWf9sg9w7huvxGXMcxPM8LtnaiDExfe?=
 =?us-ascii?Q?LjWFW9g7mbFVW/6Gh1ZmGVWEBZgCtmCxIbwA26h2GU89n2qMWHFVN5F12rwp?=
 =?us-ascii?Q?3St4mPIFXBu/M69W3aIB2DVH5TUTjSO7cJ6m6zKIHWfLE68dO+hVFOmX2vPn?=
 =?us-ascii?Q?MgayfwXVzZCYoOdyQHOZxwAh5+s8/bWeX6cAq58jwSDpsV4Xyb11iHVjpuoh?=
 =?us-ascii?Q?ib83i9Ls6Cw85P94p3M3AJXRnzq+0akNOYb+5XheRH/POAV05XaR+IN37FIO?=
 =?us-ascii?Q?dSPpNq2uFlxYb9RzrbbtLrpUCpKgSQtXObu6c+URJFvh9g2AX0GKJAnjdp4r?=
 =?us-ascii?Q?nevEuB5kFRDtNsEcnOYWsKsb7YH6kxR1Rng8?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 11:15:52.6130 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a89131-d73d-4c07-5b50-08dd2f0ca5f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8934
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKHHCVHNEr5+4rxzH5bTVmo4FaE+QxM83lgJSb5hS+s=;
 b=evOWA/EPlTShDhAosO7UB/A7hxVnIZVN1KQMSI2NNzjPx7Qlzju777e/dlCy1amxm0sb4xuoDIH/sndXtNL/0bdOAcz68r3ykDTPGexKK52GXw81kHoX6cO2tG2EO+qCFqAj1yjvx6nT5GPsl2YCW03t+mO3d0Q6kHHwp38n4xE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=evOWA/EP
Subject: [Buildroot] [PATCH v1 4/4] configs/versal_*: migrate to
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
 configs/versal_vck190_defconfig | 5 +++++
 configs/versal_vek280_defconfig | 5 +++++
 configs/versal_vpk180_defconfig | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 21fc202b30..8b0f5b7a46 100644
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
index e90408e6b4..5b68743da6 100644
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
index 604e5f69c7..ae0a1e1d7a 100644
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
