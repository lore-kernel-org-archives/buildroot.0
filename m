Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901ABC71157
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 20:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41E1C40947;
	Tue, 17 Jun 2025 20:58:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Acy8Ofb0LeEc; Tue, 17 Jun 2025 20:58:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AC34408A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AC34408A4;
	Tue, 17 Jun 2025 20:58:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 42B4C151
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 20:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3472F60FC1
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 20:58:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PdrcnHWwVnMk for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 20:58:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::619;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 28F3A61005
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28F3A61005
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::619])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28F3A61005
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 20:58:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGilWVVAsFU6YeWCN0RIvmd58RMsbPEbMaAeOvh/jxN3aHUYblDGyIpydHmW5kUGrimOXPnaNPDNUGKo6oZWrZrBZKUfzrfcBJRzZV035ld75H80A8YqxETmmJIoXp0qV74rrEBBy17juHqNZP8q4jB5oFcFMPOH0St93OpQqpS6kuOXnR3THqPrS+07UpdzJ0huRkmVAUaN65C4SLJNcq4WHBrtBJZ30qkMwBJH+25JoUdh9it0nVarGyj3+q0rnl90CTrCMlD6NB6bzF3LgV4YwjDnQxord9gIPJLZ1rDuMrPkVOSO4b9I4S1GkJyzmmLOyIZzSDllobrR1gEq6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pUBax69WVeVD+z79dfezkQmnjth4hd2hieZN24bnb3w=;
 b=X9dgM5/W8bHMdhW46/Nj29nv38eT5Lkutl+wS4ryqwuEnTfU1DyS2Qz41n3E+L0he0RN0VF4u6lPKp+vI262P7xvPQzkq3rzbJxMwruMV/TVhfL0GdVYwV9X/ayL7p/n9jn2UO+d5L5VZTW8DVnz78Zab4dfCnBLF0mOb3qhC/k9YK5w13GEQMezpKSH/JDIn9mFuZbpNfCt+5BYQwHi7BYdQkdOQcdCFPhCjkNBcW/gNGrj60ZZ62XfXk1FKIvLyiMMX66wDCkuIQhZPmuCeufftBMmPOx5UuAiTXKVSKpz7LRem+vMHeIVTYHlaOJslhi6ksRb4LBcPpMHRBjlVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BYAPR07CA0048.namprd07.prod.outlook.com (2603:10b6:a03:60::25)
 by SN7PR12MB8791.namprd12.prod.outlook.com (2603:10b6:806:32a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 20:58:13 +0000
Received: from CO1PEPF000066E6.namprd05.prod.outlook.com
 (2603:10b6:a03:60:cafe::88) by BYAPR07CA0048.outlook.office365.com
 (2603:10b6:a03:60::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Tue,
 17 Jun 2025 20:58:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E6.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 20:58:12 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 15:58:05 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 17 Jun 2025 15:58:04 -0500
To: <buildroot@buildroot.org>
Date: Tue, 17 Jun 2025 21:58:01 +0100
Message-ID: <20250617205801.2440300-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E6:EE_|SN7PR12MB8791:EE_
X-MS-Office365-Filtering-Correlation-Id: c68ba597-e59b-415b-d4c7-08ddade1ac3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HWt02IMPFDKq9J2P+xiRv4MyoLCPB7YiS8t9fxgwmidaYrzJIDwCfGKVmY6R?=
 =?us-ascii?Q?9OuoTl82we6+4DByd5ASOjkC8iV8zpAdXFc0OwI9fbLNxJNUv6mXFt/RE2fz?=
 =?us-ascii?Q?5C9zYiWHsAuQsxhhE7bGDU78TMQTo3eiVtC5VySO8/n6shrtImz6BI8WaXPD?=
 =?us-ascii?Q?kSIsphhABy9nQSlviI8Td2eS39/JzIHktBbgP5+A2QugkfVBxSagcLN2hEHV?=
 =?us-ascii?Q?2h+xziS3nMlvcgWi0VXsKkEJylmjTvj0VTehzbxt8c37Z72Dr0e5RAg5Iaus?=
 =?us-ascii?Q?XdGY+p+7IcgqbOMvT9opUk1eEZvkXym4HA8fZfHdga4ws78Mp89m4JacVNkH?=
 =?us-ascii?Q?/e708n9JG2YOQiBrRxXFl6+oZHSPwahdJXA9lHoHxVhWxovHQjRe02Xrfwto?=
 =?us-ascii?Q?fU52O2jkoZ0yiJNHhH+djrmgwOaqYExYTM1d2Kw6W6QWAS006/tDuVi98zwR?=
 =?us-ascii?Q?8xZvWTWMimkiDVQM0I1UxatKVlqRrFeB61jpvDN9JLKnAxxnQhIomm+1Mgbm?=
 =?us-ascii?Q?yRDQ2kt6COCqkCTVV1/T+EVHM+2pBXojaC3eaWw3R+wVg2W41XU/s4ANUCov?=
 =?us-ascii?Q?AIB7x+gelSOure+QA4wCAaCnBzuM5bdi6ple7C0R57POmIfbCadTt6o5OpEa?=
 =?us-ascii?Q?sFj1Xp+Nh8TnSiVQ1vkx/9FSkEIpj9mW1CAbzO/pJsh2c0kCe+tIF2ZPTO9P?=
 =?us-ascii?Q?3HmTzTrpWKTZRWrzizujF/E/PySUfStVZ6ImSVlhiMxq9fDKYnZXt64ffINZ?=
 =?us-ascii?Q?mEhCWm2smWSNCiGupvvNushKz6ubof8r8SWWYUrninDRafC/WujBgqPws/ui?=
 =?us-ascii?Q?q6EHiuCJNqnPA/lMZsyVqnO5esu7LPlPBfXSMn3hkZsPMC/jvQDYaoo00Vlf?=
 =?us-ascii?Q?gNbh80TOwMHuedvyY6+oLtkCsz+FBIMzVYPThL9mLdtbc8xL/UdYWF6GOu3M?=
 =?us-ascii?Q?BUHznxlK1I000Fmpc2RIXvbzsxK2kbr+euJT+LQKruGnLcr+GADwaYZj+ZpT?=
 =?us-ascii?Q?yZjyuT6ms3VUMZ9zL//nejtlMT71PTKehI9NH5Wi5Gx4wKpKGExc+af0DZwZ?=
 =?us-ascii?Q?BOfUhxniFBMk2umcNuolrPVyKiFkp9uhgixfI+5P7UctPV+DeUdSjkHLaxWD?=
 =?us-ascii?Q?aKLVi7lsoXmtq49FtDYvgZlREmQo1/jVtvia7oejgepcXAOyw3cP5jM3RPUc?=
 =?us-ascii?Q?A4Xxk8lwuc/K0gHoev0k6R3Y8IpnohRPfAeHumnkLIwsLMF6h6dB2zzhlHl6?=
 =?us-ascii?Q?j4J3sUEs3W6g5Gkzqc0m79ef3Sk20+C2teSLTpfidfwHKWyixiwHyWj6uUT6?=
 =?us-ascii?Q?1fgHEu84Ou9hHtwe77vlEy4fZAyRb8T7ubMitRR9XFphzS/E2vXJFoJEx2w9?=
 =?us-ascii?Q?pmpiPSzX06GKjDPOtgfz8SmJeM1bMMNZeVqcilgkpR57nqWihdlbePDYlp8Q?=
 =?us-ascii?Q?tpJFe4xSL1mMkCDY4M5kATBGNMar4LM2toVmGoPtg6W8mIWZ875bmX9OT057?=
 =?us-ascii?Q?Krl/NJIzB6WZ3OGJQXtQMznu7Gc7aKCwgHoTfngfDlIFtk8XCoK0qBTDqtVQ?=
 =?us-ascii?Q?2inz+mw9kRZr+w7on1lK3dESbmL4AEm3qIcFwBgk?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 20:58:12.4249 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c68ba597-e59b-415b-d4c7-08ddade1ac3f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8791
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUBax69WVeVD+z79dfezkQmnjth4hd2hieZN24bnb3w=;
 b=n+79to9UYL3fgPufajhXSZOpY6gyEXxfh410y0fLKg/XoL3QtfBOB4SvXFREZumnVxKYzl2B7Lm+ICtyIkWDxkI7gw8+kmRzG4gF3wd9+wD3AspfXkqR0MJmgYc5jk9nrw5rW2zF8EyPAMSRUMauAN2qtllKdEBEONazsgWtY5s=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=n+79to9U
Subject: [Buildroot] [PATCH v1 1/1] boot/xilinx-embeddedsw: add family
 variant choice
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

This patch adds a family variant choice to xilinx-embeddedsw for two reasons.

1. It does not make sense to build a zynqmp_pmufw for a versal platform or
versal_plm and versal_psmfw applications for a zynqmp platform.  With this
solution, users can only select applications which are targeted for their
device family.

2. Buildroot will soon be adding support for the versal_2ve_2vm second gen
family. This family has a plm boot application that generates a plm.elf just
like the current versal platform. If a user was to select both the versal_plm
and the versal_2ve_2vm_plm, two different plm.elf files will be generated
causing a conflict at the installation step and a run-time failure when the
wrong plm.elf gets included in the boot.bin.  By having a family variant,
only one plm.elf can be built at a time depending on the choice of family
variant being "versal" or "versal_2ve_2vm".

The issue can be seen by comparing the two Makefiles which both create a
plm.elf.

versal plm:
https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps/versal_plm/src/versal

versal_2ve_2vm plm:
https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps/versal_plm/src/versal_2ve_2vm

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 boot/xilinx-embeddedsw/Config.in | 15 +++++++++++++++
 configs/versal_vck190_defconfig  |  1 +
 configs/versal_vek280_defconfig  |  1 +
 configs/versal_vpk180_defconfig  |  1 +
 4 files changed, 18 insertions(+)

diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
index 0dd6433608..7af8d59929 100644
--- a/boot/xilinx-embeddedsw/Config.in
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -28,8 +28,21 @@ config BR2_TARGET_XILINX_EMBEDDEDSW_VERSION
 	  Release version of Xilinx/embeddedsw.
 	  Must be xilinx_v2023.1 or newer.
 
+choice
+	bool "family variant"
+	default BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP
+
+config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL
+	bool "versal"
+
+config BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP
+	bool "zynqmp"
+
+endchoice
+
 config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
 	bool "versal plm"
+	depends on BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL
 	help
 	  Build versal plm application from Xilinx/embeddedsw repo.
 	  If selected, the xilinx-prebuilt package will not install
@@ -40,6 +53,7 @@ config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
 
 config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
 	bool "versal psmfw"
+	depends on BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL
 	help
 	  Build versal psmfw application from Xilinx/embeddedsw repo.
 	  If selected, the xilinx-prebuilt package will not install
@@ -50,6 +64,7 @@ config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
 
 config BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
 	bool "zynqmp pmufw"
+	depends on BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP
 	help
 	  Build zynqmp pmufw application from Xilinx/embeddedsw repo.
 	  If selected, the xilinx-prebuilt package will not install
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index c9d99876d5..44bf9bc376 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -40,6 +40,7 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vck190-rev1.1"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
+BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index 4aa25f8d67..0bd24b304f 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -40,6 +40,7 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vek280-revB"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
+BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index 500298c2f4..746c36fb18 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -40,6 +40,7 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vpk180-revA"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
+BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
