Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9AFC021AA
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 12:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AEDE60ED0;
	Mon, 17 Feb 2025 12:20:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I8C9awESxzh7; Mon, 17 Feb 2025 12:20:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CCC460EF1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CCC460EF1;
	Mon, 17 Feb 2025 12:20:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2531F72
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 391F560ED1
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qKduwGI1KNhK for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 12:20:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2407::62e;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2F02960ED4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F02960ED4
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F02960ED4
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:20:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b19zjHrT92HAKMFdv9mX3zBgqBbHpp3CDrJZ3xoPP0fu2KacCWawnrRhFhu1jRh8kZ0koAxK6mh4+GnZmLpfOLz/a1SgsqbDU4qEHUaX2NSjvohY21YHWbOG0Tsz9AR+od/kjOtxNeA/Rs7+QgyrcI/RJxmVyc5tpZxtOwxPoLQZUMLn7YDjo2dV7Oir8ypa0bw4Koyh7+zGgoRJxFviKMT9TwkHNiT1ZgijOisuv+NAufi7uXeOiAGFqERqmx+fjZ5USkaPUsvfAeJ5cotSM4JxujP6riQDqe730OmzVd4f/sxDPRpZHS4Qjks+Aecsek5CqoViLi9u+BRD3qPwlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lkp6k39zC659Zt3yti9Gw78hIGIbUtaSg5BOsopdY40=;
 b=Kz9suBpo2oQcO6ZLUA28LF7nB4jE8c0Q5cOhcska/PXxa3XrJ5umWcYhKmB/dal/DOBVEjDxQErCIOFomesm26Cikasi+r3p1Cetzx+bbcgHUoJ+9+7Uf7ilHhY8uG4g632usJsEYqUvmSXAwYLE9ZnvojTC+Zw2+xscOJ+8zYyRioUlntSI4Nz/ZDPHeumq2hLpHW94Y6y0D+pTf36pO/ugpTGpuoyJusVzgSfIeFLWSXXTZAxIy/3pApi/LdINR2mqokutXZPTe16GGD/NofG7ronasYRyv/Yn27VyouLFfJD0gjrFukTDNiqP23DmskDaCE+9CNCa5yAKna8vvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH2PR20CA0020.namprd20.prod.outlook.com (2603:10b6:610:58::30)
 by DM4PR12MB6640.namprd12.prod.outlook.com (2603:10b6:8:8f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Mon, 17 Feb
 2025 12:20:03 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:58:cafe::2) by CH2PR20CA0020.outlook.office365.com
 (2603:10b6:610:58::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.18 via Frontend Transport; Mon,
 17 Feb 2025 12:20:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Mon, 17 Feb 2025 12:20:03 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Feb
 2025 06:20:03 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 17 Feb 2025 06:20:01 -0600
To: <buildroot@buildroot.org>
Date: Mon, 17 Feb 2025 12:19:47 +0000
Message-ID: <20250217121949.2614857-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250217121949.2614857-1-neal.frager@amd.com>
References: <20250217121949.2614857-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|DM4PR12MB6640:EE_
X-MS-Office365-Filtering-Correlation-Id: 53ae2ba7-fdf0-473b-b22a-08dd4f4d685d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G81muidEErrjWx0qT36TS23PsDUlw98rYqN/mIuri8QKEG11IqdN+Q2NPjat?=
 =?us-ascii?Q?Mzew9UPoQ6mqt0UPnT8Edt82N4kvfmABYjSXns34ZQeZzEpzQx0L0AR2YLzm?=
 =?us-ascii?Q?U1tkq7AjRUIatIGu6A9qIoRLZSqJPbyBSX8gfJfazQu2zwDqVq/u7bMrPRIt?=
 =?us-ascii?Q?6Fd77/FSxsxbxHlEnyjipoLtepdL3o5CnuwJPiDAAe+um6V6vNbvwtvTTk+s?=
 =?us-ascii?Q?XsPk2LTFAgO93cs8/qhz7fcDdiFSUKrvFZkJL6aq0LvbNlam8hU2xXLtzX15?=
 =?us-ascii?Q?lcuwlNbOocz7cn1Zko8mdVZxFUovYuT9KSCviADJfS5zZde9sIjwiz5qis8w?=
 =?us-ascii?Q?UJsWoseTXgQ2bP6HADTLlr6ejZlFfSq5oSGnnXfwvWQIN2Yz71jpw0XpnG6U?=
 =?us-ascii?Q?chSJ7++BjhE61tDBobh2bwVlBgmraHV6Q0tueuR0f+Jj+lbG3JqAYlKMULyT?=
 =?us-ascii?Q?lG7ho0Z9BF34vsAjIJ4KcrerkzTFXn7NuYul4D5WEKJqVkiif7YWbXqRVNFq?=
 =?us-ascii?Q?Sx0i1oleZDXp//NR3HWS9ueam6gaAQRC8VD+JNnablwuoNHMdKK5h+sveLIa?=
 =?us-ascii?Q?GSWRL4A5Wn7OWldveE0v+8eW4KvdTN1PSM8m1XvMqfWHfSGbdtGQQZhsXNR9?=
 =?us-ascii?Q?AfLT7z+BV5UUfiFmVMTb6uACq3TMhuC9G5BIOfHS9PLXQmQr7/fwLouTf+3X?=
 =?us-ascii?Q?WfUhcGVTVSr629WlSZYNp5Bh/KiWSuaYHJDYxkH/q3WRYxsi8II+AhA+FCkX?=
 =?us-ascii?Q?6ICc1wQ9DEAGveIQbxKd9ACjwDxVYmxwGD2UHe7gWtfCUVgSpUQt9ISg/OBm?=
 =?us-ascii?Q?eSC9RONI3DvysbpRVf2CfH9JgsyLjxsvWoAUEvIdgtcoDwxEtl+nteT44qVA?=
 =?us-ascii?Q?FaGJIrnRCTZRp2/YBkKuothu4ZwgGV2qe+aFbl0sBU42/7g/rWQA/38Wubwh?=
 =?us-ascii?Q?eKxmbonGEvuzUH3EsK2z+TcfASpu7Dvyi1bnd2Dbo94aZlpZ9hIppKptrDT+?=
 =?us-ascii?Q?r0fdTbazdXOAQ9Eoy3TREeE5SxdIauAW1J8lwRLBAkhToAeCySLRUemSuwZB?=
 =?us-ascii?Q?wobgizX6T/eBt+oSCjPyFx6+GvbsmyIf2EDXGqsE8zZp7csSAFmY/3qCo3uD?=
 =?us-ascii?Q?A/cMKffkU2ND2/FKfdbncZlAjXnKipg+XsLLMh7/TIUr9W9xDM5Js+0crj2r?=
 =?us-ascii?Q?4KM4k+gDj7mFRjlenYa0zK87pB+cFzBOKL6RWvvTfbDJxswbrQRQMcpyEKnJ?=
 =?us-ascii?Q?K6OgTyncG2f4EfUrCfg+GkCaIS/KBPnmAh5kGndsid18dnHC4OyTxcAh4WKa?=
 =?us-ascii?Q?qt5mwbJDyX0Uxad+MMUPg0HVoHG+oWt24DvMXg4EjBUvRuoY1F9FWrjiF7jr?=
 =?us-ascii?Q?1pVz3nn+COysuET6bz4jx8SG5pWRoZ0KSvYOiOtBqEvl75mN8vi09LQImH0C?=
 =?us-ascii?Q?TOGyDL+OAClbyybVb4nJd5U6GRVnjRIhL2/5UifV4sVrBY4jAvTo8H6NIxxx?=
 =?us-ascii?Q?he2T9t/Oj2DPADNBzyzpFOk4ufrwyeqEuhOI?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 12:20:03.7587 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ae2ba7-fdf0-473b-b22a-08dd4f4d685d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6640
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lkp6k39zC659Zt3yti9Gw78hIGIbUtaSg5BOsopdY40=;
 b=jeJsFNyOoAD6/QvlqBl6fLbY8J/w+P4oKAifi7VLzKiHREHxLxn4g5gUxdIDrJuKwdz008jnVs316ZqbHC8jw+r8Gg+si236t28LAR11zuZOM/bwmqlniQWxt1/Q42vew5CPPbb5znh6THCIjmOcENQlO4If6a1WDLdxoQfM/Wc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=jeJsFNyO
Subject: [Buildroot] [PATCH v4 3/5] package/newlib-bare-metal: add multiple
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
From: Neal Frager via buildroot <buildroot@buildroot.org>
Reply-To: Neal Frager <neal.frager@amd.com>
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

To keep consistency with autotools, all the relevant target configurations
have been copied into the NEWLIB_BARE_METAL_CONF_OPTS while removing any
configurations that do not apply to newlib.

Also, the following configs were not taken because newlib is being built for
each of the bare-metal targets and not the main target of Buildroot.

$$(TARGET_CONFIGURE_OPTS)
$$(TARGET_CONFIGURE_ARGS)
--target=$$(GNU_TARGET_NAME)
--host=$$(GNU_TARGET_NAME)

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- no changes
V2->V3:
- removed unnecessary symlinks
- removed unnecessary semi-colons
V3->V4:
- added all relevant autotools configs
- removed any configs not relevant to newlib
- placed common configs in NEWLIB_BARE_METAL_CONF_OPTS
---
 .../newlib-bare-metal/newlib-bare-metal.mk    | 47 ++++++++++++++-----
 1 file changed, 34 insertions(+), 13 deletions(-)

diff --git a/package/newlib-bare-metal/newlib-bare-metal.mk b/package/newlib-bare-metal/newlib-bare-metal.mk
index e28e7a717c..bd740046c9 100644
--- a/package/newlib-bare-metal/newlib-bare-metal.mk
+++ b/package/newlib-bare-metal/newlib-bare-metal.mk
@@ -22,28 +22,49 @@ NEWLIB_BARE_METAL_INSTALL_STAGING = YES
 NEWLIB_BARE_METAL_INSTALL_TARGET = NO
 NEWLIB_BARE_METAL_MAKE_OPTS = MAKEINFO=true
 
+NEWLIB_BARE_METAL_CONF_OPTS = \
+	--build=$(GNU_HOST_NAME) \
+	--prefix=/usr \
+	--exec-prefix=/usr \
+	--sysconfdir=/etc \
+	--localstatedir=/var \
+	--program-prefix="" \
+	$(if $$($$(PKG)_OVERRIDE_SRCDIR),,--disable-dependency-tracking) \
+	$(QUIET) \
+	--enable-newlib-io-c99-formats \
+	--enable-newlib-io-long-long \
+	--enable-newlib-io-float \
+	--enable-newlib-io-long-double \
+	--disable-multilib \
+	--with-tooldir=/usr
+
 define NEWLIB_BARE_METAL_CONFIGURE_CMDS
-	(cd $(@D) && \
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		mkdir -p $(@D)/build-$(arch_tuple) && \
+		cd $(@D)/build-$(arch_tuple) && \
 		PATH=$(BR_PATH) \
-		./configure \
-			--target=$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE) \
-			--prefix=/usr \
-			--enable-newlib-io-c99-formats \
-			--enable-newlib-io-long-long \
-			--enable-newlib-io-float \
-			--enable-newlib-io-long-double \
-			--disable-multilib \
-			--with-tooldir=/usr \
+		CONFIG_SITE=/dev/null \
+		$(@D)/configure \
+			$(NEWLIB_BARE_METAL_CONF_OPTS) \
+			--target=$(arch_tuple)
 	)
 endef
 
 define NEWLIB_BARE_METAL_BUILD_CMDS
-	PATH=$(BR_PATH) $(MAKE1) $(NEWLIB_BARE_METAL_MAKE_OPTS) -C $(@D)
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		PATH=$(BR_PATH) $(MAKE1) \
+			$(NEWLIB_BARE_METAL_MAKE_OPTS) \
+			-C $(@D)/build-$(arch_tuple)
+	)
 endef
 
 define NEWLIB_BARE_METAL_INSTALL_STAGING_CMDS
-	PATH=$(BR_PATH) $(MAKE1) -C $(@D) $(NEWLIB_BARE_METAL_MAKE_OPTS) \
-		DESTDIR=$(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT) install
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		PATH=$(BR_PATH) $(MAKE1) \
+			$(NEWLIB_BARE_METAL_MAKE_OPTS) \
+			-C $(@D)/build-$(arch_tuple) \
+			DESTDIR=$(HOST_DIR)/$(arch_tuple)/sysroot install
+	)
 endef
 
 $(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
