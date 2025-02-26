Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF91C021B8
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 15:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3948610BE;
	Wed, 26 Feb 2025 15:13:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NF_VETmUjIMb; Wed, 26 Feb 2025 15:13:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8D3D610B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8D3D610B8;
	Wed, 26 Feb 2025 15:13:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B1BBA94F
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 15:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A89F04129B
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 15:13:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DFoULuevzlgl for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 15:13:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::609;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C2C5441294
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2C5441294
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::609])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C2C5441294
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 15:13:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3/GAtlTQBLEfmkJT1MMfm3gyw6480vRxBuzazW3tUgbwr8UFQDiElcTCJB91HHltRc8S1M64hk0o27/y6gEm2gw5VbH6fCsObuJ1MoGTanyhPfGNkA7GaBYyD3UFAzfY7UBx0Cl4cx1VYd76JHaOYa1t8lHGppGAguM9pzXp4pMyu1OENAFMNpar5HncE6K9oPwmVJELBpNYasxsgoxIoF/lvXIdEJ8PK4kIelUwSn7MqBbO/mZk5KO+2m6dYYO2d+zZKdzI/JUQcobo72c/qsWhG6y2GaGWb9YF9vj7q4q1AMnFBERTHaqVKcgF6+HajLvPulczstbuQ2z2fkgTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kyd830oAroSPsccrqOml7DW3h+rZIPzJR/ybKoB18E8=;
 b=huvZ6Qr9jHYkZgvGh8bK9S/REvBzcYsx1bejl8XmOtjWtq4SRKPW0nEPaqesb1NZYFZQ9/SvbXcempBY8gD9dQOpT/YGN02SFlyDbPlZaKRw6tVyEeO3f3TANgyuiAWd51hvd1QLfWcyj1xz6II5HfFF7LA6FauaySLnkAQgSV63QuUey8XA8BGFhJPin52Raez/ilVn6Hwnbzq/Ey0xYJozH+TBKHuKruaOQI0QdtadyNBIFSRm1Bq6Vz1bqWRHaoPymQwATyR2yCdMknBpkxTDcrxAJsvjUwkkvsgzLDTyYtOtNDmMBHg/FFjfLHLguOLtVV+9EaPDE//WctT3Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BYAPR02CA0006.namprd02.prod.outlook.com (2603:10b6:a02:ee::19)
 by SJ2PR12MB8881.namprd12.prod.outlook.com (2603:10b6:a03:546::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Wed, 26 Feb
 2025 15:13:23 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a02:ee:cafe::99) by BYAPR02CA0006.outlook.office365.com
 (2603:10b6:a02:ee::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.21 via Frontend Transport; Wed,
 26 Feb 2025 15:13:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Wed, 26 Feb 2025 15:13:23 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 09:13:21 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 26 Feb 2025 09:13:20 -0600
To: <buildroot@buildroot.org>
Date: Wed, 26 Feb 2025 15:13:13 +0000
Message-ID: <20250226151315.2537267-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|SJ2PR12MB8881:EE_
X-MS-Office365-Filtering-Correlation-Id: f2fadbb0-accc-4aa4-a2ca-08dd56781ca0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Jr24jlRztDO/lmkyTtqRCNvb5Qyzon3lzpmYnHbuhCQZw0o8WqiZM1wc28F/?=
 =?us-ascii?Q?nn6R4n+9XGnkznQwtQGxjgOTb7B97SiT1JD89NSrM1pIWxAo26kRUi5sHssY?=
 =?us-ascii?Q?JQpiAlRimxI3FkYmDDUuMf3sq7nZN4AYRXC5TydKvSahIEg5fuW3+I+ZWeb3?=
 =?us-ascii?Q?5UdWYlrMWEDj07c6wFvVHxDeTYqlt0M6QyrJP8ofIdf5tbDz7c8o7rqxU1/b?=
 =?us-ascii?Q?0kWjSu7S3KYtNtww9ZITGwm+g3s9lScu/sH1OGG2tDptL9yiHdffcO1ckYNs?=
 =?us-ascii?Q?ECIvlBtzgl38Wec9xp55XLTx6ewvrwgmoKPEZvLWbQqsrYvM1puJq+VI6zF/?=
 =?us-ascii?Q?gWMmnP/mnwdCDdOcf3xodS0IoZCtD2Xujd502vOAaUHLPO7HvjRIQR/VLiKU?=
 =?us-ascii?Q?FhbgswzybnC5UsjyOjcwsrX/PmCOmIJLCoNXn0L9dKWwP9nwyn2U2NstN182?=
 =?us-ascii?Q?7QG0wZFlZv/1Wb/Sw2sKMAvUXbc4qmWNJWeHO7k7oN5JEO0Pw3gGUAOYeA9Y?=
 =?us-ascii?Q?j61nWiqaJnvrxW5DjK1XnTl7rbBhKBAn4uV7PUMAy0BqlDY9NinFpyUEkYUs?=
 =?us-ascii?Q?M5a+RVXeIeb4L4WgHKRvuaLjUibVnXtb82EuokbSnCcFCrBMztrOmofvg01b?=
 =?us-ascii?Q?kfSQnlPIs7+xGED4NVsJljbTDoqyGYRnUTq5MZD7aftrsRyp277wwWT90C49?=
 =?us-ascii?Q?cQYfx3yQb5IYIpiLKzISPPzrh7mkVq2vFWQbLeJqA7ClOrfGwGeH7UvB9mIa?=
 =?us-ascii?Q?qzUn9KPEqWWyFGJvmqIaStw50G0+hARMs3DAck1/5elClnzTHEoi/x20ViYd?=
 =?us-ascii?Q?ic2NpNro9JkzVaqhaHGY6zOwme65vA7PKiVXcUicmiZyijW3pilk90FgxBNJ?=
 =?us-ascii?Q?Wi00X4U0RLBwbdFzCUdtlx8RHzH9YmJxYpIMd8EKk8CXQAErtzSNFzEq3A2a?=
 =?us-ascii?Q?ZIICgl4fDuICe4C85o3+jivsDq2bhwP0ynG/wT/pbOCnH50XJ5b8kiNdfyQn?=
 =?us-ascii?Q?BFibXPPgJ/FcszPg24ZuW2fcNyvkqhp4wb1RyMrZxXNjejuiSlVB77miuZGk?=
 =?us-ascii?Q?IRJ6iASfg+qevNQ2RYLKJVT1uLxAxv/4JEBK1a1pzIMbzZUyAXlFF5ETyWto?=
 =?us-ascii?Q?AGFZuoh20v0gOsDUHMx+taceRYH+D5wvJIXPSigQeaxLwKJ2L68G530bB7xE?=
 =?us-ascii?Q?eSXDbFh1iaj4kEnYT5qv79UcW022dAFxYHH3TX1X5m11xBeLYOBLmmwY+ZgP?=
 =?us-ascii?Q?Lj8UVFRrPAxrA+JBCXsWJWM0/e5+o9PxDFS/NFmJKHIyeU6m8ZZfuDFEI4DK?=
 =?us-ascii?Q?yQ3mWNNYs1ih/F/yclegGYI1dMP8GzTAehPYDL7/bohPNuKTMw5/dOQ+fd7T?=
 =?us-ascii?Q?QfmYPqFeJGOhlOY2osuhV5AK2JuLUTu3dG9b9ELHY8MpOb109khl4u0RNxXo?=
 =?us-ascii?Q?6JDwOVXlA2YAlOsnjyOEBSfbgPjBS0d2dGf1LeduoWtOcZfwIdHl9NIefiVf?=
 =?us-ascii?Q?P3WUiyL2LDpVKo/kAGFeUW/vwec6bVOXB4rO?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:13:23.1269 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2fadbb0-accc-4aa4-a2ca-08dd56781ca0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8881
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kyd830oAroSPsccrqOml7DW3h+rZIPzJR/ybKoB18E8=;
 b=1Vs9fy3eNmlKM3eh/Qf0ReuG5MzdNysRhGpqcAE3xjTvEH6uxZS4SaiEwFimxCYWFJesATmNyDFiOnj97xu87aChdrz4Lv3QiBVEuwcmBFss3oenoHo1Wj/+8nGsB7NNxSy6ZbPKEADdnXTt6uxIIEF5A83eFqROmDOSOccqxe8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=1Vs9fy3e
Subject: [Buildroot] [PATCH v1 1/3] configs/zynqmp_kria_kd240_defconfig:
 bump to Linux 6.6.70
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

This patch bumps the zynqmp_kria_kd240_defconfig to Linux kernel 6.6.70.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_kria_kd240_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 85ef7d5aa2..261b73d6cf 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.60)/xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.70)/xlnx_rebase_v6.6_LTS_merge_6.6.70.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k24-revA-sck-kd-g-revA"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
