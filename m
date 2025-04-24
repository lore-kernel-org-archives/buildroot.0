Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF1DC369AB
	for <buildroot@archiver.kernel.org>; Thu, 24 Apr 2025 06:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 818F440D70;
	Thu, 24 Apr 2025 06:36:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FycT-mbnoVki; Thu, 24 Apr 2025 06:36:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59BB040D7E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59BB040D7E;
	Thu, 24 Apr 2025 06:36:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 84FBCEC
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 06:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75ACC4015F
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 06:36:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n2q7idiojBSj for <buildroot@buildroot.org>;
 Thu, 24 Apr 2025 06:36:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::604;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6F9B6400D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F9B6400D7
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::604])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F9B6400D7
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 06:36:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EG+W4n5tLa4rz/a0lQHssg+UOrNDL8JxclmjH9MV/Ctpsw5YoFIhlGRNdgTFBkGiIDLMlkQAG7KBzH9Rl7ldEzlvbQPWIW4PbLWEss1yDtVKoqSTyEAnWByIchJHUbBLKY2jF+Wa88eRG5YeMNGU74SyuJrRvMDdnNlCUPllSUxmgo5sVG/u/n5lvH9S6XJg4GaWgByeHNB0f0kfkNTSfB4qzfwGEp7naKSZOwlLDnEAcOnJNwFKkI8qiSXcoKkuItTRsZaw9rUxylblXc6MH9cV2lrAOnKvJ75YcaOD3QTb7KD42Oe0gAoTTOO9/b9l0+GYbTznNO50wQ+3DmWagw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0xnfepGK9qxRuQsUXuMmldFJrZ68b7e/2OcFjQq329Q=;
 b=vA8shwtlvAmP05rbxHlOs3mQGJTV9LEZk+QlazFPt52MyDIRcTxM+CiV9sCbJvPvzGl3yET8FNYQNKOFVUuyNYn7SnNFNyRNFb4McSRx8UvX4a9p1p2o0ojgL9+xC83l2YIIpCNnmpnR58SFEOHXaThBVBlZ5sgYLsHV0WdPR+0L2lA9QDunslQYoFeKHTbs9qf/SNbdblSaCVJIj9RmYTqTcBPPN8d3Vb2isD2zFf/QghZVYhB5mA8l/gMKpPt8bCPDs2teSheo8RKPq2swKhPPLdZqzbM+x7lASxHbhCfVb/NLaGEwjuIVoK+qVUOFs5UA9izr9YK6OhyVuKJbaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN9PR03CA0542.namprd03.prod.outlook.com (2603:10b6:408:138::7)
 by SN7PR12MB7348.namprd12.prod.outlook.com (2603:10b6:806:29b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.24; Thu, 24 Apr
 2025 06:36:26 +0000
Received: from BN2PEPF000044A0.namprd02.prod.outlook.com
 (2603:10b6:408:138:cafe::8b) by BN9PR03CA0542.outlook.office365.com
 (2603:10b6:408:138::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Thu,
 24 Apr 2025 06:36:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000044A0.mail.protection.outlook.com (10.167.243.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 06:36:25 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 01:36:24 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Apr 2025 01:36:21 -0500
To: <buildroot@buildroot.org>
Date: Thu, 24 Apr 2025 07:36:18 +0100
Message-ID: <20250424063619.789456-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A0:EE_|SN7PR12MB7348:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eff0bdd-4f48-45b0-7d50-08dd82fa5608
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2wRrdGvfR21w4nQQF/66YHDmXNUydx7wxfLTmLyJl4CekYFPyxZ6uoTp6/sf?=
 =?us-ascii?Q?IzFsdGyuWM1k2qLvK/cC/+6nRoZxgZ2AlsVq3yNMMOfRQqA1S6QmQbqVk2Ao?=
 =?us-ascii?Q?omeVOF7cbe5tyrNg3etGG/OpRER3h1/gvRGZSsNS5oq5kSIf4nWmx0gI848Y?=
 =?us-ascii?Q?5E7iMBl2X4luziqsrb3VXao5oc1Yu6ma44w7lbtySne1J/UkLjWb4IDFHRXs?=
 =?us-ascii?Q?2w4LbxQgStVLkHT6PYxn7e3L/TpB9OfP433/aTlfAUsn4h8oPYZ2rOP0Gdwq?=
 =?us-ascii?Q?pXhGi3a4nulER5rwK0q4r0/susChf4z4oW0dW50iiHHfmOqBj1dlY2xyOWHT?=
 =?us-ascii?Q?50JKxIV44VzHSUAM8QQg4z2TJUH080l4iDbhq62otYvXND/hOH1JZFtcVNzY?=
 =?us-ascii?Q?+AJPxOrVUQjyAQfMSqPgkfkMrc4SitSimhzoIoKm4oWW3G87mzsSGgJ58/AS?=
 =?us-ascii?Q?7FZfEq/QF1ZTTtxsrSBKa/LC+MvtStKyiRqo1FGdg14eRgP+NVcpl5EO7Buq?=
 =?us-ascii?Q?9J+gdSLhC1X/k+Q40f1f+Qj1EghdS/9fteXGGZbfLIkZy3eUYZu18QwRD0WG?=
 =?us-ascii?Q?yJt4eaJfaLhGcBN5lkVlOyUAwcESbl7gEwnhcICbPxouJjyj/ivmcdTkosPX?=
 =?us-ascii?Q?86cA0010dhxV6tqgrD4ekR6N1gV5xohlDm1zfGjQxQTfPTeA/NZ0h/KpsNZz?=
 =?us-ascii?Q?8zsPJua9G3xzpSUD2QzX8TjoFuGqVOdHnnspJczxST4tFtSkOigvGd5XGI+q?=
 =?us-ascii?Q?QVcmYeME0FRenaME3as7ZOtN2T+F5J99kU2NOvcbFolrCm9dXV5BoE5WzDez?=
 =?us-ascii?Q?LvDD72kS/6kwEU34rjmXdaBEdZsBFECu9gdIh0ryoj3SD+CtwIyS7J/6oqoz?=
 =?us-ascii?Q?w7+HxPR1xVFr5j9yoDyqULcMd+4taNYr3qAKsYCxuFU0IOyB5mZ56WEH4Ql0?=
 =?us-ascii?Q?CbYXHwt7z1ldF/r+cP4PBCOIyYw15CL/6uWNF9EQpxc1/xruAzqnzrh/zg6B?=
 =?us-ascii?Q?lyxt/ufVtdjJTetF1+Ju3KGuR9pS+G7DN5TEv3lH+HVSO0332WSQrX23EVFR?=
 =?us-ascii?Q?arsnZ859hIsJWz9l7Pk23/GXxjs2DEVPAbIQC9G3BVHbsFlWb5Q2GlFahdBy?=
 =?us-ascii?Q?LjxRj+WA2jKgUsRaUR/F/XFZQcD7IoUZpTW1z/sxvbpBRcjGimCx6sosBlLv?=
 =?us-ascii?Q?MkeAXecQq4m1LOYs6yTxdwvP33E5e1F99Pi/d2FpAfET2m2PR56+aUChKw/M?=
 =?us-ascii?Q?T+OtJz64HUrslq7gETxwYlwEGGsg50dHJfEDjVNAZR4FWjRv4BwucPEChj/o?=
 =?us-ascii?Q?8EdPappefKpTaYz49J8ewUAZ2GLrt7geLwa68Dc3/3LbfPndmkDQf4RVEpfk?=
 =?us-ascii?Q?sVZl8PaAFdyWtIZERZcki4GLjMKPQIguV5hKChc7J0aVjtC3+eGKbR0omBWa?=
 =?us-ascii?Q?wLsaAU3qEmFKjHFZ89KoA9leR3xST++7JQrlyl+RSuDGnuHw9o9mNMBYZBMn?=
 =?us-ascii?Q?IT1zb1S/3q3MMbVSNJ/8v6kohkergxYPHl4D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 06:36:25.2882 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eff0bdd-4f48-45b0-7d50-08dd82fa5608
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7348
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xnfepGK9qxRuQsUXuMmldFJrZ68b7e/2OcFjQq329Q=;
 b=rpQG5hgm+pCxDxCedFTUAopzvrP7Ql1UdU++wiLL33nEUBWL5AktOnjk67EteKKVPyDeS4Kkm0UT87MzGIb8K5JuPtqgmi+LQFvLDUJcL6k0p/bVGW+JliuRlmQu7gQdutOp3d0G+9RS/s4QVEBANeWTEHZS73mLtn77R5yGdfI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=rpQG5hgm
Subject: [Buildroot] [PATCH v2 1/2] package/xilinx-fpgautil: new package
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
 Neal Frager <neal.frager@amd.com>, fabio.caccamo@amd.com,
 romain.naour@smile.fr, michal.simek@amd.com, arnout@mind.be
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a new package to Buildroot called xilinx-fpgautil which builds the Xilinx
fpgautil script which can be used for loading FPGA bitstreams on zynq, zynqmp
and versal products at run-time.  This is a handy application for loading
FPGA bitstreams and their corresponding device tree overlays.

An explanation of how this script can be used for each type of product can be
found on the wiki pages below.

https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18841645/Solution+Zynq+PL+Programming+With+FPGA+Manager
https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18841847/Solution+ZynqMP+PL+Programming
https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1188397412/Solution+Versal+PL+Programming

In addition, the source code for xilinx-fpgautil can be found here:
https://github.com/Xilinx/meta-xilinx/blob/master/meta-xilinx-core/recipes-bsp/fpga-manager-script/files/fpgautil.c

The Xilinx fpgautil script can be used hand in hand with the Versal Segmented
Configuration with the following example command for programming the pld.pdi
file to the Versal FPGA:

fpgautil -b /lib/firmware/xilinx/<design-name>_pld.pdi -o /lib/firmware/xilinx/<dtbo-name>.dtbo

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- renamed package to xilinx-fpgautil
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/xilinx-fpgautil/Config.in            |  8 +++++++
 package/xilinx-fpgautil/xilinx-fpgautil.hash |  3 +++
 package/xilinx-fpgautil/xilinx-fpgautil.mk   | 22 ++++++++++++++++++++
 5 files changed, 35 insertions(+)
 create mode 100644 package/xilinx-fpgautil/Config.in
 create mode 100644 package/xilinx-fpgautil/xilinx-fpgautil.hash
 create mode 100644 package/xilinx-fpgautil/xilinx-fpgautil.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1c84f95943..86375afa4a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2486,6 +2486,7 @@ F:	package/binutils-bare-metal/
 F:	package/bootgen/
 F:	package/gcc-bare-metal/
 F:	package/newlib-bare-metal/
+F:	package/xilinx-fpgautil/
 F:	toolchain/toolchain-bare-metal-buildroot/
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 291e784f26..690bb9618e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -457,6 +457,7 @@ menu "Firmware"
 	source "package/ux500-firmware/Config.in"
 	source "package/wilc-firmware/Config.in"
 	source "package/wilink-bt-firmware/Config.in"
+	source "package/xilinx-fpgautil/Config.in"
 	source "package/zd1211-firmware/Config.in"
 endmenu
 	source "package/18xx-ti-utils/Config.in"
diff --git a/package/xilinx-fpgautil/Config.in b/package/xilinx-fpgautil/Config.in
new file mode 100644
index 0000000000..29245c0c5e
--- /dev/null
+++ b/package/xilinx-fpgautil/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XILINX_FPGAUTIL
+	bool "xilinx-fpgautil"
+	depends on BR2_arm || BR2_aarch64
+	help
+	  Xilinx FPGA Manager Utility for zynq, zynqmp
+	  and versal products.
+
+	  https://github.com/Xilinx/meta-xilinx/blob/master/meta-xilinx-core/recipes-bsp/fpga-manager-script/files/fpgautil.c
diff --git a/package/xilinx-fpgautil/xilinx-fpgautil.hash b/package/xilinx-fpgautil/xilinx-fpgautil.hash
new file mode 100644
index 0000000000..1329b9ad70
--- /dev/null
+++ b/package/xilinx-fpgautil/xilinx-fpgautil.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  439a3681d8efa9641ab39c7645836b9ac78b2fdb36242f9bc94c1f3dfb2d9c4e  xilinx-fpgautil-xlnx-rel-v2024.2_update3.tar.gz
+sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  COPYING.MIT
diff --git a/package/xilinx-fpgautil/xilinx-fpgautil.mk b/package/xilinx-fpgautil/xilinx-fpgautil.mk
new file mode 100644
index 0000000000..bff7d1647e
--- /dev/null
+++ b/package/xilinx-fpgautil/xilinx-fpgautil.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# xilinx-fpgautil
+#
+################################################################################
+
+XILINX_FPGAUTIL_VERSION = xlnx-rel-v2024.2_update3
+XILINX_FPGAUTIL_SITE = $(call github,Xilinx,meta-xilinx,$(XILINX_FPGAUTIL_VERSION))
+XILINX_FPGAUTIL_LICENSE = MIT
+XILINX_FPGAUTIL_LICENSE_FILES = COPYING.MIT
+
+define XILINX_FPGAUTIL_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CC) $(TARGET_LDFLAGS) \
+		$(@D)/meta-xilinx-core/recipes-bsp/fpga-manager-script/files/fpgautil.c \
+		-o $(@D)/fpgautil
+endef
+
+define XILINX_FPGAUTIL_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/fpgautil $(TARGET_DIR)/bin/fpgautil
+endef
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
