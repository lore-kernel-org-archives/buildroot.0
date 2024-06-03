Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC822C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 11:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A7DF40CBD;
	Mon,  3 Jun 2024 11:52:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NexEwQ9KYkg8; Mon,  3 Jun 2024 11:52:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EA5B40AF7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EA5B40AF7;
	Mon,  3 Jun 2024 11:52:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3C1741BF383
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 11:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3618040CBD
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 11:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8wdva4uapquF for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 11:52:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::62b;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0CE8540B12
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CE8540B12
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0CE8540B12
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 11:52:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFRr1PTTB1et5mRbswt1yU6lE91hcNhw9Au83NnUQm8WaVPGZOe/lGrybjvL24gkv01kWdIf/k0AMWBzF4ekKtu9flv5Sxwrt3qAW6KZuuGmxYvJnQurdtnwETP/GAYjcMdVGslA0Fwd7OVcqjxeKAFHJSQl+u7sgCUxL4ihkkDHRfjwoHZyyz4IYDewDl0vWiPO0vBZYAZdPJ5SZc2FSIUxQB8o4sqrYvQ2A3tFd6t49Md88pP83s7JYXwvFwYp1M5KlAJF2euK9pJXgtAUYiBetEhOWQQRcf6ywEdbNLfr+r8Sl1OAAWzEG3cZI2vJDq7Q0UEOycccDUw8JG8WnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5PlN0xwyGa3DfvqOmQHt4mVOr353+PH8jQWQSJzk5M=;
 b=ogLQWUH12eXD+8oMAWYM0/1EXKwBIvRsKt4ca+3GE0IvPnyydGdPEMNGD/uGGOlY/YeE4W8+VwJ7ImbWrXaLEdBIShq02DgBt6PQS/Eo1c3A2+rqi3WX3dTpa+qs9nJ1gAqMOy/vxo4YEshCFsXqAjiw9TfqwerxUTSKycCHZbuWtbP1TmpibBZ2ev3B1he2C1DoKuoohfD8EKibW7JQ6C5tAKJUpwxNS0orzMcWVMnFGwISyAIrFYd6GSOddIsQtYJM/jKXF0uHYEZ/lDewSoNKhy67LVY3GZrNoGOskSsbGBsleXVkq4dwcR9thKlvXBu6YbgEUxIYsI1/lqD2VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SA0PR12CA0003.namprd12.prod.outlook.com (2603:10b6:806:6f::8)
 by CY8PR12MB8268.namprd12.prod.outlook.com (2603:10b6:930:6c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Mon, 3 Jun
 2024 11:52:21 +0000
Received: from SA2PEPF00003F61.namprd04.prod.outlook.com
 (2603:10b6:806:6f:cafe::d4) by SA0PR12CA0003.outlook.office365.com
 (2603:10b6:806:6f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.30 via Frontend
 Transport; Mon, 3 Jun 2024 11:52:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003F61.mail.protection.outlook.com (10.167.248.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Mon, 3 Jun 2024 11:52:17 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 3 Jun
 2024 06:52:15 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 3 Jun 2024 06:52:13 -0500
To: <buildroot@buildroot.org>
Date: Mon, 3 Jun 2024 12:52:10 +0100
Message-ID: <20240603115212.184529-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F61:EE_|CY8PR12MB8268:EE_
X-MS-Office365-Filtering-Correlation-Id: 865f8cf0-bb1e-4fbb-f071-08dc83c39e5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|36860700004|376005|82310400017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XfuojHPfFy6yhKu0gAbJFoKseJ2ZAj9v1uO7OB5GVZWmsQgS8FhJAq9OhPJl?=
 =?us-ascii?Q?jTlnNGwFNz2APce8I/+F9CdxBJW5ogk8JnpK7NDzKyllf1xOaI3V9G98BEr3?=
 =?us-ascii?Q?dWSzKccAo7AE0K2BlDUOXlfldYyfNfJrmvGrnDu6Y2hX617XAdFrOjRsXjRt?=
 =?us-ascii?Q?e4lkJhCB95VwRWG69/ypquccCKqv/bZIo+MMsigLzitRehvBfr/QBI1orIYT?=
 =?us-ascii?Q?PDqX8TUhvmrPUN9eAhATclKQ33vWHJvm2dpFT56dEDkjzFGV/SzAEyaknlrV?=
 =?us-ascii?Q?RaN71by6LBuVu+E8bGG4AeCabR68oeLSSnDOIUF89vppwinadLlvfXC/+Zk9?=
 =?us-ascii?Q?du9OEdszlgKwGba8diqU1mdnPN6S3rQ7Z329ae+J6zPiIkGwcm0SeUtF8H1M?=
 =?us-ascii?Q?/llYHU3HQA+4N5W2bYTzuTHK2wy/MsKaUmHch7quT2kTX0QLg/oyAX60Tw+9?=
 =?us-ascii?Q?YUU25vIYAF+RmfaZuaYkDQucXamZF6V87lHwpCaQ7P9yQphQehVF6DO54sXM?=
 =?us-ascii?Q?OggdrVMaqoRf3cdFGytRtj83EDBzPiTrKwgmZTtvpVcCnLUKLtNxUewwZovq?=
 =?us-ascii?Q?2gz2NSnRxZRiRhTOk/Xb0SuP2LzEtnjiUkF6mv4txW1uk8ES4AOqAoxVmA4d?=
 =?us-ascii?Q?+Wo75MagfVsxErya5GxUcYjglxlfGt6YnjDqDfarV3MvFQCdvQGCpynA9eMD?=
 =?us-ascii?Q?YRrLpaH7fQjHtwdyusFhSnz4hf3ldm7Dw9/crLqxF3a1//QysBJ6A1hSric7?=
 =?us-ascii?Q?dL5cd6n0WbNnCva3iYkC4L2Ui3fBiugWZIOCfCplfdsd9VRevV7R159y7K6k?=
 =?us-ascii?Q?cONfLcDY/u+q5L0sVCmBGkUD5SJlA0xti5CARwudwfzpLO4b9mHnHJTNY+7D?=
 =?us-ascii?Q?nl7ZYusvPuHD70GvMWCPsvVt8bxOYZZPWUS4vlaxdaPJzK7Lr/j1CVswVHmn?=
 =?us-ascii?Q?wTFSyytWZA8caXOorFanfetBQPMzPoe1s2Il6KbieO35I2SrFM0A29+VZZH5?=
 =?us-ascii?Q?isIX27JXJb3NCJLP0Cri9v+2pHnvW5OcbOQIpyWledNb6lO/68AfD/PAF8Gr?=
 =?us-ascii?Q?sGxTLJ1clQhV3kzV8sP5lbNsOFJWwoWX5iLqK/2jzg6K5dHsCjMWPdRWnSYg?=
 =?us-ascii?Q?yYPwkcCqoDEdVDjOTiwUq3cftbdeu/q4EsJeKt/aUPWL2KS0TfCb0sXrX9o/?=
 =?us-ascii?Q?RyAhbM7tOexDd/VOyxcjgRNU+zJLHAe7QUcytWzLWE4WfFng+RGQeNcVgBzA?=
 =?us-ascii?Q?qPmI1IeSjaEq18E9AC4xWzEiC8b/Wh+6gMsopVMoZuCmopNJjRuo/xFVE8sJ?=
 =?us-ascii?Q?8oxbuS60e7sc5oMXQ38gJBNzP2oGxpR1z86tBOVyYo6EAa9O8V/i+8ebgH5F?=
 =?us-ascii?Q?Ca4OKgPuFAx998RuTKHmyVmJe0O9?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(36860700004)(376005)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 11:52:17.8051 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 865f8cf0-bb1e-4fbb-f071-08dc83c39e5c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8268
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5PlN0xwyGa3DfvqOmQHt4mVOr353+PH8jQWQSJzk5M=;
 b=D/61hWlVHHM4zOfCdTbVQQhqpkDfIjH2pIZBtys0mvUgVYT5PGS2ckJbUuN6Ya3CHR8+kOdCj9qXBSOH5bN/iYTJrUd1gKgYvIK+u5Pew+MriuAbSnLApKFtLchG4oy8yi434nM2lg3EyUiImvAWTIbxE5AXqB8ObFt+vOej/vI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=D/61hWlV
Subject: [Buildroot] [PATCH v1 1/3] configs/zynqmp_zcu102_defconfig: bump to
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

This patch bumps the zynqmp_zcu102_defconfig to xilinx-v2024.1 which includes
the following updates:

- Linux v6.6.10
- U-Boot v2024.01
- ATF v2.10
- PMUFW xilinx-v2024.1

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_zcu102_defconfig | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index c920093d8d..f40002f6d9 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
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
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
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
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu102-rev1.0"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
@@ -30,11 +30,10 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.2/zcu102-zynqmp/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2024.1/zcu102-zynqmp/pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu102/pm_cfg_obj.c"
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
