Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF8FC27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 06:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30FEA60A35;
	Tue, 18 Jun 2024 06:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id scoFay3NnUE2; Tue, 18 Jun 2024 06:24:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 527FC61030
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 527FC61030;
	Tue, 18 Jun 2024 06:24:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A3A711BF284
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 06:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90DDB42A84
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 06:24:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bBkz1i6XU2nQ for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 06:24:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::601;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3BACD408F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BACD408F3
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::601])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3BACD408F3
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 06:24:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oSiL/4R879/pdPs7J6/L3eLsSC4HwIFCyA9BIcINLBaSLgFzEV5N3qmTLZc8Nb5fFiGWLc72gIjQiTEgquc2oFixYwTnryrlL8xMuQT7fzw+AABIioAtvRI1zAhjFhOv+o4fc9bGomYHDnEs3fMp7FBZyaYvkJAlAkak6Tetz6U2ZFDgld57XrZTYr0+m0mMDwX86KXU1iqaBLSX10N66Vfkn3+aSqogNNI/skTCkspRrZCqPov0yb6uK5o/PNXC/fpqqwjQGE853U+vTilmHeI/AiZLHgGzfsKkyklRxREm/K0NlxoA2YOhc5UV+18uMWPjCF2W2VwzEdmWMZEcIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iwTjKX4FVLdivRPJp03wuQXS9WFAjcM9ZJzsw9S+PeY=;
 b=Z15/hGKCuzI5lz11KYoxd8/sp7ibspV5VlLDEHG2jTO4/IeKAn7SK8xjdErFWvlrr64majKdZ1UIn/29yM1Pbd/lHJq0L8LUYmDWUY9aSbYaNag6GR6G0+VC1MG4KpqkxcVO6upwTA8hmPLMI3fycg3Bg1QKn2jEdIgnuWej97dXT9sjX9c0GzePy5wEB6X3zU1+iUkA0hDv0i2yE8z7P8yqbtYWBQgni3EWiKi5Ii5aCYLocveYageWMyYc1tBfqpHYtQplhcNYINhgvfYjmAl54flKQt9jg7mFEHfn/L94KhwQYpHqIn4ZoCA1n+98jsrRAWTgywtUhkgyMgaRvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH0PR13CA0009.namprd13.prod.outlook.com (2603:10b6:610:b1::14)
 by IA1PR12MB7616.namprd12.prod.outlook.com (2603:10b6:208:427::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 06:24:31 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::60) by CH0PR13CA0009.outlook.office365.com
 (2603:10b6:610:b1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30 via Frontend
 Transport; Tue, 18 Jun 2024 06:24:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 18 Jun 2024 06:24:30 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Jun
 2024 01:24:29 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 18 Jun 2024 01:24:28 -0500
To: <buildroot@buildroot.org>
Date: Tue, 18 Jun 2024 07:24:21 +0100
Message-ID: <20240618062422.2916787-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240618062422.2916787-1-neal.frager@amd.com>
References: <20240618062422.2916787-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|IA1PR12MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b9bda2a-fdb6-4662-b137-08dc8f5f4ff5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|36860700010|376011|82310400023|1800799021|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QZU20yoA8QS4XsUDYqQAyerCT8h64Tr4OeXY7Civ9UeLfpTClSGbl1eaKEwp?=
 =?us-ascii?Q?JHjE8ohAOz1pjxIJi+gVvD+yNaL1/taYw32eIt0PyzKrnYk2sxanJwzlUq1O?=
 =?us-ascii?Q?0FoUmjYCg8mxhBxdMlmcUjQpBO2+WqlVG2f27ON5UqkilwuYxFDdZa39ayh8?=
 =?us-ascii?Q?yvU//WRFd4/WlqGCd8Wqq39ZoMuii9RLUyYa5deMX+x19DAeC/ehMadMrmDt?=
 =?us-ascii?Q?qTeN3Z+kfPzq9/nRAtjegp3pElqe9il5rjlwitenVv7yUmwervagJAZf36l2?=
 =?us-ascii?Q?BLcPpls2OLg1ySEq3v/EYBMORHnitJ4bj7TaZz6NKUbATAU5NzEL5WcptdQL?=
 =?us-ascii?Q?0eiwGoKWZ6up0hjIMm2lFkFrnjPquPhocm5Dw6Nlawtw3l+Y0w/HhUZf0zuK?=
 =?us-ascii?Q?3l/iiiMMZzxWFe4QxuvtqIOvN4BBTF6pwBvxBRWU5WarDdDuonoBTDNY4kXI?=
 =?us-ascii?Q?TF9OhJ1B/oIzWjKUC8OmdDZ3x8QgQ92i/r45ENdS7lVq2BMF5BLB4Oa7b3b4?=
 =?us-ascii?Q?S1wutPLgVsnEymsITvFSrg1nhnl8MzNKrVJ/uXePkPBc3c6BsocFsQTe+X3B?=
 =?us-ascii?Q?aUkcghfQu9fdNGA3/puvnHToGP2EXjeD+a7pAo3uHn1J97o9uuAP+L0jO+6m?=
 =?us-ascii?Q?ziUNjQcuq/fGKS3CytE823JzdVaP37JzB8mmQ9iY0/f3isODpYG+b2zBjwzw?=
 =?us-ascii?Q?jSPD0qyeHMnvjQk0LpTzsXtz6sQkZlISDaWyKGuSm5o6Ug8O8s+5GUv2HUTz?=
 =?us-ascii?Q?KK5L3nApCTzXy4pU3TMLumg+j36fM14n4OvKGPdZi3vSeMgU2gtxOzTOgqwf?=
 =?us-ascii?Q?RDsbtnOS2x7UhizKtjWV7sh0YqINOzC6n+CqJK5zaIc7rxkCTcDAf9OZzHMB?=
 =?us-ascii?Q?cgWQbCr0xDCkp2haS+AdsF7SZYSkZTZP5QiVuUXenh4Tz17lAbGQeUluP/S/?=
 =?us-ascii?Q?uSqQljmKXTBlZ6iRdpkQNF8HfekjjC+vVRVGhiqS3xO1twXXrXfm1drrX0NI?=
 =?us-ascii?Q?H8huyfmB23TXpbqlNeB0apPZw1BOBghkfzmY4KCCskU6M59tnwkF0NLIIboq?=
 =?us-ascii?Q?1pRvxnvxctsIAJkOd0DbWX18Q5A6KmpSHZR7tCchG0ZA0r9YLVtkJAvis8Gv?=
 =?us-ascii?Q?v4tM+WX4xQxFletxJv3xwnGwZpPibxk9XBOMAcxAWyQ7mp0cBD276iPXRUJN?=
 =?us-ascii?Q?68j/B34FB7/yC5IhJr3peTw6Qa9sfrGdkQ6EFIm9MDjiaDAks2XHhtF0ZI1S?=
 =?us-ascii?Q?QpYhzqA2qgPVO603W2/OXyknUb+NB4AEMXqt3HIs4RDkqw8Ctsbhem8fQ2z/?=
 =?us-ascii?Q?FwDjGvaZYt5h913VpxruqJniJpRfJDVJ+RWL05Pl6/1YPw0ci+cncipf+NG0?=
 =?us-ascii?Q?8mep8lQJ5nMdayW9IaW0m9FhtrsQ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230037)(36860700010)(376011)(82310400023)(1800799021)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 06:24:30.5153 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b9bda2a-fdb6-4662-b137-08dc8f5f4ff5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7616
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iwTjKX4FVLdivRPJp03wuQXS9WFAjcM9ZJzsw9S+PeY=;
 b=R39f7x+Lo3g6CxQWSAPcLTMEpNPbYdJgetyxgRu44Ts5oIeQsprowOQZikaqWVBMDLL56cwV5boTJ5ak9D8Pn03kK51M47zptBEIgtWbVimnfNK2E6n8D69qrA7dklZVagAUUHt858qM2MFH/1WiFIJD5FIALOK4+RWSUoSNyPE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=R39f7x+L
Subject: [Buildroot] [PATCH v2 3/4] boot/uboot.mk: new zynqmp pmufw source
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, michal.simek@amd.com,
 yann.morin.1998@free.fr
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
V1->V2:
- no changes
---
 boot/uboot/Config.in | 20 +++++++++++++++++++-
 boot/uboot/uboot.mk  |  3 +++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index f37040a28a..3aef222772 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -512,9 +512,12 @@ config BR2_TARGET_UBOOT_ZYNQMP
 
 if BR2_TARGET_UBOOT_ZYNQMP
 
+choice
+	bool "pmufw.elf prebuilt or source"
+	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
+
 config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
 	bool "xilinx-prebuilt pmufw.elf"
-	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
 	depends on BR2_TARGET_XILINX_PREBUILT_ZYNQMP || BR2_TARGET_XILINX_PREBUILT_KRIA
 	help
 	  Use xilinx-prebuilt boot package for downloading prebuilt
@@ -525,10 +528,25 @@ config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
 	  by the ZynqMP boot ROM) containing both the U-Boot SPL and the
 	  PMU firmware in the Xilinx-specific boot format.
 
+config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE
+	bool "xilinx-source pmufw.elf"
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
