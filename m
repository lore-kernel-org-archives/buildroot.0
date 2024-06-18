Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D9EC2BA15
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 07:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0A5D60B4B;
	Tue, 18 Jun 2024 07:49:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aCe-eBQY_hZ1; Tue, 18 Jun 2024 07:49:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 813C060B59
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 813C060B59;
	Tue, 18 Jun 2024 07:49:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8BFC81BF283
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 07:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 794DB40BDE
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 07:49:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AgXempzbNUC4 for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 07:49:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::600;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CB61341183
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB61341183
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::600])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB61341183
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 07:49:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R4WNFbMnLUcP+zFtqBl3mfWdYN5HEfhFkfSkZKqRw0Q5rWyAJ1RMKUebB2Y7g1lAVojO26LI8+9y96QXP4LfA4qbYgjxrE1GyhGcTxo3/HMSIpP1d4YmzWRRTs4Z4PYCB47NDfI9zIWHSdUTehC5FV5dtRaYeTXZnxa28n6GUWbIj/O5RgATRIaVNIdpMt2u0X0z0cpaSif/d9CkcJZDmEo+NYW+/F/Lck8KnByJcIAUY4F7rYn63irmpxTHZM16oiXWIUlwM4d6bD54kpK9Z+cmq91s1efH97LeuaU6r79rJz7aV9nVHQwOcg8mYlUOLuGXxMvIbYmWzg3tXzte7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/mdqpDyIQdsA848qBWwX8vYEoOgK+z+5bkriOjUBV0=;
 b=QNA1m4cJQA+o42e06eiqQ1+fTmUfE+y8NFekw86tGfAts9SEtdPvmXLLIvPOAnhpZ9l9u1VRi/GZc98XHOuSBeQ+a3dF3496hwRkqmIe90cJNE1kFSE9NEfqv00rMYEbjuR/R6eLTC58be6RSNU3p4Nm4uC9kx4lE5Un5dbSoeCukYrTHSRpYoPv3BqsAp3mVT5egftAYb7g9OGAV/Yxq3eGpwMEKWaXxoWJaq+yx+V9XAPjI2Aj7SZht5Ufhmhl3yDQVmXwdvkLKomFB2bT6R4UjAyfKTpElzS0syQUizSDsjA7NsTis/ppsjmVVfFKMBk0FUrDU0Xzaz9JbQBbcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0114.namprd03.prod.outlook.com (2603:10b6:a03:333::29)
 by DS0PR12MB8296.namprd12.prod.outlook.com (2603:10b6:8:f7::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.31; Tue, 18 Jun 2024 07:49:29 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::54) by SJ0PR03CA0114.outlook.office365.com
 (2603:10b6:a03:333::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30 via Frontend
 Transport; Tue, 18 Jun 2024 07:49:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Tue, 18 Jun 2024 07:49:27 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Jun
 2024 02:49:26 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 18 Jun 2024 02:49:25 -0500
To: <buildroot@buildroot.org>
Date: Tue, 18 Jun 2024 08:49:19 +0100
Message-ID: <20240618074922.3555070-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|DS0PR12MB8296:EE_
X-MS-Office365-Filtering-Correlation-Id: 63acb23b-7619-465f-ffb0-08dc8f6b2dec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|36860700010|376011|82310400023|1800799021|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/6SuddepbM2sVJO3lPWhLgs/id5v9a7VTD1dRzK5YdgfLXtrKxV8/kQUtHqv?=
 =?us-ascii?Q?SJSMgg+yfDspTEpDX+JM0VOQXwLzejlwUpOgc1k0pD9chZXJja71Zn+zvpiU?=
 =?us-ascii?Q?3Ocbjvw7HCf2Mk38sx1ZgQ81bYnJz+D3usuBon0kmHgXmvAdLbQubN92Jb1I?=
 =?us-ascii?Q?/6cH5qa7Kb4MHNs7w3U0DGXHY2rmqAEJkhlKd7QXR9Vkmik6DTd5aYvx1GSL?=
 =?us-ascii?Q?k/ZATmZf5vuf7ml7HhiqQRqN7Dh25zZKUpqyI10Li5DRcZnrNrgrYTw787D6?=
 =?us-ascii?Q?z6pkgH5ecV8tzzdJ8yj5NZbusuSwyOft9RyHPur4Z7eGB6UA/0QidqxWEYTA?=
 =?us-ascii?Q?6MziQD7zeIwejXZRZgxzRvFKpONJjdeKitUWR4Fyf0oZLJCGS+GISpfJntpo?=
 =?us-ascii?Q?k0fgaueqnE5r2PJ8w9gxffcGBeBFq0RbXXCDuV2gaq/MJXI2FgMY4NErnQRA?=
 =?us-ascii?Q?Pz7n45iC2Jv6DF5ZzyEAehJMA2tqqFleT1lZFB9D1xxwzE3MuM8kkYBb/POY?=
 =?us-ascii?Q?blktLYBwnK+/jGLaftWWxjlgYUQUDQIV/d2PbI5pM5gGrEk9imY7jEFfdW4O?=
 =?us-ascii?Q?vEEMDXFw8rR+YkumG/F9l3Z7hEUGyKLRGpxjAc0tfsUqHrV40Jmjm9sJ1ueh?=
 =?us-ascii?Q?R1vf88Ba40Tj8S1awL2r6WG56F/sH29cp5vhsl41LDGkcY7m2chRauPKLbTa?=
 =?us-ascii?Q?GZwrtJ70meHzw4dMtYC5t6+WqSqGukFF8TOQ4IDyXieam8kLrz3rA1/DAZ8d?=
 =?us-ascii?Q?+mkTQh01yQY9Vm0DV5eZ0btP99qeozJUge/GMEoorkcnlhXiyp9ocIz5CGj/?=
 =?us-ascii?Q?HidApDQwjTiMScD6qOEtOdmvKHuAJEkiqGXsDwwNQjCKojncnqkSQDJo6On3?=
 =?us-ascii?Q?KPc/Hmq31WAMsav4x/F2Z4Q9fCg2a2SQSCa+bb/X/5hsb64KJHosySJR6PqW?=
 =?us-ascii?Q?ET4I2NA0eneQ/ZUk+SMLDK706MLVgwr3c7/TxwiD4uV5jUbUOMRJLX8kMLOi?=
 =?us-ascii?Q?1QXPmkysp2sCOswZo8Ax27+aRsvsQPtlK/lg/WercFkoNEX//iyPg/OlRMQy?=
 =?us-ascii?Q?g/woPs1UElGMHNbMsVgy4BB87ACzFMHtyA3fU1UAXr+VhSymuYN6J+2PG9j5?=
 =?us-ascii?Q?glpo2NOopM3Wc2qbJYmRxz4qKkVXSG8d6yZAj4JbSl1gxT50MAEsMWdtu8tN?=
 =?us-ascii?Q?KwRtY6HGsE6l4FMZ7Xc1llHsgt3EFG9xhlrFwEH0JH7/N6C3MInGjveVJK1u?=
 =?us-ascii?Q?PHipEPrHF9HNnTQbpEydyopA+R0mSNBKOxZBTJfwMEsIBgwhHp4QF9N2sPXX?=
 =?us-ascii?Q?RKPmFD2XNBw5ddXk1H3+nhAba1+QrjNZxro7g54wKGJeQR2L0dd8v7L2unXk?=
 =?us-ascii?Q?jg22V49LrQWCPJONSpv7QOrOIbC9?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230037)(36860700010)(376011)(82310400023)(1800799021)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 07:49:27.2984 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63acb23b-7619-465f-ffb0-08dc8f6b2dec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8296
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/mdqpDyIQdsA848qBWwX8vYEoOgK+z+5bkriOjUBV0=;
 b=WhwGVqSz8mDR4cXJJFHSO4UNeBnGGsO8XdbqcTMz0uzBRUK0J0OGd5CdTQGiiIN9a0QKXi3XF+iUa628Ez1+Hv9UrcbKOcoIO09Nr1Wv5Eb6yInuypxRKAm7okIZVAKcuk2EOTVPay0UVpZBd+IuodiwbUcWE9KZESm/IXPDIcE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=WhwGVqSz
Subject: [Buildroot] [PATCH v3 1/4] boot/xilinx-source: new boot package
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
V2->V3:
- fix copy paste error that causes build failure
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
index 0000000000..4352b07eed
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
+define XILINX_SOURCE_INSTALL_OTHERS
+	$(INSTALL) -D -m 0755 $(@D)/lib/sw_apps/zynqmp_pmufw/src/executable.elf \
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
