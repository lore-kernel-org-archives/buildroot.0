Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404A3C27C53
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 07:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC21582149;
	Wed, 12 Jun 2024 07:56:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id izlN7wvRiGQ1; Wed, 12 Jun 2024 07:56:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72FC18212C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72FC18212C;
	Wed, 12 Jun 2024 07:56:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C412E1BF3A1
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 07:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B20658212C
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 07:56:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vUpF9ZzwULlt for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 07:56:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::623;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BEB958210F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEB958210F
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::623])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BEB958210F
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 07:56:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HEVV/46M9waXDh+rh41IEWR9joQEjw/eyh7KOBsCM+2lILSKH1fWeFFic1SqgTBDd9peKO33NATyOGGOEdLSylFbZlrH3Ig5eb0xbAlTyFo0NWgP+cD4jbRlnior3X424lhm3D7qcafpfgieraSLpk5EBBDnlqQ8V/SyR9Ba/xhCW37J7VFaekK5U6/QYsqB/0d3YQxoFk0FYxSNK7TH8C1S30MNu4Xfn/Rusc5MEjjBjffrDcDTvuj2Hej1/fyDX0Auq8ic4sRBs0X5WpzyKVmW67HpjdTzVW2ocXbNF+VYQ95dZz23HPVxE5y2sZS7alt+tOpj+4Dky/4FfeH2FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJf63E5ddaTnFl953Dp869N0rNGOsPRPTHM/CxLfB/Y=;
 b=Gu8XHbIbrJoNYK2cOucqMouz8aVwIk2iHSiMu78ciB93UDmXvD9NzTf1UMrUqZ9Ha5pyRVGOcSeXLRwGalOTCNPP2KlCaKXIFCMpyiFIJCue4xOT9U/5YhEZqEx8zzRw9hL+yBhbvVCjFsIZbszR7QN6WUY783GPihoVs4a3e3OebJIkq00g5qU3P1vK04TdMBs7krXRWVsZl3vz3NeNRm1XDnHhBsXpat8DJQ5QGFWeBiAhWVEYeNBRgec+q4UQ1IjyTXiyJDE+lEQnPpjy3JQBufJaKYKmhGWrnK7zd+uygg0Haad0Ea+7sxvtEj7AYo3XForwi4yIcOgjf/uCIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DM6PR13CA0007.namprd13.prod.outlook.com (2603:10b6:5:bc::20) by
 DM4PR12MB8560.namprd12.prod.outlook.com (2603:10b6:8:189::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.37; Wed, 12 Jun 2024 07:56:05 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:bc:cafe::1f) by DM6PR13CA0007.outlook.office365.com
 (2603:10b6:5:bc::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.17 via Frontend
 Transport; Wed, 12 Jun 2024 07:56:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Wed, 12 Jun 2024 07:56:04 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Jun
 2024 02:56:03 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Jun
 2024 02:56:03 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 12 Jun 2024 02:56:02 -0500
To: <buildroot@buildroot.org>
Date: Wed, 12 Jun 2024 08:55:54 +0100
Message-ID: <20240612075559.436482-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|DM4PR12MB8560:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e813758-1353-4bb3-9100-08dc8ab51c0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230032|82310400018|36860700005|376006|1800799016|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G8EuEWMkoh3RgL2GA4XaxtTjzD8sB1tLmmWxeAnO1w6BKZWAIofPNHacbZKq?=
 =?us-ascii?Q?TnE5UqDLVKPQnSQrgabcN90wdSVSeCMhHvFyoLUjTJgg46SywNGz1gBVQgl9?=
 =?us-ascii?Q?y5u/Ulk5GXx+CBtFrIgw3cqDVMW2uzqJvR20s67NQ+oyBe2RybIsFIt2MegK?=
 =?us-ascii?Q?W2LEvlNncBL8lTOnMz7Y8vvlsugKC/8QtOtzlmr+3mRO9h2Am3RF2WK3FuHx?=
 =?us-ascii?Q?L5tOndWpBti7hBbZXkVTSpHHhNHkwPXingwulT0IR/qURioV7yj31pL21/7F?=
 =?us-ascii?Q?sk+i2POXT681GuoxnnS9K357Cm2AEPkkG6HRybPGDGukIDH1EhNh5HR3lwta?=
 =?us-ascii?Q?Wr5c8brXVcSY+DJQlkNtzSG64MYJXmFgOsAiN7bLrhqTUGsA2vtngO6l12D4?=
 =?us-ascii?Q?AwdFCGXZYhARbPyITtmUTpg5ij5NyzrZPv+odvfkXb5cvw7fK3MDULS3QdKb?=
 =?us-ascii?Q?KkQks81MOkvU3COrnZeLGkSFovv+3MqFhHmQD75bjrZCTtMFa20qevYJmG9A?=
 =?us-ascii?Q?ruHMbf7PNtsGZnwNWkbji/Bs9zuVVqU5cRVm1wAkkr4gb9rOlL0tgtzO708D?=
 =?us-ascii?Q?t5MnQeQtRFvOKZoBZ2CMBGi8XG2jJJff6Jo5lpm4emqDnqgMo09Yk5yZrzcp?=
 =?us-ascii?Q?M3cZ/ZzrCMHE79pQ6O45D5u4C/c4TYPT1gWeASeYDhRMNPdYDOdDfWQg+zaX?=
 =?us-ascii?Q?HmlVWx6jvspfdNeTVyVeL9OU+ahstn+FvK2VVqZ1atElLBDSIF0vWeJTWv1R?=
 =?us-ascii?Q?v0yPwqO27RkcwhqljeX1v9SNylGjJoOlG8h0MdzAaJMAoT59JXGRw593mB2R?=
 =?us-ascii?Q?nD/yyZxx6ahBmvWuD47q9cKjEeiJQ0+Z7FgjTvh8jR/34gCZiEwsivLnovM0?=
 =?us-ascii?Q?Vq0HYwhdqKpZ7QWpOb4dSw6benLhG5apkhLHE0yB8HLeN3gB3o1D9PPXl+PR?=
 =?us-ascii?Q?2OGjfromx2ec1c+QU6rPuR/RIquYTIJSaThIlYCwwjzX17FTjNCEL5jzre9S?=
 =?us-ascii?Q?Y4iZnuW065bsLHWqlIbCj2AD2DPBetDCXUtYXMN+v1X/iRNYP1Yns0PaTLxP?=
 =?us-ascii?Q?4teSb1Z9T1hb7qoxyyrYJtTteZqpFlVCr9BUPt7S20f/JtIhLKnX0YeMk4DC?=
 =?us-ascii?Q?PYyaHXD64v6CwQuE2S4OuS51oQ63lzD42X9Px1ZB367xZCTKCPWR+L7MsxfZ?=
 =?us-ascii?Q?5rgq1jLt+Nj29J+SMvacuCdIDdrVKPPOrdnuom91d1lxugB7peChjDJdgswc?=
 =?us-ascii?Q?3N5WruTluIVXmG7TzyKQ/U2yKxGYJXKfB8UQgzLfoGQXQ/hZlLcFUCSLH8W8?=
 =?us-ascii?Q?S1AatwkZot0hwfBFc5/pH4u0BqmG35ljZbLz0oB7FKENJ+mvuO+1vGeN1U/2?=
 =?us-ascii?Q?SaDDSBCzfdPChtE3DSovYvIvnAbsiPDJzrryoCyAYkWTdjPDP32R0Zl0H6EW?=
 =?us-ascii?Q?KrSMFWHnMfMGMZicRIJjlhCMEAUby6I4?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230032)(82310400018)(36860700005)(376006)(1800799016)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 07:56:04.1435 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e813758-1353-4bb3-9100-08dc8ab51c0a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8560
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJf63E5ddaTnFl953Dp869N0rNGOsPRPTHM/CxLfB/Y=;
 b=sbycT1wmvyP5cssPDf2TnrezyqBS09ft+AKdJ9AI31Dyla2PwtU3HzLpok4qJYSFNtbc5hhpbvUFF2vg8WBUGM72k42ZFDIZ5n7aknFw8qy2wuzQsHoSBVGffvXKenzF9T03eoLswTvvyhYVl0aRg7jiyAP97wDW2hDO1e/SjJc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=sbycT1wm
Subject: [Buildroot] [PATCH v1 1/5] boot/xilinx-prebuilt: new boot package
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
