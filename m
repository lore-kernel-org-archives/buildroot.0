Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312CBC3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 06:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF31140C57;
	Fri,  9 Aug 2024 06:03:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A5j3kyp6p7_3; Fri,  9 Aug 2024 06:03:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C28B40C0B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C28B40C0B;
	Fri,  9 Aug 2024 06:03:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F8CD1BF282
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 06:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D5CD60E37
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 06:03:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EhE_wD3tSzJu for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 06:03:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f400:7e88::60c;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C398960E36
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C398960E36
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::60c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C398960E36
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 06:03:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s9KP7VVmo1X9oC4NZoNeqqYHkQF/8b6GBtkOfveDAOB/w1V3BvGVG0pQj0mTkTPOOX/uUYDEoh4wyrhTNeevylnKfLeCMCsU9vkOGSpvZRgy7oC0elvrQ94ORrwfJO2bKhu6PzeXpEW19RnB4/K5qJknYp7fTLU6KYe5RFDqKwb52cRUQYhBWwlmLYfR/H9MUAr3VwFfaugPPLayOdYjl1QenDZZwNwtS6j7Ms1aLNQR7tBxXJuCHpVrRXJa1Dr8aFPofRcFuZzEvB005EcQxSuSaqkibYsqmtC/zvfdyT3RNJs5KsYqEDmF+1+ajl13o0MDO8l2TgRpA8T41yW5UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZXqgFI68QPLRpDI9kyMW6z/KGU/JO25C/nBBxcfF9s=;
 b=AJNUuu5s7pT5wFo6ujpFiOqM6bPMXRhMwGnqKOnpVwgaXlKPybyktLf+UsVNuXpRj8lE6j6IlbF3WzXEgyr7KPXyg9jALtqmRLoxw/MmiNPvnECvjtf6/knwpd1tfKgfPLgpRREe4mKebSpsWZYnSXoIC90xWUvantBIv7QOjSStxUFkuKEr1+3YYlgrhtUlZdEDDlfU6qpqwGA+pw2oSkcFkkrpwYjpTAQ9c6s01xb61dqgx7W3rQFQCsrxlb9jOoJMd1fYahCVUKsE49NiN/xcx823Kt39YDXe3vt66GSTUI4Vw6yDKljBLoUaPy+DBt/S9Hlzv2jm3i/VjADacQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH0PR03CA0205.namprd03.prod.outlook.com (2603:10b6:610:e4::30)
 by SJ0PR12MB6927.namprd12.prod.outlook.com (2603:10b6:a03:483::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Fri, 9 Aug
 2024 06:03:43 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:e4:cafe::c4) by CH0PR03CA0205.outlook.office365.com
 (2603:10b6:610:e4::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31 via Frontend
 Transport; Fri, 9 Aug 2024 06:03:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Fri, 9 Aug 2024 06:03:42 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 Aug
 2024 01:03:41 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 9 Aug 2024 01:03:39 -0500
To: <buildroot@buildroot.org>, <brandon.maier@collins.com>
Date: Fri, 9 Aug 2024 07:03:36 +0100
Message-ID: <20240809060336.3326177-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|SJ0PR12MB6927:EE_
X-MS-Office365-Filtering-Correlation-Id: 659914e3-a92b-44fd-4862-08dcb839059d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PZAUWHH35GRygzodurTPZWxAETwS3j3RLrvDbOrRE1Q6NHbvTVrwZqqXBXfM?=
 =?us-ascii?Q?Z3YRA+/FTEA81waBUCqlSmutKq6A/yjGAL5yoy4W6FNpf8rQ5lxzKWpIoOmf?=
 =?us-ascii?Q?Kau3Bc5gySdMO43rVIHXcQLXtsvNgZ8RHWrE8So+twOJIXTJaTp+SmWsWUrC?=
 =?us-ascii?Q?BTtgDYRyB+Jq2yPWIK4DcSgVad4xpkDtd+hR0V3zjArj8sC8lkXzfLY7Pe49?=
 =?us-ascii?Q?kYcHSfWU3CBL1jINOnTaQ4Pl9Ak2rnqrRbusb7ijgl9oniIYkfaw4TStUBF8?=
 =?us-ascii?Q?K7nMwp1n6KURxHw0nE4uYD/40XFFekmeYiwTtHFfQXYmmI5MInlD77KrRFHz?=
 =?us-ascii?Q?DoIU2ogOI76XhYiyo/sXFd/hQYLpKDumn7Jnh64meJhhnP+Gb6ivOOc8EXun?=
 =?us-ascii?Q?g1BOKIvUvfBkeqeYPjMtOhIi/Fi1yq3pXNcE2MksuNd3OkKKrJxLRFNf44EQ?=
 =?us-ascii?Q?+VukWG+i94LsqJ1aBAzRn2Hi3y42jlEvmBV6p93VoCL91EyLfagxRVl/Msta?=
 =?us-ascii?Q?kEqrB7M6kshyfn8HTFAF1rAgiSGZwmOqJ4jQSm9d/ekBwsSpY43AGcokG4O9?=
 =?us-ascii?Q?iE2fdHtC75tAcAiq3gFbQ7Cw/E4TpUDkPZmfRkKjkvuAkZduw0Tzh459z6JJ?=
 =?us-ascii?Q?wlY0/84HQFMSfK1hBg/dFbh8WeWjrf5zmEWIgbSckcaXYtjKvtVbdPwQrTYM?=
 =?us-ascii?Q?arSp9chffrk1Q9WXdUmt3stYB/ElV1xv9CJMXIsk1MWUZAM4en0v2ltKFS1i?=
 =?us-ascii?Q?1dI8+GdshStZeLo4C2A7ieZYNrwH7Kwm20t+NDD5fHfJYVmd/Mw5ebxkMb8d?=
 =?us-ascii?Q?kYzOIpFI+IttXXJYpPo5hHsEdbp8yrXZI0pw7H3rs3v2orS+pateDiWtwE3s?=
 =?us-ascii?Q?KFgmGzEJLS8f/LgjxtpSZsny0WWLRtPN2S2tK4o0QhDWgqBoMSjP5XDIRMi6?=
 =?us-ascii?Q?vcwbT0cDy0+7tQ6ouMlVQ1x/F2Rytn1f0qDGzQQwO+93VjTb1y5Lpvk/XkC0?=
 =?us-ascii?Q?uBPNu4U22WSYrPrpIbzsc9IsRl4yGqAqRPvH4xB2XiVHLWd1t1t+swa+CbcX?=
 =?us-ascii?Q?IAk1yCdN/MXx42gPHxhJ4kpoe1R7pGJC5GQZbU2NaLQubGQArSiHtM1zJJmg?=
 =?us-ascii?Q?BmtJW+zxJVqKma79oe+ZGR5eCKE8VSqBC3svTb3Y9mW2Juth4PLXsCFMpbsj?=
 =?us-ascii?Q?9O5qqSmGBo+L3IdXb1WKc5bVN5SERTfvH5Rv/3IxRaxW6SzPjNUFHRqLShH/?=
 =?us-ascii?Q?W8S3qtmKsaQBCLpXI3O0CVyyyQxyArd29ShjscVODvKttBXm5KlEq/6rk0Pq?=
 =?us-ascii?Q?lJsAWcxfAvbPAnz8ayZFfuF65H9F0fVxCqjZnkamIHObK7Cl8iYCmLG75qgc?=
 =?us-ascii?Q?3SZsK0AOzzNvhuozMfErKHbQQVb8x8Sj5Q6NF20drynPlRU6r37k+y2/5g2c?=
 =?us-ascii?Q?2eR4eM207SRcLS9mpu9pOgJtjw1ITxHtORtPD7oVTZ6UCD5wfzn5n4JviiF6?=
 =?us-ascii?Q?hsByXOQE/o4h+fo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 06:03:42.5670 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 659914e3-a92b-44fd-4862-08dcb839059d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6927
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZXqgFI68QPLRpDI9kyMW6z/KGU/JO25C/nBBxcfF9s=;
 b=olgQfDTt56LZ5GB4/NTL58bAMEQRbCz4JWIdj8J9il1XqwNLXykNl0pdunCDPGLg+iByXdFGrJg1Dap3gwbjNZ9CNXCnRU9i1c7gs9EyRHBzdEXv0j73BXrMddnSn6evT2LUgOVS2iHqWHlokKMXcbVVquBe21WaqdqTQDVHWiM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=olgQfDTt
Subject: [Buildroot] [PATCH v1 1/1] configs/zynqmp_zcu106_defconfig: add ddr
 comment
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
Cc: luca.ceresoli@bootlin.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a comment to the zynqmp_zcu106_defconfig alerting users that the newer
version of the board has a different ddr memory requiring a different
psu_init_gpl.c file in u-boot.

Users with zcu106 boards with the updated ddr memory need to use the following
config:
BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-rev1.0"

The issue is documented here:
https://support.xilinx.com/s/article/71961?language=en_US

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_zcu106_defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index c10ec70ed8..6491f49d71 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -23,6 +23,12 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
+# The original DDR memory that was used with the zcu106 revA is obsolete.
+# Newer boards with the replacement DDR memory need to use the following
+# u-boot device tree:
+# BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-rev1.0"
+# For more information:
+# https://support.xilinx.com/s/article/71961?language=en_US
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-revA"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
