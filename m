Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C59C27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 09:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E629419DF;
	Fri,  7 Jun 2024 09:47:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qPnfIAwOBS1Y; Fri,  7 Jun 2024 09:47:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C703040B0A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C703040B0A;
	Fri,  7 Jun 2024 09:47:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB3241BF4D5
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 09:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9775440B0A
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 09:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mfxu5lEW1aZh for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 09:47:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::627;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3E8AF4049F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E8AF4049F
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::627])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E8AF4049F
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 09:47:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7apDAPQAxr7K3WowvJguEkJVnIgeLGjb5PvRyun1e9Iv0SyV91zogBtZf9bXoJbKycbK8erTGon/AFnc8i75tgUD2beFB+5N0OhNO6cUxer031yaVP1L7IUdaC1W8EvmlGPiAqgRhychPUja/57/nAxweTDY+VLTHhzLw+P4IMCGx/g+iz1eMNy25rIZpWemKg72vUoPWtVnwVd3ly4Eb8v/KkuWetdgj3mDAzwKb/ez5fJ4j1Tx5cMxjtoah1OXUFmvYkDcZYN7/KbxerfJ5d4xoWBdsMs1zRjpCLgzFDh7ZTj2oVShbJfmmhvFg9bU0fdkAdk0vk4wpEXbfK8/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tM/u65ZP6Uc/mt22lKgSCjGR4XcolIMC3FtLVppj6WE=;
 b=jgTzHzB4XM8R9NEzm4ylgI8YO4d6Ao1L1C+dz4w3I+6BQqTQXCU8/MVRAHhmlCHnU7IIdK7yLIerCCuUNnkCtLrgTFOMapM8gSLavcmiZCXdySmAf2h/AQRJjgdriKo0bCW3VlX3xmz2DA97nx55Az8sPOxPJfAdICNkYuvG2HZUB9j4SCmsxYRz7DADWmK5KKoFkDvYnoN8HWeCpXpsn+z8DeLhog5EO+sJJazXbIFoQ2abDkNVCWrU5koORRxn5E06/F064Q1SbJZrCH2VD3YEshndREUoB1dr41mimXfb366/IPlK5oqJN6LIk1wl5NiSadu9K2mtCJx8MUegHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0088.namprd03.prod.outlook.com (2603:10b6:a03:331::33)
 by MW3PR12MB4428.namprd12.prod.outlook.com (2603:10b6:303:57::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 09:47:16 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::20) by SJ0PR03CA0088.outlook.office365.com
 (2603:10b6:a03:331::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.30 via Frontend
 Transport; Fri, 7 Jun 2024 09:47:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Fri, 7 Jun 2024 09:47:15 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 7 Jun
 2024 04:47:09 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 7 Jun 2024 04:47:08 -0500
To: <buildroot@buildroot.org>
Date: Fri, 7 Jun 2024 10:47:03 +0100
Message-ID: <20240607094705.1962913-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|MW3PR12MB4428:EE_
X-MS-Office365-Filtering-Correlation-Id: 96193383-281a-456e-dcf9-08dc86d6d05d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|36860700004|376005|1800799015|82310400017|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?djnMF9A8o0Y7ovCQ1MiAgVnvV9tlgH9qoFiNYvrYZml6zccTAfQEnMpCZJhu?=
 =?us-ascii?Q?Vidj9jsYEFmmjT52o5UkmIxmGqgVZ4mwTUCfpY+hVuQiIk02jo28gx4UxumI?=
 =?us-ascii?Q?kjFkmRL5iS6V+h+g5T5HQfzfNgSaylXHxXrHcKQDghJyQGI/agdI5VNsJVuQ?=
 =?us-ascii?Q?WM/els8D0zPxmoIx86tBJIUKRna8tYHe7Intl91IWXvwuMI0LZAfinf3eKbk?=
 =?us-ascii?Q?KcFhNY31tvmtgEChCXALZc5d4oqWuJjNlq5pfYlWfpu2z6ly33DMMu2Zmcbq?=
 =?us-ascii?Q?S48EN6wmimg2w12CjziDh6IfcqDX9tNeOJssYzOPe9ErgHM23ftrRGoWLgPe?=
 =?us-ascii?Q?dAYH39Bh2uktjsGi1dixOvkoeJ1ymIEV6yXKc4ABrOQST4k/08Yn3zgPr37+?=
 =?us-ascii?Q?1DSptb8ZI+uQyFOUDhu8j96u56MMoRvP1ZfKoMc9yvsQHYiW748toHYJPmVa?=
 =?us-ascii?Q?lKmEyj9Ol7lptwr6rHLEYR2NhalLVtHC03joRzFBVvIuDKJK/kWxIERPjnH0?=
 =?us-ascii?Q?iLNZFk15rT3T2Ac9XfX43OiF3VLvhY3FH9VU87/N65UxI4H17ieeVthO6vdp?=
 =?us-ascii?Q?NJckUyOOE2RHRbyzvPFiA4kHW3gg0YtekG1BKO5WrnpdnYHatJyrexkrZjby?=
 =?us-ascii?Q?X5daLwsUE7F85pAdPzHs3KQPzjykHanNYs43Eank5P4Um4io7icGn9yFyKK6?=
 =?us-ascii?Q?UW5rqnjxu9J7AGRPq7/MJtVQpWtUoGSbnSIvmqYQFtpkwjRNnG2Mz/fhIjlC?=
 =?us-ascii?Q?Qn3D0moPhm75jneugDEo1G0wCiIejg9opUb/m9Pv+JvLbDj1LkBKk8Ey8Oop?=
 =?us-ascii?Q?rmDup4brK5FzCWj0ZfmaTsh9qYHTXwXDJS43f/mg84+QPQ4lBJZUdTeEpxkn?=
 =?us-ascii?Q?YxOeofnmdkxEqRRZ0x/MsCyp/mHeqWlNRAy0nl/nxhSPbcxH0JLIxjYPghz3?=
 =?us-ascii?Q?5FH6NPIchrl6Ih5L1maIl2Hh1EjTNhkqZuBNb7n78H6oKxDAvxs6QVK8Dh1o?=
 =?us-ascii?Q?37jgmnipLCqoNzjJBFazSPZF1EIGM9dlCtNNblsumbLhn/ecLewWNwggo0JC?=
 =?us-ascii?Q?O8swYjx9lZDI0GmGIjBEmIoPxdWVPTeXWE9K4tgk/tIs3cSsGv3Ix0FcJzx7?=
 =?us-ascii?Q?h9X9vzOFDjNZY+N60+GWIyhbjc6uxO7lX54Fz1QBxhttKPFe/9csoLfokNfJ?=
 =?us-ascii?Q?FHdhuQZ3lYzZCwfIEv+09U9HwRYng8fNdqWy76ab2r3WN3C06NqrlYfOE1bP?=
 =?us-ascii?Q?1J7uBJp4cH0/UCLA5nq5N66ZGzQH2SL+r17KzFo3HZphijNbUWpkn6X3qFch?=
 =?us-ascii?Q?YmDA27ikYt1qg5RM+Zm93VBxK+IYoqKXBwsEof9TMeVgnxE+vevPA2y6jPdK?=
 =?us-ascii?Q?Ip9Yz+sH8iblfLg6VfSKrSkRnrx+Owi4TzgqiA2bugLaIVaovhYHNwdN2OY3?=
 =?us-ascii?Q?nIoYKNIdCxbGE2xYmto0i3jnjtkqsWJY?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 09:47:15.5141 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96193383-281a-456e-dcf9-08dc86d6d05d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4428
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tM/u65ZP6Uc/mt22lKgSCjGR4XcolIMC3FtLVppj6WE=;
 b=o334DrPX3G2Jn6zM6/fHqFHIHVlXZiQE8AbuzldIOLUKKdJD5XoQvfII3gybW5lFtPukftAsPl4zjh3+9U7XKcR14zm/e6ileo9jOZ9dbcnWotEsVd2G0BznlGtru3mjZSX3N1I8mkdlcAZD6TapQP2EqOEczQUw4dTJ0uGuRk8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=o334DrPX
Subject: [Buildroot] [PATCH v12 1/3] boot/zynqmp-firmware: new boot firmware
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

This patch adds a new boot firmware to buildroot for building the zynqmp pmufw.
It requires the toolchain-bare-metal package that includes a bare-metal
binutils, gcc and newlib which can be built for the microblaze architecture.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
 - builds a bare-metal gcc toolchain instead of requiring an external
   microblaze toolchain
V2->V3:
 - corrected custom cflags option
 - added support for xilinx_v2022.2 version
 - added zynqmp-firmware.hash
V3->V4:
 - no changes
V4->V5:
 - reduced all lines to <80 chars
V5->V6:
 - migrated to toolchain-bare-metal-buildroot
V6->V7:
 - removed patch numbers
 - changed dependency to toolchain-bare-metal-buildroot
 - removed hash since version is configurable
V7->V9:
 - no changes
V9->V10:
 - removed patches for supporting versions older than xilinx_v2023.2
V10->V11:
 - set default BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH to
   "microblazeel-xilinx-elf" to avoid stand-alone build failure
V11->V12:
 - replace select BR2_TOOLCHAIN_BARE_METAL_BUILDROOT with depends
 - change variable name for check-package warning
---
 DEVELOPERS                              |  1 +
 boot/Config.in                          |  1 +
 boot/zynqmp-firmware/Config.in          | 25 +++++++++++++++++++
 boot/zynqmp-firmware/zynqmp-firmware.mk | 33 +++++++++++++++++++++++++
 4 files changed, 60 insertions(+)
 create mode 100644 boot/zynqmp-firmware/Config.in
 create mode 100644 boot/zynqmp-firmware/zynqmp-firmware.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index cf48e01037..f3ff2cbbd5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2337,6 +2337,7 @@ N:	Neal Frager <neal.frager@amd.com>
 F:	board/versal/
 F:	board/zynq/
 F:	board/zynqmp/
+F:	boot/zynqmp-firmware/
 F:	configs/versal_vck190_defconfig
 F:	configs/zynq_zc702_defconfig
 F:	configs/zynq_zc706_defconfig
diff --git a/boot/Config.in b/boot/Config.in
index 87e1b7c00e..64b1c8c420 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -23,5 +23,6 @@ source "boot/ti-k3-boot-firmware/Config.in"
 source "boot/ti-k3-r5-loader/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
+source "boot/zynqmp-firmware/Config.in"
 
 endmenu
diff --git a/boot/zynqmp-firmware/Config.in b/boot/zynqmp-firmware/Config.in
new file mode 100644
index 0000000000..478d58d552
--- /dev/null
+++ b/boot/zynqmp-firmware/Config.in
@@ -0,0 +1,25 @@
+config BR2_TARGET_ZYNQMP_FIRMWARE
+	bool "zynqmp-firmware"
+	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH = "microblazeel-xilinx-elf"
+	help
+	  This package builds the PMU Firmware application required
+	  to run U-Boot and Linux in the Zynq MPSoC devices.
+
+if BR2_TARGET_ZYNQMP_FIRMWARE
+
+comment "zynqmp-firmware needs a bare metal toolchain for tuple microblazeel-xilinx-elf"
+	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-xilinx-elf"
+
+config BR2_TARGET_ZYNQMP_FIRMWARE_VERSION
+	string "firmware version"
+	default "xilinx_v2024.1"
+	help
+	  Release version of zynqmp firmware.
+	  Only versions xilinx_v2023.2 and newer are supported.
+
+config BR2_TARGET_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS
+	string "custom cflags"
+	help
+	  Adds additional CFLAGS for building zynqmp firmware.
+
+endif # BR2_TARGET_ZYNQMP_FIRMWARE
diff --git a/boot/zynqmp-firmware/zynqmp-firmware.mk b/boot/zynqmp-firmware/zynqmp-firmware.mk
new file mode 100644
index 0000000000..dafb2dbe55
--- /dev/null
+++ b/boot/zynqmp-firmware/zynqmp-firmware.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# zynqmp-firmware
+#
+################################################################################
+
+ZYNQMP_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ZYNQMP_FIRMWARE_VERSION))
+ZYNQMP_FIRMWARE_SITE = \
+	$(call github,Xilinx,embeddedsw,$(ZYNQMP_FIRMWARE_VERSION))
+ZYNQMP_FIRMWARE_LICENSE = MIT
+ZYNQMP_FIRMWARE_LICENSE_FILES = license.txt
+ZYNQMP_FIRMWARE_INSTALL_IMAGES = YES
+ZYNQMP_FIRMWARE_INSTALL_TARGET = NO
+ZYNQMP_FIRMWARE_DEPENDENCIES = toolchain-bare-metal-buildroot
+
+CUSTOM_CFLAGS = $(call qstrip,$(BR2_TARGET_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS))
+ZYNQMP_FIRMWARE_CFLAGS = "-Os -flto -ffat-lto-objects $(CUSTOM_CFLAGS)"
+
+define ZYNQMP_FIRMWARE_BUILD_CMDS
+	$(MAKE) -C $(@D)/lib/sw_apps/zynqmp_pmufw/src \
+		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
+		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		CFLAGS=$(ZYNQMP_FIRMWARE_CFLAGS)
+endef
+
+ZYNQMP_FIRMWARE = $(@D)/lib/sw_apps/zynqmp_pmufw/src/executable.elf
+
+define ZYNQMP_FIRMWARE_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0755 $(ZYNQMP_FIRMWARE) $(BINARIES_DIR)/pmufw.elf
+endef
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
