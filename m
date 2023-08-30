Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286E3C6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 17:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D18B281D9F;
	Wed, 30 Aug 2023 17:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D18B281D9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dl8QxjXvtvEO; Wed, 30 Aug 2023 17:33:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD4C2822A4;
	Wed, 30 Aug 2023 17:33:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD4C2822A4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D3211BF426
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 17:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46DB840636
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 17:33:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46DB840636
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UhfWf7wxOQ2Y for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 17:33:15 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::615])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DBCD74039D
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 17:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBCD74039D
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MW/H/5NNxhGtiH1XPPSk5Bqbtnlba6vVHKZIWIklUoEocl9dSnDL55XJX+19ct4K7/G7DkHM5MjOyzVGdj/ohtkYRagZGxJGjkzLYaPpTr/Cil7W4DR3mXGsGWHut6NbhVaPSA2utCW7zEvBGMD0A19f946SmXplKkceTK49doj7NiOTWTmHu3+u3xFMzY00A0z4piGcZ48ttaaziFkphvbtpQyrWKloa4Lv4yWKPtr2US7rZ6Zl5eErEqlFNlHBMGML19mp4zL13dgiQQoQY9pESDqvCSwCTgpcbLnsvlqiuYkfrwbwKWQvPKPO6q9LbY91PIwiS2hB/0ToAdAatw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbZGNt79D6xMmhiUaS8A3ciU6g3IoXyjZIE6tMRiTNU=;
 b=hgk7eRbplGRJ6hjjUa1+BeNG2aeI46f/JFuYXgWT8g8cVY00+Txeqq+bvwU3FPocHQBsQ6IIMwxr5ZjSds7E7yRS/kKcmgNmmT1xwMXkQTNKRW6xnnoZ30jO1Ra5tr6FuLwdeKvUWPe8s4l6OOquDtT+vxPnK4GbIoPlefD/XIKvKlF6etpop9MgZoNpmFJ0Q3uvMFHUXzvY6B4efiEhAqeFChdvtOWGiZLOqbtdY1033dprz8FjSc5GBssdRb+Xkki6KZnRafFR88Ub+6cRlPztZBV2A4uwmIlXoyfJ6lwgcfNZHL1ubrfmbprY76SOKm4Kpkr3CqauIK6MzYALaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from SN6PR16CA0055.namprd16.prod.outlook.com (2603:10b6:805:ca::32)
 by MN2PR12MB4175.namprd12.prod.outlook.com (2603:10b6:208:1d3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 17:33:10 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:805:ca:cafe::e1) by SN6PR16CA0055.outlook.office365.com
 (2603:10b6:805:ca::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20 via Frontend
 Transport; Wed, 30 Aug 2023 17:33:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Wed, 30 Aug 2023 17:33:07 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 30 Aug
 2023 12:33:03 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 30 Aug
 2023 12:33:02 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 30 Aug 2023 12:33:01 -0500
To: <buildroot@buildroot.org>
Date: Wed, 30 Aug 2023 18:32:53 +0100
Message-ID: <20230830173255.1620616-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230830173255.1620616-1-neal.frager@amd.com>
References: <20230830173255.1620616-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|MN2PR12MB4175:EE_
X-MS-Office365-Filtering-Correlation-Id: d41411fc-e50b-475d-3cfd-08dba97f2c47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MbHaCSwoJXU1NMlTSRcVTBW7qZC7XDuFK4QmWi7DhHUi86FZIiYGwFQFGAQtRMGUBAKCeGJVmn0pdLOOmiWfD/mfgTfngb0XngF5sRUm81RR39VUBUI6eFLMx7cxAnBFYV7Z4dI2TmZpp7f9JHUcVsL+NmqsFrvPk9M7JnnGa3FxLgDESh8xAL8Ls0domn8PFztjGucw43l17Kw+LvHF3d6DnjUfr579dg/VH72uh4ssTh5oU/+w9amelSsnfXISjPy2rmhYtBwNxYvLnh4PVGXUUkS7XSdvjO0pbZ2ciJ23eyVwp+GJsZu2RfWFXqYrPcG0XaUcI/FbrZB/Is29PWr9sHumPn4GxvWTwMcbAV+3lDyvEohIWZgbKN3pTfentvVo0g0pz+9y4Jrh8gnn1JTMAIv9/XR9+aZOog+u7pq8bOl1Dz045CPkVslxkheZiLklkAq/4+PcY2/vtKeLyERXGIpRWOFNwo1sUfwJzPG64ZppVys2Ey6U8KQQQaOzhON+oxuXLMvY3lnnkTQ8EBx3VzTnRIGyu8rHfq+0cBeqhfm1w7Sb3GCxBlVseK3Ge9Ohpw4W6bLSmzrLlAb3CsSVRf6c7MbBeGZ8ImgZKDLpJuarrdr/uaC0rGHtKGvkYke/ipB7uQpxinltz/eFn/CdrT5XLmEJhF0T2MM085w44gQw08zQLt9194Vh8R7xXW1lOt+l74ZfFM9h6L5z7bSvWId8xdM+cwz9xP1Uu5ahv3cyqZ3EnutY58lGcjvRJcnBls6qdyPMVI6xnAVhf4ZGDw2HZEOSzuycijd4IuU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(39860400002)(376002)(346002)(136003)(186009)(451199024)(82310400011)(1800799009)(40470700004)(36840700001)(46966006)(40480700001)(40460700003)(54906003)(356005)(70586007)(70206006)(316002)(6916009)(478600001)(81166007)(82740400003)(966005)(2906002)(5660300002)(86362001)(8936002)(44832011)(41300700001)(4326008)(83380400001)(8676002)(47076005)(6666004)(26005)(1076003)(2616005)(36860700001)(336012)(426003)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 17:33:07.1395 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d41411fc-e50b-475d-3cfd-08dba97f2c47
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4175
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbZGNt79D6xMmhiUaS8A3ciU6g3IoXyjZIE6tMRiTNU=;
 b=3sxOeFzqdmabZ9gu29mnriEuXNYYmUYa3s1LL/0P8C7+YGVpFiwAXPe5KRi5nxXcDFaKFcC8S9QOvPlS5VowAq+fy0eIZK4EFtSfrDsqpNeVKx49T1vEeXht3evMWIBBd+c2psynyib02xIjv1NA2Z4ynEss/qjmE90EsFKcNrQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=3sxOeFzq
Subject: [Buildroot] [PATCH v1 2/4] package/gcc-bare-metal: new package
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

This patch adds a new package for building gcc for a bare-metal toolchain.
The cpu architecture is defined by a toolchain-bare-metal virtual package.
While any cpu architecture could be used, the default configuration will be a
Xilinx microblaze little endian architecture, so that buildroot will be able
to build the microblaze firmware applications for zynqmp and versal.

When configured for the Xilinx microblaze architecture, all of the gcc
patches that are applied to the Xilinx distributed toolchain will be applied
in order to generate a toolchain that is equivalent to what Xilinx distributes.

Signed-off-by: Ibai Erkiaga-Elorza <ibai.erkiaga-elorza@amd.com>
Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 DEVELOPERS                                 |  2 +
 package/gcc-bare-metal/Config.in.host      | 15 +++++
 package/gcc-bare-metal/gcc-bare-metal.hash |  5 ++
 package/gcc-bare-metal/gcc-bare-metal.mk   | 67 ++++++++++++++++++++++
 4 files changed, 89 insertions(+)
 create mode 100644 package/gcc-bare-metal/Config.in.host
 create mode 100644 package/gcc-bare-metal/gcc-bare-metal.hash
 create mode 100644 package/gcc-bare-metal/gcc-bare-metal.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 96813128e6..4c95686287 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1325,6 +1325,7 @@ F:	package/mrp/
 
 N:	Ibai Erkiaga-Elorza <ibai.erkiaga-elorza@amd.com>
 F:	package/binutils-bare-metal/
+F:	package/gcc-bare-metal/
 
 N:	Ian Haylock <haylocki@yahoo.co.uk>
 F:	package/python-rpi-gpio/
@@ -2195,6 +2196,7 @@ F:	configs/zynqmp_zcu102_defconfig
 F:	configs/zynqmp_zcu106_defconfig
 F:	package/binutils-bare-metal/
 F:	package/bootgen/
+F:	package/gcc-bare-metal/
 F:	package/versal-firmware/
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
diff --git a/package/gcc-bare-metal/Config.in.host b/package/gcc-bare-metal/Config.in.host
new file mode 100644
index 0000000000..cb4b97707a
--- /dev/null
+++ b/package/gcc-bare-metal/Config.in.host
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_HOST_GCC_BARE_METAL
+	bool "host gcc-bare-metal"
+	default "y" if BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL
+	help
+	  gcc-bare-metal is a host utility for a bare-metal toolchain
+
+config BR2_PACKAGE_HOST_GCC_BARE_METAL_VERSION
+	string
+	default "12.2.0"
+	
+config BR2_PACKAGE_HOST_GCC_BARE_METAL_EXTRA_CONFIG_OPTIONS
+	string "Additional gcc options"
+	default ""
+	help
+	  Any additional gcc options you may want to include.
diff --git a/package/gcc-bare-metal/gcc-bare-metal.hash b/package/gcc-bare-metal/gcc-bare-metal.hash
new file mode 100644
index 0000000000..d505540bf9
--- /dev/null
+++ b/package/gcc-bare-metal/gcc-bare-metal.hash
@@ -0,0 +1,5 @@
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-12.2.0/sha512.sum
+sha512  e9e857bd81bf7a370307d6848c81b2f5403db8c7b5207f54bce3f3faac3bde63445684092c2bc1a2427cddb6f7746496d9fbbef05fbbd77f2810b2998f1f9173  gcc-12.2.0.tar.xz
+
+# locally computed
+sha512  bf3561c3495dd112b269a2c21dd758c1e5e7a73f959052f63511313e44222ce85b8db81e8de3b60b2c0bb8668ee834ac85036517fb6970e06fe352765dd127d0  xlnx-rel-v2023.1.tar.gz
diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
new file mode 100644
index 0000000000..fd84450007
--- /dev/null
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -0,0 +1,67 @@
+################################################################################
+#
+# gcc-bare-metal
+#
+################################################################################
+
+HOST_GCC_BARE_METAL_VERSION = $(call qstrip,$(BR2_PACKAGE_GCC_BARE_METAL_VERSION))
+ifeq ($(HOST_GCC_BARE_METAL_VERSION),)
+HOST_GCC_BARE_METAL_VERSION = 12.2.0
+endif
+
+HOST_GCC_BARE_METAL_SITE ?= https://ftp.gnu.org/gnu/gcc/gcc-$(HOST_GCC_BARE_METAL_VERSION)
+HOST_GCC_BARE_METAL_SOURCE ?= gcc-$(HOST_GCC_BARE_METAL_VERSION).tar.xz
+
+HOST_GCC_BARE_METAL_DEPENDENCIES = host-binutils-bare-metal host-gmp host-mpc host-mpfr host-isl
+
+# if toolchain is for microblazeel-xilinx, apply Xilinx patch set
+ifeq ($(BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_ARCH),"microblazeel-xilinx")
+HOST_GCC_BARE_METAL_EXTRA_DOWNLOADS = https://github.com/Xilinx/meta-xilinx/archive/refs/tags/xlnx-rel-v2023.1.tar.gz
+
+define HOST_GCC_BARE_METAL_EXTRACT_PATCHES
+  mkdir -p $(@D)/patches
+  tar -xf $(HOST_GCC_BARE_METAL_DL_DIR)/xlnx-rel-v2023.1.tar.gz --strip-components=5 -C $(@D)/patches meta-xilinx-xlnx-rel-v2023.1/meta-microblaze/recipes-devtools/gcc/gcc-12
+endef
+HOST_GCC_BARE_METAL_POST_EXTRACT_HOOKS += HOST_GCC_BARE_METAL_EXTRACT_PATCHES
+
+define HOST_GCC_BARE_METAL_APPLY_LOCAL_PATCHES
+        $(APPLY_PATCHES) $(@D) $(@D)/patches *.patch;
+endef
+HOST_GCC_BARE_METAL_POST_PATCH_HOOKS += HOST_GCC_BARE_METAL_APPLY_LOCAL_PATCHES
+endif
+
+# gcc doesn't support in-tree build, so we create a 'build'
+# subdirectory in the gcc sources, and build from there.
+define GCC_BARE_METAL_CONFIGURE_SYMLINK
+	mkdir -p $(@D)/build
+	ln -sf ../configure $(@D)/build/configure
+endef
+
+HOST_GCC_BARE_METAL_PRE_CONFIGURE_HOOKS += GCC_BARE_METAL_CONFIGURE_SYMLINK
+HOST_GCC_BARE_METAL_SUBDIR = build
+
+HOST_GCC_BARE_METAL_MAKE_OPTS = $(HOST_GCC_COMMON_MAKE_OPTS) all-gcc all-target-libgcc
+HOST_GCC_BARE_METAL_INSTALL_OPTS = install-gcc install-target-libgcc
+
+HOST_GCC_BARE_METAL_CONF_OPTS = \
+	--target=$(BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_ARCH)-elf \
+	--disable-initfini_array \
+	--disable-__cxa_atexit \
+	--disable-libstdcxx-pch \
+	--with-newlib \
+	--disable-threads \
+	--enable-plugins \
+	--with-gnu-as \
+	--disable-libitm \
+	--without-long-double-128 \
+	--without-headers \
+	--enable-languages=c \
+	--disable-multilib \
+	--with-gmp=$(HOST_DIR) \
+	--with-mpc=$(HOST_DIR) \
+	--with-mpfr=$(HOST_DIR) \
+	--with-isl=$(HOST_DIR) \
+	AR_FOR_TARGET=$(O)/host/bin/$(BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_ARCH)-elf-ar \
+	RANLIB_FOR_TARGET=$(O)/host/bin/$(BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_ARCH)-elf-ranlib
+
+$(eval $(host-autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
