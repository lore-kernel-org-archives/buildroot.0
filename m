Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E498CDB474
	for <buildroot@archiver.kernel.org>; Fri, 20 Oct 2023 11:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B717E70497;
	Fri, 20 Oct 2023 11:44:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B717E70497
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Yrr5Lg77z7D; Fri, 20 Oct 2023 11:44:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8264607DE;
	Fri, 20 Oct 2023 11:44:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8264607DE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5CDC91BF3A9
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 11:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4092D402A7
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 11:43:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4092D402A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DWclP5pOq4tm for <buildroot@lists.busybox.net>;
 Fri, 20 Oct 2023 11:43:27 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::60c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ACCED41467
 for <buildroot@buildroot.org>; Fri, 20 Oct 2023 11:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACCED41467
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXplFac2JvLvSzuwLI9B3ukzW44kwvS0wPDjvwkUrGg6ZPU/fZ5/B3NRwRAO2AkecTpXCNEL8tC5yilS8J3c4ziOGiUbaDR+gGw+ZfgpaUSjzszepCEaqICYulHx2gtrnPu4YYgwjHMpz1/F2Mh6xOPNJg+RM6R6MfPLht43sgfM1jgQOIM1IErLYelZxI/rWXm7UHyGaiIn3mK0fGsKAmDMKMxX1De9xZ1yg2XjtRlXDtwRAriG5OpcW95vgC0hp1Ronel1LZ+yfKkrGGCo0EOiCBF4Z0vaLXTbPJ0UvCj8ma+VjW2RM2YA8K0/zkOtSKlvw4BiK5hEkKlE66E3rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHZmN9ryUT5Q6vVOmBBTcfYkVS7ZOh6l0CdEYrqAaNU=;
 b=RZUUjWX77HZyP4kiptiHe1AiurZVRFz2SDFAIfdO9KPKAJobnp10UV+l5p/i+o2hHuNE+b5u5KbkUhsmoUCX4sKh2tZONw9y8wHiyWVRdg9EXNFdam6SB3n2a3hqXpv8yS18S6gvmrH3dL3K/YsY8KMKNKUkuJ4LCbSVz2FSpJmJUv9y+IkEoaY7Pv8zJRq9hnEcbe3tuph9leu5+jRuPpdfXkOQeGFJaWbAvhr2IWJxveQVR/ATu/dUmz+RhulbzHs/8bP3aTwzDGb8udmudEXZwzLfOZkrWK3zUu8p/4lLEOrVaEtNcJ4a9gwxcxAE164rYCejHI6R6B/b9on2VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from SA0PR11CA0030.namprd11.prod.outlook.com (2603:10b6:806:d3::35)
 by BL1PR12MB5334.namprd12.prod.outlook.com (2603:10b6:208:31d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 11:43:22 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:d3:cafe::f3) by SA0PR11CA0030.outlook.office365.com
 (2603:10b6:806:d3::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26 via Frontend
 Transport; Fri, 20 Oct 2023 11:43:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Fri, 20 Oct 2023 11:43:22 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 20 Oct
 2023 06:43:17 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 20 Oct
 2023 06:43:09 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 20 Oct 2023 06:43:08 -0500
To: <buildroot@buildroot.org>
Date: Fri, 20 Oct 2023 12:42:32 +0100
Message-ID: <20231020114236.4129636-6-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020114236.4129636-1-neal.frager@amd.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|BL1PR12MB5334:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c9bbe90-b8f6-40d3-152d-08dbd161c374
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QZyNtMKbGC3SaVqsTKvoERqyycwjpuEJ+PULA7MYTPdbY5Ypz6wGAQIB13k0gkpxcOCXSoNCPBUiiHXEHmIdogdLp05ZntJpWqr8s+c0/R7CqTzJPZvQwMrSBV8acilEHnfj/P4bmQYz+VTHws+v+5FhWFlElLBucN4oFdVEjYEKhIaMW+9lHpFrytCWv396Mh1whzWe7PLYORBXA5Q8qIOX45xFaY6D7lt4HX2c3QMBHvROmeyu+sY8qQ3qal7N0krHi1szIEzl3DBFbcJaizdOaf9BkG0wW4YJZ3FgOCxd5ZBych/tstFXq6u8DMqTX6CSiSWEEIar0luo4scLnulzFDkG5bM3h03LutYb8/uR87pdvVnfdUT9PsZ+CNWIt+3DqdgW+V/VtzoY1bOqg062zlidN3SKXwhkPEUMc2r+5CKaegoyW5TPLD9oVChdSlUHlxCIyOQifmnETCrj2riOKEO7eGhzRHsy/twtmNyqYSjS09GdcoQvOMgU+KRBs+yE9XqIMt2ClgKSaivKROMAN0ZFRyZR/5kUKVqt9Ff1OmR+Sa3T9A2qytZKw9KQaDhmDWediqh54UtPcbzwVhQP5yWoHkmrOPSIyl5Ht3C7kyHGWeZDmNamDeWsPoQG/djoyPMYaM9Z91iPnoxk8N6aXTFZTXk+8v2gA6/xfmTEMk7w2Lly9RSvfiN49Ky99UCLFab3QlEUkUfvUfTIy/6gbLLV90YWrXenwTDEQ6b+ogpFdKId+cHZiBwf/hm3CJZK8URcjmoOV7q9NN+2Ow==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(346002)(39860400002)(396003)(376002)(230922051799003)(1800799009)(186009)(451199024)(82310400011)(64100799003)(46966006)(36840700001)(40470700004)(4326008)(8936002)(8676002)(44832011)(5660300002)(41300700001)(356005)(36860700001)(81166007)(86362001)(36756003)(82740400003)(83380400001)(40480700001)(40460700003)(47076005)(6916009)(6666004)(478600001)(54906003)(70586007)(70206006)(316002)(2906002)(2616005)(426003)(336012)(26005)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 11:43:22.3629 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c9bbe90-b8f6-40d3-152d-08dbd161c374
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5334
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHZmN9ryUT5Q6vVOmBBTcfYkVS7ZOh6l0CdEYrqAaNU=;
 b=ZWg+jdSnZkRd/zRyFjCXMFBZ2qLj8t0vU5G6RXzZl/9hgJ7fdLiIr5Ao1oQSqznrVMlOCT6cPnvRJxbJTg54dR+FEvldfdG24Kb/tVHmnf10eLAb6zRJakLLAh4C1fkQH8JyDbVgaTyBOhLr4KGQhD5czODb1jjLqVxfwz7r9Q8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ZWg+jdSn
Subject: [Buildroot] [PATCH v6 06/10] boot/uboot.mk: new zynqmp pmufw build
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
V4->V6:
 - no changes
---
 boot/uboot/Config.in | 19 +++++++++++++++++--
 boot/uboot/uboot.mk  |  5 +++++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 21f19db890..ef9e811764 100644
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
