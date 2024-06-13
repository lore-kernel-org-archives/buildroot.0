Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A72C27C6E
	for <buildroot@archiver.kernel.org>; Thu, 13 Jun 2024 06:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A454760B50;
	Thu, 13 Jun 2024 06:14:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G43O1TGXQZtE; Thu, 13 Jun 2024 06:14:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90E1F60855
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90E1F60855;
	Thu, 13 Jun 2024 06:14:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 29C671BF35C
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 06:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14F4A81420
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 06:14:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lr6FU3SpIxwY for <buildroot@lists.busybox.net>;
 Thu, 13 Jun 2024 06:14:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2408::619;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A4B4F81E14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4B4F81E14
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::619])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4B4F81E14
 for <buildroot@buildroot.org>; Thu, 13 Jun 2024 06:14:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kPVeGn6JZgctcj19c+c0YUDT9ucAu46/XDxV4lDXX41dzTc3CskwZFNxN/X8V0uNkNHulaYvF91Q0xF5qjO1GL1pHxVc6rIkvpaYuWpFxGD7EboZY5nQFuOahUnbFZ2sY0mCgEJHC0bUIQFJ2XraBbGw+6yO/KOoiqXkjGEzdEh8k2xNVoEZ0AaSsBPnH5WLRtrhlqTur1WJUVypluIgLY0nvAGasgZ8Cs29UDbXXCxzEhlX7zFMQKmQB+ikg+EMrqsnrpkAQHBLyr706BT+WoDankDbb2cFXLFVYAmsRQsjDn005JPgCH2ikOjwEMhbB8Tze/WQbzNKGrTwv5Judw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1sy2P1tgia3MBiBWRbf1uuIgoY6sxzrF4JpdVQJWWYY=;
 b=fYJIxWO1laS3dyxMPDk4iO3hw0UONZbT1oSdxfVpSz1HJoLqZjk974w49hygq90mv2g91I1YMuFaRHOAhLRdxNz/l7k2qpwgm9ptHNTNg4mC3aKjFMxkog7gaQmRaHrjofSRqXBPH6m7AEtHXTk94uF/NTmaJuBBtJ4DNdfXT8wskVlHXvhcts3DxrrQ0x5B77tQaCSJ6LUXiIdnWsYI9UVmC2Z2/7kEUYRcgQR4HzmSsoJSfJIXowO6wYz/Ud8ASa1N+6qQbh/sx6NrQ1ch7X77xELDe9B9JBs+uJkkF1mbI8325qbL6TW8EQEo33fVqjco3f63p+jWAH/8TsJV3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DS7PR06CA0023.namprd06.prod.outlook.com (2603:10b6:8:2a::14) by
 DM6PR12MB4251.namprd12.prod.outlook.com (2603:10b6:5:21e::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.20; Thu, 13 Jun 2024 06:14:49 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:8:2a:cafe::11) by DS7PR06CA0023.outlook.office365.com
 (2603:10b6:8:2a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24 via Frontend
 Transport; Thu, 13 Jun 2024 06:14:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 06:14:48 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Jun
 2024 01:14:46 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 13 Jun 2024 01:14:45 -0500
To: <buildroot@buildroot.org>
Date: Thu, 13 Jun 2024 07:14:19 +0100
Message-ID: <20240613061423.1737631-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|DM6PR12MB4251:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b4d7db1-c499-4a97-aa34-08dc8b7020f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230034|376008|1800799018|82310400020|36860700007|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qKMoNHkg8Qgew9XX2qKfOSuyGlqR9DFPdeYWnBIENwPxrdVva7WLJrYWTbP1?=
 =?us-ascii?Q?4kyh2aBXJt6rRp9ugFWx3bjFbbzrD76uryC47py1xWe5/30HvImQm8uo0AMK?=
 =?us-ascii?Q?CpOgKJwHfKu4aWRFptKZC42F/I/gGnOBqRekSIlObLCUOW/1+sdiEJVkA6ES?=
 =?us-ascii?Q?8DZ6Te2AbIVKDy1Ijlm9TPNJAgjcgWGnvB81E2UVrIOR/HB/fJjh1aBZar3q?=
 =?us-ascii?Q?El2q2hBTIrkxONpqzq/9hPqro3W1XMynvT/gBflB1FsUFgeop5cmGIiOcem5?=
 =?us-ascii?Q?JsR9HRJiMoaCaElKby0TkMqsdikKOqhti6b8ZGHjQoO71fuj2tZefIrlp/Jf?=
 =?us-ascii?Q?NQOGilURr4n81jzAHiB1hovoo8WZNcJvWkMilqpUip5oAu1WOXl82HiYbPkr?=
 =?us-ascii?Q?AgTtmjzUNm5nr8o8kacfVO9FbyPcPdWFAaza/pGwKIDLFtAyTnMhEqzeGT7C?=
 =?us-ascii?Q?tCU8cYCwseH2Iw02zzLWtmzKeJ48k0saM8K6jCqu1XHsLBs/YFrS9Ljdm1tK?=
 =?us-ascii?Q?lVShr+SaQOyQvTlcazP1fi1NoJ1yPpEa5TpDfnEsg5u2G2OqCY1BRpM8MfI0?=
 =?us-ascii?Q?b0nLf+r0YhN7hkbIciCuV4lT+X4gUUUnhcm91byybOBqA1M5ttbTcwx9Eqo+?=
 =?us-ascii?Q?LYGAspJEtDE8DeIQPJndyAPC5FSlsJBWEY82Gsms9AkYELrf2dbUvY0cUVLC?=
 =?us-ascii?Q?pMMr84wVsGIwul/R7SkqPFRA1A/hCu/uiRllztKzsC/5A8dLAA9GY/Vq+RHL?=
 =?us-ascii?Q?f7GuivPzPSqDiaUg/x9hdTzwuYCLw5kla19LNmq4Zq7zEV7HmzomzuCxIVMF?=
 =?us-ascii?Q?FhpgpE7Zxq/h95Nm32eDmNKtTb/qeC0FUvWqLPbRg/k+/1TMeEND2njyC4m6?=
 =?us-ascii?Q?nT04MDbggt/7i+Cdf0b/SIWsAR5UWtrvH2bK88IaHlkyGJgkk0+Ljds2V2Ld?=
 =?us-ascii?Q?4Mg3qhEolOePNTEmcuAcER7moxHCO2xEiIKp7Ns3OwZNAXw+il0L1KVSpmnZ?=
 =?us-ascii?Q?2F9ifiaZb/0jBLrip71RP5KvpcpLwqBuajxM2ToKhJYbIKOput4sgcfY6Yz7?=
 =?us-ascii?Q?gjgHk1JyTDHdV81CT/xJGmCUJaXqWmvw0A2bzYFDNxUy7xWDwCSF/VO5MBeG?=
 =?us-ascii?Q?gMu1GuVUW0TBWkpvrPi3kSoI/L4e5GuwGpzTiVJZ3ivK0CrLxjfPTDecGm8H?=
 =?us-ascii?Q?OSy/oegxeh5D8h0XCWX7zurAD3NWlMJWrAYXDsPB0K4XDtFEK9F2HNnTJLdD?=
 =?us-ascii?Q?c4hFZxT0VM+U97tOjn4fWXHk/hm53m/uHuPL5e0TvJ0aNA6BeCw+CoKKxnwy?=
 =?us-ascii?Q?0YN6rWdCFa73rxS0pVNvxsXwtj/9kzDXr5XzUhq8gmcAtGUNftiFqOEXEcPL?=
 =?us-ascii?Q?7RPpaQJHKH5QQr1w57vZ4ECVsfDp+n3Qb0z0ekVqab14IEraKZDnO+YpXf/O?=
 =?us-ascii?Q?azC46wRB6lPmooJM0Ihaq5y6pEdxsOE2?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230034)(376008)(1800799018)(82310400020)(36860700007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 06:14:48.2105 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b4d7db1-c499-4a97-aa34-08dc8b7020f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4251
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1sy2P1tgia3MBiBWRbf1uuIgoY6sxzrF4JpdVQJWWYY=;
 b=w2xJ3KWRZmfJmecLZqsu55YV+rvDMpgXcm1LewIeIWAtBqFeF5035CJrgvNUIOKrwG49jDXst43G/Nlw7TbQJpnIKkK46P0W9eYfkww+72Ghc67PjJQrLEk7IrFjuidVEWiJQOLKPDelDdVUATB9qzQjvFldsiU+fLvOIcve0es=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=w2xJ3KWR
Subject: [Buildroot] [PATCH v2 1/5] boot/xilinx-prebuilt: new boot package
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

This patch add a new boot package for downloading prebuilt firmware for Xilinx
versal and zynqmp evaluation boards.

It solves the problem of being able to verify the hash when downloading a
prebuilt zynqmp pmufw.elf binary.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- no changes
---
 DEVELOPERS                                    |  2 +
 .../xilinx-prebuilt/xilinx-prebuilt.hash      |  2 +
 boot/Config.in                                |  1 +
 boot/xilinx-prebuilt/Config.in                | 40 +++++++++++++++++++
 boot/xilinx-prebuilt/xilinx-prebuilt.mk       | 39 ++++++++++++++++++
 5 files changed, 84 insertions(+)
 create mode 100644 board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
 create mode 100644 boot/xilinx-prebuilt/Config.in
 create mode 100644 boot/xilinx-prebuilt/xilinx-prebuilt.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index cf48e01037..93627a0064 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2335,8 +2335,10 @@ F:	package/qt5/qt5opcua/
 
 N:	Neal Frager <neal.frager@amd.com>
 F:	board/versal/
+F:	board/xilinx/
 F:	board/zynq/
 F:	board/zynqmp/
+F:	boot/xilinx-prebuilt/
 F:	configs/versal_vck190_defconfig
 F:	configs/zynq_zc702_defconfig
 F:	configs/zynq_zc706_defconfig
diff --git a/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash b/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
new file mode 100644
index 0000000000..c955cd79f5
--- /dev/null
+++ b/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  7abcba4e0e44e3a4adf9c1f971d918575226d7604dfd64a386baaa00c1c6c35f  xilinx-prebuilt-xilinx_v2024.1.tar.gz
diff --git a/boot/Config.in b/boot/Config.in
index 87e1b7c00e..1378a04d19 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -23,5 +23,6 @@ source "boot/ti-k3-boot-firmware/Config.in"
 source "boot/ti-k3-r5-loader/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
+source "boot/xilinx-prebuilt/Config.in"
 
 endmenu
diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
new file mode 100644
index 0000000000..ec38e41993
--- /dev/null
+++ b/boot/xilinx-prebuilt/Config.in
@@ -0,0 +1,40 @@
+config BR2_TARGET_XILINX_PREBUILT
+	bool "xilinx-prebuilt"
+	depends on BR2_aarch64
+	help
+	  Pre-built firmware files for Xilinx boards.
+
+	  https://github.com/Xilinx/soc-prebuilt-firmware
+
+if BR2_TARGET_XILINX_PREBUILT
+
+config BR2_TARGET_XILINX_PREBUILT_VERSION
+	string "prebuilt version"
+	default "xilinx_v2024.1"
+	help
+	  Release version of Xilinx firmware.
+	  Must be xilinx_v2023.1 or newer.
+
+config BR2_TARGET_XILINX_PREBUILT_BOARD
+	string "board name"
+	default "zcu102"
+	help
+	  Name of Xilinx target board.
+	  Used for installing the appropriate firmware.
+
+choice
+	bool "family variant"
+	default BR2_TARGET_XILINX_PREBUILT_ZYNQMP
+
+config BR2_TARGET_XILINX_PREBUILT_ZYNQMP
+	bool "zynqmp"
+
+config BR2_TARGET_XILINX_PREBUILT_KRIA
+	bool "kria"
+
+config BR2_TARGET_XILINX_PREBUILT_VERSAL
+	bool "versal"
+
+endchoice
+
+endif # BR2_TARGET_XILINX_PREBUILT
diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
new file mode 100644
index 0000000000..98dd18da0d
--- /dev/null
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# xilinx-prebuilt
+#
+################################################################################
+
+XILINX_PREBUILT_VERSION = $(call qstrip,$(BR2_TARGET_XILINX_PREBUILT_VERSION))
+XILINX_PREBUILT_SITE = $(call github,Xilinx,soc-prebuilt-firmware,$(XILINX_PREBUILT_VERSION))
+XILINX_PREBUILT_LICENSE = MIT
+XILINX_PREBUILT_LICENSE_FILES = LICENSE
+XILINX_PREBUILT_INSTALL_TARGET = NO
+XILINX_PREBUILT_INSTALL_IMAGES = YES
+
+ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL),y)
+define XILINX_PREBUILT_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/$(BR2_TARGET_XILINX_PREBUILT_BOARD)-versal/plm.elf \
+		$(BINARIES_DIR)/plm.elf
+	$(INSTALL) -D -m 0755 $(@D)/$(BR2_TARGET_XILINX_PREBUILT_BOARD)-versal/psmfw.elf \
+		$(BINARIES_DIR)/psmfw.elf
+	$(INSTALL) -D -m 0755 $(@D)/$(BR2_TARGET_XILINX_PREBUILT_BOARD)-versal/*.pdi \
+		$(BINARIES_DIR)/vpl_gen_fixed.pdi
+endef
+endif #BR2_TARGET_XILINX_PREBUILT_VERSAL
+
+ifeq ($(BR2_TARGET_XILINX_PREBUILT_ZYNQMP),y)
+define XILINX_PREBUILT_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/$(BR2_TARGET_XILINX_PREBUILT_BOARD)-zynqmp/pmufw.elf \
+		$(BINARIES_DIR)/pmufw.elf
+endef
+endif #BR2_TARGET_XILINX_PREBUILT_ZYNQMP
+
+ifeq ($(BR2_TARGET_XILINX_PREBUILT_KRIA),y)
+define XILINX_PREBUILT_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/$(BR2_TARGET_XILINX_PREBUILT_BOARD)-kria/pmufw.elf \
+		$(BINARIES_DIR)/pmufw.elf
+endef
+endif #BR2_TARGET_XILINX_PREBUILT_KRIA
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
