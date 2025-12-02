Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89317CFD376
	for <buildroot@archiver.kernel.org>; Tue,  2 Dec 2025 10:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2C0A60C15;
	Tue,  2 Dec 2025 10:05:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id scvJ7g_bap7D; Tue,  2 Dec 2025 10:05:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDF3E61296
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDF3E61296;
	Tue,  2 Dec 2025 10:05:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F23BAD3
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 10:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D83FD40365
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 10:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5tX-ROx7BKef for <buildroot@buildroot.org>;
 Tue,  2 Dec 2025 10:05:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c001::2;
 helo=sj2pr03cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BA4984032E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA4984032E
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c001::2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA4984032E
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 10:05:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HGmd5b8U6nCt8Mx0kSVyisNL0OfYHY5u9KR/AZlrXXGZviokEMZyPJtoPMtBq4QxdugZxPE3xBlJ1+y0ZZZK4n+6b8d5mK34Nx/tIZLpw62LIqh8Azmnl9j3A/vtkvZBoCgzWPhO3uMN5rxb8BTOjujcgYAmBXoXULYezSEQv7jIo4JpUkXxVzvYROvKmLXFvBYDd8jpXtTCdQnf8snhL/bneOadcdnvf+0D/SIrGBf8F4ErtgzfhLckrINQRe76F41NSZWdCULwau3ViXhjueec9nystTIxxi9y6BKM+5ojyQ8O8J0oFt0TXCLvYgbbqwk79G82tduFjLRy+hA9SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jgOrUlqZnacw0MsnGnuJuS5Vbfv7zwm8N7vUtfjMKZA=;
 b=YdobK1oBemyzWWmVjRiVUl2TO3Yg6Or+GSASO1a9NBOURSLQm080FFQarzkAksMk5MRC6bHq8CmUTsX9BuRJ+REoHnwMKOEYaYMcxliD6TkBjin9bmgqJHz2gqW988/lG53ZcZJAuwQ9s1iFGM60bCXt1qJ8m/JQ77aBAciFrzg5LDF4t1XT6cpcAczDItBepSqNx1kaXOHiYDYAquopfJ8pcHCfHabHb0BCa97pa9vzFKiT0DImouKCUjAam9U0N9sAQTFxouZnj7Y7ZRHaVauWdnyWTmN6WlJDKRdtNpA20+6FFIRm/7EbXLA7jRHZyurY+OTu89kPkCviuaPZrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH0P221CA0047.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::28)
 by LV8PR12MB9449.namprd12.prod.outlook.com (2603:10b6:408:204::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.16; Tue, 2 Dec
 2025 10:05:23 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:11d:cafe::7a) by CH0P221CA0047.outlook.office365.com
 (2603:10b6:610:11d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Tue, 2
 Dec 2025 10:05:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 10:05:23 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 2 Dec
 2025 04:05:22 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Dec
 2025 04:05:22 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 2 Dec 2025 02:05:21 -0800
To: <buildroot@buildroot.org>
Date: Tue, 2 Dec 2025 10:05:15 +0000
Message-ID: <20251202100516.1097984-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251202100516.1097984-1-neal.frager@amd.com>
References: <20251202100516.1097984-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|LV8PR12MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ecec590-7c54-45a4-ddb9-08de318a4ef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|82310400026|36860700013|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Oy3rA2LDxPfeIec6XK7aFZ5CkpcPyCcrjSUTCrQcXoJF+QJtbU0RRXid5IHJ?=
 =?us-ascii?Q?Y+2camhOcV1PovjjTlPivlcX76guG4uVkU04h9SfAYBSEkRIAFr44gusYwUd?=
 =?us-ascii?Q?3SstSjzXmPW5DWuk1Hmf0FjpX/9dQ3/QJKq55fEUZW6YwJXo0BWIfB68hEF/?=
 =?us-ascii?Q?mQMobSrFJ/6rj4CCbmx+JgvUUBLv/iS+ClNNDAYgmoAJ0a0CiXPSlxbpa3BN?=
 =?us-ascii?Q?bERCBGGiuIWcU5qBBXHOHq+ck9NNDTR/BAaDoUR4c22OJM9c8K7XPHjRab5l?=
 =?us-ascii?Q?OMDD7mXRB45LDnYpEvmakMPCZ9yJR3tUUfsGsTdmHYwUs8qaL1cYWw/0RV/K?=
 =?us-ascii?Q?S3s8PmHDhzRML+dYjlGuN0I80vXydv06xs37Tdc7yPLRn12h2NzE8qIiqpBK?=
 =?us-ascii?Q?A57gOfgt7634U9nNV/QbK6COqXu7p0U22veyh7BePgNrWd9lz4rE4/duSnpj?=
 =?us-ascii?Q?SEPVnihqItETgXLRdKMo4g0TjNFNF5xWg5196chLEXYOCGbkVNxdWx7w66ZA?=
 =?us-ascii?Q?7EKk+YXeK6tyG4AJaLzmpHEAgEA3Lc/NLbbtkHYxG5BNFUL5U81OrtRfHkbN?=
 =?us-ascii?Q?adINWZGXNL+GS6Xi7DQbYvw7LJpe7k8d1umnFKgI37SyID6zSPW9isPk3srP?=
 =?us-ascii?Q?LdHPbid6nKlp3kCjCYIvd8x7kAAcKJ4eo6PZ2A4xJpOoBS3CX0ojVg5zpDkk?=
 =?us-ascii?Q?l2q1apLgiGKFeYqOt2wxWxLHRpLYw169hmmdwXhs+6NaSkNJVWXU8vJC6ubc?=
 =?us-ascii?Q?7ygdhppJocwM8/FrUuvC9P5wsnjQajj99hsyGrbtKbGMeakIm7OxdOF/iY68?=
 =?us-ascii?Q?miIJnlPoTIJzK/J8BtkhPjG8QdK3vNmO83n9SOCClJ2O/g0iltSqRx+3JSnB?=
 =?us-ascii?Q?4cb5r2WII+ge0CvTkwPtrQuNEXwjgLpYXYPvGTjQs9+n+gNLRhpV6oT774XH?=
 =?us-ascii?Q?hz6TgxURcv2rjmqePL2WkTPM+FMfuF0mepPZ23QiFCgTg4S2bWwpbqmiEep4?=
 =?us-ascii?Q?8wa6vFcki3BCrVK7KDGBC4xjLnNfmE07WGyjhexajUnxTKouT4CHVklNM2TF?=
 =?us-ascii?Q?c6KytPSwRkNTQAShVk+r9l0Y8RJjAJv/3sgAKMGw8sUV449SovKaxdUgXkx2?=
 =?us-ascii?Q?Vz5gYtlL+LuACCAi7Pe+CVsuj1YUiOluo5fjwlqDVle1ckxkQ5HlRt2gJlst?=
 =?us-ascii?Q?A6u/aS2+CsuGn7m3fd/OXFyWyqw2yHni+2rVH/o/lS5BIs+g66pvx/OqGwmf?=
 =?us-ascii?Q?qT+G/YOzg2FRF4z2Drc3hv7JD3AcUM0at5J+QYf/RaYzzOPBFEEEa5PW4zYS?=
 =?us-ascii?Q?lZRRaoCs3+MAcu/I82bE33u471KDq/xMec6XP5QGvzZjdu14QiQHRY1R2sA6?=
 =?us-ascii?Q?qsVUWdUPZvInGNwekMcXYDc1mqZdEh2taV52aEjE4NX9/jYRqqHYax2fgwvN?=
 =?us-ascii?Q?Ljwl6gfV3kDgnOe2Z3iJh0L46soyfIbPRTMnUGAJRCnYcYDQ4pQZZHWn2Foi?=
 =?us-ascii?Q?g38KeulOzOdSrm6vQ0YrHdoo/Lkw1zZOGLsKCbnmpvhhp5ufuqBbEnxYOd5E?=
 =?us-ascii?Q?GiEzfB+CC5vfH1FuWKLaIfNmtPeESexr7W5K4rYGCVVoPVaN9OuHif0lY/sI?=
 =?us-ascii?Q?Iw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 10:05:23.2810 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ecec590-7c54-45a4-ddb9-08de318a4ef8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9449
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jgOrUlqZnacw0MsnGnuJuS5Vbfv7zwm8N7vUtfjMKZA=;
 b=GHP2OKvLS6jyqbYNI6v3D5jOPoA2GFbTdZdcZiV0vEjEZXn+ddEzFauZpIJp2LUdECzPSvhmey0jRQAhzbnc3g6qlJQfbCKse+1LYfgg/Vh8XNGuhIE7YsxQewo22LcGwSn6xTLgEyQAegUJWCKQDgWG/8jciHoKWme9olFyJpg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=GHP2OKvL
Subject: [Buildroot] [PATCH v1 2/3] boot/xilinx-prebuilt: add versal2 support
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

Add support for Xilinx versal2 devices to download the boot.pdi, pld.pdi and
plm.elf files from the Xilinx/soc-prebuilt-firmware repo.

Since the psmfw.elf does not exist for versal2 devices, the installation of
this image has been split out for original versal devices only, whereas the
other images are all common between versal and versal2 device families.

For more information about the Xilinx Versal Gen2 series:
https://www.amd.com/en/products/adaptive-socs-and-fpgas/versal/gen2/ai-edge-series.html
https://www.amd.com/en/products/adaptive-socs-and-fpgas/versal/gen2/prime-series.html

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 boot/xilinx-prebuilt/Config.in          | 17 ++++++++++++++--
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 26 +++++++++++++++++--------
 2 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
index e742a66ca7..a1e711e6cf 100644
--- a/boot/xilinx-prebuilt/Config.in
+++ b/boot/xilinx-prebuilt/Config.in
@@ -26,6 +26,7 @@ choice
 	bool "family variant"
 	default BR2_TARGET_XILINX_PREBUILT_VERSAL if BR2_PACKAGE_VERSAL_FIRMWARE  # legacy
 	default BR2_TARGET_XILINX_PREBUILT_VERSAL if BR2_cortex_a72
+	default BR2_TARGET_XILINX_PREBUILT_VERSAL2 if BR2_cortex_a78
 	default BR2_TARGET_XILINX_PREBUILT_ZYNQMP
 
 config BR2_TARGET_XILINX_PREBUILT_ZYNQMP
@@ -40,14 +41,21 @@ config BR2_TARGET_XILINX_PREBUILT_VERSAL
 	bool "versal"
 	depends on BR2_cortex_a72
 
+config BR2_TARGET_XILINX_PREBUILT_VERSAL2
+	bool "versal2"
+	depends on BR2_cortex_a78
+	help
+	  Version must be xilinx_v2025.2 or newer.
+
 endchoice
 
 config BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 	bool "download a prebuilt Versal XSA"
-	depends on BR2_TARGET_XILINX_PREBUILT_VERSAL
+	depends on BR2_TARGET_XILINX_PREBUILT_VERSAL || BR2_TARGET_XILINX_PREBUILT_VERSAL2
 	help
 	  The Xilinx Support Archive (XSA) provides custom Xilinx
 	  firmware files generated by the AMD Vivado Design Suite.
+	  This option applies to either versal or versal2.
 
 	  https://docs.amd.com/r/en-US/ug1400-vitis-embedded/Creating-a-Hardware-Design-XSA-File
 
@@ -64,28 +72,33 @@ config BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA_LOCATION
 	  use a make variable like $(TOPDIR) to reference the root of
 	  the Buildroot tree.
 
+	  This option applies to either versal or versal2.
+
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 
 config BR2_TARGET_XILINX_PREBUILT_VERSAL_PLD_PDI
 	bool "install versal pld.pdi"
-	depends on BR2_TARGET_XILINX_PREBUILT_VERSAL
+	depends on BR2_TARGET_XILINX_PREBUILT_VERSAL || BR2_TARGET_XILINX_PREBUILT_VERSAL2
 	help
 	  When using the Versal Segmented Configuration, there is a
 	  pld.pdi file containing the FPGA bitstream which can be
 	  loaded at run-time.  By enabling this option, the pld.pdi
 	  will be installed to the target /lib/firmware/xilinx dir.
+	  This option applies to either versal or versal2.
 
 config BR2_TARGET_XILINX_PREBUILT_FAMILY
 	string
 	default "zynqmp" if BR2_TARGET_XILINX_PREBUILT_ZYNQMP
 	default "kria" if BR2_TARGET_XILINX_PREBUILT_KRIA
 	default "versal" if BR2_TARGET_XILINX_PREBUILT_VERSAL
+	default "versal_2ve_2vm" if BR2_TARGET_XILINX_PREBUILT_VERSAL2
 
 config BR2_TARGET_XILINX_PREBUILT_BOARD
 	string "board name"
 	default "zcu102" if BR2_TARGET_XILINX_PREBUILT_ZYNQMP
 	default "kr260" if BR2_TARGET_XILINX_PREBUILT_KRIA
 	default "vck190" if BR2_TARGET_XILINX_PREBUILT_VERSAL
+	default "vek385" if BR2_TARGET_XILINX_PREBUILT_VERSAL2
 	help
 	  Name of Xilinx target board.
 	  Used for installing the appropriate firmware.
diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index 95b656cdde..6bd16d663a 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -26,16 +26,11 @@ XILINX_PREBUILT_BOARD = $(call qstrip,$(BR2_TARGET_XILINX_PREBUILT_BOARD))
 
 XILINX_PREBUILT_BOARD_DIR = $(@D)/$(XILINX_PREBUILT_BOARD)-$(XILINX_PREBUILT_FAMILY)
 
-ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL),y)
+# Common Files for All Versal Families
+ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL)$(BR2_TARGET_XILINX_PREBUILT_VERSAL2),y)
 ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA),y)
 # Supports either plm.elf or plmfw.elf filenames
 XILINX_PREBUILT_PLM = $(@D)/pdi_files/gen_files/plm*.elf
-# Unlike the psmfw.elf file for Xilinx development boards,
-# AMD Vivado Design Suite currently generates a file named psm_fw.elf.
-# Future versions of AMD Vivado will generate a file named psmfw.elf,
-# so to support current and future AMD Vivado versions, the filename
-# psm*fw.elf is used.
-XILINX_PREBUILT_PSMFW = $(@D)/pdi_files/static_files/psm*fw.elf
 # We need the *.pdi glob, because the file has different names for the
 # different boards, and it has to be named boot.pdi when installed.
 # If Segmented Configuration is used, there will be two pdi files and we need
@@ -63,7 +58,6 @@ endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_PLD_PDI
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 # Supports either plm.elf or plmfw.elf filenames
 XILINX_PREBUILT_PLM = $(XILINX_PREBUILT_BOARD_DIR)/plm*.elf
-XILINX_PREBUILT_PSMFW = $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf
 # We need the *.pdi glob, because the file has different names for the
 # different boards, and it has to be named boot.pdi when installed.
 # If Segmented Configuration is used, there will be two pdi files and we need
@@ -91,11 +85,27 @@ endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_PLD_PDI
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 
 ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM),y)
+ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_PLM),y)
 define XILINX_PREBUILT_INSTALL_VERSAL_PLM
 	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_PLM) \
 		$(BINARIES_DIR)/plm.elf
 endef
+endif # !BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_PLM
 endif # !BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
+endif # BR2_TARGET_XILINX_PREBUILT_VERSAL | BR2_TARGET_XILINX_PREBUILT_VERSAL2
+
+# Files specific to Versal Gen1
+ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL),y)
+ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA),y)
+# Unlike the psmfw.elf file for Xilinx development boards,
+# AMD Vivado Design Suite currently generates a file named psm_fw.elf.
+# Future versions of AMD Vivado will generate a file named psmfw.elf,
+# so to support current and future AMD Vivado versions, the filename
+# psm*fw.elf is used.
+XILINX_PREBUILT_PSMFW = $(@D)/pdi_files/static_files/psm*fw.elf
+else # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
+XILINX_PREBUILT_PSMFW = $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf
+endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 
 ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW),y)
 define XILINX_PREBUILT_INSTALL_VERSAL_PSMFW
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
