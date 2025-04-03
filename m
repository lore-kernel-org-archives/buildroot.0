Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7CDC3600C
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 09:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4B0C405F8;
	Thu,  3 Apr 2025 09:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PHeRn2CySh_Y; Thu,  3 Apr 2025 09:06:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3D894064F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3D894064F;
	Thu,  3 Apr 2025 09:06:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DF113117
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 09:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7A0660AA4
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 09:06:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E5Qvi7Kc4wPF for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 09:06:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2408::62c;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8968C60647
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8968C60647
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8968C60647
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 09:06:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6eTy9s2GAgxpsw7l+bPOFenlIsR2k8vsNYle1jzPUMo30gd0kecdFPdax9/owdg9avwptl9OMJVAkGmAjRUXWmcnJAmz+dCGxBCweWXsijdy+l3m13m4Oi3haGXus1QkP9k1j8ECwxaatQZKJvb+AtLtKab9HMLA1ToFRACwd6ek2qdo2vsDKQxi0ACtNdj7e3M+/sjlmDR3un4UKaB26CzTRtjk3lH2UhoSmNK3JlLL5TU+sJ9qV095n0pz7zINRdeRhCt2gYBEiJM6gO5w6vzM9WunossNjnKsmdC9Rdj0H+xByHNF9tQ4ixlRTjS5Bi2QUunPErVLPwQ2jHTAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmDN0Sq9Skk0oXMTy5E4tdUOFgrO4Vs2jdSNQrfnnLg=;
 b=ZqH6mUJ/KDThY8U88lshgLuyfYkbeIkC9d00pnBoOeMAe3Q/t28vzlwUHFcM3FR6nwmvg9FIP5UuA+mMILlIMd2gDKz1HN0AzELVSSpoeu5gTzm8CJssQXAzLGVAPbIXYuwmGSyFXoltungI1/AIFVZJ5u/enqom/pYhRTQqOXW1hirUNUHh+TGXAl1HBcqQA3nsOWbf49o+BnKieCYgxyVpb0rDQxZvqV4EZDRVBIR7mNW9rvoTqBNBblp9gehce9xBiQMs5+3j4IGBrLi3kVYazQP6vU4pz7nRWAvyLeXPkpvfFGYftKvYRJDCZRszmIAw3aAnp1XITuC7JoiGAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN0PR07CA0008.namprd07.prod.outlook.com (2603:10b6:408:141::35)
 by IA0PR12MB8907.namprd12.prod.outlook.com (2603:10b6:208:492::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Thu, 3 Apr
 2025 09:06:21 +0000
Received: from MN1PEPF0000ECD7.namprd02.prod.outlook.com
 (2603:10b6:408:141:cafe::ba) by BN0PR07CA0008.outlook.office365.com
 (2603:10b6:408:141::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.41 via Frontend Transport; Thu,
 3 Apr 2025 09:06:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD7.mail.protection.outlook.com (10.167.242.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Thu, 3 Apr 2025 09:06:20 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 04:06:19 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Apr 2025 04:06:18 -0500
To: <buildroot@buildroot.org>
Date: Thu, 3 Apr 2025 10:06:09 +0100
Message-ID: <20250403090610.1570461-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|IA0PR12MB8907:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a6a0c34-878c-445c-0929-08dd728ecce9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1Xuue0/r0KteS/QojxaaKDyS75ZdEGWf5ZSRO/WPf6vkrKTYVPKAwQkDGlfu?=
 =?us-ascii?Q?r9IRdB2C9RIP74TMXw6vV7zBcIcDe+2c9vKBCKkcAY+XHWcHdoAiTUV9fp1m?=
 =?us-ascii?Q?SRmXNsulztjWEoC6o6QJ7LGIs0avJ/n7hiypytAgC1usrd70h/y9XT3R2BPJ?=
 =?us-ascii?Q?AOlP3HoQTfe0KXofB1Z1gVliUv/Lvw4KstFxixQVzpkh0228kca+w49xT202?=
 =?us-ascii?Q?yJ6U2NLpt4v/7wqNdoDaT/5XDnvbpOwSI8ZjMBwwSmTlUJ5RWks77tMZlOl+?=
 =?us-ascii?Q?XJCODpQJqy8kNuxlBFcvVoENDdqGOSM/z5v2SNE4hVWkobLNfbAsGi1TSfGq?=
 =?us-ascii?Q?CuXrp4rStp3HFnlnG4tRpBXnxzUZsR5A/mPpE5zWQUEL6hmORAuNWbi63Kog?=
 =?us-ascii?Q?E6Iy5WJol7YaLVaxsg1MoP0ZjWcFJNC7iLemN881OBqt+NhKXcaHVQikLLmP?=
 =?us-ascii?Q?ckI81Fzy++7Qhp0ioZ+nRQK2CyRV1x/zyHh0YSD/UpgazVC6AgAo/bpeR6d9?=
 =?us-ascii?Q?RO6HFKQhO6wSNp0MJ8R8aFD2Qu51zfwEf8VDjuJTKwnSNAOdXimFCjlYOLUw?=
 =?us-ascii?Q?zih9Eai9rdHsYFlPa+vmyQOZcvX9kQyMNYLyJx/kJVGKBk64a/zeQ/0/BpNG?=
 =?us-ascii?Q?1ScdDsLWWrNymZA3CC1gS8jOUyl+AE8VxaeUWOLRL8td9BxvVmdY6ga97//V?=
 =?us-ascii?Q?ISPCpXIeW6jJPPT6XChZvDL24g18n8iQpj3l7S5mIUT+3t3kFrqVXhxaCQjx?=
 =?us-ascii?Q?DOJoPh+UtJ/Bcx+WLg9MIQiDV7/qjgPsvxc9tG9mOKICymoMBDu1QuxbfKuA?=
 =?us-ascii?Q?MDGSmksQFNjxjueEpdBMIlqg9rzvIGpK8BgBuOE5LUr8p1dN8aOjLo/X73fz?=
 =?us-ascii?Q?041ZBKdk5cgpO+Ykb1w+dho1t2AOgEu+SVmCFs+YSY0KqBXeoiC6j10Gl1pu?=
 =?us-ascii?Q?gB3SOqdLBl+zx1DOKT7Ru5ckAwu0zns027skPsmNNUg1IzRMEnW8H6eQm7Y4?=
 =?us-ascii?Q?3OWkJP+nOIm83cKFEOLN8Ew1MMHun42X68sEzT1IqUj0+awrgHyiFb65Lwbo?=
 =?us-ascii?Q?MX+0CAK+3aKWOxR8770MClmtbt01nnBEq2NbtCoduBcvCEpTnFaMTNd6Dv5k?=
 =?us-ascii?Q?Jp/csMLJYdfRMRTjHBOGpBPx5J+ZiXosRlE0IPNYvVswis+NatuTPDajCVpf?=
 =?us-ascii?Q?pQdsMAIbytpZRi2MvbmSomBTdm1/K1k7anFhvNTvDypDzNaeRqOsxESkniM1?=
 =?us-ascii?Q?YG0fqWGQdR83wllvpjKsPiSqSUZ8BWzesACpL9VtXKGYk8VU0wGbcBN0W9mf?=
 =?us-ascii?Q?83+I4V7G8sTN7L2x/iVn3yx01DIbQmwaPvu8Fa35E/5q9/VTR/mGbJ/Aq5Cw?=
 =?us-ascii?Q?kvnMUOHbOXFUCnz7OjRJty+iDv9eIcINWFzR9K4cGd0HRE2G7FRDRkyNybFT?=
 =?us-ascii?Q?b3OfRpU9izf6mR6yd1DaXAZ756qABoK8a0OhehsSKKH9PpYTOBsv9G2T8hdZ?=
 =?us-ascii?Q?T+aH05GbPsCQk3NohpO+k0X7OAABFiP3TJ516vpfUQ39hlTr364KyzK76w?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 09:06:20.4756 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a6a0c34-878c-445c-0929-08dd728ecce9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8907
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmDN0Sq9Skk0oXMTy5E4tdUOFgrO4Vs2jdSNQrfnnLg=;
 b=tBwEU7epQS/E99T9gDtdTVGpXDVy9n4MGy1ZOPkkP6b86lw9qYtytec5siXwJVC0JTX4tjfxbEFCpGDGs6LZOfuta5H9uaVtw/+az2o1J3KbVvkEimitIkKhDQdYDYDt9NtBsgZ0bQlkCn1TxSM/3uSYIr2W3Qpruz13qd3FpRc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=tBwEU7ep
Subject: [Buildroot] [PATCH v1 1/2] boot/xilinx-prebuilt: add segmented
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
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index d0817d3cc7..a45e4d4650 100644
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
@@ -39,11 +36,27 @@ XILINX_PREBUILT_PLM = $(@D)/pdi_files/gen_files/plm.elf
 # so to support current and future AMD Vivado versions, the filename
 # psm*fw.elf is used.
 XILINX_PREBUILT_PSMFW = $(@D)/pdi_files/static_files/psm*fw.elf
+# We need the *.pdi glob, because the file has different names for the
+# different boards, and it has to be named vpl_gen_fixed.pdi when installed.
+# If Segmented Configuration is used, there will be two pdi files and we need
+# the file that has "boot" in the filename.
+ifneq ("$(wildcard $(@D)/*boot*.pdi)","")
+XILINX_PREBUILT_PDI = $(@D)/*boot*.pdi
+else
 XILINX_PREBUILT_PDI = $(@D)/*.pdi
+endif
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 XILINX_PREBUILT_PLM = $(XILINX_PREBUILT_BOARD_DIR)/plm.elf
 XILINX_PREBUILT_PSMFW = $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf
+# We need the *.pdi glob, because the file has different names for the
+# different boards, and it has to be named vpl_gen_fixed.pdi when installed.
+# If Segmented Configuration is used, there will be two pdi files and we need
+# the file that has "boot" in the filename.
+ifneq ("$(wildcard $(XILINX_PREBUILT_BOARD_DIR)/*boot*.pdi)","")
+XILINX_PREBUILT_PDI = $(XILINX_PREBUILT_BOARD_DIR)/*boot*.pdi
+else
 XILINX_PREBUILT_PDI = $(XILINX_PREBUILT_BOARD_DIR)/*.pdi
+endif
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 
 ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM),y)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
