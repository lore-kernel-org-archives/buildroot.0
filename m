Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19097D4415F
	for <buildroot@archiver.kernel.org>; Tue, 19 Nov 2024 13:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E120E85674;
	Tue, 19 Nov 2024 13:46:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LI-RqR0wjWRe; Tue, 19 Nov 2024 13:46:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7F3885660
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7F3885660;
	Tue, 19 Nov 2024 13:46:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4400A27EB
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 13:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 222696FA30
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 13:46:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_CEEMhDTl-W for <buildroot@buildroot.org>;
 Tue, 19 Nov 2024 13:46:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::624;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ED2696FA1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED2696FA1E
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::624])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED2696FA1E
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 13:46:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JoNiSak4EaZeH5h8UVsYBy0xNyroZpgusn/CTsgwi0X0LaMpTr43B1Nf+r2OVQl9J4KkNyJxfxLCxJHzUUncNMCVeGgiXPldGAp4JIBQpTk/vsoTUI2A5mfDKdoUV3+dm4fjSkUszybz0TSod1/HSi/ZPRlCL0GmjzIGY4LYRNja5ziSb7PpoBB8x9/tjq1XpqVxqAbL8eLCS/CSWmWyx3P3F9Wa7T9Q+jXZFtGSk3DTBURBCYv7iPRLtu8LRYlM+OvDWTE605JIjtGxfeel2SBhuCisPvCyZh4WUeuDlyKQCuMK/ZIawhZPgt4J0uQJ94vzO5paaxX1W4PLZHQecA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MXPy+kWGqHtk3vtRb7a2Tl9G154TIqB0CkxnQj6deLg=;
 b=rPfPXPecp0xoXKfbmNLKSyQjZPvYxfoKubL26DCGsnKCsQI0w7z2Zg3DXFmh+wDBTl1hzSAmvI/bXxCI0qRUFa0XPGWN3A2xBY0NqtIht6t4FVwvut6Zgn6GjFDFonjL9cFMNZDBjuUlde7XCfbaslAryCwDeTJUh0fvu93izKmz6hL8sLvqXERAyKE/KOhGTKF7mN6eWEdfTU5URu7jUMTMTCyA6wWwDvJaVCbeeRb0Yk/dheL7HZ3eiRErujV/1xNZeLkZyYguRUUyXCqBWJRG/l7zHxMc91zB/qN2ay3MWvTCAe+J/o3cYg6zMz+FrzJxXC9j9ldsTKA9j/Ts1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH0PR03CA0084.namprd03.prod.outlook.com (2603:10b6:610:cc::29)
 by SN7PR12MB7273.namprd12.prod.outlook.com (2603:10b6:806:2ac::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 13:46:14 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:cc:cafe::57) by CH0PR03CA0084.outlook.office365.com
 (2603:10b6:610:cc::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24 via Frontend
 Transport; Tue, 19 Nov 2024 13:46:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.12) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 19 Nov 2024 13:46:12 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Nov
 2024 07:46:12 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Nov
 2024 07:46:12 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 19 Nov 2024 07:46:10 -0600
To: <buildroot@buildroot.org>
Date: Tue, 19 Nov 2024 13:45:57 +0000
Message-ID: <20241119134559.3891625-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241119134559.3891625-1-neal.frager@amd.com>
References: <20241119134559.3891625-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|SN7PR12MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: a74a392c-9b6b-44fa-6038-08dd08a08845
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rxzyIK3fLgcDnbHdgky2R24KOxHL4lfxiRGNDUl2MwvYtOM/3ZXJvZJZ/xp8?=
 =?us-ascii?Q?4p004AAhvsACyoct2Bt2MT1H9iWHsZB4TD7EDRdw3hGw1vJRPlCc15BBsNhb?=
 =?us-ascii?Q?XL81RLTFmCJ61LNqZMeSvPJ8MlQ1/o41BQHvS8CkBgMEIEQdzFa/UgGy5SmN?=
 =?us-ascii?Q?xEitu7xWFUzD7GOGaDR4w2lTCtbIdPpDpyNzreX9lVb9SF/AjUShEDVhbasx?=
 =?us-ascii?Q?XaiosbU0UWUav2mwQKD/YUh1PA7rz9r1jV2ves6vwXZRUQPzsB2IHY+vCZEj?=
 =?us-ascii?Q?6l9vyzM56XAyjy4vt3EBDqkUTPZtg1uNIJ1OFoCM5SDv5YG3VcMZ30qZ+uPe?=
 =?us-ascii?Q?GecpM8/YApf3LQXiDyZ8tFwREv9xQtCi7YV1XsF3/xJBRBcIaSnlsFkaZ+gD?=
 =?us-ascii?Q?Zq05YFcjpqr193TDbzLmjR40df1obfhf7jWamTk7gjBboruQRiiYM8sXFnGD?=
 =?us-ascii?Q?y0LHmUfIJEeTJemvptZcsPLI+OxScu3sElpNOzCtm+W+lUDza5Gil3U2hGvI?=
 =?us-ascii?Q?sdt1aQFWNUPjvnhOZ/1lIwg+rUYE18QTmStHq+NDmGWlYJyStNMw5rC4Hijj?=
 =?us-ascii?Q?j15AmR/uriVd1ECK1olS+QvGODVhz4iG13A9v6PP48bFb1NRWeyE6MJsBlXn?=
 =?us-ascii?Q?CWt4g91IwKY8h28yuYiI/jHAUpdbaPJABPA4W/Q/0+E/TihGIwzY8ZyTSlwH?=
 =?us-ascii?Q?tj0eyF0v3LX/NEle835EeWaOztpalUy1cdQBrVIcA3/K8DABC6j6sCVTklFG?=
 =?us-ascii?Q?zWpMQdfOnhpEpLeP5PkkRIhIFgJiTnr4QqYmh5eYo5xmCEiXNcDn+Vlhn8DQ?=
 =?us-ascii?Q?zyUt7RmWdpUbcNLfBmFrBLp0VJse34UgmUkbhFrD2z8AKZSqhz8wlNRoJOBN?=
 =?us-ascii?Q?eiEo01BLL1UwKtNu/kUdp+NQsgWaaIhLYwLhvVSIcW80svREVLqsdeYWtodw?=
 =?us-ascii?Q?w/hTHfoVZZ96ATtswhxIWaFpwOPZafeuStwETaMMad13I6Z8j3nNx6m8uOqc?=
 =?us-ascii?Q?PK47EbwGBYQGjJ4R0pnp9r97uV48EuoWGT78xzV6PPDW3KukIwRPkuCWC40q?=
 =?us-ascii?Q?xKljqTz+VbLSzzp8Bs4lnvB4GlXIJ0tNNZPD5IqhMQS3QE2NE141QGaEIelY?=
 =?us-ascii?Q?nZWsBL0YUquKxvQ+9VU2bzhTmZQ0sO04X2ZHVXQjtIy5d14Ymo4mfechrtX+?=
 =?us-ascii?Q?SbmKwphlkfcs+vzh1gqZwmoixyR7niuea+YXnxAsa0VC72ZqEOTSCFnqwhoA?=
 =?us-ascii?Q?PRthYLDcvf5KMBODE/IPM+ju3KSxUekNqkKE0TwqTayVBf9gePYyW1Ase7Nz?=
 =?us-ascii?Q?Bnz0URtICzFYySduPH+5KQnvAS7KI26g6Kmpp5p/CZaCxNFq4AEf0xkgvqQJ?=
 =?us-ascii?Q?4CQHbzAdQEjorflmbQEaXpDXk2B3OApXCJzcWWrpQx3NGRDOy5AuX2Erd+yV?=
 =?us-ascii?Q?tf/YvhtLvUqvd77DQmLghY7PvJxzHtXt?=
X-Forefront-Antispam-Report: CIP:165.204.84.12; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:atlvpn-bp.amd.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 13:46:12.9578 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a74a392c-9b6b-44fa-6038-08dd08a08845
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.12];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7273
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXPy+kWGqHtk3vtRb7a2Tl9G154TIqB0CkxnQj6deLg=;
 b=dToACV12TVxTlxM6usdzLF8BRQbBkirNGN3WjvpdLlTl2hrKP731ZG6zF/IiXJ4I/Kq1YUg4usik1eCz+C+I7wj9crfdi3sOI0bZxFxSKwjjt/LTBKsu7fU3oCKmUnl8pUIZ0R05Se1U8sjyRbRKIrK7StADWOC1VRZISQgHt9Y=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=dToACV12
Subject: [Buildroot] [PATCH v1 3/5] configs/zynq_zc706_defconfig: bump to
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
Cc: martin.chabot@gmail.com, brandon.maier@collins.com, ju.o@free.fr,
 juju@cotds.org, michal.simek@amd.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynq_zc706_defconfig to xilinx-v2024.2 which includes
the following updates:

- Linux v6.6.40
- U-Boot v2024.01

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_zc706_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index 1c662cd566..f50511b822 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.2)/xlnx_rebase_v6.6_LTS_2024.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
@@ -21,7 +21,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.2)/xlnx_rebase_v2024.01_2024.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
