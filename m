Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255B9C3600C
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 09:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93C3B81975;
	Thu,  3 Apr 2025 09:06:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J5S97chuIDfi; Thu,  3 Apr 2025 09:06:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5C2981755
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5C2981755;
	Thu,  3 Apr 2025 09:06:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A9670119
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 09:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88FDF40DA3
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 09:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cjh3OoZ7fz_u for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 09:06:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::630;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C44CE40C7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C44CE40C7C
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C44CE40C7C
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 09:06:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U4jgh2G9Mjc2YILHJeXzRLrPWsX+xGBg995+T+8YXrqLFRig84A5/8/J2PYvYG40dmaCJqINni74V2OCjawWh6EhxlmrLBnTs/PnxLm5PksltHBRXlX84TOFxRSEqf8VMzTItMXHMBqHjfAp0n6V5nw7RqTwiVi+wamQ/smXDnjOJbPrLXbU6o8T9CsFanBYdsMnAsojqeHS7Spc1nxiNjYpSG/zpHK9xWtKWL6L/sjb7Jg6A5pCvhSAZHCmAQLRr8/NcMho4HNXwX2GzrvGTaEWQcImfkp0pquRFgURd9TfS3f7DgP2fJs+M4AtvapXt31QnUz+9nCvku1HSL8+OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzluHQ6slb/vW3ziRONI5h8N09aiXn5E6oLTJZ5g2vo=;
 b=dfRjIMLS+T5PWhpgYdaKFo1/Bt0n4GyYZDHjTAPG7QfP5ycUVqGGS63ZjXPTSi9MdC7/82t+qzbFpdGcFUNgUKH5Lwt41r13XI+YSMmItpi126i3ORGmCv2O96uQ0dl+KoFlwUIoWLg2PbmLpz7wxeObUevXm7u3la7VEZh6p2tn6OiuV7k7PlQEHZqSc2i+nzrGs7A+ZtUEqKIv9Jz0tHHddHyAAUAhJo+CS+6w2e4FgMEYke2sSNYPPz9h7SPsvss5HPGOelkEWY1kuiFcdUBdejbDE9QsgLrV2OlQPyWAoCbn9bxquf/hDrEgC7s+AXnEYe0zN4NSH5N/dqUfUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BL0PR02CA0024.namprd02.prod.outlook.com (2603:10b6:207:3c::37)
 by CH3PR12MB7497.namprd12.prod.outlook.com (2603:10b6:610:153::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Thu, 3 Apr
 2025 09:06:24 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:207:3c:cafe::ca) by BL0PR02CA0024.outlook.office365.com
 (2603:10b6:207:3c::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.41 via Frontend Transport; Thu,
 3 Apr 2025 09:06:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Thu, 3 Apr 2025 09:06:23 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 04:06:23 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Apr 2025 04:06:21 -0500
To: <buildroot@buildroot.org>
Date: Thu, 3 Apr 2025 10:06:10 +0100
Message-ID: <20250403090610.1570461-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250403090610.1570461-1-neal.frager@amd.com>
References: <20250403090610.1570461-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|CH3PR12MB7497:EE_
X-MS-Office365-Filtering-Correlation-Id: 9660bea6-7cc0-47d9-c367-08dd728eced7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/YAZWS0Uwg5juHgpeJj4agCwPWglEWAvok1iTjxqKug+gYYBiOeTjnVpRMQ3?=
 =?us-ascii?Q?VBQrxo7e9KXbUfgj9iBEujX15mIJ5gr3C3XY68xoqDE+4UyHt9YplDoUE+n0?=
 =?us-ascii?Q?I1xhHheKniaKrxpgnvHOzmQnzkXtq/+Lyi5UFYPXgQV0+PgGGQ0ISEfg7yRf?=
 =?us-ascii?Q?HG82uTohulLJEfPhm1fnYJXG77RV3lpn6/GzcbH49Tu2NjojLtfhqqamMjcd?=
 =?us-ascii?Q?IEJFAwvWt5XE7rIBjQ839ZKWrMP+tYkjo6/wuP7x4Vc2yAhzycYu+Qiw+RMA?=
 =?us-ascii?Q?GXeNplcVuZ9EmZEErISOrVTr4+SNeKR1E1czQWzQ/JjPMvu7A2XAzBQ1V386?=
 =?us-ascii?Q?Rx2/SIXVfiMo9FvffYucrL8wrvrshVKF3IdxQchJRUy4z7V7mbJUjaLMnERR?=
 =?us-ascii?Q?NTRWBggSWrViS1W+7FuZRCTCDVn3w7rzcyXJZ9R94nPXpBiRtoW0EGANyW7e?=
 =?us-ascii?Q?rPAeM4TauuGcMHgnammT8O4aS1DoG7Qo7RLh+T/ELjw65SHgGgmL9UeCCHWj?=
 =?us-ascii?Q?VVDGdniPTju7b+zQrt5bTUmcvCdAReETDwx3eyHxUmR/OaYKiXIqnAa/X6Sn?=
 =?us-ascii?Q?Ueb+7NzbiSFcDJulgyTBuXcgCP699v0qJBys581mg/AOscpbTWua5XQOKRg9?=
 =?us-ascii?Q?MV4IwhbMGBMsPAlvoCFCoUjtX2XEeNUPI5jznEL2sJuPoGx/03pOHp3n6wHb?=
 =?us-ascii?Q?UJo99Kt4auT/aeZcBqURea+YI/WQqCLm9jfut1IBBlCq77Ae+V3adNWYkuUM?=
 =?us-ascii?Q?kr6rZiHMcARgqsx2JpMKRB0EN9lynfr9766nS+sEMXAq7V+lh4bWZeUGPvLT?=
 =?us-ascii?Q?2GABWufR3scxzGofZWZxUQjcNnDFE+F2ti7cJ8RXmGrDDuRXEokYFJnZ4IEt?=
 =?us-ascii?Q?fm7HFwlo+O6xTDIi65RKJ34UN+9g+Izh/k2jqzDJpSr8PwXfFRdXfhPUJPiH?=
 =?us-ascii?Q?SWvZUYO7Ypc3rHNfBL+oTlnXilgmeGQAA+XJN1tF3K0tOHxDN7PNXX0TNS5G?=
 =?us-ascii?Q?ahgWg3Uuspn9o27Csa97Ub8bItFLshU7y5MH5pBmqv/2cd9o1umccEbACmJi?=
 =?us-ascii?Q?aZBBGduSP78RDn5Wjs5P64kbaWRT46sxvLQ1Xz5Oysrv1J0PQev/ljqCFwZU?=
 =?us-ascii?Q?p1gewVm7k/86XG6NOO0xsYIsGQ1QGUZNt9TrAypBqxr8BaI3IhLu552u9kBn?=
 =?us-ascii?Q?1BzRcVyrKv6heqlFA5RX1q+63ediwRfSUSHl5VDJub5fOWgQ1EhjYzqhvFRe?=
 =?us-ascii?Q?MCg3taD4MuexI1kJkMV6izV/L2dP3mmKSytU9xoBsoZ6/a0fw0N0jkN3d2VD?=
 =?us-ascii?Q?LAQD3meE/bVa9LjrcpaI5SsABNFGUUzB7Bu/+fFzZDkn2L7qDb0UkYlsyPYj?=
 =?us-ascii?Q?saVd+DKRznb5mRrf4N33H8K9g0M/XqGoZWqRsGmAascCgTFVnxe8/AO+KH5q?=
 =?us-ascii?Q?Tqsrx0wPW5vIYGhdtDzzTMPmTQ78pDV13BPo4dQyU6REyNj52aL7GiyjDgXU?=
 =?us-ascii?Q?Z3oWzsi8DbmE9Qb/eln3N0HpYGR8tZr+vEKu?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 09:06:23.7178 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9660bea6-7cc0-47d9-c367-08dd728eced7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7497
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzluHQ6slb/vW3ziRONI5h8N09aiXn5E6oLTJZ5g2vo=;
 b=pceiR1Ebm8DbAbTAar3m1w31FWMEKdeIBj/W2WQlFZ2+DZsYAkdgkWgnSU3ub6W+vzUifieSyxQybLTi55YZdydKEcoHjzJF/kKu0MeBu4RhY1MMcV/3uunuivkKE9qwug5WH8DSXf90QvtHQOjTC52N+TUnOmmb1zv5Prv9a7E=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=pceiR1Eb
Subject: [Buildroot] [PATCH v1 2/2] board/versal: change pdi filename to
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
---
 board/versal/post-image.sh              | 2 +-
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

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
index a45e4d4650..aba3285140 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -37,7 +37,7 @@ XILINX_PREBUILT_PLM = $(@D)/pdi_files/gen_files/plm.elf
 # psm*fw.elf is used.
 XILINX_PREBUILT_PSMFW = $(@D)/pdi_files/static_files/psm*fw.elf
 # We need the *.pdi glob, because the file has different names for the
-# different boards, and it has to be named vpl_gen_fixed.pdi when installed.
+# different boards, and it has to be named boot.pdi when installed.
 # If Segmented Configuration is used, there will be two pdi files and we need
 # the file that has "boot" in the filename.
 ifneq ("$(wildcard $(@D)/*boot*.pdi)","")
@@ -49,7 +49,7 @@ else # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 XILINX_PREBUILT_PLM = $(XILINX_PREBUILT_BOARD_DIR)/plm.elf
 XILINX_PREBUILT_PSMFW = $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf
 # We need the *.pdi glob, because the file has different names for the
-# different boards, and it has to be named vpl_gen_fixed.pdi when installed.
+# different boards, and it has to be named boot.pdi when installed.
 # If Segmented Configuration is used, there will be two pdi files and we need
 # the file that has "boot" in the filename.
 ifneq ("$(wildcard $(XILINX_PREBUILT_BOARD_DIR)/*boot*.pdi)","")
@@ -75,7 +75,7 @@ endif # !BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
 
 define XILINX_PREBUILT_INSTALL_VERSAL_PDI
 	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_PDI) \
-		$(BINARIES_DIR)/vpl_gen_fixed.pdi
+		$(BINARIES_DIR)/boot.pdi
 endef
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL
 ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW),y)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
