Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91748C02181
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 11:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14F8981E08;
	Mon, 20 Jan 2025 11:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3jkWCqSx1k8G; Mon, 20 Jan 2025 11:34:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1D9E81E34
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1D9E81E34;
	Mon, 20 Jan 2025 11:34:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C32A269
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 11:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DC2E81E08
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 11:34:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CNg8Ed1yeSSU for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 11:34:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::611;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3235F81E03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3235F81E03
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::611])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3235F81E03
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 11:34:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fndiP/y8FHon/k4EDLO9H9nYE31Kgvm5G1l5pxlACPxafKEMCkBwdSIixBkF0AL906uEQDxhw5wauk7P4xg4hzrdMRlU/91V0owDdrXbSSbvr2qPiDORblvqIQceml4sp/yckDpzXayVRFj9Mvb5id8dLTKn8949j9hjk51uhxDG3HksqF9GHsdUcQC8KSeFsTq2hhRN/17c4758bUF7f7mbJfWnl8Qvz6X6GRItrZoLNsZf9Vxjprf8uldIfIASYbtMXWiSFCRZwcgS+FEMq8XQEG3q1JtkX4Ecbt2uS5rEvu0OUYcPIduPSPyYPXQYnHNPzkf7bQ1DDd/d42fvSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gz0U4xEI3vugyJxFW0J9jNse9odFSE1E6aqGGlpjwuw=;
 b=pKmIrzdPYVhH0Cc0YliLZpGsGR0ox1JCfpIc4ytiMyY3EMp75gl51i1gS+s6hkzxz3cONeEqeYj2YBe6zZ/vokq2/jgnp+WEGJgqHvirIrCPkHwMdaVJ6akzn0ubJG0KUb2mp+mpkRrSo0hato7BpsSpbafu+3m8FJ6DZW0C46LRmEaFwKRiy866i4Cdk9gQcqzp+nXin+5vuyZq75j4jXPQ679cqzCWkE+ErXD4X9WWnSt7oO4XWzCB8XNUJ5yeqfUPFMBmipcE9SHtRXFIoU8+C+2MsPqkZMUg0ijtqo8GaFjrYGscZhk/neHPuYKJcBG21PiRQkDA344xgPnFMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR13CA0102.namprd13.prod.outlook.com (2603:10b6:a03:2c5::17)
 by CH3PR12MB8284.namprd12.prod.outlook.com (2603:10b6:610:12e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 11:34:13 +0000
Received: from SJ1PEPF000023D3.namprd21.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::1c) by SJ0PR13CA0102.outlook.office365.com
 (2603:10b6:a03:2c5::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.12 via Frontend Transport; Mon,
 20 Jan 2025 11:34:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D3.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.0 via Frontend Transport; Mon, 20 Jan 2025 11:34:12 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 20 Jan
 2025 05:34:11 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 20 Jan
 2025 05:34:11 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 20 Jan 2025 05:34:10 -0600
To: <buildroot@buildroot.org>
Date: Mon, 20 Jan 2025 11:34:03 +0000
Message-ID: <20250120113405.3938838-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250120113405.3938838-1-neal.frager@amd.com>
References: <20250120113405.3938838-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D3:EE_|CH3PR12MB8284:EE_
X-MS-Office365-Filtering-Correlation-Id: 3574c6e7-0f7e-4040-45c1-08dd39465ce6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Nx4W7AfcPRW0JSOPE3MCI3pkow1IO9f+muxHIaC5vbewJoqkeyjK+t0gdufi?=
 =?us-ascii?Q?ALMy5sYKX3EN8pCAXY+fEij6wKZA98MDZuk9fyGVLzYZpUqWuPrARIW4LMWN?=
 =?us-ascii?Q?xRyLNzWHoKn9vIngNI746MDwvlhY1OyWY9nBoCyGE4/psiwyosKMdIZU1DEE?=
 =?us-ascii?Q?SVFhtjKn6hsQV4uGIfPywFBf9g+2gtE9LVQU0J03EM9jcGFPHVoar6Ceh3D1?=
 =?us-ascii?Q?MC5xgfFm53RrVx98WsiyEG+xnP1PdvdoDjJXZtcH50zOMrohUunvgQpZ/LT8?=
 =?us-ascii?Q?COicfvBdRiBb/gyz6U8SvrLLu1I9Yel/IXvsQl1mNZxdsozDCG7mKmdJ8wbB?=
 =?us-ascii?Q?02w6MxUhGVEfo5hgJ462EkFo40DnmgqjHqqO5pjo4DDQ1njlInEuw7irrua/?=
 =?us-ascii?Q?m8xUAu8yMULo4aKOkkaUQ8CGjOk27ZoefLXE/qKdziUlnDOAe9yp4Q9THf3N?=
 =?us-ascii?Q?CDyCzJgd1ysUrTgRNxYdGFI44jTMqUvM/6aF0ecHzn+T0uHyOMobfpyFbtoJ?=
 =?us-ascii?Q?wE79TUlwXH3LFaFNlWbiIZTGnFAJfylUlVB10h6B8DF1pt/7NFvgRq5/FCqR?=
 =?us-ascii?Q?X89eNscz+L/Rh67qBn4zE2fUOqkZBiauaM6t1gqt2n2xCnhdAIBzd4cyB1dB?=
 =?us-ascii?Q?rwaSB3H1f3aWHAg+8dpBRT48G9RMrNI5xVCd+RF3Rr0qS1vd0677ojZed8eu?=
 =?us-ascii?Q?+bMvLC4FM/Ofue+1E43QPV+ioAqmr5bFtFlGXh/7+kf54xCvrlm80AVMi1VJ?=
 =?us-ascii?Q?qQXwvBn9ko4/gmTDROq4UCY4KEbUGOcEyrTZwN5l+t1ioZIp5X3I2UEwG92O?=
 =?us-ascii?Q?ilLAqfzlQcGtxPlbBet/le3m+kBwUzBrIaUWt24eIXyYHYzDta0TF17STg6n?=
 =?us-ascii?Q?uzcQXYnrFjbtqJr9ycvhCnuq3sJI0TOlhP4nBHJTkFAmdYk4E8aFWC3rpCPZ?=
 =?us-ascii?Q?zOYTjIPslg4s7FBJ1/efDm4vOuOImWVKqtnzUe9sQdt3teAyCVGz+gyFl4Jw?=
 =?us-ascii?Q?FXb8hlWdCyf0DMzXJfJ0OHC4uaRWLJWBj+pF/RVBP1+oPML7sTr9STq5j/p3?=
 =?us-ascii?Q?kWHNfcumaJvL1fQyOdoJK4XiWcczngQmF10FJyYXPWUcsBRN249dWPXErBd2?=
 =?us-ascii?Q?d28PThshzHtgI2SA91WquEvwpCr33DURkh1R57XsmIkv05DQoAJe87lNR302?=
 =?us-ascii?Q?uiUsD6tvnHSeq+b7Wd/V2LTaKptxVH6pOMcveG+sLncQup4yqMod584K+lHh?=
 =?us-ascii?Q?rOJ34wfqzbFKuS0jgh00rxcV7YzU91NPmPEvNKeJMLliwdswMP7XwNSoIY7B?=
 =?us-ascii?Q?WLk5sL+T6N2m2udSYE2Yfj6IC0cIIC3WSAf2nFLRKFLxS9cIywJfiPfS5XZ9?=
 =?us-ascii?Q?ffWX1p+N4Qx/xXQ+AI17gP0ksIEpUkJOk/h12IzekJ3TFISPQeQwXSTRKowh?=
 =?us-ascii?Q?1n8ZPfboNqGtIGW0LG1KoLTfpB+YcyQy+Z+V6iY4vYvMTuB+chOnDx23/JGH?=
 =?us-ascii?Q?5ITCMj1QmhISz6Cq7B5RtnazNSK2nujn1WjB?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 11:34:12.4004 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3574c6e7-0f7e-4040-45c1-08dd39465ce6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D3.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8284
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gz0U4xEI3vugyJxFW0J9jNse9odFSE1E6aqGGlpjwuw=;
 b=rLMsPn6X2rfZ3h4cbUhgzcbvlYT4h1/8e81O19BM4F5T0lKLZL2H1zOksuXENMY6LvdX20zMXQR7/xyg0yncJY2BOiVRm9viEQwEZImXx4KVETjWjd42rpP2QWxxoqbWAgyIsqJpRfK+FGAT6UOn6Hkzq1ezyprm8qPRM3Bt9rk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=rLMsPn6X
Subject: [Buildroot] [PATCH v2 2/4] boot/uboot.mk: new zynqmp pmufw
 embeddedsw option
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
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The new BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW option will enable u-boot to
use the xilinx-embeddedsw package for building a pmufw.elf that gets included
in the generated boot.bin.

If the BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW option is enabled, then the
BR2_TARGET_UBOOT_ZYNQMP_PMUFW config for downloading a prebuilt pmufw from a
custom location will be ignored.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- edited Config.in help text to fit within 70 characters
---
 boot/uboot/Config.in | 27 +++++++++++++++++++++++++++
 boot/uboot/uboot.mk  |  5 ++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index b6ac2f9380..430191d213 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -572,6 +572,27 @@ config BR2_TARGET_UBOOT_ZYNQMP
 
 if BR2_TARGET_UBOOT_ZYNQMP
 
+choice
+	prompt "xilinx-prebuilt pmufw.elf or build pmufw.elf from source"
+	default BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW
+	help
+	  Choose between installing the pmufw.elf from
+	  xilinx-prebuilt or building the pmufw.elf from
+	  xilinx-embeddedsw.
+
+config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW
+	bool "xilinx-embeddedsw build pmufw.elf from source"
+	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
+	depends on BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
+	help
+	  Use xilinx-embeddedsw boot package for building
+	  zynqmp pmufw.elf from
+	    https://github.com/Xilinx/embeddedsw repo.
+
+	  U-Boot build process will generate a boot.bin (to be loaded
+	  by the ZynqMP boot ROM) containing both the U-Boot SPL and
+	  the PMU firmware in the Xilinx-specific boot format.
+
 config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
 	bool "xilinx-prebuilt pmufw.elf"
 	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
@@ -585,9 +606,15 @@ config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
 	  by the ZynqMP boot ROM) containing both the U-Boot SPL and the
 	  PMU firmware in the Xilinx-specific boot format.
 
+endchoice
+
+comment "If xilinx-embeddedsw or xilinx-prebuilt is selected for pmufw.elf, custom PMU firmware location will be ignored."
+	depends on BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW || BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
+
 config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
 	string "Custom PMU firmware location"
 	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
+	depends on !BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW
 	depends on !BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
 	help
 	  Location of a PMU firmware binary.
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index b3094029e7..cb745413e4 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -453,7 +453,10 @@ endef
 
 ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
 
-ifeq ($(BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT),y)
+ifeq ($(BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW),y)
+UBOOT_DEPENDENCIES += xilinx-embeddedsw
+UBOOT_ZYNQMP_PMUFW_PATH = $(BINARIES_DIR)/pmufw.elf
+else ifeq ($(BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT),y)
 UBOOT_DEPENDENCIES += xilinx-prebuilt
 UBOOT_ZYNQMP_PMUFW_PATH = $(BINARIES_DIR)/pmufw.elf
 else
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
