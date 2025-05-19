Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE46C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 19:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 665BE82C7C;
	Mon, 19 May 2025 19:38:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FwyIRcUNejxg; Mon, 19 May 2025 19:38:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D85282C84
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D85282C84;
	Mon, 19 May 2025 19:38:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D42BE4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 19:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 833C382C7C
 for <buildroot@buildroot.org>; Mon, 19 May 2025 19:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sqMkTwdmU8mv for <buildroot@buildroot.org>;
 Mon, 19 May 2025 19:38:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::627;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 89FD882BF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89FD882BF4
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::627])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 89FD882BF4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 19:38:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CpSY9mROijcB9uxF73Oq+5oJ62rDjh5XKPtuBv/FgLCsmVnzVomp1iFOYBzbacNJaZKOTFrLV6oHCbt4zvAsNeUPE6sT2uFAXt3WWKNh/AfMRAKIR5phLxOn9gurchtuxg4tsBZ9JhtKnvkQZr1LNq1k+T/HH+FH9BzNezP+opetwr5YhRUQAG7eMxhH7ISKAJGDJgA4q7va5zoxeY486NtmgtA1LXH7eh4GxmJCxnpfvxiVnh7sA5vCZINVteOf9KwCEkScQ3ij96vL/lLsLurIyumrChYRqiMnKmnh2Khy4zbTkbjnTCHELfXfLwjxlmBvFoH6enOyzgIWlsxq+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAkr08h29HJx/h+xWPmhnYv0e89fyAVP1ZbWPQJERlI=;
 b=pJxzUiAFlT2p5OW5hqKsIG8i/2v+FwLlm2Xl1XY4krP005/rW8JFeKAIBIFR6NLSjykY+RA4Jczjyi35AdrE0fHgcnufXC/kHlk6mA9ehcEEgekJXJP0MN3tGSTMph9tQqxp73Dnr8qJlZPbU7nHqqSCGfIDnywFkTLS7HeXpLXZJgenj7UOb19lNVFlXNVlBDvPs7JRAOy5ZQaTBpMGwV6xbv/2F8w4IxtcT09iv9mTSTjGQLtUM3kcbUOq/B1JJ5CKwrgNhc8XnZ2s1lLl02+MlJ/p4GPvvFKW6/9i7Ry3wM4NKP8EyLSEU6tFD4FjeqIhjSWs1gASmgSKgZSZvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from PH5P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::10)
 by SN7PR12MB6816.namprd12.prod.outlook.com (2603:10b6:806:264::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 19:38:31 +0000
Received: from SN1PEPF0002BA4B.namprd03.prod.outlook.com
 (2603:10b6:510:34a:cafe::56) by PH5P220CA0013.outlook.office365.com
 (2603:10b6:510:34a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Mon,
 19 May 2025 19:38:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002BA4B.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 19 May 2025 19:38:30 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 May
 2025 14:38:29 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 May 2025 14:38:28 -0500
To: <buildroot@buildroot.org>
Date: Mon, 19 May 2025 20:38:15 +0100
Message-ID: <20250519193818.3192717-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4B:EE_|SN7PR12MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: 08fc5cfa-544f-4789-6f51-08dd970cbbfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qhNEZwrHYtX03Ix90HTFR90jNksSGjQgXn9huhzrt5r0+rI5iLOQwOwQxVO1?=
 =?us-ascii?Q?tlOrjrXSJrDPiYm0QkyF7vl7+Fkv7FkS4i9yx8JBCvlfYiRJ5wk5hYWb75Oz?=
 =?us-ascii?Q?LlW9+8aZnONKZ8cj+UoYR2Aut/XZQVcOyEOzXYrvIO8vs4yGdKiHzfEg/CoK?=
 =?us-ascii?Q?hNE/rhBm3XH0piL7l9x18q8aDtBHL76Rt2Vy8GN/AY+QZh8L9j4qn8Lie5ze?=
 =?us-ascii?Q?ASR//+yNkdU5SpbGPBYniQMFFVg0fYHl6c/+yucp5EDuiS1rdk9aYpy6CrTy?=
 =?us-ascii?Q?7zYdh3eWhBon6MciMXoCWFKXTrcQ7PWUZgsJe/CzunV/d4CLM3gInF889xb4?=
 =?us-ascii?Q?7K5Rze7HTP9FyB9sEa1sKK7sjyBdf/2Q5WBKp43jv49E2AmB5hrekZjGdSWx?=
 =?us-ascii?Q?xc0sZ6ZHYrZp7bZOhtf789E1w9mgmzjn77/+2PKw9C58eDteCwGgSZp/SzuM?=
 =?us-ascii?Q?KYU6GuYccaQ/lfL8oGvOCm8krBtueupf6C9txWgxj62TD1dhLrL/EK5P13RU?=
 =?us-ascii?Q?ARrd4Q8wi9ZNLu5sxDzkbQY5LNoVtwHmZnIAxvGaSRJQUdGFhgHH192K1H9q?=
 =?us-ascii?Q?wODrZppHmVKPrMbeFW+wnuHbsLNVdbGYDDiGddptBwLP0t9ZBFyEyuNmEL+4?=
 =?us-ascii?Q?oHF+GF8UQogixCqll3Kjc/jN3gvlgOz5xMtG7PKIG0x3uS6lEGjxoHBXCwSV?=
 =?us-ascii?Q?Jkl1STQdl2YgXzW4b8DTnc0ISgYU5op0ltogYV/VtkYJMIw1NiKrYkdSt8RM?=
 =?us-ascii?Q?5vhNmZ+Lj3Mf0u6pukoCptA69AU4MwxIdTIT3zOX3/kEO5krIBG9vFg6SZ+c?=
 =?us-ascii?Q?N49h1tJOR9P1KhOUROHRH+OHqYs+t5V+BQVS7On7gEX9re3C9NEdSwP1U7BM?=
 =?us-ascii?Q?okTjPmOwSxps0CdSkwp1+Y+RGYoHeAOsvFujznJfEsAxYwK+2KugsT3PDDBK?=
 =?us-ascii?Q?MlKC8k8fLnpe0B5W8Q8qofWiCixEUWysbsoCcswHC5dFlzwPIH7V8PM+8GQJ?=
 =?us-ascii?Q?VMAA6i2Xm+mQNIsrIUmF8ArhUgJ3HyqLZoyTUor0kRSkc3sUPe9ffHjKQztN?=
 =?us-ascii?Q?0XiGP/kvJCuMcGHzVryw/anCTUjj1sBuoVBCJDFXvdLDoD39FMuJ5oQ9HV/m?=
 =?us-ascii?Q?M+hnCvN3UWN0E1+DFAHfwCK+bJeXaRaOrp0kCe9tGcUivB32Q7r2r5OXaiVn?=
 =?us-ascii?Q?tO3aDP5S/zUO0mBDwifrdpv3gScrU3Q4FXvKzE/E0QeAa6ELWLVjxDgRwA4D?=
 =?us-ascii?Q?NzQaOsAB0TkPNUbbyySuW4meRlTnJcMQFkyKyLMNeHSXgmn0v95gCiPSzo0p?=
 =?us-ascii?Q?fAJrGoKam1Db4zF1VS6ijTxigpsewJspOsmb04rENrSoGxZtg3PKX3MrBWnU?=
 =?us-ascii?Q?/5fkY2UsCMzAb+2TKoZEyFOFbgrJeWYbKJgvI8sWx8FLc8xqHb15B5HYGXwR?=
 =?us-ascii?Q?+4rLY6t7qgTQh+VIYpF8Rgx3QcwQTjXm5Jfkxw1IUXzAR4f19PqhSm1Sf5oo?=
 =?us-ascii?Q?//BK4n0Dfx64CXjhfvX/EmdAvWMslMfKhiDSOzUwbNwkzu5aaY6itwWsoVAe?=
 =?us-ascii?Q?5xB2J37s2d7kr25hAo4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 19:38:30.4892 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08fc5cfa-544f-4789-6f51-08dd970cbbfa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6816
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAkr08h29HJx/h+xWPmhnYv0e89fyAVP1ZbWPQJERlI=;
 b=j0WwE488ZS24UtAjaFIvXahonlUpzmVyHUA8f6HjO1ZTMENUcU9UaW+UAWP0qVI980LylL+FgG+m133oyKKDT90giO4gOQlFMNE8uicMf+daCH6V8EyoIMylr8sYTCTyiQG7doTAsl+XgOD7uJgy8PJDG+VOuao3HIviwUVpZks=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=j0WwE488
Subject: [Buildroot] [PATCH v6 1/4] boot/xilinx-embeddedsw: rename toolchain
 vendor to buildroot
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
 Neal Frager <neal.frager@amd.com>, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch renames the bare-metal toolchain vendor used by the
xilinx-embeddedsw package from Xilinx to Buildroot to be consistent with all
other toolchains built by Buildroot.

To build the Microblaze applications available with the xilinx-embeddedsw
package, the following config is now needed:

BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"

This change keeps backwards compatibility for users already using the
following architecture tuple:

BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"

Either vendor name is now valid, but there is a warning message to use the
Buildroot vendor name, and the support for the "microblazeel-xilinx-elf"
tuple will be removed once all zynqmp and versal defconfigs have migrated.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- xilinx-embeddedsw is now backwards compatible with either vendor name
V2->V3:
- split patch into series
V3->V4:
- rebase patch
V4->V5:
- add deprecation warning for microblazeel-xilinx-elf tuple
V5->V6:
- $(HOST_DIR) is only available when running from a shell script, so the
  wildcard function was not actually working.  This is now fixed.
- changed text of warning messages to clearly explain how to migrate to new
  microblazeel-buildroot-elf arch tuple
---
 boot/xilinx-embeddedsw/Config.in            |  3 ++-
 boot/xilinx-embeddedsw/xilinx-embeddedsw.mk | 29 ++++++++++++++-------
 2 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
index a27253d594..31b12baaf2 100644
--- a/boot/xilinx-embeddedsw/Config.in
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -1,4 +1,5 @@
-comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-xilinx-elf"
+comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-buildroot-elf"
+	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-buildroot-elf"
 	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-xilinx-elf"
 
 menuconfig BR2_TARGET_XILINX_EMBEDDEDSW
diff --git a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
index 7d4fcf8b8f..03acb153d1 100644
--- a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
+++ b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
@@ -12,6 +12,17 @@ XILINX_EMBEDDEDSW_INSTALL_TARGET = NO
 XILINX_EMBEDDEDSW_INSTALL_IMAGES = YES
 XILINX_EMBEDDEDSW_DEPENDENCIES = toolchain-bare-metal-buildroot
 
+XILINX_EMBEDDEDSW_MICROBLAZE_CC = $(call qstrip, \
+	$(if $(wildcard $(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc), \
+		$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc, \
+		$(HOST_DIR)/bin/microblazeel-buildroot-elf-gcc))
+XILINX_EMBEDDEDSW_MICROBLAZE_AR = $(XILINX_EMBEDDEDSW_MICROBLAZE_CC)-ar
+
+ifeq ($(basename $(notdir $(XILINX_EMBEDDEDSW_MICROBLAZE_CC))),microblazeel-xilinx-elf-gcc)
+$(warning microblazeel-xilinx-elf in BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH is not supported anymore!)
+$(warning Replace microblazeel-xilinx-elf with microblazeel-buildroot-elf in BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH)
+endif
+
 # ZYNQMP_PMUFW application allows users to add cflags
 XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS = \
 	$(call qstrip,$(BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS))
@@ -23,9 +34,9 @@ XILINX_EMBEDDEDSW_CFLAGS = "-Os -flto -ffat-lto-objects"
 ifeq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM),y)
 define XILINX_EMBEDDEDSW_BUILD_VERSAL_PLM
 	$(MAKE) -C $(@D)/lib/sw_apps/versal_plm/src/versal \
-		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
-		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
-		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		COMPILER=$(XILINX_EMBEDDEDSW_MICROBLAZE_CC) \
+		ARCHIVER=$(XILINX_EMBEDDEDSW_MICROBLAZE_AR) \
+		CC=$(XILINX_EMBEDDEDSW_MICROBLAZE_CC) \
 		CFLAGS=$(XILINX_EMBEDDEDSW_CFLAGS)
 endef
 
@@ -38,9 +49,9 @@ endif # BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
 ifeq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW),y)
 define XILINX_EMBEDDEDSW_BUILD_VERSAL_PSMFW
 	$(MAKE) -C $(@D)/lib/sw_apps/versal_psmfw/src/versal \
-		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
-		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
-		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		COMPILER=$(XILINX_EMBEDDEDSW_MICROBLAZE_CC) \
+		ARCHIVER=$(XILINX_EMBEDDEDSW_MICROBLAZE_AR) \
+		CC=$(XILINX_EMBEDDEDSW_MICROBLAZE_CC) \
 		CFLAGS=$(XILINX_EMBEDDEDSW_CFLAGS)
 endef
 
@@ -53,9 +64,9 @@ endif # BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
 ifeq ($(BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW),y)
 define XILINX_EMBEDDEDSW_BUILD_ZYNQMP_PMUFW
 	$(MAKE) -C $(@D)/lib/sw_apps/zynqmp_pmufw/src \
-		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
-		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
-		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		COMPILER=$(XILINX_EMBEDDEDSW_MICROBLAZE_CC) \
+		ARCHIVER=$(XILINX_EMBEDDEDSW_MICROBLAZE_AR) \
+		CC=$(XILINX_EMBEDDEDSW_MICROBLAZE_CC) \
 		CFLAGS=$(XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_CFLAGS)
 endef
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
