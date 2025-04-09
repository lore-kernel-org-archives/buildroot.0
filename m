Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9371DC36002
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 11:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DBB3410EA;
	Wed,  9 Apr 2025 11:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mF8ZAwrm48qS; Wed,  9 Apr 2025 11:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B1D840DE9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B1D840DE9;
	Wed,  9 Apr 2025 11:05:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 02F4AD6
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 11:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3F9640A9C
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 11:05:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bFY3a_oti6YX for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 11:05:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::614;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0727840B8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0727840B8C
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::614])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0727840B8C
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 11:05:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CRaSsTXZDRwSFRZZhi/kVnk3/CWU3ydZ8CVFGO8ISyrPnkwG9yLXKfiSSE/npyfMG5rKAORpSZjc3fyAu6sx2T6Vo0QkpMUG8umZY3/iIHwjtZE+hrsCAiQ8kxEBlEaj80VsZSBEm3IU+TWkr/Vk3LtC2u65jGGRd64AFVj8JDSmFoAc6pKDwaMXTufaTjmQdhQKYCOMosaI1fua5MgjgwB6zKAj7snuWonIl1Un/Rl8czCuW0Z1WBYtA3S7i0QE9QYEvi987yxKJcPBG0o9WMirPqBGkCynZzRg1I94stPJGgq5J9sd7nvPQUE7kl1L+PCx/iY2msBDDJvMZK9okw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CshcqgiNgDFEIjAiIMk2MZbJuB+tmZRj8HdIjAA0udA=;
 b=ITH6LtHACerhrLNfJW/ZkGI4yS06piIC2H5KvGML3c9Csuie7nSheV4UPeWX13Ab6l4kq9QtpKMinH4og0/YT6N31MbywQzsV91ex8ndAFm4bJoarEkEEI8CE6u67JD8UB20kkiY2S6mRyxHyvie6RrAQ2jQNxyCuPbjbQbn46fkIDg4ZztRvN5v2qNCa6V49pv/6cTJoOaBLDRwtnkyJLrCNlPnnqcOoUOjlD4vS8E+Y7GgAHVBAD2LLZvD13one/PisEz9B9wYv5kKOXxiGQPGixmnKb6LfUAMZwWq3xXigoRo84uwBQHdMJeVIBS5+dQ3fZ2ZKq/TQexCV0g/MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BL1PR13CA0298.namprd13.prod.outlook.com (2603:10b6:208:2bc::33)
 by DS0PR12MB6416.namprd12.prod.outlook.com (2603:10b6:8:cb::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.21; Wed, 9 Apr 2025 11:05:01 +0000
Received: from BL6PEPF0001AB71.namprd02.prod.outlook.com
 (2603:10b6:208:2bc:cafe::aa) by BL1PR13CA0298.outlook.office365.com
 (2603:10b6:208:2bc::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.11 via Frontend Transport; Wed,
 9 Apr 2025 11:05:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB71.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 9 Apr 2025 11:05:00 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 06:05:00 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 06:04:59 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 9 Apr 2025 06:04:58 -0500
To: <buildroot@buildroot.org>
Date: Wed, 9 Apr 2025 12:04:53 +0100
Message-ID: <20250409110455.3850790-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB71:EE_|DS0PR12MB6416:EE_
X-MS-Office365-Filtering-Correlation-Id: 80aadbaf-3f7b-447e-459f-08dd77565f7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xHfH7u8q1PcqHK1pYbmVfWzfyOO/bLoRP2HeUO0/iSVogn5I82/hovW8TsNY?=
 =?us-ascii?Q?azwyS5SP9/0tzby/jk/zkHZZuAK5uGnU9n7cHJTp7WRcZ3MKvKbAx4O/hz9Z?=
 =?us-ascii?Q?bv3+UObOtTm5ObMsBjabZg6n+mUdDSKnq1tMLo+BRIQAKlHVS8pxAad3D4L9?=
 =?us-ascii?Q?nCEWc/AzC9iCBE7NjG13/gFepdb5VRQRTX8oAviiG2ZxDNaKC8FSXm+d3IKv?=
 =?us-ascii?Q?XNbhPn8JkbqZ4bn/S5OKvjEVLGB/h3SJHVhJVw9VTBufP4nuD5LBr+f2uQ9/?=
 =?us-ascii?Q?U2hHvFYXSWUAqayjVcM+qCKsUifJyaaA3gwozcrPKLlouHjySf/vx36KVOLY?=
 =?us-ascii?Q?jkVCi/4l9FYjiaw6xRTg1ZzuZpCKUeRo127+ypIohCcMbv3hZAw5Xbl7/9gE?=
 =?us-ascii?Q?lLISpfZp8N0eJpgFDuBlBwrat1uWeh1c9kf2qsYB9AmY8gLqIk0TDwID5yEw?=
 =?us-ascii?Q?PzekdnitDlfv5nY8RaYqzqV2NwRFw5NnEAfDUE7YVAQs98YUEYzl9MMRKpqP?=
 =?us-ascii?Q?t2msSVOD4D3o3JHfLiXsWoI/KA12689LryAfaR4KOHgtJpuas/TFFrzd6f8E?=
 =?us-ascii?Q?1xF6ZeUqKydg+jDlQ818pGFcTh0/DWjRGOwbkNAOw233gv56dx2QMo4GsWT5?=
 =?us-ascii?Q?Ia92deZi7aei6721n2E+4suIXGPaKnPaGiNuuu2F3LX/2XVNCZcmI8GGQK6N?=
 =?us-ascii?Q?nair0EtI0eDqZKIBJJKx8h0/NzpTwAb4TjEqbJCMsShaZB7ESniVZfuq/GRR?=
 =?us-ascii?Q?iQX5DbCZfro6JDALrVps+NPkh26EDzOyapO/SA1gEDKDdQVTfXkpLpMDpw7Q?=
 =?us-ascii?Q?i23cZ1KDbqfGsLSPaB3Pn/TX2yjmCTCq5WAAT6q7OavalS/Q+3pIftudXJvD?=
 =?us-ascii?Q?sJXKF5JD9bXziLctq3uSXa0Sw3eGyaSE3xxsbDsUMZEBtJKigdFa40pkT7qq?=
 =?us-ascii?Q?EJHOk0xHHPd1ltw7ybpO0NiUVtSpbVsPIae58Q0sisU9Y0zgNNyu1/SgHT/k?=
 =?us-ascii?Q?4m9IAbaVN0fAR7QrA/v9FiEd6AY5hxeZlYueZA0bsnZL/M+uzZdlnLVOkcD7?=
 =?us-ascii?Q?XCMEdIOUGrI2ilQGjyw82cGSFO1bCnqIA6SI8EaKs2Kd1qGXmzGLUbpcTVga?=
 =?us-ascii?Q?loXD0ORRf5U082afcjmGjrm+9ySuhjKpayA7znBLM9iGoGb0p0kSQ64TVoQk?=
 =?us-ascii?Q?E6+h9kXHI4L+hQ0RqZCyMBEJ0gbOYuANvWG58Fqg+2/Z0HQNw1k2EPe7lF/P?=
 =?us-ascii?Q?e+GU9xw9THRp5rol5Udmt3m2Div1xofaQ92xx1uPzX3DoQWXGphm+Q00K6hi?=
 =?us-ascii?Q?0eMy4rrFyxdP3mWAFgQrfi1PApcJyjbYGUQqSLpbGfem4R4NooZXEgNG9k6L?=
 =?us-ascii?Q?3CsZpvv8iriMzpHsNGEhFzLbw3r+FTSndfuJvekt7wAvlGX3uDi+dUsH8Xmw?=
 =?us-ascii?Q?NicHFmf6sxKtR4nbhRtqjjdxNcasRk1CJ604cLt7JrWgKH1IQWYVQ2hOUPkt?=
 =?us-ascii?Q?SDxv4KBAIouRbZfcTrtjFJV9iQkBi241M32iid9PsRLHHPthA8eT8kLzrhbY?=
 =?us-ascii?Q?JcaMycUaxl0olpRJN4w=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 11:05:00.8973 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80aadbaf-3f7b-447e-459f-08dd77565f7b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB71.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6416
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CshcqgiNgDFEIjAiIMk2MZbJuB+tmZRj8HdIjAA0udA=;
 b=jrBl7cb7x63/AIS985wPt63sn4sItPZiT84ie7hnNju5ymVFpA/QJjTMFGKJEwpa8SMlKHFzRSUUZlzh/UWdINBVZnCaK0+LQVuzjsoOhHRALgTrcuo5Rqn56agahEVCTbqEFCZybY+UBX0irdNyALtMRB6cPDl0jFS/odFxF4E=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=jrBl7cb7
Subject: [Buildroot] [PATCH v3 1/3] boot/xilinx-prebuilt: add segmented
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
V2->V3:
- Moved if statement inside of $(INSTALL) commands to make the code easier
  to read.
- Changed wildcards to more specific name "*_boot.pdi".
- Changed pdi file permissions to 0644.
---
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 36 ++++++++++++++++++-------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index d0817d3cc7..4d1dfc5ca0 100644
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
+# the file that has "_boot.pdi" in the filename.
+define XILINX_PREBUILT_INSTALL_VERSAL_XSA_BOOT_PDI
+	$(INSTALL) -D -m 0644 \
+		$(if $(wildcard $(@D)/*_boot.pdi), \
+			$(@D)/*_boot.pdi, \
+			$(@D)/*.pdi \
+		) \
+		$(BINARIES_DIR)/vpl_gen_fixed.pdi
+endef
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 XILINX_PREBUILT_PLM = $(XILINX_PREBUILT_BOARD_DIR)/plm.elf
 XILINX_PREBUILT_PSMFW = $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf
-XILINX_PREBUILT_PDI = $(XILINX_PREBUILT_BOARD_DIR)/*.pdi
+# We need the *.pdi glob, because the file has different names for the
+# different boards, and it has to be named vpl_gen_fixed.pdi when installed.
+# If Segmented Configuration is used, there will be two pdi files and we need
+# the file that has "_boot.pdi" in the filename.
+define XILINX_PREBUILT_INSTALL_VERSAL_BOOT_PDI
+	$(INSTALL) -D -m 0644 \
+		$(if $(wildcard $(XILINX_PREBUILT_BOARD_DIR)/*_boot.pdi), \
+			$(XILINX_PREBUILT_BOARD_DIR)/*_boot.pdi, \
+			$(XILINX_PREBUILT_BOARD_DIR)/*.pdi \
+		) \
+		$(BINARIES_DIR)/vpl_gen_fixed.pdi
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
