Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89ECC71136
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 12:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63B4360BEF;
	Tue, 17 Jun 2025 12:25:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uWkLSkNbQaH2; Tue, 17 Jun 2025 12:25:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4A4D60D95
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4A4D60D95;
	Tue, 17 Jun 2025 12:25:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 37603151
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 12:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DFF98208E
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 12:25:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SeIk7lQ7w9qL for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 12:25:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::627;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A8A0080EC0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8A0080EC0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::627])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8A0080EC0
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 12:25:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kuJpqARvRh6k7bCO/7coMTdunBGRLH8F/4yDf6V7IP6fCUp0xAtFLf2QDs+w1yLl9w4zQ7kXIWyKJe9jnciEJnRqYxvPgHS0iFBbs8oSEuHvrA2EVovdZDMS/B4yGzC58HbVqePf999fWqxFki9wsgrdM9rMb7iFM6S3jQV/OKPhjdOl/doSmwaDXrz4j6Fy2wRPzsdJWre2N5LY6YzZmpeq69eQU9xGBBKTEBsLht1FmEBbycA97SVYNyRZW1yWCi65b5aEDkQu74gZKDWx6fO2+Mb279kCDnnW9A8qhQh/l7sEsV2t3TFZ/TKn8ZUX0CFyw+SbbZlFc4hghJlB5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqYB3BfJTYWcElAsAANjat/v7N6E762jEMYADS/gn9o=;
 b=xd2QrDkSPyYQLXbFJdnUP7g9DgfhoyCeT+RWOhM+qSXTCFbECZ47V6rhjZG+oqJzNrIMZfKPvXV0fTtHfqi0GPYgzdtEZj5M/Wac6SR+2H0MImsnA9CNtXESh8Tgtkq1xCOwlfa9yvFJ0peH5LDHo6HG0H/FpT4K6QpAmNQjeghjHD/VPHv2ZQFGS87YMGvq1H9nYxByCIU9hIFDUOh9KiC0tM6BIlmikKMC5PkTzWwYznZrLk3oSKnNgZXM4vr9GJoHygN7GSeWP/ablcn/n+pOQmi4Yvs90b7k/OvbrDsA61KUsDaM/NboeN/6MWoHur3p537leD+EtOn8u8f8Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BL0PR05CA0021.namprd05.prod.outlook.com (2603:10b6:208:91::31)
 by PH0PR12MB8821.namprd12.prod.outlook.com (2603:10b6:510:28d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 12:24:55 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:208:91:cafe::ed) by BL0PR05CA0021.outlook.office365.com
 (2603:10b6:208:91::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Tue,
 17 Jun 2025 12:24:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 12:24:53 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 07:24:49 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 17 Jun 2025 07:24:47 -0500
To: <buildroot@buildroot.org>
Date: Tue, 17 Jun 2025 13:24:45 +0100
Message-ID: <20250617122445.2019214-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|PH0PR12MB8821:EE_
X-MS-Office365-Filtering-Correlation-Id: 2824cb09-ed69-4fde-0c32-08ddad99f6e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rLSOt0GHMS0gWMImAliPcULPIe7BvTQtlhxsYmtOL84s78RfgDMA2nbv6Ah4?=
 =?us-ascii?Q?YpIoWW/ix0UkrIUR+VHoxHfVVEXf1dptGDaf25kbhodPB6tugOnC7qvPPUjQ?=
 =?us-ascii?Q?Iu2HMMZDLGaGTi86ZjhRFsCt9zNGQm+iHIP6hwk6aicF0lJSGOVVeejNGYTX?=
 =?us-ascii?Q?0ieIEncG6SvXdxNBMUk5S+2I+ncFuAV9rsYW6gp8QXyNqtO6H8ImjZ7KA20Z?=
 =?us-ascii?Q?eT6L3bPYS1MBYrm+TDdSo3LXdoz67AVx+WCYAHoXAJmiOZlRI5Zx0us7zHty?=
 =?us-ascii?Q?mGPlNODkEdYo++H++6Vvg5vpZay3LYiodeGoeEic/cKN8de8ZVU+xckkaB4N?=
 =?us-ascii?Q?SkCa6IcA5JJbwPIjfGjc4h1vuUjHAsUNMDtaMbLFZmDeiDRToyNJQ7dVxEP8?=
 =?us-ascii?Q?drsX+91bYdC9gRwB8624JY0n8j00DX+kquzSpoDX/KWrtB/w+/t1GYLhbGvl?=
 =?us-ascii?Q?uF1fRhb06vHFkhhCzgEpBMURZ9+1zI09kpRIm3pa2TZq0hKRK0seE8GSxWar?=
 =?us-ascii?Q?uk2fGFqGNf85IoMoXPmSJ+DUFr0MLP/Mth408nd+8b0bjYBwgG42Jo2eMluT?=
 =?us-ascii?Q?6OvKue+ps5Z8r+K4akP5sTCxFeQzdHpJ1MInCm//uADujAm00EsHuFyaZZG3?=
 =?us-ascii?Q?Qb9mNwoPKm6v+++ynKjwoDPHXz+CKG8nX2BhQFJYsSFw2j0rZu982pZ/6Jgc?=
 =?us-ascii?Q?b9C1PYF4ov3tSIR8IetISF8PvXdbfGrJLKkwaYU5Qi4mFGzN/5C5yHTbyknp?=
 =?us-ascii?Q?DnDmHAWSP/pnE9lfZLFuD45ArzVhd7twFXaizfHejM3E9vZrkoRvNTMk1atu?=
 =?us-ascii?Q?9SiJCI1hi6g76VlTFXbPq0gPzAK5viBNPrk+gbrKLzZRopl2+rM+gtPQh3Wz?=
 =?us-ascii?Q?YeWDQQl2qZzOflrcGbe56d5SrY1G0a4lNGR4Ud6ktg7HkN4qhYa3n18WMnwk?=
 =?us-ascii?Q?OplsekUo0NmIt95CfDjiAtaJZZxa+OK4V3J26XgTC039rNgzaafsG5RmFE8v?=
 =?us-ascii?Q?4aS2FFy+oXLKBfPSUtmUIQ6R/Nvh2ydQN6vZO8qaYP2eTAwEy3CCXedo3Lap?=
 =?us-ascii?Q?0EVkMe5QXsh3WjKRbXL95hghGTQGvQshe/LHAdDks2Y/0QBDzrItT6YuizUO?=
 =?us-ascii?Q?fF6MUjr+TerDLGqid4mY3OqIIrmlHVvQl6PcWb7CMt28oePW31yqfxSiMu9o?=
 =?us-ascii?Q?Uz/fjvtL1BR/rC31VSqvEbdaBbHypLx6udB1q2w4H1ta7D7elaqbrFoKKwjN?=
 =?us-ascii?Q?uq9SFyXPpKtIgDIIUbmWQ2LvhflDZ0mOZFrAKImAbFO83e/CUIJFDc6VFW6Z?=
 =?us-ascii?Q?cMRk/TZTxLi1+oSVmQaRNSTvDjZRWVR8+H17H82QgWkLWCxAYLpVtwfeVcYs?=
 =?us-ascii?Q?LcXpIJZu3m3m+n65SmjAKnb2zOFC0T19YbvBNmu4EEl8f7UioFdPMWq5ypWO?=
 =?us-ascii?Q?XnD5GgZqJc4OOuPcruzEfO5H029k3Cu2RDjzFZZX1q/IUFNzurYbbNl9xtlI?=
 =?us-ascii?Q?Mtw9DO491DpcLgl4fucKkc09U2+qVMeMkpuKBrKDMVjg7KkGWUoBAC2oDnqJ?=
 =?us-ascii?Q?F8jABNByTdQj1l1yBfg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 12:24:53.9739 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2824cb09-ed69-4fde-0c32-08ddad99f6e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8821
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqYB3BfJTYWcElAsAANjat/v7N6E762jEMYADS/gn9o=;
 b=zQohZJlTbQF1oTx9hEniAfM+l5munhUl02alqRPQO7toFnbemy/Eob4HTZcoDcEzUAymMk3uC9vil9sx4UJO/49usaXW0LcJ/X20HZ4WKZe73n3jLjLUFvFrgzfscgYjlgVLF29awiJpIJagJ9RTp3UBtP+IE05eBWOTJuQDxOQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=zQohZJlT
Subject: [Buildroot] [PATCH v1 1/1] board/versal: add custom board
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

The readme.txt file for versal boards does not have documentation for working
with custom boards.  This patch adds documentation for custom board support.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/versal/readme.txt | 46 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/board/versal/readme.txt b/board/versal/readme.txt
index 4d8406fb1f..cd308a1226 100644
--- a/board/versal/readme.txt
+++ b/board/versal/readme.txt
@@ -60,3 +60,49 @@ card:
 Where 'sdX' is the device node of the SD.
 
 Eject the SD card, insert it in the board, and power it up.
+
+Support for other boards:
+=========================
+
+If you want to build a system for other boards based on the same SoC, and the
+board is already supported by the upstream kernel, U-Boot, and
+xilinx-prebuilt, you simply need to change the following Buildroot options:
+
+ - Kernel Device Tree file name (BR2_LINUX_KERNEL_INTREE_DTS_NAME)
+ - U-Boot (BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=<dts file name>")
+ - xilinx-prebuilt (BR2_TARGET_XILINX_PREBUILT_BOARD)
+
+Custom versal board support:
+
+To generate a boot.bin image, Versal boards require a PDI (Programmable Device
+Image) generated by Xilinx Vivado which contains all the hardware specific
+boot information, such as clock, MIO and DDR initializations as well as any
+customizations in the programmable logic. Since this PDI can only be generated
+by Xilinx Vivado, Buildroot needs access to the prebuilt image. The Buildroot
+xilinx-prebuilt package has support for Versal XSA files exported from Xilinx
+Vivado.
+
+Using the option BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA, Buildroot can obtain
+the prebuilt PDI from the XSA file.
+
+1) Start with a defconfig supported by Buildroot (e.g. VCK190)
+    make versal_vck190_defconfig
+
+2) make menuconfig
+    Visit the following menu and enable BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
+
+    Bootloaders  --->
+        xilinx-prebuilt  --->
+            [*] download a prebuilt Versal XSA
+
+3) Within the same menuconfig, configure location of XSA. It can be in the
+   local file system or downloadable from an https:// location.
+
+    Bootloaders  --->
+        xilinx-prebuilt  --->
+            (<path to XSA>) URL of custom XSA
+
+4) make
+
+The resulting output/images will contain a boot.bin that includes the custom
+PDI file extracted from the Xilinx Vivado exported XSA file.
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
