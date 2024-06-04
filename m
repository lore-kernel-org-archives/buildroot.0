Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308E4C25B74
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 04:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 447FB81FB3;
	Tue,  4 Jun 2024 04:01:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D5ljeVONHO7A; Tue,  4 Jun 2024 04:01:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0C8881FB4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0C8881FB4;
	Tue,  4 Jun 2024 04:01:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B72B41BF330
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 04:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B051D40BFA
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 04:01:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l8MR07_KKEKd for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 04:00:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2009::601;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 581EF405A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 581EF405A8
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::601])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 581EF405A8
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 04:00:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eh2FVo7owR9eVO5C15AL0LbbdSNqu6TP5pl5RUJp7dePN28WQhEL5LmqLnohLtYH1CxPYv/0CuA8T5N95rruVSCwDJ67hjUniD66QOU7WXj+dOCXQ/87hYuZe3lxH6uSgfjTD3PKuGhtOmawah1E11ZOlOllYONxOxrAAeHgCI22Bi5AsJWimt04Xq4Iwkt+b9xZco34w+c5ZyDBfR5OeD4HLV1HSj3bR2bpmfovK4Zr//bLH8YyxV1sOp+ij+6zmXg7PtvCavcYMf5YRgXaC9KTFzEbabw8Aq15Rm5n45ojPdV/CxAya/W2ZKOclI9HNFGxIsBw5OEDQ0tP9AcIig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rbXJX1xnUXC2iDw6H+OURWnmbmHeNZP/XhpZLCsX/no=;
 b=eVFp4fDHz83CXparNYuD5lQbsXxq/9pK6K5Kb3IabY2g1XWYxUG/0dzYw68Sm7WJCBjnAk6L2TMgt5vlHxJXdchtLjlwwNkLXDbn9vw9NfQg2aomzKlcCGoUs26fGoe8OWpp81UO00e8bhd0GaQA3xDncov19mg8P/kaVxRAnFW3HBiMU1Y96DiIxtw0plMLq38PkP3+NnJ1arsIwW2234YaFSXQVRwapUtbHy7tiE+PYyUHr6mhKch9CdpuqShgazP1A83pB/0istEJvBTatsN8LmQop4TklAtA9PoaRD8osoZ2Njk7/6K7Ox/SCUcrSD9BXwTKLRuFFlvOa4NXVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DM6PR06CA0066.namprd06.prod.outlook.com (2603:10b6:5:54::43) by
 IA1PR12MB9061.namprd12.prod.outlook.com (2603:10b6:208:3ab::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.22; Tue, 4 Jun 2024 04:00:51 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com (2603:10b6:5:54::4)
 by DM6PR06CA0066.outlook.office365.com (2603:10b6:5:54::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.30 via Frontend Transport; Tue, 4 Jun 2024 04:00:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343C.mail.protection.outlook.com (10.167.18.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Tue, 4 Jun 2024 04:00:50 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 3 Jun
 2024 23:00:49 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 3 Jun 2024 23:00:48 -0500
To: <buildroot@buildroot.org>
Date: Tue, 4 Jun 2024 05:00:46 +0100
Message-ID: <20240604040046.815957-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|IA1PR12MB9061:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cdbe79b-71a7-462a-5c0a-08dc844aec32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|36860700004|82310400017|376005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?F6AkkyXIeUk2dashA8FQ62pPf6BEcHLDSpH2epovdljMP5dTmF/Ol6yfp4m7?=
 =?us-ascii?Q?O31rlxH1phrFygVKQ3T/xyZynXENztxTISx1taeBNv3oNqWCRTAl2UhQ9RBc?=
 =?us-ascii?Q?ECjioj9wgEQHBNdf+TeQr790B83VH+s77mrxg0rK3POkLIEc8wWKmqRSVkM9?=
 =?us-ascii?Q?t+paDRYRg851ISwrl6U92LP8Fc0kOglBV6BN1cyXZMNcdYlhVPrqTlZU6uMs?=
 =?us-ascii?Q?2hjwQQGN6qGMneyRWrlk5UFr9eBpIR4aIHNiBPxnc+vDSxrssyIwbgthfYmw?=
 =?us-ascii?Q?qjmD3nMZ1uOhqh8lmqXYVsZ4ejwoPrNNTKgpEEcny3cgT6rGChjfC1QHDUSD?=
 =?us-ascii?Q?5/2cr/6LSS0zf+wJPujQQFtZr0y5N3zx013kt3az4YJnGomsTD8Gf06rUVpq?=
 =?us-ascii?Q?H2R9pCPtJYqJY5kaOXa4iSJrcb7uT3oMXgenCdl1+czQd0FKm90lnNkrghNq?=
 =?us-ascii?Q?0uBYuPgxVXbe5IFgbsUp1jJGKpsEFFOVN9mrdYYvnxdixTRcrv55hJogZd/l?=
 =?us-ascii?Q?Xw7QGJVyKm1S/HdNYAp4TsxrBbUVubTDCDLLZcJqWR7qdaZcQ+68RJu4i+WD?=
 =?us-ascii?Q?CPhWCUBaB9rBqgRkp6W/pzGC7GOpq6LTQLZOpHuUC9kBoPZscp+npdTfx7dS?=
 =?us-ascii?Q?IyKicNNBcnpsf4KKYew9SGv/e6gQmSZ97/EnQCY7JI9iYg2LzzPo0x1ZIUYX?=
 =?us-ascii?Q?WdFyKlp6ci02kj9lryCySZdBVZtc4vNNhdtmnicSxjRPb/EsDtgH1BCYqWYJ?=
 =?us-ascii?Q?X8OUsMmFlftKg7pML7x1u8VuNiICxTGeJYFVC6v5aoCo+6OxxJl3KK2C2n5e?=
 =?us-ascii?Q?u0lLQBCm1l6szhSlYGcXea2ZgtRHyBljnST0naqw3COV96BWXy4+0PQ74lMH?=
 =?us-ascii?Q?QLSp/rUCoxc2LC3LedYozxlu72mAWFkXdc1e9oDuFirSv0B+yYjgqGn1JW47?=
 =?us-ascii?Q?O1fEcOcdBMq+aJRBhsoquL0oW3maUhD0h+QjGq7e9OSEi2q+rFHiY8SFRoyo?=
 =?us-ascii?Q?cXJTj5reLLuZWt2WQkBTwZFjbyYZZpfzGdNib2sx56rQJZ+49FNAkyJfnBQt?=
 =?us-ascii?Q?+a3MoXQ09q0NZL9/zR0bdZrqN+0YvbiigUIN4Dn038Zj4FXMps3zsmcbyzRM?=
 =?us-ascii?Q?bGMK3Oydz+FsPJ7XbKVYrJxKkDmTHgfP7mzz2rAY3BNhaX3H963/opVNRfyr?=
 =?us-ascii?Q?fjojpgb32w4wAJKGBmUlje6Q3yA8pRvD3AfFNuq3FLptMLND9fny524EMrvD?=
 =?us-ascii?Q?MUZzgDKU0ELfq7lB2gFnRL1gBqRYmNbgsMyYARi85x+BSc1MvSj7Ikuh7rYM?=
 =?us-ascii?Q?t3hkrFXUbyi8nhtBBHGl0K88zc3wBkKfqk92AGBajg6AMA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(36860700004)(82310400017)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 04:00:50.4312 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cdbe79b-71a7-462a-5c0a-08dc844aec32
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9061
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbXJX1xnUXC2iDw6H+OURWnmbmHeNZP/XhpZLCsX/no=;
 b=AYlx4dZ26z1sTvfmBnN1ISNuqCpHz8/PQfGpFhhsVO/tcrNs1lhDa9Sr/f6E2NZfpwoMBWhSdxN4Xw30hYbxNTlb1MqUi9hrqCEy5e3A1cAzEEKWB203sIAHqS6lRMHm2S1KbMamBHasSvBhgz5IyH/wmxl3bcigPjnBHS9fpOA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=AYlx4dZ2
Subject: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_kd240_defconfig:
 bump to xilinx-v2024.1
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynqmp_kria_kd240_defconfig to xilinx-v2024.1 which includes
the following updates:

- Linux v6.6.10
- U-Boot v2024.01
- ATF v2.10
- PMUFW xilinx-v2024.1

Migrated u-boot to xilinx_zynqmp_kria_defconfig, so uboot.fragment no longer
needed.

With u-boot 2024.1, CONFIG_SYS_SPI_U_BOOT_OFFS has a new meaning. It is now
the offset between the base address of the boot.bin and u-boot.itb instead of
a raw base address of u-boot.itb. This allows for A/B firmware updates since
the u-boot.itb is set by default to a 0x80000 offset of the boot.bin.

Thus, Kria SOMs come with the following QSPI address table.

Partition A:
0x200000 - boot.bin
0x280000 - u-boot.itb

Partition B:
0xF80000 - boot.bin
0x1000000 - u-boot.itb

In addition, the kd240 still requires a board specific patch for the usb to sd
card bridge device.  Without the board specific patch in the
./board/zynqmp/kria/kd240/patches directory, the usb will not come up correctly
and u-boot will not be able to find the sd card containing the Linux kernel and
file system.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 ...rm64-zynqmp-Enable-usb3-for-k24-som.patch} | 267 ++++++++----------
 ...ynqmp-Add-output-enable-pins-to-SOMs.patch |  79 ------
 configs/zynqmp_kria_kd240_defconfig           |  15 +-
 3 files changed, 125 insertions(+), 236 deletions(-)
 rename board/zynqmp/kria/kd240/patches/uboot/{0001-arm64-zynqmp-Fix-k24-psu_init_gpl.c-clocking.patch => 0001-arm64-zynqmp-Enable-usb3-for-k24-som.patch} (51%)
 delete mode 100644 board/zynqmp/kria/kd240/patches/uboot/0002-arm64-zynqmp-Add-output-enable-pins-to-SOMs.patch

diff --git a/board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Fix-k24-psu_init_gpl.c-clocking.patch b/board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Enable-usb3-for-k24-som.patch
similarity index 51%
rename from board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Fix-k24-psu_init_gpl.c-clocking.patch
rename to board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Enable-usb3-for-k24-som.patch
index f088b90f52..402cc061ff 100644
--- a/board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Fix-k24-psu_init_gpl.c-clocking.patch
+++ b/board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Enable-usb3-for-k24-som.patch
@@ -1,23 +1,32 @@
-From f8cba630d3fccd901164dec7bd9b60442bab8995 Mon Sep 17 00:00:00 2001
+From 62585d116c1ee7c91db12cc6852e1bc6a12abdad Mon Sep 17 00:00:00 2001
 From: Neal Frager <neal.frager@amd.com>
-Date: Wed, 13 Dec 2023 12:53:29 +0000
-Subject: [PATCH] arm64: zynqmp: Fix k24 psu_init_gpl.c clocking
+Date: Fri, 15 Dec 2023 07:36:47 +0000
+Subject: [PATCH 1/1] arm64: zynqmp: Enable usb3 for k24 som
 
-This patch corrects the k24 som clocking configuration such that the serdes
-clocks are correctly enabled and the usb0 is configured to use the psgtr
-refclk2 for usb3 mode.
+Currently, the u-boot zynqmp psgtr driver is not connected to the usb dwc3
+driver.  Without this, the only way for u-boot to be able to use usb3 is if
+the psgtr serdes clocking is already enabled in the psu_init_gpl.c.  This
+patch enables the psgtr serdes for usb3 use, so the u-boot dwc3 driver will
+work properly on boards based on the k24 som.
 
-This patch also corrects the configuration of mio pins mio76 and mio77
-which should be configured as gpio pins.
+In addition, this patch correctly configures mio76 and mio77 as gpio pins
+which are used as reset gpio pins on the kd240 starter kit.
+
+This patch is needed for enabling u-boot to load an OS on the kd240
+starter kit by either usb3 or the sd card interface connected over the usb3
+to sd card bridge.
 
 Signed-off-by: Neal Frager <neal.frager@amd.com>
-Upstream: https://patchwork.ozlabs.org/project/uboot/patch/20231213134007.2818069-1-neal.frager@amd.com/
 ---
- .../zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c  | 266 +++++++++++++-----
- 1 file changed, 200 insertions(+), 66 deletions(-)
+V1->V2:
+ - rebased patch to latest u-boot master branch
+ - improved git commit message
+---
+ .../zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c  | 283 +++++++++++++++++-
+ 1 file changed, 270 insertions(+), 13 deletions(-)
 
 diff --git a/board/xilinx/zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c b/board/xilinx/zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c
-index 45102302dc..4c904c6c81 100644
+index 166e61431b..591f093752 100644
 --- a/board/xilinx/zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c
 +++ b/board/xilinx/zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c
 @@ -72,6 +72,18 @@ static void dpll_prog(int div2, int ddr_pll_fbdiv, int d_lock_dly,
@@ -39,41 +48,6 @@ index 45102302dc..4c904c6c81 100644
  static unsigned long psu_pll_init_data(void)
  {
  	psu_mask_write(0xFF5E0034, 0xFE7FEDEFU, 0x7E4B0C62U);
-@@ -490,20 +502,20 @@ static unsigned long psu_mio_init_data(void)
- 	psu_mask_write(0xFF18008C, 0x000000FEU, 0x00000000U);
- 	psu_mask_write(0xFF180090, 0x000000FEU, 0x000000C0U);
- 	psu_mask_write(0xFF180094, 0x000000FEU, 0x000000C0U);
--	psu_mask_write(0xFF180098, 0x000000FEU, 0x00000000U);
--	psu_mask_write(0xFF18009C, 0x000000FEU, 0x00000010U);
--	psu_mask_write(0xFF1800A0, 0x000000FEU, 0x00000010U);
--	psu_mask_write(0xFF1800A4, 0x000000FEU, 0x00000010U);
--	psu_mask_write(0xFF1800A8, 0x000000FEU, 0x00000010U);
--	psu_mask_write(0xFF1800AC, 0x000000FEU, 0x00000010U);
--	psu_mask_write(0xFF1800B0, 0x000000FEU, 0x00000000U);
--	psu_mask_write(0xFF1800B4, 0x000000FEU, 0x00000010U);
--	psu_mask_write(0xFF1800B8, 0x000000FEU, 0x00000010U);
--	psu_mask_write(0xFF1800BC, 0x000000FEU, 0x00000010U);
--	psu_mask_write(0xFF1800C0, 0x000000FEU, 0x00000010U);
--	psu_mask_write(0xFF1800C4, 0x000000FEU, 0x00000010U);
--	psu_mask_write(0xFF1800C8, 0x000000FEU, 0x00000010U);
--	psu_mask_write(0xFF1800CC, 0x000000FEU, 0x00000010U);
-+	psu_mask_write(0xFF180098, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF18009C, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF1800A0, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF1800A4, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF1800A8, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF1800AC, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF1800B0, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF1800B4, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF1800B8, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF1800BC, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF1800C0, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF1800C4, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF1800C8, 0x000000FEU, 0x00000080U);
-+	psu_mask_write(0xFF1800CC, 0x000000FEU, 0x00000080U);
- 	psu_mask_write(0xFF1800D0, 0x000000FEU, 0x00000004U);
- 	psu_mask_write(0xFF1800D4, 0x000000FEU, 0x00000004U);
- 	psu_mask_write(0xFF1800D8, 0x000000FEU, 0x00000004U);
 @@ -528,8 +540,8 @@ static unsigned long psu_mio_init_data(void)
  	psu_mask_write(0xFF180124, 0x000000FEU, 0x00000002U);
  	psu_mask_write(0xFF180128, 0x000000FEU, 0x00000002U);
@@ -85,33 +59,6 @@ index 45102302dc..4c904c6c81 100644
  	psu_mask_write(0xFF180204, 0xFFFFFFFFU, 0x50000000U);
  	psu_mask_write(0xFF180208, 0xFFFFFFFFU, 0x00B02020U);
  	psu_mask_write(0xFF18020C, 0x00003FFFU, 0x00000FC0U);
-@@ -539,18 +551,18 @@ static unsigned long psu_mio_init_data(void)
- 	psu_mask_write(0xFF180144, 0x03FFFFFFU, 0x03FFFFFFU);
- 	psu_mask_write(0xFF180148, 0x03FFFFFFU, 0x03FFFFFFU);
- 	psu_mask_write(0xFF18014C, 0x03FFFFFFU, 0x03FFFFFFU);
--	psu_mask_write(0xFF180154, 0x03FFFFFFU, 0x00080814U);
-+	psu_mask_write(0xFF180154, 0x03FFFFFFU, 0x00FC0814U);
- 	psu_mask_write(0xFF180158, 0x03FFFFFFU, 0x03FFFFFFU);
- 	psu_mask_write(0xFF18015C, 0x03FFFFFFU, 0x00000000U);
--	psu_mask_write(0xFF180160, 0x03FFFFFFU, 0x03FFFFFFU);
--	psu_mask_write(0xFF180164, 0x03FFFFFFU, 0x03FFFFFFU);
--	psu_mask_write(0xFF180168, 0x03FFFFFFU, 0x03F7F7EBU);
--	psu_mask_write(0xFF180170, 0x03FFFFFFU, 0x00FC000BU);
-+	psu_mask_write(0xFF180160, 0x0387FFFFU, 0x0387FFFFU);
-+	psu_mask_write(0xFF180164, 0x03FFFFFFU, 0x03FFF87FU);
-+	psu_mask_write(0xFF180168, 0x03FFFFFFU, 0x0303F7EBU);
-+	psu_mask_write(0xFF180170, 0x03FFFFFFU, 0x0004400BU);
- 	psu_mask_write(0xFF180174, 0x03FFFFFFU, 0x03FFFFFFU);
- 	psu_mask_write(0xFF180178, 0x03FFFFFFU, 0x00000000U);
--	psu_mask_write(0xFF18017C, 0x0357FFFFU, 0x0357FFFFU);
--	psu_mask_write(0xFF180180, 0x03FFFFFFU, 0x0357FFFFU);
--	psu_mask_write(0xFF180184, 0x03FFFFFFU, 0x0303FFF4U);
-+	psu_mask_write(0xFF18017C, 0x03FFFFFFU, 0x03FFFFFFU);
-+	psu_mask_write(0xFF180180, 0x03FFFFFFU, 0x03FFFFFFU);
-+	psu_mask_write(0xFF180184, 0x03FFFFFFU, 0x03FBBFF4U);
- 	psu_mask_write(0xFF180200, 0x0000000FU, 0x00000000U);
- 
- 	return 1;
 @@ -569,21 +581,16 @@ static unsigned long psu_peripherals_init_data(void)
  	psu_mask_write(0xFD1A0100, 0x0001807CU, 0x00000000U);
  	psu_mask_write(0xFF5E0238, 0x001A0000U, 0x00000000U);
@@ -137,7 +84,7 @@ index 45102302dc..4c904c6c81 100644
  	psu_mask_write(0xFF5E0238, 0x00040000U, 0x00000000U);
  	psu_mask_write(0xFF4B0024, 0x000000FFU, 0x000000FFU);
  	psu_mask_write(0xFFCA5000, 0x00001FFFU, 0x00000000U);
-@@ -591,40 +598,26 @@ static unsigned long psu_peripherals_init_data(void)
+@@ -591,13 +598,111 @@ static unsigned long psu_peripherals_init_data(void)
  	psu_mask_write(0xFFA60040, 0x80000000U, 0x80000000U);
  	psu_mask_write(0xFF260020, 0xFFFFFFFFU, 0x05F5DD18U);
  	psu_mask_write(0xFF260000, 0x00000001U, 0x00000001U);
@@ -153,84 +100,106 @@ index 45102302dc..4c904c6c81 100644
  	mask_delay(5);
 -	psu_mask_write(0xFF5E0250, 0x00000F0FU, 0x00000202U);
 +	psu_mask_write(0xFF0A0014, 0x03FF03FFU, 0x02FF0100U);
- 
- 	return 1;
- }
- 
- static unsigned long psu_serdes_init_data(void)
- {
--	psu_mask_write(0xFD410000, 0x0000001FU, 0x00000009U);
--	psu_mask_write(0xFD410004, 0x0000001FU, 0x00000009U);
- 	psu_mask_write(0xFD410008, 0x0000001FU, 0x00000008U);
--	psu_mask_write(0xFD402860, 0x00000080U, 0x00000080U);
--	psu_mask_write(0xFD402864, 0x00000081U, 0x00000001U);
--	psu_mask_write(0xFD402868, 0x00000082U, 0x00000002U);
++
++	return 1;
++}
++
++static unsigned long psu_serdes_init_data(void)
++{
++	psu_mask_write(0xFD410008, 0x0000001FU, 0x00000008U);
 +	psu_mask_write(0xFD402868, 0x00000080U, 0x00000080U);
- 	psu_mask_write(0xFD40A094, 0x00000010U, 0x00000010U);
- 	psu_mask_write(0xFD40A368, 0x000000FFU, 0x00000038U);
- 	psu_mask_write(0xFD40A36C, 0x00000007U, 0x00000003U);
--	psu_mask_write(0xFD402368, 0x000000FFU, 0x00000058U);
--	psu_mask_write(0xFD40236C, 0x00000007U, 0x00000003U);
--	psu_mask_write(0xFD406368, 0x000000FFU, 0x00000058U);
--	psu_mask_write(0xFD40636C, 0x00000007U, 0x00000003U);
--	psu_mask_write(0xFD402370, 0x000000FFU, 0x0000007CU);
--	psu_mask_write(0xFD402374, 0x000000FFU, 0x00000033U);
--	psu_mask_write(0xFD402378, 0x000000FFU, 0x00000002U);
--	psu_mask_write(0xFD40237C, 0x00000033U, 0x00000030U);
--	psu_mask_write(0xFD406370, 0x000000FFU, 0x0000007CU);
--	psu_mask_write(0xFD406374, 0x000000FFU, 0x00000033U);
--	psu_mask_write(0xFD406378, 0x000000FFU, 0x00000002U);
--	psu_mask_write(0xFD40637C, 0x00000033U, 0x00000030U);
- 	psu_mask_write(0xFD40A370, 0x000000FFU, 0x000000F4U);
- 	psu_mask_write(0xFD40A374, 0x000000FFU, 0x00000031U);
- 	psu_mask_write(0xFD40A378, 0x000000FFU, 0x00000002U);
-@@ -678,18 +671,8 @@ static unsigned long psu_serdes_init_data(void)
- 	psu_mask_write(0xFD409978, 0x00000010U, 0x00000010U);
- 	psu_mask_write(0xFD40D978, 0x00000010U, 0x00000010U);
- 
--	serdes_illcalib(0, 0, 3, 0, 4, 0, 4, 0);
--	psu_mask_write(0xFD410010, 0x00000077U, 0x00000044U);
++	psu_mask_write(0xFD40A094, 0x00000010U, 0x00000010U);
++	psu_mask_write(0xFD40A368, 0x000000FFU, 0x00000038U);
++	psu_mask_write(0xFD40A36C, 0x00000007U, 0x00000003U);
++	psu_mask_write(0xFD40A370, 0x000000FFU, 0x000000F4U);
++	psu_mask_write(0xFD40A374, 0x000000FFU, 0x00000031U);
++	psu_mask_write(0xFD40A378, 0x000000FFU, 0x00000002U);
++	psu_mask_write(0xFD40A37C, 0x00000033U, 0x00000030U);
++	psu_mask_write(0xFD40906C, 0x00000003U, 0x00000003U);
++	psu_mask_write(0xFD4080F4, 0x00000003U, 0x00000003U);
++	psu_mask_write(0xFD4090CC, 0x00000020U, 0x00000020U);
++	psu_mask_write(0xFD401074, 0x00000010U, 0x00000010U);
++	psu_mask_write(0xFD405074, 0x00000010U, 0x00000010U);
++	psu_mask_write(0xFD409074, 0x00000010U, 0x00000010U);
++	psu_mask_write(0xFD40D074, 0x00000010U, 0x00000010U);
++	psu_mask_write(0xFD401994, 0x00000007U, 0x00000007U);
++	psu_mask_write(0xFD405994, 0x00000007U, 0x00000007U);
++	psu_mask_write(0xFD40989C, 0x00000080U, 0x00000080U);
++	psu_mask_write(0xFD4098F8, 0x000000FFU, 0x0000001AU);
++	psu_mask_write(0xFD4098FC, 0x000000FFU, 0x0000001AU);
++	psu_mask_write(0xFD409990, 0x000000FFU, 0x00000010U);
++	psu_mask_write(0xFD409924, 0x000000FFU, 0x000000FEU);
++	psu_mask_write(0xFD409928, 0x000000FFU, 0x00000000U);
++	psu_mask_write(0xFD409900, 0x000000FFU, 0x0000001AU);
++	psu_mask_write(0xFD40992C, 0x000000FFU, 0x00000000U);
++	psu_mask_write(0xFD409980, 0x000000FFU, 0x000000FFU);
++	psu_mask_write(0xFD409914, 0x000000FFU, 0x000000F7U);
++	psu_mask_write(0xFD409918, 0x00000001U, 0x00000001U);
++	psu_mask_write(0xFD409940, 0x000000FFU, 0x000000F7U);
++	psu_mask_write(0xFD409944, 0x00000001U, 0x00000001U);
++	psu_mask_write(0xFD409994, 0x00000007U, 0x00000007U);
++	psu_mask_write(0xFD40D994, 0x00000007U, 0x00000007U);
++	psu_mask_write(0xFD40107C, 0x0000000FU, 0x00000001U);
++	psu_mask_write(0xFD40507C, 0x0000000FU, 0x00000001U);
++	psu_mask_write(0xFD40907C, 0x0000000FU, 0x00000001U);
++	psu_mask_write(0xFD40D07C, 0x0000000FU, 0x00000001U);
++	psu_mask_write(0xFD4019A4, 0x000000FFU, 0x000000FFU);
++	psu_mask_write(0xFD401038, 0x00000040U, 0x00000040U);
++	psu_mask_write(0xFD40102C, 0x00000040U, 0x00000040U);
++	psu_mask_write(0xFD4059A4, 0x000000FFU, 0x000000FFU);
++	psu_mask_write(0xFD405038, 0x00000040U, 0x00000040U);
++	psu_mask_write(0xFD40502C, 0x00000040U, 0x00000040U);
++	psu_mask_write(0xFD4099A4, 0x000000FFU, 0x000000FFU);
++	psu_mask_write(0xFD409038, 0x00000040U, 0x00000040U);
++	psu_mask_write(0xFD40902C, 0x00000040U, 0x00000040U);
++	psu_mask_write(0xFD40D9A4, 0x000000FFU, 0x000000FFU);
++	psu_mask_write(0xFD40D038, 0x00000040U, 0x00000040U);
++	psu_mask_write(0xFD40D02C, 0x00000040U, 0x00000040U);
++	psu_mask_write(0xFD4019AC, 0x00000003U, 0x00000000U);
++	psu_mask_write(0xFD4059AC, 0x00000003U, 0x00000000U);
++	psu_mask_write(0xFD4099AC, 0x00000003U, 0x00000000U);
++	psu_mask_write(0xFD40D9AC, 0x00000003U, 0x00000000U);
++	psu_mask_write(0xFD401978, 0x00000010U, 0x00000010U);
++	psu_mask_write(0xFD405978, 0x00000010U, 0x00000010U);
++	psu_mask_write(0xFD409978, 0x00000010U, 0x00000010U);
++	psu_mask_write(0xFD40D978, 0x00000010U, 0x00000010U);
++
 +	serdes_illcalib(0, 0, 3, 0, 0, 0, 0, 0);
- 	psu_mask_write(0xFD410014, 0x00000007U, 0x00000003U);
--	psu_mask_write(0xFD400CB4, 0x00000037U, 0x00000037U);
--	psu_mask_write(0xFD404CB4, 0x00000037U, 0x00000037U);
--	psu_mask_write(0xFD4001D8, 0x00000001U, 0x00000001U);
--	psu_mask_write(0xFD4041D8, 0x00000001U, 0x00000001U);
--	psu_mask_write(0xFD404CC0, 0x0000001FU, 0x00000000U);
--	psu_mask_write(0xFD400CC0, 0x0000001FU, 0x00000000U);
--	psu_mask_write(0xFD404048, 0x000000FFU, 0x00000000U);
--	psu_mask_write(0xFD400048, 0x000000FFU, 0x00000000U);
--
- 	return 1;
- }
- 
-@@ -699,7 +682,7 @@ static unsigned long psu_resetout_init_data(void)
- 	psu_mask_write(0xFF9D0080, 0x00000001U, 0x00000001U);
- 	psu_mask_write(0xFF9D007C, 0x00000001U, 0x00000000U);
- 	psu_mask_write(0xFF5E023C, 0x00000140U, 0x00000000U);
--	psu_mask_write(0xFF5E0230, 0x00000008U, 0x00000000U);
++	psu_mask_write(0xFD410014, 0x00000007U, 0x00000003U);
++	return 1;
++}
++
++static unsigned long psu_resetout_init_data(void)
++{
++	psu_mask_write(0xFF5E023C, 0x00000400U, 0x00000000U);
++	psu_mask_write(0xFF9D0080, 0x00000001U, 0x00000001U);
++	psu_mask_write(0xFF9D007C, 0x00000001U, 0x00000000U);
++	psu_mask_write(0xFF5E023C, 0x00000140U, 0x00000000U);
 +	psu_mask_write(0xFF5E0230, 0x00000002U, 0x00000000U);
- 	psu_mask_write(0xFD1A0100, 0x00010000U, 0x00000000U);
- 	psu_mask_write(0xFD4A0200, 0x00000002U, 0x00000000U);
- 	psu_mask_write(0xFD4A0238, 0x0000000FU, 0x00000000U);
-@@ -708,7 +691,6 @@ static unsigned long psu_resetout_init_data(void)
- 	psu_mask_write(0xFE20C11C, 0x00000600U, 0x00000600U);
- 	psu_mask_write(0xFE20C12C, 0x00004000U, 0x00004000U);
- 	psu_mask_write(0xFD480064, 0x00000200U, 0x00000200U);
--	mask_poll(0xFD4063E4, 0x00000010U);
- 	mask_poll(0xFD40A3E4, 0x00000010U);
++	psu_mask_write(0xFD1A0100, 0x00010000U, 0x00000000U);
++	psu_mask_write(0xFD4A0200, 0x00000002U, 0x00000000U);
++	psu_mask_write(0xFD4A0238, 0x0000000FU, 0x00000000U);
++	psu_mask_write(0xFE20C200, 0x00023FFFU, 0x00022457U);
++	psu_mask_write(0xFE20C630, 0x003FFF00U, 0x00000000U);
++	psu_mask_write(0xFE20C11C, 0x00000600U, 0x00000600U);
++	psu_mask_write(0xFE20C12C, 0x00004000U, 0x00004000U);
++	psu_mask_write(0xFD480064, 0x00000200U, 0x00000200U);
++	mask_poll(0xFD40A3E4, 0x00000010U);
++
++	return 1;
++}
++
++static unsigned long psu_resetin_init_data(void)
++{
++	psu_mask_write(0xFF5E023C, 0x00000540U, 0x00000540U);
++	psu_mask_write(0xFF5E0230, 0x00000002U, 0x00000002U);
++	psu_mask_write(0xFD4A0238, 0x0000000FU, 0x0000000AU);
++	psu_mask_write(0xFD4A0200, 0x00000002U, 0x00000002U);
++	psu_mask_write(0xFD1A0100, 0x00010000U, 0x00010000U);
  
  	return 1;
-@@ -717,7 +699,7 @@ static unsigned long psu_resetout_init_data(void)
- static unsigned long psu_resetin_init_data(void)
- {
- 	psu_mask_write(0xFF5E023C, 0x00000540U, 0x00000540U);
--	psu_mask_write(0xFF5E0230, 0x00000008U, 0x00000008U);
-+	psu_mask_write(0xFF5E0230, 0x00000002U, 0x00000002U);
- 	psu_mask_write(0xFD4A0238, 0x0000000FU, 0x0000000AU);
- 	psu_mask_write(0xFD4A0200, 0x00000002U, 0x00000002U);
- 	psu_mask_write(0xFD1A0100, 0x00010000U, 0x00010000U);
-@@ -1034,6 +1016,157 @@ static unsigned long psu_ddr_phybringup_data(void)
+ }
+@@ -911,6 +1016,157 @@ static unsigned long psu_ddr_phybringup_data(void)
  	return 1;
  }
  
@@ -388,7 +357,7 @@ index 45102302dc..4c904c6c81 100644
  static void init_peripheral(void)
  {
  	psu_mask_write(0xFD5F0018, 0x8000001FU, 0x8000001FU);
-@@ -1050,6 +1183,7 @@ int psu_init(void)
+@@ -927,6 +1183,7 @@ int psu_init(void)
  	status &= psu_ddr_init_data();
  	status &= psu_ddr_phybringup_data();
  	status &= psu_peripherals_init_data();
diff --git a/board/zynqmp/kria/kd240/patches/uboot/0002-arm64-zynqmp-Add-output-enable-pins-to-SOMs.patch b/board/zynqmp/kria/kd240/patches/uboot/0002-arm64-zynqmp-Add-output-enable-pins-to-SOMs.patch
deleted file mode 100644
index 5566dae891..0000000000
--- a/board/zynqmp/kria/kd240/patches/uboot/0002-arm64-zynqmp-Add-output-enable-pins-to-SOMs.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From bf35bdac2adfa7c65c2992d8dedcc24585561732 Mon Sep 17 00:00:00 2001
-From: Neal Frager <neal.frager@amd.com>
-Date: Wed, 13 Dec 2023 13:11:42 +0000
-Subject: [PATCH] arm64: zynqmp: Add output-enable pins to SOMs
-
-Now that the zynqmp pinctrl driver supports the tri-state registers, make
-sure that the pins requiring output-enable are configured appropriately for
-SOMs.
-
-Without it, all tristate setting for MIOs, which are not related to SOM
-itself, are using default configuration which is not correct setting.
-It means SDs, USBs, ethernet, etc. are not working properly.
-
-In past it was fixed through calling tristate configuration via bootcmd:
-usb_init=mw 0xFF180208 2020
-kv260_gem3=mw 0xFF18020C 0xFC0 && gpio toggle gpio@ff0a000038 && \
-  gpio toggle gpio@ff0a000038
-
-Signed-off-by: Neal Frager <neal.frager@amd.com>
-Upstream: https://patchwork.ozlabs.org/project/uboot/patch/20231213134052.2818879-1-neal.frager@amd.com/
----
- arch/arm/dts/zynqmp-sck-kd-g-revA.dts | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/arch/arm/dts/zynqmp-sck-kd-g-revA.dts b/arch/arm/dts/zynqmp-sck-kd-g-revA.dts
-index 56f3128528..12865392a3 100644
---- a/arch/arm/dts/zynqmp-sck-kd-g-revA.dts
-+++ b/arch/arm/dts/zynqmp-sck-kd-g-revA.dts
-@@ -175,6 +175,7 @@
- 		conf-tx {
- 			pins = "MIO36";
- 			bias-disable;
-+			output-enable;
- 		};
- 
- 		mux {
-@@ -226,6 +227,7 @@
- 		conf-bootstrap {
- 			pins = "MIO44", "MIO49";
- 			bias-disable;
-+			output-enable;
- 			low-power-disable;
- 		};
- 
-@@ -233,6 +235,7 @@
- 			pins = "MIO38", "MIO39", "MIO40",
- 				"MIO41", "MIO42", "MIO43";
- 			bias-disable;
-+			output-enable;
- 			low-power-enable;
- 		};
- 
-@@ -241,6 +244,7 @@
- 			slew-rate = <SLEW_RATE_SLOW>;
- 			power-source = <IO_STANDARD_LVCMOS18>;
- 			bias-disable;
-+			output-enable;
- 		};
- 
- 		mux-mdio {
-@@ -271,6 +275,7 @@
- 			pins = "MIO54", "MIO56", "MIO57", "MIO58", "MIO59",
- 			"MIO60", "MIO61", "MIO62", "MIO63";
- 			bias-disable;
-+			output-enable;
- 			drive-strength = <4>;
- 			slew-rate = <SLEW_RATE_SLOW>;
- 		};
-@@ -298,6 +303,7 @@
- 			pins = "MIO66", "MIO68", "MIO69", "MIO70", "MIO71",
- 			"MIO72", "MIO73", "MIO74", "MIO75";
- 			bias-disable;
-+			output-enable;
- 			drive-strength = <4>;
- 			slew-rate = <SLEW_RATE_SLOW>;
- 		};
--- 
-2.25.1
-
diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 78302a48c0..9b145d6990 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -1,11 +1,11 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kd240/kd240.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2 ${UBOOT_DIR}"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.2)/xlnx_rebase_v6.1_LTS_2023.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k24-revA-sck-kd-g-revA"
@@ -15,16 +15,15 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.8_2023.2)/xlnx_rebase_v2.8_2023.2.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.1)/xlnx_rebase_v2.10_2024.1.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="ZYNQMP_CONSOLE=cadence1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.2)/xlnx_rebase_v2023.01_2023.2.tar.gz"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
-BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/kria/uboot.fragment"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_kria"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k24-revA"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
@@ -32,11 +31,11 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.2/kd240-kria/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2024.1/kd240-kria/pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kd240/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/zynqmp/kria/kd240/patches"
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/kd240/patches"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
