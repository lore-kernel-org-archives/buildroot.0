Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CBBC2BA18
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 06:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5858605D5;
	Tue, 18 Jun 2024 06:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XE0UkHV5NOEL; Tue, 18 Jun 2024 06:24:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C46E660741
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C46E660741;
	Tue, 18 Jun 2024 06:24:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 166AA1BF284
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 06:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04A1B60741
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 06:24:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lC0YU80s9Cpa for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 06:24:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2409::600;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A59DE605D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A59DE605D5
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::600])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A59DE605D5
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 06:24:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mVI04nORbnhsEdWyMnbV6l7Ld4iBh5sSHOyX5to3ItBG1YKAociuWCoxIeg2L7CXqUpivYYXdNUlELgbBqaCYMTI1qibYWHsQYQP/DT3/dcQrQbdvWqt//yP1KEtD15254wfgHiB3kuCOzl77galm7mFyfDQnv7m0StbB2iaebJDuYwM8UzdvD6M/gJDkfKjFjvOvBOC4FGcXS7aYIejJ6ixIDTllsYMdyP+Ur7x7Nwb6OkLUPuRj/tCobHlU5VQUq6/KObZnIyxDMmnUz70kx4g9f4QL9vjA8deA3I9vdYFdNT8Wkor+aAxbUahOSPuVnL/8KfOjE5/5gQgcfU8gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjJ8csKMHWWKUjT2vDdAp0aZeKFJkK8k68iSFVsGPb4=;
 b=Qp2RCxytRgHSISNf/rVNZfO6KgLzOOX9tJl/CnzfAVUCR4FLtBYrSn9xCaGkTRM0pOZ9I7joYdUwfJZaZBOPBQ6n94gc7C9wI7IAqGrtk+MycgkrfyTPKnllIGfYRFE1rTaE8niymx0Wci9l5UDcTNtES/zzWq5Zim4ix2hm3+UT8JRKP80F/r6fXnsz2IeFu0L3FmoCP+Ghipd1FS8Zp3r4krCR2r3uSHMFiAZ+ExBCBK82Jlp2Qi0zwZ2ed9bT9o97g9S9JVuLP4Jr40aQTnQO5yyrLvRiesijtv2q0uADpq8gwJIVngA+37BYHayM3OZWFC5krr/855LJtaLcQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH0PR03CA0306.namprd03.prod.outlook.com (2603:10b6:610:118::35)
 by BY5PR12MB4260.namprd12.prod.outlook.com (2603:10b6:a03:206::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 06:24:27 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::63) by CH0PR03CA0306.outlook.office365.com
 (2603:10b6:610:118::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.32 via Frontend
 Transport; Tue, 18 Jun 2024 06:24:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 18 Jun 2024 06:24:26 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Jun
 2024 01:24:25 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 18 Jun 2024 01:24:24 -0500
To: <buildroot@buildroot.org>
Date: Tue, 18 Jun 2024 07:24:19 +0100
Message-ID: <20240618062422.2916787-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|BY5PR12MB4260:EE_
X-MS-Office365-Filtering-Correlation-Id: 181b4c69-4814-4136-9495-08dc8f5f4d71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|36860700010|376011|82310400023|1800799021|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?joEi7RzIhaePrp2DTM4/K9hOWR2bY8gmPfJmwmlQBXlV+ZmFxnrGJi8JhflO?=
 =?us-ascii?Q?P1tey4G7UKa4LEYfBLv0hqWgOz7WSqS7o27/o8Al2eFEoGLC90ijtdujB8Zz?=
 =?us-ascii?Q?YEpc40zUdOu2kcM+VsYVNj09LzSMANTeFshlaJK0uwWo57ZcrwZuo2Iax4/L?=
 =?us-ascii?Q?5WstgOQ/XwZnkVTDEF5y14q+4eQBsauDX3a3Rctqpg1SIAeFpxX5//X60PGn?=
 =?us-ascii?Q?+pw+TxBQSQB4/Mtc5hVa+9FIiQ+61O6J7RFJoDtpJZrzkjrnKNNLDhBxGfM4?=
 =?us-ascii?Q?zdGCpVIViMtm8Thy9NawW+deTLDjQoB3gS/Fg2bqAFAzREhajDnz+a0Dm9QW?=
 =?us-ascii?Q?0ypYiyIgg0WzRAs7pnpnM0ISZLS6+ggEdigPPsVrwT6r+ISOzKT6ZxsO0RPm?=
 =?us-ascii?Q?DFh5Lm9Ib2nT1vXZ1MednrTGhwanaFGPnZFWl3yTgS/aZlENwRGso46TXjS6?=
 =?us-ascii?Q?6FL+TRnhlDMEFZZFyuMpt3dhlLpcXibpbghz6B85Uo7JEYdcghrAUIyMWb7Y?=
 =?us-ascii?Q?c3Hisq/UBHqN+vCDU55koiTXiDv2ElPOMm/ZVV3EMHITXpnFs6QbNXrTKTvw?=
 =?us-ascii?Q?dImPraVdN7WruYGgnu7mV0rQva9nzagkwVcKfBIzl7l88CXGqUjSbKIgxGDP?=
 =?us-ascii?Q?uwbucmsjPv0BDhSkBB0b2YI/7PyzV1LucyTR7BYBPZQChMXRAyM7lg1WCFY/?=
 =?us-ascii?Q?El6rv+EK2yKLMlJs3jUaswRjzk9vPrCganRwLs8FSwz+8ueH3DKCWWKTVdfe?=
 =?us-ascii?Q?MH3lH8ea8pIajh1SigXhpJoi8qh6PkUAARawSMaGsQC7r2q2CJ3Z87RyDSTf?=
 =?us-ascii?Q?CTf1s6XPINuxgZ87SNPArRk865Go5MdOzsBnDlRIAKlBdQ+5FXyF6p8AR1Pr?=
 =?us-ascii?Q?7U6QE5FAp8j54BLq99gzpK2OTz/exhLpVI6tFLs9Nn0y1M+p524KtRXOeDHY?=
 =?us-ascii?Q?67h3PTRKDtWRypqi1Il1Z8Hmv5Cjjm0xM3UBAA8Fn/MjRR6H4E1ed4/FFJa8?=
 =?us-ascii?Q?Fjsknu4qLKS8yc/w1oghbW1kgNZdmceVIaAg2pWuJ5ROwO/lMHsqgso/igvO?=
 =?us-ascii?Q?fkGoKwV36noetqYbE58k7kmaVb+9Oo8yHLilKnrBieXOdzpOX4DcYIcbKdx3?=
 =?us-ascii?Q?V7g29N3IlA7C0mGrLChBnomYGK5u0Gq8OnOJFth/hYxwjep/G5u8wcyR4mDH?=
 =?us-ascii?Q?/vL6BEAkANwnR0pENLcUWgsWE4Y8DMEo6Dtw+iPzmmdQAI1Otfz19PCDSwWf?=
 =?us-ascii?Q?zUHTJVoOqVvI3nyoBeLbqU1N9vdbE4r1TzmEl1h0BPtP30JnfWHx0dLQfHcz?=
 =?us-ascii?Q?U8C3Za7py/X03HVX71UT6CKEywQN6vjYUThc+UQT+ONT0xJJk6gCYzCxf9X3?=
 =?us-ascii?Q?czrxGDpSrweaFNiTq2DC3e+HjWq9?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230037)(36860700010)(376011)(82310400023)(1800799021)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 06:24:26.2784 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 181b4c69-4814-4136-9495-08dc8f5f4d71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4260
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjJ8csKMHWWKUjT2vDdAp0aZeKFJkK8k68iSFVsGPb4=;
 b=h0BDY4S5zbWoH6zOXWMlI63V65cdDjRQSy2R0GvQdFALibpzjsZndap0tQJFkQZhRcWWQ3KLA96YVwD4ExJXwnIIvlQrJnlbG1nADJjtcjwSjHe8kq2vEcLEXbANJXD1GlX6Wsqvyrdqgk8R61ZXhNx6lbbznykcwrHaca6reSw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=h0BDY4S5
Subject: [Buildroot] [PATCH v2 1/4] boot/xilinx-source: new boot package
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

This patch adds a new boot package for building boot firmware for Xilinx
versal, zynqmp and kria targets.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- add make dependency to be sure bare-metal toolchain is built before trying
  to use the toolchain for building the xilinx-source firmware
---
 DEVELOPERS                            |  1 +
 boot/Config.in                        |  1 +
 boot/xilinx-source/Config.in          | 45 +++++++++++++++++
 boot/xilinx-source/xilinx-source.hash |  2 +
 boot/xilinx-source/xilinx-source.mk   | 70 +++++++++++++++++++++++++++
 5 files changed, 119 insertions(+)
 create mode 100644 boot/xilinx-source/Config.in
 create mode 100644 boot/xilinx-source/xilinx-source.hash
 create mode 100644 boot/xilinx-source/xilinx-source.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 8bfd36f1d8..adfd9520ea 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2340,6 +2340,7 @@ F:	board/xilinx/
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
index 0000000000..bf87ff4178
--- /dev/null
+++ b/boot/xilinx-source/Config.in
@@ -0,0 +1,45 @@
+config BR2_TARGET_XILINX_SOURCE
+	bool "xilinx-source"
+	depends on BR2_aarch64
+	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH = "microblazeel-xilinx-elf"
+	help
+	  Build boot firmware from source for Xilinx boards.
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
+	depends on !BR2_TARGET_XILINX_PREBUILT
+
+config BR2_TARGET_XILINX_SOURCE_KRIA
+	bool "kria"
+	depends on !BR2_TARGET_XILINX_PREBUILT
+
+config BR2_TARGET_XILINX_SOURCE_VERSAL
+	bool "versal"
+	depends on BR2_TARGET_XILINX_PREBUILT
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
index 0000000000..dec97b2fa2
--- /dev/null
+++ b/boot/xilinx-source/xilinx-source.mk
@@ -0,0 +1,70 @@
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
+define XILINX_SOURCE_BUILD_VERSAL
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
+define XILINX_SOURCE_BUILD_OTHERS
+	$(MAKE) -C $(@D)/lib/sw_apps/zynqmp_pmufw/src \
+		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
+		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		CFLAGS=$(XILINX_SOURCE_CFLAGS)
+endef
+endif # BR2_TARGET_XILINX_SOURCE_VERSAL
+
+define XILINX_SOURCE_BUILD_CMDS
+	$(XILINX_SOURCE_BUILD_VERSAL)
+	$(XILINX_SOURCE_BUILD_OTHERS)
+endef
+
+ifeq ($(BR2_TARGET_XILINX_SOURCE_VERSAL),y)
+define XILINX_SOURCE_INSTALL_VERSAL
+	$(INSTALL) -D -m 0755 $(@D)/lib/sw_apps/versal_plm/src/versal/plm.elf \
+		$(BINARIES_DIR)/plm.elf
+	$(INSTALL) -D -m 0755 $(@D)/lib/sw_apps/versal_psmfw/src/versal/psmfw.elf \
+		$(BINARIES_DIR)/psmfw.elf
+endef
+else # BR2_TARGET_XILINX_SOURCE_VERSAL
+define XILINX_PREBUILT_INSTALL_OTHERS
+	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/pmufw.elf \
+		$(BINARIES_DIR)/pmufw.elf
+endef
+endif # BR2_TARGET_XILINX_SOURCE_VERSAL
+
+define XILINX_SOURCE_INSTALL_IMAGES_CMDS
+	$(XILINX_SOURCE_INSTALL_VERSAL)
+	$(XILINX_SOURCE_INSTALL_OTHERS)
+endef
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
