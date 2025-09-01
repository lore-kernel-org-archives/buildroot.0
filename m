Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3D6CA1002
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 08:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE70A60DA3;
	Mon,  1 Sep 2025 08:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yWQE1ApI27gu; Mon,  1 Sep 2025 08:37:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBAEC60D6F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBAEC60D6F;
	Mon,  1 Sep 2025 08:37:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DDBC169
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5372060D6F
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:37:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id skk69KBdEobQ for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 08:37:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::603;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3FE9360A6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FE9360A6E
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::603])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FE9360A6E
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:37:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0t//6X6QJ2gvOs8sh9PgSj1dJ1T4ESCcGl5soQE9l2MDOYu9/GuECJklUbwVR4YNMetJSjluUk1sRKgoZRmOHIXtJKJGBwnmFatI/ixCUpTA8jwRwaUEdHPltMQ7ujws92maujKGDQqbJjJ5HeP4MaKr17fwZQaCPJ8y0chv+72dytyrWh+3G0SQpMM346Rn7x/h19rpCraJZ55Wb1PpJrT42z0vSwkFS6QlbsU9Ucssdz/67xIchIrBWXj5JFbLKxco3tmuDHbVRCEPdW8hvc4i8PvmXNyAHxh54W9X6wtYKnETvI4lQy9Oz7fsieDeNUlpQsdpbV3KOT3Z64ZQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4GelRkKjGDIgod9dEF1D8wWa17l1wyc74J2AYq4yRI=;
 b=ToP1uim3lh8cy7Eq0fH6rNo//glST/1q8IFOc04WRDsAOqL5gMoiHcvDipkfDG42ko5jejt4hJg6JSnnxNnmIaqerur96yA6iNiw5vs06+0E/Sy5BPPdimfp05ir9LogUlUQIBgIoDyZEUq0/agxaAASM4ex6Irm+llkgbizkHuqURaN3nDvfooLkTL7138IqUqBstMl6qRZ4QHY1qECOpx74OLq7ZqbdOKoooba1fr1VMmgYMobctdarbbSEG62oiTXfeQxbySMWpub7I/17TIguOK2uCZUX7+mg2vFPrAW+SuqUHCakPt0PkUWvaIj+9qs3Zv+0lplkSUcns72LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BL0PR0102CA0040.prod.exchangelabs.com (2603:10b6:208:25::17) by
 IA1PR12MB6090.namprd12.prod.outlook.com (2603:10b6:208:3ee::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Mon, 1 Sep
 2025 08:36:58 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:208:25:cafe::53) by BL0PR0102CA0040.outlook.office365.com
 (2603:10b6:208:25::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Mon,
 1 Sep 2025 08:36:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Mon, 1 Sep 2025 08:36:57 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 03:36:57 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 1 Sep 2025 03:36:55 -0500
To: <buildroot@buildroot.org>
Date: Mon, 1 Sep 2025 09:36:47 +0100
Message-ID: <20250901083648.458639-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250901083648.458639-1-neal.frager@amd.com>
References: <20250901083648.458639-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|IA1PR12MB6090:EE_
X-MS-Office365-Filtering-Correlation-Id: 44a45db1-790f-498b-9be3-08dde932b68b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|7416014|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dsBf9dyS08VrZUwWw3dA6VJ/VGEdG6pYTKQZCRsp05xk25TDDwK3tlE6v4D2?=
 =?us-ascii?Q?ZKFParCEJNKLmTzkmo/BaqoJhd4Kagp51cGCeUJMfCdm1rkyfOzaug6rWtxZ?=
 =?us-ascii?Q?TVPCJwdC2PfClkE0ypYYl3BtDSgdtuto3oyOHUb6NOGvRE5kzN89vv+2oQsN?=
 =?us-ascii?Q?9wJq6CSrqxdaP2VBanbenLG6d2/ZIQxTWE6s4W9SmxtadLJJeBstuMCPbZlE?=
 =?us-ascii?Q?NOuncOuxp/8E0gWZGZtTJOk8BEGEaOa0Ftyjl8DKnqzamVdD+zU2y0N6ZvBN?=
 =?us-ascii?Q?ENokiOMtUODFn4qhpEwOf7AJ1pVtQLxu7evWTu3YQIyCexHUPHfhzz03FHfJ?=
 =?us-ascii?Q?33/i0TSixgL0rl5FWnVSYw1S22i7rqnBVGHGlrMY5+/xXjep4pQPB4gYatOs?=
 =?us-ascii?Q?F85KOoqu9AqNcqdIam4pGvIhC8ohiVNWPjlDZ9hgiVSJQmgKnNZzQD4ynK8F?=
 =?us-ascii?Q?bEF7a3DVs5ygKUKQXeUe+HKkcSgaYkXhW7pWFwBshn1hw96MP1cs5GiK5ob2?=
 =?us-ascii?Q?s3BlnYcz0nXf5YJNwAq+zObDW9SPs5o4zfKsZmYm2njlRonFaTZGKM0afiAS?=
 =?us-ascii?Q?DbPyC7FBBpKw1fmfmWyKtBR3KCNaPG36lktfYVMx55vMJOFI1smLbTksyjNn?=
 =?us-ascii?Q?tVN6VArJqHjT9HIdIPOlZkyRD1q/j/3gpT21fPw8neopqi6EsYvaUncSE2yG?=
 =?us-ascii?Q?5VJ2HpgRWlKRxNdo+iItf54pLcxew6jv8kVtXwwIKThpxw49oqmN1qW/umxn?=
 =?us-ascii?Q?r6EBcMCSZBrW6WeRE1wLc1IPgvEwMHL66nBWW+AW7VH62FHzKPA3cdcNEvsr?=
 =?us-ascii?Q?BgpBZ/ShblPZBkebO4gEiMYyCjhTZ3vN/BoYsQ9Gbnp0//LV/n8+J8zJ12rz?=
 =?us-ascii?Q?Xau86HWqoKgmrVtwAYctFOIUGx28BRBFSqCONOtS/Jg6knzHGJOBGfYtz0NN?=
 =?us-ascii?Q?W/7BFhbJsV+D3loBJQB/Y9CMEaJjmFKcwX+hEVAaRPU/goT+hGtr1w46sxRF?=
 =?us-ascii?Q?99qlNXXGywPuAz1pbO0Cv9Fed8IYlTlrOTmdMM1mKGiD8nqGDt6HyMp7RPJD?=
 =?us-ascii?Q?uVIdpCWXAkPXSor3fzjnxJdukYoGWZ3tTgXu39EBu8vo0vq18YODdk5su0ec?=
 =?us-ascii?Q?vPtvpuIvY5sNHJhfVI4ZUvglgv28Bb1JCDIwQLzY3jfg/w3mYRZvmd+u/RJj?=
 =?us-ascii?Q?woJSDIES20ChhJpRtsQsr0miexZKsGMaG63kZkgJ9V4d2dk1DuiRDxCnR5mv?=
 =?us-ascii?Q?QOwoQ3u1tAGSOvjZOoJMNssIgDbwzgNplsBWGsXWu6bHad5aJ59ycoBLmWai?=
 =?us-ascii?Q?FoGX+opHsqzcvUyYB/piXnevNXm0oid8OyjjqhkZJWs97rz/UAD53bHS0Q/W?=
 =?us-ascii?Q?q9aU5U0+hTwL7N4+hg1croRn5D+SgakKheyF5xYiH77OXkm0/xW7zTet9yT+?=
 =?us-ascii?Q?1zLs2KbLO3jNJn4eKWSAcZN+AEWGY+G1Mtt0Zk/LLxfgvKCW8jY6lUoK+WVi?=
 =?us-ascii?Q?t71XCdPlEZs0W9UdhwMm/FTK4TcChsLmqKO4NKgOGvIgfUSDjro/hZn4vETY?=
 =?us-ascii?Q?+1U64HumojPCa7vKJr8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 08:36:57.6269 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44a45db1-790f-498b-9be3-08dde932b68b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6090
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S4GelRkKjGDIgod9dEF1D8wWa17l1wyc74J2AYq4yRI=;
 b=BS6odAYDlV147G83iGTWrnuD8G5gqpnPLhP2jBOCFtHuRdpnrmS876UVEvjvoBHxER70RBjNQPQmv/vsieOlnEmNqupqxr3kVbNZd68L+OS9Bn3VnpYz2IspS7JFWWNuZ/pdT1t9BtnsAHTbvKcYRTzbYZw18/vggw+LHDIdMX0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=BS6odAYD
Subject: [Buildroot] [PATCH v3 3/4] configs/versal_vek280: bump
 xilinx-prebuilt to xilinx_v2025.1_update1
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
 yann.morin@orange.com, brandon.maier@collins.com, ju.o@free.fr,
 Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump the versal_vek280_defconfig to use version xilinx_v2025.1_update1 of the
xilinx-prebuilt boot pacakge.

As part of this update, the vek280 pdi file has been updated and the memory
map has been corrected to match the Linux intree dts memory node, so the
vek280 dts memory node patch is no longer required.

https://github.com/Xilinx/soc-prebuilt-firmware/commit/f755d022cd9bd2e6a09eed0f80078bca3345279e

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- new to patch series
V2->V3:
- improved commit message
---
 ...sal-vek280-prebuilt-pdi-is-incorrect.patch | 50 -------------------
 configs/versal_vek280_defconfig               |  3 +-
 2 files changed, 2 insertions(+), 51 deletions(-)
 delete mode 100644 board/versal/vek280/patches/linux/0001-arm64-versal-vek280-prebuilt-pdi-is-incorrect.patch

diff --git a/board/versal/vek280/patches/linux/0001-arm64-versal-vek280-prebuilt-pdi-is-incorrect.patch b/board/versal/vek280/patches/linux/0001-arm64-versal-vek280-prebuilt-pdi-is-incorrect.patch
deleted file mode 100644
index 357c0abb2f..0000000000
--- a/board/versal/vek280/patches/linux/0001-arm64-versal-vek280-prebuilt-pdi-is-incorrect.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From e79a96ff89b11fea03680633ab830894288ee9f0 Mon Sep 17 00:00:00 2001
-From: Neal Frager <neal.frager@amd.com>
-Date: Thu, 28 Nov 2024 07:50:28 +0000
-Subject: [PATCH] arm64: versal: vek280 prebuilt pdi is incorrect
-
-The prebuilt vpl_gen_fixed.pdi for the vek280 is incorrect and does not define
-the DDR memory region for address 0x8 0000 0000 - 0x8 8000 0000.  For this
-reason, the intree Linux dts memory node for the vek280 will not boot.
-
-This patch works around the issue until the prebuilt pdi file is changed.
-
-https://github.com/Xilinx/soc-prebuilt-firmware/blob/xilinx_v2024.2/vek280-versal/vpl_gen_fixed.pdi
-
-Upstream: n/a
-
-Signed-off-by: Neal Frager <neal.frager@amd.com>
----
- arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts | 2 +-
- arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts b/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts
-index ad5d590318e6..a306eacca5b3 100644
---- a/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts
-+++ b/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts
-@@ -19,7 +19,7 @@ / {
- 
- 	memory: memory@0 {
- 		device_type = "memory";
--		reg = <0 0 0 0x80000000>, <0x8 0x0 0x1 0x80000000>; /* 2GB + 6GB */
-+		reg = <0 0 0 0x80000000>, <0x8 0x80000000 0x1 0x80000000>; /* 2GB + 6GB */
- 	};
- 
- 	chosen {
-diff --git a/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts b/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts
-index a5ee80a373e2..ba54a5ef0c73 100644
---- a/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts
-+++ b/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts
-@@ -19,7 +19,7 @@ / {
- 
- 	memory: memory@0 {
- 		device_type = "memory";
--		reg = <0 0 0 0x80000000>, <0x8 0x00000000 0x1 0x80000000>; /* 2GB + 6GB */
-+		reg = <0 0 0 0x80000000>, <0x8 0x80000000 0x1 0x80000000>; /* 2GB + 6GB */
- 	};
- 
- 	chosen {
--- 
-2.25.1
-
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index 4aa25f8d67..f0c156910f 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -5,7 +5,7 @@ BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
-BR2_GLOBAL_PATCH_DIR="board/versal/vek280/patches board/xilinx/patches board/xilinx/linux_6.12.10/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12.10/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
@@ -43,6 +43,7 @@ BR2_TARGET_XILINX_EMBEDDEDSW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2025.1_update1"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
 BR2_TARGET_XILINX_PREBUILT_BOARD="vek280"
 BR2_PACKAGE_HOST_BOOTGEN=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
