Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB73C71157
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 14:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00F14608F6;
	Tue, 17 Jun 2025 14:15:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Py08sD9C1NVv; Tue, 17 Jun 2025 14:15:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 259C860D7F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 259C860D7F;
	Tue, 17 Jun 2025 14:15:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DB3416B
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 14:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C0F960DA6
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 14:15:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qw2iDrrs2268 for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 14:15:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::626;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 381B0608F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 381B0608F6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::626])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 381B0608F6
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 14:15:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qh2/WHu6v55f5n/zaEbJKMlUjHadTE76TML9ulpTQ8ze42zo/mXAxlF9b/qAiJhUv4I5LxkDMQtyF01PVM91z4y8pc8I6Tt2SOVGd/hcflitYZRVeNWQFBZWFdXazTvQWYZH9VpqG5HLRE7pfePEsYd64L7f9TxslzsKPjAIMfmbKYfNQcPI9Y2HNSkf64dl/Y4CeI04uthEiIRwRc0lLcvEcsKDlYD0fRrnCUFaEG65XTjEdFdkA7Kf3YWQLh/ysdTNYz6f9t0jYMU9P2QyKa9ad/MUOPv5PyZBsiTH3lLC1SXSvwF1TCmSfujuBh+axOd9gMjDm6VMhheNhPi84Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dbniWLbi/FGZwzx72lS5V8clLJPbtm1+a8wLDGvR7JE=;
 b=pntNMt9TRux/2tXxSA8b7254OpazkFy7ZmfA1hzNiEGjl5g5Oz2dFUgI3k33q/DGR7SM1AsdnrPan0yPiDoNnHj4fXygYIVRTPajf94A6lQ+QxRyOlibqe1Qh+PCcSoeaJwCVXnsSyG+daD2YFFWP469JsSuNPu4qHnQVs5b48as+trNDhzhXFn3mDHAIDlHRzEf+IYoBIMmhOzKMKM+3GbgNrNAdX39N1EA5Lu174mAQljC9ODbArRtQqIsNUqQQjbQJTUUuRnRjGXFcC0a0BMoYA+e7aFsCIyvAcV28hIPYIkIN3nrnevGXekOsD/byVJtOLQXKaTmWDkoJ4uM/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH3P221CA0016.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::8)
 by LV3PR12MB9402.namprd12.prod.outlook.com (2603:10b6:408:213::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 14:15:42 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:1e7:cafe::20) by CH3P221CA0016.outlook.office365.com
 (2603:10b6:610:1e7::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.17 via Frontend Transport; Tue,
 17 Jun 2025 14:15:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 14:15:41 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 09:15:40 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 09:15:40 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 17 Jun 2025 09:15:38 -0500
To: <buildroot@buildroot.org>
Date: Tue, 17 Jun 2025 15:15:33 +0100
Message-ID: <20250617141534.2074877-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|LV3PR12MB9402:EE_
X-MS-Office365-Filtering-Correlation-Id: 50d61f91-14d2-4d04-2489-08ddada970e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y9az4yqOCKZ/6lRIYFyoixji/sVirvF72ANDq2wq+DpTKnUGV+QybKVIv4Qc?=
 =?us-ascii?Q?Hd3JiJWEh7YPke/MH53JxyjdkAvZqOZyuFEXk+Weget8tN0tM70T+XUf56gm?=
 =?us-ascii?Q?2Fpazop0jxf0QHl40XJNBJjH3c0lQMNJjv4oo4Ehis88zhWHN/gRvAiuBq5X?=
 =?us-ascii?Q?q8V7e3kpAlqztlQ/eIbOjFtdU6IiDRSmgvVcPhMExJE/TQOnbzMScktfuNsZ?=
 =?us-ascii?Q?mkQXBo13YxZfcHGcrRUPMTidsiFMvr4KBv+bbB+OikBhqAKTNezrDbiiF5nl?=
 =?us-ascii?Q?p1cubzqGSlGAxTM6vEVYS1iWT1VtDUQNDTBl7kbo8bFtFojhIIjtyysuPV20?=
 =?us-ascii?Q?JPc6eBq2WtxHo6O1Scq/xQ9bHCCFeQyTbegqt7/5v9EX6G49z6eq9g0zdoDr?=
 =?us-ascii?Q?0dj+ZO0gZCWoh7uVVr67yLfJnuNRDymNJBpPb2+/dnpV8d69Qcv5Y3/Ui1jg?=
 =?us-ascii?Q?NmPyUDE54RCXwkc8jyJPYOvSCBBj+K6NSrw2xSNZHItMqLPXzRagWbO77AjX?=
 =?us-ascii?Q?/U9buNvOGEUqXlfogRGXxTBV62dy0HA5ynvQJJJVDZiGwLX4q6fToc+0Y+Zj?=
 =?us-ascii?Q?eTty8yRIu4YII0jDUOu9YwvScIAcl2c5ysmqWvCef2sIGfe1hEQ6ZCKYHamy?=
 =?us-ascii?Q?FXhoJ4nwyvxMphsZbqymRk1QJwO9zn37qLNmFXHGr2xuwlb+FIHmVjBXPD1+?=
 =?us-ascii?Q?HQqfKwUgYtnQ2wn+v54JKJz+DBq0lLvD7TqxpJvIdwNelc09VYibfPuBgHmF?=
 =?us-ascii?Q?CgHUDB9ILXL8tbHRuDrRVqntoI9C9gGOs7e5nT/tcWr6J+9nqZYj698W9lgC?=
 =?us-ascii?Q?2qrFUhvKX5wXoUEddnBc0zaKV3kyxasBmde3soLl/H8L+Lk412tMTyIf4Haq?=
 =?us-ascii?Q?ybuWedTCGCiOGhc8Be9JC3dTVUpYYqohoM4iQHeV/fL4hsb5vy6SnjO1urq3?=
 =?us-ascii?Q?oLWbIanFsemAnFXanWY8HO5lRYYSo7xa6PDuAvu1QeA8tnLOMAGXYY/MVgAC?=
 =?us-ascii?Q?cyOD87cVT0d3SZpGsON5BjUk620YxcVf0BN3Ot9o5ZOUowuPraOtsHbvTdV3?=
 =?us-ascii?Q?0bDFCEOJ3gwQwYChGNX6PxcrQ8U3tpKF8IpqRJPwoAcvdA5aWA8Ho7nh4CDD?=
 =?us-ascii?Q?05V8qAcgFIz53SA1sgA7CwNHZy3H+3AoF63jdbITrJ1DVjt8IGCB3cqhISRI?=
 =?us-ascii?Q?2k2sE67ME4NnOTR6Y4Pv+kYlx0aC9UII6K2kRPjJzCh9LA4VnWwGNCXxTewh?=
 =?us-ascii?Q?qarFtYhNrcXYVmEcoWub7ulTcxfp8HpEZSKElavqwHlKy6WW39abUqJmWQP7?=
 =?us-ascii?Q?t8azgbVazPde24Jw4BGEQb+LDUw/y6vY9NwIL/4A97OTIunXLu6FEI5OeSgo?=
 =?us-ascii?Q?NOMbsccjyul4cBrpuiAciUCKZb5TiWzqtGaUz4wo1blAJNOCHGs7Pq+JTuf0?=
 =?us-ascii?Q?uYycrLjUyp+iXpzVlZ+wGZFWCUCHUaAejXZ7VEGkFuWvY8M9nwylvLHOs/PJ?=
 =?us-ascii?Q?tIRUEAKNF7LcKrS6e0zmcty9YxCdEy9KyfOdQVgz8e9tar+XLRMbC9FSsACL?=
 =?us-ascii?Q?UnaRadWMpVBbvjQ/bj4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 14:15:41.1332 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50d61f91-14d2-4d04-2489-08ddada970e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9402
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dbniWLbi/FGZwzx72lS5V8clLJPbtm1+a8wLDGvR7JE=;
 b=wrFd6uufb7zUFQ3/zqwo4mr3pj0ejIImQRkIcDy80D3m/X5aqvClD2v0TEr9KNvITbH1b2H4eETMXZYHy6N4zjhFnjdPPSmZl8ujigoiUa3HUOJ4qMqNk27F1xl12enlbw4Kr0UnzADcfJlje7/RTatjUd/jywCo5JXo3kNrWi8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=wrFd6uuf
Subject: [Buildroot] [PATCH v2 1/2] board/zynq: update custom board
 documentation
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
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The readme.txt file for zynq boards has some outdated information for the
custom board section.  The custom ps7_init_gpl.c is now defined by
CONFIG_XILINX_PS_INIT_FILE and Buildroot always puts the Xilinx u-boot builds
in the output/build/uboot-custom directory.

This patch updates the instructions in the readme.txt file accordingly.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- no changes
---
 board/zynq/readme.txt | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/zynq/readme.txt b/board/zynq/readme.txt
index b2a4cefedd..87df7236f0 100644
--- a/board/zynq/readme.txt
+++ b/board/zynq/readme.txt
@@ -62,7 +62,7 @@ the U-Boot source tree. Without those files, boot.bin will be built
 successfully but it will not be functional at all. Those files are
 output from the Xilinx tools, but for convenience, U-Boot includes the
 default ps7_init_gpl.c/h of popular boards. Those files may need to be
-updated for any programmable logic customizations which impact
+updated for any programmable logic or DDR customizations which impact
 ps7_init (clock/pin setup & mapping/AXI bridge setup/etc). See
 board/xilinx/zynq/ directory of U-Boot for natively supported ps7_init
 files. If the ps7_init files for your board are not found in U-Boot,
@@ -72,13 +72,13 @@ you need to add them by yourself.
     make zynq_zed_defconfig
 
 2) make uboot-menuconfig
-    Visit the following menu and enable CONFIG_ZYNQ_CUSTOM_INIT.
+    Visit the following menu and enable CONFIG_XILINX_PS_INIT_FILE
 
     ARM architecture  --->
-       [*] Use custom ps7_init provided by Xilinx tool
+       [*] Zynq/ZynqMP PS init file(s) location
 
-3) Copy ps7_init_gpl.c/h generated by the Xilinx tools into
-   output/build/uboot-xilinx-<pkg version>/board/xilinx/zynq/custom_hw_platform/
+3) Copy ps7_init_gpl.c/h generated by the Xilinx Vivado tools into
+   output/build/uboot-custom/board/xilinx/zynq/custom_hw_platform/
 
 4) make
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
