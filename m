Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CFECDB47E
	for <buildroot@archiver.kernel.org>; Fri, 20 Oct 2023 11:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFE9270497;
	Fri, 20 Oct 2023 11:44:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFE9270497
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hg1UfCUYmvgL; Fri, 20 Oct 2023 11:44:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFB49704FC;
	Fri, 20 Oct 2023 11:44:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFB49704FC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D5EB71BF3A9
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 11:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACE3D41476
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 11:43:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACE3D41476
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id blDgYTQl9QWC for <buildroot@lists.busybox.net>;
 Fri, 20 Oct 2023 11:43:27 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::628])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DBCE402A7
 for <buildroot@buildroot.org>; Fri, 20 Oct 2023 11:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DBCE402A7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DuH05zYpBd5swvfmJ75YtOY80/Vwg8zv0MI41of1+yzIOhWbBabjxv6O+fOBV3RNHOd4EMsRS7XIQYQ1MC3T7FnnB99CneqwPiYTyGa+XAuFkCisqZCZq44QtLj2fJe4CJKvHxPZKXbF7G+eUio+1k1ULFB3HzpgYyOs0KiDGrhRL/hGeM9KocsFeWETh4FI4bLzZPSWdIyD/SPE7XM47Xlvotfeum6TVHRYU2wuecraBp7K7boBenuBxhABftSVYPtc8wTYILdk1c6S9hPrEcfL3CLhe90tZpBIDrRPwPWgSLp0gVdAqdwRAn7rEJ2LWRqfgapFUNRX4+4STaIUtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4aBu2LDg+WtrsuyAvLSAAEFFQDK4ou9/ravGm+HLTkc=;
 b=kizktxxzH10A6zuGoD4aI8v/B/sZgnpq+rJtlZKsUteJ4psT0fvAxFkmC5DAdtV/iq15rFNg/wNHhQHgAssHHq05uQCHW/us/pX5EYW8uwsXRV89IqWX8WnrNMtgDnSKsX+5ZrOglGXtpIW2MxFACoZaqYy8/+9ebjldUOUKtCoPqoqK6iE1Qr+JgkwrcFcqhCrLrLH5pMIFnzr3K4k4gNmyHGvxmzHOP2L001afdPC9joWpQkOnPhmay0+0Py6fX8FHtJlV51pSRu/yFj7v+U/stqwYL98p574eJRpH3HHMqWa+ue7prJXoQWctily/d7VydFWKT5vwpShLMXMRSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from SA0PR11CA0018.namprd11.prod.outlook.com (2603:10b6:806:d3::23)
 by DM4PR12MB5199.namprd12.prod.outlook.com (2603:10b6:5:396::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Fri, 20 Oct
 2023 11:43:23 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:d3:cafe::f6) by SA0PR11CA0018.outlook.office365.com
 (2603:10b6:806:d3::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26 via Frontend
 Transport; Fri, 20 Oct 2023 11:43:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Fri, 20 Oct 2023 11:43:23 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 20 Oct
 2023 06:43:21 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 20 Oct
 2023 06:43:21 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 20 Oct 2023 06:43:20 -0500
To: <buildroot@buildroot.org>
Date: Fri, 20 Oct 2023 12:42:36 +0100
Message-ID: <20231020114236.4129636-10-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020114236.4129636-1-neal.frager@amd.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|DM4PR12MB5199:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d2c893e-89e3-4d58-0f96-08dbd161c3f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 20DFILXyOPv7K/n135sRHX5pZjKnPLdT1wBYNT611k6mfbXrZg4noRdUeUloQ9YFfHcS8N0EgtmjGyy3Fg8KGjGoqkXgPRWvt3s+WU9doZGweNfNCPeiOgKuuxnuv8pMXTJcecp3esLZ9coSO1hxmUhhhfnsT9mKSdj4MpcI6wEOVeL4TfjGAoUv8xQz1XK/U3oN0FEC/zZXV5PIwsFywTjEkFR5nLQlmMsvWOU+gEbRhL9je3ZZlJKTdoFsqGX1KjnB7AuGGKG3JONwx3KigW0UJ82eLayErgJKxp404NyTMgUnpPpE++RF1eBSRUVk6daiqmNFA1Rc/aAIZxONjN/fa0tYth376AWFhIfxAav4bsSM8DHvzNfiIVdDA8UH4nUbQvHv5qLugStdo2Rh3rQjiJYEkzQtYXc4DSEGkFhxU9OLsLABIPN7z72GJvZzAkoN12ohwVoY3A4GnmEB7yOgeb79ViJhfVYyO6LaTVipVydzhi4+iYNbGJRMoSJGxz5U29E0DOxPggKyEn/znthcps4o3yGKDDzFl9bsRhU6bY2pt3OG3pR2wJ8nRnojmdI0PdHvtmMEqg29OLHWt9wkkr6aRqPeWDXAS9ykUtD4QkAphp5nNMx/OMIMWl6weLOY7zdL5pH8UHwen/lv9uVlx90C2SYxyCKzVlY/Qhf/gPRN2JOoxe3wp0aQZxNZaoA3r0lXR8Of5Yt1HJrujvgSH7Q6jWhOAkZOJAD9oBprD3QILM+ZbYPLq7kGhL572JXW6HfPOZl9wFOcoU3GCQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(346002)(136003)(376002)(39860400002)(230922051799003)(64100799003)(451199024)(82310400011)(1800799009)(186009)(46966006)(40470700004)(36840700001)(40460700003)(40480700001)(356005)(36756003)(2616005)(47076005)(44832011)(86362001)(2906002)(1076003)(83380400001)(26005)(82740400003)(426003)(336012)(81166007)(36860700001)(4326008)(41300700001)(5660300002)(8676002)(478600001)(6916009)(316002)(8936002)(966005)(54906003)(6666004)(70206006)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 11:43:23.1754 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d2c893e-89e3-4d58-0f96-08dbd161c3f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5199
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4aBu2LDg+WtrsuyAvLSAAEFFQDK4ou9/ravGm+HLTkc=;
 b=vhFMHakJo3nTYC/MB1WAtZcSxSuhpKpwfyGUUxuq4QtJgfHcsRP5aTclcplOmsppqKhlNyqszvbT23EqZCZGc/blAarl6Q4yjrnjUBeLWG4fGEwfUSN70ILWAspkZVXqEcBCucpGyrXZPG1CUb2BdND0QOcToaDcYKsj9TJgsCw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=vhFMHakJ
Subject: [Buildroot] [PATCH v6 10/10] package/versal-firmware: remove package
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

This patch removes the package/versal-firmware as this package is replaced
by the boot/versal-firmware target boot firmware package for versal.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V4->V6:
 - no changes
---
 DEVELOPERS                                 |  1 -
 package/Config.in                          |  1 -
 package/versal-firmware/Config.in          | 24 ----------------------
 package/versal-firmware/versal-firmware.mk | 21 -------------------
 4 files changed, 47 deletions(-)
 delete mode 100644 package/versal-firmware/Config.in
 delete mode 100644 package/versal-firmware/versal-firmware.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 087093a59a..ff58a2b514 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2209,7 +2209,6 @@ F:	package/binutils-bare-metal/
 F:	package/bootgen/
 F:	package/gcc-bare-metal/
 F:	package/newlib-bare-metal/
-F:	package/versal-firmware/
 F:	toolchain/toolchain-bare-metal-buildroot/
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 4e489c4706..228e9e2416 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -454,7 +454,6 @@ menu "Firmware"
 	source "package/sunxi-boards/Config.in"
 	source "package/ts4900-fpga/Config.in"
 	source "package/ux500-firmware/Config.in"
-	source "package/versal-firmware/Config.in"
 	source "package/wilc-firmware/Config.in"
 	source "package/wilink-bt-firmware/Config.in"
 	source "package/zd1211-firmware/Config.in"
diff --git a/package/versal-firmware/Config.in b/package/versal-firmware/Config.in
deleted file mode 100644
index 01daefd204..0000000000
--- a/package/versal-firmware/Config.in
+++ /dev/null
@@ -1,24 +0,0 @@
-config BR2_PACKAGE_VERSAL_FIRMWARE
-	bool "versal-firmware"
-	depends on BR2_aarch64
-	help
-	  Pre-built firmware files for Xilinx Versal boards.
-
-	  https://github.com/Xilinx/soc-prebuilt-firmware
-
-if BR2_PACKAGE_VERSAL_FIRMWARE
-
-config BR2_PACKAGE_VERSAL_FIRMWARE_VERSION
-	string "firmware version"
-	default "xilinx_v2023.1"
-	help
-	  Release version of Versal firmware.
-
-config BR2_PACKAGE_VERSAL_FIRMWARE_BOARD
-	string "board name"
-	default "vck190"
-	help
-	  Name of Versal target board.
-	  Used for installing the appropriate firmware.
-
-endif # BR2_PACKAGE_VERSAL_FIRMWARE
diff --git a/package/versal-firmware/versal-firmware.mk b/package/versal-firmware/versal-firmware.mk
deleted file mode 100644
index 1ced259be1..0000000000
--- a/package/versal-firmware/versal-firmware.mk
+++ /dev/null
@@ -1,21 +0,0 @@
-################################################################################
-#
-# versal-firmware
-#
-################################################################################
-
-VERSAL_FIRMWARE_VERSION = $(call qstrip,$(BR2_PACKAGE_VERSAL_FIRMWARE_VERSION))
-VERSAL_FIRMWARE_SITE = $(call github,Xilinx,soc-prebuilt-firmware,$(VERSAL_FIRMWARE_VERSION))
-VERSAL_FIRMWARE_LICENSE = MIT
-VERSAL_FIRMWARE_LICENSE_FILES = LICENSE
-VERSAL_FIRMWARE_INSTALL_TARGET = NO
-VERSAL_FIRMWARE_INSTALL_IMAGES = YES
-
-define VERSAL_FIRMWARE_INSTALL_IMAGES_CMDS
-	$(foreach f,plm.elf psmfw.elf vpl_gen_fixed.pdi,\
-		$(INSTALL) -D -m 0755 $(@D)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)-versal/$(f) \
-			$(BINARIES_DIR)/$(f)
-	)
-endef
-
-$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
