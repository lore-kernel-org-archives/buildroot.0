Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42998C83F01
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 14:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCBEB40134;
	Thu, 31 Aug 2023 14:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCBEB40134
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h1v4zwONHlHM; Thu, 31 Aug 2023 14:52:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6204402E5;
	Thu, 31 Aug 2023 14:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6204402E5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EBE951BF418
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 14:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2AE241827
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 14:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2AE241827
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kjdg8j2Q9Ojp for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 14:51:58 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05FC3417CB
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 14:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05FC3417CB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bTM+ykGWsAW5PDu36eyLlYsaAGJPZsQUaZ/ry3+/024o5ULFdfjBmc737w+YsIK0bJD9QwSMT1qkVQIp/LGI933088CWXyw4P4++Y3fGl8Naydq18aaqmdzTljZH0IeKW1cUUiqCfOUPMLlpGfTg+uzv417V5Bj7eT6U6MujY0tsEjMgXoehYXoj5y7FCdkyqwzJU+59+B0AGBavc5oBj2Yktmf5fNTeqyM1fbIkcudvccLCRWMyiUEl4CQrvRIBi4Vhejj+cYxR671iBxBLvUereUIGBLtkEW7GPmswICea8FneMLjbD87DmYOcPQt250paLV3MbZneAL3IthqiWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RECIhAk+9aUeb6WNSwFTVPX4/qkfrVxw+Li5YmRLwaU=;
 b=XWtDtJfy7DXsNAmmuFXy1/FyO176vDosoB4TZ2RvGsXDCXEr4SnXssCI4Q7DSCN+pJpzoHEm6jQ440+diWETy5NGMHbCE1PP7pvvcTcgatzWhinxuslwGGIupA+46/4pE4PwPfgDeLqKIchcoR8nXFoSXpj7N0OzqCZkJuGF5gaBWy2qFSYuj7J/QEyVFOcsDM9jwZ1kJURTTjqFopFqOiP6D8clC+U8YQfGs+LsXuRROKTvJXVfc0B3vWIkDD7As3iQqByE1QWt7DBaBewDbrpidNlpj3Mv2LMJxY8cd41NWySWGTTrFO7l8WOv7MdG8sY7L/QOeg9hRWsqlIQzXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from CH2PR14CA0009.namprd14.prod.outlook.com (2603:10b6:610:60::19)
 by DS0PR12MB9345.namprd12.prod.outlook.com (2603:10b6:8:1a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Thu, 31 Aug
 2023 14:51:55 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::4b) by CH2PR14CA0009.outlook.office365.com
 (2603:10b6:610:60::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22 via Frontend
 Transport; Thu, 31 Aug 2023 14:51:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.20 via Frontend Transport; Thu, 31 Aug 2023 14:51:54 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 09:51:54 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 31 Aug 2023 09:51:53 -0500
To: <buildroot@buildroot.org>
Date: Thu, 31 Aug 2023 15:51:35 +0100
Message-ID: <20230831145140.2537382-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|DS0PR12MB9345:EE_
X-MS-Office365-Filtering-Correlation-Id: e279b094-c672-44c8-9aa9-08dbaa31d183
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MNhOXW0tDwf+hBsxdTCys35m7JrKjuR9P1sBt9TCBY31hvv68bTo66E08wL33v4qSnnmKn3vmEGlANBct1PTzK7ks96QP6+veSx5JsasAb/mBEdYoeA9b9dJoDjuxkbg5exdgFAUkaxA2vuRm2nhgPlMNHBprl8GXS6y7yDIQz3NcTRvxtWg1lMIqmnVlWS58q+LAQFpyKi0kCsEjZYXFIHiuIcbXmoQRy2NLCYJkDeVuHT8iu+zzi87ni2hAXXb7LXLprYrYp8zVdBg29Fek5PztcBMaCJtVGz1+UUfmRAhGLjjfwz88XvutcIJSgfio06i3pb5qb57jQc5vFy41scB+melaQUjJRe7RczVRGW+NVTB0H+I+O9WGxG99Seg9FxOcb8XdEnBLnq4P9UFfg2rm8cH4GQEkPFqU68jVZqR3USO+vzojOYb3a3ZDBHHZqVulZQZhYZxJ5cz9KEL/EXsQRIBfXrAYO/MTFbrziLLnHYppZDC1fzguPSPSEYevhLzUj1PvOjRptL9E3few0Twi/398AT995QIq2KLH7zjUIi7Oqebaf68j2hinz6xTToGr1l++PnwIuZSGt3zKkbctmrVeYMdFvP4IOb0mnLD2GzlMspC7RfwC66xsC1tuJZm3wAB+89MFJjwIOmy/ctRXDpEhEbyaWvJKQ4BTZeXzpfrW2FhmB6mdWNydwsnfWWwljc6nwLNvPUj87cA8ZnYvmDWTZnQLyapgb9DZm6ZMvH7ZwukhxQk8HSCA61oI9yjnPZEbOWu/xfItzU6a1Y156bmLqlXRlo5ft9cyfo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(396003)(346002)(136003)(1800799009)(186009)(451199024)(82310400011)(36840700001)(46966006)(40470700004)(40480700001)(40460700003)(70206006)(54906003)(316002)(70586007)(6916009)(478600001)(966005)(82740400003)(81166007)(2906002)(356005)(41300700001)(86362001)(5660300002)(8936002)(8676002)(36860700001)(4326008)(83380400001)(44832011)(66574015)(47076005)(26005)(6666004)(426003)(1076003)(336012)(36756003)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 14:51:54.7458 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e279b094-c672-44c8-9aa9-08dbaa31d183
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9345
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RECIhAk+9aUeb6WNSwFTVPX4/qkfrVxw+Li5YmRLwaU=;
 b=qbPqfqUHQcew3sqAzr7YUTZ6MpN/7W+EQ3PsxW09rExCCidIpSxPLklEVnJPmJdb8fDn1mAIIHfSYLgPvmbxKZjEsZLej6Cr+j4jDR9LUMZGD78qRFCv7keA2KjZHNg98b8BysPLhzKB4Thurq4cusykYdSxpxbKqEgM2lhbY+U=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=qbPqfqUH
Subject: [Buildroot] [PATCH v2 1/6] package/binutils-bare-metal: new package
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
Content-Type: multipart/mixed; boundary="===============9080143475514231707=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9080143475514231707==
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

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
V1->V2:
 - removed default enable to be replaced with toolchain select config
---
 DEVELOPERS                                    |  4 ++
 package/binutils-bare-metal/Config.in.host    | 19 +++++++
 .../binutils-bare-metal.hash                  |  7 +++
 .../binutils-bare-metal.mk                    | 56 +++++++++++++++++++
 4 files changed, 86 insertions(+)
 create mode 100644 package/binutils-bare-metal/Config.in.host
 create mode 100644 package/binutils-bare-metal/binutils-bare-metal.hash
 create mode 100644 package/binutils-bare-metal/binutils-bare-metal.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9b500f3701..0e37101c51 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1326,6 +1326,9 @@ F:	package/mrp/
 N:	Ian Haylock <haylocki@yahoo.co.uk>
 F:	package/python-rpi-gpio/
 
+N:	Ibai Erkiaga-Elorza <ibai.erkiaga-elorza@amd.com>
+F:	package/binutils-bare-metal/
+
 N:	Ignacy Gawędzki <ignacy.gawedzki@green-communications.fr>
 F:	package/angularjs/
 
@@ -2190,6 +2193,7 @@ F:	configs/zynq_zc706_defconfig
 F:	configs/zynqmp_kria_kv260_defconfig
 F:	configs/zynqmp_zcu102_defconfig
 F:	configs/zynqmp_zcu106_defconfig
+F:	package/binutils-bare-metal/
 F:	package/bootgen/
 F:	package/versal-firmware/
 
diff --git a/package/binutils-bare-metal/Config.in.host b/package/binutils-bare-metal/Config.in.host
new file mode 100644
index 0000000000..036698d418
--- /dev/null
+++ b/package/binutils-bare-metal/Config.in.host
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_HOST_BINUTILS_BARE_METAL
+	bool "host binutils-bare-metal"
+	help
+	  binutils-bare-metal is a host utility for a
+	  bare-metal toolchain
+
+if BR2_PACKAGE_HOST_BINUTILS_BARE_METAL
+
+config BR2_PACKAGE_HOST_BINUTILS_BARE_METAL_VERSION
+	string
+	default "2.39"
+
+config BR2_PACKAGE_HOST_BINUTILS_BARE_METAL_EXTRA_CONFIG_OPTIONS
+	string "Additional binutils options"
+	default ""
+	help
+	  Any additional binutils options you may want to include
+
+endif #BR2_PACKAGE_HOST_BINUTILS_BARE_METAL
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


--===============9080143475514231707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9080143475514231707==--
