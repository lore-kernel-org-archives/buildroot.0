Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D84C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 08:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B96F2405D5;
	Mon, 19 May 2025 08:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hTiHtssYpzod; Mon, 19 May 2025 08:36:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99E40403E1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99E40403E1;
	Mon, 19 May 2025 08:36:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0803D193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 08:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDCB74054B
 for <buildroot@buildroot.org>; Mon, 19 May 2025 08:36:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EmY21oidAy5C for <buildroot@buildroot.org>;
 Mon, 19 May 2025 08:36:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2407::614;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AFB9B416F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFB9B416F1
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::614])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AFB9B416F1
 for <buildroot@buildroot.org>; Mon, 19 May 2025 08:36:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XF1aVJlNYezCFiD58yZWBG8XBdtsv4Hp4jbK8AXk3cdgw+6pfcNewFjkqG+I0Bh4S7XhFUbbbizakvsGn9L6pUqo2V/KqopyeCQo2KO1+3djgy5KB1LKOlYj2AeFYKwGt6Jc5qMeoEnAMmE56utcpH8Nnp+koGnaqevQ7I1F+NKA7zpf2QxySISO3u14ZFw4/hOozMJ5ixS0l/F1CkdPPSSWOHQbwO8maH5UTyl5CemBT3pdoQdAsHOPTWygkXbTNo0hBLV475YE9OXfIxWt33tYTXrtRFHwWknlCDtrbPLEOkJHgGIdWRv/G/icR8go/f/E0z+m69HBaOsWCFfr5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klgg504/kWz7Y0VpyM6BTmTCJve1Uu1WXrB8e4XdfF0=;
 b=zHCHPjOgItLsxEeZPPiBAhGmNCNQGKGbY0PzHLlHlccoA8WY0dmHWl/Zsyb/fiUBBIOpRT5cMXN0y6fQpDgQAQTdQ/LsLb9fHdsdYOkYwhQe5EwD7qD8thL8xvC4EZFYn8JEYAarYnDNnKzxVGMaMvnxFu2jseNKcCYjxUr7vqYWR5ROFb6P0M2coyBAukoj3TFsYR3LfQuygXz+7pT1vWzN8u4sfCfTQuj4PL4irVkq2CleYKSdJwHE4uwl7rliXWuHsH81SXgDmQmR3oPvZD+CDDgyePfdArR4UCwkOYJSiqA/p0mevXpPIH3cAXPtvY1Ffe2arJzGeaF0cta/lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH0P223CA0011.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::26)
 by SJ2PR12MB7823.namprd12.prod.outlook.com (2603:10b6:a03:4c9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 08:36:41 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:116:cafe::a) by CH0P223CA0011.outlook.office365.com
 (2603:10b6:610:116::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Mon,
 19 May 2025 08:36:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 19 May 2025 08:36:40 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 May
 2025 03:36:40 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 May
 2025 03:36:40 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 May 2025 03:36:38 -0500
To: <buildroot@buildroot.org>
Date: Mon, 19 May 2025 09:36:30 +0100
Message-ID: <20250519083632.1930804-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250519083632.1930804-1-neal.frager@amd.com>
References: <20250519083632.1930804-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|SJ2PR12MB7823:EE_
X-MS-Office365-Filtering-Correlation-Id: f2f7b066-1c3b-4ba7-6c8e-08dd96b04716
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PfQvCx8un6c9G3Jl4XiuHnq5KTsmT8GtIjH3VoFCJNwN4rjP4vAh7ULbcVZB?=
 =?us-ascii?Q?ObR+ivV7mgMoOXMxUtl3mdbe+htT9XGISl4l5cT5smpVDXkRkrVHvUu5fWc5?=
 =?us-ascii?Q?I29sC/IOdck8LL1VHxWSQX6tVizH6yGkXzr6RPB8/Xz9pbpVCV+aZ+EoQ4eS?=
 =?us-ascii?Q?O+zVQGf7TmRBaCEVGN47hhTNgCNjV7c89ahkWc/I45nx/gbTw/ytu/DvYAzb?=
 =?us-ascii?Q?Ds8K00PZxUbKCtUfDfgRnqwdVAELkn5DDobs1I5VBondu1m1TQYjM4V8XyMD?=
 =?us-ascii?Q?vAOwQCpVDrUFYTLIKMJOA7H5i4q3BUnZRsFgBxUL1udtNPaPu7RCWYgTLoCp?=
 =?us-ascii?Q?G1ouQdcEDEd0rbICxd4sagwpbzrfH+YvjsvQQqJPvsIkQ/5lXcCNhmI9NUPt?=
 =?us-ascii?Q?gBc2WF2V2yOcAuPoWdGk+L2aQ3zblh6Kd0mPeEdybO5wVjwi/7AdFY26jH1c?=
 =?us-ascii?Q?9aUMPlHH361NhTP+hIH0RjP1FIozhHxoJvKduhOHcNEN3SVeUZ0QgrxBtDeg?=
 =?us-ascii?Q?1piWs9V7W/VVInXhjn6eaMXVEZCm6+dULqBSc9zfChBJOSvX/hqChclUAGNp?=
 =?us-ascii?Q?Y4SaSXav0jo0X37j4VgK0xLvtbMlvG9vZNm7yTlrD4OB10/5JT36HLXLnRrE?=
 =?us-ascii?Q?hniG7duUr84MVyBEKqBMfUgpUVOBWn8ugzYpxHx4UGgi5BpFS5X9jkCwdzKT?=
 =?us-ascii?Q?aWYVxXCp8aSSE0Ng+6h/hSl3IKU13bvVduf82Osphsbt2ucxz6xxAWivJm5m?=
 =?us-ascii?Q?OYR8fMJFY5sNg7nUFbGLI8H9gW4dnwt/xusMWY9VJdXV9GMGlLMVAawYthLb?=
 =?us-ascii?Q?FWWqYGs+JhXs1kv5ScZ0k8UPTs7aaaEOvNval/my1tGGuLaF2oKflzTIQJZv?=
 =?us-ascii?Q?cnVdgLvIqFmOyjhUN4Mb837hGBthePwFgFxFiOBvSH5K29qcSx1E1S856LaX?=
 =?us-ascii?Q?d7B2oipOYGwTpPQ5CcP0dxADBgYbMTK4jxifE7AygTuo8kkpcgTgrg7ObEX5?=
 =?us-ascii?Q?rWOOJ5mNs3mJRN8il+G4NIfsQ/WnzLl2BBEMfHkZvhpMAuYGTFLo+9jS4ah1?=
 =?us-ascii?Q?M5yNSU7tt8uUdkjwvaGDO4UZKBCfrWXBduRimaDPJ5sOYRnl7fMkKsvqaX88?=
 =?us-ascii?Q?R0u1Y09KDCgfNbs/IqqgPATIP4NA/5Uti2w3/Jd6vevsOs+pwdZHERPM0Y/F?=
 =?us-ascii?Q?lmWjuIs9KqAvFJxQdlVKuGYYrCqBTlxATBCldesOmUPTiQ7SDuw/5o08NmAY?=
 =?us-ascii?Q?/OpB5XVp6waimJOo+6wSqVCJ3pivOHyF64yNidobB33U2kdc88ouj89AkpPX?=
 =?us-ascii?Q?/oI6QWkdORQFFHWhDGXFYA+GnwGpKUvepmAW7AG64DaQ/d5QtGNavNgAN9r3?=
 =?us-ascii?Q?ktbi/XSvYqFks1uhDjZKhGqnt5DAG0MJV7/H64grVYxxJkiybr2qIZ4KHO6Q?=
 =?us-ascii?Q?wTy9e3DB8oxqGMtQs57HpvNGA544dbubx82COcqRnBo7cFadGJnhevvOJL4l?=
 =?us-ascii?Q?D7UppOgFcTc9IHKlzJKY3VF4CibnRv4+Q630SppGRKsVBlrRyDuhs8LjKJau?=
 =?us-ascii?Q?CVTiUtVcWUeZgkzSSEs=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 08:36:40.7005 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2f7b066-1c3b-4ba7-6c8e-08dd96b04716
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7823
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=klgg504/kWz7Y0VpyM6BTmTCJve1Uu1WXrB8e4XdfF0=;
 b=G2po8tkO6iU2x65xhmGBy4iAiSE38JHae9+riR2unUUD/2gBRWmxEYmvMvHKlOLQa3GGT26gOfn0Qkr6kNOaSMVwIoXOa4HO27kY9YfmqvicxYUUQ215d6kMDGEC2jHknzon3fmjq2P1JgbGgLNpCP7v6hhXofKO4OolkcNlg4E=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=G2po8tkO
Subject: [Buildroot] [PATCH v4 3/4] board/versal: change pdi filename to
 boot.pdi
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

With the Segmented Configuration, the Versal PDI files will have new names:
<design>_boot.pdi - Minimal DDR and PS config for booting
<design>_pld.pdi - Remainder of FPGA design to be loaded at run-time

Since this will be the new default, this patch aligns the Buildroot file
naming by replacing the obscure vpl_gen_fixed.pdi filename with a simpler
boot.pdi filename.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
V1->V2:
- Rebased due to changes in first patch of series
V2->V3:
- Rebased due to changes in first patch of series
V3->V4:
- No changes
---
 board/versal/post-image.sh              | 2 +-
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/versal/post-image.sh b/board/versal/post-image.sh
index 22367d5028..b5ce2e3f0c 100755
--- a/board/versal/post-image.sh
+++ b/board/versal/post-image.sh
@@ -17,7 +17,7 @@ cat <<-__HEADER_EOF > "${BINARIES_DIR}/bootgen.bif"
 	the_ROM_image:
 	{
 	  image {
-	    { type=bootimage, file=${BINARIES_DIR}/vpl_gen_fixed.pdi }
+	    { type=bootimage, file=${BINARIES_DIR}/boot.pdi }
 	    { type=bootloader, file=${BINARIES_DIR}/plm.elf }
 	    { core=psm, file=${BINARIES_DIR}/psmfw.elf }
 	  }
diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index 4d1dfc5ca0..05dc9aebe8 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -37,7 +37,7 @@ XILINX_PREBUILT_PLM = $(@D)/pdi_files/gen_files/plm.elf
 # psm*fw.elf is used.
 XILINX_PREBUILT_PSMFW = $(@D)/pdi_files/static_files/psm*fw.elf
 # We need the *.pdi glob, because the file has different names for the
-# different boards, and it has to be named vpl_gen_fixed.pdi when installed.
+# different boards, and it has to be named boot.pdi when installed.
 # If Segmented Configuration is used, there will be two pdi files and we need
 # the file that has "_boot.pdi" in the filename.
 define XILINX_PREBUILT_INSTALL_VERSAL_XSA_BOOT_PDI
@@ -46,13 +46,13 @@ define XILINX_PREBUILT_INSTALL_VERSAL_XSA_BOOT_PDI
 			$(@D)/*_boot.pdi, \
 			$(@D)/*.pdi \
 		) \
-		$(BINARIES_DIR)/vpl_gen_fixed.pdi
+		$(BINARIES_DIR)/boot.pdi
 endef
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 XILINX_PREBUILT_PLM = $(XILINX_PREBUILT_BOARD_DIR)/plm.elf
 XILINX_PREBUILT_PSMFW = $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf
 # We need the *.pdi glob, because the file has different names for the
-# different boards, and it has to be named vpl_gen_fixed.pdi when installed.
+# different boards, and it has to be named boot.pdi when installed.
 # If Segmented Configuration is used, there will be two pdi files and we need
 # the file that has "_boot.pdi" in the filename.
 define XILINX_PREBUILT_INSTALL_VERSAL_BOOT_PDI
@@ -61,7 +61,7 @@ define XILINX_PREBUILT_INSTALL_VERSAL_BOOT_PDI
 			$(XILINX_PREBUILT_BOARD_DIR)/*_boot.pdi, \
 			$(XILINX_PREBUILT_BOARD_DIR)/*.pdi \
 		) \
-		$(BINARIES_DIR)/vpl_gen_fixed.pdi
+		$(BINARIES_DIR)/boot.pdi
 endef
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
