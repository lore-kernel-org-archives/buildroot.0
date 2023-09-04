Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CC9C71153
	for <buildroot@archiver.kernel.org>; Mon,  4 Sep 2023 10:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FBF481335;
	Mon,  4 Sep 2023 10:05:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FBF481335
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OQyuA5vEKVfg; Mon,  4 Sep 2023 10:05:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C55C81419;
	Mon,  4 Sep 2023 10:04:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C55C81419
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4131F1BF215
 for <buildroot@lists.busybox.net>; Mon,  4 Sep 2023 10:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BD0181419
 for <buildroot@lists.busybox.net>; Mon,  4 Sep 2023 10:04:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BD0181419
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZnNxfOtizetn for <buildroot@lists.busybox.net>;
 Mon,  4 Sep 2023 10:04:56 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C029A81335
 for <buildroot@buildroot.org>; Mon,  4 Sep 2023 10:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C029A81335
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FjV47lYInHXBeZ/wNDvNWj7UE5wgNx3f/Jn9lr+8R6uoJCV/YWyeWdhJNYfozmoNOQE8wMInL6qvtezuVWzNxURXeqiiWPfYzr9y5tUmziD3WUj6sX5tr2PJBgvdR8EFAGXArZN++N8gXKdyaAO+pc8l6QWJyfrMZuf1wsBHFrXneeAt+PEgni6bBkiqudWsdWUEpi51ey79Dx1aRkc/f4g6qVdD0KU3+kKAyl/QPmfbI0jpfosMpCNCg1anfnvuxscAOv8y9Lc8YC+/HmDpFGkD+YVQUCu+3T53PH6FP3mncdIquwv4zUgjr8gMFvTdSnMrOQyk4ThJ7NN5M85HIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nMgXvAW+KPh/d9dGPuXXxfn7KxEw+dXDQzHHhWrqsLk=;
 b=cz6OM9dlB6chkEAMLoKzL+xVMklQosom+42t32nnCr3vwYRNHbjNPCaOh1pk3s/IyxOsq3IbRcMIHddu/3efxi6j2Rh5IQaDDfW5bUgdheyYIAOd3Dr6H/9Qi9gmrFpq3OOb569suOdiMqsDHPofZY1JrKDNDmcO/F5y2W+GzLc4j31uDjNKdLAFgA21iKmLWa2grD397fH5dsNG5UbYYtdoTKBQqyC0cN0slGF0DswtzZYiCvQDQVdeJ4sIp0A0v7SBsMs1aIynNaSUXiLEttH+UIf/NuKnkxJJjq5t49++V3tP6ifnrfTuVtBpkAx5GCm/JUvORMcSMw1Ts1jSSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from PH0PR07CA0017.namprd07.prod.outlook.com (2603:10b6:510:5::22)
 by CH2PR12MB4151.namprd12.prod.outlook.com (2603:10b6:610:78::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Mon, 4 Sep
 2023 10:04:53 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:510:5:cafe::bc) by PH0PR07CA0017.outlook.office365.com
 (2603:10b6:510:5::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33 via Frontend
 Transport; Mon, 4 Sep 2023 10:04:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Mon, 4 Sep 2023 10:04:51 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 4 Sep
 2023 05:04:50 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 4 Sep 2023 05:04:49 -0500
To: <buildroot@buildroot.org>
Date: Mon, 4 Sep 2023 11:04:39 +0100
Message-ID: <20230904100443.1613306-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230904100443.1613306-1-neal.frager@amd.com>
References: <20230904100443.1613306-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|CH2PR12MB4151:EE_
X-MS-Office365-Filtering-Correlation-Id: e27c9bca-55b9-42ec-cf1b-08dbad2e610e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eHDTAXy0GxerXZY45IMzYLv6fXz2sPlz/1XL0S13Hj0brUpsDPE6XVdKNPBj36v4agHbQ4amOw/NShuzAGxmN4KTO58KWYxPVcdGt5yG7yk8IWW2x5SU7J3dObPo7gDsF94j5imJtAlsswcaiFiXBmAzk9FZ8SMqZ34y1MxghfR4+2HvNPw+r3k3CJEhWeOFCqNuzXiqdxngHsoeQaIyyWo82KvXd3YPizNe/4nIvOS3PDrcdSBpPteqGL/sCOInyUBVXR91Ieneqnu/82+5ZAGzNKYZNMmfb43xXJnN+RB+AwuDlCt2qVP/YcMHcQyGWhHbHu+XsNOz+rP7Cdc3XA4uMfGz6PxamqmkLDNK53DUkJInZX5+eLJ+t66prd3daHeAujJEBJzu3SLiCj3517fXsFSQ29mWJuF9Y4xtUiNWAqu/Q0z4i7wW9bLsbn/uBIZsDu8zEJukfN0yA1emSvdb/5lYUeN3A1CBQCcQN7v6kF/DLkkzB7+iGBNJycu1tVpr7RIvL0TxDT0PoLbjP6Llfp9A0F6YIK9QDene1I+7HekiXh9xDvtFlLEbvAjl9pB1RGqsYOgC8KSGBotfbXZPolO6OmQNn7SNuayukbQi6q2+WtSqcIt7luZmV+0b51vq8FAGnlihaFO9TO3DUiPChm8XF5oEm+be3IjCe+rgsswLRX9BBBomfO6aF+3sZAHKqfEZ6nTqUpSJpAW/LEuqkcX+OFt1xH50eo9n1TaWY2rA0jIVGvLH+kiAO4u7h7K9bs/w6rVWs4xhqgOuNmr7DU6tC4BPVyAPzeNaKSg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(376002)(136003)(346002)(39860400002)(186009)(82310400011)(1800799009)(451199024)(40470700004)(36840700001)(46966006)(40460700003)(26005)(2616005)(1076003)(47076005)(82740400003)(81166007)(356005)(36756003)(86362001)(36860700001)(426003)(336012)(66574015)(83380400001)(40480700001)(44832011)(966005)(41300700001)(8936002)(6916009)(316002)(54906003)(5660300002)(70206006)(70586007)(8676002)(4326008)(2906002)(6666004)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 10:04:51.0893 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e27c9bca-55b9-42ec-cf1b-08dbad2e610e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4151
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nMgXvAW+KPh/d9dGPuXXxfn7KxEw+dXDQzHHhWrqsLk=;
 b=MaaoKph4hU461oZ9bl3zlV9sVPe1YB9rUGCNNlPdxsKJE9QEaY3QOdYv6Md44vJQMBbdyLk7bbVNaQArgBbpT4KwTeJa/q9qfLAX27j3kZzcbhiDvmIsKilm3Dv+e9mpa+UHNlXY5l0HZ1BwBTK3hULZqd5uNx99kXQSMLAt3gI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=MaaoKph4
Subject: [Buildroot] [PATCH v3 2/6] package/gcc-bare-metal: new package
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
Content-Type: multipart/mixed; boundary="===============0271378131484833506=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0271378131484833506==
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

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
V1->V2:
 - removed default enable to be replaced with toolchain select config
V2->V3:
 - no changes
---
 DEVELOPERS                                 |  2 +
 package/gcc-bare-metal/Config.in.host      | 18 ++++++
 package/gcc-bare-metal/gcc-bare-metal.hash |  5 ++
 package/gcc-bare-metal/gcc-bare-metal.mk   | 67 ++++++++++++++++++++++
 4 files changed, 92 insertions(+)
 create mode 100644 package/gcc-bare-metal/Config.in.host
 create mode 100644 package/gcc-bare-metal/gcc-bare-metal.hash
 create mode 100644 package/gcc-bare-metal/gcc-bare-metal.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1ebdf0a2c9..9fc597da07 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1329,6 +1329,7 @@ F:	package/python-rpi-gpio/
 
 N:	Ibai Erkiaga-Elorza <ibai.erkiaga-elorza@amd.com>
 F:	package/binutils-bare-metal/
+F:	package/gcc-bare-metal/
 
 N:	Ignacy Gawędzki <ignacy.gawedzki@green-communications.fr>
 F:	package/angularjs/
@@ -2196,6 +2197,7 @@ F:	configs/zynqmp_zcu102_defconfig
 F:	configs/zynqmp_zcu106_defconfig
 F:	package/binutils-bare-metal/
 F:	package/bootgen/
+F:	package/gcc-bare-metal/
 F:	package/versal-firmware/
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
diff --git a/package/gcc-bare-metal/Config.in.host b/package/gcc-bare-metal/Config.in.host
new file mode 100644
index 0000000000..9e28e862ec
--- /dev/null
+++ b/package/gcc-bare-metal/Config.in.host
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_HOST_GCC_BARE_METAL
+	bool "host gcc-bare-metal"
+	help
+	  gcc-bare-metal is a host utility for a bare-metal toolchain
+
+if BR2_PACKAGE_HOST_GCC_BARE_METAL
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
+
+endif #BR2_PACKAGE_HOST_GCC_BARE_METAL
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


--===============0271378131484833506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0271378131484833506==--
