Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0990C27C4F
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 13:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 901344077A;
	Sun, 30 Jun 2024 13:45:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OyBjXnMRj01e; Sun, 30 Jun 2024 13:45:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FA1440622
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FA1440622;
	Sun, 30 Jun 2024 13:45:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 526341BF3A1
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 13:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40263605DE
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 13:45:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tQDqa_s-G9Tu for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 13:45:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::600;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 276AE605DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 276AE605DB
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::600])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 276AE605DB
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 13:45:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E3KY0sN+o8OFkF7fWWxyqwOZFWrQTW6rrhsZgDh6zobLPuR8Ol9NyF9oyxZcnDpWi06I4UIvbx9+gT5oD7o2jKV31YDIhab9HhdJR+nfGEf4JqAwsTrE71YJPNIa24mALCuR2532JdDSUZ631dPydiff+tZ7bzznqWzDXq8L9B0eVeGhOTJcuQFBc0FEsxNrxCBAuzxLkuZ2ZgrxnlWVDnruz0BAERcaFAVAEFNaPF2W1OXWFWixr1W51Lq1y6RWyYoxAVQa4q/+AOHZTC4KuNyZnOas35T+3kbvLjYiTFeLflXxPSRslTQe9MTk5l0lmJJSuOCg89jtEipSX/6hcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHEgIDqbWGGgLWrWzy1a3+sNXNr7JPPr2gWs3mpXYdA=;
 b=n+gh49Bu04mraekN4gelL33gGssBUjQrOEamLySYBd7EjkelG6/vj1j8/MhbrW4rD8FmFZU9cAscVeFmtfAnMVUUm5DBWWkKlYUukmuFpBbWeCZCn43yK2GWQcbypVTH2mqRl3ky/Np6yOIKo1xFtxcxT0a3bJJFr4KTSAJDaO2rJQRT2WutyeoLwb18SghW7nuGeKZLr0PPrUwpjinysyJtfFx9xr03Maii1+XMQoB3UQ8SHqV6wgfDGjjmDnee4j7xOCY/zn4CmH+iaHta9roYEBYzinjKkymjgK4GALyUpYNnLizoHZkuY44AqaN8kBcAjAIxJhbGG1ob5l66Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0081.namprd03.prod.outlook.com (2603:10b6:a03:331::26)
 by SJ0PR12MB5636.namprd12.prod.outlook.com (2603:10b6:a03:42b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Sun, 30 Jun
 2024 13:45:16 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::a2) by SJ0PR03CA0081.outlook.office365.com
 (2603:10b6:a03:331::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29 via Frontend
 Transport; Sun, 30 Jun 2024 13:45:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7741.18 via Frontend Transport; Sun, 30 Jun 2024 13:45:15 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 30 Jun
 2024 08:45:12 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 30 Jun 2024 08:45:11 -0500
To: <buildroot@buildroot.org>
Date: Sun, 30 Jun 2024 14:45:02 +0100
Message-ID: <20240630134503.3658120-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240630134503.3658120-1-neal.frager@amd.com>
References: <20240630134503.3658120-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|SJ0PR12MB5636:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c1c188e-7a2a-478d-fa3e-08dc990adf57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mtlsgYogqx/dbTsx3XbDi9dnHpZ0ZY3iwjDQ6QQOspZGh4UazX4O57FJMCUr?=
 =?us-ascii?Q?J3FFfpA9oLGDOcjPJC2zS/QA3cSFpbowPXoblLwCO9yMLR2JRAW4je9pCdMx?=
 =?us-ascii?Q?wmicqGAx9vTyqtz2MgyOuRY+kCSH5lSEWw5YIPr5DRRCTKdKJwEG6vtPU/PK?=
 =?us-ascii?Q?O1ah2BSJVsR9CreFQqFgbzvJDcQTq0S6Q0kk7uT0SaIhkC/sr1us7TNNpyxh?=
 =?us-ascii?Q?bj+UiyVhPNiVet4vahCb8vGgqLU46beA+RvzmJ4T4XnJ9eztB/ohBOUa0gcZ?=
 =?us-ascii?Q?8VeOgKEv6PHq1vCBTeTYY/Rk/yx3X0sAtH+k9kEmsdbEuZewV651XkptXP62?=
 =?us-ascii?Q?kG+ec2GTmByPUA6xZY/oqzy3RIwC4hLvLBd5DUnnDGnyAE5zDifVgOIaKOqk?=
 =?us-ascii?Q?S2Uc7p7C63/AKEpQ7x0BLqx3MjAyhhjQqxSeh2+g618+TvxYB1PqoILSUSup?=
 =?us-ascii?Q?4FINgfJq+B8l1aDAA87jjHaNCn5rO9ZhaUSGv+SBy8rj7knMznbLHjv50LKd?=
 =?us-ascii?Q?LoUxl2GjRTV3ymx32LIdzaVsvAXQryaMfTmR10q8edmj4bgQr6hfDK481eum?=
 =?us-ascii?Q?0BNyorey7786ITVfuncIocqsYswY6Wx62MSRZFR8J0EXjIOogAxh5Fldgb/5?=
 =?us-ascii?Q?Ooek3MY231aqI9b67WaX6BcmAAlxYZELCbfQhKieg0UjZmylAmgXHKVeJ30G?=
 =?us-ascii?Q?wgvJe7OJxwbGhw1/lplnuHqrMB2/o4CcsW9pAfR/z9uQxNj+7EeigFj5yoxA?=
 =?us-ascii?Q?W5gCvEy6gNARS1sxupaeGszOX7U0J57ubXE4KPODRuQ1O0trryxQvFw3YhYn?=
 =?us-ascii?Q?YRnUJlgAyCDRQS0RFyVh6ib3kh3DtEI5dqx4S5j7WwqpPyDqgdQ/+Oxbygz/?=
 =?us-ascii?Q?M3/NZOxyYMji2n9lxEKEdvilaRNKPKyQf07xFCZSkbWEkRUAebmkVpuzWGL+?=
 =?us-ascii?Q?2Ieu2oxqeCuqLO77p2D98A7LSGL77WUaQVOmU9agUqnZ84VudSUfk6Ht5b5p?=
 =?us-ascii?Q?hiCUphYSasubADRmnJx/XQh4upZFaJcF+Rat2Vz1k0V4oD5pjTYvaCkNP8xU?=
 =?us-ascii?Q?mDxtapimKbfIYjR0fbgdb2/nb9AXghoWRDG1A0ydKpYI9DlGrLUKmohEm1hK?=
 =?us-ascii?Q?BxMCAxRHMqly8ZMlPr274E/aqkrGKt+fU6c1M6xz/P4OJuiqFOyUeS+VX41d?=
 =?us-ascii?Q?SxAe2jGt4JbGsa+xKpzCEBbABEUSjuPfwQVf/hVVd3CPeVFruc66IHXFsHlp?=
 =?us-ascii?Q?9SZb38urADM6i7c9lTUABxgC2M1ACUu9fWvL9mYk0jIsckFSTjZFZXxJ6J6X?=
 =?us-ascii?Q?vCV2T7EZWtuYCTHEF58t/td4bMdjMmNi23ftjI2Cd3nIY4PeJqnOOEkQyLug?=
 =?us-ascii?Q?0NOFh+kb2HDFXxLH+6ecp+WDj/zspjL6FOXd4UVqbgnJFzgJWiNRoJoJLwMW?=
 =?us-ascii?Q?/k9FOZV5TWk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2024 13:45:15.4012 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1c188e-7a2a-478d-fa3e-08dc990adf57
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5636
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHEgIDqbWGGgLWrWzy1a3+sNXNr7JPPr2gWs3mpXYdA=;
 b=nlgWfQXGUAR3YCIZCWI4f+13sxjW8M1NHzxUwX3+vgMQGkJJ1J4zo2B4ePJ1zzm0b5/FSGpREgm1+ugw+nKez42sEMRTy1qwHou567uGVn0j40amPvp3Ndor82ivJZFFqoFe+/9NJOg7B5dib0RjQ3O8qhRuJaQ3PPXZXuDKT9I=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=nlgWfQXG
Subject: [Buildroot] [PATCH v4 3/4] boot/uboot.mk: new zynqmp pmufw source
 option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: andy.a.kennedy@collins.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The new BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE option will enable u-boot to
use the xilinx-source package for building a pmufw.elf that gets included
in the generated boot.bin.

If the BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE option is enabled, then the
BR2_TARGET_UBOOT_ZYNQMP_PMUFW config for downloading a prebuilt pmufw will
be ignored.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V3:
- no changes
V3->V4:
- it is no longer possible to select both BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE
  and BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
- added a comment that if either BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE or
  BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT is selected, then
  BR2_TARGET_UBOOT_ZYNQMP_PMUFW will be ignored
---
 boot/uboot/Config.in | 22 +++++++++++++++++++++-
 boot/uboot/uboot.mk  |  3 +++
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index f37040a28a..f18095807e 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -512,9 +512,12 @@ config BR2_TARGET_UBOOT_ZYNQMP
 
 if BR2_TARGET_UBOOT_ZYNQMP
 
+choice
+	bool "prebuilt pmufw.elf or build it from source"
+	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
+
 config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
 	bool "xilinx-prebuilt pmufw.elf"
-	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
 	depends on BR2_TARGET_XILINX_PREBUILT_ZYNQMP || BR2_TARGET_XILINX_PREBUILT_KRIA
 	help
 	  Use xilinx-prebuilt boot package for downloading prebuilt
@@ -525,10 +528,27 @@ config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
 	  by the ZynqMP boot ROM) containing both the U-Boot SPL and the
 	  PMU firmware in the Xilinx-specific boot format.
 
+config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE
+	bool "xilinx-source pmufw.elf build from source"
+	depends on BR2_TARGET_XILINX_SOURCE_ZYNQMP || BR2_TARGET_XILINX_SOURCE_KRIA
+	help
+	  Use xilinx-source boot package for building
+	  zynqmp pmufw.elf from
+	    https://github.com/Xilinx/embeddedsw repo.
+
+	  U-Boot build process will generate a boot.bin (to be loaded by
+	  by the ZynqMP boot ROM) containing both the U-Boot SPL and the
+	  PMU firmware in the Xilinx-specific boot format.	  
+
+endchoice
+
+comment "If prebuilt pmufw.elf or build it from source is selected, custom PMU firmware location will be ignored."
+
 config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
 	string "Custom PMU firmware location"
 	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
 	depends on !BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
+	depends on !BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE
 	help
 	  Location of a PMU firmware binary.
 
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 19f4cdb557..837cb01f68 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -439,6 +439,9 @@ ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
 ifeq ($(BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT),y)
 UBOOT_DEPENDENCIES += xilinx-prebuilt
 UBOOT_ZYNQMP_PMUFW_PATH = $(BINARIES_DIR)/pmufw.elf
+else ifeq ($(BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE),y)
+UBOOT_DEPENDENCIES += xilinx-source
+UBOOT_ZYNQMP_PMUFW_PATH = $(BINARIES_DIR)/pmufw.elf
 else
 UBOOT_ZYNQMP_PMUFW = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PMUFW))
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
