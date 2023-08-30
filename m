Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75757C6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 17:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B52B81F2B;
	Wed, 30 Aug 2023 17:33:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B52B81F2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 37C6kLYLh9_Y; Wed, 30 Aug 2023 17:33:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5AED822E9;
	Wed, 30 Aug 2023 17:33:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5AED822E9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 032141BF426
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 17:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B495E61001
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 17:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B495E61001
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dJzrQo5lDbD3 for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 17:33:08 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::619])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A6AEC60F68
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 17:33:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6AEC60F68
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GoLyQGTAEqHQnZN7rhrUZmbnE5mu5W6AE4zw1cd0Dcu6SDHtPuP4AnSMPnRdRpZotbjC2LU0F5rlR0nCBCEC/jqFC4JVAgGqJEDFInE7FlkB7gmQ1oxPBTmHGklj2UTQQeEDqd6X7E2Jzc46xGibx30HEQ3JfSEs6ycqx5ptLakz9o3KxPUac6KuglFsAb8U4LavO4kH6acHPZiTcRiJVNRxD/4se3pkwC/HckS7vXq01otefBlx7lox8mtTByn8B1EXkWxhI/IN07MzzVVfyh0uU4LnwIZWajrvhulnBR0A6gohBargSrRAWBlxjEot6YnwuIUgQBpkaMh2nHSq2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRvB0uTLX6VpkML9DHyveTYQ+UbAU7OudNId3Q8gEAc=;
 b=di4YX6VjqQj9X918lMjRT1OKg8SSA2kbvPQ/7W0J/E+1GUuM/IYPaGWjWu8TesxifIB5ytd5ujfvCxudaP/jpVfUfcjsY2KyHlHG9sEVQbHROIqAKTyI3Z3kFM4Ebxmg4TH+cZMdBuhCPQxljmrc8JzVoMYyC2+2WALPAeu/64kgLSTsQG/u9/p4ihWsfsiULuRw1YroDgVlhFL06oSsMTx2hSY4zSXTAU0mbEkmB9Z/MlBZ+0tZEjc5aaMFRyt1IBFTI7Osppa+fE2olHbaDmDCl0VSA0CLDzvSk1g1CphHKmQIbtHx5ll0tg9oV794QXYmYmzvzWev1fac0grn3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from SN6PR16CA0043.namprd16.prod.outlook.com (2603:10b6:805:ca::20)
 by IA1PR12MB6434.namprd12.prod.outlook.com (2603:10b6:208:3ae::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Wed, 30 Aug
 2023 17:33:04 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:805:ca:cafe::9f) by SN6PR16CA0043.outlook.office365.com
 (2603:10b6:805:ca::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20 via Frontend
 Transport; Wed, 30 Aug 2023 17:33:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Wed, 30 Aug 2023 17:33:00 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 30 Aug
 2023 12:32:59 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 30 Aug 2023 12:32:58 -0500
To: <buildroot@buildroot.org>
Date: Wed, 30 Aug 2023 18:32:52 +0100
Message-ID: <20230830173255.1620616-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|IA1PR12MB6434:EE_
X-MS-Office365-Filtering-Correlation-Id: 9252da60-1bd6-4ac8-0603-08dba97f2884
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IDNUv0DGNuWTofCEeofUvnFlgD0vGf1rGWJEcjgvZq6kZbKbDuZOOXDtLQefvDuEpI6e876jYemtMknx4WpRPksUBsDYtQXRJ3l1og6vSQgRvHhKRUF+tCyp0pOtys+C3nPy9NTqVSegoadu748AekuK7fmqG3lRoEw1KWeQX6yK75d865UThUNT0XUaZaeOGO8dt6beSR30yoJIvXrJ4l6D3aJQzFIX0IQXQcOMEbJJ7rAsSePzzFlHvUe18bokWEgHzatC2MyQFsXfnMmPpdRwfhwT1Yws5PsSd4lqA3zxsk4l82i29bYb04HD538y1JO4YojOSVKDkY6kMJsztG4x83gKMuzopTmpHXooCPHppcek1cQtxP2psNxonaX7ifTPKGQFGnH+kz5qDAbg/KZqqqhMCQ7ZOmEpCPveH83xe62Ge1sUyypvoV/zXYtnhBOuP1oRYl0erK6aZ76pJRuchaHIQZ6swd0yal/ch2DaZ0qlP24uf9lnXF3g9AlYWGSUU732QTHx5T8jOFsc8QNakA1/g1kDyfIMdQihsDotGbW7tk+1w2ka+KpI4/be/zlpmj1b476Pu/OxhWUNwC0YCjsjATJGv2+KMr4LbX/+06D5kiW9xt8A7c9FAbX/QzD2zJH37ZymnhUgSLKq6Fzzw1QT9oAuspZY5qMgFyErOc9Oi0n+oMnx7uAsu+t4BW08UNdiaCayR2glG0zVFjkYiMq/oSQHcwl+4SRKR/ahRKCdN56qU08Yp3MN15pP0K9DW1tB7CPlhlDmAGwY+dzEZruDsvySI3kTWLaiPj0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(376002)(346002)(396003)(39860400002)(82310400011)(186009)(1800799009)(451199024)(40470700004)(36840700001)(46966006)(6666004)(83380400001)(70206006)(2906002)(426003)(1076003)(26005)(336012)(44832011)(6916009)(966005)(316002)(70586007)(2616005)(8936002)(4326008)(5660300002)(54906003)(41300700001)(478600001)(8676002)(36756003)(40460700003)(40480700001)(86362001)(47076005)(81166007)(36860700001)(82740400003)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 17:33:00.8270 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9252da60-1bd6-4ac8-0603-08dba97f2884
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6434
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRvB0uTLX6VpkML9DHyveTYQ+UbAU7OudNId3Q8gEAc=;
 b=p1/brrQwh0aiSZN7Bf7gcdR6vGvR26SuOPbG6uz3ow8vzbB4FbBhFM1kj3vSnRx6lf1I68azXh9H36Zxp6tgfGvllQ5pFL/M/xeTWa9vcR3AcSCnM+uSBiwaAl6Zra/EYBP7h1NXbmw+mqALbX9hRG8J0rKEA4HptWU+p5HVVhY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=p1/brrQw
Subject: [Buildroot] [PATCH v1 1/4] package/binutils-bare-metal: new package
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
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds a new package for building binutils for a bare-metal toolchain.
The cpu architecture is defined by a toolchain-bare-metal virtual package.
While any cpu architecture could be used, the default configuration will be a
Xilinx microblaze little endian architecture, so that buildroot will be able
to build the microblaze firmware applications for zynqmp and versal.

When configured for the Xilinx microblaze architecture, all of the binutils
patches that are applied to the Xilinx distributed toolchain will be applied
in order to generate a toolchain that is equivalent to what Xilinx distributes.

Signed-off-by: Ibai Erkiaga-Elorza <ibai.erkiaga-elorza@amd.com>
Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 DEVELOPERS                                    |  4 ++
 package/binutils-bare-metal/Config.in.host    | 16 ++++++
 .../binutils-bare-metal.hash                  |  7 +++
 .../binutils-bare-metal.mk                    | 56 +++++++++++++++++++
 4 files changed, 83 insertions(+)
 create mode 100644 package/binutils-bare-metal/Config.in.host
 create mode 100644 package/binutils-bare-metal/binutils-bare-metal.hash
 create mode 100644 package/binutils-bare-metal/binutils-bare-metal.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9b500f3701..96813128e6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1323,6 +1323,9 @@ F:	package/cfm/
 F:	package/easyframes/
 F:	package/mrp/
 
+N:	Ibai Erkiaga-Elorza <ibai.erkiaga-elorza@amd.com>
+F:	package/binutils-bare-metal/
+
 N:	Ian Haylock <haylocki@yahoo.co.uk>
 F:	package/python-rpi-gpio/
 
@@ -2190,6 +2193,7 @@ F:	configs/zynq_zc706_defconfig
 F:	configs/zynqmp_kria_kv260_defconfig
 F:	configs/zynqmp_zcu102_defconfig
 F:	configs/zynqmp_zcu106_defconfig
+F:	package/binutils-bare-metal/
 F:	package/bootgen/
 F:	package/versal-firmware/
 
diff --git a/package/binutils-bare-metal/Config.in.host b/package/binutils-bare-metal/Config.in.host
new file mode 100644
index 0000000000..e6bf68ce92
--- /dev/null
+++ b/package/binutils-bare-metal/Config.in.host
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_HOST_BINUTILS_BARE_METAL
+	bool "host binutils-bare-metal"
+	default "y" if BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL
+	help
+	  binutils-bare-metal is a host utility for a
+	  bare-metal toolchain
+
+config BR2_PACKAGE_HOST_BINUTILS_BARE_METAL_VERSION
+	string
+	default "2.39"
+
+config BR2_PACKAGE_HOST_BINUTILS_BARE_METAL_EXTRA_CONFIG_OPTIONS
+	string "Additional binutils options"
+	default ""
+	help
+	  Any additional binutils options you may want to include.
diff --git a/package/binutils-bare-metal/binutils-bare-metal.hash b/package/binutils-bare-metal/binutils-bare-metal.hash
new file mode 100644
index 0000000000..3402b5f2a9
--- /dev/null
+++ b/package/binutils-bare-metal/binutils-bare-metal.hash
@@ -0,0 +1,7 @@
+# From https://gcc.gnu.org/pub/binutils/releases/sha512.sum
+sha512  68e038f339a8c21faa19a57bbc447a51c817f47c2e06d740847c6e9cc3396c025d35d5369fa8c3f8b70414757c89f0e577939ddc0d70f283182504920f53b0a3  binutils-2.39.tar.xz
+
+# locally computed
+sha512  bf3561c3495dd112b269a2c21dd758c1e5e7a73f959052f63511313e44222ce85b8db81e8de3b60b2c0bb8668ee834ac85036517fb6970e06fe352765dd127d0  xlnx-rel-v2023.1.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
+sha256  56bdea73b6145ef6ac5259b3da390b981d840c24cb03b8e1cbc678de7ecfa18d  COPYING.LIB
diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
new file mode 100644
index 0000000000..fd983abc93
--- /dev/null
+++ b/package/binutils-bare-metal/binutils-bare-metal.mk
@@ -0,0 +1,56 @@
+################################################################################
+#
+# binutils-bare-metal
+#
+################################################################################
+
+HOST_BINUTILS_BARE_METAL_VERSION = $(call qstrip,$(BR2_PACKAGE_HOST_BINUTILS_BARE_METAL_VERSION))
+ifeq ($(HOST_BINUTILS_BARE_METAL_VERSION),)
+HOST_BINUTILS_BARE_METAL_VERSION = 2.39
+endif # BINUTILS_VERSION  
+
+HOST_BINUTILS_BARE_METAL_SITE ?= $(BR2_GNU_MIRROR)/binutils
+HOST_BINUTILS_BARE_METAL_SOURCE ?= binutils-$(HOST_BINUTILS_BARE_METAL_VERSION).tar.xz
+
+HOST_BINUTILS_BARE_METAL_LICENSE = GPL-3.0+, libiberty LGPL-2.1+
+HOST_BINUTILS_BARE_METAL_LICENSE_FILES = COPYING3 COPYING.LIB
+HOST_BINUTILS_BARE_METAL_CPE_ID_VENDOR = gnu
+
+HOST_BINUTILS_BARE_METAL_DEPENDENCIES = host-zlib
+
+# if toolchain is for microblazeel-xilinx, apply Xilinx patch set
+ifeq ($(BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_ARCH),"microblazeel-xilinx")
+HOST_BINUTILS_BARE_METAL_EXTRA_DOWNLOADS = https://github.com/Xilinx/meta-xilinx/archive/refs/tags/xlnx-rel-v2023.1.tar.gz
+
+define HOST_BINUTILS_BARE_METAL_EXTRACT_PATCHES
+  mkdir -p $(@D)/patches
+  tar -xf $(HOST_BINUTILS_BARE_METAL_DL_DIR)/xlnx-rel-v2023.1.tar.gz --strip-components=5 -C $(@D)/patches meta-xilinx-xlnx-rel-v2023.1/meta-microblaze/recipes-devtools/binutils/binutils
+endef
+HOST_BINUTILS_BARE_METAL_POST_EXTRACT_HOOKS += HOST_BINUTILS_BARE_METAL_EXTRACT_PATCHES
+
+define HOST_BINUTILS_BARE_METAL_APPLY_LOCAL_PATCHES
+	$(APPLY_PATCHES) $(@D) $(@D)/patches *.patch;
+endef
+HOST_BINUTILS_BARE_METAL_POST_PATCH_HOOKS += HOST_BINUTILS_BARE_METAL_APPLY_LOCAL_PATCHES
+endif
+
+# Don't build documentation. It takes up extra space / build time,
+# and sometimes needs specific makeinfo versions to work
+HOST_BINUTILS_BARE_METAL_CONF_ENV += MAKEINFO=true
+HOST_BINUTILS_BARE_METAL_MAKE_OPTS += MAKEINFO=true
+HOST_BINUTILS_BARE_METAL_INSTALL_OPTS += MAKEINFO=true install
+
+HOST_BINUTILS_BARE_METAL_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_PACKAGE_HOST_BINUTILS_BARE_METAL_EXTRA_CONFIG_OPTIONS))
+
+HOST_BINUTILS_BARE_METAL_CONF_OPTS = \
+	--target=$(BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_ARCH)-elf \
+	--disable-gprof \
+	--disable-shared \
+	--enable-lto \
+	--enable-static \
+	--disable-initfini-array \
+	--disable-multilib \
+	--disable-werror \
+	$(HOST_BINUTILS_BARE_METAL_EXTRA_CONFIG_OPTIONS)
+
+$(eval $(host-autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
