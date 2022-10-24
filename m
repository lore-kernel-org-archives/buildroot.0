Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3780ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 14:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20755400B6;
	Mon, 24 Oct 2022 14:22:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20755400B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VZUbl-J2m2og; Mon, 24 Oct 2022 14:22:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03C1640106;
	Mon, 24 Oct 2022 14:22:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03C1640106
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 307591BF2C8
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 14:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D916260B60
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 14:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D916260B60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mMGtF6g9OEUj for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 14:22:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2744D60AF6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2744D60AF6
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 14:22:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ifpJaR4XkJKpDZzkwDnxRVrqrwi/g9HeuFrRL0Y4ARi7rvWK+rU1pNPXCQ7KvwP1OE30QFyHKi6jbuFGXfODuc0YeP9iMfdMs0zIr/yysIjyQk/mqlvdDUJ8RCt9hQ5gHLkb71HHwqLlFvfpQOhgq0QjKcocv7ZNIRrAG8YyZkJQvcXUaw8kNrjTImfmfEW5AsX+qMCPYKcKqxWAquwYzSUIvtpaIbXJczcyGk3LAyZb83kWJ2DUdcSWzgltKxKnPSMmf1MxWdd0m3awKYqCC651Vt1ZLJASWgVqBZUnEHcSqMqVo4tWO4xbWdN/+B3zQ/9KJpaSMuYx2CCzYgyfhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+VA46RGudF/VFORGQINmcnxt2HfMXSWnWV1PMgNVuJ0=;
 b=YEH02bRkECiYNqOgvkUP5TKd9znVamvLsqDHApLb4nJU34XaMiXYwRpc/YxhS0Xpbq4giMh+5ZUFEuePv930nK+NeKK9AmvLr/CPlE0+FUCYh0dkpvO1kdprQQCLe9fiOkkjGTp5joWi9er5E5WOo28A0s0fX2IuCjvGkd2N0HwqCdJjDuQlbvY6prfCjGQcBbffpm7rD3UzutepqDPS0kEDCTjEECzSRUPjTi4ChOG3P9/bhk3qsmkgbVDj+TwhkTlIAoM4tGT9gKPzs43h0Wbw+oD6VXFkGb7xare8bHkHpV0z9O/bXzG68JaxasLzcNaotofkYtNb1nGbxbv6eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from BN8PR15CA0049.namprd15.prod.outlook.com (2603:10b6:408:80::26)
 by BL1PR12MB5319.namprd12.prod.outlook.com (2603:10b6:208:317::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Mon, 24 Oct
 2022 14:22:20 +0000
Received: from BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:80:cafe::1a) by BN8PR15CA0049.outlook.office365.com
 (2603:10b6:408:80::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21 via Frontend
 Transport; Mon, 24 Oct 2022 14:22:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT068.mail.protection.outlook.com (10.13.177.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Mon, 24 Oct 2022 14:22:20 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 24 Oct
 2022 09:22:20 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 24 Oct
 2022 07:22:20 -0700
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Mon, 24 Oct 2022 09:22:19 -0500
To: <buildroot@buildroot.org>
Date: Mon, 24 Oct 2022 08:22:14 -0600
Message-ID: <20221024142216.31273-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT068:EE_|BL1PR12MB5319:EE_
X-MS-Office365-Filtering-Correlation-Id: 436692b1-312b-4172-454b-08dab5cb29a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z49BDNvdiH0YXdynRFWBhN3H2jKXu1Dgwu/FY5fA8cKQbaF2JhsRUXtSD8pvDkME/2dtK36CCKMQ/Y9pa+PhfN5oTmZqWpxYYqX8dZZQYgUCyeQ6ezG9udi56g7DqMLkD8n1tsIuNkf2Hhl6iJ35cmewkq6CyAIC/Awr3ZRAZih1ImbWmVc05gYfZfF89L17jHsDFEb89IfM4c+GFO9juP2NgSjxAqebAzY5W2JMMmaUPDC0U9B+FNwE0UFtw2rbipmZrSEXbKUC4VkjRTR796WaZttBPQf3xIREJpHU30WuC7XcAy2swJN8hblzqPH+FyTS3zL5eWl8qbJqk4QNi8oIDtqz1XH2WOW9DVfjxq83/xUh5WzbHtHc5dCjSw3Vr8RkjuDEyVNCKiKrfigPlV5zu72D8E1JHzkZey7AG9froPlu6YMxiHumojX1fp3bO5xE0wqYQP/vXaPOphrZFLWZXCAt+0QtlQc0no4BQWA0b1ryevYneTDOEqwi8e2ixeMno+mewVjmYgzxHvO+1rrfGARaMccKsvNSKftegXAicCO1KF7NudyutGARK6LRahotTgrPIsvGFUfsVY9kw+DU+pzVcwCQ/7NgB0LZ12/H1zsv/P6kK+jpJgleKV4OoiWEN3R2dohUgJf31qnd4BxzFscHfHKiuRere0zbvVmtxTjk+fKJnE4OYrK5GVMTs59K4Xa5CYYT54ZR/J71dZ84Dtm0Vvmmq0SK6g2+sKXqFrDgbGiROPdYj0JjMGpEFsHTHbIvs8KUAXm9yBLP00b5Lh6beEmsTdWejEnuVX8jhdghB5Cx+wuWwSFzirwRUB5qhxo6w/Jgu3aHt24zsQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199015)(40470700004)(36840700001)(46966006)(41300700001)(426003)(1076003)(6916009)(478600001)(47076005)(82740400003)(316002)(2906002)(6666004)(186003)(54906003)(81166007)(40460700003)(356005)(36756003)(70206006)(70586007)(8676002)(966005)(2616005)(26005)(40480700001)(4326008)(5660300002)(82310400005)(336012)(86362001)(83380400001)(8936002)(44832011)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 14:22:20.7235 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 436692b1-312b-4172-454b-08dab5cb29a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5319
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+VA46RGudF/VFORGQINmcnxt2HfMXSWnWV1PMgNVuJ0=;
 b=XvT31lSaHryesQnN1lzM8Vsf1t7jgNX1I8sPhT3903ov3Zrhk8/QCYPY0V/l1vitzp61DRv33EFLgQUiRBpsfZn/A04U+Q9Ll/qta9zLMsCUdBYJpa1K0kJVtBrWiA2lVTBsy3ONOiEU9E6mXRyUh23JkmVuRUQxddZuHEOTZOo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=XvT31lSa
Subject: [Buildroot] [PATCH v1 1/3] add package/versal-firmware
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
Cc: terry.oneal@amd.com, luca.ceresoli@bootlin.com, kris.chaplin@amd.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds support for downloading versal microblaze firmware binaries.
These are necessary for booting Xilinx versal devices.

The location of these binaries is temporary, and will soon be added to the
Xilinx firmware repository.  The temporary location is using the same free
distribution license as the Xilinx firmware repository.

Once these files are available on the Xilinx repository, this package will
be updated to the new location.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/versal-firmware/Config.in            | 22 ++++++++++++++++++
 package/versal-firmware/versal-firmware.hash |  3 +++
 package/versal-firmware/versal-firmware.mk   | 24 ++++++++++++++++++++
 5 files changed, 51 insertions(+)
 create mode 100644 package/versal-firmware/Config.in
 create mode 100644 package/versal-firmware/versal-firmware.hash
 create mode 100644 package/versal-firmware/versal-firmware.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c8183b2290..ed696f4cd0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2176,6 +2176,7 @@ F:	configs/zynqmp_zcu102_defconfig
 F:	configs/zynqmp_zcu106_defconfig
 F:	configs/zynqmp_kria_kv260_defconfig
 F:	package/bootgen
+F:	package/versal-firmware
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
 F:	package/uacme/
diff --git a/package/Config.in b/package/Config.in
index e3a34d6e97..0abf233940 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -441,6 +441,7 @@ menu "Firmware"
 	source "package/sunxi-boards/Config.in"
 	source "package/ts4900-fpga/Config.in"
 	source "package/ux500-firmware/Config.in"
+	source "package/versal-firmware/Config.in"
 	source "package/wilc-firmware/Config.in"
 	source "package/wilink-bt-firmware/Config.in"
 	source "package/zd1211-firmware/Config.in"
diff --git a/package/versal-firmware/Config.in b/package/versal-firmware/Config.in
new file mode 100644
index 0000000000..e184ba1925
--- /dev/null
+++ b/package/versal-firmware/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_VERSAL_FIRMWARE
+	bool "versal-firmware"
+	depends on BR2_aarch64
+	help
+	  Pre-built firmware files for Xilinx Versal boards.
+
+	  https://github.com/nealfrager/buildroot-firmware
+
+if BR2_PACKAGE_VERSAL_FIRMWARE
+
+config BR2_PACKAGE_VERSAL_FIRMWARE_VERSION
+	string "versal firmware version"
+	help
+	  Release version of Versal firmware.
+
+config BR2_PACKAGE_VERSAL_FIRMWARE_BOARD
+	string "versal board name"
+	help
+	  Name of Versal target board.
+	  Used for installing the appropriate firmware boot.bin.
+
+endif # BR2_PACKAGE_VERSAL_FIRMWARE
diff --git a/package/versal-firmware/versal-firmware.hash b/package/versal-firmware/versal-firmware.hash
new file mode 100644
index 0000000000..7a8ea04c91
--- /dev/null
+++ b/package/versal-firmware/versal-firmware.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  14c505cac0216637ab2d08590acffb4861446e480bdbf7417e699816048ab39b  versal-firmware-v2022.2.tar.gz
+sha256  f9796efcd98f47fb3e1d5d4c23e224613e91c70207b759a2087de368be50c315  LICENSE
diff --git a/package/versal-firmware/versal-firmware.mk b/package/versal-firmware/versal-firmware.mk
new file mode 100644
index 0000000000..35dfbaa512
--- /dev/null
+++ b/package/versal-firmware/versal-firmware.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# versal-firmware
+#
+################################################################################
+
+VERSAL_FIRMWARE_VERSION = $(call qstrip,$(BR2_PACKAGE_VERSAL_FIRMWARE_VERSION))
+VERSAL_FIRMWARE_SITE = $(call github,nealfrager,buildroot-firmware,$(BR2_PACKAGE_VERSAL_FIRMWARE_VERSION))
+VERSAL_FIRMWARE_LICENSE = Xilinx-Binary-Only
+VERSAL_FIRMWARE_LICENSE_FILES = LICENSE
+
+VERSAL_FIRMWARE_INSTALL_TARGET = NO
+VERSAL_FIRMWARE_INSTALL_IMAGES = YES
+
+define VERSAL_FIRMWARE_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_plm.elf \
+	$(BINARIES_DIR)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_plm.elf
+	$(INSTALL) -D -m 0755 $(@D)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_psmfw.elf \
+	$(BINARIES_DIR)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_psmfw.elf
+	$(INSTALL) -D -m 0755 $(@D)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_vpl_gen_fixed.pdi \
+	$(BINARIES_DIR)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_vpl_gen_fixed.pdi
+endef
+
+$(eval $(generic-package))
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
