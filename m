Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B94E6ADF4
	for <buildroot@archiver.kernel.org>; Sat, 23 Nov 2024 11:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08DE0408AC;
	Sat, 23 Nov 2024 11:12:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YyYuDoNzxBwH; Sat, 23 Nov 2024 11:12:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E783442D56
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E783442D56;
	Sat, 23 Nov 2024 11:12:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B123CE11
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 11:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C84B405EB
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 11:12:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l9XD4lIRyeuC for <buildroot@buildroot.org>;
 Sat, 23 Nov 2024 11:12:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::62c;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6680140470
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6680140470
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6680140470
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 11:12:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UIJuZ/MZc35hnEFCWysrBQ7kCshJMs0S7Mw5YFkYhnE9G/pNwEWzTBtIq/JbjGY9HrKu17yXVT6SLjNzlMQ9VRxfGNZyDHLjv62svF4cNjtLA2ekOlHaTWnwcmMWW+M/c4x78UqoJDhgdy0PhPIu6GfvRnb3T1rUesEMXtUGMK3DbQk9rgem3OJnlz+3wXW0IpMIbcxXrP18kci9rOugAa29J3SyUqmnT8FjWBeBys9/maU2Lho9q4k6fbvf7Za+2GFHMw0mu7EOB/vgH0ADJGPxR2850HzeLQegO/H44AMn5GJLapIS+5j8cYwbKy0h16gu/nVDIvb+ktEmxoFI6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=557/dC0pPnCvqAwuRAXNnabuayuVoFRMA/HP9x99wRo=;
 b=dGVbbZQ8eBwwL2YkAVkfKI1hNWCFkqHkZ1GB/EOlKSRBx9hZhEG/cIiEdsBWTYOia8pCEj5+qgCfRNxudgslZDU1em2jz9dgEoHpYhQDuI34WFZITqLtBfzRAGwgHLG+n4mn3JSGevkWXcJXAEkEyiUUN5VG2gTBi3oGVvGccJT44X05lJQbgGamCP9F91ULCHCWLDKbPIfOgCFkotPXP74l/s+lXAXLajviO336huZacUpDQHwFbDc9LtPvyz4mmVDlI+98QUa6thnkN9pDyOVOl2tbB6ebw17SS7CnJk4c/Za9UaMBOVN6HPYuRHmNt38ElPkIp4yiM03AknzXXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH5PR03CA0005.namprd03.prod.outlook.com (2603:10b6:610:1f1::24)
 by MW3PR12MB4380.namprd12.prod.outlook.com (2603:10b6:303:5a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Sat, 23 Nov
 2024 11:12:10 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:610:1f1:cafe::d8) by CH5PR03CA0005.outlook.office365.com
 (2603:10b6:610:1f1::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.17 via Frontend Transport; Sat,
 23 Nov 2024 11:12:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.12) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.0 via Frontend Transport; Sat, 23 Nov 2024 11:12:09 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 23 Nov
 2024 05:12:05 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 23 Nov 2024 05:12:04 -0600
To: <buildroot@buildroot.org>
Date: Sat, 23 Nov 2024 11:11:48 +0000
Message-ID: <20241123111150.2124027-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241123111150.2124027-1-neal.frager@amd.com>
References: <20241123111150.2124027-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|MW3PR12MB4380:EE_
X-MS-Office365-Filtering-Correlation-Id: 9416e4f8-2659-4e22-a6be-08dd0bafac35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hvuNzBy0IZhHzebES8Hiz/5s76wbzNE+BTjMRTUyFPKQOS63+t79IaacXsXu?=
 =?us-ascii?Q?LyIyunU3vmfchXYe9xOXXNrWZ374LE77SrtyrJIoEwt/f1m2yeR5HikCGh7t?=
 =?us-ascii?Q?YRaKI4hLorntubqXgd2YQS51+mtlvN3qk+uYhfZ7we7c58jFsfPCbkOMxA0e?=
 =?us-ascii?Q?/9WqmYIAQ/eEdfA0ZzChDZ8w4P4ZnJRhXq5bSoRNjHtJ018Zwi4rN/IFcDaT?=
 =?us-ascii?Q?/kT3xIkFvmFN/q6I5LVKyjbcvmJj819761U7i6rXMudSbgL+zp4U6ZkMLrrI?=
 =?us-ascii?Q?7i22vEC2wo1qaT5w8iuT7u1+5XqJLl5dT//MDFbXVHZQlvw5dmd9SFC2LKNJ?=
 =?us-ascii?Q?RVhr8rs1CQogr7QQ1Cd8CKTjQ0IESbpTOb6xNUdptR/4TH1dtnLmObdof310?=
 =?us-ascii?Q?4BVP1w6oDZhhRqVnF7FzNY9TBSI87xBLp0GPAU7wU2Tv2yX32aByDbKypowL?=
 =?us-ascii?Q?Ngd2PbdwmvFBHslH97EcWvYDFw3n/Z148CC1ZgWaKFdhQvd+PRT9kUcw/8hi?=
 =?us-ascii?Q?YZ6v11qc1+8OfsURTw0jsYZuI2pMNwzxdHnwvFEPmCuHQiJJdcXQJAYkjh17?=
 =?us-ascii?Q?ZkX423WyVmU9O0LF28KjA27uPDkEuNINEWeSKOL05R10wi+gfcQWv52P6/iJ?=
 =?us-ascii?Q?Z0rOpGNuiRZ8bmwDx7g9+L5Unxzr6cX9Co+HlNyjUV7fuBQ2ZSEC1sy4faE4?=
 =?us-ascii?Q?OVLOlMaC/HhLoquyWIbVaK0VwCQhuyWk4AiHa+Y2S6FHatgwMPjyMU9pgsIj?=
 =?us-ascii?Q?Pxzr3HaVqn2wg3/sWfJ8dDVto4IZvgWHpCL0aWJ9JWbefD7AgH6gYjTBr1lj?=
 =?us-ascii?Q?84gSpxRa5qYS1B6D4h/qYvABSkCHZZdLhxwtVeKXTS4eRlNA7OTLNXxQ135k?=
 =?us-ascii?Q?ELIXWo45r8bABjZ+bWCb11e2WjkGMSUK/B63cY8vmYdVMIoBMYV4MYJANeeO?=
 =?us-ascii?Q?YQbodgRLg6zzuJLRdpG24QfFETciDuoK9CjSuUQJtdNth35yl3enJ7+g70FM?=
 =?us-ascii?Q?hzyoD0LnQ0SXeiUJeYEfdHmSfhwRF+tBe5utyDfIOYGsyUBTbLnuGRak9FZD?=
 =?us-ascii?Q?UIDYCIYdvof4+tlxC5GsQm6521Aasc6ETLrx8lKLESSqD6cHb5vNl0nWVHIz?=
 =?us-ascii?Q?ywXn+lvr1aAs9oQ3omH9grUz4ejXQznbKmWUZ6nU8LFKTIMcxZQPOlbnGj7o?=
 =?us-ascii?Q?Ibbm3bH4hf5Cc7Ekeu7Dgf0sBYWClyG+Jawf2dH0DVFJTRmvZBx5QzL9GRu/?=
 =?us-ascii?Q?LVykwuXDYtMVup2nnGjVClaIZEtw0Guahp/P9ioYC0JYRVjuPcCB5dz1IvoM?=
 =?us-ascii?Q?E2Zho2cxCEELcF5iu1R1VNCmqEDnEA76elJar5Vk+RgGzjF6UNbR0MUqQUKt?=
 =?us-ascii?Q?hW26WYLK/VKj93C4hMivpMyDZpmi9XdIgjq6wArNZpHF73WoZG/QsnLxpJp7?=
 =?us-ascii?Q?F5Cw+DXo2MenhdieofH3Ua1/rTLJqVRJvxzzT/ltK1G120J1iK3xcg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.12; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:atlvpn-bp.amd.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2024 11:12:09.2076 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9416e4f8-2659-4e22-a6be-08dd0bafac35
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.12];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4380
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=557/dC0pPnCvqAwuRAXNnabuayuVoFRMA/HP9x99wRo=;
 b=GJUY+2M9rR+WwxH0EYDfXiFKDe3KCqUBLgbWd9BzzTpJGbhZjPQl8lp2NmB1887i4HBog5JMX6jZcp7c3iZhOt3UHyEdkDxMsJgCIE24edtHQff05q6sjeJJhNhCpRUDJPu1zzksILs8prOylwn8Z7Ne6aM7zTa/5PSh0GWM8dQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=GJUY+2M9
Subject: [Buildroot] [PATCH v1 4/6] configs/zynqmp_zcu106_defconfig: bump to
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

This patch bumps the zynqmp_zcu106_defconfig to xilinx-v2024.2 which includes
the following updates:

- ATF v2.10
- Linux v6.6.40
- PMUFW xilinx-v2024.2
- U-Boot v2024.01

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_zcu106_defconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 3a13834c96..4c5ac16f0c 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.2)/xlnx_rebase_v6.6_LTS_2024.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
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
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-rev1.0"
 BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.2"
 BR2_TARGET_XILINX_PREBUILT_BOARD="zcu106"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
