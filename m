Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34509C7115B
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 15:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 016A580AB4;
	Thu, 19 Jun 2025 15:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JDR-yaIqaURN; Thu, 19 Jun 2025 15:48:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19CF180AF3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19CF180AF3;
	Thu, 19 Jun 2025 15:48:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D904E2
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 15:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13E1780AC5
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 15:48:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K2Jx8Rqt--o7 for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 15:48:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::627;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2590C80AB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2590C80AB3
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::627])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2590C80AB3
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 15:48:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vt/invu5U3hd33PLSNhYHSeoZ78jjze8YqwRf3zywNhdgKpbxK24aJb2yGewN94xBjPzKUDchoCue/Vy/RYgzzx+J7yn2GfKZQ6Am8rwpZmGNpaUwuv7Ab2+x48NCCN3tcS72efYJJCaLsXPwRSiwE1SGoXwTuPsphlYI9HOPWJXcwzcjtDZirekq1uElBTAlNMvcKr1LGC42aUbxkLYUFQQ+w/zEAGQ/swbPNNfd4BdYaHe+h9DjyOOuSUWCc3YC7b12asAam9nftuTPVykW1ejm4K/JO62PbZOjfYPbRhqILMTvOxvoOXv6oXkmQmZ3+duNyoeYkaRdlczBof3sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJVl7IcifSiD8qSjhUZG5GTNQ+OAZ+dSS/MkypcuNUE=;
 b=Jkvlilve8DHPR1EvAaly8tgyy3zCVFPuSNQVrjN0AkfjNaQWCMG16Y/7W2TmgIjj8qTTYzqfoPujp4n9EBGfYPMwj7Ug7CAr0XsbxuRrLJMv9iSqCriOvjJx+gc3odxBpA/ciGkaAf6JyPWciaEFnZ6oKO+an95ER0qDqy3ouZA/ART/3pMOocFnjFGjRd7atVKmBbZ4cYONUqWyF9V/D5R7fv3sgCnYqp3CFDfV3LKP1oLyJuW6FSuOWwRu4BlAPoOrJZ8afNiTc3PIi2aZ6ZozA6Sgk3vngJ63365Ss31uydN51OUIB+aSsLQTGMZ+6ee3Wny8lFSf+bl0gs1MOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH0PR03CA0394.namprd03.prod.outlook.com (2603:10b6:610:11b::28)
 by SA1PR12MB6726.namprd12.prod.outlook.com (2603:10b6:806:255::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.38; Thu, 19 Jun
 2025 15:48:18 +0000
Received: from DS2PEPF00003441.namprd04.prod.outlook.com
 (2603:10b6:610:11b:cafe::f2) by CH0PR03CA0394.outlook.office365.com
 (2603:10b6:610:11b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.34 via Frontend Transport; Thu,
 19 Jun 2025 15:48:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003441.mail.protection.outlook.com (10.167.17.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Thu, 19 Jun 2025 15:48:18 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Jun
 2025 10:48:16 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Jun
 2025 10:48:15 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 19 Jun 2025 10:48:14 -0500
To: <buildroot@buildroot.org>
Date: Thu, 19 Jun 2025 16:48:11 +0100
Message-ID: <20250619154811.936265-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003441:EE_|SA1PR12MB6726:EE_
X-MS-Office365-Filtering-Correlation-Id: ca67f231-0868-4171-3722-08ddaf48b5e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4FgYlxVM99ql/m32bfGZlBOJVBR4mQ+iybhIa/+6Avp/wgNGhr6Te8JrIqmX?=
 =?us-ascii?Q?XP4RDnRrfOuyfADMfd2wbud/YLtGG7P4y1Sc4I6/71Ki268cMiAMtTtxIvKU?=
 =?us-ascii?Q?gnIjPszRzsnlFEP9Lgofl6T8AlHWqxkI7AYrKpodlSYN43fB9EXLq3YwWHO6?=
 =?us-ascii?Q?f4Phv5d3kKvN+FZn8iTkM34XXnF8b8VvNOYAS3IEu/Ztf7Edd5uBhOOunlnT?=
 =?us-ascii?Q?Uh7oJnwXquekUC8HJAnG6F90mK8kSCUDFmdImE4Aq7KlkvS4HiWoKAcCOt/S?=
 =?us-ascii?Q?9oPo4wwNYiHKwaHl0nk/AGtvELJ70U7kha2cb0dV1k6q0t72a4xDI4RIlROg?=
 =?us-ascii?Q?1045jc3Pl02MpJdOJHqknm5IQuc61UxWBCtkSFnTmMoOYxQuhrnbavy9S7Sh?=
 =?us-ascii?Q?yj/ge6Qq8CZG0S+wF44OIRmp2RZNN2LPpyi/msu6m4oIBkohtrQAyZqa/jex?=
 =?us-ascii?Q?xDXOgGcufdYGwmFk2TyAwRP/oFYWBiiPXDDdW2ljDj5ukl6SySwCgz+b5sUf?=
 =?us-ascii?Q?2xPbOEyLIipg5p6s8FYMGIAT+rFEC33H3jJJthtr9VAKvXlcpag2CMPMDsRk?=
 =?us-ascii?Q?jFgv0IRbwX/KH8gtBAPdkXUx8TQjBkbe+vl8fg7IH4/kL4uwGVGU9h6PYTYW?=
 =?us-ascii?Q?bTR/wpoJ2TGbfBHv+7i4SXrcSmZ18f7PbB+QyCfAFhLe1gIvub9ooA9csa4q?=
 =?us-ascii?Q?vKNWTicoUTZdlEjckAFP+KFpnj4jZi1geCXzHagCSUAGmZeWIznQV66MZ6l8?=
 =?us-ascii?Q?XfPd5Y32oigAch4I8heT5xeK0YJYQhIWH0uZSXhGV7PbQ8lW77o1yCv4Lnft?=
 =?us-ascii?Q?FiB9+bnQvJn7nfeHJGmF8Q+msqP6+xHWqIj93Ex5yXgJ8Gi//HyWnadYFG6O?=
 =?us-ascii?Q?slKViHbpBuEEuI08eggLedi2+0xuaRjSXDV5Yv/DudWBf290b1RfDpZXb9DP?=
 =?us-ascii?Q?WfuT4m5nJT2rpAqow1ooihQRh9WYCr0Y8ZaT80T7mbiYre3+kzZkCwTbm7tL?=
 =?us-ascii?Q?aRnU6bg8czVwdZsmBH8rDhzqZtkXhXeEa+KS/Uf7LcIoVrzDSjW7LvSwJl95?=
 =?us-ascii?Q?kUq0W4NoAGyrIzkV0KM/lmVYdGeqLwZ0bCEgEDyEF8PuqNz0p+uGFtgMFHO3?=
 =?us-ascii?Q?cg8DHTT+Z+Ex9Y9WTlLy1wgeS5Y+aqhA/zKQRLoEvFjQW15zIPswo5bYFSU2?=
 =?us-ascii?Q?PSwQVqJv08yD0xkV/KJgsjRFrBFqXIPd/npYjjNX0QNA+5liHxbjuWFgzIl2?=
 =?us-ascii?Q?9ATikFTx0hGw+dmw0zf7BN3agSXhSaGpcfkQDdd8WMxvKkx55OTnqKUiIxz5?=
 =?us-ascii?Q?EYrkgXSvSyex95yaixEFO6DJ59dpD1unGUnlb2YiweszdWxCX2FZKSmemSKT?=
 =?us-ascii?Q?6eMQz7EUEOxLUJmKKBuxVMJyFg4M0U7ssosKYeRcRKVDp33bApd/K32j7alj?=
 =?us-ascii?Q?5t29yT6O7hsdcvfPofaMN5AV/bwRWC+RCIRJ2h2WRJBJ6hU9kWXDbDd0fGus?=
 =?us-ascii?Q?PtBbZUmm8u3Pv+x3WZt2vJhfyQNtfNACKmmoH/BIE5fT5UuiBF0nBYJvFzxv?=
 =?us-ascii?Q?7tgWciA04/ep40ziRkA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 15:48:18.0178 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca67f231-0868-4171-3722-08ddaf48b5e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003441.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6726
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJVl7IcifSiD8qSjhUZG5GTNQ+OAZ+dSS/MkypcuNUE=;
 b=1zTCG1qxtS1aoAgmuoefsqJAt75NiRm4Hteqr4ZbUIs00So0RqZnOCOzakaVGiNpVaq08ROsRiiu4ecm3wOYVT4KC8fkqMYhVBbPpJurqIiMsj2p+TPXRo8Nsp1yxGZZ7E3c40RFxAW/lpG0Msmgpr6x4K5CMjvmDv7DosNzc4A=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=1zTCG1qx
Subject: [Buildroot] [PATCH v1 1/1]
 toolchain/toolchain-bare-metal-buildroot: add multilib option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
 Neal Frager <neal.frager@amd.com>, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sometimes the default GCC and newlib libraries built for a given
architecture tuple are not based on the desired ABI. Since ABI definitions are
different between architectures, the simplest solution is to allow users to
build bare-metal toolchains with --enable-multilib. This way, the libraries
for every available ABI will be built and users will be able to select the
desired library for their user applications.

This patch adds the option BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_MULTILIB to give
users the choice to enable multilib, if desired.

Please note that when using a string of architecture tuples, this option will
apply to all architectures in the string, so it can significantly increase
build time.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 package/binutils-bare-metal/binutils-bare-metal.mk |  8 +++++++-
 package/gcc-bare-metal/gcc-bare-metal.mk           |  8 +++++++-
 package/newlib-bare-metal/newlib-bare-metal.mk     |  8 +++++++-
 toolchain/toolchain-bare-metal-buildroot/Config.in | 14 ++++++++++++++
 4 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
index 709d072765..bb04b79c2f 100644
--- a/package/binutils-bare-metal/binutils-bare-metal.mk
+++ b/package/binutils-bare-metal/binutils-bare-metal.mk
@@ -21,6 +21,12 @@ HOST_BINUTILS_BARE_METAL_CONF_ENV += MAKEINFO=true
 HOST_BINUTILS_BARE_METAL_MAKE_OPTS += MAKEINFO=true
 HOST_BINUTILS_BARE_METAL_INSTALL_OPTS += MAKEINFO=true install
 
+ifeq ($(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_MULTILIB),y)
+HOST_BINUTILS_BARE_METAL_MULTILIB = "--enable-multilib"
+else
+HOST_BINUTILS_BARE_METAL_MULTILIB = "--disable-multilib"
+endif
+
 HOST_BINUTILS_BARE_METAL_CONF_OPTS = \
 	--prefix=$(HOST_DIR) \
 	--sysconfdir=$(HOST_DIR)/etc \
@@ -31,7 +37,7 @@ HOST_BINUTILS_BARE_METAL_CONF_OPTS = \
 	--disable-shared \
 	--enable-lto \
 	--disable-initfini-array \
-	--disable-multilib \
+	$(HOST_BINUTILS_BARE_METAL_MULTILIB) \
 	--disable-werror
 
 define HOST_BINUTILS_BARE_METAL_CONFIGURE_CMDS
diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
index 17232a8ef1..03938ca81b 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.mk
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -31,6 +31,12 @@ HOST_GCC_BARE_METAL_MAKE_OPTS = \
 
 HOST_GCC_BARE_METAL_INSTALL_OPTS = install-gcc install-target-libgcc
 
+ifeq ($(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_MULTILIB),y)
+HOST_GCC_BARE_METAL_MULTILIB = "--enable-multilib"
+else
+HOST_GCC_BARE_METAL_MULTILIB = "--disable-multilib"
+endif
+
 HOST_GCC_BARE_METAL_CONF_OPTS = \
 	--prefix=$(HOST_DIR) \
 	--sysconfdir=$(HOST_DIR)/etc \
@@ -49,7 +55,7 @@ HOST_GCC_BARE_METAL_CONF_OPTS = \
 	--without-long-double-128 \
 	--without-headers \
 	--enable-languages=c \
-	--disable-multilib \
+	$(HOST_GCC_BARE_METAL_MULTILIB) \
 	--with-gmp=$(HOST_DIR) \
 	--with-mpc=$(HOST_DIR) \
 	--with-mpfr=$(HOST_DIR) \
diff --git a/package/newlib-bare-metal/newlib-bare-metal.mk b/package/newlib-bare-metal/newlib-bare-metal.mk
index bd740046c9..f1e54d6f9e 100644
--- a/package/newlib-bare-metal/newlib-bare-metal.mk
+++ b/package/newlib-bare-metal/newlib-bare-metal.mk
@@ -22,6 +22,12 @@ NEWLIB_BARE_METAL_INSTALL_STAGING = YES
 NEWLIB_BARE_METAL_INSTALL_TARGET = NO
 NEWLIB_BARE_METAL_MAKE_OPTS = MAKEINFO=true
 
+ifeq ($(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_MULTILIB),y)
+NEWLIB_BARE_METAL_MULTILIB = "--enable-multilib"
+else
+NEWLIB_BARE_METAL_MULTILIB = "--disable-multilib"
+endif
+
 NEWLIB_BARE_METAL_CONF_OPTS = \
 	--build=$(GNU_HOST_NAME) \
 	--prefix=/usr \
@@ -35,7 +41,7 @@ NEWLIB_BARE_METAL_CONF_OPTS = \
 	--enable-newlib-io-long-long \
 	--enable-newlib-io-float \
 	--enable-newlib-io-long-double \
-	--disable-multilib \
+	$(NEWLIB_BARE_METAL_MULTILIB) \
 	--with-tooldir=/usr
 
 define NEWLIB_BARE_METAL_CONFIGURE_CMDS
diff --git a/toolchain/toolchain-bare-metal-buildroot/Config.in b/toolchain/toolchain-bare-metal-buildroot/Config.in
index 19c97410c6..7ba579b570 100644
--- a/toolchain/toolchain-bare-metal-buildroot/Config.in
+++ b/toolchain/toolchain-bare-metal-buildroot/Config.in
@@ -12,6 +12,20 @@ config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH
 	  metal toolchain, use the following definition:
 	  "microblazeel-buildroot-elf riscv32-buildroot-elf"
 
+config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_MULTILIB
+	bool "Enable multilib"
+	help
+	  Sometimes the default GCC and newlib libraries for a given
+	  architecture are not the desired ABI. Since ABI
+	  definitions are different for each architecture, this
+	  option will enable multilib configuration, so that all
+	  available ABI libraries are built which will guarantee
+	  that the desired version will be available for user
+	  applications.
+
+	  When enabled, this option will apply to all architecture
+	  tuples in the list.
+
 source "package/newlib-bare-metal/Config.in"
 
 endif # BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
