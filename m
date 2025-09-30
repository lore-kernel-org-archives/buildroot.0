Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20947CCA468
	for <buildroot@archiver.kernel.org>; Tue, 30 Sep 2025 12:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3CFE81E2E;
	Tue, 30 Sep 2025 12:58:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SH4ZJWYbM1U6; Tue, 30 Sep 2025 12:58:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0D728132F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0D728132F;
	Tue, 30 Sep 2025 12:58:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BED9111
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 12:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2959F40C5A
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 12:58:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9XvY8kNjO8dz for <buildroot@buildroot.org>;
 Tue, 30 Sep 2025 12:58:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c107::3;
 helo=ph0pr06cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6B33940C4E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B33940C4E
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c107::3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6B33940C4E
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 12:58:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iL34lHl+w6zLv/Eqj/JlH6VtcqccQhEPjBpp6ZpObKPuIupi4mRiSCdo43+Yu60RpbZHRYyOf39IuXQRNO/LonEyaIW1q8HyBBc71RNYilZiF9YV3Ez9JHZSFpeWyYEjqkDmwLNlzoQMTzPyKwvApUVxQyxG7Qap8wcykRu0c6W3AVxsidLkaG6XqDwxFWXsg7aX5b7TwS39E/0biwMzbUyMe8Z3fB57727jVdNRmyLJ0ntvGman32J6rtxbXB0F5Y7YPq650NnknWCOyjnXVJVZ2t+f0tZvh7vM5OjbAJFfgIrreRsUcby9m1tc4FyLdbJ5nrCP/vA9Og3FDNyt6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+UiZwSvSHVBPdwdRjbZlRmyaR13HhQvvvAV2u6mkUc=;
 b=A3GAKxk7kAg37roUxFqoauikYCkjz4a+kEH9ZZpK/5HRr3kPiS1lRF8Z5fwsA+5dM8DtQWg7HqnEQ3E5zaiQkHExhVKcuC26vUhxQcYOLt7a3yt+TLfK9pFENOTzbmiXpYF/aOIv5BQjK2v7OblAB1QvCs9/8tG5oxSzvN3H4DN/dBSBd1XXf+3j3g54R1H9GXFdOt6pNI+cEm2jGQIFxxk2k5uvtwcsMwb7z5RepB+DGfy4uMUcUO+suoQQCjRfJOGYXxiVB68g2o/4ZQ3B6KntVx3ggRSxjFdWF/jgix4rbeJi2WZvRkzJNoC7RzSI7AgvT9LMtdmjuRJAdKU+9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH0PR03CA0380.namprd03.prod.outlook.com (2603:10b6:610:119::8)
 by PH7PR12MB9256.namprd12.prod.outlook.com (2603:10b6:510:2fe::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 12:58:30 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::1d) by CH0PR03CA0380.outlook.office365.com
 (2603:10b6:610:119::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.17 via Frontend Transport; Tue,
 30 Sep 2025 12:57:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Tue, 30 Sep 2025 12:58:28 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 30 Sep
 2025 05:58:28 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 30 Sep
 2025 07:58:27 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 30 Sep 2025 05:58:26 -0700
To: <buildroot@buildroot.org>
Date: Tue, 30 Sep 2025 13:58:23 +0100
Message-ID: <20250930125823.971241-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|PH7PR12MB9256:EE_
X-MS-Office365-Filtering-Correlation-Id: 23bcfc36-a74c-4d4c-12a1-08de00210d1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|7416014|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f8S//o5isDWMKO5QYsTYVDbkoDkOXGht38fIAoBAfQG2FN0glrIfJ6/bO/nk?=
 =?us-ascii?Q?Yp2uiqZi8OZ8BIIUS9ajnq56V+GFwJjhP9OXUbw/TROgMn/kLbxG6ourbJVX?=
 =?us-ascii?Q?2rDU1d5ySC9VD08v0d5RvDlIqOw8cR2BgRTulVC1ujW90gdDWD/ks6nxHBea?=
 =?us-ascii?Q?4OBn3lQGph6fPyeZgB72CwQhZhPyfA/GO3+L4oc2cxMCVL3vUaRo4eFXWO/M?=
 =?us-ascii?Q?1kcXWS3YblzyAxvlKcCHn59Itf1fi0KejyrbZ/TnI1TKGdVksdVWWyJfahCS?=
 =?us-ascii?Q?J6ttmTs+P32aLZ3RkHKcfnGxEZUacYR0LqZ4D5OtYJ62YplQRqUsjbXM6NCA?=
 =?us-ascii?Q?JvL9Iv53vPtCitPHwF30yi1CXKKDhGO3git8vTwfvaRFrY8qsEUOzZAi4JCd?=
 =?us-ascii?Q?ZAx6OCBqgDO3cm+q+mLZvwaMC1Um2YlQGWkC3gT8ScMyVFP6VvqScuSWPQZR?=
 =?us-ascii?Q?0n0HbFmLhrSQhWBW7Sdu3y8WvI5zJ3wkj/1QeMklJF1uNAYTjhVR73hiS2fg?=
 =?us-ascii?Q?BIUGaKR9Gsh3t5+E7mnPA7geGrt/h5m8/j0XGi72ogivaGeNO3wnGHjpSq12?=
 =?us-ascii?Q?KT+vrAkDbg0A8Q3pXe4+IjeoQtu2qqbmgvWFQwEqTrFX1q3jUo3EPopimWB9?=
 =?us-ascii?Q?0yYWTwnTyMq1DntcIu5yTu39TtbGf4vJtE7nW+/JptHKlXAPEoROtIvtbCJz?=
 =?us-ascii?Q?SxVkvKVN176dfSET77ZXcvbOgdWyuh+VaQiK6EJ8yG8RbyfJ2o/EolItNS9P?=
 =?us-ascii?Q?lNfcKqwm+I5pYc4YIEev4FOoh9Pc04vzqF3zHEF1Vdi3EQlpD6+9Uo339vb2?=
 =?us-ascii?Q?2imjb4mXPWfcOjptdBf2ni5q7lFFT7REIXjHlTGa7w5Sr7+62lX+dVOVAUKH?=
 =?us-ascii?Q?o/eqoAxAxTU11m77SqAzqUvc2sCNrREXrEP0/WfGAV4UJss7lK/mMeoX428V?=
 =?us-ascii?Q?LrdHXE6W5rZdP9dhLxZHk/x/5iqiu2691Xn+8qi24cFCWDDXwLzw+HdGWRJ3?=
 =?us-ascii?Q?cdU/TxpOv3etKAFdubQTajjkhocho8rWzQMDlT4215Wzb8dFcb8y7X122Sxm?=
 =?us-ascii?Q?Q8MMweMJPNi64xGwwq1hFiMYEI3BHyzBEmvjn7mp2D6JjuZs0XkRfHqTspQz?=
 =?us-ascii?Q?GGbSJCLX9By+oX+R2WGo+xy8SzubhbuMVTgM3PqgxmEDQogGonV5BnvzxaBN?=
 =?us-ascii?Q?f/2AM6iaGbR4c4fcMDB7j+rPBB6y+6BKx64sRfHFpe8WlekMk6F7JOcC8jxo?=
 =?us-ascii?Q?Nys6u2eY9aDlI9NLSsJhR918BI2SdVWPK+IyKmkNcxflP6QsAQHqwVAOJYoJ?=
 =?us-ascii?Q?f0rUqUPAyxmmaq2dHiEFsoacbGL+wCkOhHG+Ck8lAssybak+nbNlzq32hg5J?=
 =?us-ascii?Q?HthX74UbhQ1ErpjbXRzCTXq4skzmuyF0EAMLCs7Mv2OYnaanQ9Yicf2I4K4y?=
 =?us-ascii?Q?Dui7WoBjrZ8yRR87M/0Sv612p26KKR9axEyz73ROmHXHC1liUUgagNT6ee58?=
 =?us-ascii?Q?gBNGXcA78gzGpHEzastqvNhoilBVW1CNQYTJYs8uUhEyWYtjuL87E+BGJpsP?=
 =?us-ascii?Q?Fznuk1rZIm2q3MFMlDR83sWHSIClEi2ehcmAZLOU?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 12:58:28.6387 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23bcfc36-a74c-4d4c-12a1-08de00210d1a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9256
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+UiZwSvSHVBPdwdRjbZlRmyaR13HhQvvvAV2u6mkUc=;
 b=eBv+QC9ZaInUZZp/mF2eiI7RwjntNVoI6Ky8jb1tgd2hyHeH7YTGLddXaYaGAUu966aqmsmWd0wqBldAY4PSn3m3IMTLtBQF4fWEEFNjlOInGd+Vu16m7dxKcNIP68D7Q2NS96n/2gjMMgEX8sMYqL4KtWupldoehGfcDWz5snc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=eBv+QC9Z
Subject: [Buildroot] [PATCH v2 1/1] boot/xilinx-prebuilt: simplify family
 logic
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

Currently, the xilinx-prebuilt package uses an if-then-else statement for
deciding which files need to be installed from the xilinx-prebuilt repo. This
works fine for now because there are really only two options, either versal or
zynqmp/kria.

Starting with the xilinx_v2025.2 release, the versal2 family along with the
vek385 board will be added to Buildroot and thus the xilinx-prebuilt package
as well. In the future, additional families will also probably be added to
this package.

To avoid creating a long if-then-else-then-else statement which will only grow
in complexity over time, simplify the logic of the xilinx-prebuilt package by
giving each xilinx family its own if statement. In the long term, this will
make the xilinx-prebuilt package easier to understand and maintain.

For this reason, this patch moves the zynqmp/kria families from the "else"
statement to having an if statement separate from the versal family.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- Combine zynqmp and kria functions since they are the same.
---
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index 5d984c4f82..95b656cdde 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -103,15 +103,16 @@ define XILINX_PREBUILT_INSTALL_VERSAL_PSMFW
 		$(BINARIES_DIR)/psmfw.elf
 endef
 endif # !BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
+endif # BR2_TARGET_XILINX_PREBUILT_VERSAL
 
-else # BR2_TARGET_XILINX_PREBUILT_VERSAL
+ifeq ($(BR2_TARGET_XILINX_PREBUILT_KRIA)$(BR2_TARGET_XILINX_PREBUILT_ZYNQMP),y)
 ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW),y)
 define XILINX_PREBUILT_INSTALL_ZYNQMP_PMUFW
 	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/pmufw.elf \
 		$(BINARIES_DIR)/pmufw.elf
 endef
 endif # !BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
-endif # BR2_TARGET_XILINX_PREBUILT_VERSAL
+endif # BR2_TARGET_XILINX_PREBUILT_KRIA | BR2_TARGET_XILINX_PREBUILT_ZYNQMP
 
 define XILINX_PREBUILT_INSTALL_IMAGES_CMDS
 	$(XILINX_PREBUILT_INSTALL_VERSAL_PLM)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
