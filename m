Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA012CE9D71
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 15:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 915EA60B90;
	Tue,  6 Jan 2026 15:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qAne9ED-NECu; Tue,  6 Jan 2026 15:56:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBA7A607DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767715007;
	bh=whL4wDLq05mVD+5xDpzzG3Mfv0XjRpOaaCSTqYNEHmc=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=pp0XwH/XHQOx8hG1U8x+ur6myiKTlfr0ks4fs9hwymiJAQpy+goDzG6uSQvOEJGgX
	 maNIuBSP8oYQroiLziTTz/7w3mKfiOiEXAqIKumGTHgHhaC3erneHisSky4dKyFwwC
	 M2y0Kt4L3G2Aq4EgPyjX3aPWYFz0LpV1uf7vz5kgJYrupD8v4HTcmidjXzOFs4uLnv
	 +SYCAliu72V15GYXkVAr1c+wokAIVq7OGwFTYiPb+5O23r8uP5BzSFMO0zx2hMQKXT
	 jG7zME4dbjjtc/meVKsmJLMkk4LtCGvJOj4cH7bAU0673hK64mNGbfLCSyBPgWQ2+D
	 1k+yjW1K70cKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBA7A607DD;
	Tue,  6 Jan 2026 15:56:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 44FB2E7
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 15:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3728640417
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 15:56:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J2YZmBCGmksZ for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 15:56:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c105::7;
 helo=ch4pr04cu002.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 192E240060
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 192E240060
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c105::7])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 192E240060
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 15:56:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FVIijNnbL0H1UfXnRiWqPl5dcwlYHe0uY5Zkkm6XPc7uTqwDxpZEmC7zqBWkqqwp3Wu42A8sLerwni1X2lXpXa0AZggguMqihotpy8Yen29rU2Smr4+m9whZxQqOVEb+JutNdFbx47GGKqcBBlF7dz/ftjRWVl+FXGi6zsoz4ohwdWOGFuKgisYLohEtIbr67uNCeu5Qad+HhO+iOIUsiJjyhYq0b4WP76EtiO6Dcq1NVzGtO5VOgTp3UNcqhutkrt5d6C923oVSBTp5bXlJMBdWWlx8Km3NQrz+CLZUyWMYyPMuaoVh1DGD8dVoVm1KduPyabOYCHYpKm2GQBKoyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUfqG9Mcs4MpO+NEjWtsEmRYOIhx+Fz9gJ5PMlktSLA=;
 b=ky7V3WQde+TZPmfe+oMOQAp+GBKHVxaKWC5LuwxjorQbYtK8MtKg4dUPKyXrqqTCoe6T6RKJDu/1IWHaIOh0xAsUVY4y11sry4qOaRccA7LOPSmXTGi0hmR+6CfXMjnCvD5K67fnFh/DbJ1ocFvSeyKJAiPnzgC40+s1cnj2AOrvyZHaS9zT3YJPfVjC5mQJt3oZPEzzcy14Dkd6Ix39JD8PlTJh8Lm7VhbFpA6oEqoXzT1cwvZVPojPNS9sVu5rkWefuPMwaQvZnFT7i3jBGs5ieqFzCRIYFEi8Qq6wqcf7pXpfDRWAXi8kN7kaylAWQKAx9Spo6vR6qkaRpWDOrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR04CA0065.namprd04.prod.outlook.com (2603:10b6:303:6b::10)
 by MN2PR12MB4175.namprd12.prod.outlook.com (2603:10b6:208:1d3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 15:56:42 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:303:6b:cafe::be) by MW4PR04CA0065.outlook.office365.com
 (2603:10b6:303:6b::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Tue, 6
 Jan 2026 15:56:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 15:56:40 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 6 Jan
 2026 09:56:40 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 6 Jan 2026 07:56:38 -0800
To: <buildroot@buildroot.org>
Date: Tue, 6 Jan 2026 15:56:28 +0000
Message-ID: <20260106155630.2404514-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260106155630.2404514-1-neal.frager@amd.com>
References: <20260106155630.2404514-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|MN2PR12MB4175:EE_
X-MS-Office365-Filtering-Correlation-Id: 7adedc1f-bb11-4e30-504f-08de4d3c2ea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|82310400026|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WTt6EjK0lFfeeHiGIttR5NZzKDGh62XqJypNRsBelbC6u8WsGTfJ3dWt6rNP?=
 =?us-ascii?Q?DTc8UVTYR3vMJaIRckjv/BLiwq1OFIxQlWCQB8cMUVw5tvc3z6UrTeKDr6/u?=
 =?us-ascii?Q?aFXyCJbkP4yVw07XoX6ZcgbHVxLtqQqToHN69Xeu7VCUTUiNBUcpy2EW1r0r?=
 =?us-ascii?Q?bW4mBZLt0lQbyMJMUDxCgMmQp3xn9BVBoygXiuybWGkMA6MDHVTgQXHMzqpc?=
 =?us-ascii?Q?rudkeNRkIIEVAuttkHgsnjkpQCtggtfGiYBWL9VTP+KXCr0stWm9ruLEGAUS?=
 =?us-ascii?Q?QjgaUBRw7MdQnOVMxyypg0QNR4pFJfxQWxc5MgZGv9PUaWVijRAfEwCPGCkQ?=
 =?us-ascii?Q?m/ycge88Q1dO3FL404hvs+7nNRQ/8t2iZQAFEiS0yaV+hxQE3Fl71LlVHKJu?=
 =?us-ascii?Q?WB6m8olMv2j1FEaLt01ZMtCdBWaH7fkg8sCA9D9LSXsLjzO66R2TxbzEf5PD?=
 =?us-ascii?Q?e1HoHRxcliZwUb1TQiEcCI1TKdxqdfax6ZtQ9nJcIRYeGfVzxVJUjWSSqUBZ?=
 =?us-ascii?Q?YSNpMT2VY4+JDTflBeEeR2vlPkZEaWhG/i+9PNRA/dNAYfwzM+UG9bMgUxcV?=
 =?us-ascii?Q?NAtLnh0Adi2xa38xUUtGCz4okoGUOYsuVR7NAzaqKFpW6avL/++L1RPh5W7n?=
 =?us-ascii?Q?hbG/bMgO2oV3s+3YSM0bO5NbyS1+YR8185owh594tx8ZfssMssArSir8JFas?=
 =?us-ascii?Q?ge2fazvnHUia5z8OU6UxdkSEZB5jm1thEwPmrGty7IkxxJEx5LzNnfM+AOLg?=
 =?us-ascii?Q?pmIqCOM3YZB19N4o13GF2f30Jo5FSy0ulcdUdj2efaoC0KGbWnELXDu0U81+?=
 =?us-ascii?Q?oHt//+wC8jia8Zwdpr6IZmCsDbO8OBryM282Pbj3qQqxE/vZBFNp98xqlIeQ?=
 =?us-ascii?Q?2TyzK76SFoBrXgQ0TrxPsIJ7O08IVzh54d/2l8mrEkgbJVTtiL1oMVMyfOLE?=
 =?us-ascii?Q?zMFd3kBE80oS4MY3BVXjcmWVQ+ZmZmK51G1sGrKjBgzpbSnG4shDkvdXF6gg?=
 =?us-ascii?Q?80CT9zol1R3jh9gkS5dlKxyVj0TmV4ko1hhZYPMU4vAicbFJ8I3M6TxcRdod?=
 =?us-ascii?Q?nJBWl/VufYjmmdKAOk5t4iWP+n+b7YD/q9dZDn0Ep2np4ZWw6yjo5e7DmItB?=
 =?us-ascii?Q?TfnaqMnMcfLlE4pH4hlAcSFyd92gHWLQ8sbonfQ0HFYU65S1WH/w5OoVhS2K?=
 =?us-ascii?Q?LLH9MAmTs50i75GYi18FyXrbza8d+JWQcY0PT8+WFOefLuWnLTimt5rKWsQV?=
 =?us-ascii?Q?7ultfAERVZvt2yvLERaMP1doS49WPALYswm8aG7rEx21eq11Rcd0NyaoFSUy?=
 =?us-ascii?Q?rmyED6vlNUB4MsACryo0mxzzhUAl10DERbnYsQhaCRj84WWxupAGgDuTLE4R?=
 =?us-ascii?Q?6wFtuhh7TW1rWD3oaQNSY6/0QtbR4xFGOCxBY55q8aPSCXUJxwAQJM+olsSp?=
 =?us-ascii?Q?qhviaA8y5S66kdXG04/2T9H0FMfgjjmqNpUWTByCXZVlgB7RyimDPgiRrcPH?=
 =?us-ascii?Q?sXx3ppTECLPytOp8WvJ+C1ysb9F4k+xdFkvyq5n/L3iBYVBgqyOYGhmDRINi?=
 =?us-ascii?Q?mQo8ifFLcxga8SO+CICLHxar3kPZ3tk3vweHKB6f?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(82310400026)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 15:56:40.8043 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7adedc1f-bb11-4e30-504f-08de4d3c2ea9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4175
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUfqG9Mcs4MpO+NEjWtsEmRYOIhx+Fz9gJ5PMlktSLA=;
 b=QiYkqBlEYlfgbF+hUMzcIwXVBhfWEWObCHEHOMyiSxz4qbcQ7r4ZFcbuyFaJPOWjWhU9M8sjBuxEfE3A1TIOX92VLydbdxo2aWiuWi0FEdQIa5bvkgXALLG1z4hpsGi48GGPSEKXUiOVMmr4yfhhOjVvEQjeHnbykhQN9U2TnYQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=QiYkqBlE
Subject: [Buildroot] [PATCH v1 2/4] configs/zynq_*: bump to Linux 6.12.60
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
 yann.morin@orange.com, brandon.maier@collins.com, ju.o@free.fr,
 Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump the zynq defconfigs to Linux 6.12.60.

Run-tested on a zc702 evaluation board.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_microzed_defconfig | 2 +-
 configs/zynq_zc702_defconfig    | 2 +-
 configs/zynq_zc706_defconfig    | 2 +-
 configs/zynq_zed_defconfig      | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index d50e1ab818..f307614337 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.2)/xlnx_rebase_v6.12_LTS_2025.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
index a4afb61faa..5056d96441 100644
--- a/configs/zynq_zc702_defconfig
+++ b/configs/zynq_zc702_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.2)/xlnx_rebase_v6.12_LTS_2025.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index 4f15fef813..8ec71a2716 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.2)/xlnx_rebase_v6.12_LTS_2025.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index c08dabadd4..bf9fd40e33 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.2)/xlnx_rebase_v6.12_LTS_2025.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
