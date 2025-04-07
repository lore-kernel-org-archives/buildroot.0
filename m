Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66623C3601E
	for <buildroot@archiver.kernel.org>; Mon,  7 Apr 2025 15:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1965404A8;
	Mon,  7 Apr 2025 15:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id imwujm1meVgB; Mon,  7 Apr 2025 15:29:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAB6040BD7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAB6040BD7;
	Mon,  7 Apr 2025 15:29:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 20F7E1F1
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 15:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A7EE60585
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 15:29:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 07HujiBjHku2 for <buildroot@buildroot.org>;
 Mon,  7 Apr 2025 15:29:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::60d;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0031F60E18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0031F60E18
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::60d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0031F60E18
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 15:29:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UeVvxmbTn1V2xonY8gEIVg2Uuew8nLSDXrFtmcu1oup9Cne6hg5XvEtaoh85D2agkS+VeBfnOXceT/h6NqWf3xNiDg/wK97ByC5/7gs2AfflCEg9eWJDCo+2hEn7UStA4Kv/FQDkpxQsNc6ykLNHtg/w5iH0sEUBvJWY4gHI5GkBwKaGpw0JuuO9zQn7eXNT+WjH1Be5166KIGJAIUJVUjw0YS8nPhyDirALzhCZFcjEHrYbmMTjLkApPnBQxf++5cowx8BvDq48WxDYx0rpzFfFVGhX4OWwS5vQaLdTL5cD0OSIE9HdLlrY079uRzF9yeK9Uq6QMYy08Ch6ayWP1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3c5IfvNiQzWIaMFF0MAHlUPgiL4JK98/VXe4eIsxQLw=;
 b=U1BZu/TvhI8Box5GCgV79v5CE/X0Bdmunf8JbR3u4vyZEhxUBmQNZ/FiKPheiKq86aojQgqS82FliobZpmSlLBBNAE/4fO92QqU+vklBCbihKmxuBARjQbT+X1IpSFmwi+Akitl7njPoM1hOk5KQo6nqynuZt3Bt4KpKUf40syPOJUexG3rfMBdYW171gGTmZvGo3Vcj7qUTAzkyI4W+Q3OYmiqpqee9TxSkqMryNtYpONLiKBX2/OeRzerRV6dY+pF2FS/LMu89b+O1FWIX5RppiZ6zpqVIgssxkZoczY1Frl6u039W+Q6EjbTlqahxHCnq5sSW9qTKfEI0Grx9wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR13CA0009.namprd13.prod.outlook.com (2603:10b6:a03:2c0::14)
 by MW3PR12MB4476.namprd12.prod.outlook.com (2603:10b6:303:2d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 15:29:17 +0000
Received: from CY4PEPF0000E9CD.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::a) by SJ0PR13CA0009.outlook.office365.com
 (2603:10b6:a03:2c0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.10 via Frontend Transport; Mon,
 7 Apr 2025 15:29:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9CD.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Mon, 7 Apr 2025 15:29:15 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 10:29:14 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Apr 2025 10:29:12 -0500
To: <buildroot@buildroot.org>
Date: Mon, 7 Apr 2025 16:29:09 +0100
Message-ID: <20250407152911.3790939-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CD:EE_|MW3PR12MB4476:EE_
X-MS-Office365-Filtering-Correlation-Id: 54d47415-14ce-4660-4a04-08dd75e8f483
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/um0+uYfJwDK3hyVS1yIYI05WxeQVCq0z+yfysPpKERFrkeXXLp37HdcP0Zp?=
 =?us-ascii?Q?9NZyPf4+anXtoNtt2qo1Lt/seCS5FR2gqVxCMj4IHgJTtHLgBxtSBdlWT4CZ?=
 =?us-ascii?Q?uQ07/5NRVpsT38VyPP+OpP/7jab/e0gRXubH+VeN4Oc55mylwEQa80ei0JPe?=
 =?us-ascii?Q?M9zHXbWqbz1ozLUbzjnpeuWDBj13uBUhH6oz8S2s3rQNw17BE/a8AoZ+RiqX?=
 =?us-ascii?Q?IUPc9SlNeDx0PQ6EbH5fUpf+Zmp6K7OsUc2DnpD8UskIoB/LKy/fWq0CezcX?=
 =?us-ascii?Q?JT2K/aErkwMWDObHHjxqR3zT10th7Cr0U1y4fkAINV+bfRilJUilzzi2Oi4c?=
 =?us-ascii?Q?20BgMDGfkFBtXinGNsQ5SEMkwqnfIu0iws6a1NlaxDFFvHvKko26oN00w9bH?=
 =?us-ascii?Q?N/Gh4MJ1zIFSp8lCVAfP0ZTUSjc5A9GP2Y+IPoN5pBDDSdgL4FsC9YTlONII?=
 =?us-ascii?Q?V/17+fthvSBkbIZrsRr/+9+m1rg9UQ0IXenoSKBPfyQQMHUvDS18cg+kCGQp?=
 =?us-ascii?Q?xnSQ1VpWpkkbN8WQ8olIwFupFz3wshHjD2Swfu7WHShDOT9l9HP1F3tiVOf3?=
 =?us-ascii?Q?sf6K0/Mwe4zkWyWbOcVn7PKTYWPqDri5fUN+8Y9HFlocSh0JwMa0mGZt2KMm?=
 =?us-ascii?Q?aXmcqVlwJmUFQFLrqwz+LydaKdpFrBKH6159ZIUGsvdMzs0J6WUh1d1aMABz?=
 =?us-ascii?Q?tzi2SV9jVd2EBz/zq/QQX4fHC8T6G1dwB2Pd5omUQexU9jUUW1SWWmUFGi7T?=
 =?us-ascii?Q?ZUZ99m4FwXqs0wLLAAx3Tq4+z4N4QaWg2VIn0u7p9Gc3uUy4qL7D/PK4BCvK?=
 =?us-ascii?Q?YpI1HV4f5aOu0fl8j3MKuNpKWb3zLY3P69SIE/PFc5+jl92SuJPvQCgLq/4Y?=
 =?us-ascii?Q?Y/9nOMCGL8SEfEWTzqqVPjRaIN2Dh15yorGhVdgHMbvMsWwAToJ2y8vbTY7C?=
 =?us-ascii?Q?gXIW+6MLiF3OUF0ab1AVumIQ28JUiVTY61Dvn3KDCUAdgPVIHH2InRoOWFB8?=
 =?us-ascii?Q?CkNko9OlCy8eoGgr5JJNABzO/CJhGYNCoW7s1HKf3t3Bt7UQjzxcLVHoktSt?=
 =?us-ascii?Q?kQV6drL5uWUbuPqZLorsjNf9dBJKt5rVuke5TxkyrohwtliIwCKUBrwdqVHq?=
 =?us-ascii?Q?bhiTcJ4GJ4kMgj3xOgl7tN1fgAK+y4F6d9FUELqQA7tYdaEWpty/d2Q08U7n?=
 =?us-ascii?Q?64IJ2PFhlZsYOo5IEKFveLJqp/KczaJsnKBMQBhFvl1dyVjg0WchDB0D+Bd3?=
 =?us-ascii?Q?1ncEUixFQ3Yo4/rb5qbH2OjM7FpdlLrZJXo0SSoA5JvhHwqTPlSsQS+KLgUj?=
 =?us-ascii?Q?h5SMFPjKPwzjC6FQ0jIdfk4kN6B/xSPT/ybQ782/T7fuK+PtGMKc22g9lnUH?=
 =?us-ascii?Q?5SsIODq+Bu77itrZe/AB+iADd5fcuEViRqdJCqAHnFFuFt+VA+L6tLxBaZIS?=
 =?us-ascii?Q?ytys4hj2k8xikF7mNbrIKMfybSC8AvpR0Sd5R0icKERyXLV3s7KlKHeo/dEo?=
 =?us-ascii?Q?1WMuaRPGOMHUyxoQ8CNipkAzlFRXfu0tqefq?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 15:29:15.0179 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d47415-14ce-4660-4a04-08dd75e8f483
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4476
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3c5IfvNiQzWIaMFF0MAHlUPgiL4JK98/VXe4eIsxQLw=;
 b=bOn+Tr1c2g89J3/A4rMom520t7gWbDIRVH0j0hypVJGU4JSzQrS0wFNZo+ei+Dr0zDcniu0V3ibAT6dqluPA+TnAcH22gnA2aSSm0WyqxJLDYF8q5aWvTnRexM/j91ktJ0qNbe8RD06N3CRL8iMLPf6z3VYhJQaqftEDua3sXfs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=bOn+Tr1c
Subject: [Buildroot] [PATCH v2 1/3] boot/xilinx-prebuilt: add segmented
 config support
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

AMD has created a new segmented configuration for Versal products.  It splits
the Vivado hardware design into two PDI files, one containing the minimal
required configuration for the DDR and booting the processors, and a second PDI
file which contains the rest of the FPGA design and can be loaded at run-time
via U-boot or Linux.

The file names generated when using the Vivado Segmented Configuration are as
follows:

<design>_boot.pdi - Minimal DDR and PS config for booting
<design>_pld.pdi - Remainder of FPGA design to be loaded at run-time

Since two PDI files will be included in the XSA file when using Segmented
Configuration, the xilinx-prebuilt package needs to be updated to support
this feature.

For Buildroot purposes, the <design>_boot.pdi is the file that needs to be
included in the boot.bin for booting the processors, so this patch checks
for a file named *boot*.pdi which will indicate that Segmented Configuration
is being used and will make sure to use the <design>_boot.pdi file and not
the <design>_pld.pdi file when generating the boot.bin image.

If no pdi files contain the word "boot" in the filename, it can be assumed
that Segmented Configuration is not being used, so the single file *.pdi
method is the appropriate one for this case, and this patch is thus
backwards compatible with prior designs not using Segmented Configuration.

Also, Segmented Configuration is going to become the default mode for Versal
products, so the xilinx-prebuilt github location will also soon have two PDI
files for each board.  For this reason, this patch is also handling Segmented
Configuration for files downloaded from the xilinx-prebuilt repo.

For further information about the AMD Segmented Configuration, please see the
github tutorial below.

https://github.com/Xilinx/Vivado-Design-Tutorials/tree/2024.2/Versal/Boot_and_Config/Segmented_Configuration

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- $(@D) is not available in time for wildcard evaluation outside of shell
  script, so moved the wildcard functions into the install scripts
---
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 36 ++++++++++++++++++-------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index d0817d3cc7..448c71a3fb 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -28,9 +28,6 @@ XILINX_PREBUILT_BOARD = $(call qstrip,$(BR2_TARGET_XILINX_PREBUILT_BOARD))
 XILINX_PREBUILT_BOARD_DIR = $(@D)/$(XILINX_PREBUILT_BOARD)-$(XILINX_PREBUILT_FAMILY)
 
 ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL),y)
-# We need the *.pdi glob, because the file has different names for the
-# different boards, but there is only one, and it has to be named
-# vpl_gen_fixed.pdi when installed.
 ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA),y)
 XILINX_PREBUILT_PLM = $(@D)/pdi_files/gen_files/plm.elf
 # Unlike the psmfw.elf file for Xilinx development boards,
@@ -39,11 +36,33 @@ XILINX_PREBUILT_PLM = $(@D)/pdi_files/gen_files/plm.elf
 # so to support current and future AMD Vivado versions, the filename
 # psm*fw.elf is used.
 XILINX_PREBUILT_PSMFW = $(@D)/pdi_files/static_files/psm*fw.elf
-XILINX_PREBUILT_PDI = $(@D)/*.pdi
+# We need the *.pdi glob, because the file has different names for the
+# different boards, and it has to be named vpl_gen_fixed.pdi when installed.
+# If Segmented Configuration is used, there will be two pdi files and we need
+# the file that has "boot" in the filename.
+define XILINX_PREBUILT_INSTALL_VERSAL_XSA_BOOT_PDI
+	$(if $(wildcard $(@D)/*boot*.pdi),
+		$(INSTALL) -D -m 0755 $(@D)/*boot*.pdi \
+			$(BINARIES_DIR)/vpl_gen_fixed.pdi,
+		$(INSTALL) -D -m 0755 $(@D)/*.pdi \
+			$(BINARIES_DIR)/vpl_gen_fixed.pdi
+	)
+endef
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 XILINX_PREBUILT_PLM = $(XILINX_PREBUILT_BOARD_DIR)/plm.elf
 XILINX_PREBUILT_PSMFW = $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf
-XILINX_PREBUILT_PDI = $(XILINX_PREBUILT_BOARD_DIR)/*.pdi
+# We need the *.pdi glob, because the file has different names for the
+# different boards, and it has to be named vpl_gen_fixed.pdi when installed.
+# If Segmented Configuration is used, there will be two pdi files and we need
+# the file that has "boot" in the filename.
+define XILINX_PREBUILT_INSTALL_VERSAL_BOOT_PDI
+	$(if $(wildcard $(XILINX_PREBUILT_BOARD_DIR)/*boot*.pdi),
+		$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/*boot*.pdi \
+			$(BINARIES_DIR)/vpl_gen_fixed.pdi,
+		$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/*.pdi \
+			$(BINARIES_DIR)/vpl_gen_fixed.pdi
+	)
+endef
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 
 ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM),y)
@@ -60,10 +79,6 @@ define XILINX_PREBUILT_INSTALL_VERSAL_PSMFW
 endef
 endif # !BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
 
-define XILINX_PREBUILT_INSTALL_VERSAL_PDI
-	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_PDI) \
-		$(BINARIES_DIR)/vpl_gen_fixed.pdi
-endef
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL
 ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW),y)
 define XILINX_PREBUILT_INSTALL_ZYNQMP_PMUFW
@@ -76,7 +91,8 @@ endif # BR2_TARGET_XILINX_PREBUILT_VERSAL
 define XILINX_PREBUILT_INSTALL_IMAGES_CMDS
 	$(XILINX_PREBUILT_INSTALL_VERSAL_PLM)
 	$(XILINX_PREBUILT_INSTALL_VERSAL_PSMFW)
-	$(XILINX_PREBUILT_INSTALL_VERSAL_PDI)
+	$(XILINX_PREBUILT_INSTALL_VERSAL_BOOT_PDI)
+	$(XILINX_PREBUILT_INSTALL_VERSAL_XSA_BOOT_PDI)
 	$(XILINX_PREBUILT_INSTALL_ZYNQMP_PMUFW)
 endef
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
