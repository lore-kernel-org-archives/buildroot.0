Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E00C54E41
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 09:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77E45414C8;
	Sun,  3 Mar 2024 09:21:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B40u8czDzyEk; Sun,  3 Mar 2024 09:21:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6852541803
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6852541803;
	Sun,  3 Mar 2024 09:21:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E1BE91BF8B4
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 09:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCC6281EA1
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 09:21:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zwEKAaayheIp for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 09:21:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2407::600;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DE4AC81E81
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE4AC81E81
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::600])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE4AC81E81
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 09:21:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+bwmHLXxBOPhmVB1TRE0xhaoVikDkNqkJKk4jlmHVaH28Nx01TYsGdjGzue2ya1G3Metb3rTgXd1s2TSmjgIls8zdhh9crVtIYZVfuHUAaXBm04zd+OvkX19s/utAF376v2E6nmRdI4r8zfmY8X+Xp+GWe7lq9hX4vbUgn5TKYCVo6QBGPS4YfmAOxg1ws6EHVrsnRD9zeD8e2y6/jtLbOANn0v7Co54nwG5hy0+OiQJhR0sAx09q+Z+aWRtUmdKSvCCmJ+tcAiHWD7A04JcXGxbDUI2rv/ye0P5l0lzcpEXDKSutL7ttnEf1zo8Tlz0D/wzTwrL96AQgy4OaeLag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8Df/Ml069kHcuVnJelGzqJbnMdaju1k1yqS9RWzONo=;
 b=in82mK34ofNkDPJMxRuGDU0Wttpp1OO62XvKFWZDXnj2LZr7iLpz0dKYyt0BotG+S06q//JEBDRl2C9cakGDfKp9Pnb3XiJSe35P7x7aWM4qzj+cKtfJVTuXIao7jsJpKlDYYt8BL2KoiQhwkrQ4DVbhEeT8ihb0Aom90rQTIPLFaK/BOpnnvXRrJZiVBB42WXXuEmzyyGVRM01DuLn2KW7oOAuiZIa7514/J1mrlyKAMFSJuyEdMNbcaVu3rElBNOMkT/ayaSmHRP7CTabvd/bu4H4VkxPZb73BIgzsVoJsQ1nnvzBb5fl8qki6YU9jIzvvzsZ/rK7WrvX4+bBjhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH0PR03CA0306.namprd03.prod.outlook.com (2603:10b6:610:118::35)
 by PH7PR12MB9065.namprd12.prod.outlook.com (2603:10b6:510:1f7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.37; Sun, 3 Mar
 2024 09:21:17 +0000
Received: from SN1PEPF0002BA4B.namprd03.prod.outlook.com
 (2603:10b6:610:118:cafe::97) by CH0PR03CA0306.outlook.office365.com
 (2603:10b6:610:118::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.37 via Frontend
 Transport; Sun, 3 Mar 2024 09:21:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4B.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Sun, 3 Mar 2024 09:21:16 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 3 Mar
 2024 03:21:15 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 3 Mar
 2024 03:21:15 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sun, 3 Mar 2024 03:21:14 -0600
To: <buildroot@buildroot.org>
Date: Sun, 3 Mar 2024 09:19:56 +0000
Message-ID: <20240303091956.352661-7-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240303091956.352661-1-neal.frager@amd.com>
References: <20240303091956.352661-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4B:EE_|PH7PR12MB9065:EE_
X-MS-Office365-Filtering-Correlation-Id: e92bbfe8-dc22-4799-daf5-08dc3b63473d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PquB+BhEfCmsBbj5FRq6cHOGw1f2aD27xF3EhkwQs4nMIvVIO11L+gR9rtepbiZPAhTjobQ7LI1pKj37HDcnKoIie0YNuBu4NJynwzvjTJ552a85/QEt3fU/z89V45FfwGFc5nTIJ4W65CjqQyrWx/RjpBOQnX/YZd97EfW6XUwwBOTwWQJer/uFge5Xe/iapYQQXCGv22/bNV1apDTTlvbpacWxtOM8lZExrjrR/NaD6cAIP1exdQEyQ21lQ3tXAp/dI4ij7U+TGevFT1x6VNwXNVCWLWelTPgdBSG3H1nKdDhkuP5uZYH2A20HHblTQQO6k7JBkPjqCsuFVSlVK3VgPYIwZwcQVJWnuPSc2Htz0EwzcTQZp0YBrhlIEuoUd37adO8D9oT8UJURe8j2HnMxwFs8J3+zMlnh977alNYkXUpNQxrY4OsaZYbdbB1tvyUjuPJEE5ViEbCzSGg0Muyeg+DW8OnNNGvRLKONvR+L2SX0XKbnavZocI1TFgY2xc9Wf4dc3VKeqBhdH4vQ/bJ3hfNVVtE+vlKFdhPlrxgoX++l/eLKMZNMRtgFYsmRP4ZzDGfc0ZYZicKYN9daCalKOP/MMKbMGUiM3IvUCdg19ewcq2Oo5CG49CqlwRrsKrx50XPO8NXL9BO1GWPVBhUs+FzHURu+5SzsLq5qbsvH8gvYajWv8uFsCY+ImRFBU6xUB6et6kI/X3lGs+4SUg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400014)(376005)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2024 09:21:16.2179 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e92bbfe8-dc22-4799-daf5-08dc3b63473d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9065
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8Df/Ml069kHcuVnJelGzqJbnMdaju1k1yqS9RWzONo=;
 b=dHfI4kYwOoGUjGQKdcY1FuRoIqWnsLtSlWbOUG7vCde/tN53wgVKUItReg7bsIpVNW3YzpB9v4pNoPzJ+RRCOW041+dxoAXZTKgDOMOTU1gDyc3oO5RcB5+rSviD7JZ6Es1JkuqRx5DphWFvIBqASFsheOL/ue5m5m8Zi0UsSSM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=dHfI4kYw
Subject: [Buildroot] [PATCH v10 6/6] package/versal-firmware: remove package
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
V4->V10:
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
index fa3424074e..5fb3b1f5ef 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2298,7 +2298,6 @@ F:	package/binutils-bare-metal/
 F:	package/bootgen/
 F:	package/gcc-bare-metal/
 F:	package/newlib-bare-metal/
-F:	package/versal-firmware/
 F:	toolchain/toolchain-bare-metal-buildroot/
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index bf0fe078b9..f3bcf13bb9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -457,7 +457,6 @@ menu "Firmware"
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
