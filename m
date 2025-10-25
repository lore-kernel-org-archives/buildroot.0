Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936ABCCD1BF
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 13:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BAF240405;
	Sat, 25 Oct 2025 13:47:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Y0Xoyjm8vHU; Sat, 25 Oct 2025 13:47:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2806940460
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2806940460;
	Sat, 25 Oct 2025 13:47:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A11DD7
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 13:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10A1D40460
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 13:47:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fmGptwVyuXdd for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 13:47:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c000::1;
 helo=byapr05cu005.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 21C7D40405
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21C7D40405
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c000::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 21C7D40405
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 13:47:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IDwhHxHCLPIm2JU/yA44zjf1bXxyB78tqqNegY6szuxroT0rBqvbe+B0roEfNR7ejtJ5EvPbUkQUsHt96zGQjUL0IuOijIJ9P5NHgGJYJqm64cJsu7BIyktk5TfvD4usNW46TZjwkkwi4/2ioFHmMWeWn6asiz4b3S+3qQR/pPJYxxi3lZAQtomOPfm9JcX9y+V0S/C6RWiFhFkCgBszOGPX8id0m/nZeQZOzRjXkzXu+Npb8OHWsA2xJC6Q7dtAVosI99iHRjTISiWryi/RDCaXDqz8oDYtrsD7XsoyIbxaT7t5kfyqeKd8EjXqMzVDnL2RgYkt3jjvHwTXubFBCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pgruinJ98BHIOrICiDSjsw1k29Lsg255tfNt0Q3TpcM=;
 b=S/hwAZ8Qew0SkOGuzJw87uK2pEyvyDlKPnnXoUBxhrMfZXzIfs9iLbzrmf2QmHL/ODFH+adcbAB8h2N4XoXqa0mcGvKoPiDUoYeIdldfZA3NJTERr9WRpstrYdG2h7ar3jRW8W2UeVOfHoe78PnRubJ1Z5sN3k+nvYoxSEMB/vj6jll7IvoPbIqR1apBgDfhJgCBHlUilpaVsq9V0IaxfyQHwDTpxoqSNer3gbzQNXrLfpeoMWa/iT3hH0QXs0w4OeLHHQZ+WxLArj/486eGNlBDMZNTxuX/FL4vR658tMcZQyeXEiKesLFvBGYDeT9t+3p/mF0ZSxPMddLavU/5mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BL1PR13CA0394.namprd13.prod.outlook.com (2603:10b6:208:2c2::9)
 by IA0PR12MB8748.namprd12.prod.outlook.com (2603:10b6:208:482::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Sat, 25 Oct
 2025 13:47:01 +0000
Received: from BL02EPF0001A0F9.namprd03.prod.outlook.com
 (2603:10b6:208:2c2:cafe::16) by BL1PR13CA0394.outlook.office365.com
 (2603:10b6:208:2c2::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.12 via Frontend Transport; Sat,
 25 Oct 2025 13:47:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A0F9.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Sat, 25 Oct 2025 13:46:59 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Sat, 25 Oct
 2025 06:46:59 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 25 Oct
 2025 08:46:59 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Sat, 25 Oct 2025 06:46:58 -0700
To: <buildroot@buildroot.org>
Date: Sat, 25 Oct 2025 14:46:55 +0100
Message-ID: <20251025134655.1068839-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0F9:EE_|IA0PR12MB8748:EE_
X-MS-Office365-Filtering-Correlation-Id: 9888ec3e-8e4b-4b37-30eb-08de13ccf8b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|7416014|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q223ix9oW8LO6dFs1dJNBofxCkOe3+O6jjvb3oS+6cZth9Oap6RXKWP+RbOc?=
 =?us-ascii?Q?C+DoTgMw3R0byjdqfK8EY76QY2uKAlp7Ml5ZvEeRZb1JsOALap+slaw6nHsv?=
 =?us-ascii?Q?Xn+OcigJuXUW6W22Y+3yn5CLgZtVVwPLlQ8ZxqzeCrT26/aViiNKnJE1SmGo?=
 =?us-ascii?Q?pvdIHvNMAOfa7JwD9QV6b5BQ+a4e5dIlAeuM9l0MNzMRIZop11jKvEmPJ5W5?=
 =?us-ascii?Q?VHCFeRWYn5kyLacl2NG/C6LV/5cS3eRb9cD4MbKhWC3WSy9DOf+BIQm2Q3YH?=
 =?us-ascii?Q?D2YDRGuxhGpQgNg0wdEolV0xDCmv50tYJUl/dmopfwDlDpdnY8CCbGkTt0HF?=
 =?us-ascii?Q?wc/Q63gje+eDu6/IIXTwwsUSN5y0wF8NQOOCfBL671MTc9lOlZJco14pSCun?=
 =?us-ascii?Q?jtr8YVGVJeseHuun1wQ3o9R8PbqKl+m6drhnq7t8JU9EcAIR/gmIg9vlMsN4?=
 =?us-ascii?Q?27nxKRVNfM7knk1FQqb2dqm8QrhkSuVwfYpwG7evKyj8niq00xFmN6ipY6Wt?=
 =?us-ascii?Q?09IxK5B2T6QhXX680PwiwHjlhkf4ESIyE6OFBHEpMtbraBZtY3ixKEkK2vW3?=
 =?us-ascii?Q?fQKSvibfVUeR2nr/yv1/DZsPx0fX7hgkd5Vcf4dQW1JTB6c8bEzKrgiS+7gt?=
 =?us-ascii?Q?Otnt9/knnfb5MI34F+O9EBH5Z0QyFT9yHctEeZUuRG/cReH7x8Av1gy4nvPI?=
 =?us-ascii?Q?cbxp33WjmtGrHFrmwCEMPODuBagyILw7OMWrMzd9UcKkRjsCx5K8JXcIERh/?=
 =?us-ascii?Q?GW+CEzf5mrL6imn9uq1rJfgYrNFPdRyQ+eUTYGJtLKFN8fQVwAYkQLtP35ag?=
 =?us-ascii?Q?1Mp+MmxZnrN5bP71rcd2Qs8J3J5U18eHvTSyOOqMnyZxsCpR0FrMNBa68vlu?=
 =?us-ascii?Q?EpZYPHuBC5+o1eTjz0ur1X9+rlA0LJgWgqxqR/iJa/UmPy5E+SqsNuA1K/2z?=
 =?us-ascii?Q?Qaz9ww2jySxSlTaiVWnSlai718Grpo7p9Kd+y9D8BP1f5J6l4vzt7BiJCpCW?=
 =?us-ascii?Q?MR+GN/PHDeK299UrOdjO7NXlU5+fZ8rNoV7Bh9UGtYJTMzcIQe3DKrlJTzGN?=
 =?us-ascii?Q?PbAejKXcLrFFcuURTTONwy3lOaKYQdJfxKOhWS6H6+kOkH0tXXCoX1hmwxai?=
 =?us-ascii?Q?cf2JXco4tKuvEcRfgU2oLSQbF3sYKzyjqridCnbTNsbf21z5X3GrvtyY6gUR?=
 =?us-ascii?Q?nf8Fbo7KTsJ8VC4h7E4xzKBWj+/pRAY6gljCdrfrSjCIPplF6VzGTiZdn0S8?=
 =?us-ascii?Q?BICZ1itYyhrpHz7VlZNdwciG+c2fhr2asntJBJxdq7idlW/3Xquh3dl+t9FQ?=
 =?us-ascii?Q?f7O3TEtyx0DxVUPviYfLFDhH2aGtS4ZIDf4NoAUZSH4NVfVMR8W3SqZ6hb+X?=
 =?us-ascii?Q?MFxGF+ZJMXLZJjNiYRyzy1wBd0yc9xidCUEIC6vc2nShzI5d1TcOpOQwn2SP?=
 =?us-ascii?Q?dWeWYjS2rangdaQbkPOgiRzREYZegOsuv5aesVVI1E09cXxNutK3Oe02b1cg?=
 =?us-ascii?Q?tRBqIlfmrj/RJEzmAlpe3WXyoDEVfNbRjq/YqiLiP8a4hNmx1RchMu8n8n0l?=
 =?us-ascii?Q?svV4hjNfpovR0M/XsD4epOc/KMBATDe9ZvXA6dTC?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2025 13:46:59.9777 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9888ec3e-8e4b-4b37-30eb-08de13ccf8b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0F9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8748
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgruinJ98BHIOrICiDSjsw1k29Lsg255tfNt0Q3TpcM=;
 b=RGpIw4X/dmICBpJ15tN/Tp0ioqH7azq5+odzKMm9LZTL2owmLtcVOySIH+5/y1nWvYMpfmMyMrrk+WRAwrrnqnefKYyFlFPKg5LHv5nDFBXfM6HcW5rygaB3bdbVTgqN8rl2sFmLUQVioAtpHiSLyFlupJrJ5kIVzh+swz1/fl8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=RGpIw4X/
Subject: [Buildroot] [PATCH v1 1/1] boot/xilinx-prebuilt: add local versal
 xsa support
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

Most of the time, users will be running Vivado on their local host machine,
and will generate a XSA (Xilinx Shell Archive) locally.

Instead of requiring users to create a https:// location for their XSA file,
this patch improves ease of use by allowing users to work directly with the
XSA file on their local machine.

BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA_LOCATION can thus be defined as either
a local location or a https:// location for the XSA file.

In either case, a hash for the XSA file needs to be added to the
boot/xilinx-prebuilt/xilinx-prebuilt.hash when using this option.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index 95b656cdde..a7ec9abff5 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -10,6 +10,9 @@ ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA),y)
 XILINX_PREBUILT_FILE = $(call qstrip,$(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA_LOCATION))
 XILINX_PREBUILT_SITE = $(patsubst %/,%,$(dir $(XILINX_PREBUILT_FILE)))
 XILINX_PREBUILT_SOURCE = $(notdir $(XILINX_PREBUILT_FILE))
+ifeq ($(findstring ://,$(XILINX_PREBUILT_FILE)),)
+XILINX_PREBUILT_SITE_METHOD = file
+endif
 define XILINX_PREBUILT_EXTRACT_CMDS
 	$(UNZIP) $(XILINX_PREBUILT_DL_DIR)/$(XILINX_PREBUILT_SOURCE) -d $(@D)
 endef
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
