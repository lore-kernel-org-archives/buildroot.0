Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738DDC3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 05:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A454260775;
	Mon, 12 Aug 2024 05:21:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vRIuAFvLix8x; Mon, 12 Aug 2024 05:21:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FE806076D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FE806076D;
	Mon, 12 Aug 2024 05:21:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0C9BA1BF2B5
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 05:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB24B6076D
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 05:21:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3-f69IL9_7qf for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 05:21:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::62c;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3CCBA6065C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CCBA6065C
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3CCBA6065C
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 05:21:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sOhoBZ+GV+/dGbQy0UiFZEyQsrm2LzGb3hevg2IE7RTVBMX8oO8takHexv3o7DbFHolUiCZVytGdXolw+i/mIJ0Qd3Au83iU9qSjsJrNobaAO7AO+xSsmgv1OljZCTBnJRFoi5jlZ4tGquTkcP5L5GK7l2dXDVPvB4b/5HAOawBFZAlKu4BeM0tIK7DHc4nQ0kexKGjm6tMPM9p3RZVi+cCVRTdIwrQPBTG3NuEOIRU6Q4KTng89XhXTdAiTp2doYbrukeTWxkHt4+IiWayC0sg4D0mBtfZJ3ACkAS9uc4SWfm39rHPk+4na+RDukBtycVELAGq4p4UHrUcjhpkV8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WeZHq+pQ/5Es4cjw0rW5ivSG8sQOreqlexF/G/nqvk=;
 b=muWV2XlaSEA85uD5loBwR8rvQODuwL3E5u3kMqeIDd1h6LYXjvNLfepxx/pmnGT8uqQxHGnq9340MGIAM7mCGl4zZacvskmPjqaAPHyiWZnn94aWaVUDLVMpLkEanRe91z+YHefyz/1Bt81NTZZ7nbkQC8+ppDfVNs6BJT2NIeCaf8EkZS+jjh64LAdDPJr4fo8Bkfhjv5vWmMjhNaqctYeHTljHRDSA494aZF/dEem3yAZxZJFXi2dVO1h3VhiIkHD5GH7v5OvbKzA8tt+9C4+MEnzT8OyLOq/0OXPkHZZH7eNO7X949ICFhaIJPg0M+9GtxgiWl+x9kzB96X/JEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH2PR20CA0001.namprd20.prod.outlook.com (2603:10b6:610:58::11)
 by DM4PR12MB8524.namprd12.prod.outlook.com (2603:10b6:8:18d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 05:21:12 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:58:cafe::6f) by CH2PR20CA0001.outlook.office365.com
 (2603:10b6:610:58::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20 via Frontend
 Transport; Mon, 12 Aug 2024 05:21:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 12 Aug 2024 05:21:11 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 Aug
 2024 00:21:10 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 12 Aug 2024 00:21:09 -0500
To: <buildroot@buildroot.org>
Date: Mon, 12 Aug 2024 06:21:01 +0100
Message-ID: <20240812052101.2920141-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|DM4PR12MB8524:EE_
X-MS-Office365-Filtering-Correlation-Id: ff02e4cc-8409-46a1-0fc0-08dcba8e944e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S/Alo6wbLSJJeXojQM8k5QFrI+ERM9fznzRQQieUHKoN1fFtWi1FjIYaAs8c?=
 =?us-ascii?Q?EOstAC+q2OaZqpFhTte0HlE0L8wWJAj0OGE3MDxBemN8KgLPpaSsPU4PXzF+?=
 =?us-ascii?Q?1mcyyvkj2UWoqJDcZW5NszHrSUJ1vJs9EA0ZD9z3yucDiumrI4rrpMeMkIet?=
 =?us-ascii?Q?fERM9MPw77O8FZHVklyOjmW/r5r64KeHmZyReDoxNUaw1eRUDNOBiD81093+?=
 =?us-ascii?Q?/idQJYPCD6zmop4+ZFXbEz/0njWpGjIxhoooXfyS2Il0OUfnYTeG8v/bnSr0?=
 =?us-ascii?Q?EfhGfcEL4Ghsvul7hX786CHH2LpWqL7WndkAzJ1ayYS+gJTsZXIcKqAYhiFA?=
 =?us-ascii?Q?/GR1rwa5dBtT69vZqhP7bHf3iY3OHuPhvabyzgDrgff4rX4GaszL3cbl3S0V?=
 =?us-ascii?Q?kirs+mqu/0N9UeXiRKg+YFyqaAy+9UnN9I/Pc3y5nYpk3CZJV+C02AGqCeWU?=
 =?us-ascii?Q?aL4SxCvBkXOdNZcIlh748Wi7yuHA0bDACoxakEK+nWx7obvA7P8BuNaM+E0C?=
 =?us-ascii?Q?GYcOCcQO5dsw8EOqZzBbv0scYXjg0HrHAntY6yw5tPpMbaDVkg6QRYlBCXm/?=
 =?us-ascii?Q?uD1O4znNmtdZ8kR2WKrBnSwzYVTo/bSNi3ufmCuh8U4p33XO8CvDA03qn36U?=
 =?us-ascii?Q?YcaI/87P1WlX/JWR3iNLVz7y5kmg4DBxTAHQtzE1e8JsEYnGZ4nKCR10FfYx?=
 =?us-ascii?Q?PomHVTvwXqgZAlWd+SVctQ/onW3z7GZK6jTgMaSB/bkdJbrL6s9Trp5IRaCu?=
 =?us-ascii?Q?bWFgUaAX5Sw9JNvMm54sDYnRjz83VJVtNi+Ay9R9tSfSnXDzXvc6q0QiacEc?=
 =?us-ascii?Q?nlr4z1Dq3p11aKZl0aCI/ZBEQkJdff9UcHVeYthywTIUx+2Jcgf62eYsQjrn?=
 =?us-ascii?Q?91H1esr0ESpJAQ/Do+Ot0Ls8yPtecwOxKIyIPfsOWbksmtAbB14BsYqJqmNU?=
 =?us-ascii?Q?lEGUDpAOsiuAkV72j49THtNYiKSHzF/wQZDM8J9AalwBwa1UsDGV4hAEsaZC?=
 =?us-ascii?Q?lDwh4bbex7VJTafvVUwyM7J7AWovZfJPFmdM3jdd0s8vBXqQx+Eu32f5SnyI?=
 =?us-ascii?Q?sKqou+I9NyCt7jk0dt6ZobLkbcnIhfFiTcMmtTERNww1Ytpw2iOu69tJG/tx?=
 =?us-ascii?Q?i50MzrFoiuYBWsnMHnZ9qVQZyYXVsUhc8Yz7qWBcHOQjHbA3rpShgjngJcaU?=
 =?us-ascii?Q?w9w/rymfGHz5RPELi8bwTqz6ZSPQfbdDbxTEJGWit2LUwWgjkbSR694sOMZ0?=
 =?us-ascii?Q?z/+0QSfLnHXiZQCOdX8IJA1UUhgY1SwE3XrmRihYJ0w9Dd6/LDFOptMVB3ny?=
 =?us-ascii?Q?t25HGZzlXsca+90OQV7ZAY3Pt9tJG19RtFG0QX17j8pL8X9dzEPHu5ivdYSb?=
 =?us-ascii?Q?DI8leZYSYO9L9lbb7fSgpKRLDMXxk2IoOgUSdm2KgCd9/GRPJr0Tv25dol/6?=
 =?us-ascii?Q?kvjpx3GTbfTOO7cMBeeXyDNffhGB4+38?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 05:21:11.5096 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff02e4cc-8409-46a1-0fc0-08dcba8e944e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8524
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WeZHq+pQ/5Es4cjw0rW5ivSG8sQOreqlexF/G/nqvk=;
 b=rYHSzr1SEqb3sIu5vesYqmIGJi/894ZSWM1N+4aTsFzpcL4JZdmGg3G7lRDx+oj1MHXDBTDbKxIq+SXMRcuZJxm7YsFvPUcGPrRv1crq1ofxOLKhKd86srX/OGXiz4qB2r8KNIRB5mJhqoct97W7qAJzIRYCzthzwd8ODf3ux0c=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=rYHSzr1S
Subject: [Buildroot] [PATCH v4 1/1] configs/versal_vek280_defconfig: new
 defconfig
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
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 romain.naour@smile.fr, michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds support for Xilinx Versal VEK280 Evaluation Kit.

VEK280 features can be found here:
https://www.xilinx.com/products/boards-and-kits/vek280.html

The VEK280 requires a patch for the memory node in the dts file because it is
not currently correct.  This patch has been applied to the linux-xlnx repo and
will be included in the 2024.2 release.

Upstream: https://github.com/Xilinx/linux-xlnx/commit/3c7a97d99bdb3dd6b1f36d7d87d3a3c113dfe2ea

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- Fixed memory range in dts files for vek280 evaluation board.
V2->V3:
- Added Upstream link to vek280 patch.
V3->V4:
- Bumped to Linux 6.6.40
---
 DEVELOPERS                                    |  1 +
 board/versal/readme.txt                       |  4 ++
 ...rsal-Fix-vek280-memory-configuration.patch | 47 +++++++++++++++++++
 configs/versal_vek280_defconfig               | 44 +++++++++++++++++
 4 files changed, 96 insertions(+)
 create mode 100644 board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch
 create mode 100644 configs/versal_vek280_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 76f7fc5ed6..d07f41fe91 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2403,6 +2403,7 @@ F:	board/zynq/
 F:	board/zynqmp/
 F:	boot/xilinx-prebuilt/
 F:	configs/versal_vck190_defconfig
+F:	configs/versal_vek280_defconfig
 F:	configs/versal_vpk180_defconfig
 F:	configs/zynq_zc702_defconfig
 F:	configs/zynq_zc706_defconfig
diff --git a/board/versal/readme.txt b/board/versal/readme.txt
index 9cf499b35b..4d8406fb1f 100644
--- a/board/versal/readme.txt
+++ b/board/versal/readme.txt
@@ -4,6 +4,7 @@ Xilinx Versal boards:
 ******************************************
 Supported Versal Boards:
 Xilinx VCK190 board
+Xilinx VEK280 board
 Xilinx VPK180 board
 ******************************************
 
@@ -12,6 +13,9 @@ Evaluation board features can be found here with the links below.
 VCK190:
 https://www.xilinx.com/products/boards-and-kits/vck190.html
 
+VEK280:
+https://www.xilinx.com/products/boards-and-kits/vek280.html
+
 VPK180:
 https://www.xilinx.com/products/boards-and-kits/vpk180.html
 
diff --git a/board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch b/board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch
new file mode 100644
index 0000000000..d894ad35d1
--- /dev/null
+++ b/board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch
@@ -0,0 +1,47 @@
+From: Michal Simek <michal.simek@amd.com>
+Date: Mon, 15 Jul 2024 08:24:57 +0200
+Subject: [PATCH] arm64: versal: Fix vek280 memory configuration
+
+Board has 12GB total but Vivado wizard supports one channel LPDDR4 4GB
+configuration (2GB low + 2GB high) or two channel LPDDR 8GB configuration
+(2GB low + 6GB high). Wiring the remaining 4GB LPDDR can be done via board
+tab but not available as option in wizard. That's why only describe 8GB by
+default.
+
+Signed-off-by: Michal Simek <michal.simek@amd.com>
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+Upstream: https://github.com/Xilinx/linux-xlnx/commit/3c7a97d99bdb3dd6b1f36d7d87d3a3c113dfe2ea
+---
+ arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts | 2 +-
+ arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts b/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts
+index 1641dc0b5141..ad5d590318e6 100644
+--- a/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts
++++ b/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts
+@@ -19,7 +19,7 @@ / {
+ 
+ 	memory: memory@0 {
+ 		device_type = "memory";
+-		reg = <0 0 0 0x80000000>, <0x8 0x0 0x7 0x80000000>; /* 32GB */
++		reg = <0 0 0 0x80000000>, <0x8 0x80000000 0x1 0x80000000>; /* 2GB + 6GB */
+ 	};
+ 
+ 	chosen {
+diff --git a/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts b/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts
+index fda47cd87b3a..80aae8fa4b11 100644
+--- a/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts
++++ b/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts
+@@ -19,7 +19,7 @@ / {
+ 
+ 	memory: memory@0 {
+ 		device_type = "memory";
+-		reg = <0 0 0 0x80000000>, <0x8 0x0 0x7 0x80000000>; /* 32GB */
++		reg = <0 0 0 0x80000000>, <0x8 0x80000000 0x1 0x80000000>; /* 2GB + 6GB */
+ 	};
+ 
+ 	chosen {
+-- 
+2.43.0
+
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
new file mode 100644
index 0000000000..5831d4d159
--- /dev/null
+++ b/configs/versal_vek280_defconfig
@@ -0,0 +1,44 @@
+BR2_aarch64=y
+BR2_cortex_a72=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vek280-revB"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.1)/xlnx_rebase_v2.10_2024.1.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_versal_virt"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vek280-revB"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
+BR2_TARGET_UBOOT_FORMAT_DTB=y
+BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
+BR2_TARGET_XILINX_PREBUILT_BOARD="vek280"
+BR2_TARGET_XILINX_PREBUILT_VERSAL=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_BOOTGEN=y
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_GLOBAL_PATCH_DIR="board/versal/vek280/patches board/xilinx/patches"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
