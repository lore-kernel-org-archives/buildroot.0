Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65205C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 07:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E28D6107C;
	Fri,  2 May 2025 07:31:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kl_VIEGZYWTq; Fri,  2 May 2025 07:31:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B80460ACA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B80460ACA;
	Fri,  2 May 2025 07:31:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BD80229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 07:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B56A83984
 for <buildroot@buildroot.org>; Fri,  2 May 2025 07:31:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ndy6y84Tmis for <buildroot@buildroot.org>;
 Fri,  2 May 2025 07:31:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::617;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ED654838FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED654838FE
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::617])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED654838FE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 07:31:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2eevAFMlNVyaA8yrfWvWy+I9UTxSpwkdpFxelbGiekuaxbRteeO1Y8UcfbMBs4gdh54uZcIS+0QLOzro2fxh9QvorLkZ1e4MZHPqizWXNwJdvWrm0WQITAfFYshYuBhSp5mefJYpASlsMTXSFg6eoBt3v/ChLR1yLZDqcz0WHInpkenGclg+bupksGs5C0Qc30jVgrYqQxZe/uKSYtukjCt8d1TxD/AqnmnfTRbDq10mwC6p0JHwQpDT0glAbxy7lJrd2UAoWHAtxCQ5yvinYDp8xl3GhXCuJhg8TVu99x4uTHEDv7CrW7GW34NAeE9UPSyX9+r0xzbPG5HrAydHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2VQ5pcQtD3xjR52yQFnYS8HGhW5X0bno0dGK9mC5Fj8=;
 b=L1VtA/W7s/KYRgHEa2C9QfKUt8EADgdA0HSjKd8qHyCh6bq8Lv2ndlVuWsMBvn17wHSv7CiLQulRhTcFHGJVaQjVVY9zNMOAt/LyFEInxOoG/103RXeWwkkHrY4AkJ3gnklsd1YaoiTA2dbL/Bp8g+vkwRtHM+d2MRxfRuVO1ojIleJo9J7m83Kkj9wmUO2SKsmfjv26RS1E4MxJFXjt57iS9kMNzKVaMAcNqrCVyuCKS5CdYHETYN3iVH64eAlqmRK8IlQI0Pc0V9ZsoKCIe26n5DLHsti2cOi8WRaNNSPk7HmYVnDg6KN6GiM+JtCPaioXdb5c2U7xl9QTuj055A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from PH8PR05CA0021.namprd05.prod.outlook.com (2603:10b6:510:2cc::9)
 by BY5PR12MB4209.namprd12.prod.outlook.com (2603:10b6:a03:20d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Fri, 2 May
 2025 07:31:24 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:510:2cc:cafe::e0) by PH8PR05CA0021.outlook.office365.com
 (2603:10b6:510:2cc::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.12 via Frontend Transport; Fri,
 2 May 2025 07:31:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Fri, 2 May 2025 07:31:23 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 May
 2025 02:31:22 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 May
 2025 02:31:22 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 2 May 2025 02:31:20 -0500
To: <buildroot@buildroot.org>
Date: Fri, 2 May 2025 08:31:11 +0100
Message-ID: <20250502073112.376985-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|BY5PR12MB4209:EE_
X-MS-Office365-Filtering-Correlation-Id: c277f637-071b-4088-2b70-08dd894b5755
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9NJ201c3pk6G+swQQ8+l/2fVtMaf+LI3VS7b3QtoJbIqqwH6saV61hOtlp9V?=
 =?us-ascii?Q?WCz9pR54S648RSvPNQhcgBo2Gv95GBUXtAd6j9smvkZAPCzypOe2izq3eZnD?=
 =?us-ascii?Q?dnH5FB48fAL2miSkSFySgQshR/1BXmyPrQxSm+pI2+NMp2OL56ScE8sO57rZ?=
 =?us-ascii?Q?v8JlY+efdkWH0oIDM/Hu/zBRcP3++TscwE+kFHcdLubvBHLrYNMe0O7wUQhE?=
 =?us-ascii?Q?dDgBXuVY24V4Qt018MAuN9wC7ohvA6TJxrxK1WQQjK/L4VJ4uyRinMX5PnGK?=
 =?us-ascii?Q?9oQSJ/BM7ASDDA+8Sd89f8S4ZCYSTl70gpA05g8tHRO+0BwJGauxXcmJ0SXP?=
 =?us-ascii?Q?lsjuu3bYcHxMCbn3bx/NSgI2WfYQ12mTp4XC7Ml7EbHa0fAbXqM6g/kqZfOm?=
 =?us-ascii?Q?uAlbF7V4Bt7/i8CRY4Yh8gOtB3flA5SoRBzqi7jGVIfz4A999Rl1uFdIhANu?=
 =?us-ascii?Q?v6Z0a9FsNav07HtUzWhdfrj2MlXfa0dTqK/cMRh/6bZ5xA/wY6Efk3mP+Lj7?=
 =?us-ascii?Q?km0mg7QnLMjaXkF1FcmHI2fR4aJyAD3MO1Kjn6TtaoAKTQPlj5HuxU2lM1P+?=
 =?us-ascii?Q?fAehiqm2YWQwZgANUjTetgGy7M3YyflUrnpQl8KkcmaXPcwMjc8zugaOdP43?=
 =?us-ascii?Q?l3fjybyOOCzNGxBDYIcUKaIM79CRioIhQI0lunZdA92kghcg1tt4evUZwaiY?=
 =?us-ascii?Q?KxNQTzuBye2roCPnPDcml9Fr+VkV2xmZD1FBggVRA5g0vzpoQuZebSmjgv6I?=
 =?us-ascii?Q?Rex0oEqUpCpI2IcIC4Q5CHb1BL5Muq4sPtS6b6M328Jic+cFiRAKsQH2QSVD?=
 =?us-ascii?Q?ueByiFII5XFXFcSEmRyaX2PEf7esxOWIjNH6FyXwuPCNj4Q7hXgYRGP3D1YW?=
 =?us-ascii?Q?TwaopXCXj0Rrov3nj5Yy9A3LZgptsfYDOp3i2vd5DMhvJ15qMWu6TUaDso25?=
 =?us-ascii?Q?r23mE9KDUMqjFyQJSf95R/Z5Ag8tH4Z03xOXMsjBZ/Eco0dwtzX7HtUN4OtE?=
 =?us-ascii?Q?oVdU0M3KN/9N2RYqGkvNaQIhjEaJwrSrmZuNODtXhEkDH6P3pt4KPVVJkXVF?=
 =?us-ascii?Q?IbDFOk3h7ptOBpyImzzbS/I41f6VU++thfoKo9GIjO1JhvBlo4nzL6PRiAY6?=
 =?us-ascii?Q?O9vBSDEH0QkjZTbAyoow+Ba003MKehYDErB5PhQ8cbbuJHRzYfCjgsgE9Xqz?=
 =?us-ascii?Q?QE6gEwozTPpdF+6zEmagKAx674pz6+AtDRSD6sMk/u4yMw/Gr2JYNFE3Vmm2?=
 =?us-ascii?Q?y/ZuMCD7d8Ge8SndFIWHWIlfmzCLUjFpTIQy82R24UAHtSROEjBO4QrdMPwi?=
 =?us-ascii?Q?RVOsd/NpfHaYw/D1qw2iQx/Zis6bRlZ4reUm0+Pxwl3tPhW5bY59Mlog5b+q?=
 =?us-ascii?Q?QxrkhI4+K8ND3APF1umf3dHxKSe6HxVmaWwb2kg6/aa9IdwgX6+OqsuZ9t1b?=
 =?us-ascii?Q?+Tl67gKs/wDVb6xahSvzE6tjigsZobjDcLO6374Epuk7fULLHqQRKspP1qQj?=
 =?us-ascii?Q?N2JVWvSN8KFULRGGM9PGLKEnGfYFeYfxxrBB?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 07:31:23.5672 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c277f637-071b-4088-2b70-08dd894b5755
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4209
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2VQ5pcQtD3xjR52yQFnYS8HGhW5X0bno0dGK9mC5Fj8=;
 b=p/KCss6jYeHjJ3vb2OG69ywMNChaJ6Z9ezUwYQRegZg6dATRZhOJ7V0L+TLW4ZSWmROS9z6hugbarw6RS/Zw9ejhMp90oQt2OpfPOB0UNqxsyNAaBqxsWHT0NSGAqA3ug1ZNL2QxmOvcDEEkSYaHeMuED+JxrCIrqlQJe+dpPtk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=p/KCss6j
Subject: [Buildroot] [PATCH v3 1/2] package/xilinx-fpgautil: new package
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
[build-tested only]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
V1->V2:
- renamed package to xilinx-fpgautil
V2->V3:
- changed install directory to /usr/bin
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
index 0000000000..6f42b4799f
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
+	$(INSTALL) -m 0755 -D $(@D)/fpgautil $(TARGET_DIR)/usr/bin/fpgautil
+endef
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
