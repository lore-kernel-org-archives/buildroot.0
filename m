Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3FAE77199
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 06:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EA38404B6;
	Tue,  7 Jan 2025 06:32:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ibp0AHAuIqjo; Tue,  7 Jan 2025 06:31:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70F1F404A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70F1F404A2;
	Tue,  7 Jan 2025 06:31:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CA646B
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 06:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08C3A60731
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 06:31:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gqfrOfn5cg_e for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 06:31:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::612;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3860860666
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3860860666
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::612])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3860860666
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 06:31:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FC5mFb0Mu2KCZIDTD+V7fk/GdRiy5ceEgk+5yU9vf68lzFHNEcTLZj2+jn1AJ1nxMzIXHEqdlSI/JZEOtojNHj9DQJF3BjQmec1XJbCjH3OdjFcGaGT4DB2Foh2ROMRaIYDP1xttfpb1QaUqsAALusM+SlsJnVldCevlN8c5nZyMKKDH67wjZW/lT5PXZAZz2G/eoVJHqWcfIkQAv5rEF+8X4E7jr4uZcMfKAI08JJHlvfDnN2o0X3s9KtwEORwMO2wS/cEHc6oA9aHzBqhpGlR4LyIF8H4P7qBsqAQaZryeD8/UNdEkhJt1WG6n9199oRQmp0Xuyusvxc32YI/2ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9FlxOiahQtXUyOIfCBuKGfaAQzQ8WV2Fmivtd3OSFGg=;
 b=eD8SXnay5yuQByuYg0ylOjQGmJlO1dKZhkJg86rLuUwE7FRHYki1EvlPRgFKTreZ4q1pYz5fLWI2munqeUdnQk66cvC2DPda2TGOKz/7M4Q9/6otD5MTk+xM4fao8gTSYgtdErbaFAs+MaYFddhfKOePrxm4oi3X2cCG6ENVV/FzoxFfFwt7ohUDmJ6pdGcaLLTW2VimqmwEN7tK4I8HHZyVDakSgxdARffErDonXLQmFUfudihazmJ9bzmnSXHFMgg/6WqJCPvUdLnYBaW2fCWwVxZH++1+QLVMUioxvGl10qi+zUZkLxTRwPBSpqunYGjfLE3LTyn1WOoageoskA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BY5PR04CA0028.namprd04.prod.outlook.com (2603:10b6:a03:1d0::38)
 by DS0PR12MB7678.namprd12.prod.outlook.com (2603:10b6:8:135::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 06:31:44 +0000
Received: from CO1PEPF000044F3.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::8b) by BY5PR04CA0028.outlook.office365.com
 (2603:10b6:a03:1d0::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.10 via Frontend Transport; Tue,
 7 Jan 2025 06:31:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F3.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Tue, 7 Jan 2025 06:31:44 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 00:31:43 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 00:31:42 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 7 Jan 2025 00:31:41 -0600
To: <buildroot@buildroot.org>
Date: Tue, 7 Jan 2025 06:31:32 +0000
Message-ID: <20250107063136.787314-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250107063136.787314-1-neal.frager@amd.com>
References: <20250107063136.787314-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F3:EE_|DS0PR12MB7678:EE_
X-MS-Office365-Filtering-Correlation-Id: 568c0f78-d979-4b0c-8d5c-08dd2ee4f440
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ut1ASvomOyGcqGPUykDYClzS6XUfG06vRT9WZ9qMdXBuupt1vtsFtnusesrz?=
 =?us-ascii?Q?HVU7SXhdd/baMko9Vu9/NLoS3bjXBHWZ0lFN3KZ5rOitypnGSNnK/oDJ9+TY?=
 =?us-ascii?Q?hf5y0gAIlNgOn4CUST7EdszGQZPJJsbOR25XUgB67l1lDV3fVY8faFnDJM0u?=
 =?us-ascii?Q?0CcX2kDX/LRlGigkTH8EpVhgPLCRLi6MqxmT8RngPPnqH+4jwDs03sZh6/9A?=
 =?us-ascii?Q?+vSKxAtAiThoK4BvziXIgcdSt6HpIKGMqTVzq5qbDjgo8OkPAtQYmkHXhiDs?=
 =?us-ascii?Q?yNN0xGNDATDbR8KmOnwuJ3yEYVs/1x9tSwuTIMqBF3ZiegRiBd4ZIv0DfcP9?=
 =?us-ascii?Q?4uta3g397IzlKMQTXafM+LSd34gx9bdfB6CNnVEIu8hQFD95EuF0find9t4P?=
 =?us-ascii?Q?CH3eaXuLv8UweqEbmwsfgZgzWkHNdELJlUV7zOVwTJghHIbH3jftJUwsGNJ6?=
 =?us-ascii?Q?bKyd2YlkreOLYO8OCvaPTToQ2FHwbNisIVPTuqguZfkOjgOlvFCCZRuVZgUi?=
 =?us-ascii?Q?RyYCNfk26Pn3slnr/O7JugwvvMynHKkUB6OtnzxPZRSrmSOxf+10bKFyYZ0w?=
 =?us-ascii?Q?iwDV6n3fezKk1fGLBLddGP+xVtV1CZ/D+4S5ta7ou6E/cJ2xbZz5+hv4zXHe?=
 =?us-ascii?Q?Ojvt62HhdgZP+lfqS/+iraxy5mhibAsuruXO8p1fJBflNivTvXS778I7QcD/?=
 =?us-ascii?Q?aOfEXk3a2y47+KnPn3ANrbSblH0QkGEh8wjDhOzpY9odPN5OjRZWK7Zm8usq?=
 =?us-ascii?Q?b0cqzcm6yq+f8fBCvJpCOvjpjhl1vmOLtlfmsvSbogZbke59VZZGMx+ZaAO+?=
 =?us-ascii?Q?JcDQ7YC7fRZj3ohj77MKSjDNnumJJObwW3FjOsLyBtuU8jWadA7D1lgz1NEZ?=
 =?us-ascii?Q?j6VsAUT89UnbH+5UsqyG54YKnB9Kl2RZXZd4Vzcsn1jZkSrsa25amhVPU3hk?=
 =?us-ascii?Q?6+hXuYa2KO8l3dat86Enw4Rh4MhNN+VblKQGwczeMTSD8Ef+RT39px2S6Xc8?=
 =?us-ascii?Q?zdkOKsrWZOYUsD8jeDoe01YBh7Gv0KbjCt4/BH8H1mEIRDLWdhmczw+Zc727?=
 =?us-ascii?Q?cz12vf0jGLxXLQM11VFjn29L0n1MIn05UlPj75q9My1OR3vwfBCp56QZrwKR?=
 =?us-ascii?Q?MdRnRowBjI9gz8VS2ucNpwiTz4ropkF1dylIPOE87rTqcOmP6/eaQci30kv4?=
 =?us-ascii?Q?t9UPSeKAMzjAeB6U64apnF9NfGD4AzaqrAiipduq04BluwXszN0HqpiqkV7r?=
 =?us-ascii?Q?F5cXj34kWetHR8UWml0hfGFjh3/HdBBcqn6vQdYWJbS5EhIb81UbcMppcAB5?=
 =?us-ascii?Q?TYnUHNH5ejKu96wr5K7F7CduGgnqWNzGJTqRUliOAkNL1lUz5zZOJt7nZS5o?=
 =?us-ascii?Q?HLUy6UwTbqb7+c+GFU5uUHMkJw2zdKhQO9osUrLvob7Wl/LP36AFiYpN4oSp?=
 =?us-ascii?Q?pAVq3R7G79VNRjYA06S95JmH7/BqFkw6N/gRli5B3QKQkNAfs+0dxg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 06:31:44.0208 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 568c0f78-d979-4b0c-8d5c-08dd2ee4f440
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7678
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FlxOiahQtXUyOIfCBuKGfaAQzQ8WV2Fmivtd3OSFGg=;
 b=OE8Gb4YOFFUDuDJcABnopVl7npnWEFnJzAq9EA2q8JYSJ1hAZa9JipkNRszgmE/Sa5VudDjXhZP5wGtD3BvhoSpDPT9b/wvaKLup2/CCHupCDhtiKV6df47mhFkbSkwMu3xrYHjwnxMmmiwHK3DJ6iQ02NyqVyFNc/b+2pjM6CU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=OE8Gb4YO
Subject: [Buildroot] [PATCH v4 2/6] boot/uboot: add qspi.bin file support
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
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

u-boot has introduced a new file called qspi.bin for users who boot from a
qspi flash device.  It combines the spl/boot.bin and u-boot.itb files into a
single binary that can be written to the qspi flash.

Here is an example of how binman generates the qspi.bin:
https://source.denx.de/u-boot/u-boot/-/commit/a4c98119109a60b9b236996f47065aa8fc0de9ca

At the moment, the qspi.bin is only used for the zynqmp platform, but other
platforms may adopt it, so the buildroot support has been made in a generic
way.

This patch adds the necessary support for buildroot to install this binary.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
 - added dependency on BR2_TARGET_UBOOT_ZYNQMP
V2->V3:
 - no changes
V3->V4:
 - changed config to BR2_TARGET_UBOOT_FORMAT_QSPI_BIN
---
 boot/uboot/Config.in | 8 ++++++++
 boot/uboot/uboot.mk  | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 8648d6eb7e..be3605ab5b 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -446,6 +446,14 @@ config BR2_TARGET_UBOOT_FORMAT_SD
 
 	  See doc/README.mxs (or doc/README.mx28_common before 2013.07)
 
+config BR2_TARGET_UBOOT_FORMAT_QSPI_BIN
+	bool "qspi.bin"
+	depends on BR2_TARGET_UBOOT_ZYNQMP
+	help
+	  When booting from qspi flash, u-boot can generate a single
+	  file for flashing by combining the spl/boot.bin and u-boot.itb
+	  files into a unified binary.
+
 config BR2_TARGET_UBOOT_FORMAT_STM32
 	bool "u-boot.stm32"
 	depends on BR2_arm
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index fd0323bb71..af87128c2f 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -108,6 +108,10 @@ UBOOT_MAKE_TARGET += u-boot.itb
 endif
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_QSPI_BIN),y)
+UBOOT_BINS += qspi.bin
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMX),y)
 UBOOT_BINS += u-boot.imx
 UBOOT_MAKE_TARGET += u-boot.imx
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
