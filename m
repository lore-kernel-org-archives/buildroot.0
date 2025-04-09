Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F801C36002
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 06:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E341A612AA;
	Wed,  9 Apr 2025 06:47:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OW0n7lUH8SvA; Wed,  9 Apr 2025 06:47:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9853661062
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9853661062;
	Wed,  9 Apr 2025 06:47:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E8A671F1
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 06:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE1B640B27
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 06:47:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TjRgA0ieHg5s for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 06:47:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::60a;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C08E40496
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C08E40496
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::60a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C08E40496
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 06:47:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w3bqkPLHf0J4H6Ud5BmWnoZB4waTFtEPXwhPfOlkxHhnGgSqjoAWqp2l59GAmqfRnth0EYtndZCi+jz4Kgb6uy1pUKa+/xJrYtzI2hPSKm8w1WD5YiphuClGHGhpxDPdFKgTyhIaLmVEFg1TYDHn6HTvr4dk5Ix/IFungaWAVzu/Ue+MctJP7cVxMroRUXiePB7eGZLTTtkN6gms752/ZhrFdOBsIkR05mn7BmLMqOgdjuyEKEuzuH8eMb4OTZRZByEZZWmo53O9QuS9+xM9O6lqXJ0UEOqQyhujEYN0iCPswqzDfPxBVrU7NW1J3ljQJzWWBXZroKBgD8TCc/3JCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYYE+hyxn3iV5ZX5cuhcfQb11dv3AxvP9bhwYFpx1Wk=;
 b=yL1mwkUHaEYrymG4Li2XktG+oBMDqeowlpEZ5q15OnHxXOuPQF1RpRk6QqYgveUXpfgLwDOGOMCKmActSESaW7VF1lZ2RC1yOpac1W4jKjkc9kVaq+reuKeqROH2wGUXlaJRywHihKjwZsMz2IhCZtYeHgEUIXwZfmkIff3FY+9ty52mcrKsR8mGdXbsthqfJOUYrQhRI+r9NjMGPkRNqaH24Yzz1HXEg1CJvd9B/7U2adSTCijPao3sB9ZfRvA60j+v3tNcIG1hrUq2jEn6iC6oMM2+N1A0mlmaLkHCYJdfrSHF3Q6IWKm4xqXzXfYoAj7yNjGarDnZoo5vmlm/qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BY3PR04CA0001.namprd04.prod.outlook.com (2603:10b6:a03:217::6)
 by IA1PR12MB8334.namprd12.prod.outlook.com (2603:10b6:208:3ff::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.20; Wed, 9 Apr
 2025 06:47:22 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::ed) by BY3PR04CA0001.outlook.office365.com
 (2603:10b6:a03:217::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.34 via Frontend Transport; Wed,
 9 Apr 2025 06:47:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Wed, 9 Apr 2025 06:47:21 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 01:47:20 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 9 Apr 2025 01:47:18 -0500
To: <buildroot@buildroot.org>
Date: Wed, 9 Apr 2025 07:47:09 +0100
Message-ID: <20250409064711.3024937-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|IA1PR12MB8334:EE_
X-MS-Office365-Filtering-Correlation-Id: c6192573-1a78-4af0-00f6-08dd773260fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZkLr8fXneF8qetOy10ICjZdnY/ZhOOu9bNWHC9sKoTqopCKTaK2xFhcncaM7?=
 =?us-ascii?Q?w1f7KGlyh3+YjJIr3ejULQuzkZ6RgAhwC3u0sIX2dwBAI8FohjYkEvbdPnXV?=
 =?us-ascii?Q?/v5vxFYnhyx/eXSoEi9gKIEbKkqevqfVM+RJampL9qp/LSb98a7EBqKNq0Cf?=
 =?us-ascii?Q?nRubObSB5+mP5KF8l0r9AmJCP+jNSyT3WAmGhdpgIFwymhvQQNL6zBbOV9qB?=
 =?us-ascii?Q?sZ+yzsgsMWhcBirjz5bdYVVSL/Whvcv5BrX+wFC2LpE8Qw9P3EtXFAnn5Xtl?=
 =?us-ascii?Q?g7G9eWZ0ZCWtI4pDFxKzGFZUz2YPlLJaLgYgxjbc3u9IjHGBFm8LjF/NYppo?=
 =?us-ascii?Q?9d48NJnbbffMk6xU/5l8KYtPYC2JRGd7cn9iqo5Lf/YpXYJd5XJ8+9hhT/TL?=
 =?us-ascii?Q?GyhbuYKIJrb3+ek74Nx5HdtCCjUNpcSHv62XKCUDjSfNWQP7e5IHRbfbUqCD?=
 =?us-ascii?Q?gTsEQHTzAfEPPZqLmr1DxhcvuBZswiXuTUNKIXol3OqCidWottR1fxKm75lS?=
 =?us-ascii?Q?aUK1bfpWZFqj0AibW9p1xetdEitf0DF7EMCV9IlQ7fAqvD4Y4QktxNXDs6yl?=
 =?us-ascii?Q?M7Sprm2uE6KOXB5/POkpcX8ANjFwV4iICnaPniI+XJiHEWr1Q7BhMzVTmjo/?=
 =?us-ascii?Q?p36iCrIs+Naz6F8tRDEKV1v9x1i8pxekN1TpX1oXSfhrjKgWyLa/4grSMvab?=
 =?us-ascii?Q?WQd1DbDjT3rye/0uznNzHrsbbRBI7M8gGFHtsDgCsTJeikMKAtJhSdCqiwXO?=
 =?us-ascii?Q?s14O8nmFF/bFCq/QZPEAZfnIrsb90KQMABCkGtjFmGl3+II36iV/ejTLj4ic?=
 =?us-ascii?Q?kQGnHkQzHKihg02zlDFBZ4V4EyPIcpU6q22V7Y+Jn5LWA5P92X/B5dTKFVd8?=
 =?us-ascii?Q?+x7iy0jETFFyKjcucY8cHQRa5kDU+zXiz6em1TyKdQ6zs1ZnsPZD7eobI3ta?=
 =?us-ascii?Q?dUg2VpOySYfeKnGAOVPi6DsAyG2ISIIaDkZ14acGDZnG3SQROhXtzP40HA0A?=
 =?us-ascii?Q?5m6Ap6lBRcfYqlN+p7oFSi6lnwGooBn7aIZN4S2oHoq4CvkxhiA2JYIqaUKO?=
 =?us-ascii?Q?7Sr/8ywMEws5qdgRZqgCTLC8VUl9/W8WmvNWWkl9B+2ciUggThGI6KWa2e9q?=
 =?us-ascii?Q?fIRBMG31TASCqyc2QqV86JcarNtBKFwEn84ansV8Do/Tnb7N5od7DhjoTtsX?=
 =?us-ascii?Q?MI3fKEYu9JEft2T3d3imUI+U7JGJjmD/JV1NSJcJDUtWdMbBMhnSJ+qV9IX8?=
 =?us-ascii?Q?GOKEX/Du3iWuOnQtq3ePbfO3jwRa2mJn31K2/oevgotcPbr4V6cE2JkgHoKX?=
 =?us-ascii?Q?aHVyUC1NZbEBOBuDiqqSWL37tjiye7sqK5nH9GVf17awUvCtmv7JehDAr5+U?=
 =?us-ascii?Q?kxGI0/9dWj2AEY+SL2/dw3+g578Baibj+99E43oe7Ys+ar52pQO5CknroQLY?=
 =?us-ascii?Q?q81Mz4w4Fxl08/HnP5X7V+AA/C+7XVSnyp9C2mqgLiU0OaiejbBgL3eWj7ng?=
 =?us-ascii?Q?o2X+jHiAl/k/wUB29Tg6g2rOylspfEp1AG+r?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 06:47:21.4179 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6192573-1a78-4af0-00f6-08dd773260fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8334
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYYE+hyxn3iV5ZX5cuhcfQb11dv3AxvP9bhwYFpx1Wk=;
 b=VSw67iil43iG/rLvAcasf5P9zKyKZcsoCxl90fSVx2lJUb5RZ8v624ybilTWV9HyoTX2Wp7b624tAA7VI8v+c0d4Fp2JHYt4zdpt7J3TNC1y2AWEXxD5v90pQaVnMuLxPaQ2zjUi2K1ysEjqu+wL9NtqKyTYmD6PH791MYpCBJo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=VSw67iil
Subject: [Buildroot] [PATCH v5 1/3] boot/xilinx-embeddedsw: rename toolchain
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
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com,
 arnout@mind.be
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
V2->V3:
- split patch into series
V3->V4:
- rebase patch
V4->V5:
- add deprecation warning for microblazeel-xilinx-elf tuple
---
 boot/xilinx-embeddedsw/Config.in            |  3 ++-
 boot/xilinx-embeddedsw/xilinx-embeddedsw.mk | 30 ++++++++++++++-------
 2 files changed, 23 insertions(+), 10 deletions(-)

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
index 7d4fcf8b8f..6e37dc48bd 100644
--- a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
+++ b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
@@ -12,6 +12,18 @@ XILINX_EMBEDDEDSW_INSTALL_TARGET = NO
 XILINX_EMBEDDEDSW_INSTALL_IMAGES = YES
 XILINX_EMBEDDEDSW_DEPENDENCIES = toolchain-bare-metal-buildroot
 
+ifneq ("$(wildcard $(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc)","")
+$(warning BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf" \
+	will soon be deprecated!)
+$(warning Please migrate to new bare-metal toolchain config below)
+$(warning BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf")
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
@@ -23,9 +35,9 @@ XILINX_EMBEDDEDSW_CFLAGS = "-Os -flto -ffat-lto-objects"
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
 
@@ -38,9 +50,9 @@ endif # BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
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
 
@@ -53,9 +65,9 @@ endif # BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
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
