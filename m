Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA2DCDB47E
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 15:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 617DE82907;
	Wed, 18 Oct 2023 15:11:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 617DE82907
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JH3d-y-PF6_O; Wed, 18 Oct 2023 15:11:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6280481DED;
	Wed, 18 Oct 2023 15:11:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6280481DED
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7F5681BF342
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 15:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4296241DE1
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 15:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4296241DE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RIeGhD75wd7o for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 15:11:00 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::60c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D3A6417B2
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 15:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D3A6417B2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Px1Foc8u49bhpD1+CXYsOO0+UJSIxT05MnFJB502NYdRGp517k+eGZStye1yzL+qgEaaEJC7+vKKmiVzCAq8Kjhnea8NiemLfnEzzD/IMPH6uytBHPD3Ue3j9HIoKusHVjxDbRFx0fsdiBSUQX/I/UoffCaSVAFMZRcZRlW14X6vs8YdGb58LOVEWqQnj3dLQgTaF2Ni1Qytik4ebgBCYjVL9A9hzrKtT82WvvBlIJWKFk9HfUpM+/HggNb12jv05PImUIDUzY1hdtjaojMqhV1QKjJYln91zjzhevHnaC0sIhQCuFqjcEMiehSCItoWETSOyERL97iHfqjnBGaYMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aF/eVMqCkM1VnPu6bH/cYUt+JZNLaE2HX4zWq/kTnFo=;
 b=DpBXT3ENiGEgiYwIw9YqHx9z+W7EnBAdvRiWk/cZLiNqBX5rImRaTwk7yooiNTxyYov7ZvPamHPpi2UBXn95caNNLDqiB8CwykyLuMkYCQogqLY22J3D36z5zY+yBjV5r5pdINj38y/FuvVyQBqXoJJKUIDh3odyr6MbdOuuxuF8ioJ4grIR6vo2IHl6qWnDQ0ERYqyHMtOLUWuffREkEFBzzbUT1HxCL8EkDfnI/YObx8P0wtorzBV4RYceGCW6QU/H74vrGv7vA2s02lgFG5w4Nm1GMc4LzngXdf076lLVlMNdPAup7PGy1lNsOcTK4f/nvnRGdcnapqzN96oE7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from CY5PR15CA0111.namprd15.prod.outlook.com (2603:10b6:930:7::25)
 by PH7PR12MB7428.namprd12.prod.outlook.com (2603:10b6:510:203::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Wed, 18 Oct
 2023 15:10:56 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:930:7:cafe::1f) by CY5PR15CA0111.outlook.office365.com
 (2603:10b6:930:7::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23 via Frontend
 Transport; Wed, 18 Oct 2023 15:10:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Wed, 18 Oct 2023 15:10:56 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 10:10:50 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 18 Oct 2023 10:10:49 -0500
To: <buildroot@buildroot.org>
Date: Wed, 18 Oct 2023 16:09:32 +0100
Message-ID: <20231018150932.3961564-10-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231018150932.3961564-1-neal.frager@amd.com>
References: <20231018150932.3961564-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|PH7PR12MB7428:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ea76e37-b58b-4729-fb5a-08dbcfec6de7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TvN18RcPbUZDKzqadkrf1qKC8RMvagtGMih74HUVkNETn3Ud4J2dKiv7fq7M4zPm81VMcQqDeoDsxLo48ZqdzWYJ4Krf9eJTxqVMvUm2utkzxhEwJOOlrQB9iXxNKMvHXMOYUUog4bf6o9Omu/9yimvTyQKAmbF4POW2UmyiJ8BVw5NCePx/ngQK1xf9YXwmK34u6PDbHPfEn6D/f1oHsy2v9eowwBIQye65LbP6oZakTv+L7EhSaDk36SSWoYUVwetrjKQKV6YYtkN2op/Ie4VutmyJU9bbJqtKAmCfKGVolS+XqT1r4vUjE25kovbfHDyDeWPFQNC/RYMr7iYZ8jpQsQG6kLi5JEQyo2tIdO/0pHLLVSKYxK12G+G37HP9dniPdyn2Y43q78c0xUj1aN37N4f9LGom5E0dRCS0URJaCXhEIMWJtAi+BwZWg6itunR1fA7iieapbLdNjurY9qWwhRAofwgjw0ZCxGnMQyJb14En252vcQ2kUFMRYUuwIrjiZ3q8GqZYb9bcbTrg1l5VK1HuLbywKtdfhmVTMmp/VOKgp5Inm4apEsGkeYI2+I/OdrOjTap6DQCxJsM0MEXgatRncdifSy+Q10LOyB8Lm+Oak5MmjOlumMr7uvsBbM6lj2U9CmGEJHMMtlyisYuQpv992+WZJCapevcDSDHJbq67iBU5IluPH83kkHqHJ/O/tJRdFRV3/vylQGuB4kaGVpUd5omi8BDmUVPNGpMDkCnLx2q23yvpO6ySR6vwXsTzGKfywrVVr+Ml1TQAZQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(376002)(396003)(346002)(230922051799003)(82310400011)(64100799003)(186009)(1800799009)(451199024)(40470700004)(36840700001)(46966006)(47076005)(36860700001)(83380400001)(1076003)(2616005)(426003)(336012)(26005)(81166007)(6666004)(82740400003)(478600001)(966005)(316002)(6916009)(356005)(54906003)(70206006)(8676002)(4326008)(70586007)(5660300002)(44832011)(41300700001)(2906002)(36756003)(86362001)(8936002)(40460700003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 15:10:56.5270 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ea76e37-b58b-4729-fb5a-08dbcfec6de7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7428
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aF/eVMqCkM1VnPu6bH/cYUt+JZNLaE2HX4zWq/kTnFo=;
 b=pfIt/DToxMpDG2wx4I9vK/rqNGOVI17Ahcj8E8KLe+f2N0MgvqNRFTcoQbjiYhtbEkmh1aP5AqwwU+UmRiY/WhdZ7gnY5iodaCwMi8v0t1t1dxI/4tTU/d27a9c6F41ew7k+QPBb0ty5EbuLYk4ZQ9gyrZZE1quZK+ASHxGeYUk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=pfIt/DTo
Subject: [Buildroot] [PATCH v5 10/10] package/versal-firmware: remove package
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
V4->V5:
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
index 9f9e36c674..fc16d24c73 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2209,7 +2209,6 @@ F:	package/binutils-bare-metal/
 F:	package/bootgen/
 F:	package/gcc-bare-metal/
 F:	package/newlib-bare-metal/
-F:	package/versal-firmware/
 F:	toolchain/toolchain-bare-metal/
 
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
