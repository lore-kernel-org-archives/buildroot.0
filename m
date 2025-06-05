Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3405CC5AE59
	for <buildroot@archiver.kernel.org>; Thu,  5 Jun 2025 05:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E168E40B06;
	Thu,  5 Jun 2025 05:48:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8mvpg1VYKnod; Thu,  5 Jun 2025 05:48:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1538A40B0A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1538A40B0A;
	Thu,  5 Jun 2025 05:48:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E4FF1DA
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 05:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBF2540B06
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 05:48:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xN4H9tvCTnr7 for <buildroot@buildroot.org>;
 Thu,  5 Jun 2025 05:48:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::615;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BE9E140B01
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE9E140B01
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::615])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE9E140B01
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 05:48:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uU/ewICzV5TndxXYwITkU+OuPYKrTp63CABsvPPSQxo6QQaRnjifX88zn2k/aQyH5iqMypE8/zu5tlWkrQ8E0eDtrm37a9RYlp4etK9miUNDh3leWrhEbJuxSqi2888232Xt3xRA240H4RIr2KCwOp53aKW1oKNqYOEkJZHrpCAjVaOlRQH7kTcw3aDKWAYN/FRQync+ui4VokX3mILv/lJhAwx9Uyc94CskPNnNDmaTPdbJrqIHtqcjSKFp0NhooP3a1jeil090gor00umLV2XGullY/pWiodCClg6UHIQUCodfa+gS3nEzVnuXuI6ese0+pFH5Yu7Uuea3bRHz3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4wQOUPQjTsCd+24iLFC5sqFpa8k1APw2ppz2RtULLk=;
 b=tf74Es8vg9EEjXCQ/WLQvy30hQsNcj50SiZNNUjMF9BL7wmiIN9Fw5aKKHCqzdjkoBaPyzih4hpNf38RpcXl9mraoHe+c7j6dCgUwRKM7J0H40sK7s/pO+NrDJfDRddcfsZ2/k4LnVAEFYvzKJNRsgGePNCBI2Ip+D+G/u/5R+Ym15Eiizvmhusp2FeZq06/upVZh9+FHC0xM+PGVLmDbdrpkY3lq19GXsQFwsZ/I293UoSq8zgEen6KijFkuvR20gD/yHcqg5dje/8HZVWAOgeYXZ5XR2iqjSIwX87oSW2GPoNEmbv0NBlzc37hl913Ta249j55uT+coGPo9cd1wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH5PR05CA0014.namprd05.prod.outlook.com (2603:10b6:610:1f0::24)
 by DM4PR12MB6207.namprd12.prod.outlook.com (2603:10b6:8:a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 05:48:36 +0000
Received: from DS3PEPF000099D6.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::d9) by CH5PR05CA0014.outlook.office365.com
 (2603:10b6:610:1f0::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.9 via Frontend Transport; Thu, 5
 Jun 2025 05:48:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D6.mail.protection.outlook.com (10.167.17.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Thu, 5 Jun 2025 05:48:36 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 00:48:33 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 5 Jun 2025 00:48:32 -0500
To: <buildroot@buildroot.org>
Date: Thu, 5 Jun 2025 06:48:25 +0100
Message-ID: <20250605054828.4181912-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250605054828.4181912-1-neal.frager@amd.com>
References: <20250605054828.4181912-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D6:EE_|DM4PR12MB6207:EE_
X-MS-Office365-Filtering-Correlation-Id: ec79cac3-2d06-4853-920b-08dda3f49d63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aznEi/z9fBKLtDmG/3/zdT25FLL56+iTDHQsa9YEhtasTiLaOn6bP/3VoVfk?=
 =?us-ascii?Q?hi0i0nEgoMo+1iAalK77dRLMP6Vv11MqbMJpOk5f6yMddCp05i+4Pz03LzEH?=
 =?us-ascii?Q?bXKZl86cfvRimlfG03N8bGoD47OjxWPHx0Zj/GkOqnY4lhJeDcmeXnITHD9V?=
 =?us-ascii?Q?79sfrd3FFYy3jy3ksRzuBxbPWPYIjpJy4OyBblN6GRRmlqs7Jj5F9R1b8re2?=
 =?us-ascii?Q?z1mP7WfJSK5+2Tpbf7c896aQwMeXZ37amTPtGaKiS5XTLYTnCfPihDqvQth+?=
 =?us-ascii?Q?l4vDVsI9TDqXqY9nJnTO3uhQxCPdBIbl94XRDqNYxY9/EDn2E206XkWdRKt8?=
 =?us-ascii?Q?bLehh3SrmyzQn2lAYLEWN2Mgp9ubBx0d5hKDJhHomXZWh007+TMfFBEI4/ZX?=
 =?us-ascii?Q?rmMIIdGUKW/hwydFhLdsTjPGR/CFZ0phLI0KPYsT/Y7jrMlw62QTYcknASOW?=
 =?us-ascii?Q?oOxfmGXdVrNhf72G3YnNHVKSt0DHEUOC3wWmLXL55trL/SBSLq23yup9rUcG?=
 =?us-ascii?Q?COc5o2Snh0SywMkHXndegsuKev/U0BJ27OaPar4KmpJpnHdwpZv9C0nahkOh?=
 =?us-ascii?Q?rzb+FiLDB510i8JeG7+u4wC4ynHl3rfqmQh13+TmRQoF2qk0eiwpRT2n71xa?=
 =?us-ascii?Q?uC2t7d2E8wHVTATvXAY98bFRBo3YHBkeDhi4TwjKx5GuWxeZcpPi6tCCp2k2?=
 =?us-ascii?Q?TjJx9vDydZFtuZSZVii+tzz8/sHVa35GNirBdb+sTAwBi9GOMBvrkbsH67wP?=
 =?us-ascii?Q?Dl0rsG1aFzyEAenW7FeX341M+BzffR9Zji2f6TGganN3uZqC9OAB+8MRFmfw?=
 =?us-ascii?Q?iCT6JEIvyQUPbCuEozt2J48fT38u7Pde8hv6VZgHF3pIEIpJt7qk1IQJ1Rnh?=
 =?us-ascii?Q?2jVUhbhXxHjJZImLWp/KO0IhlxFGPBgr03/rFSTNo03UkGhQOUhDLMPuFzwy?=
 =?us-ascii?Q?CR24W0R59OxtQkFQciPEIM4n8BaOsLPjS/oay/kJOARc187BYmG2PYMXwAP4?=
 =?us-ascii?Q?wUDKzgGUTH2xnLDxfafTAlqt0GaD0PeR0aW3zz7OGyXBHiHAO91qwnl8zljZ?=
 =?us-ascii?Q?Wese/aE6ccgtlVFkmrA7R+KVdlswoEROI8v4DrFvL5aOXHHsyjWotFuLLDCR?=
 =?us-ascii?Q?hTbSAR8gZu3W1KTYKVMFMjdorJO/4fV1z+Uwcvay3PgnRgdHCN66CYmc3luC?=
 =?us-ascii?Q?JAt2F/H0xBOSyVxgrVUssdoqJDbMshlnYXxCfqDcMwmRktM7jqaCk2ePNUKz?=
 =?us-ascii?Q?ArPzulEBjilpk2IG5N/6j/30DYTAvJik26XUtczuWynpKZM1/we1fwXz3Gc8?=
 =?us-ascii?Q?+acs92RXjPQ68uycWj1uKnvEiWdhASoEDXT7l4W9Woe6qa11DOhCChBsN4yG?=
 =?us-ascii?Q?qNaz85FdE3pUx5G+Bk6PyIxsIgD1Uk2VknTm8ZUivHfqaV4mkdeLnwCRiqim?=
 =?us-ascii?Q?MAflVuF5SpDASUlO0NB5pg4byixPI5y4+sfLmlHOK7WfdbK/1F0avyXnknk+?=
 =?us-ascii?Q?52LkaBIAReKATVBqOWH6UJ790Zw0MLM5fbPyIsRmVNcNqdBz3wZyRLiGYprb?=
 =?us-ascii?Q?Ht02U1PXDsmedl3r9VU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 05:48:36.3568 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec79cac3-2d06-4853-920b-08dda3f49d63
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6207
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4wQOUPQjTsCd+24iLFC5sqFpa8k1APw2ppz2RtULLk=;
 b=plCRYIaI45T2M0k4SFPgfFk1qO/9vc6yL+B6lyiTF//kdoNI6tOxcJHDgCQNHyT5Fvo8Lj5FST/s7BPbjv5GK6ZlWZ45LnKrDhlpxdyvDPCkjG+OSbd1qqOjtdYRGH0oLM05latgYqtkBzVw/OOjaGazYrTPBZImk/171iJXaaI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=plCRYIaI
Subject: [Buildroot] [PATCH v1 2/5] configs/versal_vek280_defconfig: bump to
 xilinx-v2025.1
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
 Neal Frager <neal.frager@amd.com>, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the versal_vek280_defconfig to xilinx-v2025.1 which includes
the following updates:

- ATF v2.12
- Linux v6.12.10
- PLM xilinx_v2025.1
- PSMFW xilinx_v2025.1
- U-Boot v2025.01

The Xilinx specific Linux 6.12 patch has been added to this defconfig:
board/xilinx/linux_6.12/patches/linux/0001-include-uapi-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
Please only apply this series after the following two series have been applied:
https://patchwork.ozlabs.org/project/buildroot/list/?series=459217
https://patchwork.ozlabs.org/project/buildroot/list/?series=459345
---
 configs/versal_vek280_defconfig | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index 1d83e55499..25fdeabe69 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -1,16 +1,16 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
-BR2_GLOBAL_PATCH_DIR="board/versal/vek280/patches board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/versal/vek280/patches board/xilinx/patches board/xilinx/linux_6.12/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.70)/xlnx_rebase_v6.6_LTS_merge_6.6.70.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.1)/xlnx_rebase_v6.12_LTS_2025.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vek280-revB"
@@ -21,13 +21,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.2)/xlnx_rebase_v2.10_2024.2.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.12_2025.1)/xlnx_rebase_v2.12_2025.1.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.2)/xlnx_rebase_v2024.01_2024.2.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2025.01_2025.1)/xlnx_rebase_v2025.01_2025.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_versal_virt"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
@@ -38,9 +38,11 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vek280-revB"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
+BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2025.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2025.1"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
 BR2_TARGET_XILINX_PREBUILT_BOARD="vek280"
 BR2_PACKAGE_HOST_BOOTGEN=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
