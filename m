Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BB6C27C79
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 03:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66F63432B3;
	Tue, 18 Jun 2024 03:39:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JWunFLbWhOiW; Tue, 18 Jun 2024 03:39:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22B15432B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22B15432B5;
	Tue, 18 Jun 2024 03:39:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE3DD1BF31D
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 03:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9255608E0
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 03:39:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VecxB6n05aRl for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 03:39:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2408::613;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D0DC8607A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0DC8607A4
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::613])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D0DC8607A4
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 03:38:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IsCsSuuQbW7rKrV7UXq8zXxgcLXnkMWp6gpGzGq7V+6r+C0qqW1X7jhwCti2gmgR/zsLx4Xkv2TgQbFXVkfNW1rBkkF9lAn1cmh47ODItG2q6rKcdrSOmr1xGqVn5zxwtilpJQMOK6Z0mB3SFmTForiQqrREmVV2lp1Xlad0XAtSDA98/xRVCNd0wIeMkHerv7kHROcdK5YVLqbobV6481FCoKuQ9cAxPsxwyTuKpEfHC5J/dKc/kFpjDPjHRLQ06CTOZCyZVbiSbaVwzJMwjCAyp0vxODUk1mCQdelx2jHLac5ES0H8jDX06BpHO+PTYvzZQQZ+lmcM/dvXvhuK1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FkkYsTvQbferkTnPQWaqWykn7HDCpJHLEorHU/6KH4=;
 b=MIAGcPF1BBjf0mhm/oXm5dSJAaWA41LuLfrJKy3RwPRjLQ09i+qUfE9nE7H/Jp7E8SonJ4dAMaai0Klf9bEzfLj1zEAZOiE7jMa1PCETRDNnJHAwW3VJNU2mZ8tIgVvxW47P7E5897dAN5tGjb3jSHhwr2gjtSK1MZDlPbzKtl5McD/8OomruCWxHuYaZDpWipkmldudgztmhLXAt/+z0SrR6kMRRxAdX9It+Nskobk/TonCM5izp0NWQATmape4ABQ+NliDP39YGYQv7G+giJSpbC8N2o3ru4MtzndgjPLxxIi69C+ZYkHqmR2ABfuBqVe7JKdWyFRP673c+we7hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BL1PR13CA0122.namprd13.prod.outlook.com (2603:10b6:208:2bb::7)
 by DS0PR12MB7581.namprd12.prod.outlook.com (2603:10b6:8:13d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 03:38:55 +0000
Received: from BL6PEPF00022574.namprd02.prod.outlook.com
 (2603:10b6:208:2bb:cafe::33) by BL1PR13CA0122.outlook.office365.com
 (2603:10b6:208:2bb::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31 via Frontend
 Transport; Tue, 18 Jun 2024 03:38:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00022574.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Tue, 18 Jun 2024 03:38:55 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Jun
 2024 22:38:54 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 17 Jun 2024 22:38:53 -0500
To: <buildroot@buildroot.org>
Date: Tue, 18 Jun 2024 04:38:49 +0100
Message-ID: <20240618033849.2389758-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240618033849.2389758-1-neal.frager@amd.com>
References: <20240618033849.2389758-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022574:EE_|DS0PR12MB7581:EE_
X-MS-Office365-Filtering-Correlation-Id: 33a696ac-55fb-48be-6151-08dc8f482df5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|36860700010|1800799021|376011|82310400023|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?giz4dad9Jqk9ae6Oq3fH1EISe/LLCMu1ZYSOGSayoC4C8vagipq1X63XzHMv?=
 =?us-ascii?Q?QlbuVsB6WXg+t0loPYwAG7ILSN3FgT6apCjtCCZgEJ95ssB58l2dYTOTRzEz?=
 =?us-ascii?Q?KHY68c+O9DLcQmqpONWPifNWiDdR9gtGTrTwMwUdKW9xtu1QRhnh9/xcFB5v?=
 =?us-ascii?Q?pIgd6+BQ+jiWW3Le3erlJuwJkNybIPeJZD3yDQLPq7NBjZ9rbEXgomAjCalu?=
 =?us-ascii?Q?adzBODa0vikVFuK5ryf0RtHSz8XtcIOARskRZ3K5Ff/lMFJbe9H91hJmZdgZ?=
 =?us-ascii?Q?HJH2j8aQqfnxUKjATxVe3E9kT9XNsAb9b38Hixwo/weknhBggA5KD6Bo4r8K?=
 =?us-ascii?Q?znoaWn2k2vyKltKgyloSkG6RaXS65E1MdQhYiy1m87u7iAr5rTFOuLfuQZKQ?=
 =?us-ascii?Q?a1umccemHn/zptJ5TNVxfbIxDDSS2JOyAvs39MiMMjTKuq6JpsnrMV9NwuWQ?=
 =?us-ascii?Q?JkUZO/OmtWbClGZOJUFyA0tKw2sl+DjZlRYjVfydyUoZZqmowAY/TIjJufA/?=
 =?us-ascii?Q?vWDEp8OTtf1m2Ep1zUPcQyxrW/uyjUGUNznGPFqeUn4kcFHjJ82UQJs1dTDF?=
 =?us-ascii?Q?zEUrmi0vL4qLXeMuS6zJARYeyuI32oyyr+VMwPC0CjAO6XsW39YHzqHiuH8O?=
 =?us-ascii?Q?1rd1Kdm/JYwSUvgFpxz8CAtpDKJ4tCirxK0FMXSpGjRyenSQKGLGkb1RC7C0?=
 =?us-ascii?Q?0bnYJJn41r3SI2t7AridfsI2BoLZkorrIBR3FayHg2GV4m9RgzZOCWmezMRv?=
 =?us-ascii?Q?wV6Y7oR/weEkIITkaW4BBawHzW5VuR7YRok7lz/dDU+a5Ljd6x6HvnrvOvlw?=
 =?us-ascii?Q?6EZLxIF+NzwQpwDW2f8KdK/hyHOO7M4uhgsudob+Fdcx0bPn04O+2CPcn9F3?=
 =?us-ascii?Q?OHMb3ZQ1FTI1aiAhvu3smKt0itMiBuJU+uJwq/MpB3NNad9i1LyLpYa1Akv5?=
 =?us-ascii?Q?5oFBywJc/z4s++Xk5x289NEeYUPmaf7s4aNPhrlu5twcpBHmEugTAgAYF3Xd?=
 =?us-ascii?Q?DchWMup84hg453vCaoF2642HSownWXL404Aht3NbSJ0MrLfAo39HuuEh9t2l?=
 =?us-ascii?Q?J8uVTlnLdwpHwKgnwd6rDje2Bwe1YKSu2+7/yTS0A4aU3BNMtLLZ9l14y6zp?=
 =?us-ascii?Q?A5yLhD3/xOugLY1uljC9GMd+IIcLYkBo3KEjqfsXJZKvblLoMg3r/SZU9b7O?=
 =?us-ascii?Q?RfCp4ltskr1/il0ooI1uTs5hyokP8BJZ5til/4MtdI0tP4WgeGMb3Ulhnlbl?=
 =?us-ascii?Q?uXHBqCXDy/39yOFGxtzzEoBe9y021nio8zTpJQ79QbT4ROBbWiXlap2F3Xt8?=
 =?us-ascii?Q?dR/QhxjHGtTYL4ttzMMsXW6Ygmrt+TVG5c5bFWA43N6926G9c3OK+O5jC6Am?=
 =?us-ascii?Q?Q+A0MZKhrJVV6vCVyRuZC2jfhqNDcaBqubvIjVjBS7AMVX8KMIxNFKpJBIE+?=
 =?us-ascii?Q?W0NoJ/wWVMfDduJnXkqkGyOUVJH6LcaF?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230037)(36860700010)(1800799021)(376011)(82310400023)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 03:38:55.0459 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a696ac-55fb-48be-6151-08dc8f482df5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022574.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7581
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FkkYsTvQbferkTnPQWaqWykn7HDCpJHLEorHU/6KH4=;
 b=eIm3op1ujz7Fh0NuttvSjtGhXA7oC+7qP+QdtJ3OnLgTf87W9FxeJ3y0T5N93AyqmtZ+vFu9n7cErkOmh375gUbVEjPh5+KAm4otdrbvRvddw2c9Dkhepdr+cCzua2D8N0j/ygEjHiahl2SYywlg6ros60wfdXye0JEjbLgmgSQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=eIm3op1u
Subject: [Buildroot] [PATCH v4 2/2] board/zynqmp: cleanup
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
 Neal Frager <neal.frager@amd.com>, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that all zynqmp defconfigs have been bumped to xilinx-v2024.1, this patch
cleans up the board/zynqmp dir by removing files that are no longer necessary.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V4:
- new patch included with v4
---
 board/zynqmp/kria/uboot.fragment                      | 11 -----------
 ...-build-add-support-for-new-binutils-versions.patch |  1 -
 .../0002-build-tools-avoid-unnecessary-link.patch     |  1 -
 3 files changed, 13 deletions(-)
 delete mode 100644 board/zynqmp/kria/uboot.fragment
 delete mode 120000 board/zynqmp/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
 delete mode 120000 board/zynqmp/patches/arm-trusted-firmware/0002-build-tools-avoid-unnecessary-link.patch

diff --git a/board/zynqmp/kria/uboot.fragment b/board/zynqmp/kria/uboot.fragment
deleted file mode 100644
index d8efc230a0..0000000000
--- a/board/zynqmp/kria/uboot.fragment
+++ /dev/null
@@ -1,11 +0,0 @@
-CONFIG_SYS_SPI_U_BOOT_OFFS=0xF80000
-CONFIG_MULTI_DTB_FIT=y
-CONFIG_DTB_RESELECT=y
-CONFIG_DMA=y
-CONFIG_XILINX_DPDMA=y
-CONFIG_PHY=y
-CONFIG_PHY_XILINX_ZYNQMP=y
-CONFIG_PINCTRL=y
-CONFIG_PINCONF=y
-CONFIG_VIDEO_ZYNQMP_DPSUB=y
-CONFIG_SF_DEFAULT_SPEED=40000000
diff --git a/board/zynqmp/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch b/board/zynqmp/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
deleted file mode 120000
index 8ad996914b..0000000000
--- a/board/zynqmp/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
+++ /dev/null
@@ -1 +0,0 @@
-../../../../boot/arm-trusted-firmware/v2.8/0001-feat-build-add-support-for-new-binutils-versions.patch
\ No newline at end of file
diff --git a/board/zynqmp/patches/arm-trusted-firmware/0002-build-tools-avoid-unnecessary-link.patch b/board/zynqmp/patches/arm-trusted-firmware/0002-build-tools-avoid-unnecessary-link.patch
deleted file mode 120000
index fecdee5449..0000000000
--- a/board/zynqmp/patches/arm-trusted-firmware/0002-build-tools-avoid-unnecessary-link.patch
+++ /dev/null
@@ -1 +0,0 @@
-../../../../boot/arm-trusted-firmware/v2.8/0002-build-tools-avoid-unnecessary-link.patch
\ No newline at end of file
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
