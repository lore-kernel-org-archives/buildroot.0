Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594F9C021A9
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 09:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 004EF831F2;
	Tue, 18 Feb 2025 09:23:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BGf65zqLg6Es; Tue, 18 Feb 2025 09:23:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4971883145
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4971883145;
	Tue, 18 Feb 2025 09:23:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EBF7C8
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 09:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62DC941204
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 09:23:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KiJcVL8Xmi93 for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 09:23:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2405::617;
 helo=nam02-dm3-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9BA50411FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BA50411FF
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::617])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9BA50411FF
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 09:23:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oOs3+aNsW3LPtHFEGOeVD2QD5fj8pqXeJMXUBdRzZd2PxTMv3CM0FAZFD+MkYDmvuEvRG96Ib6q1+n4Qg2vRmSKwUUcA20ObQuwafQqk0Zu0W3b/CqoHMXYTjKCSaTfzKzGVwNP/37altrNRH2Ny6QnHoj6/NeDB3i9Df+N+QQW1rVLfIJxdzcWsOlofRwPdTuCB2a1FpEe3D5w53FsuFSNqT0egK14WVl6K82GMrXMNNBxXDJWagtWNiEO2qWUnbeHtXd/4MHIVA+X8TLgPqCBxLim2cAsCllq/yK/c4zmz8bW1tTJ5UP8WoKy1S49JIHc7N09Bfleu23jAp1LC8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdsj5O5NeZOfv2Jym9RVD8RunwbIrwSmT/MLq/Ps9yE=;
 b=IpmhumJyAzofhSsDElpl6gD7fdP0KNMeXZBkqkBsrtICH+9xbrBJvnkGlidY4MiR1t71U9WcMHZEhjDH0S07vWCyAjmxBK1EHNi9cuEJyvYSVoDVAeNL+qH2fT6nPAMTDeVfyoACkW4Wfp8wulMOuAYrs9tYbIAohFQJL+yr8Uw8mRJjEieeeLkbf87/mEhx00n8r9GMxjvP1jLSjOI+5pVHItWvJpElLirLS5ogkdwvWkLdcyrjfoJaz4p4Z8Ofb7YFa8CZ+ZKLTcSz3tMR1+T3xh8e98b2ycz2Ykbp61+L3zi1ykdVP2UBrNvobQ69/oXSa0TjjTurkH3ozTV73g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH0PR04CA0010.namprd04.prod.outlook.com (2603:10b6:610:76::15)
 by CH3PR12MB9217.namprd12.prod.outlook.com (2603:10b6:610:195::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Tue, 18 Feb
 2025 09:23:00 +0000
Received: from DS3PEPF0000C37F.namprd04.prod.outlook.com
 (2603:10b6:610:76:cafe::ae) by CH0PR04CA0010.outlook.office365.com
 (2603:10b6:610:76::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.17 via Frontend Transport; Tue,
 18 Feb 2025 09:23:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF0000C37F.mail.protection.outlook.com (10.167.23.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Tue, 18 Feb 2025 09:23:00 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Feb
 2025 03:22:59 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Feb
 2025 03:22:59 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 18 Feb 2025 03:22:57 -0600
To: <buildroot@buildroot.org>
Date: Tue, 18 Feb 2025 09:22:56 +0000
Message-ID: <20250218092256.1000685-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37F:EE_|CH3PR12MB9217:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b8774eb-1bf8-4145-8c2c-08dd4ffdd6b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WsIqKqS6UDNbs3P6x1scv8JzTG7+TwiWUg9/Ac++JNBboRLwNg+uWWMyErqN?=
 =?us-ascii?Q?9yHEL74re7La+BEQQzEjW4nWUqOhwlNqX9//y1ieFKY2f+ZnynjPLLByrvQ6?=
 =?us-ascii?Q?dkzBEkeg5UuMR5tkswQfJzjpLLSvDAzd8iHR6A8PGk3A9TwnjA2dU77Np4us?=
 =?us-ascii?Q?K2qE1Akc5sNxbg2QqiOnqgOYAQhCRbvd80uzsgRFi6SYTCy66ON55AIzWGJj?=
 =?us-ascii?Q?iRwTBt6Kys+xTH2U5Sc8/GQUwt/gHGtVLNDbjRqJCrBjFFWinegyrpzm5d5P?=
 =?us-ascii?Q?dATAe8TT8JhiIHoTWg8Hwzb1vQdVXkJnTYtH2Y+NNh66r+YY+so/DsDxjDa7?=
 =?us-ascii?Q?O9dvKzXruo992AFFbemaWxx/S16bMIey6DnbbTDcDZVhEsJERb/dMvLaUj+U?=
 =?us-ascii?Q?oPke5Iub78vcJ0c4Ru8PRSgnUCkX5vRKPxaPW7rDqzSyILGsnQLrlVaca6XZ?=
 =?us-ascii?Q?fizTW464pI1IhgCA7xtiSkTuy9fVUZZkT9JKszC+Hn0dq9FGEcpwlP3buKNj?=
 =?us-ascii?Q?0xgM/gcaq+GlpOV8ZyPRPBMQ5G6bhDFj2QOy6DLcuLdG0c+1FaIa2mUUikVW?=
 =?us-ascii?Q?gUPhwlnGU11HmcB/9zTgwAI4QQ/XIOBz5JFx9wcwBYdajw6aA8dvWPEkJZ20?=
 =?us-ascii?Q?bnRWDg+JEAU9a/i2VdOpMm/vvccawcZWUBqd2FUIF5b781wMdqpcho+G96bV?=
 =?us-ascii?Q?e7C0EZhDb/RA3XL4Bcuwboat5/L2fVtizkaLrS2MMIHLEgxvx2yKBc4UItxw?=
 =?us-ascii?Q?r+IvXJOyfWhp+kxW+lMWAJzMpigZe8MlZWAIBzZqnsrVLdqzS4JQsnT7kzw5?=
 =?us-ascii?Q?T5PnO5NPCziBuGxQbqJzWl6b9sCsXp0Fq1YJHWoIpggbQaNorpSwlmGOCIxA?=
 =?us-ascii?Q?xb3z9I2p54k3DBxfFrFSsTlHmlt5elV7dk57pdyu/na0hJ/J11ilCvkq6yZN?=
 =?us-ascii?Q?w9GLUWMgPEwvoC6zk8gIISrehyAKLq403tAifrQVB/ASAXcoxV8GVHsFgt88?=
 =?us-ascii?Q?QCQcbU25woWwOHwXnI1XN+gyIBK5wYti2v8d0Ly3KQMOHlJ1iSzyWFA/ZC/q?=
 =?us-ascii?Q?Haq+ba1Q61Lcgl3s9gu7xoDNKtqcxLXIUiW46UVnlM0j6B+lZskggYCjliM1?=
 =?us-ascii?Q?7F2R4d/q7gwv9coX+w+pT3aAgNQCQuBkrmiHXEYi0AcJZcgw1KiCf342xZQP?=
 =?us-ascii?Q?0MIWpzBYUpmVThMarFU91mNxrnWmCGBg0BdSMK5TY9FgRVirAy56vB0+jcjZ?=
 =?us-ascii?Q?l1xMjcdCjrpDatUJeQo6ceDsRAReCvIr8dBZawO5SWSzLUnKaPhziK1fcPRB?=
 =?us-ascii?Q?H/qwdKPjvOu+TVKXVNt8sZEix7+lidTVQ2uMVSDhbrZjNKq8wyRMgEkiQHAE?=
 =?us-ascii?Q?m3nRyVHQ2fYofk/RBXOd7csNGgi2234Z1hyzNzT1QEWgxwwazOqBYH18MpIc?=
 =?us-ascii?Q?zVDztmp+04sI7QzR3DntCWwMXECGQsJX6e/J3g/9VVp5P1VGPbL7aEVXaqyM?=
 =?us-ascii?Q?SYDowgeqpnFc2GXKsdqI/L8Vy1vRITYKlY/X?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 09:23:00.3017 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b8774eb-1bf8-4145-8c2c-08dd4ffdd6b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9217
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdsj5O5NeZOfv2Jym9RVD8RunwbIrwSmT/MLq/Ps9yE=;
 b=uEeRn8b0bx8Tkcua807tHO2a2k1JiVoTyAQO09V5d467jmCZiFmX4BOb+XvVkJBssFZuCOh6lILiPkrLpIG8mtCWONSZ5H39ndqxXVdNU07VGm55o390l+uGHHf0rJ/+/Ak2SWGLIGzKl3aACCi4rRgtiTZoAgttkMwG818Kahk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=uEeRn8b0
Subject: [Buildroot] [PATCH v2 1/1] boot/xilinx-embeddedsw: rename toolchain
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
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com
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

Either vendor name is now valid, but the documentation will describe using
the Buildroot vendor name.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- xilinx-embeddedsw is now backwards compatible with either vendor name
---
 boot/xilinx-embeddedsw/Config.in              |  3 ++-
 boot/xilinx-embeddedsw/xilinx-embeddedsw.mk   | 26 ++++++++++++-------
 configs/versal_vck190_defconfig               |  2 +-
 configs/versal_vek280_defconfig               |  2 +-
 configs/versal_vpk180_defconfig               |  2 +-
 configs/zynqmp_kria_kd240_defconfig           |  2 +-
 configs/zynqmp_kria_kr260_defconfig           |  2 +-
 configs/zynqmp_kria_kv260_defconfig           |  2 +-
 configs/zynqmp_zcu102_defconfig               |  2 +-
 configs/zynqmp_zcu104_defconfig               |  2 +-
 configs/zynqmp_zcu106_defconfig               |  2 +-
 .../toolchain-bare-metal-buildroot/Config.in  |  2 +-
 12 files changed, 29 insertions(+), 20 deletions(-)

diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
index b0691d7e7b..9835f813d0 100644
--- a/boot/xilinx-embeddedsw/Config.in
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -14,7 +14,8 @@ config BR2_TARGET_XILINX_EMBEDDEDSW
 	  Applications can be found on the Xilinx embeddedsw repo:
 	  https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps
 
-comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-xilinx-elf"
+comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-buildroot-elf"
+	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-buildroot-elf"
 	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-xilinx-elf"
 
 if BR2_TARGET_XILINX_EMBEDDEDSW
diff --git a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
index 7d4fcf8b8f..eff015bc35 100644
--- a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
+++ b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
@@ -12,6 +12,14 @@ XILINX_EMBEDDEDSW_INSTALL_TARGET = NO
 XILINX_EMBEDDEDSW_INSTALL_IMAGES = YES
 XILINX_EMBEDDEDSW_DEPENDENCIES = toolchain-bare-metal-buildroot
 
+ifneq ("$(wildcard $(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc)","")
+XILINX_EMBEDDEDSW_MICROBLAZE_CC = $(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc
+XILINX_EMBEDDEDSW_MICROBLAZE_AR = $(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar
+else
+XILINX_EMBEDDEDSW_MICROBLAZE_CC = $(HOST_DIR)/bin/microblazeel-buildroot-elf-gcc
+XILINX_EMBEDDEDSW_MICROBLAZE_AR = $(HOST_DIR)/bin/microblazeel-buildroot-elf-gcc-ar
+endif
+
 # ZYNQMP_PMUFW application allows users to add cflags
 XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS = \
 	$(call qstrip,$(BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS))
@@ -23,9 +31,9 @@ XILINX_EMBEDDEDSW_CFLAGS = "-Os -flto -ffat-lto-objects"
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
 
@@ -38,9 +46,9 @@ endif # BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
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
 
@@ -53,9 +61,9 @@ endif # BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
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
 
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 0967407304..1105a3d57e 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -2,7 +2,7 @@ BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index c0c850e586..e59d8a114e 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -2,7 +2,7 @@ BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/versal/vek280/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index 2d77580fab..e09b8d49ec 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -2,7 +2,7 @@ BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 85ef7d5aa2..57418a47fd 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/zynqmp/kria/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index c5cfe2fe86..415d2fc4b1 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/zynqmp/kria/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 288606fc02..a689be74bc 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/zynqmp/kria/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 1e453adeb0..45895c17ed 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index 13ee5ff5dc..a81b113d3a 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 2669afe1f6..ad64f317be 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
diff --git a/toolchain/toolchain-bare-metal-buildroot/Config.in b/toolchain/toolchain-bare-metal-buildroot/Config.in
index c86c5d725c..19c97410c6 100644
--- a/toolchain/toolchain-bare-metal-buildroot/Config.in
+++ b/toolchain/toolchain-bare-metal-buildroot/Config.in
@@ -10,7 +10,7 @@ config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH
 
 	  For example, to build both a Microblaze and a RISC-V bare
 	  metal toolchain, use the following definition:
-	  "microblazeel-xilinx-elf riscv32-buldroot-elf"
+	  "microblazeel-buildroot-elf riscv32-buildroot-elf"
 
 source "package/newlib-bare-metal/Config.in"
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
