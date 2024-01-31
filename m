Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9242C47DB3
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 11:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63317614D4;
	Wed, 31 Jan 2024 11:24:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63317614D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DYAA1iI5qnp9; Wed, 31 Jan 2024 11:24:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0ED961566;
	Wed, 31 Jan 2024 11:24:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0ED961566
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E5CF81BF5E6
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 11:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB5B982173
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 11:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB5B982173
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id on5poTfklNaF for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 11:24:16 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D06D980AAA
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 11:24:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D06D980AAA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xs9i+iTxY6EHAwxIyzmdHvdKz8GG7Tt65HoBsPaBicqrzo+P2gaBzC8Kekl7uwn6FikrhTqwo5NXSdd6Sbu5GtW036RVYBJ3Y5Xv5wdnq928EbX1fzeNVW/bXkTdaWkEGPr/rwW1Lx/TIQlblQex5pOR06PsFvmS9sPIXk6f3/hTvCIb+9fezrZWg08L9y3SpXXU8f1f/tMfcEjdW/AfNK4Zz8FVQDM58h4anuUVgMapuRJ9YVMpLckLwsIKLo9seBBuxSyzmxNYcAN5bwdrZOPyMtTkXAzLbEQJuJad+pjl0kXGlAO9B5gl7mNi3nHxJUyZAXd0FjddYWgg+QKkiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QI8mFSEDLZRVnHFuoiCZsW6a4wNfBrerlgRa1UhUYQ0=;
 b=EvMjCS4N6P9QL+q5Ep9SLJCxGPYnPuAH4qpUwvlOfOgu1BAU4X24tqj+dvr2jBapieCdpco3orPrxcX5esBMUpUoHBBtLiusoLiwBY8SYK4ZOe9by19XHcUI2mhiSVWu2JoFyvJ3yFZmFWs9TyOVIYQyii9Nliy83bR2OnHBTKj2dgNmxDzeAz/Zrff80zvsFjpnn+ZmZ4+K2JteLbgFw2VnGYhRoDbAcujnVfN3zBf5eLL2t7WJaMHVG99bfpe/t5fvYUykRg+HPYLneBOu5uzE743q3MrZ48OHe76VgIn9JS9xLRYS01nbC3DMtLGeOetz4Vf11ABfEizUywIw7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR03CA0069.namprd03.prod.outlook.com (2603:10b6:303:b6::14)
 by DS0PR12MB6487.namprd12.prod.outlook.com (2603:10b6:8:c4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Wed, 31 Jan
 2024 11:24:11 +0000
Received: from CO1PEPF000044FD.namprd21.prod.outlook.com
 (2603:10b6:303:b6:cafe::78) by MW4PR03CA0069.outlook.office365.com
 (2603:10b6:303:b6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22 via Frontend
 Transport; Wed, 31 Jan 2024 11:24:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044FD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7228.0 via Frontend Transport; Wed, 31 Jan 2024 11:24:10 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 05:24:06 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 31 Jan
 2024 03:24:05 -0800
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 31 Jan 2024 05:24:04 -0600
To: <buildroot@buildroot.org>
Date: Wed, 31 Jan 2024 11:22:23 +0000
Message-ID: <20240131112223.2175855-11-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240131112223.2175855-1-neal.frager@amd.com>
References: <20240131112223.2175855-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FD:EE_|DS0PR12MB6487:EE_
X-MS-Office365-Filtering-Correlation-Id: 81777aa8-75bd-44c7-f6e3-08dc224f25a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K/t6eK4RhurBwyz+65EOgRmMI3NRWUZWOKRq0QAXG9cFhir67ku4Z5UtcaWfurVjVT6QuXuB9+g/zFTwbygB88uVEUW/0L8w1ZwjlYamLzmsDrUhFr/nOveFj/ALHzOyRploy6WA1EQZnYDlkjCP5zwTKjYWyIbqLUivu1DVkMzX/6iQ54DC+FmUoDZbOFQmQZM4LdQJrjlpic5p4C9KkxCczO1TpXV63c1sXjRfFf5AhxZqmJZsn6M4UzAbDBDqWv4QbNRXfjE1zM2KAXg5MrcVvaSmS1eAiCiipTdx2ihIPRB79AWYJgH+yt4G0FlYQn1S3plbsmNdZGLDzTcNeAypvaiOi4DNP+HHjZlsmQkC1FKjlaa3Pn5njsAuB6V9nz2vYo9Aqhh/wizhpurbHo547z/HQ53+Tmvs/kVrhC2yYbfSd6psCBDqR7NwgVMWqMbgbrCQRYnmhpWs/VzE1rYd3W2FLmbpw27Le7jY+dKnXfq7ASCKh1S80bi5ufzPg6GKdHr4uCuCkspfOhrtsM6xSztSIEgMLYSGm0e9Z5XDx7UBJO07iUzIQYUFG7YsAVzAsiNzsD47bqE8U7HK5LKcOlV48Gj/Xq7gHECwBI9N0nKyfJvVf3iu2TM6pSFq7qwr/AK5kHj7VyFGUJexgnUV7auhEy+UMBpNQC154g18kouxdWr270/VscnMUj7G+L92adL3fqdCpxFFq7vuow+vi5nD8/MbDzD4ulMa8UGuJt0y97Uade31McW6jFGPaLP4XkqfTrMSgdeO+hNiXw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(346002)(376002)(396003)(136003)(230922051799003)(451199024)(64100799003)(186009)(82310400011)(1800799012)(36840700001)(40470700004)(46966006)(336012)(426003)(26005)(1076003)(2616005)(40460700003)(40480700001)(41300700001)(47076005)(36860700001)(966005)(54906003)(316002)(36756003)(6916009)(356005)(478600001)(83380400001)(6666004)(82740400003)(81166007)(5660300002)(8936002)(86362001)(44832011)(2906002)(70206006)(70586007)(8676002)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 11:24:10.6999 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81777aa8-75bd-44c7-f6e3-08dc224f25a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6487
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QI8mFSEDLZRVnHFuoiCZsW6a4wNfBrerlgRa1UhUYQ0=;
 b=22hOAOnrmqQFIu3jaHYsIebExJ1zq7tBQC2asD4Ij1chaEmyZBECYSJrxiDa74wWQsX8fH0wSHHvfGprI7IXy3h9IK0HBEUUUOZxeBfWDV0ywg+Mhyo8X2vEMNd/U9whMu8Pp9mRR1FZRiFt+7t0AJ773dsEsvzQ7caYexHN4IQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=22hOAOnr
Subject: [Buildroot] [PATCH v9 11/11] package/versal-firmware: remove package
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
V4->V9:
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
index e2c8fb6198..8d40a9b5f7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2249,7 +2249,6 @@ F:	package/binutils-bare-metal/
 F:	package/bootgen/
 F:	package/gcc-bare-metal/
 F:	package/newlib-bare-metal/
-F:	package/versal-firmware/
 F:	toolchain/toolchain-bare-metal-buildroot/
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 426bd7d090..8381c19cfd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -458,7 +458,6 @@ menu "Firmware"
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
