Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E60CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 15:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC1424051F;
	Sun, 24 Sep 2023 15:14:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC1424051F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3nfleJv214Lx; Sun, 24 Sep 2023 15:14:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB90241566;
	Sun, 24 Sep 2023 15:14:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB90241566
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D38D1BF3E8
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 15:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6642F81E28
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 15:13:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6642F81E28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rhdgMKseZxaN for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 15:13:31 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::616])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5004881E26
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 15:13:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5004881E26
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EHGRoUeq72iHXt/+o+FR5OBrAKlNxjG3+SysvWgTXKCc1GB9cu2raKBy7Hy440U0icV5k29ugpqLvD3l9oKRAeISIleTMSefSGkIw3h4crs7EaLRD6Rbb5AxkqNvQcyUhA9mw4X00Zgt6QcYHebfQUHN6l7FMnWUt+IcJLnT5zvOvwcGG2eKhoYNoGsDgxhzpEBhWOWJeRuMXurEQtRc/X4E7robV/qe23y3ga04OHbMiLPj9LnbkjHWGgiPayKTDlXc/6QbfHlgYJutz8JOxFkaDp3AIxAYHOeXaZSE5AsKxrYQTDneGiMHgaCE3pMH6bl01lUZKqS/gzDjwA7/AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rztjbgwRa9R6s1Pbt785rF0/u6/K1C1gpfrHqSrXs+o=;
 b=bTLDVBoeLbaHqVmtk2GZF9YryXhtfE+AxWzyqrmEb0QXq/wW4l53x5LP9Sq3Yj/Zdo0kjzoqlNuan4H1vuVPQFnN036Jo3vmLDbs0scYhKauE7PV2AUt5HyUt50hiEpmi0x9Kw3avU6n+u4m8nIn+mZhlTpGzQAURws7t5If5yE0jTdVI3MKb8JCjWiCINytYpzjF2ddTtBHa49PCXFjmIHpY/02n0R6A96jBA1mbJBgsFxWjieQB0J2Jil3oCVIrMiXiQSlrbVAnI5FB7QsfK+vDRvZxxOP/mQPTsoppWcgw2gEWvQIPJDM4yqsfwo3vuEW5lrv1avyhgQFAHb1jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from BN9PR03CA0455.namprd03.prod.outlook.com (2603:10b6:408:139::10)
 by SJ2PR12MB7963.namprd12.prod.outlook.com (2603:10b6:a03:4c1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.27; Sun, 24 Sep
 2023 15:13:24 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:408:139:cafe::fb) by BN9PR03CA0455.outlook.office365.com
 (2603:10b6:408:139::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Sun, 24 Sep 2023 15:13:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343F.mail.protection.outlook.com (10.167.18.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Sun, 24 Sep 2023 15:13:23 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sun, 24 Sep
 2023 10:13:22 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sun, 24 Sep
 2023 10:13:22 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Sun, 24 Sep 2023 10:13:21 -0500
To: <buildroot@buildroot.org>
Date: Sun, 24 Sep 2023 16:12:05 +0100
Message-ID: <20230924151205.2099293-10-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230924151205.2099293-1-neal.frager@amd.com>
References: <20230924151205.2099293-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|SJ2PR12MB7963:EE_
X-MS-Office365-Filtering-Correlation-Id: 6db10269-a5f4-4f24-7593-08dbbd10cb79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /iivzZCy3IodBBGYRska36HwuBi9bRcLxpiesi6f2krANrFl3pfzoj1iBsdN7r7tGt5awyYCzwedkBhHWwd2BFDgtj+I8usCwfcPtGDnnR9DjLmeZsG22vlgn1UizUU9m9W4uSyBmzD5JaC1l9QBXg3EfvzHbdn0OMmK5ZZVXAAmas7FhVH7NyrK6ve0XT2qw1ZZHAxzl+uESgMosWSyXV0nW1nbCj02uWkboqAyLk8lXultRkrBSOmTuPNYW60fzfVm7+m9d5jqGnKXXxSJL+oLSRYMkZZmVCItHoFUnGb7HOcQjkZX4HwD12/Wtjy3J9AEm1deTv/+KVXlgcqkfsz8STNda675jB+y8mtyPBEQ6+gjHKdkPgYmKceLlC7ba309Dx2eB0zpi7ws7rZOP/HO3BG7AnnunBd9fdesmCA39XHtN+oUHOinCCMAzKOAbaev5v5UgTRJGOCiHfDqa1PaCG0VsxgZ61969bBvNhe8e7bAFVNAm38Li6vKbJ84XAq8vgEDNtzqw6b3m6eIqYOiR6auicgZlGYIB20gxLHAXfBdx8nL6fMRSIFYuHLMOd/63G4Pn9akkyYsqPWSaJRbmVdVGyL2osHB1ikFFrwtKS6mIJIIT1wRPk/bFbKzVcAZhc7xgIPPg9bVgjTz2ikRkdXpPTGC5NayYuluouqgP6Emc0pLSXhz2gFojOEziRUkZOzm4csknXIKb7L2YrLDPHurF3xjmUOZ2820uHJMHnwLRtUwGLyszLiUzWy3JMFfvWOpOEDIdP9yWL95aA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(396003)(136003)(346002)(230922051799003)(82310400011)(186009)(451199024)(1800799009)(46966006)(36840700001)(40470700004)(316002)(54906003)(41300700001)(8936002)(70586007)(70206006)(6916009)(40480700001)(8676002)(4326008)(2906002)(44832011)(478600001)(40460700003)(6666004)(26005)(5660300002)(36860700001)(47076005)(83380400001)(36756003)(336012)(426003)(966005)(1076003)(2616005)(86362001)(82740400003)(81166007)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2023 15:13:23.2980 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6db10269-a5f4-4f24-7593-08dbbd10cb79
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7963
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rztjbgwRa9R6s1Pbt785rF0/u6/K1C1gpfrHqSrXs+o=;
 b=P9rjQauLh0fIM15YjmMfGjiyr3S05emMbJ96A54YM9FYM4V20Eur5989iV0vGntP4bEKEoAz1iECYXYZ0tSjcjeazQfmuqg09V1i17zPtuy7OSfTuWLrbuD+gio6L9kzi0KxQE4vL70vqemj2qV+49xUu+ybcbSerHHixfZXO34=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=P9rjQauL
Subject: [Buildroot] [PATCH v4 10/10] package/versal-firmware: remove package
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
 DEVELOPERS                                 |  1 -
 package/Config.in                          |  1 -
 package/versal-firmware/Config.in          | 24 ----------------------
 package/versal-firmware/versal-firmware.mk | 21 -------------------
 4 files changed, 47 deletions(-)
 delete mode 100644 package/versal-firmware/Config.in
 delete mode 100644 package/versal-firmware/versal-firmware.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1c66659b19..1c05a3e17f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2190,7 +2190,6 @@ F:	package/binutils-bare-metal/
 F:	package/bootgen/
 F:	package/gcc-bare-metal/
 F:	package/newlib-bare-metal/
-F:	package/versal-firmware/
 F:	toolchain/toolchain-bare-metal/
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index e8dbadadf3..55316edc7c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -448,7 +448,6 @@ menu "Firmware"
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
