Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1FAC27C55
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 09:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3B1041A03;
	Fri,  7 Jun 2024 09:47:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HaqJY0DPs5eh; Fri,  7 Jun 2024 09:47:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A415D419F8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A415D419F8;
	Fri,  7 Jun 2024 09:47:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1422C1BF4D5
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 09:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01F096150B
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 09:47:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f0PSP7PlM9Fi for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 09:47:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2407::603;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1D20B61504
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D20B61504
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::603])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D20B61504
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 09:47:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IaFgnzOaPRMX5cUoO4REcm6D9/URuAdaEaL6dkzI7auEirkIkipwATSCyhoT4oeySE+gCT2/T1WcxLGpbHF0FDcfk/r/6Y5auazgaTPS6txtqWrla1y4Nc+i3StMM0HmU3Iki0LaGYesVwInKxBOSvLO63uuFcyGTYFG347FJeoABbFGrp7cnRr8bYHx99I1Sv1/UDltC2taZt0GeJ7MsuJJr5fGnnU7vE+QFCcmOT4zhfI+2/3aKolc5OXXnYSIi14Ph/fBH1SKodq6BqDdzobz5JMGx635DnVw3Ef+f+zqNUtU0rmJLFymHInUtJm6pnAMfFWoaeSS76jrMH3cZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ieiDOft0nu+r0PSyHH3vf1vrA9JqCGPyffRAuRrPePI=;
 b=F8dhqnBSbYoaBFyaUDc3jdAVlHopznO26Nsgels52uXswl6DaTunaxNjNZsJViXwHOZPIYRXTccYm+6FggWpJoIU7XOMuEP9Dk68oPGyZpZdcmjR07RJENl6cOsTZBmcG65P2SZvQR4qPhOHaNIrVU+lpI/dfwTYYPE+r4DKpf8HX9ov6ZNlnBYTmycDVVHFcxeKfNPFgzVKUJT/+QQNx/pwzUiI2WHP12GHzBx3yO9D5Zw31MQmAu3AELIqdB6zfzWG45utB6vTnx0XIsm/2nMuCgmKcy1DqPM0ZR4tshNU1nRRUF9fuQJsyQbMfYm9yhhYeL/N2Ekgyv4jkOAgcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0073.namprd03.prod.outlook.com (2603:10b6:a03:331::18)
 by BY5PR12MB4114.namprd12.prod.outlook.com (2603:10b6:a03:20c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 09:47:17 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::89) by SJ0PR03CA0073.outlook.office365.com
 (2603:10b6:a03:331::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.16 via Frontend
 Transport; Fri, 7 Jun 2024 09:47:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Fri, 7 Jun 2024 09:47:17 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 7 Jun
 2024 04:47:12 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 7 Jun 2024 04:47:11 -0500
To: <buildroot@buildroot.org>
Date: Fri, 7 Jun 2024 10:47:04 +0100
Message-ID: <20240607094705.1962913-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240607094705.1962913-1-neal.frager@amd.com>
References: <20240607094705.1962913-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|BY5PR12MB4114:EE_
X-MS-Office365-Filtering-Correlation-Id: 3825e5c8-be68-4350-0bc0-08dc86d6d170
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|36860700004|1800799015|376005|82310400017|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dbdJKBG0nbf4iZ5mPPNMc2k+hSanoK4VSYAR7FlcduZjFDgtT0rt6blHKFT1?=
 =?us-ascii?Q?HaG9qxpOys8XKO1ySa55gC3OcXbNuUvv5bJfzwd4RPMvVUhCJS+e8GGal7iY?=
 =?us-ascii?Q?FHjM4z+P7IHTKX/wmdcfMJ0QVSORDGShNivCfMDD6UNRbAkhi38lgVEZQkST?=
 =?us-ascii?Q?ktiIPsGDz5SlsiOTw2PXXAjIoCFv9u4FNiLwvsskf5YIf4liU2hm/zofpEAp?=
 =?us-ascii?Q?3AnTH0uAIvpTUATFzz2dAt5p/NEvkzdaHoGQ0m1kZuz/N9IsaUCPmu+EWUdn?=
 =?us-ascii?Q?YEJHa7JEgwa8fZQycRbxdWLjx82wro0K2x83Tnn9u653OJgLZsHNAyisT3U7?=
 =?us-ascii?Q?IRA8bSlXunGapRv0kAIJ/8OPqH0dkd+Z1NsxN6zAX5i0hI8/VdtuhHXaZIdQ?=
 =?us-ascii?Q?d2I63nv+mGIShD8S608M3oiTfciqx/mufqbrT1o55A6CRq0ddSyj6keFT+3w?=
 =?us-ascii?Q?12ZVX8yy+U+8ImnB6pD/Ro8Z02+8kAy7noUPUkCjL+y1KOrch5RqSlQiE5ch?=
 =?us-ascii?Q?+mc1e6XcLlgGB2DV7kQ4AUnWya8kzngBh2ZLSyxPmnA1YxIC6vwRVJx7jIPg?=
 =?us-ascii?Q?vU8Gs+vl/ujcPKl2r+LJyt2ix4TcUGmGxeT8fk/hM69MLwuvphNjZd1kVvDk?=
 =?us-ascii?Q?5FIOXVHIF4zg3/gNOlRNs6zw66mIq343XZa0i/SDm+3izUYj7ttOmVZiBpYi?=
 =?us-ascii?Q?zGnFg/jQ46+Bwyt8o5Ig2rpu9vKqPj+zXyM3iTWOC4Qhqc7TSlkP0MzL88c0?=
 =?us-ascii?Q?+ROIn+CsA6lg3iazzE5EgysZjuExB1BwP01WXiwQccRKYqbD1AA4ix2M7yex?=
 =?us-ascii?Q?mfDlXU5O91SNq2Y4oorU7io9udFmXvxwVuGVf4A5uTzLWqKNYiGp36B8PF6U?=
 =?us-ascii?Q?iqQPqIodGQ7OkL9Z1pcnGXE+f3Sb3LOOmNd9OCAZ9usd6dQQuShoWvpIBeGT?=
 =?us-ascii?Q?ApUwNxFqdFYOQnklc3vM/+csqoqISvNII6h7tcU10V4KwH4eTLAUZ+EukpEl?=
 =?us-ascii?Q?ldEfAn6Omq+yhEEbA/aJ0Awi1cl0XU7mwrA3F+XQkTVSUEmT1enEHMQLkshc?=
 =?us-ascii?Q?k9YY8Ck7TRiPF+AMqi5tuur/y5LOcyDwpdxv9LQsUD9AfSkjILcQnuSuZHpp?=
 =?us-ascii?Q?fVnwe/syQSkLNl3XkBSYKJFV6vGqjgTyJA4KUdMPMAbak/DFZ0UMeChefJn3?=
 =?us-ascii?Q?DN+TxXD8ghfu73dJOJf8mr01g4N0llOz6iVqjdo2VwgfzWGVyXs08faZJ+92?=
 =?us-ascii?Q?wQGAYGpxoc+SybaBbb7hxZtAbELn2CzObINNyl+vwOQjLfrS1V0LTV2I4eQH?=
 =?us-ascii?Q?2+D/Zlq9EUEnfbxsdif9XJvXxw/S4OyuTXPIfwcFccXSrdEKX0mRyty0uJCB?=
 =?us-ascii?Q?GFT6MuyJC19TenNFG2m1VFLf5hOF2g/dpX16/EaSybFA7Qq3FzfprxRFGwF8?=
 =?us-ascii?Q?CdSOcCNtbprrpinU1zeCwqRTPqRV2I6y?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(1800799015)(376005)(82310400017)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 09:47:17.3109 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3825e5c8-be68-4350-0bc0-08dc86d6d170
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4114
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieiDOft0nu+r0PSyHH3vf1vrA9JqCGPyffRAuRrPePI=;
 b=NrTdU0pjkavyz8zhWMsLSKU91/jIsDZwBcc+3XcQSkpe39qomjXH9eiww6wNgqOEGPdDmOAzjufuqBRnyt8DNOJYXttSPJ1lDkHPnaeKqwo7xPJInhIeKP/PxZCjDkPuCTcBZWQpbETVyaMGhKRbYgXMFBQQeMAylOAx4VpYVuA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=NrTdU0pj
Subject: [Buildroot] [PATCH v12 2/3] boot/uboot.mk: new zynqmp pmufw build
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
use the zynqmp-firmware package for building a pmufw.elf that gets included in
the generated boot.bin.

If the BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE option is enabled, then the
BR2_TARGET_UBOOT_ZYNQMP_PMUFW config for downloading a prebuilt pmufw will
be ignored.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
 - patch is now backwards compatible for users already using the
   BR2_TARGET_UBOOT_ZYNQMP_PMUFW config for downloading a prebuilt pmufw
V2->V3:
 - no changes
V3->V4:
 - BR2_TARGET_UBOOT_ZYNQMP_PMUFW removed when
   BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE selected
V4->V12:
 - no changes
---
 boot/uboot/Config.in | 19 +++++++++++++++++--
 boot/uboot/uboot.mk  |  5 +++++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index d0901edc9d..f0c26af25c 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -512,11 +512,26 @@ config BR2_TARGET_UBOOT_ZYNQMP
 
 if BR2_TARGET_UBOOT_ZYNQMP
 
+config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE
+	bool "Build zynqmp PMU firmware from source"
+	select BR2_TARGET_ZYNQMP_FIRMWARE
+	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
+	help
+	  This option instructs u-boot to build the zynqmp pmufw using
+	  the zynqmp-firmware package.  u-boot will then include this
+	  pmufw.elf in the generated boot.bin.
+
+	  If this option is selected, the BR2_TARGET_UBOOT_ZYNQMP_PMUFW
+	  prebuilt option will be ignored.
+
+	  This feature requires U-Boot >= 2018.07.
+
 config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
-	string "PMU firmware location"
+	string "Pre-built zynqmp PMU firmware location"
 	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
+	depends on !BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE
 	help
-	  Location of a PMU firmware binary.
+	  Location of a pre-built PMU firmware binary.
 
 	  If not empty, instructs the U-Boot build process to generate
 	  a boot.bin (to be loaded by the ZynqMP boot ROM) containing
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index b9f165f041..18c02a4430 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -436,7 +436,12 @@ endef
 
 ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
 
+ifeq ($(BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE),y)
+UBOOT_DEPENDENCIES += zynqmp-firmware
+UBOOT_ZYNQMP_PMUFW = $(BINARIES_DIR)/pmufw.elf
+else
 UBOOT_ZYNQMP_PMUFW = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PMUFW))
+endif #BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE
 
 ifneq ($(findstring ://,$(UBOOT_ZYNQMP_PMUFW)),)
 UBOOT_EXTRA_DOWNLOADS += $(UBOOT_ZYNQMP_PMUFW)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
