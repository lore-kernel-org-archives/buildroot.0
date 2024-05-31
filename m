Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B85AC25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 09:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5728F4164E;
	Fri, 31 May 2024 09:48:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id twl0PRmARkpI; Fri, 31 May 2024 09:48:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33F544130C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33F544130C;
	Fri, 31 May 2024 09:48:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1642E1D5051
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 09:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA6544163B
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 09:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ye1gD0jrBRZL for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 09:48:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::601;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D2F9940A98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2F9940A98
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::601])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2F9940A98
 for <buildroot@buildroot.org>; Fri, 31 May 2024 09:48:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmkpshwoOzSWcU9tAU+L1Kup14704GJ+s4r31p3SwkpnYADiMuoT1a9yoQlBwNMczKklu9z8XwdpIrFjvb7MS14nbmyjJn0ThIR8SNr4tEa/okdjkd1XePJiAiJ3CWaiSHEZJ1JE7hutKrxJBpokwiY/XFtpl7uvDRVParbd2a7tVo0dPCHL0dxrBF50Rfa2mxffHEGPdM7hmtsm5kMd/TVOV6wy9S8bLEA4Y2wIAWWHj9l5UPAnthA0cyQbPdvI7EyUAj6GCMBzM0X5/FuvseCpa8TCHCO3RIvPjQAaCPmAqM/nihEUQcRkxEXRNfCkBiVfwenokQPFz44dA15AgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FuqTiJVaSOw2Kgho58pX8y399pb+nSOqTKDXJMW30Q=;
 b=nKLbsKt5jmtZ1t9PPHTTi88hO6ljfvu+BFNKSRkOSX+JbKjumbr23C3bIXeZ4d4XOanQtAdbeN5Gw9sBpKkb5BA++65yDbekDt4ZBwAA/cruEL14VL1Srnt9Le+HmeFsW+x1UtaQQvFTJu5XH9QtA/KE26zBULl9q/A5nX8/x67m+iCrJn7LID08F6OqQ1NIAPuY5fbACzuEP+g72WIRP/pUZm74uH6To77zFS1sTnbBWxTdwW0neavMwGjfjxPcFMn7UGG0ZiZR7wp+Wkj9F14Y8p9+Nq6Toa7koHAy/qpQvdpVar9CuBapsdaMm9YktAMB/Zu7dLQ4bGI8jf/JTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DS7PR03CA0347.namprd03.prod.outlook.com (2603:10b6:8:55::6) by
 MW4PR12MB6899.namprd12.prod.outlook.com (2603:10b6:303:208::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Fri, 31 May
 2024 09:48:08 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:8:55:cafe::11) by DS7PR03CA0347.outlook.office365.com
 (2603:10b6:8:55::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30 via Frontend
 Transport; Fri, 31 May 2024 09:48:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Fri, 31 May 2024 09:48:08 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 31 May
 2024 04:48:07 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 31 May 2024 04:48:06 -0500
To: <buildroot@buildroot.org>
Date: Fri, 31 May 2024 10:47:51 +0100
Message-ID: <20240531094752.3760287-6-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240531094752.3760287-1-neal.frager@amd.com>
References: <20240531094752.3760287-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|MW4PR12MB6899:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d051fee-d13a-4960-7c53-08dc8156c6ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|36860700004|376005|1800799015|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sALy+tQgxOVaTInNLA8QaNqYwXKFxFLcLO2Q9OZFLvRYBxZY+yCQ46AAkpeS?=
 =?us-ascii?Q?W9o+VFGjG/DS+bq2LSYYtjFvg/ug31UFhYToIcFj0Cbuu4Aw2zh8U2mpPJN1?=
 =?us-ascii?Q?TL6LtINA9wmStZWVK3qRChMxQexgCcWU2VMBlqBvtLgN7FTOum6bfAvyw/rs?=
 =?us-ascii?Q?hPHltDY9I54Pt5pk1WG8cU4AFh2RH9XtEL2GiIAN4nbTxQsbkRC0NNMGgNxT?=
 =?us-ascii?Q?3PAtjXcjl7CPqnKItNr8LTZMZNQlW+57Bn/tnhoBtiUQ2zpsSyc+S/hyJffw?=
 =?us-ascii?Q?IjhBxYOi8paQ0bClk3cpRDtS5zF6CtEQVPjyOlwftKoO6++y4vPJJ/aI25To?=
 =?us-ascii?Q?ZWDC6QQ9MrSjx1mYIYjtix3EXTmm+lg2z3N9REDFYCvCoo00VdakZ5UAVGq/?=
 =?us-ascii?Q?d01QU4jM7coRnXYlFuF+wLf6UMY0dlBoKnzioA0lzuvjkgH2+ApSSQ6ae55j?=
 =?us-ascii?Q?AbDR9tju1EkEUgPSd4II0Gr1MoTlKMd2s6bFNnlximiAXT9x8iL9pqHylZ3i?=
 =?us-ascii?Q?OoMd6ddgTMZATYpIX+COLLl61pVPaI92DJjXdiFOesc5wpIQvXbPaAUSCibY?=
 =?us-ascii?Q?Qcbiezn3eOY9WzJvUwxJBMKOKFiRA/lAkvguK+KuYRkjaMg1SiEIesnLwivn?=
 =?us-ascii?Q?kYCQo4S0M98yOXkw6YiZCdZes/WhaFfLuUZXKvsnODlFCKze1jFLCqFw4oWq?=
 =?us-ascii?Q?6LKBYP9j9Ztq9z8eR+DRUZKOfBept55tFTUEE/z4Q/p8JLwjB0Av0ziHwg3U?=
 =?us-ascii?Q?fGFF9xEvZrviTud70nCmfXjjofZq+wn6sMd+YitCaq2/E597MYWrI4zC7spq?=
 =?us-ascii?Q?/v0aLyxVSbyOaPwLn3IopIgVipuVtzUwDWemjqseQywBV/u7dJKnRKPxoVFH?=
 =?us-ascii?Q?MYbEFxRfcGmEDvlFtaf4PP9jXrIxRiUErVCYHbe2EGZr5sOc5lbqtZh80oHd?=
 =?us-ascii?Q?6BU6zaJLoxZR8ACxVKtbqkHGDzgfkJZlZdS5p3ZYzHYrkPxG+KkKtgySoMb1?=
 =?us-ascii?Q?ZzTxfbCmJYaGY3H0V/RK4sa1KJFSI27tmmbzT+AwOhPy8/3JE+up82FPpgTd?=
 =?us-ascii?Q?5CGgGKrsRIBckVwvVHUlLD7sVMKkq3XBRB/HN1Hxx7XW9sHpMF8pgdgewEdm?=
 =?us-ascii?Q?/bDSn85S8FQerBzALLE/t0I1l5xOMCxv6Yl/N8GwYFJgv8FTgVVA2K553kS5?=
 =?us-ascii?Q?17ct3t//qIiSxU7qN3f6o55NWNqTOR4T3SY22PDQvxr79eA4ysINPYX2HK8V?=
 =?us-ascii?Q?8ul2yCrzLJJwW50MeXlGCQWKx8PDwaTtHpp4DX9dxsfpTVheLbvclQJezjZF?=
 =?us-ascii?Q?ftVlhSgcJWPwt+8R1Ih2FZTSOm/syTdj93GgK3rNfV7SGwnfXot+f++BlxDZ?=
 =?us-ascii?Q?wFbDYr4/Hq5onfOxzzqPNk40TjyT1RCglUl1iwNNF0HeUcHy8w=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400017)(36860700004)(376005)(1800799015)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 09:48:08.3740 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d051fee-d13a-4960-7c53-08dc8156c6ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6899
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FuqTiJVaSOw2Kgho58pX8y399pb+nSOqTKDXJMW30Q=;
 b=lIn0REAp4DECFY7D29SFLLMohpOy/IuUJ+RhTVai1E/3uWaAGsYfBiXTxBcca9wpO2AJKL3pADPxLoJuq1ELfMWp94lbYlpVLY1bCA6s2ba0oI6I/0nKqg34h3z9jVNx0wU2O9ko3t8J6kxMA8hphdKAODIidW0vG5pj9lH/gdQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=lIn0REAp
Subject: [Buildroot] [PATCH v2 6/7] configs/zynq_microzed_defconfig: bump to
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

This patch bumps the zynq_microzed_defconfig to xilinx-v2024.1 which includes
the following updates:

- Linux v6.6.10
- U-Boot v2024.01

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- update linux dts name to include new xilinx directory
---
 configs/zynq_microzed_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index 8fb9bc49dc..c6ca5a6244 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
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
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-microzed"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynq-microzed"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.2)/xlnx_rebase_v2023.01_2023.2.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynq-microzed"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
