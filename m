Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5162CFD2F6
	for <buildroot@archiver.kernel.org>; Tue,  2 Dec 2025 10:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8055A60AE6;
	Tue,  2 Dec 2025 10:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1XV_omnef1cH; Tue,  2 Dec 2025 10:05:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BAC360BC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BAC360BC1;
	Tue,  2 Dec 2025 10:05:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 47A28D3
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 10:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 388FA60BC1
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 10:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y54KDIQB6Fhh for <buildroot@buildroot.org>;
 Tue,  2 Dec 2025 10:05:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c112::7;
 helo=cy3pr05cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DEE2960AE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEE2960AE6
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c112::7])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DEE2960AE6
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 10:05:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V9l2NOsrSLYL1lqd9lcamFPkphjP4+amnuPqTOI1t/PLaw/u6mKi6qrgkI27JhYR6voqBC3kMzlpEn+YJw3v0F/bUqmNrQnDRCO1VMUz/nIDg0KFqWNW8nDHcK2tNGxef+nRCYlcVFbACHipjRefE7SYgNzeYRNxk6aNQSWgXHPJEAGrlooD5Dzr5DFGpjOZyktYbBjKhxd8hQZRs/j+9vwH1xLZKgnjI98om8zTAW18JR29H2qYwYzSTiXBJ7+7UUFZh9oLHvjUktYV+FBqP/bSISunDrZgMfXtusdpnVa+4NLzm1bmZ3t5cBhNLQQJriMqgqd0I9l4lGbTf3MvAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIlQdWI3EducJ4Kt13/sFPf1X+YAFJg62PBYhe6ZhF0=;
 b=Oq0Xr7DDPgTEPCUbqAtqodeWxlK0ihlFh1gHXeHNXPBb5HAQXq/3W74U02sngzlXobJ0CPm0mKPb3UzEIndpwD6+5B9q8kqQlsWSms+no9oXpdNjq6+/v7h8uUdmFZl5ttS0/dYTqjBXWO68vWUecbbCDMOxACnOYuoBmCytomMkuJ5aZcYS5pudHKle8wC0cFJZWfPejq/Qfn8CEo1ZG3cB3QyliqbzqdPPH2evBBYXSZ3EaPzqt5rpRpIpgfq2B9KK1K46dfDy5IyeN/fhhOgSMLgF6k1kE8HmmlIHeywSr/qFyPY5aEW4oVAYRuyi8wUFRmMkkolH1Dhs0C5qeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH0P221CA0039.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::21)
 by DM6PR12MB4185.namprd12.prod.outlook.com (2603:10b6:5:216::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 10:05:21 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:11d:cafe::66) by CH0P221CA0039.outlook.office365.com
 (2603:10b6:610:11d::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 10:05:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 10:05:21 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 2 Dec
 2025 04:05:20 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 2 Dec 2025 02:05:18 -0800
To: <buildroot@buildroot.org>
Date: Tue, 2 Dec 2025 10:05:14 +0000
Message-ID: <20251202100516.1097984-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|DM6PR12MB4185:EE_
X-MS-Office365-Filtering-Correlation-Id: 68e75c5f-e7a8-40de-a391-08de318a4dbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|36860700013|82310400026|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QleseVChMe5c6hhYad2hzn63B5VMSwtX6CW/8jBevb8oSknATajR7hXHMMTX?=
 =?us-ascii?Q?jVRLMn8KjojqBU15y0VgaJ559dwdP+RDjhwYlJ87slQyhiyvqlgHSTjTC5xl?=
 =?us-ascii?Q?V2cUct1TTcZySab3nx8cyJAXio4Yp7G+s5dfQWhTioPIuObsIQgDHsjo735h?=
 =?us-ascii?Q?B/ky3YmEGloClYZi2vcG8BfVAy9wzI1kssSx6/XITeLRgpB3slm1u2Q8oSC9?=
 =?us-ascii?Q?hnGsz9eOO+EIFURJfnsu3dbKGkQCXZ7MhFAUffniLVZhbHkf9JJW9Th6CoNh?=
 =?us-ascii?Q?xx8G02q5rlfQ+oIPfjE1Azr5mPX46k9bLlmR9Boe8wgKfaCcE3IzzJwnGQ/H?=
 =?us-ascii?Q?3lcxXGnZO11KSomtQ+DoVGh3F8Z1IxpirlPSR0vNrKc7jKj7AvZHiMW69xzB?=
 =?us-ascii?Q?nFlPTm0dgOFPOuTBvobvFSgUbanbQWkI/tI6XHKANgMYALOUOuNcXYC/iP57?=
 =?us-ascii?Q?1Bgc/ShNVDU63k83AX/75bAcOkfsVeqt7is5ShOWM9IpH1Ce69AjhOiQIVq/?=
 =?us-ascii?Q?D6WFFQmAuGbUKKBcBfbTsR+a1c0EeTATD5CBztXR1p/zKmpB9MEq5uC9JlE4?=
 =?us-ascii?Q?vPH+MO6dMe8dFy6gBqcSFZlTbxt3EHzsDNtjub237uh/jsk49QZ2CcD+M4bR?=
 =?us-ascii?Q?05SDKxZiZMzAcQ6DAHcalLXqSL/p0+WBxSARr97CGiISSVexcIPI0plTJGP0?=
 =?us-ascii?Q?T2m7uMl9QrQb5OBQbOWwO3p8iDgy/c3S6WbNrDsb1wideJbunJjkkygEGAG9?=
 =?us-ascii?Q?p0gowTtTlkMHPym2o+jN1phcakEjfkkR71JWXWvwo3UU6q3Q2JBqZ6uIufo/?=
 =?us-ascii?Q?Hwnan+QfNIU82IB1qfXfLTjg4axr8tn3wJYVHWBo26HbUWC1F1cWY23L8L1b?=
 =?us-ascii?Q?SUjkLX5zGgAwk8mkehyX4HJAnt9GDQLj49Oz7rAIFO/30z4pVnsvpAzuP8jt?=
 =?us-ascii?Q?TptrkIH7knGSzKc6qAptB8SB6yNfJVCkBSKTmGzBDZsCVN9A5CYuNfSTnt56?=
 =?us-ascii?Q?Xzm/+LtwkA2hdI7ejES7kZ8H0u04Ve8cyWc99U60NlbEnTtS9utaFLO0UuLA?=
 =?us-ascii?Q?d3IKS/y1j9z+MJq5DIE83kprnS3Er5KxpaNg+EfKcxDg0kZ28og9zdS1zqlg?=
 =?us-ascii?Q?vF/Vacv5F7pfU3Ut4YEsgFRK7T3rhtU1klMUGThN9mWjDFGUr27rnZi9mzId?=
 =?us-ascii?Q?L9AyUN9PB2ym9OUn68ipZoCevFKUrbtzTv/gwRRtKpoajCgDCAx1Y5q0cjDG?=
 =?us-ascii?Q?eMS/GZRfM7HWNW7p2BsKnOdoN4uP82Er9+5huIPcyCo6WCRVQBXijJlR94vc?=
 =?us-ascii?Q?iyS8GCvSHaAWuXwYboj0seX0/FO8ia625wACSqJZkTBlqZs+LmyY/w7mLItZ?=
 =?us-ascii?Q?WpHc5Byf0ioPDxxqQ5Ft9WFeVbzX85yFJLxqbbJTOs70ZBUgCLiIq0+QnEVb?=
 =?us-ascii?Q?wKJ8SPEf+8saCjsx7uxIUXvNY5J98wpLrlqFh4JmlJjTIhG/cwuBMA0gkDR9?=
 =?us-ascii?Q?TT4yQ8WEnJ57debaGod9VQ0IKdeU58CJHtJlAGmYCK8n7CeTRy9AWbIaghgR?=
 =?us-ascii?Q?TjviFBjs7yS1sB5Fem+8uEVVWb3iDRMM/kzqT/sPAMkE6T/gOEaTZ7qVGk+A?=
 =?us-ascii?Q?6Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 10:05:21.2103 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e75c5f-e7a8-40de-a391-08de318a4dbc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4185
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIlQdWI3EducJ4Kt13/sFPf1X+YAFJg62PBYhe6ZhF0=;
 b=IXPSsNdTpaY83mfQ1+gn+iWNNS4ywInVig3sVAqALOAB7ULsT6UN4l/xV397rqpDdLaJihr1UR/av9Xk+dmri/3M0FdwD3YKsIO6lb8FEY3u63gzGpbuOKkA11UytjBbLA8cFUCJyKgQ4tsR4k1CAteCPND+3CIqPmXmfNGfLgk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=IXPSsNdT
Subject: [Buildroot] [PATCH v1 1/3] boot/xilinx-embeddedsw: add versal2
 support
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

Add support for Xilinx versal2 devices which include two new applications
for the xilinx-embeddedsw package.

BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_PLM
There is a new PLM (platform loader and manager) application for versal2
devices. The purpose of the PLM is to act as the bootloader for loading the
boot.pdi to configure the DDR memory and then loading arm-trusted-firmware and
u-boot on the Cortex-A78 core 0.

BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_ASUFW
Included with versal2 devices is a risc-v based security accelerator called
the ASU (application security unit). The ASUFW is the open-source application
which runs on the ASU.

Versal2 devices simplified the boot process by getting rid of the second
microblaze core called the PSM (processor system manager). There is thus no
longer a need for a separate psmfw application like with the original versal
devices, as this functionality is now fully included in the new PLM for
versal2.

For more information about the Xilinx Versal Gen2 series:
https://www.amd.com/en/products/adaptive-socs-and-fpgas/versal/gen2/ai-edge-series.html
https://www.amd.com/en/products/adaptive-socs-and-fpgas/versal/gen2/prime-series.html

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 boot/Config.in                              |  2 +-
 boot/xilinx-embeddedsw/Config.in            | 23 +++++++++++++
 boot/xilinx-embeddedsw/xilinx-embeddedsw.mk | 36 +++++++++++++++++++++
 3 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/boot/Config.in b/boot/Config.in
index 08a6c8353d..d3e1b9c055 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -4,7 +4,7 @@ config BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS
 	# All Xilinx SoCs using this package are aarch64 only
 	depends on BR2_aarch64
 	# only CPUs with corresponding firmwares:
-	depends on BR2_cortex_a53 || BR2_cortex_a72
+	depends on BR2_cortex_a53 || BR2_cortex_a72 || BR2_cortex_a78
 
 menu "Bootloaders"
 
diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
index 526c7adf07..674238fd0a 100644
--- a/boot/xilinx-embeddedsw/Config.in
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -1,5 +1,6 @@
 comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-buildroot-elf"
 	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-buildroot-elf"
+	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-buildroot-elf riscv32-buildroot-elf"
 	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
 
 menuconfig BR2_TARGET_XILINX_EMBEDDEDSW
@@ -26,6 +27,28 @@ config BR2_TARGET_XILINX_EMBEDDEDSW_VERSION
 	  Release version of Xilinx/embeddedsw.
 	  Must be xilinx_v2023.1 or newer.
 
+config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_ASUFW
+	bool "versal2 asufw"
+	depends on BR2_cortex_a78
+	help
+	  Build versal2 asufw application from Xilinx/embeddedsw
+	  repo.
+
+	  https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps/asufw
+	  Version must be xilinx_v2025.2 or newer.
+
+config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_PLM
+	bool "versal2 plm"
+	depends on BR2_cortex_a78
+	help
+	  Build versal2 plm application from Xilinx/embeddedsw repo.
+	  If selected, the xilinx-prebuilt package will not install
+	  the plm.elf since it will come from the xilinx-embeddedsw
+	  package.
+
+	  https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps/versal_plm
+	  Version must be xilinx_v2025.2 or newer.
+
 config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
 	bool "versal plm"
 	depends on BR2_cortex_a72
diff --git a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
index abcfee255d..5fb442ee2a 100644
--- a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
+++ b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
@@ -30,6 +30,38 @@ XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_CFLAGS = \
 	"-Os -flto -ffat-lto-objects $(XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS)"
 
 XILINX_EMBEDDEDSW_CFLAGS = "-Os -flto -ffat-lto-objects"
+XILINX_EMBEDDEDSW_ASUFW_CFLAGS = "-O2 -ffat-lto-objects -fno-lto"
+
+ifeq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_ASUFW),y)
+define XILINX_EMBEDDEDSW_BUILD_VERSAL2_ASUFW
+	$(MAKE) -C $(@D)/lib/sw_apps/asufw/src \
+		COMPILER=$(HOST_DIR)/bin/riscv32-buildroot-elf-gcc \
+		ARCHIVER=$(HOST_DIR)/bin/riscv32-buildroot-elf-gcc-ar \
+		CC=$(HOST_DIR)/bin/riscv32-buildroot-elf-gcc \
+		CFLAGS=$(XILINX_EMBEDDEDSW_ASUFW_CFLAGS)
+endef
+
+define XILINX_EMBEDDEDSW_INSTALL_VERSAL2_ASUFW
+	$(INSTALL) -D -m 0755 $(@D)/lib/sw_apps/asufw/src/asufw.elf \
+		$(BINARIES_DIR)/asufw.elf
+endef
+endif # BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_ASUFW
+
+ifeq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_PLM),y)
+define XILINX_EMBEDDEDSW_BUILD_VERSAL2_PLM
+	$(MAKE) -C $(@D)/lib/sw_apps/versal_plm/src/versal_2ve_2vm \
+		COMPILER=$(XILINX_EMBEDDEDSW_MICROBLAZE_CC) \
+		ARCHIVER=$(XILINX_EMBEDDEDSW_MICROBLAZE_AR) \
+		CC=$(XILINX_EMBEDDEDSW_MICROBLAZE_CC) \
+		CFLAGS=$(XILINX_EMBEDDEDSW_CFLAGS)
+endef
+
+define XILINX_EMBEDDEDSW_INSTALL_VERSAL2_PLM
+	$(INSTALL) -D -m 0755 \
+		$(@D)/lib/sw_apps/versal_plm/src/versal_2ve_2vm/plm.elf \
+		$(BINARIES_DIR)/plm.elf
+endef
+endif # BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_PLM
 
 ifeq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM),y)
 define XILINX_EMBEDDEDSW_BUILD_VERSAL_PLM
@@ -77,12 +109,16 @@ endef
 endif # BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
 
 define XILINX_EMBEDDEDSW_BUILD_CMDS
+	$(XILINX_EMBEDDEDSW_BUILD_VERSAL2_ASUFW)
+	$(XILINX_EMBEDDEDSW_BUILD_VERSAL2_PLM)
 	$(XILINX_EMBEDDEDSW_BUILD_VERSAL_PLM)
 	$(XILINX_EMBEDDEDSW_BUILD_VERSAL_PSMFW)
 	$(XILINX_EMBEDDEDSW_BUILD_ZYNQMP_PMUFW)
 endef
 
 define XILINX_EMBEDDEDSW_INSTALL_IMAGES_CMDS
+	$(XILINX_EMBEDDEDSW_INSTALL_VERSAL2_ASUFW)
+	$(XILINX_EMBEDDEDSW_INSTALL_VERSAL2_PLM)
 	$(XILINX_EMBEDDEDSW_INSTALL_VERSAL_PLM)
 	$(XILINX_EMBEDDEDSW_INSTALL_VERSAL_PSMFW)
 	$(XILINX_EMBEDDEDSW_INSTALL_ZYNQMP_PMUFW)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
