Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F81C71153
	for <buildroot@archiver.kernel.org>; Mon,  4 Sep 2023 10:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB42F81916;
	Mon,  4 Sep 2023 10:05:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB42F81916
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eZrAY5TDupub; Mon,  4 Sep 2023 10:05:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C86981BA8;
	Mon,  4 Sep 2023 10:05:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C86981BA8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 268401BF215
 for <buildroot@lists.busybox.net>; Mon,  4 Sep 2023 10:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F335481BA8
 for <buildroot@lists.busybox.net>; Mon,  4 Sep 2023 10:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F335481BA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fSiRKommiNo0 for <buildroot@lists.busybox.net>;
 Mon,  4 Sep 2023 10:05:51 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::61d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8FF981916
 for <buildroot@buildroot.org>; Mon,  4 Sep 2023 10:05:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8FF981916
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g1YKfsK1pxJTKngegjTXxLtIceWAv0kYyjiIgpPlj5jGSkd53CChtVV9NG5/q1s6QC6xWTdJBpSh31SJBpRFu0rs3w9Ukk6dvBXS8b2UBPoBPmZ3vR0uET5pj8R/27/W7qltylIQ/QBDRrV2KiDTnXsTI29YTkJvb7M18GZzAOE6mJd6NUTTNyr3Xx/9nmTh/zsRZ34BclqvKJjlTNlNG4MMWJWXCBQZiVG3THN6SQHkJPosjdw2b8ziD8dDAsZ+nHy4dSXZiIHARvYhu+qeaALlzmKaIjAmcr3OaEhs+jmAA54rWeNzaKWMJ6+k9sFV3n2CnZXZffLv15fu+8WNSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ketgZxafg7JCWOrSj5Lv0FmcFzcqW6m1ekMjYH1tp4U=;
 b=RKZWmCPqC87bYUiLjraekHFY1bHGH+LnMRPkIKyeMIXL6CofBzMNdOg1yMbR6i4J4dsY585TJOZ1Dd/omnYFqmG7SZ8IY88prTkSaRDhPsy3KZgrPq286enGvA9yJM9BLcBfjLh0lOZZqOzv7LXU67iklttcyRGoTATcnKKARWfqG9q52wCLZ7sBCNfJOApicrrZ+QWVC0ScMQUqKklxdDp+hYDJdfgGwUYIUPh3E8Z2fncqhKkCmAy5iusv+RpMktXjoqt9cPGwe1ABKxRFlMdH/A9LQLzSixSSJ5bbVBzNG46C/h5/OlV3ive/c5g2VxAWDOPn+g237Abeu/IFuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from CYZPR20CA0019.namprd20.prod.outlook.com (2603:10b6:930:a2::19)
 by DM6PR12MB5006.namprd12.prod.outlook.com (2603:10b6:5:1b8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Mon, 4 Sep
 2023 10:05:48 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:930:a2:cafe::26) by CYZPR20CA0019.outlook.office365.com
 (2603:10b6:930:a2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33 via Frontend
 Transport; Mon, 4 Sep 2023 10:05:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.205) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Mon, 4 Sep 2023 10:05:47 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 4 Sep
 2023 05:05:14 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 4 Sep
 2023 03:04:48 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 4 Sep 2023 05:04:47 -0500
To: <buildroot@buildroot.org>
Date: Mon, 4 Sep 2023 11:04:38 +0100
Message-ID: <20230904100443.1613306-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|DM6PR12MB5006:EE_
X-MS-Office365-Filtering-Correlation-Id: d238e6f4-36f8-4af9-2896-08dbad2e82eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hSPTo0wsXm7Jj+CcH8J/jwc6uSXrLzw3Px/D3/VOBU0nT5ZNxfRZ4q9S07Z3D8w56v4itBiLPyRXuiAUdcK3BveUW1yQ8JlZkCRK1VkgcEoMfib1gDc1dibtWJU3+0ud0i7R1E7TkTxaLbdFNwQ01MK634JitDIlJlAqXLrMf/cq0rJ+3sTP5yUyeS96if1MWwdPIdpMehxEMTBQCoWDPE2LikE4dKEr7Bg77iBbdB/E+IZbhFAzJ5oj86WCRoWqo9lpF3gNnaskjQ1Z3TGQiYFsU5ZQlQAv4qVL+MooJOjAFXxdan1SnrChaPsEBeWAzo1mYVgDyAgToKAGeW1knnydtIxqWgLV33HgBHEkwyfHXGMINnBo24QlD/JOV0gHvQ/A67i79hBPnPFoKqgE9wfMcsQ9UoWWJIYzzUCFUzwOOZ4x5ygMDFAzRMvHHgaNW2RsFBhGmShmcg6GDrEKVg6hQ6n0Py8vRMl27p0MWe31NjU/jqAPgoUnAuihS9mTdbNdzH0vE/ljRk/37wJ+Hux57fnBrFtle3bUgpLBr/76nqKOgXeA42QmBQXBpROU+1b7aXiF2vpQafkohf2iNHqAq9zK5iU3KmyTiYcBDM6CAXqNv9iFW+4Lg9tz0ODd9BVKUI6ttZUOHoC1U+/psZ2vfU0t6TVIii5VdKltJuJ0IGwA+3OphMYup63Qbq54AgoaWzM1skhLZznoc4W1MpB/lc6tbIfhFecHhtKo6F7OIIds8cPXFEf82XhCX4ZgZsUee7L3kc4exnpFdx9riqfTADPa4shOCYbS8m2yenM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(39860400002)(396003)(376002)(136003)(186009)(1800799009)(82310400011)(451199024)(46966006)(36840700001)(40470700004)(40460700003)(41300700001)(81166007)(82740400003)(356005)(966005)(2906002)(36756003)(86362001)(316002)(6916009)(478600001)(54906003)(70586007)(70206006)(6666004)(40480700001)(4326008)(8936002)(66574015)(8676002)(44832011)(336012)(426003)(26005)(2616005)(83380400001)(5660300002)(1076003)(36860700001)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 10:05:47.8513 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d238e6f4-36f8-4af9-2896-08dbad2e82eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5006
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ketgZxafg7JCWOrSj5Lv0FmcFzcqW6m1ekMjYH1tp4U=;
 b=S545TaKvZscp/cLNa2EKmVHCl/NDmhC2XzHi/u3nJ99N+zG4H0gEupbrP8BY83LTuwoPze2tuYj25vdbzrhImBig+ChScTvoLZy7GlW2V1mGwz4X15ptA6ifmrNTXRf04XoKDT3aeYe1FhHD6GztL7i4/sKd1Wsj7rRmIq+bQ6g=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=S545TaKv
Subject: [Buildroot] [PATCH v3 1/6] package/binutils-bare-metal: new package
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
Content-Type: multipart/mixed; boundary="===============6963147925132398361=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6963147925132398361==
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
V2->V3:
 - no changes
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
index 26d0a0c223..1ebdf0a2c9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1327,6 +1327,9 @@ F:	package/mrp/
 N:	Ian Haylock <haylocki@yahoo.co.uk>
 F:	package/python-rpi-gpio/
 
+N:	Ibai Erkiaga-Elorza <ibai.erkiaga-elorza@amd.com>
+F:	package/binutils-bare-metal/
+
 N:	Ignacy Gawędzki <ignacy.gawedzki@green-communications.fr>
 F:	package/angularjs/
 
@@ -2191,6 +2194,7 @@ F:	configs/zynq_zc706_defconfig
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


--===============6963147925132398361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6963147925132398361==--
