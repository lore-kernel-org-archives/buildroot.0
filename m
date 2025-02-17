Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19747C021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 12:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BD6160ED9;
	Mon, 17 Feb 2025 12:20:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1_Tf1rRwJS9b; Mon, 17 Feb 2025 12:20:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF02260EDB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF02260EDB;
	Mon, 17 Feb 2025 12:20:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 39D5A72
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2842E60ECE
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DKS-ai0t7VBs for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 12:20:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::615;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 346AC60E65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 346AC60E65
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::615])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 346AC60E65
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:20:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=knz2KDZEJUp1hzXQW3LZc4vZw1h/wyJFBl0OnTtrhviEiyWqCnGStjKewFrDr5Gc31uX9+AyMu0nsYvBQSwBJS1WfpzlXplpjg7L9uvEpzRezgu45dXN8SHbkSCQ8FxDs9ujym4onDjFpA78L6Jn1TTzii3Ji/0oZ4p+G5vn9wI6afefo48dyyJr7mOYD5IwLVuRbnpuYgSTJHKdMpGw9nBJhv1cm9jSDIpO87CorZ6u6dCobZ/wLqyi62AjipbGpZd6Sk4TWu2E+XRaGGCUwu2ejrUBLKTdFpcjp8LDZX61nHY2uVBLd9AEUn2VeF/mI8YzBnr9AIqTIDDOfK/YIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cyCLqyoS8DgbtlrDPv5qou+bDghsbjrh9s6An17e0EU=;
 b=vr2D69QbKdxgEAF0vkF6ErEfY5F/He/bgXgt3A0OAxYgHBVrgymHudSfkhBuHc95zmIixmfzxXsX2cBMoVPsMAl3QAmr+z9IUVa0LcQTr5w23p+gzD1ARV/GS091R7tg8LYsIOirxcgyUOil59fuDe2ysJjdRp6HJJ7qtzn/PQ3dQT8mIi5lIrtuFJZCIJHl1rlrd2Pl7k7UMNQrR/Pjq2o81CemQXPFdDGr+XAuNOIjkZmnKlb3/9nlkJsD64GN7t04x6G3jvCWYVWkia9flPmEGnQB+00rMcvwjdwLzOiNJ6I0PEtB9mjREzGFyI6lXtgQ450QfPeARXEf1S3RFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from PH7PR10CA0006.namprd10.prod.outlook.com (2603:10b6:510:23d::25)
 by DS0PR12MB8247.namprd12.prod.outlook.com (2603:10b6:8:f5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 12:20:03 +0000
Received: from SN1PEPF0002BA4B.namprd03.prod.outlook.com
 (2603:10b6:510:23d:cafe::8c) by PH7PR10CA0006.outlook.office365.com
 (2603:10b6:510:23d::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.16 via Frontend Transport; Mon,
 17 Feb 2025 12:20:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002BA4B.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Mon, 17 Feb 2025 12:20:01 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Feb
 2025 06:20:01 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Feb
 2025 06:20:00 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 17 Feb 2025 06:19:59 -0600
From: Neal Frager <neal.frager@amd.com>
To: <buildroot@buildroot.org>
Date: Mon, 17 Feb 2025 12:19:46 +0000
Message-ID: <20250217121949.2614857-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250217121949.2614857-1-neal.frager@amd.com>
References: <20250217121949.2614857-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4B:EE_|DS0PR12MB8247:EE_
X-MS-Office365-Filtering-Correlation-Id: a42a840e-9ea2-425c-b5fc-08dd4f4d6715
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?z6qsacF5FfoDMYWd7xlQQGI0HwwEXVAh6TMA2lIBbGDHKVXl2M6xkOpqGmLH?=
 =?us-ascii?Q?MlwuMKVskg8Msxog8E5yaOxmIYIeRzeAwRmBCQ8zrmuJi14ZywtN7OLe8nKD?=
 =?us-ascii?Q?icIXjaMph7YaNlJ+N3tBD9ai6t1QZdYQ3fY0Cz/jWTjPg0NOnRjTn4o50grW?=
 =?us-ascii?Q?edQkfspTKu150ykxHO9Z3DtarNKGXdNlPjY7vCOKg36/st1S4K34NYDOp5FT?=
 =?us-ascii?Q?h2xG0OWqNfG3ts7AwcYZFarUxE6GDXswwJ476uWMvKOu0Uvp/JRfCJQg5Nyr?=
 =?us-ascii?Q?/EuvdPPUF9Go7+FnyXy3Uns0Npkl4/sdBB9ticErxAtsEHnBZ/uIjXZE1KJB?=
 =?us-ascii?Q?BWJPV9oGCBf/nsirADLbhPp/xw3aQI1Cj2PPgdV0IAUwg4mEpKtwJ62YwybN?=
 =?us-ascii?Q?ScmpCaTCZak9bQquN+IZJHSeh5rr5xOK8mx8EMN1AR9B0VSLzvPpBnh3m6mS?=
 =?us-ascii?Q?ZUn/lRDFHvIdnHb7/xvFqHoIALgoYANpsY8zn0kgiXtXE7W46NKm5e6wkXwR?=
 =?us-ascii?Q?hAGsy1wicCGCfj7P8JKoy6+MV3IBhNuTKC+NcrgstJtf/aiErt7CISGVmzbt?=
 =?us-ascii?Q?5oXWjcRF3Cijns4bmAuxE251Ay+pqujfwfm+nzLWBkU6vIZawEgh3R5c5hSr?=
 =?us-ascii?Q?WVDGMAsckYlnEeHcQ1ehqbtpVKFkHzrvg4eWb8F5WI/tYZuGy958CwUzbuyI?=
 =?us-ascii?Q?ppdbleFp5d7rftR9oOkD13SKfKN9SDV+ysgcg0VVhS3uGMZTEp11LsVU7kKB?=
 =?us-ascii?Q?NnXEKZS5/pmRcyelhSnVkaBJVhP5F9r2Hr8Xe59U/zLFUCgMC/9aC9emsMcs?=
 =?us-ascii?Q?Ny8zNCOji/Tnu4RWz7oGYaLHBvITuLOGh/plP/i7Rdj/dkUOWn5nZ1EOKX5c?=
 =?us-ascii?Q?q4YIowCKfX5c0FnthY9KB0VbXbFtYir1FVMQOMplQjRunNFcpDysQ+DypX+h?=
 =?us-ascii?Q?NgNdU4BSFJqClUVoN5CCldJn9cp/vBSfkHzwphvmTICPEA7XxJrhqqBY5Rpw?=
 =?us-ascii?Q?vrJ+f7WN1+kFYfEUYCjTwaT4v8XG6KvLlIkFcBwVJK7Pem1XGaQPTN5BsKd0?=
 =?us-ascii?Q?Yqo2AlLt7YamNbDa1DqgcLHQdl7UuoJbuvCgtCwkubqfaQNd6MqU+6YhSfy7?=
 =?us-ascii?Q?HI6eqXh0pn2hJ1DDI8sTBBw5Q5IAkwVFLSokbdLBeyYB9Bg/A/QEKktromCW?=
 =?us-ascii?Q?k0ZEWcol2uLpjsmCv9COitmt0EL/+/EpiD7Rb/QHHY6aPQ9lvesyq5igT1jF?=
 =?us-ascii?Q?VxfE7X+YlSB4zSAvAcYibP+wjjOjWZPxY2trG+lES9bEwpZamz6QKWbcWa/a?=
 =?us-ascii?Q?maQxIjWrjXUnhKMA7KhzXnLZ5/2se6fwqbdvbtnxsXVVu7b6ndAsdePVJELL?=
 =?us-ascii?Q?MxbYAkleqMNE3VQ5uqpfMSA+nSbPAAr8WmRqgNx1laoGhl13CDkjt3hqMsmR?=
 =?us-ascii?Q?IDTKVVTqHBE4YdEwFg0hXhkGYiDbuPkOQJqKFsbl9zomqAuq2EXB2uvYPXF0?=
 =?us-ascii?Q?OL2XGiBIbG/qVjsbzAwOD9628oqXaC9beIAb?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 12:20:01.6249 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a42a840e-9ea2-425c-b5fc-08dd4f4d6715
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8247
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cyCLqyoS8DgbtlrDPv5qou+bDghsbjrh9s6An17e0EU=;
 b=WADezvCfFlCn3oMEylAsWt0AdaaxlYwbt41ZaSJDQ9VHOhB0w9PCrMSf/rjk7THnxI8aU0bZFDxAiY4kleZqCYpMqhfd/aQBqGgW9pJWvKGuj9RnG8na1UycOBeDuHpPINPjwwFYg45cf442qY4ldr1Ca1UNwfmZzh3zgnWgNVo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=WADezvCf
Subject: [Buildroot] [PATCH v4 2/5] package/gcc-bare-metal: add multiple
 tuple support
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support to gcc-bare-metal to support multiple architecture tuples
with the BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH string.

To do this, custom configure, build and install commands are needed, so that
each step goes through a loop of the architecture tuples in the list.

To keep consistency with autotools, all the relevant host configurations have
been copied into the HOST_GCC_BARE_METAL_CONF_OPTS while removing any
configurations that do not apply to gcc and removing redundant configs.

autotools redundant configs covered by $(HOST_CONFIGURE_OPTS):
	CFLAGS="$$(HOST_CFLAGS)"
	LDFLAGS="$$(HOST_LDFLAGS)"

autotools configs not applicable to gcc:
	--disable-gtk-doc
	--disable-gtk-doc-html
	--disable-doc
	--disable-docs
	--disable-documentation
	--disable-debug
	--with-xmlto=no
	--with-fop=no
	--disable-nls

Some of the configurations already in the gcc-bare-metal package also
needed to be changed / removed because they were incorrect.

Configs Incorrect:
--disable-initfini_array -> --disable-initfini-array
--disable-libstdcxx-pch -> --disable-libstdcxx

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- corrected sysroot configuration
V2->V3:
- removed unnecessary symlinks
- removed unnecessary semi-colons
V3->V4:
- added all relevant autotools configs
- removed any configs not relevant to gcc
- corrected some configs already included in gcc-bare-metal
---
 package/gcc-bare-metal/gcc-bare-metal.mk | 60 +++++++++++++++++-------
 1 file changed, 44 insertions(+), 16 deletions(-)

diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
index adaae6c307..7159dda1d8 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.mk
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -20,15 +20,9 @@ HOST_GCC_BARE_METAL_DEPENDENCIES = \
 	host-mpfr \
 	host-isl
 
-# gcc doesn't support in-tree build, so we create a 'build'
-# subdirectory in the gcc sources, and build from there.
-define HOST_GCC_BARE_METAL_CONFIGURE_SYMLINK
-	mkdir -p $(@D)/build
-	ln -sf ../configure $(@D)/build/configure
-endef
-
-HOST_GCC_BARE_METAL_PRE_CONFIGURE_HOOKS += HOST_GCC_BARE_METAL_CONFIGURE_SYMLINK
-HOST_GCC_BARE_METAL_SUBDIR = build
+# Don't build documentation. It takes up extra space / build time,
+# and sometimes needs specific makeinfo versions to work
+HOST_GCC_BARE_METAL_CONF_ENV = MAKEINFO=missing
 
 HOST_GCC_BARE_METAL_MAKE_OPTS = \
 	$(HOST_GCC_COMMON_MAKE_OPTS) \
@@ -38,10 +32,15 @@ HOST_GCC_BARE_METAL_MAKE_OPTS = \
 HOST_GCC_BARE_METAL_INSTALL_OPTS = install-gcc install-target-libgcc
 
 HOST_GCC_BARE_METAL_CONF_OPTS = \
-	--target=$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE) \
-	--disable-initfini_array \
+	--prefix=$(HOST_DIR) \
+	--sysconfdir=$(HOST_DIR)/etc \
+	--localstatedir=$(HOST_DIR)/var \
+	$(if $$($$(PKG)_OVERRIDE_SRCDIR),,--disable-dependency-tracking) \
+	$(QUIET) \
+	--disable-shared \
+	--disable-initfini-array \
 	--disable-__cxa_atexit \
-	--disable-libstdcxx-pch \
+	--disable-libstdcxx \
 	--with-newlib \
 	--disable-threads \
 	--enable-plugins \
@@ -54,9 +53,38 @@ HOST_GCC_BARE_METAL_CONF_OPTS = \
 	--with-gmp=$(HOST_DIR) \
 	--with-mpc=$(HOST_DIR) \
 	--with-mpfr=$(HOST_DIR) \
-	--with-isl=$(HOST_DIR) \
-	--with-sysroot=$(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT) \
-	AR_FOR_TARGET=$(HOST_DIR)/bin/$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE)-ar \
-	RANLIB_FOR_TARGET=$(HOST_DIR)/bin/$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE)-ranlib
+	--with-isl=$(HOST_DIR)
+
+define HOST_GCC_BARE_METAL_CONFIGURE_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		mkdir -p $(@D)/build-$(arch_tuple) && \
+		cd $(@D)/build-$(arch_tuple) && \
+		$(HOST_CONFIGURE_OPTS) \
+		$(HOST_GCC_BARE_METAL_CONF_ENV) \
+		CONFIG_SITE=/dev/null \
+		$(@D)/configure \
+			$(HOST_GCC_BARE_METAL_CONF_OPTS) \
+			--target=$(arch_tuple) \
+			--with-sysroot=$(HOST_DIR)/$(arch_tuple)/sysroot \
+			AR_FOR_TARGET=$(HOST_DIR)/bin/$(arch_tuple)-ar \
+			RANLIB_FOR_TARGET=$(HOST_DIR)/bin/$(arch_tuple)-ranlib
+	)
+endef
+
+define HOST_GCC_BARE_METAL_BUILD_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		$(HOST_MAKE_ENV) $(MAKE) \
+			$(HOST_GCC_BARE_METAL_MAKE_OPTS) \
+			-C $(@D)/build-$(arch_tuple)
+	)
+endef
+
+define HOST_GCC_BARE_METAL_INSTALL_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		$(HOST_MAKE_ENV) $(MAKE) \
+			$(HOST_GCC_BARE_METAL_INSTALL_OPTS) \
+			-C $(@D)/build-$(arch_tuple)
+	)
+endef
 
 $(eval $(host-autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
