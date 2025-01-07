Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4667FE77197
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 11:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE41D404D9;
	Tue,  7 Jan 2025 11:16:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v8qDC5nM8TAt; Tue,  7 Jan 2025 11:15:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A708A404C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A708A404C1;
	Tue,  7 Jan 2025 11:15:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AE4307AA
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 11:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8979860742
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 11:15:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vB82b5Zzds65 for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 11:15:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::625;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9D464605A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D464605A0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::625])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D464605A0
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 11:15:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=skO6ett7TqDyKxav9ChDpzwHTNQ6d5pF2C5rD0OPCUoUqKr2gGGCgeKO8/A8mY16Lp9J1aJVccHBp19M6+P/MinpwFUaYCk3cpsrtNjuy7o64oep19y9v1l8lQMsyFwG/D/ICHmuZKXe1GO07JBHcEnTIAC3hwsLnuQjvB1vqyCQtyW2yXmLWsMoORpU6gx5/jDgBmFKze3TlsQpWbIhvy7B8Ptz3ljalVebarSI+sDgsRahE6pe85P6rnNxQS9cXowxsiqosWLS1hdYoXqFq7BOVNcm1KRyYmhjbiR4iNA/k7ZKG/bvvDWh8W5M+1ScQ8Y3S1/iH904NQqj9BQwFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JDqrJYZbydrvxboIlJ4AkehqosEuLIDTgeIqbCoxO70=;
 b=DlxpIoscQ+vTAa5Y45u0clSVYaMh/YHa6J+0SrxWSgczYaojdXSj/Ajt6tmfhq29m6ecF80GW18nXlIWwXZupZahmq6w2sgnH+lQcaLJNSw9LFvqks+ty8oIFEW6d8o3KnZpalXeFs14wT6XOq2sZ5STxx4HYBRj2R83aKWGvMKAM5jQeb9VRfz15KRCl6Stdi3aoYRZYlrqWW1pnqueGgPeckWD9nxNBBA8u6/dtiBpM6mnL0tDDxn3fqB6p6vxxBidWOBtMLtuFwIAsT+6MayGRJ7K69eWrHRiafG8NeHOR0MFe06C1ZkpaURNf3K+y4MjfrghLndltNwm4U4jvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN8PR04CA0031.namprd04.prod.outlook.com (2603:10b6:408:70::44)
 by SA3PR12MB7922.namprd12.prod.outlook.com (2603:10b6:806:314::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Tue, 7 Jan
 2025 11:15:48 +0000
Received: from BL02EPF00029927.namprd02.prod.outlook.com
 (2603:10b6:408:70:cafe::58) by BN8PR04CA0031.outlook.office365.com
 (2603:10b6:408:70::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.15 via Frontend Transport; Tue,
 7 Jan 2025 11:15:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00029927.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Tue, 7 Jan 2025 11:15:47 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 05:15:47 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 05:15:46 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 7 Jan 2025 05:15:45 -0600
To: <buildroot@buildroot.org>
Date: Tue, 7 Jan 2025 11:15:38 +0000
Message-ID: <20250107111540.1548042-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250107111540.1548042-1-neal.frager@amd.com>
References: <20250107111540.1548042-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029927:EE_|SA3PR12MB7922:EE_
X-MS-Office365-Filtering-Correlation-Id: a3890270-625c-4068-018a-08dd2f0ca30f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ndjGUSGB2yPiyZDxHpBf5bnb2GvVHb3hM8qGCQM2xbaNRfCnyWMZ+uMjm/KS?=
 =?us-ascii?Q?osbyhvmZKEyZ54k+59snyCKsSI0CiwsXFVUvrTgRpL+fFmTeEYGX2B3kTktX?=
 =?us-ascii?Q?d2BbfuR3VP8SD8mNxX+v37We1KhTCUUHO3nMEBwaOy0kK020tG94pIHU6BRM?=
 =?us-ascii?Q?LEQLNoqpSuvzuFGNZaOAO1vbbW0sUoXiE5IchZ+dpZ4plq9NGcZ3NUaUaAUg?=
 =?us-ascii?Q?lh2lXOKSXVreMFenoPcKbhHHJ1UXwd7xrUSIt4TRBDU8h6isq2oJ3AjlSpXK?=
 =?us-ascii?Q?rBFqajPpOeyD3n9AJUAYNfbqn8df8nTGsecZ/vbYei/L3Nmu0Po/XoTYJ6Od?=
 =?us-ascii?Q?72J4IaDZJFdB1mpFMyRQC9Je8KD1SZYgbiPnpg6/dZdGAu8viKmGGIKqPCoz?=
 =?us-ascii?Q?N3/GzvjryluWXx7RBM0toU/PM0B7JkCE3QiShAqt40IK2+yctg+V1pLQuXFa?=
 =?us-ascii?Q?wcNi5aj8AF6VdSu700GPu7pLa+J6BqmXBOKV/1KVQwHK2YTEiwXahPB4UVc+?=
 =?us-ascii?Q?yDxcWBRAm/ZID2ctnbl7yp7zhVJrb/Bl0jPbcNAjSgYIne+d8NBz1qa2n5PL?=
 =?us-ascii?Q?wSv1suMQ2zaNUr8fYZKI09uxdplpAfM6mRaJDrP/qkJ5Ily2kMC2SXQ2Z+HU?=
 =?us-ascii?Q?GI+fBqe3qLYEcgAZHw8M8TlOXsMqwkglcDTgcdwMhZBNLTM36s7E8FkGpjFB?=
 =?us-ascii?Q?6SPkU92jTmASLReiR8M1lWG3i7HUej6n8dHphXef/9H1ELBynpn/TvQT3TSw?=
 =?us-ascii?Q?0Hetgg4+U9ZpoPIyC1+QEADKKPBgN3FUMr4rs6bpxwQk3kNsjVPTaXXmq6tE?=
 =?us-ascii?Q?4sP4ArtpkHIAMVDRxhIUuzdIxtNtJv8JrC6Izovbrxn+inuYQlWGoYOVEZ8C?=
 =?us-ascii?Q?dm9GgkLx/MPqP94Rpi/O9qjY7yTNOPk3svUYCqlL95oCxO/HcKeAjgaWauTN?=
 =?us-ascii?Q?QhnwiwZFkaxsWCTMrjVQ1HLUHbTQWtWrNBZXLVPcn8nYrKNfNxbt2DnHj9Ve?=
 =?us-ascii?Q?m96EWqY/SxPFcHdUtERTUMovzWIL4g1+1C1wl4qQtX41ISbQkDtzVGAhj/kp?=
 =?us-ascii?Q?Xm0dvwj7lmTXEGjFZYJI6Mxfr/AVo1nuDk5I27uLsrOlFmFSRaIDKaBD6FFO?=
 =?us-ascii?Q?3Bn4UNa7d+I2VYxs8Z8PCtkCq5nIWPY5Y3sdQK/Z4lXZIs4A6+CCUlGwPIio?=
 =?us-ascii?Q?XmqUJia7dN88mJtzBVZxJYzkQwili/Fg8avnTaZniUKeNoWO/WOL5aPP88Vm?=
 =?us-ascii?Q?VBUYIqRbijuNJJ8nLXg5Rkohr8+P8ub8UT27t8qvWjUx5Ub+nv/TBdBRTv7n?=
 =?us-ascii?Q?IagVpR3FYIv2z4yxZxEInKr+163R38dHftrXA0MVRfUeGZ2bby9ph/E6U+0c?=
 =?us-ascii?Q?Jwxf5cPHZ6LDYDV0qdzNnI8N8ryrRp99idPgAbu58XqMN6YeASdVv5CC/ysC?=
 =?us-ascii?Q?pQYzc9welpaZEunah/LaOpdyvrC8Jad4kMflO8s0l+ogdTGJZzNN0A=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 11:15:47.7479 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3890270-625c-4068-018a-08dd2f0ca30f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00029927.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7922
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JDqrJYZbydrvxboIlJ4AkehqosEuLIDTgeIqbCoxO70=;
 b=b1VQGsmdAorjcvx9/AFoYeKovnUOcfo+QifIslc9An9tcofXCA4cb1YReHYGLNseyEbVRnFS6+sOp1LDbSGyc+/g5+tyGogne5rDBDDNTu7M8qi7JmVPGlo/4cDksnkEzLewUWkBbMXin0gU4/x2GxgFUdGp9le6ghjoBefN1N4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=b1VQGsmd
Subject: [Buildroot] [PATCH v1 2/4] boot/uboot.mk: new zynqmp pmufw
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
 boot/uboot/Config.in | 26 ++++++++++++++++++++++++++
 boot/uboot/uboot.mk  |  5 ++++-
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 8648d6eb7e..458e622423 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -548,6 +548,26 @@ config BR2_TARGET_UBOOT_ZYNQMP
 
 if BR2_TARGET_UBOOT_ZYNQMP
 
+choice
+	prompt "xilinx-prebuilt pmufw.elf or build pmufw.elf from source"
+	default BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW
+	help
+	  Choose between installing the pmufw.elf from xilinx-prebuilt
+	  or building the pmufw.elf from xilinx-embeddedsw.
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
+	  U-Boot build process will generate a boot.bin (to be loaded by
+	  by the ZynqMP boot ROM) containing both the U-Boot SPL and the
+	  PMU firmware in the Xilinx-specific boot format.
+
 config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
 	bool "xilinx-prebuilt pmufw.elf"
 	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
@@ -561,9 +581,15 @@ config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
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
index d8faef648f..3a803cfd28 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -449,7 +449,10 @@ endef
 
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
