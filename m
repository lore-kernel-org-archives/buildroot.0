Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04982C27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 05:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E24EC60A35;
	Tue, 18 Jun 2024 05:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gzporBo0NWcP; Tue, 18 Jun 2024 05:57:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E3E960B42
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E3E960B42;
	Tue, 18 Jun 2024 05:57:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 908371BF285
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 05:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C02041465
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 05:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LtOYGroD4JaH for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 05:57:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::600;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1427140950
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1427140950
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::600])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1427140950
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 05:57:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CudrtBomxoqf4En1BFKI/TmVrR7c0SBOwQJX2eyFQXLxeFsTAQhlqyWRnui1k9vuyS/8bBs1f5NAnHBt0Z4bhi4xFsYAnXJo85buWNVo+ldcWduUr44yNKBVdyPfEZgliDgohCZSWo2WFaS03ZNp0lRLF/KebAl/0/TNQMNWdXguI45+K9tHv4OOXM/qH8Tt6lfdmVLc45uune/3DK+XUCXXG18ztVosFHhPzV4zRRtSaGU5jwlO3XTSGYv6YuS2T/FElB7gSraeW8WNCX4p7sQBnnmZuce5REfuLIwBu1XbuLTHrAjZv7v+vkb1uTxH2dZzfoAqGMSLJcZmLLfrBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWFRwvU5Bd1sx8zz/2AnYZIex3P1CygxcIWlwPm/aLI=;
 b=Q5CpfCCsft0F3HXLsl00W+w5J+NRUcQ1GNTDb0LGoM/AlV5YD0g8otCBjhZCB0MHc4dPGkZg7E3EIEQQidaoDGY2E49KnDEsBwTPJqMogYe0xTU6MCXxYUjxw9SqnjbIWGa7nBYByigl9x1eSSctLyspqpnidDoRB0yESqJxLepclPump17n1rj9nBpSPo7T9TicAUjGVrCQInsh9HvfeQrI8PxTZ517QCTJPaKiBk9K9Q6jhxRnrHvSUIQfTheNscC41xtest8r342pRQa92g1jzC+43+KPoLMP+uSKkNBjKQgMsEA5hmbxAMs43zamlzjLhOSv7r6mcvFSJVHAdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR04CA0351.namprd04.prod.outlook.com (2603:10b6:303:8a::26)
 by DS0PR12MB9058.namprd12.prod.outlook.com (2603:10b6:8:c6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 05:57:50 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:303:8a:cafe::61) by MW4PR04CA0351.outlook.office365.com
 (2603:10b6:303:8a::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31 via Frontend
 Transport; Tue, 18 Jun 2024 05:57:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Tue, 18 Jun 2024 05:57:49 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Jun
 2024 00:57:47 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 18 Jun 2024 00:57:46 -0500
To: <buildroot@buildroot.org>
Date: Tue, 18 Jun 2024 06:57:38 +0100
Message-ID: <20240618055739.2777769-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240618055739.2777769-1-neal.frager@amd.com>
References: <20240618055739.2777769-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|DS0PR12MB9058:EE_
X-MS-Office365-Filtering-Correlation-Id: 39bbb2d3-8711-48fc-5bed-08dc8f5b95e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|376011|36860700010|1800799021|82310400023|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uEwkwuxsaZVxCQ1ft5XDYQVAxo0ppbh1xo6l0O5RIWYzVMrLfClsdcEuAAId?=
 =?us-ascii?Q?nBpzj4Sk27hTlWDK9vUWf31zjwbtfSWjAhLVN2lg0YBs0N2MyC8yvBtSlSKE?=
 =?us-ascii?Q?soZr0zL3EyGkJe28eaHS7caLiIPc1WyPvhuQs+mVI6HY/wToWLAHeEdIwvVf?=
 =?us-ascii?Q?fJx5RPHLDDrFVmR+O+YEiITr4yjFswb+jZZPr6KbXTkteQINxh6H1FkmQjIL?=
 =?us-ascii?Q?8eJ8lOGyzqDH5tCW47cTrzdOAW5uoguqVRnNvsvCKhI1cyST5OF34tudCxZ0?=
 =?us-ascii?Q?HAdsQKNl0F/D9kszllFb0dHBsfxvKynvH6DBzOp8dHHO2P1lFBJYWf07QkXi?=
 =?us-ascii?Q?74AKwfeHOp8CemTEtqCWNdo1EojVRza8h/PyIU7DbYhI8txQ/qIN3oOkiGxO?=
 =?us-ascii?Q?zbEQ2GWqBOXkIurhhZ47dPsgs5L9Vgg9u6AC856hAL5J2hZ3rptAWGgStUbq?=
 =?us-ascii?Q?isowR8D3OpOmH7VO93HHrHM+EwB98iEUoNE+86vuuP/J0b7B9uFJjozQXKil?=
 =?us-ascii?Q?jncM4IpK7W+egDeUQ4Zoz7YuFHU/dQHcFQxGDnxrRA0OgeKf8ADzRctvE2RC?=
 =?us-ascii?Q?B+Kpn8loGMXqOREjLjLtms+zw1gWJ0J6YVSoDIY3mFs+ls3ShQT6Ueyw8qr6?=
 =?us-ascii?Q?QzXuZPyL9fCzsf58qeslB5HFN+CymJORTgY3PdswgaHJ/kSTUAdmi54rFv3f?=
 =?us-ascii?Q?LoJYBMI4CcgN5fC/qTWHJvJ8cb87Faahkk/En7zONgzA5sY/q04EGGrXfhQ6?=
 =?us-ascii?Q?axtQvpADxmGl1SQ8g6s+naDCwIC4KI8FrdJo1AE1Uff/Ru+B9e/kFkiMiPzE?=
 =?us-ascii?Q?Gz+AfRmarsjYiOjRiEr03iHv3Wx+m5T0SkAruu6G38SaBQ+aisf/Nz6QkBp/?=
 =?us-ascii?Q?G5PMlOYMWIJGIGGpN3VLATNAiOQ6o0Qyq84uSWdeGEkRpE+rUTVnaL5W6skS?=
 =?us-ascii?Q?qcAcj3+ZCgJ1TzgumjCAPkyWiGroR8Qgu1e7KNxy8GQuCafrKnotwNBBvl8o?=
 =?us-ascii?Q?yzAWbHFhG7SB00BDmwrNHezFRcQm4hjziX+7ZoevY9iTH9YkuC1TWyR+6z2Y?=
 =?us-ascii?Q?rnq+HIFUCU2Ijn4OTK5uNovkgc1K6s7fmRv3CNQjO6TdfUgh5E6V8jhi96tZ?=
 =?us-ascii?Q?488jVuP14aOalK9T5nEfQLlIDx6m+mxS8YOOO/aG0XS3yDsBZln/JerDG12m?=
 =?us-ascii?Q?9++RBAkTSGqUf5EOOukMrJMm+J6s0klnLFiOfJF51yJTV/VYP2kZ6Y+XMyHI?=
 =?us-ascii?Q?AWruBbfZi2yS+IX1KyKs9gJx8kQAMYxfiVZRX6cgX6jrv1o/v8xR5fypgzdD?=
 =?us-ascii?Q?2mfyWa4vYibx15IW2BaiOEkyvagJShJydB6S4tlw8Z392yk0w+LpjSIP118b?=
 =?us-ascii?Q?tW3fdaDiEACh9Y21WSeoGzYS0bq+?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230037)(376011)(36860700010)(1800799021)(82310400023)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 05:57:49.6950 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39bbb2d3-8711-48fc-5bed-08dc8f5b95e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9058
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWFRwvU5Bd1sx8zz/2AnYZIex3P1CygxcIWlwPm/aLI=;
 b=RNAlDmnhYCIWzbNumynQb6Bkl9KXcP4nNfi5EkqB60WV29x0UPvMiTLVu6agZvz8QYdp+/BtYKbMkNwyzoF5035J6ZmIjfrTfN9P7d2Sg7UCI2faqx9ZXHMycPkRyX9TGDS/33MufjlgEW3NzwKvWJL8HLyyJ9pO69nNNdoCZyc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=RNAlDmnh
Subject: [Buildroot] [PATCH v1 3/4] boot/uboot.mk: new zynqmp pmufw source
 option
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

The new BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE option will enable u-boot to
use the xilinx-source package for building a pmufw.elf that gets included
in the generated boot.bin.

If the BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE option is enabled, then the
BR2_TARGET_UBOOT_ZYNQMP_PMUFW config for downloading a prebuilt pmufw will
be ignored.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 boot/uboot/Config.in | 20 +++++++++++++++++++-
 boot/uboot/uboot.mk  |  3 +++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index f37040a28a..3aef222772 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -512,9 +512,12 @@ config BR2_TARGET_UBOOT_ZYNQMP
 
 if BR2_TARGET_UBOOT_ZYNQMP
 
+choice
+	bool "pmufw.elf prebuilt or source"
+	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
+
 config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
 	bool "xilinx-prebuilt pmufw.elf"
-	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
 	depends on BR2_TARGET_XILINX_PREBUILT_ZYNQMP || BR2_TARGET_XILINX_PREBUILT_KRIA
 	help
 	  Use xilinx-prebuilt boot package for downloading prebuilt
@@ -525,10 +528,25 @@ config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
 	  by the ZynqMP boot ROM) containing both the U-Boot SPL and the
 	  PMU firmware in the Xilinx-specific boot format.
 
+config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE
+	bool "xilinx-source pmufw.elf"
+	depends on BR2_TARGET_XILINX_SOURCE_ZYNQMP || BR2_TARGET_XILINX_SOURCE_KRIA
+	help
+	  Use xilinx-source boot package for building
+	  zynqmp pmufw.elf from
+	    https://github.com/Xilinx/embeddedsw repo.
+
+	  U-Boot build process will generate a boot.bin (to be loaded by
+	  by the ZynqMP boot ROM) containing both the U-Boot SPL and the
+	  PMU firmware in the Xilinx-specific boot format.	  
+
+endchoice
+
 config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
 	string "Custom PMU firmware location"
 	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
 	depends on !BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
+	depends on !BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE
 	help
 	  Location of a PMU firmware binary.
 
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 19f4cdb557..837cb01f68 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -439,6 +439,9 @@ ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
 ifeq ($(BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT),y)
 UBOOT_DEPENDENCIES += xilinx-prebuilt
 UBOOT_ZYNQMP_PMUFW_PATH = $(BINARIES_DIR)/pmufw.elf
+else ifeq ($(BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE),y)
+UBOOT_DEPENDENCIES += xilinx-source
+UBOOT_ZYNQMP_PMUFW_PATH = $(BINARIES_DIR)/pmufw.elf
 else
 UBOOT_ZYNQMP_PMUFW = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PMUFW))
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
