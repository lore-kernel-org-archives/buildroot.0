Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6AFC2BB3F
	for <buildroot@archiver.kernel.org>; Mon, 20 Nov 2023 14:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66C158121E;
	Mon, 20 Nov 2023 14:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66C158121E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7lfg9A9rr8Ad; Mon, 20 Nov 2023 14:10:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89438818D0;
	Mon, 20 Nov 2023 14:10:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89438818D0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 58BB21BF5B3
 for <buildroot@lists.busybox.net>; Mon, 20 Nov 2023 14:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31A6560A9D
 for <buildroot@lists.busybox.net>; Mon, 20 Nov 2023 14:09:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31A6560A9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nXN5rJ7tJP6M for <buildroot@lists.busybox.net>;
 Mon, 20 Nov 2023 14:09:36 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::601])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 420D360A92
 for <buildroot@buildroot.org>; Mon, 20 Nov 2023 14:09:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 420D360A92
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=izoxqKDvQ4GpQu2fUmmEbxqvm1EIPRZ4+Mp5356lVq6RSZxMFT8GkzHpUGpGvUe0Se1g3WADp1TIYEESRMu2miscJNle2xy4smnOzd2An25zKvT6dhpOAGDv5y0eZCcDPmLlijK6KhVMFz4bipXoPxmKPDUur3rgiToIHQ1VeefeGuWLVLC6xARRECGq8PbBUPvk2e/P2sKP/p+251HTobyacegNKrt2GrveVPvTjzMPBVZt+1FwrAkXT8jYAO2g/WYtheAvFQLl9xoC6QcmDsuNiwUdM/9NacP+0zfd4y9uMDtng6V4GLQa68S7b5aheCC99rWbvFsu0NTS4+xp0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tIFzj4+YRGUJdKXR2s6WJ9iP7pYue4+TQNXhw5oDWk=;
 b=gsgbCD+5tWRay/CpjVNLTynwkpRrNFA+AN8NdMk03nqBHwTzndGrUO3pXFbIHWWE8T/jWlvnF0hWawyh8ZL/X38mUHVUB2Pdd1VbbQIgmuf+jeOMn/IIM+Qu9Kv0bNrtWycMJ1sO1h+gASko7rU+aj2clng2Q4l6VQcPfrV9YjQhHj6tP19+bf/b9VbXzx/n8OMB26xT5VIGIvio7mkY2tEThLg4elgOhbG5fAOYnch96kkMNFCU7KFcbd9q/40PHlmpF7rz1if93pGetwSXJFQ/v0wngkRSLkNRsf7cbLoTsy9bN07+FmCgFlAcS6ROOE85NTXeDIqqX57KcKB1Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0021.namprd03.prod.outlook.com (2603:10b6:a03:33a::26)
 by DS0PR12MB6605.namprd12.prod.outlook.com (2603:10b6:8:d3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 14:09:32 +0000
Received: from DS3PEPF000099DE.namprd04.prod.outlook.com
 (2603:10b6:a03:33a:cafe::7c) by SJ0PR03CA0021.outlook.office365.com
 (2603:10b6:a03:33a::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27 via Frontend
 Transport; Mon, 20 Nov 2023 14:09:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099DE.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Mon, 20 Nov 2023 14:09:32 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 20 Nov
 2023 08:09:32 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 20 Nov
 2023 08:09:31 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 20 Nov 2023 08:09:30 -0600
To: <buildroot@buildroot.org>
Date: Mon, 20 Nov 2023 14:08:28 +0000
Message-ID: <20231120140828.1903865-10-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231120140828.1903865-1-neal.frager@amd.com>
References: <20231120140828.1903865-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DE:EE_|DS0PR12MB6605:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ea25a57-b826-49a2-b54c-08dbe9d251a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DpYdDDylPKU3BLu2Gs7ZDvYtGtsCz9Cwn8eLJF4i68MkpefdfxwOIv2AZB2rAdkFb2CHrcmdswmYQh32BC8fjJRHSOIJfD5/u/Zx1jzD3ptWNkUNRd4jLCnKr5AduE1qAyEmtNlukCROIIUiso91lSmnNv2TFJmTMc8QSC4m/cUTjiQAiUa/1wmaAUNGXHY3Bj0Ua3cS+68MyfqrSDA9Aw8oeWVo4qWImvlUW2rtW89c3a18v5rLvg3eaXpGUCi41G72NrDTILxkWg+aOZMpCNkM5tfQw4te3LV2fd1rrEMVr2kznVj9VPUdVnFoROU4w938GjwMMlF2u0XBZPa0k+Cgd6AQiOyPyxJ9aATUgYk/BbLrnt400nBrMiPooddHmcL92KrwLcdkVWl3cbpkdEUQFExKuWpIOrj67rBUqhi+kFDpzZnL5gaO2DEeJ1srm2Sbre+GoDjrMkUjUCCQDMcStPgx+wzXOKT1UE/WLpYKHDEpJ4JY5j22N8SiJMMrXc5y9qcxmpvn53Bzlzl4kPuis0UbhVajsiIHMSnq72iuuEbcYqw5YgLjCHqMEN0un9PKpYxWauwGUtXS0cf0dg8/ByWkzmmlqH+Qz7PGT4isuyymPeavPnn3tKhWJMtIXiLhHunOCTojVnsZU1vKxFJQjJfhC+m8UPq5F6h4ajxGDvKXfMHyikRVTy7wSZI9g57flJXSuC1KcvhwkB5rzqx9luCTGvDjjvOEJnrfCH+erbZ+0h8afy/7vRJDPO1PC33euDJKEETyr7GOQCUjug==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(451199024)(82310400011)(64100799003)(1800799012)(186009)(46966006)(36840700001)(40470700004)(54906003)(6916009)(40480700001)(316002)(2906002)(5660300002)(40460700003)(44832011)(47076005)(41300700001)(8936002)(36860700001)(478600001)(4326008)(70206006)(70586007)(8676002)(82740400003)(356005)(81166007)(966005)(336012)(426003)(83380400001)(2616005)(1076003)(26005)(86362001)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 14:09:32.4428 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea25a57-b826-49a2-b54c-08dbe9d251a4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6605
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tIFzj4+YRGUJdKXR2s6WJ9iP7pYue4+TQNXhw5oDWk=;
 b=0YgvHuaIMXlLuScP0P3izVUM/jxJTRFPJXY2clf45On7JPUiXiZ9qDTDiHgfIj6yTVgKIo7xKuqDaoO3GK5tKXXrezMLcW9nWVp4GvYz0LLhBPyd3zAkwGleI1M+3M+G3PrEMK1bvYx9+bmiY3zKZcXsjzKRyrqsbT1cLk8Qq44=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=0YgvHuaI
Subject: [Buildroot] [PATCH v7 10/10] package/versal-firmware: remove package
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
V4->V7:
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
index 9b543019a2..23031298a0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2226,7 +2226,6 @@ F:	package/binutils-bare-metal/
 F:	package/bootgen/
 F:	package/gcc-bare-metal/
 F:	package/newlib-bare-metal/
-F:	package/versal-firmware/
 F:	toolchain/toolchain-bare-metal-buildroot/
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 5a3410d758..06752fb9b5 100644
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
