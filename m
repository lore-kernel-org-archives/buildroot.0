Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12E8C2BA18
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 05:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5B0760B61;
	Tue, 18 Jun 2024 05:58:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DMQa-wMlAgxh; Tue, 18 Jun 2024 05:58:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54BE761099
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54BE761099;
	Tue, 18 Jun 2024 05:58:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1691A1BF285
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 05:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1014581B53
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 05:57:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mv8Abqr-8ZNz for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 05:57:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2407::629;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 95A3881B52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95A3881B52
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95A3881B52
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 05:57:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6Vp0RgFG8ACusUmEedyI00RYtjbIu5Ow6y+Ylyc8g3E9IUxj0AfvbjPpx3Em0fvLQTK191qLa3R6BdFsb0SWzb5HNL5G8SXCMhGy9xjbmrwegAak0FmuS2aI5SsW52EF3vUQ5Dws+GjLIt1QUpHI4JwwSUwMNHwsIW/MTlquhT5KSaE0H/L5yhB2xxp9U3Tn4VuuBSgD7wrmdZcmVGqVP26cAAFZYxccqs1NfRbY6mJ8UrEQA3uvJFwozG+AiM+Oej7BIFJXu5eiVJw1Y0Z0uPa1mpQ/nscAnDpCfLt6P72IF9f1O9EgB0l+ANWfjTvnYcMpPgzqiTny4Mzc4b5Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lc9OcCKDg3y5BaxfM1vg7Ix7ozCtgMiNMMIqQW6f+Yk=;
 b=YOdRV9R9KPPAexhWQOA/LSTwJYCw90YhknAhwZdAMbGkR5A8fuUt1xDcHhlxyToXjL6DGgemPKLxVU0sKTKgYZZLL4Rz6rVDnhcJchQirx4b8+2XgLMmQLYpGIpBzSRL/LPdkRy2GOCLgbUNLqMYoOJ06M/L3k5CiJmwpd/yw+oqzgTUjTO4fr63pi67TIUfswD/iqNeAYuZ1w+72U71OsKzIFSNTnqTQi7FGUK3Y7v/tMmV1gwQFcUz1c6BYZIWyJOFSv4pLTN1U9QiobzkM9DFqGgPzTA02kfCM4wGIhDoURbgjbZCferVQtYpFpVYPI4NwBAXLVCGCUpS0Ypd1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR04CA0344.namprd04.prod.outlook.com (2603:10b6:303:8a::19)
 by SJ2PR12MB9162.namprd12.prod.outlook.com (2603:10b6:a03:555::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.29; Tue, 18 Jun
 2024 05:57:45 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:303:8a:cafe::e) by MW4PR04CA0344.outlook.office365.com
 (2603:10b6:303:8a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31 via Frontend
 Transport; Tue, 18 Jun 2024 05:57:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Tue, 18 Jun 2024 05:57:44 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Jun
 2024 00:57:43 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Jun
 2024 00:57:42 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 18 Jun 2024 00:57:41 -0500
To: <buildroot@buildroot.org>
Date: Tue, 18 Jun 2024 06:57:36 +0100
Message-ID: <20240618055739.2777769-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|SJ2PR12MB9162:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fac753a-efe6-41f6-bbb0-08dc8f5b92b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|82310400023|1800799021|376011|36860700010|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KESISfeNgBelldA3SKOjBMgiHL98YxXN4bTH9EjNQjKF85Q8sbmwL+xJ8fu4?=
 =?us-ascii?Q?z0i7YD1wzzfGsD9pvTt2BDnWrysbX17dhQNMF1w4ToVgvnffm9K2mAMhARYA?=
 =?us-ascii?Q?Q8y1BwSjjYHRGfmlMHAK2CyDywAy+WXPBMhpgdM9vEmsIXJeHlVfgLWZffE5?=
 =?us-ascii?Q?PWTRX0YYO1UxxbLQRWUFQzOUe07Gbd28UkftusfGnya5S2qDLxOzA+StmVJ3?=
 =?us-ascii?Q?zzULGnfXsZBc5GN6kdI3Ak885XC+5OnMRgab3cTBSVB+lYrOckC7PR5QWyau?=
 =?us-ascii?Q?IOukQ5XdBtdR6TwnXSJOtpbz/qhLEyaqRvzrW5Sts1lxB36AyVh/hrfP+o9V?=
 =?us-ascii?Q?ITBryMgpSg4lFzhvuemmDFnikwrZy18vIjyAfFPbH7UHj0LvL3Q59umGCC53?=
 =?us-ascii?Q?61S3J1aKbvz+EjsDf7d0S/QRp0Tr5A7zbTZ/qCgp2hA9Ackb31lovIPwC9nA?=
 =?us-ascii?Q?1ZYj4jVsD6IOJRq3iuqWzcdwlkfarGcvK4FRLlODsvI/yg2FhoBwoQ1j84M8?=
 =?us-ascii?Q?uiPKjdlF4RxwL4IM17SJfeyaydyRrj2w3hpuJSP6bEXfxdCUZIlvEEDaPbkg?=
 =?us-ascii?Q?ZYTMkP9Lq6rkTa9AuP2tRCKX2pBwMt4IUWuk/DzjmOKwmF2UPhG0jWA6HfXO?=
 =?us-ascii?Q?rn3jMF+Tz0jD0GfCQWtOjUou23IumSH/K2iO1W1PU7+pA4RVVJixpzqnm7Hb?=
 =?us-ascii?Q?MN4CudIUowtQ8IKHiKoom0lhHd7uKvBxu4CjovpPkqZfE990dUEMImbSzP9M?=
 =?us-ascii?Q?AXYjGErleKPpcuPo86+javlngfka3fzFydZYsUXM8B6MGApMoZRPdaV+J261?=
 =?us-ascii?Q?crsTuS2S7ZQLrxtHQk07W7rCofmHysUZQ12upYB2weZQVh7ITzD5pxSnY3hO?=
 =?us-ascii?Q?kTf7JM+8mgq3AZ23N5sxZpxlLViKqCfS8hNHtHPEMALIRswPuSw8ymBvaMm3?=
 =?us-ascii?Q?yt+kxJSckjz27Br4LxauRQAunLEUC5ncH9xsjWt2N5v6RIva32n4nRaTNI53?=
 =?us-ascii?Q?1w6KC8cXosuYJdXCdDYR420VEaM8h+w46mZKKjbWwKyBjqaPq7O44hD9KBNC?=
 =?us-ascii?Q?X/x0GqiqXOLEAtxUxr3jIf23g/G7WiNNFlUxIxWc13ENgFT3ZQKKOCwpESuI?=
 =?us-ascii?Q?iMHmFWJjyWWAJbnTmedz5sjk+6DI9PPP8VjTFJ2WqiXvUGy57s5KSeMdqNGD?=
 =?us-ascii?Q?RblRieRdWKJBjbeleP+JSZrGn+HyLiE8jJVXecP2DkB38rt3eclXXfVD8uIW?=
 =?us-ascii?Q?EnvduifSHMFIP+DTmXPmXMezPKRHyZxDszxl8fk1V9dRiYbbpHtqF49Thrh8?=
 =?us-ascii?Q?sAr41zAcqpqkoR6rVy2g0AgEi507snRYsC9LJ1aBXtWQMtxT/7y9MQYUNFus?=
 =?us-ascii?Q?MJ49UMVc8PxBKPZoLdc2MjHtqDwj?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230037)(82310400023)(1800799021)(376011)(36860700010)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 05:57:44.3356 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fac753a-efe6-41f6-bbb0-08dc8f5b92b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9162
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lc9OcCKDg3y5BaxfM1vg7Ix7ozCtgMiNMMIqQW6f+Yk=;
 b=eS3EnCCpguOrFIiYhPfWcanDkMhJ+WJiYyyqBxnx8qVK9vdxzaifoXcgZ5wiybw4/2YMUuhEz/aQxppn30V/093OKCa3r0+/RbPd2xWgZ+nKtZ8ALC79Hu2Yt/7wgwYBlAkxFtJ/td1w6rkQqqRdpf5V8Skx9bRTNtANR8Gq8k0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=eS3EnCCp
Subject: [Buildroot] [PATCH v1 1/4] boot/xilinx-source: new boot package
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
 DEVELOPERS                            |  1 +
 boot/Config.in                        |  1 +
 boot/xilinx-source/Config.in          | 45 +++++++++++++++++
 boot/xilinx-source/xilinx-source.hash |  2 +
 boot/xilinx-source/xilinx-source.mk   | 69 +++++++++++++++++++++++++++
 5 files changed, 118 insertions(+)
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
index 0000000000..dcaff8a1fb
--- /dev/null
+++ b/boot/xilinx-source/xilinx-source.mk
@@ -0,0 +1,69 @@
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
