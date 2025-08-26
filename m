Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A19ECA0EE4
	for <buildroot@archiver.kernel.org>; Tue, 26 Aug 2025 06:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CAF96F76D;
	Tue, 26 Aug 2025 06:10:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w9KuZeJhdjyz; Tue, 26 Aug 2025 06:10:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EC5B6F779
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EC5B6F779;
	Tue, 26 Aug 2025 06:10:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E903CD
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 06:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24F5141C19
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 06:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GdOEtUejMzVx for <buildroot@buildroot.org>;
 Tue, 26 Aug 2025 06:10:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:240a::628;
 helo=nam04-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2844F4076C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2844F4076C
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::628])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2844F4076C
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 06:10:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXWAtZ5lj4J9KXZoiAFbZvxBCTX0r6DhZO3dZbAoSOUEk5/TnfSFLQQwQquQ9RL8qn/PcsfVo3UeIGFN2n3Lj/ThmO6x77fHl0YUUEcEFvP3IL2PWoGethT90NwFnMFKhlDDz+J2Lp61jnhQz/hocHWbrzv1REamyBvyzPMdxxiN/9DYbwkDsOyBtYDnwhG5UPuKdy7HxHC1/Xe7stXYiKBuxBCQCniOTwfHIOQEgrlbF0GgkYFvGB+q22GemSU7PedeK692RhOqIKPpgTIgy6f7BgS29hirWbDtcK8wuoFTdxqOdD7yeoKxNUOV5G5U70TVjk97kLk66xupIoGfOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTZrnHQzJdjR5V9V6t2ypEhcWj7Q4boG4MNmiMRJH0E=;
 b=uUYVj1VoIrnKf79GBvKrpRPLGyM5PyVEV+O/YwOdUaZKgoGWrnpkyJq6wopk3vzKJAqdCP5ZilNZJtcq7ZCPyBHbG+UuCAgFSS8M3shiRgj5ad3ADryNyBUv1osd2yRVEqdjMXgiAoskcA1X9fkSk6UN9rG/e3qG3x6EdUE8c4G3MJlOv9cvHyib9FTdG7Znk0MPmn9zILOoN3tetAFy6R8SD22O1Jm9KcL0x77+tDgiE6vUER8LHaAhaNw3AJo4Tl7SogXdPP2OqJPHORF74M3EYBlrxd3ZVkd6Kc2JQX4BCC585nY4pnW0da/e/+fgphNSEUMCpf6iOO9pgaRxDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR04CA0374.namprd04.prod.outlook.com (2603:10b6:303:81::19)
 by CH0PR12MB8551.namprd12.prod.outlook.com (2603:10b6:610:186::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.22; Tue, 26 Aug
 2025 06:09:57 +0000
Received: from MWH0EPF000989E5.namprd02.prod.outlook.com
 (2603:10b6:303:81:cafe::7f) by MW4PR04CA0374.outlook.office365.com
 (2603:10b6:303:81::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.20 via Frontend Transport; Tue,
 26 Aug 2025 06:09:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E5.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Tue, 26 Aug 2025 06:09:56 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 01:09:52 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 01:09:52 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 26 Aug 2025 01:09:50 -0500
To: <buildroot@buildroot.org>
Date: Tue, 26 Aug 2025 07:09:41 +0100
Message-ID: <20250826060943.1394934-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250826060943.1394934-1-neal.frager@amd.com>
References: <20250826060943.1394934-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E5:EE_|CH0PR12MB8551:EE_
X-MS-Office365-Filtering-Correlation-Id: d0d12210-ac45-4438-54aa-08dde4672e5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700013|82310400026|1800799024|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VwC4xtWHJXd2HWdh43BZvo2PzfOVfIrj406PyS5W7XQg33dd5jo24b8Qt/2w?=
 =?us-ascii?Q?AVGOP2cpDJ6OigE5RwBkEmgjKC429HGjBCB7oaXuPSPsSN/sHtO1yBxiS6Ba?=
 =?us-ascii?Q?NQF7btj5+0QCfWgJ/IeNpE4mi/jeORYu7AVD4I+XKFhnJF4rKPhJDBbTH4pi?=
 =?us-ascii?Q?JZgOB8dQynJu1FmwmX35G5vXES8ctH7+Ui8LKFaVMbXzI+5bBOnroxRpGoE3?=
 =?us-ascii?Q?JvIWHW2f2IkRTvGxSr0Gtaqu0MHKgMzvfB2KR91dJNNRdMz0/QkYH7/I1uY2?=
 =?us-ascii?Q?3txDKrOjm0YZr20eeLVQR/icbAZu6xjW0mF9c2kKlCeykpn9LPwHT8Mgm28V?=
 =?us-ascii?Q?vMMsABBqJKveKZvYn0QMRCYC1giPV6cWHr7KeKI9TPv5HTi4S2qkptGAq7Pv?=
 =?us-ascii?Q?S/GtWMZdnRZaR6CHFGIOYoWs+zJI+6uwoq9AM+Rh7w+Fe83DE/5XFMCEwmbE?=
 =?us-ascii?Q?4wP/QI7p6Z+y+9jW8FNUWYtivctlnRMdGZ6dlQ6oJFw2avr/umnp7fzZu1fU?=
 =?us-ascii?Q?rBfJRSGaV3WvV8K1oxFEySnznWxC8pwyEa4+yeC6t5fDiXbbM6E1354ZObGF?=
 =?us-ascii?Q?9GpX3BZ2zIrjZjMINH+X4zW5XJkxLCsfn2uMf0kRcOzwa9HKRnqI2ffoIpo/?=
 =?us-ascii?Q?ICyeouNufmMKx8OtCNkAUQ0c40H+oW17+zxsuiQ3yCtqwqUtdkcezQsKyi5m?=
 =?us-ascii?Q?InRC0ox/jP0FOG1j6lLlb87U6wNSNk20+zr14hfKpinxGoPIFQB5UpLhkcyj?=
 =?us-ascii?Q?ZAj04Q6KaZr5aHG3NudUrtapzhTBWoCgFnLWJh3JvOYUmgTcc7q493NyCpye?=
 =?us-ascii?Q?zKRUQ9kFkkVBc7qLrMCdOW9tGo9mc58j19KqqJ7CjQriBRmY+5AZJFhng3LH?=
 =?us-ascii?Q?XBTj9tRP5RB4x6NXvawRz0TalA2hgkUg9DwxLeHrZ6WDKTUnaj9yys+1D424?=
 =?us-ascii?Q?RlbdMQHMAueZJIdAOsnYEnpG1WtYEQdboJwNYRRP0d1B1srV/+L/WHEh8Azf?=
 =?us-ascii?Q?d8mx406rvmkJUlNMKFvnHvqz7qQBwA/mj4y/lJIKSfvlZzVRvdelMZyoewHB?=
 =?us-ascii?Q?9l60kwj7/cpLY865fol3oXPBgf0HgxYjTiaocbDbc/+RjRHkvKTEAe5QJpjy?=
 =?us-ascii?Q?+5b41NuXONBwQlIOv2+T28TPF+eUgv7/mV5S5rl+n+ogzQpBO43G16EnKXDF?=
 =?us-ascii?Q?+5IExj0w3aOUjjuYaRIBuOOL2KSTRgAUu2XNKZo4kyFbSvsAjAdDB4anfa8u?=
 =?us-ascii?Q?RFgQzCy36s9+6+Z2Wg4r2Zg/Z4J6Lpz88JOVTC9ldf+CaxWTskwQdQQaDBIO?=
 =?us-ascii?Q?FKKWmVVMxCMpuqP+pA9xAS87/pgMWTMGsg995KnhCHzEivQP4uiuR5v+m5fI?=
 =?us-ascii?Q?/S1rHcGkpm4Qyj2yObiFvrSxQ+pGlJDO0+x/hHFRcQx6G+kE3LlS91esWGHI?=
 =?us-ascii?Q?EtKtTGbmYE/1gPJag/X7tennVyKjc86Y8yaRviNJFaFS2Aq1KWd1FYkX37Wz?=
 =?us-ascii?Q?y46U6TK+dHn6uyQFsks9eWKRFC2E460Dj5yl?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 06:09:56.5887 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0d12210-ac45-4438-54aa-08dde4672e5f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8551
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTZrnHQzJdjR5V9V6t2ypEhcWj7Q4boG4MNmiMRJH0E=;
 b=tjMMyPZNe0GfvDEo/oOqxfUmrbW6577MvpqgcRhs1QaDV+W1GDpF/cRCRjy0/i2VW8jrCJF+HMfm7qSkALOXaJAoYPZ5+0FR65T/bDIii1WSniavafDUuyyJ8iGvbcpNLVGxKDVLu8Q4RVEhAo00WXyrnDERx+s/uDMODT8SGiA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=tjMMyPZN
Subject: [Buildroot] [PATCH v2 3/5] configs/versal_vek280: bump
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
 yann.morin@orange.com, brandon.maier@collins.com, manikanta.sreeram@amd.com,
 ju.o@free.fr, Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the versal_vek280_defconfig xilinx-prebuilt package to
version xilinx_v2025.1_update1.

As part of this update, the vek280 pdi file has been updated from the
petalinux flow to the yocto edf flow. In the process, the memory map has been
corrected to match the Linux intree dts memory node, so the vek280 memory node
patch is no longer required.

https://github.com/Xilinx/soc-prebuilt-firmware/commit/f755d022cd9bd2e6a09eed0f80078bca3345279e

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- new to patch series
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
