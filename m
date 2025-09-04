Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2074DCA1015
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 21:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8F7580E09;
	Thu,  4 Sep 2025 21:13:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3tO7Qcbcoxc6; Thu,  4 Sep 2025 21:13:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D94D480E03
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D94D480E03;
	Thu,  4 Sep 2025 21:13:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DC1F8B69
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 21:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2BFA80E0C
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 21:13:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DUnuNt0UkiXY for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 21:13:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::606;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 569D680DF6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 569D680DF6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::606])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 569D680DF6
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 21:13:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OIBQ1Jzjpkt8T1FY3Qfw55zKc6G75H8X+lJ7dU4WlzZLQ5EnVdFtjed5JhyQ8zDFTmC3wUA8B6e31q7BHx8iCWGjLdUXgDVVtd2+f35hkwtdZ46V/aKwBmHZjjqeg1qf5dmmsC2kC14seLdzW8sNJHqMRChAK5FtA3vQ2nUyP6OLRRMX0O6gf41td09LcVFIWmqUVNW7ASlEx+6ASEGP9++uKrrRbX8nwuMTzeyM2EQeKJyTIAcflnfP6YZIMEpOZinTLSmsfdHEKdgDnd9qfWnWlUg5CTWlSOd9b6gvtpfxIg+fhLcdtk8y3UVgIKzo5wRTyXyHDatzS567urDQeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScQb/lZlzBHU7LiT0cZC8rrTkwxRVUdEnecyCL79Z2M=;
 b=IEFwe+tx08xfHmo/1sMokfSpAkXwuJnrwAVmWNlbxc6iCH6Xt+yPTZcl/VQxkzsITwBdozHfEK+BVHjDX89qbItMDIVpNsoINrKnc6p/p3eNCPZm+jl8q6DcogjksaGoU5YHztt2mgF8u8RyY0hk7q8Fw0C4mVf+w3RULPQ7OEPo/VffizxdKITTM2ijbuh1KQa/L+Bw7UzRboE1gRy14lUcXas2jCLcd2e+9y38RfhIkSrhGtQ1gLxLLmuPRWIErD47R7INvJuQTJlWxZaLsFZkDb4Kng2+g9uyqG5gqKWXTpMnfAsiyB/+rNmgl9/UDo1201nFz8FVyyp7AC9zLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH0PR03CA0423.namprd03.prod.outlook.com (2603:10b6:610:10e::6)
 by PH0PR12MB8100.namprd12.prod.outlook.com (2603:10b6:510:29b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 21:12:56 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:10e:cafe::26) by CH0PR03CA0423.outlook.office365.com
 (2603:10b6:610:10e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.18 via Frontend Transport; Thu,
 4 Sep 2025 21:12:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Thu, 4 Sep 2025 21:12:55 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 4 Sep
 2025 16:12:54 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Thu, 4 Sep
 2025 14:12:54 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 4 Sep 2025 16:12:53 -0500
To: <buildroot@buildroot.org>
Date: Thu, 4 Sep 2025 22:12:38 +0100
Message-ID: <20250904211239.1928818-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250904211239.1928818-1-neal.frager@amd.com>
References: <20250904211239.1928818-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|PH0PR12MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: fc4e29ef-ca36-4edf-17f5-08ddebf7d0fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|7416014|36860700013|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2e/sADhvLzElDbEPtcz13M5hgfWJCm2121w4r8Gb7x+33US+NRKSDrFknm7G?=
 =?us-ascii?Q?iw8exnFlyIGVG6bKfbY0HR8/ZUDrdA02rwzdYT89HqDpmbjhywJCQwq0Vi+v?=
 =?us-ascii?Q?JokrAAcIjAE9UGi6COAj4UOQ1PoINyYX5G3ZlGpdiuBNCYFhAk4QERxFOwer?=
 =?us-ascii?Q?dQZ3zFF1PU2OCniRXVxhD+tzbuhFltOmvxep8ughl6OcVvk/g+w8ZUXzYkHW?=
 =?us-ascii?Q?TEz0v2iRg5ruxV4WCphldBl4yPiU4y6+X/iMTxC9lwY+WTlUwzav8hiWvoUC?=
 =?us-ascii?Q?vaSJq9EuouiwdfnhrVOfO51yw2Y/prf0idesn8z3auEXc+4fEVgb8onlcLsC?=
 =?us-ascii?Q?PGxrE91z0sOhi/wVipwGKI/b3uyYOt1R+BWxMrgl9H/V1GyJw+dlAbEmbMoU?=
 =?us-ascii?Q?LxPc5ZOeTlfzpNr1W5mYuiFBgMmoQ0bUXOQi6IFyE1FgUgCoy+JL1FQUvVj7?=
 =?us-ascii?Q?9DSesQanpZ/gMIaxPgL4E7J8LXhl0uE1+SA6UYHF/xoR7ioEFVe7uhosSfSo?=
 =?us-ascii?Q?VJ3uJTwsHyioOMRAKSEIQbaPd1QE6isAe0mL/UdaqTX/CzEB6jZ2oEO0U6Md?=
 =?us-ascii?Q?u0w0DmMC5v64S40mkJYZqbRdgOMENf/tT+duRLD46zJ7PqaIgsdIX0KjseK8?=
 =?us-ascii?Q?HbwVIw7ma3ZuY6SlElcNsmWaFLRqZhmsgGuWmfd8HXAYXYsHqdta5ofR0LiY?=
 =?us-ascii?Q?pfWG8Ycg4iI42g4ZkWG82bY+yMU3FYqusJ/ZRCHaUKM8+BhNUsNuC6D5hc8q?=
 =?us-ascii?Q?LN6+UvHRQQ3KnLZqg4o+2Gl1/gBpon3DhZRKaabb4F3QryX64lKBcaHl63d1?=
 =?us-ascii?Q?1eUYnCHuZhUh8TuG7QRuKEAqWAyOuVPXDJMVdqzFnZXiTvPgpCk4KV5zxeZ2?=
 =?us-ascii?Q?QrCYajasPaDzNnvtBGz9lRYRkQhS25S30kjF07dfVSRHI9lQnU9+ME5K1EiH?=
 =?us-ascii?Q?nXpIrKATeLEJQLO8kGZaS1Hz74hY5QWAcUSrG8pg+HwurAWe+x3KuasGQ8Oi?=
 =?us-ascii?Q?ckxj3udv35rX1hlpnjUxXNLjjxsmz4vmXpAlhXhYv8zafd0791JUHZr0627p?=
 =?us-ascii?Q?dJ9xh7BJUw28e87bZd8jTvflBva0qfiWwJFUDwp8bKPHdcuFf10VFn79Tz78?=
 =?us-ascii?Q?OpI8Oj63OQoaESi50jnLryaLblahupWK0Dz4kDmvo9hURzOX1a7iq/b642y9?=
 =?us-ascii?Q?4L9r0WHCzgH96+7RWSfyScntXEGj8U7Csyf+haO/e8UPVeHsAssEy/YWKSEG?=
 =?us-ascii?Q?tLBvFP+F/mUFqRP9ATNJtC6TKODFYNlwcFC1aXnOdYBDjXoSMn9BtDu3BD7R?=
 =?us-ascii?Q?GV2Mso7kzbXQSpGAQw4D96GYISpxqW4Yz3P0aEiCUa4Du4uwKMjiDx/c/H+g?=
 =?us-ascii?Q?jX0X2LsZD3Z1OszSPD3HXbqTcvBPudx3GmpfRo3fmA2+ps507SiVZ8DLd2W/?=
 =?us-ascii?Q?kek+CcAW9HRSAeWuQ7TtX7tVHyyvaYyPgh0jz9dHI+o8tlI4YCM0y1OGxHmR?=
 =?us-ascii?Q?R/vJ62gwIGzgw6zH3peNbczUeFs6x5NMsIj5?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 21:12:55.1507 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc4e29ef-ca36-4edf-17f5-08ddebf7d0fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8100
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScQb/lZlzBHU7LiT0cZC8rrTkwxRVUdEnecyCL79Z2M=;
 b=YDa478DQy4TI3oTLPflZEtXiBrfxdywem/qquPfOVwGFXexIMgEONYrgseLj7gSUkIagJBEafWhcSVgd3TzshWxQa+7VmzxnBTR5BNn4vTt1JG+CNIfU+39S5hLLcfRhHQiKX6s6FPy3KDtjEPKGfhWIlmWPECyaycU6KWlYHAI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=YDa478DQ
Subject: [Buildroot] [PATCH v4 3/4] configs/versal_vek280: bump
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
V3->V4:
- rebase patch
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
index 6c434199fc..d3a73b87bf 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -5,7 +5,7 @@ BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
-BR2_GLOBAL_PATCH_DIR="board/versal/vek280/patches board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
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
