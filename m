Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9FDC54E41
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 09:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F09BF4081A;
	Sun,  3 Mar 2024 09:20:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RGk1hbz4ajqy; Sun,  3 Mar 2024 09:20:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1909241497
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1909241497;
	Sun,  3 Mar 2024 09:20:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6243E1BF2BF
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 09:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F84E4081A
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 09:20:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6OJLnoJnfwtU for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 09:20:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::600;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5FF8D4080A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FF8D4080A
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::600])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5FF8D4080A
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 09:20:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DuriOUmZ2X9U7F7D/A5AYNv4MPT3nJkit/OeaI8PyMKWoi2Mlkzau7jojuOdMJIc4Ij2M13kMxznn2wWb+hQ7HFvBOCqetA8iV+ojAzz/0BaWO/faIO3lDHIxvR9n+pQ500ch4kU7sFb12qRIw/YJCp6Tz3XpyuDDy2d15hE3d2ohoicDGrp4fvW3xVQdf40QfRdvBKXufrEivOH2zy/XI3JFPH5ls0IC9r7EBe9MOdAfXgKyERKBeQ3mGUiZNZSWfR/fV1TTVR0xXozGqxJlwD5L4B3UtK1W3jMjjOi9qyN9cMdU9b1d84rlQyCFP8Ocv013UQ1Qok68gtau/Rasw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZDn3qckdNjXCSn9CeDN9InuFru1v8wgQ9djeglfC54=;
 b=Ds4LKoa9HA0DhMyGZy41puiJrQTpy1O78xL4rCRaXbga5qdhf7KA+QD/Z7dLPHOyT09FRL5VNQXTn1lzC/uHmnsq1tA8rRamg373DM/lR/RMcB57X5SL2Vwnn6Ej5F9NiIEUUF/H8nl9wIMTA6xcJcCmxEkkx6O/SDorPTKMVkalAke6EKWvYsZVfzAu+0PcDxqjt69bSXWmigPQzfhM7ANLF4s43Xm1DtMAH6cJO60iDxznNx9V88qAnMvht22zl7aMNziosOSQzPyAbSb59jmTBSAWlVy478eVtaECVYh5wotdggFxKs3a7Q1NPFoySwkL1gyfvQMhxhG2CTOfcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SA1PR03CA0022.namprd03.prod.outlook.com (2603:10b6:806:2d3::27)
 by SA1PR12MB7149.namprd12.prod.outlook.com (2603:10b6:806:29c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.34; Sun, 3 Mar
 2024 09:20:24 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:806:2d3:cafe::99) by SA1PR03CA0022.outlook.office365.com
 (2603:10b6:806:2d3::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.37 via Frontend
 Transport; Sun, 3 Mar 2024 09:20:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Sun, 3 Mar 2024 09:20:23 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 3 Mar
 2024 03:20:23 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 3 Mar
 2024 01:20:22 -0800
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sun, 3 Mar 2024 03:20:21 -0600
To: <buildroot@buildroot.org>
Date: Sun, 3 Mar 2024 09:19:51 +0000
Message-ID: <20240303091956.352661-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240303091956.352661-1-neal.frager@amd.com>
References: <20240303091956.352661-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|SA1PR12MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: 961cc9b9-ec50-4b23-3620-08dc3b6327d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jxxmxHOY8C7+SbkBK9CoN0E/WcSfBJ1sLVDtnYHbVzqynnmLiVtsEg+HbriysKFI3ndfoQwTWAiHSVhGThlibbndOQTX6krXKjfoak5yC+atVpmuSQZVeetL7+Vs8+KS4WMc3nwmrbIc2y2TT2I+O57QktLB0iKD5nOErf8vLmzsNFTOWZ2/Uio7lx5L1XgchbXPlvAjOxMryPpluxEQBVAFfhPIWp4p9VhX4YhTpFz003V+JM9k/qc+UDQsKjo9leW+QDnRMbEnyABZjFPuKV6t0H6eOjlcS+rxWkF2vZvdUv9HBIQlZYiCsFeLltFjYZsOIdmFWSQkRZK3nytOO6iFd+V4x+9ZhgrCrf0/6i0zj2dvF6T4lQHHi+BfLohbh/CIaFTjWUV/YF8Bdott6E03rYEa+xqRWlQ3JVqMf1YmxiMva6K3+ZusZ+cGceUlmdd/aKGNLvrlI3iRVygOmrRcbvn6WMXxcXfS+zSRv5Mqpha2FgR+/FWsDjnPg9foO2P0u/spoGXjRBVmZDcPZL4IqzW/n9UWp2UsL8YMWxCSZT9FxL5EfdqdwhssV/lCnGjARwxdwPUDCUgAKdvVPP5MeA2fgkAgSWsnQ24rnAlLsIW4qsO9mHPWkQVb1bnEYveVyYHUtksEPdv/hSlWsYBO45Kzs5XHy9lToAGT+oXeqnjwZ7vcovjiEJcd3qGGTh03oMGwU7buchKt8NvVvUFbo0LHaPMDDTTU0O1G4McGNsa0Lr+TOer3n6ubkh6a
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400014)(376005); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2024 09:20:23.5293 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 961cc9b9-ec50-4b23-3620-08dc3b6327d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7149
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZDn3qckdNjXCSn9CeDN9InuFru1v8wgQ9djeglfC54=;
 b=uGdH9M1bbDAg3wOhNNYWL4B1MkpP2+pmEiBbsv1iufPrCqRkoLqqnYRn+Gc8yMVbyVkK/P31Tcu0E/wpa43hVx0gmvMXuXd1ZSoqaZqu5Gvl18URkPvtwPJMBtevlyRbHwzs/11hlIMlgKVDe9KT9TB8g4i9zLY25RTT877OtRw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=uGdH9M1b
Subject: [Buildroot] [PATCH v10 2/6] boot/uboot.mk: new zynqmp pmufw build
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
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
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
V4->V10:
 - no changes
---
 boot/uboot/Config.in | 19 +++++++++++++++++--
 boot/uboot/uboot.mk  |  5 +++++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index beafb38930..c5e33944d5 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -514,11 +514,26 @@ config BR2_TARGET_UBOOT_ZYNQMP
 
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
index dda606a880..c11e3d89f7 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -416,7 +416,12 @@ endef
 
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
