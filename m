Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94267C27C4F
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 13:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E9E44061F;
	Sun, 30 Jun 2024 13:45:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1HmE1xNOY08y; Sun, 30 Jun 2024 13:45:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9098A40606
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9098A40606;
	Sun, 30 Jun 2024 13:45:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1978A1BF3A1
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 13:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07743605DE
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 13:45:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AdQIjBP7MXJZ for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 13:45:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2405::600;
 helo=nam02-dm3-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6E008605DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E008605DB
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::600])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E008605DB
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 13:45:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AsAWn8Lvj/qxlqdvOqxjJN0aU8FENv3CSykrHd73b8MDKDj82z3az7CNWEJhEYW7dSsYvz2koYLlB1n8kqii35Q0VSUYYQM6CtPglo9vwvB55GKTfi8I2h4sHpe0Go53WR4PvGGFcXXp4PHmEKtKN8oyRmzh1X8nNaWY7fCIDqryA53cjCm+IGWiFwEg5zgCX5W6czkXEy3ft6MT98iR6vPXKoN7i08e8PLbW9uxjhaQZQVbPKp8WD1sPB0Jvd6uC17cu1JlmqgTrp49wLDRn9PC5VaJHORnJpgdNKXx5u/3fV9sVNMx7giZx1CGiLicz8J+WjhoOEMWenyGvZUBFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RK3w89U6tvNSToxDIsqQKSMjlfzYLt1uob7t0Suclr8=;
 b=ENVriU8/CxS+4XrQ0TuL34SsZ67sr0MiII0LbiM9gvQzpWDdQKdEs2IJZhjn4lSzij2tuvHSC/pMlKCBCYiSnzxG+gSjDQzPJu/zh0k2THoMkBI8BOPGGN8ZBVSvuIDLRBrImDOdzfN8QqCkdt3bfP/gg0aHABTShn9FEwpr7Lx3lyMM62kcgN/y//SpSJXOCe1OqW4/xz2s+RHiq7jPNv2HmQcE2DIdcPLkKF8e+G2W+Je4o9nY5hdN2SacckIkfGwB/fkqdNboB3/zneotlLWdQgWS9QubrwK1KIa5a6rc+XJInXEfOwyCtaWje7nQTDQwvQru/PMn6DnxbcOb/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN0PR02CA0042.namprd02.prod.outlook.com (2603:10b6:408:e5::17)
 by PH7PR12MB5973.namprd12.prod.outlook.com (2603:10b6:510:1d8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Sun, 30 Jun
 2024 13:45:10 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:e5:cafe::e4) by BN0PR02CA0042.outlook.office365.com
 (2603:10b6:408:e5::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32 via Frontend
 Transport; Sun, 30 Jun 2024 13:45:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Sun, 30 Jun 2024 13:45:09 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 30 Jun
 2024 08:45:07 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 30 Jun 2024 08:45:06 -0500
To: <buildroot@buildroot.org>
Date: Sun, 30 Jun 2024 14:45:00 +0100
Message-ID: <20240630134503.3658120-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|PH7PR12MB5973:EE_
X-MS-Office365-Filtering-Correlation-Id: 58ccc30e-811e-4cb4-87d0-08dc990adbbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xF3+yAjufq5Be2DCgzmhsdYujMe4fBW4BgkxDrmv7ZXqRXa6jZFRKfWftbrE?=
 =?us-ascii?Q?yqPAIVywq7IZfV0jRTI4NlODgyUF2UFV778ImUGc8xUtN0c+LZsHKRW2dvQE?=
 =?us-ascii?Q?moSwXzIByWEtrXgW0Oq7oBxP91u6ZioB5i7PIUytOkP93xUCHBOhvO9WZD49?=
 =?us-ascii?Q?zbX6UcZTVeHIVr+oX0XO9kLOepSu+f3PoAzgB8hnCVwWnYCz2Q882KyhyJTN?=
 =?us-ascii?Q?0d0slHXSTPo+P4mSE4Fm+nw25PF2DzZHcVE/scs91nNIGIe8HOBnUoCpDznt?=
 =?us-ascii?Q?JvQSmEw0lxytJbcb6RuSomZD3kF7Uw6TsrwuvH+0l1PBCYOW9r2vKNq/k54q?=
 =?us-ascii?Q?wURXUpZEuQDeBUcZURCzORhGDCr0zueBCEuSI8IsvyjDzwaPfsespQULBJCN?=
 =?us-ascii?Q?pIh/CbLrvTdcMY3sqWEz+TZZP9x2DhJG3DzySLbqvCj0wMR/DnbYWSEFirWd?=
 =?us-ascii?Q?Kg6ZMKK3TdWviK5oQwDzDOFGqPXwB7ICvoBGYiD/hA9oZG5QgfuGtXCCINFc?=
 =?us-ascii?Q?rGDOq5YoPHOLQvniH26pGejvctnCoL9W8JYSdBP6NUjHvtnXtVblShsCuCJF?=
 =?us-ascii?Q?9VX/y2z04SPCVJX8+wZWzuvKmhzydT+Up/BHtwac+xr+NXoCw5tDpOWE6zAr?=
 =?us-ascii?Q?jFjm1gK7P6ETlSxo926ocM3rXCGgzfyoSszCT1RafgIcjRqtEKZQWTftY32b?=
 =?us-ascii?Q?PwK6wK3ofuMryE9QALzV1w3wdAERZ1Z3y4PXqbrzPP8jf73WeqDkhQlyWdWO?=
 =?us-ascii?Q?FubuBhuo7KJlt0XCvwlGScCEwXoADTpJlNdAI5A0aADL0w31Sk+tXH+rUb9Y?=
 =?us-ascii?Q?p0qtjRCksIUQZsWcYCk//6UNr1CLIxB2RwRXYG3fP1MoVb+PGI33YY57bP4Q?=
 =?us-ascii?Q?YmzjRDNrmKzXNSEZV0TosndUlgBufGJ03+iSW6u6BGhk7OgMm4ZGpxbYIep/?=
 =?us-ascii?Q?mL+WbYxKNgH+RmbqJFHTsjqa7e81XlAH4HKGAW4PLK/5gl7OoD1V4NQsul6u?=
 =?us-ascii?Q?iDTqhXxghVnvfoC4n3Bg0S/h9FR0kPEpbOgM9m/peo6ZUra5pmp9ZdnkZp8N?=
 =?us-ascii?Q?5tS5DDwWcPALmFVA6n1zc1EyZhTqfWFQmU7JTfOOSgEGGW1FvmPGYV9NhhXj?=
 =?us-ascii?Q?ogCpFuJYFa3uWDlWUo6jaGwybFCo3AenshjtSfm1RBFwTNuL/FczZSmsiQJD?=
 =?us-ascii?Q?gqaqq6fnugqLW3y2kaOi0m1MFftLFn3CVUDvYsbVSGg39rUBeTUdToUERjOz?=
 =?us-ascii?Q?xUmKb02PuxMRd3cKUcS853M5/hoc/CGmiJpNzxVPDo9/i/XP/96PkwklAuQ/?=
 =?us-ascii?Q?aGyM3oA5Wde4A3XUiBNF6l/AvPV+aTmbl5/F9E7vUgrDKYY5ze1llbJeTYBl?=
 =?us-ascii?Q?JvS6e85t7iHA/oM2S6uLCPyCwAK0tixNBzBbHw9JZfNCLcefc+iAMB9aeZM8?=
 =?us-ascii?Q?jEnlOP++Seo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2024 13:45:09.4053 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ccc30e-811e-4cb4-87d0-08dc990adbbb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5973
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RK3w89U6tvNSToxDIsqQKSMjlfzYLt1uob7t0Suclr8=;
 b=b8BbJFmke6WzcQkyVjnDPu7/nAhs4saQ6n1nVd9tGXCAZ0QbJf7/HN7W2XarCCee9zVFLptxVnuWGGhZY7UXxuruXR14hWnwSh5UH8cNX4cmq2CCHXUFOZymS2fMiLZytMBdwVGxRya5lbGEN51uRt24qKzjMh3umrBlPj/twvU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=b8BbJFmk
Subject: [Buildroot] [PATCH v4 1/4] boot/xilinx-source: new boot package
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
Cc: andy.a.kennedy@collins.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds a new boot package for building boot firmware for Xilinx
versal, zynqmp and kria targets.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- add make dependency to be sure bare-metal toolchain is built before trying
  to use the toolchain for building the xilinx-source firmware
V2->V3:
- fix copy paste error that causes build failure
V3->V4:
- remove versal dependency on xilinx-prebuilt package
- simplify build and install variables
---
 DEVELOPERS                            |  1 +
 boot/Config.in                        |  1 +
 boot/xilinx-source/Config.in          | 48 +++++++++++++++++++
 boot/xilinx-source/xilinx-source.hash |  2 +
 boot/xilinx-source/xilinx-source.mk   | 68 +++++++++++++++++++++++++++
 5 files changed, 120 insertions(+)
 create mode 100644 boot/xilinx-source/Config.in
 create mode 100644 boot/xilinx-source/xilinx-source.hash
 create mode 100644 boot/xilinx-source/xilinx-source.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 8a5cceba78..af7f46fc6c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2342,6 +2342,7 @@ F:	board/xilinx/
 F:	board/zynq/
 F:	board/zynqmp/
 F:	boot/xilinx-prebuilt/
+F:	boot/xilinx-source/
 F:	configs/versal_vck190_defconfig
 F:	configs/zynq_zc702_defconfig
 F:	configs/zynq_zc706_defconfig
diff --git a/boot/Config.in b/boot/Config.in
index 25a50265d2..da22f15e8a 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -22,5 +22,6 @@ source "boot/ti-k3-r5-loader/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
 source "boot/xilinx-prebuilt/Config.in"
+source "boot/xilinx-source/Config.in"
 
 endmenu
diff --git a/boot/xilinx-source/Config.in b/boot/xilinx-source/Config.in
new file mode 100644
index 0000000000..68b329d07c
--- /dev/null
+++ b/boot/xilinx-source/Config.in
@@ -0,0 +1,48 @@
+config BR2_TARGET_XILINX_SOURCE
+	bool "xilinx-source"
+	depends on BR2_aarch64
+	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH = "microblazeel-xilinx-elf"
+	depends on !BR2_TARGET_XILINX_PREBUILT
+	help
+	  Build microblaze boot firmware from source for Xilinx boards.
+	  Users should choose either xilinx-source or xilinx-prebuilt.
+
+	  https://github.com/Xilinx/embeddedsw
+
+comment "xilinx-source needs a bare metal toolchain for tuple microblazeel-xilinx-elf"
+	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-xilinx-elf"
+
+if BR2_TARGET_XILINX_SOURCE
+
+config BR2_TARGET_XILINX_SOURCE_VERSION
+	string "source version"
+	default "xilinx_v2024.1"
+	help
+	  Release version of Xilinx firmware.
+	  Must be xilinx_v2023.1 or newer.
+
+choice
+	bool "family variant"
+	default BR2_TARGET_XILINX_SOURCE_ZYNQMP
+
+config BR2_TARGET_XILINX_SOURCE_ZYNQMP
+	bool "zynqmp"
+
+config BR2_TARGET_XILINX_SOURCE_KRIA
+	bool "kria"
+
+config BR2_TARGET_XILINX_SOURCE_VERSAL
+	bool "versal"
+	help
+	  If building versal firmware from source, only the plm.elf and
+	  psmfw.elf images will be built by this package.  Users will need
+	  to include a Vivado generated PDI file for their target hardware.
+
+endchoice
+
+config BR2_TARGET_XILINX_SOURCE_USER_CFLAGS
+	string "optional user cflags"
+	help
+	  Add optional config flags when building xilinx boot firmware.
+
+endif # BR2_TARGET_XILINX_SOURCE
diff --git a/boot/xilinx-source/xilinx-source.hash b/boot/xilinx-source/xilinx-source.hash
new file mode 100644
index 0000000000..ed6a165574
--- /dev/null
+++ b/boot/xilinx-source/xilinx-source.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  733fdb09b2525c1fa322242b97f015122aaf9e32530a824dec71d6328be83850  xilinx-source-xilinx_v2024.1.tar.gz
diff --git a/boot/xilinx-source/xilinx-source.mk b/boot/xilinx-source/xilinx-source.mk
new file mode 100644
index 0000000000..c555667de4
--- /dev/null
+++ b/boot/xilinx-source/xilinx-source.mk
@@ -0,0 +1,68 @@
+################################################################################
+#
+# xilinx-source
+#
+################################################################################
+
+XILINX_SOURCE_VERSION = $(call qstrip,$(BR2_TARGET_XILINX_SOURCE_VERSION))
+XILINX_SOURCE_SITE = $(call github,Xilinx,embeddedsw,$(XILINX_SOURCE_VERSION))
+XILINX_SOURCE_LICENSE = MIT
+XILINX_SOURCE_LICENSE_FILES = LICENSE
+XILINX_SOURCE_INSTALL_TARGET = NO
+XILINX_SOURCE_INSTALL_IMAGES = YES
+XILINX_SOURCE_DEPENDENCIES = toolchain-bare-metal-buildroot
+
+XILINX_SOURCE_USER_CFLAGS = $(call qstrip,$(BR2_TARGET_XILINX_SOURCE_USER_CFLAGS))
+ifeq ($(BR2_TARGET_XILINX_SOURCE_KRIA),y)
+XILINX_SOURCE_CFLAGS = "-Os -flto -ffat-lto-objects -DK26_SOM $(XILINX_SOURCE_USER_CFLAGS)"
+else
+XILINX_SOURCE_CFLAGS = "-Os -flto -ffat-lto-objects $(XILINX_SOURCE_USER_CFLAGS)"
+endif
+
+ifeq ($(BR2_TARGET_XILINX_SOURCE_VERSAL),y)
+define XILINX_SOURCE_BUILD
+	$(MAKE) -C $(@D)/lib/sw_apps/versal_plm/src/versal \
+		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
+		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		CFLAGS=$(XILINX_SOURCE_CFLAGS)
+		
+	$(MAKE) -C $(@D)/lib/sw_apps/versal_psmfw/src/versal \
+		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
+		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		CFLAGS=$(XILINX_SOURCE_CFLAGS)
+endef
+else # BR2_TARGET_XILINX_SOURCE_VERSAL
+define XILINX_SOURCE_BUILD
+	$(MAKE) -C $(@D)/lib/sw_apps/zynqmp_pmufw/src \
+		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
+		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		CFLAGS=$(XILINX_SOURCE_CFLAGS)
+endef
+endif # BR2_TARGET_XILINX_SOURCE_VERSAL
+
+define XILINX_SOURCE_BUILD_CMDS
+	$(XILINX_SOURCE_BUILD)
+endef
+
+ifeq ($(BR2_TARGET_XILINX_SOURCE_VERSAL),y)
+define XILINX_SOURCE_INSTALL
+	$(INSTALL) -D -m 0755 $(@D)/lib/sw_apps/versal_plm/src/versal/plm.elf \
+		$(BINARIES_DIR)/plm.elf
+	$(INSTALL) -D -m 0755 $(@D)/lib/sw_apps/versal_psmfw/src/versal/psmfw.elf \
+		$(BINARIES_DIR)/psmfw.elf
+endef
+else # BR2_TARGET_XILINX_SOURCE_VERSAL
+define XILINX_SOURCE_INSTALL
+	$(INSTALL) -D -m 0755 $(@D)/lib/sw_apps/zynqmp_pmufw/src/executable.elf \
+		$(BINARIES_DIR)/pmufw.elf
+endef
+endif # BR2_TARGET_XILINX_SOURCE_VERSAL
+
+define XILINX_SOURCE_INSTALL_IMAGES_CMDS
+	$(XILINX_SOURCE_INSTALL)
+endef
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
