Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC23C25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 09:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4341141648;
	Fri, 31 May 2024 09:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fc5RjCvKc2EB; Fri, 31 May 2024 09:48:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C8E741668
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C8E741668;
	Fri, 31 May 2024 09:48:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 69E111D502A
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 09:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 526764164E
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 09:48:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ar6O6yizDn3Z for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 09:48:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::601;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6B62641648
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B62641648
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::601])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B62641648
 for <buildroot@buildroot.org>; Fri, 31 May 2024 09:48:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9y2hs6EOUKz5wi8cSKI5Yp+6f0sf15r36baMkhpNWD5D85FdXi0JYv6HiCKIluxks6c911tkCilsRBtq6sgpheDzfAwKyLRi0KzNjI7fr9bzv0BBxwRxhukF275hvvkuWgINsaP1K2eft5toa5ZH69W5R4Q2yXcuY8/4k+vlawnHnOmKD/vucMybnjmzyGpvAA3QzahpOW6xLaLxtPwoBq/NVo7egodLNqPWAujkEUgUwzXPqIQiREq5HHXr8eaWkVGxKFo0yBcHO75PHE5mufw5iyK8/7/yzh51ZTRPMseaS5SKGjCin2JMKra7pm9BCg2BGE5k8ukuPM4wNtGiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vos67sk8Ig7qE/SAyDOS2KPgJnqDo14+1EwCfAspnpE=;
 b=nLOSNjHKaheTWyHNh+qqSAYolw17/usLWbkW90nw+0uJbF7UlH0SvbsAbPKX48n9MVmWZrpHAPctJUYBXGJTNxjQWXb32b/7Il/Pxbd8AIOqBmXYfeMuz4vwY3H0uE9lAZXKdMWoyAu5Sa06qkVXfwilaGlK2TeI688czvmoeCbYmfVk0O48aRzsCQ57UAQhRXtUi2KhHdR0vW2tEApgoh7AG2aWiEI6828d9s6Z2YnPO6bByufB/JFgvU+uTxksC5xYgKd+lYsYM4qd8u3A2v4JyZUif9UQGvp09PAKoH/iQkBFlDSewZ4JP0hs/a8hgipfIURZSkYRHNz6/yGguQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH0PR13CA0056.namprd13.prod.outlook.com (2603:10b6:610:b2::31)
 by MN6PR12MB8541.namprd12.prod.outlook.com (2603:10b6:208:47a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Fri, 31 May
 2024 09:48:05 +0000
Received: from DS3PEPF000099DE.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::de) by CH0PR13CA0056.outlook.office365.com
 (2603:10b6:610:b2::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.8 via Frontend
 Transport; Fri, 31 May 2024 09:48:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099DE.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Fri, 31 May 2024 09:48:04 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 31 May
 2024 04:48:03 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 31 May 2024 04:48:02 -0500
To: <buildroot@buildroot.org>
Date: Fri, 31 May 2024 10:47:49 +0100
Message-ID: <20240531094752.3760287-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240531094752.3760287-1-neal.frager@amd.com>
References: <20240531094752.3760287-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DE:EE_|MN6PR12MB8541:EE_
X-MS-Office365-Filtering-Correlation-Id: 81c810b0-c0ca-43e8-e6ba-08dc8156c4dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|36860700004|376005|82310400017|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RN4dhl623B5ippvmBms8CJ/yjV27p373h10rbpT9+MLZRftG05RfqwOedvQg?=
 =?us-ascii?Q?dIIXAA5kEOsoQVUGWyxDZoKR0arsVvjVFXmdLR0RURHM7tPrdlqaMmBbmdIl?=
 =?us-ascii?Q?vbU3vj8MyXxkPSZ6UUb/NmTT4AaMQO/hf4cuplr0t8YZoPB2oz+6cJ63rw1q?=
 =?us-ascii?Q?kwloWAfUmnE96lyqOS68snRYRz8N7/7zF1j5IsvgMPpCar59SVCcyDaoMxVO?=
 =?us-ascii?Q?yEdFijZ4YseLtA2vG3VH98ORZyJzGO3iLwkpYyQ4kk5hXrRtBVKOoALYr78C?=
 =?us-ascii?Q?Q+/26Qha1VvhsH6NJtvmDMvj8xA5r3PFXuVXtXyayv7eUcw8HZ49XSF5mvul?=
 =?us-ascii?Q?Ig/ViJ33igC4NMXVbc0JOkn84R8NTd67/bCCIj7PtQxNn2HwctJJl2bJPcER?=
 =?us-ascii?Q?UiccC5NUX2jlwxeZ3UmaGvNDboWhanIcG8CAzcYN5Vx/2bIbkx0SOIJNmk7r?=
 =?us-ascii?Q?zLm4KiarQK3bfDL+T0xcm72OgfZgF7NmNdgvllPIw8eCVl9XLnnMB5I5vYc5?=
 =?us-ascii?Q?oz97W1atiZ2bgGe7JkEeg3gX6HiBSvSwhSqWqEC56HRvm+URcHrbc2c/VwjH?=
 =?us-ascii?Q?zXAgpiS/7tOJ/WoLJsIJRlzzP7fOIakKEvfBjKOhkxd4+13cjI4Lu3eXdGqm?=
 =?us-ascii?Q?cVkEr4YBg1QgdA9jVQgfhJYQxh9fTzPcj4UloapmvFvGedADVLza0kwhCaC4?=
 =?us-ascii?Q?aNcR4u61AUYMwkzj3xZRVPVoCUTPjVldxmi8c7t8ReWTx2Ms57Gf9QtFnC08?=
 =?us-ascii?Q?UjOEeVW/NzC0XA7uixrjJy6ZuhUwOdccVdwVuzdAHLls2jTRB0qVP+MHlQ30?=
 =?us-ascii?Q?+KdZHew++4Gf7kBCdxuVvDkNaGu8Fe9GdxTQIJtL6zD71aP4OBAl86gJAUoJ?=
 =?us-ascii?Q?FoTb7lWNxZEz40Ck+gQwl23phZThDlXP8nn/RJZAgIad5J+i3ANl9jydoDnk?=
 =?us-ascii?Q?n1ImXK8vmqDWRFI6v09l/LbHo9huVbipCgGMQuL43/+78059STcHztUrI6Ud?=
 =?us-ascii?Q?OhqmCiiRGxsriGKdoByNJYWsM0LDEx6ToDtFwciOSN0Z7jrBnJUAxdKN33bA?=
 =?us-ascii?Q?+OURMkv01Tk8FBcemPhBiP0cNYZPusxx2mM1Kg67sMVTtPMDDnvCG+Jlh6wD?=
 =?us-ascii?Q?xa5yy043GWQRRHn4KcmrjcGTpsieuuuBSnWmNui9WXscFa9QgTUuSN5sLmgJ?=
 =?us-ascii?Q?wxV+Aw8iZPksluX6c+4w6HbWmSjh2ogyti2mO88gCHslNYLCV6bjp0KX4mtZ?=
 =?us-ascii?Q?sO3JnY5vRitrkfibye+Xc603yhhmuop26KhDjis9N0YPb/mMRefdaoQRQx2D?=
 =?us-ascii?Q?bMZJeRb/CwZDNw9hw2umIbBr6jFNMtYvIl8JzsGtxW2wCsnsygH+bUl36N+V?=
 =?us-ascii?Q?oeeEi/3Hyb+w6eT/vf/ci6z6d9ljBeh7IZ/BYj+qtk1ZopQiIg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(36860700004)(376005)(82310400017)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 09:48:04.8812 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c810b0-c0ca-43e8-e6ba-08dc8156c4dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8541
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vos67sk8Ig7qE/SAyDOS2KPgJnqDo14+1EwCfAspnpE=;
 b=ju1HYDhtzWKEOb57amJJl8kJpLZq2uPH7APqHb3ixUkHlGHVPvg9D56fbsrhiBXsSxY/QuQGLIr6s7xaWCUBh8htgqiuts4tdVovKNoqVJgI80sQSq7uk9CPSJnnuf5kbtfP7FKrDc5Qq4wHcTwjXFVErKQwWvZg+9cMHgMLR7k=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ju1HYDht
Subject: [Buildroot] [PATCH v2 4/7] configs/zynq_zc706_defconfig: bump to
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
Cc: martin.chabot@gmail.com, brandon.maier@collins.com, ju.o@free.fr,
 juju@cotds.org, michal.simek@amd.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynq_zc706_defconfig to xilinx-v2024.1 which includes
the following updates:

- Linux v6.6.10
- U-Boot v2024.01

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- update linux dts name to include new xilinx directory
---
 configs/zynq_zc706_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index e22ba7a3d9..9ccf23f6e1 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -2,26 +2,26 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_GLOBAL_PATCH_DIR="board/zynq/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_merge_6.1.70)/xlnx_rebase_v6.1_LTS_merge_6.1.70.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-zc706"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynq-zc706"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.2)/xlnx_rebase_v2023.01_2023.2.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynq-zc706"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
