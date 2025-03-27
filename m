Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3245AC3600B
	for <buildroot@archiver.kernel.org>; Thu, 27 Mar 2025 11:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE55E41E34;
	Thu, 27 Mar 2025 11:16:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yd7vnCF_-kn8; Thu, 27 Mar 2025 11:16:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 336CA41DCE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 336CA41DCE;
	Thu, 27 Mar 2025 11:16:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A7F21B7
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 11:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C4E941C8D
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 11:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AznP4QE2Somj for <buildroot@buildroot.org>;
 Thu, 27 Mar 2025 11:16:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2408::607;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6671C40190
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6671C40190
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::607])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6671C40190
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 11:16:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hk+r7Sd94K5GtTyUy3fodeSpPAI83rbWTPKYizDO3UEotSm+LSyk4FJAv2AHqmHSstGz0jzEtgn8rPbKGEn/C7LsUCyG/nO0IOMfyaDGCpht2fT78/H+gPb4MebcbEMFGI/GejbWKfRYL7TPF7XrDlZ3CI316w0qUiuYv5vs5fZpHSyT81Mnlk/cqUlSQq+53NMxFApQn5vkSlgUxhJPY5AIOmNoAmPHaXFozEoqNG2jsBOxGUVKkDlOVGMZgS2xTkZq/wnP7PCx1p4d9pn1jVnEw6HKuCGpOs3zqS9lQsz8ztfoTJt1YK8GoUT029q89/4xeVdxQNj5RsZmhJdHcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R97l4fmYHjFCzBkRt2/QsUNXWH+Vcn/+phP/KMoMyk4=;
 b=i2pAoKMGnQ8BfioBdN63cXWqxZobYNZ8rZ5l4AG6y0+TOec/oqZ/Sih79eK2qvx/YpzlfLZw0kP/qvLDI936YY2qBjeMMLmqVfgqnguqIEjIW0o6UzwJGjD80AiQTkOBOyHgmixMBn3CFkkNVYMk1dmbIrfeFYwfaVbPeM2j4hUscNV8exgFzR+zI/BR40ZeeKMSi4iScR7Hwl6+U8rzrrI4aQ3A3bWN+oCFmes62jJIimboKjaSInDPyr7g94ti2EBQK5I1Onm44y5OOHr6vKkS74oDpmq2Hub9chBhuTq8tquLmzIuKQsvxUqtj22PuJyUQNz8Eh85NSBbaAWKqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR04CA0262.namprd04.prod.outlook.com (2603:10b6:303:88::27)
 by DM6PR12MB4250.namprd12.prod.outlook.com (2603:10b6:5:21a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 11:16:50 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:303:88:cafe::23) by MW4PR04CA0262.outlook.office365.com
 (2603:10b6:303:88::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Thu,
 27 Mar 2025 11:16:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 27 Mar 2025 11:16:49 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Mar
 2025 06:16:49 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Mar
 2025 06:16:49 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 27 Mar 2025 06:16:47 -0500
To: <buildroot@buildroot.org>
Date: Thu, 27 Mar 2025 11:16:43 +0000
Message-ID: <20250327111645.1430919-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|DM6PR12MB4250:EE_
X-MS-Office365-Filtering-Correlation-Id: a8d8b3c9-e300-4aae-7dc4-08dd6d20debb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jceDS/7kVaXRzL4GbBLJp1kUIi3qvcbS9wD9SS6ZoSvAfMMIKVSoXHRmmN0g?=
 =?us-ascii?Q?J07sYtNiIw5lZ0cN1UePJWHLLXtDeid9BnFstiYGVL14oiK/NRvgVxVt3wRW?=
 =?us-ascii?Q?kivyTSIiK/ml21xy7SrkqNH3YFVvaXYfoSIaeqd5lR5gKRtnyfgt8x+jgA8l?=
 =?us-ascii?Q?dRIIVQhjBu1WIjm+BMIR8FtXUCnpyh6OsFGJ2ztGiWzwlIEyhM3xxBbVQykb?=
 =?us-ascii?Q?FunGj5Pu7tY+rBnLL6c6HYqv+LRQ5AltBG8jyXiPQ6hxbIVIKtfD65eM/du2?=
 =?us-ascii?Q?PBIErYTnkN0oOY9fBm0DmjEUUyJ2nF/fgAecPRXD2NtMRKEY4fK/jV0wD+Y9?=
 =?us-ascii?Q?Q+Gj3l1DoCwtkPAuktApYwj0kKXTHu6dsYBebQv7BZYLdCWM2dDpmCL/VRk5?=
 =?us-ascii?Q?fS5E9rABtYTNc36OILpgKoltH/MbtBDij5ePph3FoShq47pX/3hK//y6gvx/?=
 =?us-ascii?Q?Tr2R7TjgrJAYK/csCoCErf1HgIwT0KjXeaUBGCOZgQRDUSD9YWiGi1QV4Eiy?=
 =?us-ascii?Q?0ImJynMjK4WNFJHGWp/3WFfdR+T0ai/ky2sxaZW2uJwal4O/sKg34THbZnyP?=
 =?us-ascii?Q?SepWvvMpktjPxHSYzNlEZxssityu31/lE/sZ5nZSEBHdOM2rM0D/f2L7pOJi?=
 =?us-ascii?Q?kKiYXft9oLFWUL52BMr+A+FXww7syGr/p96fyyIf93LbOAsAbmziml3AVBv4?=
 =?us-ascii?Q?20wiNNB3YGyllEmYrBTs2pIlWwGNhc+dr11LKNuUrtY5RCFc2vBeziBxPRmH?=
 =?us-ascii?Q?qBDixh1jJwnbAqILzD8iNRPDBpuKVzEdZprmSdm5B6XAR5K1hZeedRnOp2u3?=
 =?us-ascii?Q?28Ji4WdPCtZ7W0kIKRcoBWH7ltWnHnjZVZ27e/kRSrWPcv3SePKRoTu6bAsY?=
 =?us-ascii?Q?DiZVFuf/PWm4odLbwExfmPi8bRz5pF4JRSSh78wG8bCIi16pweruR/NJAuCn?=
 =?us-ascii?Q?mKQnLxGhgDbKgHtriTIfRPX4l95M5HuZb/495TfJfWG8FdjRCx+r9Ja+Hmh1?=
 =?us-ascii?Q?cp5gTnr4rZc+KNvzL17wyWqYub90XBhEN3eib2FkjF5U/0hANW/3+ghrT+fe?=
 =?us-ascii?Q?IXqJKi8p2fpSriy8Loh1rvp4/wJmzXY54fG0HCfgpW+CVCfH67PTOHomtDsw?=
 =?us-ascii?Q?bkhMmRjBFaG5FpErXxVjR9RP+0+JWNc9kJt9KtYkz+SMyJYveMIds7Orsli8?=
 =?us-ascii?Q?f/uyn3JiQd03jVkVWGs340oVsL0I2+63y5xUGTvERIEm8McTCsp5cCJQbQCI?=
 =?us-ascii?Q?v6gvmZnYwLnEDd9/Np3HC+8utR5pYDVOgZzzEn0q7O7FOpJEkNKAmcFQ+Htm?=
 =?us-ascii?Q?iKixxrFwdNMUPnI2GZ7zkfPOyd4YqasiNAipITfLuk77dhbU7NgJUQQbqBbm?=
 =?us-ascii?Q?Tofspw2W33oBbbgb2C/kjC34b/oxfPnY7+SqCE0Ke6uAVzoYe+SoaGbiRYAl?=
 =?us-ascii?Q?99afriWjZ9IR9IC5+0Cf09DxRIHZRrF88zTI8PZ5p9OSpKioSo+gvZi/ZQxX?=
 =?us-ascii?Q?igLL3VI1fdx42/Mvn6CZQNyt9YnwLNaiTt4IU5mLk4tceNvWS1bGC/FlIoTK?=
 =?us-ascii?Q?Fnq3Cx8V6nMeiOGBmOg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 11:16:49.8907 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8d8b3c9-e300-4aae-7dc4-08dd6d20debb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4250
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R97l4fmYHjFCzBkRt2/QsUNXWH+Vcn/+phP/KMoMyk4=;
 b=dhUN3T2hOXxShIq6SlwU00gsylhw9lC45b+JG2vLoMvVtNOzyNoi6QEr1x4A6Ki5TcEqR/n1i5MnY1HSuosPgVB13my8ZCqiVNp9Bc1NEACl/9eH/n6dJmvnfdU+K7ILkyOsGTq8g8fgIanF1XeSdMpqdPdeIKjV/0FQaQ1uvnY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=dhUN3T2h
Subject: [Buildroot] [PATCH v4 1/3] boot/xilinx-embeddedsw: rename toolchain
 vendor to buildroot
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

This patch renames the bare-metal toolchain vendor used by the
xilinx-embeddedsw package from Xilinx to Buildroot to be consistent with all
other toolchains built by Buildroot.

To build the Microblaze applications available with the xilinx-embeddedsw
package, the following config is now needed:

BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"

This change keeps backwards compatibility for users already using the
following architecture tuple:

BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"

Either vendor name is now valid, but the documentation will describe using
the Buildroot vendor name.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- xilinx-embeddedsw is now backwards compatible with either vendor name
V2->V3:
- split patch into series
V3->V4:
- rebase patch
---
 boot/xilinx-embeddedsw/Config.in            |  3 ++-
 boot/xilinx-embeddedsw/xilinx-embeddedsw.mk | 26 ++++++++++++++-------
 2 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
index a27253d594..31b12baaf2 100644
--- a/boot/xilinx-embeddedsw/Config.in
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -1,4 +1,5 @@
-comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-xilinx-elf"
+comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-buildroot-elf"
+	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-buildroot-elf"
 	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-xilinx-elf"
 
 menuconfig BR2_TARGET_XILINX_EMBEDDEDSW
diff --git a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
index 7d4fcf8b8f..eff015bc35 100644
--- a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
+++ b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
@@ -12,6 +12,14 @@ XILINX_EMBEDDEDSW_INSTALL_TARGET = NO
 XILINX_EMBEDDEDSW_INSTALL_IMAGES = YES
 XILINX_EMBEDDEDSW_DEPENDENCIES = toolchain-bare-metal-buildroot
 
+ifneq ("$(wildcard $(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc)","")
+XILINX_EMBEDDEDSW_MICROBLAZE_CC = $(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc
+XILINX_EMBEDDEDSW_MICROBLAZE_AR = $(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar
+else
+XILINX_EMBEDDEDSW_MICROBLAZE_CC = $(HOST_DIR)/bin/microblazeel-buildroot-elf-gcc
+XILINX_EMBEDDEDSW_MICROBLAZE_AR = $(HOST_DIR)/bin/microblazeel-buildroot-elf-gcc-ar
+endif
+
 # ZYNQMP_PMUFW application allows users to add cflags
 XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS = \
 	$(call qstrip,$(BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS))
@@ -23,9 +31,9 @@ XILINX_EMBEDDEDSW_CFLAGS = "-Os -flto -ffat-lto-objects"
 ifeq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM),y)
 define XILINX_EMBEDDEDSW_BUILD_VERSAL_PLM
 	$(MAKE) -C $(@D)/lib/sw_apps/versal_plm/src/versal \
-		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
-		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
-		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		COMPILER=$(XILINX_EMBEDDEDSW_MICROBLAZE_CC) \
+		ARCHIVER=$(XILINX_EMBEDDEDSW_MICROBLAZE_AR) \
+		CC=$(XILINX_EMBEDDEDSW_MICROBLAZE_CC) \
 		CFLAGS=$(XILINX_EMBEDDEDSW_CFLAGS)
 endef
 
@@ -38,9 +46,9 @@ endif # BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
 ifeq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW),y)
 define XILINX_EMBEDDEDSW_BUILD_VERSAL_PSMFW
 	$(MAKE) -C $(@D)/lib/sw_apps/versal_psmfw/src/versal \
-		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
-		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
-		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		COMPILER=$(XILINX_EMBEDDEDSW_MICROBLAZE_CC) \
+		ARCHIVER=$(XILINX_EMBEDDEDSW_MICROBLAZE_AR) \
+		CC=$(XILINX_EMBEDDEDSW_MICROBLAZE_CC) \
 		CFLAGS=$(XILINX_EMBEDDEDSW_CFLAGS)
 endef
 
@@ -53,9 +61,9 @@ endif # BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
 ifeq ($(BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW),y)
 define XILINX_EMBEDDEDSW_BUILD_ZYNQMP_PMUFW
 	$(MAKE) -C $(@D)/lib/sw_apps/zynqmp_pmufw/src \
-		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
-		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
-		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		COMPILER=$(XILINX_EMBEDDEDSW_MICROBLAZE_CC) \
+		ARCHIVER=$(XILINX_EMBEDDEDSW_MICROBLAZE_AR) \
+		CC=$(XILINX_EMBEDDEDSW_MICROBLAZE_CC) \
 		CFLAGS=$(XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_CFLAGS)
 endef
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
