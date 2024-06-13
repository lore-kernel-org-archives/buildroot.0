Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FEAC27C78
	for <buildroot@archiver.kernel.org>; Thu, 13 Jun 2024 06:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E2B160B89;
	Thu, 13 Jun 2024 06:15:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q08suBLKiULN; Thu, 13 Jun 2024 06:15:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2635060B50
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2635060B50;
	Thu, 13 Jun 2024 06:15:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7DF6B1BF35C
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 06:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77BCF408A8
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 06:15:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zi3TUnmd95JG for <buildroot@lists.busybox.net>;
 Thu, 13 Jun 2024 06:15:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2408::62b;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F2B094089E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2B094089E
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F2B094089E
 for <buildroot@buildroot.org>; Thu, 13 Jun 2024 06:15:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNu8NiX0QHW6sUz9kQ6OtvtEAn+S4aTIqwpEV4RQ7XvQN6f4aGvPKhRh+BRt7tFXZiUTQ9cyRsV0Upv+bmwGGQ9Su4LwPQS5VVeWp5vF5DI7347gPe4FCUqXh5Z5XRbjxI7+Ue9qHoi8Jc3I0cEK//HZQlsziZSlW/iMC2p7gr1bgHa2iN0+cAbXYDKCEcskFaCNg9beCP6f+MpLdyKijN1FSgPAcbVFtTG3qOp+rnHDNl7vdH3XSDKr29KrL/dxDmQldyhwtYxnnKnkSDtpphGtpbvFLzTciRQWK6fQ3VHjLFO+1rkFl3bGhvOSIUJGcNMA2eLHnoCDRVSUTNvsjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mG4Q5WrQA71u+V5v0v25gGa94m0jBuCs2yxM9DHjN5c=;
 b=cdgyEBudaYKbhPKeoQX6i3WGD0eVfP5Sd7XRCCMPikDeZRSmRe37kP7h7IYGUVJZu+4rOZNAULv2RuKG7G4s3ZwxHikqYBPTgIiCie+mE33Xia8Vvw+XnpFr4rpyT2fih+s/BHBlQzRwJiiHqQ62SFU4hb2ZVuqSYKycLP/iAPJ/oGI08yfMOgtzWhdZzorn3EtN3jQ1RnXxOX5Nxl0ype1EbnIWrwQKkkK/CapulE05+IrWACWI5C8Gf5a2YuSAkFlpOSscKoPyUajnNaGKnXUYmkOwXKobIowMKSlu9ypaJNAgAbv0zxf9xc8POhaKPSJ7mN/lfdYVD3LwMhrWoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DS7P222CA0030.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::10) by
 SA1PR12MB8700.namprd12.prod.outlook.com (2603:10b6:806:388::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Thu, 13 Jun
 2024 06:15:01 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:8:2e:cafe::3d) by DS7P222CA0030.outlook.office365.com
 (2603:10b6:8:2e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20 via Frontend
 Transport; Thu, 13 Jun 2024 06:15:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 06:15:00 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Jun
 2024 01:14:59 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 13 Jun 2024 01:14:58 -0500
To: <buildroot@buildroot.org>
Date: Thu, 13 Jun 2024 07:14:23 +0100
Message-ID: <20240613061423.1737631-5-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613061423.1737631-1-neal.frager@amd.com>
References: <20240613061423.1737631-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|SA1PR12MB8700:EE_
X-MS-Office365-Filtering-Correlation-Id: e329081a-7623-4920-f462-08dc8b702869
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230034|376008|1800799018|82310400020|36860700007|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jiSwgEXgekF+Z99zQWCJp4X2bmvAeFa64EqKCdS4O7YYZs2DEgbDNnlVN8mx?=
 =?us-ascii?Q?ijB5XDp3LrVt18q62WnknWCy63V4SWIwRs+7o6Vk3izGEwYbnXqNVb2aGqW7?=
 =?us-ascii?Q?S4MGPG0wAPYlNckvNiuebYBYfqHzhAbDkbMrGAjI6wLv4JVCycHDFHjsDnsU?=
 =?us-ascii?Q?z8gzaRrnp4jEZG6v9d0kDc0EAveDP8wuyDBAb1F/eIpcOkbwgfYOHhymYRQ7?=
 =?us-ascii?Q?+D8sxqex5y42tHX0Mfn2ZtqBU2EvHfBMiwdQS/RMHPsHHKYezoiMshtwRkcb?=
 =?us-ascii?Q?gk7bO9ypfL2t5oLxux1TvdskKb1qQ8N+MNfqaxuszVAhRAH/FZLSWEyFGZOR?=
 =?us-ascii?Q?pkelAVKUitnLN8RMHIIBs8cVM5JrKruuptIQl+0Woh8klJrRHJPYhF4nuqQx?=
 =?us-ascii?Q?2PstO4JK3mMk5jso/d0jkU80vnbqQ8nxQ/dTY/aR/5kUgQSYZfx9yDkXFuWI?=
 =?us-ascii?Q?fNVezx2/nPAZKvmFggBQFcWBI9Nx0g4o2mKt/5ogIKuZlL+6sx5VGW2ukZ/Z?=
 =?us-ascii?Q?RL7Ivtyu0CAqTJtqJ9sJNEknTetQYlyHqHAVWpts3Zz+WOjz2Nx5c8f181G4?=
 =?us-ascii?Q?OJbO/+votTOtTCO1z4SGw96pEdLf81dxMzQpjghP7LP6yeZh/v2oPB8YTyeF?=
 =?us-ascii?Q?2tfA4SMgKGOXYeMcNBk+D7vjmc5clFZlj7H7ZnkRVuMLTPe/04PnExKQeTkj?=
 =?us-ascii?Q?/xWXULCQZcTGRAkbabhovLBwrsVzN8XEYY2N04EDcrWBWJPb+ZaE3IoWRfRL?=
 =?us-ascii?Q?KVKAkYK8aCIvWNderTFkdh5uVVyASXWAXO5y8OhjZGwPH9hB8w3ZUIkyJ5Np?=
 =?us-ascii?Q?nFwoxOIuZB5HRKm5NrUKD8ZkDf0CJyzpwWCUGZY/ZMAhdCs1DcVLQTmo919q?=
 =?us-ascii?Q?NgUKBsjMkeiFQMNDwE7fCSA/3gO+sebNOeQC4+vQ35F056oAF+O7Ot/Khnnj?=
 =?us-ascii?Q?qnz2Myr42WIomzhtRxmWklgmUQ6aJZk4ApnQzSdp1uOBuMEssKVbcKf9FNLi?=
 =?us-ascii?Q?fANjx4qY+6vM8MeSjB70txSNFiApu66BYsE+TPH13PdYUwAxuaZmrctkteqm?=
 =?us-ascii?Q?Y4/VARnBa24A8oFMq3BBxqU6PUafvDFtIpadY48iRRhKD0SnCKrs1gRZHg1U?=
 =?us-ascii?Q?pjV0g4I2GAA+U+Ae8mhBr22AfOcyhl8ldyUvvgWsGO3Xomfmu+emYCYpg/YD?=
 =?us-ascii?Q?Fv1tt+IkR8VGi6Db+KrH/sqtzIbQovnapVrPewQS9MyuBzyM0rmi2yf4TdY4?=
 =?us-ascii?Q?m8jdA4EQX28IdtRwa2uvayPLaXP0Q6jgRBFlw5DsKG4alfZFZ8YxvC7sC3Js?=
 =?us-ascii?Q?VmLkw2VLysdqwiWX5kPlVw97WC+35Hr3Z6duhOSYX5M1UibzyHh6yCiirpfz?=
 =?us-ascii?Q?S4fG9Km5yNKOTTXzMFWs9s3RfQO6mQiTK+lsoZz3GdHTpC0/npLPFtL2Y8ta?=
 =?us-ascii?Q?vFbUgPFvZ+0Lo3WeWmyJQgsJDCAGOVmU?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230034)(376008)(1800799018)(82310400020)(36860700007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 06:15:00.7585 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e329081a-7623-4920-f462-08dc8b702869
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8700
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mG4Q5WrQA71u+V5v0v25gGa94m0jBuCs2yxM9DHjN5c=;
 b=CxZklGamoekeGI5UJXQu20yAQaQAzw7LwPIZQ/ua6f1ch7piWSjJzgH8d3Zu96yGJdQMvgM2VbbunRniZCA3A6vVwfKcYyz/NZMpDMxpTVaqGaqch3w4ahICyxezURt+LxNZlpPYc55XcuA1VUKnIXA4En7doIno0EcWOzIp5S0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=CxZklGam
Subject: [Buildroot] [PATCH v2 5/5] package/versal-firmware: remove package
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

This patch removes the package/versal-firmware as this package is replaced
by the boot/xilinx-prebuilt target boot firmware package.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
 - no changes
---
 DEVELOPERS                                    |  1 -
 .../versal-firmware/versal-firmware.hash      |  2 --
 package/Config.in                             |  1 -
 package/versal-firmware/Config.in             | 24 -------------------
 package/versal-firmware/versal-firmware.mk    | 21 ----------------
 5 files changed, 49 deletions(-)
 delete mode 100644 board/xilinx/patches/versal-firmware/versal-firmware.hash
 delete mode 100644 package/versal-firmware/Config.in
 delete mode 100644 package/versal-firmware/versal-firmware.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 93627a0064..e5706e493b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2352,7 +2352,6 @@ F:	package/binutils-bare-metal/
 F:	package/bootgen/
 F:	package/gcc-bare-metal/
 F:	package/newlib-bare-metal/
-F:	package/versal-firmware/
 F:	toolchain/toolchain-bare-metal-buildroot/
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
diff --git a/board/xilinx/patches/versal-firmware/versal-firmware.hash b/board/xilinx/patches/versal-firmware/versal-firmware.hash
deleted file mode 100644
index c4d745f22c..0000000000
--- a/board/xilinx/patches/versal-firmware/versal-firmware.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  7abcba4e0e44e3a4adf9c1f971d918575226d7604dfd64a386baaa00c1c6c35f  versal-firmware-xilinx_v2024.1.tar.gz
diff --git a/package/Config.in b/package/Config.in
index 1b6a5b0dab..13af2978dd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -460,7 +460,6 @@ menu "Firmware"
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
