Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E9AC3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 15:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34BF1600CC;
	Mon, 29 Jul 2024 15:05:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aFDHBunCN1OP; Mon, 29 Jul 2024 15:05:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4B3B60585
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4B3B60585;
	Mon, 29 Jul 2024 15:05:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 81BCA1BF40F
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 15:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BE7A40581
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 15:05:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hMX6IcG4ca1z for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 15:05:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::601;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BD84B40571
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD84B40571
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::601])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD84B40571
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 15:05:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kf0WNq7VvjkU09rQZSXuX51ryg+YHTDg8KNeeGOi4g1baYRYKsSUQpG40hy1mOCiOovMatkcN08Najpw7YQF/alc8HEFeI3o5THJJFEMoK8qdxx8mbBNvC0ZJhQ62d/RKyZc86eemyWSDIPuWSYE6tBuF8DjpRl9nD8WoIFTdDoyLzW/8C6XVSw2IoOzeBbjdljsCY9ITq/wEv2zZ47fGTgOT/BwKbfAiRYzfD2fBwzKlLviCxSzfUPvFJtBbucUVG2Hv8RksIaNKmo6lGM2n3ErcGB1lOi6Id8gVizDSC896rblMUcaZdvmNW7MXrIUt57gqsT8ImD/X3nau2qMmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NMxtukPTYTkZwulJZeer1skez1xrKlySJiupJXBE8Q=;
 b=PcqhZz2mrj4ESNLHUdU0gl462AUmv+nHG/jjtcQthXisY4WpzHYTVCrIoRswKCHeHaNI6YpVWrjBrUfaL4sKxPOZDbNM+Ao6N4LqJtFtdFzQBORavXLnN+KKoQkz5/MyPtYZmYyYJhHSDWqWXiqu0JdNTkTnNDkpIAhsNg88vue0hoymgubyMMfhgRxqZEN3sv3FWBnPlqhRw4FMMkCoZUzYfYeTad1NMCi0CSWiv2qBC5l2jytKabIotmcCgXC+Rs4ZI7twI3gumQ6DK9xPrWyoM8/dcQMO83HaIQA4CbuaFx7ck2p1c9L3CkttuegkmGO26X7dv7sr3o2ub0HBBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from LV3P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::33)
 by IA1PR12MB8360.namprd12.prod.outlook.com (2603:10b6:208:3d8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 15:05:47 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:408:234:cafe::c) by LV3P220CA0001.outlook.office365.com
 (2603:10b6:408:234::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Mon, 29 Jul 2024 15:05:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Mon, 29 Jul 2024 15:05:46 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 29 Jul
 2024 10:05:45 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 29 Jul
 2024 10:05:45 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 29 Jul 2024 10:05:44 -0500
To: <buildroot@buildroot.org>
Date: Mon, 29 Jul 2024 16:05:42 +0100
Message-ID: <20240729150542.2455401-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|IA1PR12MB8360:EE_
X-MS-Office365-Filtering-Correlation-Id: 420af359-a61f-49b2-0e29-08dcafdfecbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z02gTfxPYjk79jmHwfjlR6swIBakBdJCFI4NYNkhfrFD8XG9ZByDRUMXIx4I?=
 =?us-ascii?Q?amg/i8YdESPLO+Fg8vjgLcnSt4072JXVVy4xyslDICGccDWFZLjuX5zZK9R2?=
 =?us-ascii?Q?hxzO/omyGzkNgXy8d/SSyIe9XKzxAu1j4JhnzU3wbpKzGn8U7NussrOJ17hE?=
 =?us-ascii?Q?9uhXp2q3/vd9B8pRgFeDs1p4rET8VVXJWOxcadUENsLvz7w5wDa9ZDOnsAhs?=
 =?us-ascii?Q?YsgduEHjDZRk3Bmcck7nNzDhFh7aP6bWOv/1rsi7fA9U412LNMsUJ6TtITUT?=
 =?us-ascii?Q?I39xIlolrErVGdAe/OIoGizhH9OKK10tGhkJ+UmEqzAEuu4PLpVdt0gBRxTm?=
 =?us-ascii?Q?A0WojzG/9bu03oIY3GjyAJyAQ0pHgrvQiktFXV1yKB3AnQ5zQxdUuJSNER+X?=
 =?us-ascii?Q?psuWpUYXZLoOkcdUYW2TlaAVsROLcQZbNb4I5oM8Bp17VtjJ7OmsNtd/Yyrx?=
 =?us-ascii?Q?NQgjReqYAFKoVtjMQIkh/UK7yIGde2FuFsfkoqgTa8S2NBjvUij1zmFjxaDx?=
 =?us-ascii?Q?H4cdUT8buWL+7dJc35xew0+huO3Qy3ak5/2+pay8xHLFlitMR6mANfictO9P?=
 =?us-ascii?Q?rKzBZLcf2uKfC002Bk+NgH+4KmJ/8OxM/KTlZInINBpW1P8/Vr0zjT3KR3JI?=
 =?us-ascii?Q?xdrnFJisR0a7yhYmXluqPZwXr4UaGf6q7n+mWwIMDzVeitnN+oSTlo45yW/I?=
 =?us-ascii?Q?5UwKbD2CIJ9B7utzb8Y/omPq5L9KlQXYrCBpWGjc45n7P4ACPeXs2BSn2loq?=
 =?us-ascii?Q?Vnm1lwG99LPGcnyYmCEZinkqP2Tr7fqJVWa+JExj+XePfiLsW5pioS9H+jUG?=
 =?us-ascii?Q?1ZH2HOWzmvOxKewSd969W6Laae5bHuEOs+AueOTbd4ZRM6nwnlUVCQwObZ8p?=
 =?us-ascii?Q?fu+gnmCZy9bXeHSyBWQLkMMg16tu21kCbhZl/DBgrDDMgEaAKDtOEPkanCCT?=
 =?us-ascii?Q?xHid0USehMBdCRXE3wNhZfSg6Pr/ka6qBcU4+8IwyhKngNzybXdrMfMfUi9D?=
 =?us-ascii?Q?aFVvaULAONu55vi9GMJndrjRya4tR+zJgKssWmvc2W7dTkNYjQgrdO9TvWnh?=
 =?us-ascii?Q?AlA8wDpOg1I7knq4GHO8aESrK7RGAmFbW27002RRKC2LDdd0agXRgusOOdX/?=
 =?us-ascii?Q?IvCFXY3yFDQs+PaxCHLmQFBQ91+L3MXyvw7p4LucsbuB8WOR0SqJaQuiCx3g?=
 =?us-ascii?Q?F6h+QpchQhQi1QTV1tCVK6HKFPr97RZtWsDgRBMD7TWZn0b7erlnYh1Zt7/T?=
 =?us-ascii?Q?yMUkteGU6N+/7QSWi8jX7CUMZ+aQ281fDCW+KcdnnQ0MkMbmAmGtMqewB1dn?=
 =?us-ascii?Q?Ypl5UJPfHewxYM3foXH6X1T6+sHacCFu/CGDGcUkxlGqpHPGkwZFpbnqGqkS?=
 =?us-ascii?Q?YhH8Ggcxv4dowMm7IYpvUF9du947N9qwsY5d5XA186pnLmG/1Rs6rpUSPyvX?=
 =?us-ascii?Q?Fvnv76fiwn8oB95W5Ho/Z+BGq4CbrUqJ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 15:05:46.3236 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 420af359-a61f-49b2-0e29-08dcafdfecbb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8360
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NMxtukPTYTkZwulJZeer1skez1xrKlySJiupJXBE8Q=;
 b=ZfYOscRyNHwwjxt4c0Cv8z19bOCOldCFnyzhw1HHJUv1sddrYES7T7nScaBm3TQGGRE79cTzvCjl3iDA+GsHW8al54dkEc4yPcF606et3M2o1VQXgwm7FsEdT/OjpCTHGq7k8u27iHBFF3VJ1gKOfVWDf7qY7ZyRIRK4hM8YLSE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ZfYOscRy
Subject: [Buildroot] [PATCH v1 1/1] configs/versal_vek280_defconfig: new
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
Cc: andy.a.kennedy@collins.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 romain.naour@smile.fr, michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds support for Xilinx Versal VEK280 Evaluation Kit.

VEK280 features can be found here:
https://www.xilinx.com/products/boards-and-kits/vek280.html

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 DEVELOPERS                                    |  1 +
 board/versal/readme.txt                       |  4 ++
 ...rsal-Fix-vek280-memory-configuration.patch | 45 +++++++++++++++++++
 configs/versal_vek280_defconfig               | 44 ++++++++++++++++++
 4 files changed, 94 insertions(+)
 create mode 100644 board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch
 create mode 100644 configs/versal_vek280_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 78ea65205d..1fac1da208 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2400,6 +2400,7 @@ F:	board/zynq/
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
index 0000000000..82c043e943
--- /dev/null
+++ b/board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch
@@ -0,0 +1,45 @@
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
++		reg = <0 0 0 0x80000000>, <0x8 0x0 0x1 0x80000000>; /* 2GB + 6GB */
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
++		reg = <0 0 0 0x80000000>, <0x8 0x00000000 0x1 0x80000000>; /* 2GB + 6GB */
+ 	};
+ 
+ 	chosen {
+-- 
+2.43.0
+
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
new file mode 100644
index 0000000000..37e479d692
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
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
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
