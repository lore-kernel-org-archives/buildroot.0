Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A86EC83F33
	for <buildroot@archiver.kernel.org>; Mon,  4 Sep 2023 10:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 507E681D4F;
	Mon,  4 Sep 2023 10:06:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 507E681D4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id amz-vl9zX6af; Mon,  4 Sep 2023 10:06:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BB1C81D24;
	Mon,  4 Sep 2023 10:06:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BB1C81D24
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD3E31BF215
 for <buildroot@lists.busybox.net>; Mon,  4 Sep 2023 10:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B969740328
 for <buildroot@lists.busybox.net>; Mon,  4 Sep 2023 10:06:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B969740328
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5lIfxtsdwSrV for <buildroot@lists.busybox.net>;
 Mon,  4 Sep 2023 10:06:07 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00F1D40407
 for <buildroot@buildroot.org>; Mon,  4 Sep 2023 10:06:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00F1D40407
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YBdIldLjcDzoq1sGrFGHqkFsDKhoRHKgxACb6Jnr+q+awCYgvfgHoqyo78DXLaqtKUlgkoZBGkVPUrvJJiQTlEkjPngOTESgyPuBmn4XkhxhhcGQ1nUUVz8lDP2UXrq93EluWJeKX+FxWxOhdBLElQs5zoImNKjpZg/Ag4kYj6GHytQWjoW/n2+MRwQO9fA9cNGDGBE/Yeg66YeJoKCgSXryLbNlecoYwVk4rzpvYrOTQgft4lEHb8lt8QLBgxv/okz37Zq8bxnMCRbb7NlCIXBtNRsIpDAPMNz2JvqTse5zXeid1txqTGnY8X90O6+58WmPJz9RmzLNiPdcoLOMLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jm5ods866VXdhii/T1Nczc73pjiqupAj5Tt4++0d4ko=;
 b=XzFbjc6jRetmUwTQmj4ZaBV85EbgZloDINr0YUI5qD4ZmIJ20f8GCJmE9P3FAbi+MGjdKm82T4uwqxKp2eNOH93gyqPVvkeAP/1U+jalmWbNkWXWMObniEk43Sd41HWgjjsUiYQLHPzSjf9mmhdFwqDpyFaptpUM2HTABJxgNk+oRSWJbfzZ6OlZgXP5pgSi0LW1UqDQN+GUqRz9Va2Bcjo0wYxa7rpy3TBy+tDrLk6ORPYAAqc3Z3v5ZG70VO8NRyWZCfBikTlBCwrQuZ58Mwy26wdOYdMTT0rysVJD9vO0BKVP3sr/ZAgUSgcR8pOPjh+qCiEr22j3GY06t7aSCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from CY8PR12CA0042.namprd12.prod.outlook.com (2603:10b6:930:49::21)
 by DS0PR12MB8295.namprd12.prod.outlook.com (2603:10b6:8:f6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Mon, 4 Sep
 2023 10:06:04 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:930:49:cafe::51) by CY8PR12CA0042.outlook.office365.com
 (2603:10b6:930:49::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32 via Frontend
 Transport; Mon, 4 Sep 2023 10:06:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.211) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Mon, 4 Sep 2023 10:06:03 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 4 Sep
 2023 05:05:55 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 4 Sep 2023 05:05:54 -0500
To: <buildroot@buildroot.org>
Date: Mon, 4 Sep 2023 11:04:43 +0100
Message-ID: <20230904100443.1613306-6-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230904100443.1613306-1-neal.frager@amd.com>
References: <20230904100443.1613306-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|DS0PR12MB8295:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bc50e73-416d-4865-7af0-08dbad2e8c72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8eB4yaLSFickq44Ynqhjl0W2ZIBShzVdnrF92yA+r/Btb9SFyABoty4QPsUK60dD6Hf6oSdrDF9e2I30dp3y2/T20ASCDj2ZIWn67tRGEQjqyEVCHXCxkHyc7L8HEg4B/R9G3LbWTTKkzArt/X1BfvTRy6eY0wL8UF6aESD8zWWgNuF+xjf0DaMR5xBiF+b56Zn8pD5RrtAvvD9vyikRojZVqCXg3wl1+fUZx1+yDvQfRGhQpk05915PPQomSmHimNz0n4ztvGmBaPlPK8YCnRNLTmRVRuV4PYdq25Q7/ylW4RtPw6dI0lHFU/onS99xZDG6oyYYiOARj4DxV3pWGLRhjyx+eUYEEgQFqtNO0x+kD+ND5t6+dhevZA4XlCMOJhXd1TwVPgc47W4CiKXcFIa+EIEXC0e3e0kyhn963G3Tc0LM4XiiRZRTStfFSS2hGXBpicDaRsbXxE2ZNWFR7KYJV2MXpOa8ty1Ab9QORyoF7l/mBPD9dUOVF9aI98OJfu+GxA5xu4DBdNkxtn4nt9cEzxWSyzQWyUlQogxV+B2OG33wNUcCOyXsI0e8d6gdrEuOLS2OSaIiHhMuNVcvIPj5+5mijV9O0l7XoPYmQ4yv7hIAkFORqpQLgUaO9epMr3Y3FrlgdkQYFFhez5d38CUGkniGsNxgpMvf20M/qOxpXvjkl9j/h62TJj0EPms3frQbZlaJETA5aJx0ao17lkc2ma7GvP/No2nlrRDBPhBl7NUfqgj3tFxOlwniyMjXOC0zkAY+W7K8pJFdCNoUzodyJN5WYyVZpS0MC7OevjM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(376002)(136003)(346002)(39860400002)(186009)(82310400011)(1800799009)(451199024)(46966006)(36840700001)(40470700004)(40460700003)(26005)(2616005)(1076003)(47076005)(81166007)(356005)(82740400003)(86362001)(36756003)(36860700001)(426003)(336012)(83380400001)(40480700001)(44832011)(41300700001)(8936002)(316002)(4326008)(54906003)(6916009)(5660300002)(70586007)(8676002)(70206006)(2906002)(478600001)(6666004)(334744004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 10:06:03.8220 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bc50e73-416d-4865-7af0-08dbad2e8c72
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8295
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jm5ods866VXdhii/T1Nczc73pjiqupAj5Tt4++0d4ko=;
 b=TX6Fkjo/h+FWVKWnTtmD6L056DDGJ2cPwm6peU2trK1AXjtnIGSj19mjQSK+mmN0WseVSFnceYeRViECEmPN8QrHRe/Sr8mA5+C+ZSBvwqkDMsYAtxOFSuv7USBVYZEbQXp1853GUC5LRUj1npZBup4vPJWDaaBeZAAWAbjyx/U=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=TX6Fkjo/
Subject: [Buildroot] [PATCH v3 6/6] boot/uboot.mk: new zynqmp pmufw build
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
---
 boot/uboot/Config.in | 18 ++++++++++++++++--
 boot/uboot/uboot.mk  |  5 +++++
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 8b726eaa57..6d830e81c6 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -495,11 +495,25 @@ config BR2_TARGET_UBOOT_ZYNQMP
 
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
 	help
-	  Location of a PMU firmware binary.
+	  Location of a pre-built PMU firmware binary.
 
 	  If not empty, instructs the U-Boot build process to generate
 	  a boot.bin (to be loaded by the ZynqMP boot ROM) containing
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 9f81c0b842..0e338efaf1 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -410,7 +410,12 @@ endef
 
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
