Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D81D6EBF1
	for <buildroot@archiver.kernel.org>; Fri, 29 Nov 2024 09:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF2BD811CB;
	Fri, 29 Nov 2024 09:53:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K768M8R2Q51d; Fri, 29 Nov 2024 09:53:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9D6682089
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9D6682089;
	Fri, 29 Nov 2024 09:53:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 491EDA6A
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 09:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29C0D606CC
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 09:53:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2vPiD5IaVKqo for <buildroot@buildroot.org>;
 Fri, 29 Nov 2024 09:53:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::603;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B7339605C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7339605C8
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::603])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B7339605C8
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 09:53:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nmr8DHN2+WqlaNnQZGBef51D+DI8PA18SMEkAXTRKho5tsU82ivSyvln7GPHY210on5odHAvwbZgvybDkoBJuGb99LJ0CZ3nblyxxdchy6EI6viu66OVuXdCbllDkxxsMDr6mQiI9SoR7ZQWHVwatrjiHbPoDkBvDXeCtAbsz1mgDnclYOpPtlHMXqlqGHNGAL+/PVc9qa99O99yy0QcUvXRzIb6LyHLvXK8QBwPFSIDr2P9pKCgQpf8P5G4AvK/6x7j+VXX+tdpjdxXIK5n7XdS5wimPRPHsAno98su4Zjz3aWag2XgSOV9hvFPISBJCr9lFrDIDtQRTtgOq6hgdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeoTlUXlQHZt/GZZNTK+yXrTe4KS7O1ELndqv5BGVZc=;
 b=cPOq0x77BgKDGmvO2zmZIO5VTmarJgfpW1QPTaMEEHjOzpKl7e7bzNsmq2r2j6rN/WQ20y65NsnDg5M2Zu2LsBJhtHG5zVvHsNO+kcWOEoSghn5At2li1aQ2nRdr2Ymw7UMCMB4ny8n79pXNG7otwROM0feX3wu9eI9VzR7HVRP6cNAz7D/T9tPCpglGp7DDBJwOpEP0/xlSJbXJWB0CMEavao7VXO911OjF6MaSYYBHa6MtYqN5QOMtdNw2l/mkSrg1OP7WEz7lKhhkyX4trFCOWMZZiqzcqPdVVJxrGLjwNc3gic7BkkVC3N5HuYiTVCw5wUM/Hd5gNu8xVMDhMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH2PR07CA0052.namprd07.prod.outlook.com (2603:10b6:610:5b::26)
 by SJ0PR12MB6685.namprd12.prod.outlook.com (2603:10b6:a03:478::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Fri, 29 Nov
 2024 09:53:16 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:610:5b:cafe::5e) by CH2PR07CA0052.outlook.office365.com
 (2603:10b6:610:5b::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.14 via Frontend Transport; Fri,
 29 Nov 2024 09:53:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.0 via Frontend Transport; Fri, 29 Nov 2024 09:53:15 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 29 Nov
 2024 03:53:14 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 29 Nov 2024 03:53:13 -0600
To: <buildroot@buildroot.org>
Date: Fri, 29 Nov 2024 09:53:01 +0000
Message-ID: <20241129095304.950313-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|SJ0PR12MB6685:EE_
X-MS-Office365-Filtering-Correlation-Id: 91b38efc-865b-4bc2-fffc-08dd105ba4ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?X3ZeeTqpR2yfok3GBZAAjyly+Dk68BKWsn2uRDlXDX4VnTz8qdBnfMxgHvrw?=
 =?us-ascii?Q?F+VVcc1RhPmiXKaMUX25YWrVC/peO1BVhzSXnq/F0uNjye6QifaxOpn+ZAsf?=
 =?us-ascii?Q?TRVjqdhRQG3nxxIZAar80kb2R3AMk0upVWkp4MfVnJiGsaxiHqWwEJgEsFPu?=
 =?us-ascii?Q?Gw0WEHDyU56Up/3l/oewxrkCEEELfwOhhJEYzPc6y/TBzkKCKaxYD9LhZP07?=
 =?us-ascii?Q?jhOgNCvrnFWPGQf92m1xZ73bhrQ28QYG6ea4fObkWxyqTHEJ2hdeXda4JgIn?=
 =?us-ascii?Q?bC7zPF73bQbdIeMxTaiMSWXFNofIOs6LrHBE4uyyogL5WWEfcBbOfB7xBpiz?=
 =?us-ascii?Q?trGaylHDNQwS9BWcD3NG+MExu9bZyt4q+WlNfEmNf2Q13rFZn/yTXqOGZNiH?=
 =?us-ascii?Q?Uv5bcO1GHCIEfQ14id9BzSSpvlGGHCkywsSFlgQ7xA6rOqiIj0/1lJsIs6S+?=
 =?us-ascii?Q?e+WNHpENF3Pi3eMfx66e7pcrihjr7s58sC4VC9AjxO8pNUdexGBn9+Yq0dSm?=
 =?us-ascii?Q?ouGLZCEsYOQSU3sE6C7kSD3CKbYxyVEvlqVeIsN4gEumMcBtvAZCEk+q/xDR?=
 =?us-ascii?Q?viiLZhbP7DdnnUBTv3HO0YFRY0czToxdoXwaytbVRJIHKES7B03fIoUUJ/dW?=
 =?us-ascii?Q?kZsnyR8ntyp582xtd2UsH72TL+NZKwKpDRggHzagvcWP/sIysq9c2/t849RW?=
 =?us-ascii?Q?puhPKt92tlx6fzR/pIhUgy3VU9y8sWF7IcDBXdDN9n0y6isRO9ZjTjICOwyZ?=
 =?us-ascii?Q?nRf5VbTnrQ1CGle/LideujclD+39XMOXahTku5orYGDc1JE5DJC+Thqa9j9R?=
 =?us-ascii?Q?YPI1n7ASmWgmdbhe1xSLHLfLoMOq12ZtT1WHaMVulHDYB3ucnQmueiN0Tuc1?=
 =?us-ascii?Q?mhd4JYerzrnxSR2ZeQllmBuyqUx9Gt/esg32P9FjWkk2ZDlUfksH+6cM5T3j?=
 =?us-ascii?Q?lkrpdUAMK+eLCYvGVoZmZf+ABU4lGq9BAdtmtqwxfZYHiMyaXkiE5Aiuooeh?=
 =?us-ascii?Q?3eQHAVJ2eeY/6KN1H9idBUSkJiGhqnRta5WC3M6bEnpeP6+u7vI5QHvfAAcd?=
 =?us-ascii?Q?zHKbdnaD77f9kWk95cgKOog0sHBTH+5v5DeNiD3ZR1p4U66IAxE4zYXAiEp7?=
 =?us-ascii?Q?gGd8jDqTzcprpy8q6IzhgDUYdbOYeEHC/bVlmTSepwE6yzJZl8+B1CS6oNmL?=
 =?us-ascii?Q?fINUUHk7DntqIDbnI7YPTdyIkC4GL0bJ3K8OkvVOt8FicF5C/lYcj/NN9Fpb?=
 =?us-ascii?Q?7FFGD50A2MjAFl1mC5M+g8ZFcdXAybvKiUFxN5bKMAAdRGSttk/ioRHHF3Ov?=
 =?us-ascii?Q?Ouj82UG7ckbsKGDerPqVDKeP5r2w7DN3ammJ+1Y7wEYdztkKQRfgb7GADcLQ?=
 =?us-ascii?Q?dWZQ6MPo06H5VJIMIIUQaa08511E7hySIXtzTm1LKDKu1HoU9fKTVsOv/UlH?=
 =?us-ascii?Q?lWK1F5baH4c=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 09:53:15.0629 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91b38efc-865b-4bc2-fffc-08dd105ba4ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6685
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeoTlUXlQHZt/GZZNTK+yXrTe4KS7O1ELndqv5BGVZc=;
 b=ZNuL/Z9p30NEK2uJhgfJUg0ZbmZFPMwVF5e082UitzmHcXOzk6fYQpO1cijT+csgbm47hM2PXLRNZr2Fdhb80uUcZy4BWBcHfPuzrEHmUI+1bJL40hhXfk2nclg81hfLMjSQhFrC/NdZbRmnqwLKCus5bpd58Y+cA7eAVINHzT8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ZNuL/Z9p
Subject: [Buildroot] [PATCH v1 1/4] configs/zynqmp_kria_kd240_defconfig:
 bump to xilinx-v2024.2
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
 romain.naour@smile.fr, michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynqmp_kria_kd240_defconfig to xilinx-v2024.2 which
includes the following updates:

- ATF v2.10
- Linux v6.6.40
- U-Boot v2024.01

The board specific u-boot patch for the kd240 is no longer necessary, as it is
included with the xilinx-v2024.2 release tag.

The following patch has thus been removed:
board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Enable-usb3-for-k24-som.patch

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 ...arm64-zynqmp-Enable-usb3-for-k24-som.patch | 81 -------------------
 configs/zynqmp_kria_kd240_defconfig           |  8 +-
 2 files changed, 4 insertions(+), 85 deletions(-)
 delete mode 100644 board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Enable-usb3-for-k24-som.patch

diff --git a/board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Enable-usb3-for-k24-som.patch b/board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Enable-usb3-for-k24-som.patch
deleted file mode 100644
index 0cc10d344e..0000000000
--- a/board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Enable-usb3-for-k24-som.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 73c99c29508d7adfe11b6a81f13cf00efab5f9de Mon Sep 17 00:00:00 2001
-From: Neal Frager <neal.frager@amd.com>
-Date: Tue, 4 Jun 2024 09:15:23 +0100
-Subject: [PATCH] arm64: zynqmp: Enable usb3 for k24 som
-
-This patch corrects the mio and pll configuration registers for using usb3
-on the kd240 starter kit.  Without this patch, the usb3 to sd card bridge does
-not initialize correctly and u-boot is unable to find the OS located on the
-kd240 starter kit sd card.
-
-In addition, this patch correctly configures mio76 and mio77 as gpio pins
-which are used as reset gpio pins on the kd240 starter kit.
-
-Signed-off-by: Neal Frager <neal.frager@amd.com>
-Upstream: https://patchwork.ozlabs.org/project/uboot/patch/20240604083854.2033917-1-neal.frager@amd.com/
----
- .../zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c  | 23 ++++++++-----------
- 1 file changed, 10 insertions(+), 13 deletions(-)
-
-diff --git a/board/xilinx/zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c b/board/xilinx/zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c
-index 166e61431b..274203ffaa 100644
---- a/board/xilinx/zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c
-+++ b/board/xilinx/zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c
-@@ -528,8 +528,8 @@ static unsigned long psu_mio_init_data(void)
- 	psu_mask_write(0xFF180124, 0x000000FEU, 0x00000002U);
- 	psu_mask_write(0xFF180128, 0x000000FEU, 0x00000002U);
- 	psu_mask_write(0xFF18012C, 0x000000FEU, 0x00000002U);
--	psu_mask_write(0xFF180130, 0x000000FEU, 0x000000C0U);
--	psu_mask_write(0xFF180134, 0x000000FEU, 0x000000C0U);
-+	psu_mask_write(0xFF180130, 0x000000FEU, 0x00000000U);
-+	psu_mask_write(0xFF180134, 0x000000FEU, 0x00000000U);
- 	psu_mask_write(0xFF180204, 0xFFFFFFFFU, 0x50000000U);
- 	psu_mask_write(0xFF180208, 0xFFFFFFFFU, 0x00B02020U);
- 	psu_mask_write(0xFF18020C, 0x00003FFFU, 0x00000FC0U);
-@@ -569,21 +569,16 @@ static unsigned long psu_peripherals_init_data(void)
- 	psu_mask_write(0xFD1A0100, 0x0001807CU, 0x00000000U);
- 	psu_mask_write(0xFF5E0238, 0x001A0000U, 0x00000000U);
- 	psu_mask_write(0xFF5E023C, 0x0093C018U, 0x00000000U);
--	psu_mask_write(0xFF5E0230, 0x00000008U, 0x00000000U);
-+	psu_mask_write(0xFF5E0230, 0x00000002U, 0x00000000U);
- 	psu_mask_write(0xFF5E0238, 0x00000001U, 0x00000000U);
- 	psu_mask_write(0xFF180390, 0x00000004U, 0x00000004U);
- 	psu_mask_write(0xFF5E023C, 0x00000400U, 0x00000000U);
--	psu_mask_write(0xFF5E0238, 0x00000040U, 0x00000000U);
--	psu_mask_write(0xFF180310, 0x00008000U, 0x00000000U);
--	psu_mask_write(0xFF180320, 0x33840000U, 0x02840000U);
--	psu_mask_write(0xFF18031C, 0x7FFE0000U, 0x64500000U);
--	psu_mask_write(0xFF180358, 0x00000008U, 0x00000008U);
--	psu_mask_write(0xFF180324, 0x03C00000U, 0x00000000U);
-+	psu_mask_write(0xFF5E0238, 0x00000080U, 0x00000000U);
- 	psu_mask_write(0xFF5E0238, 0x00000400U, 0x00000000U);
- 	psu_mask_write(0xFF5E0238, 0x00008000U, 0x00000000U);
- 	psu_mask_write(0xFF5E0238, 0x00000010U, 0x00000000U);
- 	psu_mask_write(0xFF5E0238, 0x00007800U, 0x00000000U);
--	psu_mask_write(0xFF5E0238, 0x00000004U, 0x00000000U);
-+	psu_mask_write(0xFF5E0238, 0x00000006U, 0x00000000U);
- 	psu_mask_write(0xFF5E0238, 0x00040000U, 0x00000000U);
- 	psu_mask_write(0xFF4B0024, 0x000000FFU, 0x000000FFU);
- 	psu_mask_write(0xFFCA5000, 0x00001FFFU, 0x00000000U);
-@@ -591,13 +586,15 @@ static unsigned long psu_peripherals_init_data(void)
- 	psu_mask_write(0xFFA60040, 0x80000000U, 0x80000000U);
- 	psu_mask_write(0xFF260020, 0xFFFFFFFFU, 0x05F5DD18U);
- 	psu_mask_write(0xFF260000, 0x00000001U, 0x00000001U);
--	psu_mask_write(0xFF5E0250, 0x00000F0FU, 0x00000202U);
-+	psu_mask_write(0xFF0A0284, 0x03FFFFFFU, 0x01000000U);
-+	psu_mask_write(0xFF0A0288, 0x03FFFFFFU, 0x01000000U);
-+	psu_mask_write(0xFF0A0014, 0x03FF03FFU, 0x02FF0100U);
- 
- 	mask_delay(1);
--	psu_mask_write(0xFF5E0250, 0x00000F0FU, 0x00000002U);
-+	psu_mask_write(0xFF0A0014, 0x03FF03FFU, 0x02FF0000U);
- 
- 	mask_delay(5);
--	psu_mask_write(0xFF5E0250, 0x00000F0FU, 0x00000202U);
-+	psu_mask_write(0xFF0A0014, 0x03FF03FFU, 0x02FF0100U);
- 
- 	return 1;
- }
--- 
-2.25.1
-
diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 8cbc172a41..d47c3e27e5 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -1,13 +1,13 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/kd240/patches board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kd240/kd240.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2 ${UBOOT_DIR}"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.2)/xlnx_rebase_v6.6_LTS_2024.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k24-revA-sck-kd-g-revA"
@@ -17,14 +17,14 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.1)/xlnx_rebase_v2.10_2024.1.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.2)/xlnx_rebase_v2.10_2024.2.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="ZYNQMP_CONSOLE=cadence1"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.2)/xlnx_rebase_v2024.01_2024.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_kria"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
