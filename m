Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA30C021A0
	for <buildroot@archiver.kernel.org>; Sat, 15 Feb 2025 12:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAC70413DE;
	Sat, 15 Feb 2025 12:57:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0bagDuGNckWI; Sat, 15 Feb 2025 12:57:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F8064264D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F8064264D;
	Sat, 15 Feb 2025 12:57:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 454A472
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 12:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22E6C60C01
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 12:57:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T0tQfGHijB7Q for <buildroot@buildroot.org>;
 Sat, 15 Feb 2025 12:57:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::62b;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 576CE60B0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 576CE60B0A
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 576CE60B0A
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 12:57:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qGf6wPrea3okAyOa/FwG+yfkY7iLQtvhXlXdrH34N76Nsds69RybwQG7LJLj3t3IlUBzykEAzLk8EyFew8ZwrF6eSFgNU7n0n+llO89Ql/dMKZzEHMSUz3bKkUnnK0VQML5nFcORDTPVmYgnL+u/svOxgIl6Rgir9utsJUO2cm/pDrWs7tbOOdbVS39ZO0mXdro0fEx+bV4B1XsL4wgv4hSmakbmSb/E3C2PIHH8rHYWE4xids6Rf4OCKIR4IPLXh56xSUqA+qh8HtpPQVmMFj7A2bBBzs1yHrdwGkZ1fNcKUMzKIpi4IFngB30VheLf1o2n8xSKr/jhW3ehyoy1Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NhEzJ465aCLkerlU60hA9z6tDZtRx2G6pKrzLvfh9Bg=;
 b=CioYF/Oz1wGz6rU7DMF86JfAcocZyeWvNxdW7ikVP5PWHFgm7MA8rv/3R0Q/KZiG5so6wjPArSE4ZGbwWsamLKVGuGjaRhWCEX+iWUwRkp8Pd1m+x680jjFKqDoZsWOSLX4tyxHxJdz45tGdwIeWcKgrHVcnaIdkh55IYgBHF9t+lCc9Pb2aP1XlvGitSCqktVw+OoAkFynY2SRPwlTVd9H2wjPd/GfHw4/II7+tLhaomxx7/HuS50E4lHfF0ScmidbMXqpaWMix5NF36okuqW0uvEhf8wqTq2bO8s6tAfiV5vpGRodGn57xXMgb5EXbvS/6sUupjZe16I2A0zib8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN9PR03CA0120.namprd03.prod.outlook.com (2603:10b6:408:fd::35)
 by IA0PR12MB7721.namprd12.prod.outlook.com (2603:10b6:208:433::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Sat, 15 Feb
 2025 12:57:37 +0000
Received: from BL6PEPF0001AB4C.namprd04.prod.outlook.com
 (2603:10b6:408:fd:cafe::2) by BN9PR03CA0120.outlook.office365.com
 (2603:10b6:408:fd::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.16 via Frontend Transport; Sat,
 15 Feb 2025 12:57:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB4C.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Sat, 15 Feb 2025 12:57:36 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 15 Feb
 2025 06:57:35 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 15 Feb
 2025 06:57:35 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 15 Feb 2025 06:57:34 -0600
To: <buildroot@buildroot.org>
Date: Sat, 15 Feb 2025 12:57:28 +0000
Message-ID: <20250215125732.2965257-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4C:EE_|IA0PR12MB7721:EE_
X-MS-Office365-Filtering-Correlation-Id: 10cb3ed6-d9d7-416c-3ce2-08dd4dc0522c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4F1JTzkLNITu33qLeLNW/Fj4NBsJToJANc3oUVBf/laiJfMchgBs8NjA50s0?=
 =?us-ascii?Q?HTQkOXwvRDILXV8qmNszMVDK5x2NzuSpgsv5d5TYwLwhgAw8S31G3nAyv1MG?=
 =?us-ascii?Q?ctKeY8qoXsPilYpvOVBRSL56Pipy/5Lfi3z28VrOXcUo/vDJEcuAtNlP4dRS?=
 =?us-ascii?Q?/E/UAJN/Pw46Yi7rSap38wxJ/xtY9Uvr2hpEcBp/tyx97GvC5yOlogergn2h?=
 =?us-ascii?Q?TSvfetMj9dOIffnI7j8/UHYjdrXpHNBwgLRodq0tHBNwuP28sg/ACXRaANSG?=
 =?us-ascii?Q?y8tdoTesc9TZN9n5kho80z4dmdhXrHweFiQMq9AEl5DjkdgtjsFKiCCxlX9g?=
 =?us-ascii?Q?KqrxsvtAR/lYCDDhMeN6TElNp4zmANo0mG6F0V9+W9cP3OFGAQn9keSFqtdg?=
 =?us-ascii?Q?tFh62ObbG6NFfXVrMzaObjX4bs2D8uLjBCxtfTFGkbiTxPPcl7Hqf/Vi6bcz?=
 =?us-ascii?Q?9BXBNBNSDZI4bObFgSshTfBJwdkOl4BlxiraBOL6fgFeSePMG08J1wilaywM?=
 =?us-ascii?Q?a6yEPmJU4KqFke3yvGuO74g9pZJoD1wiIsX56kmkRuJg2yLv9ltvZGalwRrj?=
 =?us-ascii?Q?0yfHGT2DjADk3LVP1xs5ZTcZmXLcvYhHL1RRCN244DGmgGOt+/tSYGCWE+11?=
 =?us-ascii?Q?EBattxNmh9blHgkWpoSgfblRnFiHYofc9flu4YmLspKSMpH0wcKy3G5BsRHY?=
 =?us-ascii?Q?ugbtE+1CacWEnnNn0pLksYSPC3FmirLFgEVhozXHXmZu9N+14Q7HYXhYuMNZ?=
 =?us-ascii?Q?O2q1JZpU81OXz1asylbmYF8wLNomCMX29ByL5bw0k6pbqeerkhx45Swq4t6F?=
 =?us-ascii?Q?1qpQJEI0TrZ8qxzxWFbSfiwxhOhRwnqu/nyw3nqCZ5zMmcnZWqSEmSDsDqj8?=
 =?us-ascii?Q?qcsC3CG+GEhtiD1pZ18GE4bynP0xkslOXXyTQ0WO3kFeHep61B+hRv8wRdPC?=
 =?us-ascii?Q?jzVVDPJy5Mu14rWehALSx3YX7f3/vksRLTJtHf3y5IYq2fnbAXXQFBGa/MlP?=
 =?us-ascii?Q?LN3EF1inBXkFSBmzavjq2yAkIJd/k/CGsaGokDP7B6uCCrbGzkHHKA3Shv7e?=
 =?us-ascii?Q?pXya3rukjSOk4Ob/w9roJhGUBZPxuNlTsAhUmCE+RSGRJp1/MqESeI3IRWMb?=
 =?us-ascii?Q?3eBCmYc+2GODVVd8OB1w9VkSdfxNAROJM6bjyKlj1qvwG+ETJOiQWd+Ug5q8?=
 =?us-ascii?Q?xnj68ev7Wa5bW8Nv1n5qpj/ioCLdanxbkOmbhApULRFplhEnaK/4gP7FS+eO?=
 =?us-ascii?Q?COraQHFojd9FZLmlqHpsUei0/fxu0pmJetxxZjiTiu3zm3UEURWL1uaLsg3E?=
 =?us-ascii?Q?i/43M9yLKmMwdSfscdfyCVz4pQe4nfucHqD0z6WmA0lRzem4/co2Zj/4xJPK?=
 =?us-ascii?Q?JGSKI2JihC+cdM5zZzOordgEbGeKlylzYHjx33pfB3Hosr3p+tx1LcNheVyB?=
 =?us-ascii?Q?CcSN4jAVvbgWq/kS+j64N3JO37nREuH+JifFB+1MBfgGC2cUWYgdSBnfiKdY?=
 =?us-ascii?Q?cHr1hqSM6UD8k7yua5KYdtNHjfxdDxJ17rC4?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2025 12:57:36.3387 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10cb3ed6-d9d7-416c-3ce2-08dd4dc0522c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7721
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NhEzJ465aCLkerlU60hA9z6tDZtRx2G6pKrzLvfh9Bg=;
 b=vYkTxLEAUZF6xjD1lq2k7Pp8B16QPruthE05aC3XRfcaWxpw+VT7lUxOOpQusDFHpKVCf/4yFNi/Ufwol59jvBkP01pbb72tLbu+JIsJznDXM6wQxys1LEicbPcOuOFlkwE4bOweMieu/N3bV/I+/pSTTt2BhrrYPIkVFh5N8WM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=vYkTxLEA
Subject: [Buildroot] [PATCH v3 1/5] package/binutils-bare-metal: add
 multiple tuple support
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

Add support to binutils-bare-metal to support multiple architecture tuples
with the BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH string.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- no changes
V2->V3:
- removed unnecessary symlinks
- removed unnecessary semi-colons
---
 .../binutils-bare-metal.mk                    | 54 +++++++++++++++----
 1 file changed, 45 insertions(+), 9 deletions(-)

diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
index 3525e9fdf2..7a3017a12c 100644
--- a/package/binutils-bare-metal/binutils-bare-metal.mk
+++ b/package/binutils-bare-metal/binutils-bare-metal.mk
@@ -21,14 +21,50 @@ HOST_BINUTILS_BARE_METAL_CONF_ENV += MAKEINFO=true
 HOST_BINUTILS_BARE_METAL_MAKE_OPTS += MAKEINFO=true
 HOST_BINUTILS_BARE_METAL_INSTALL_OPTS += MAKEINFO=true install
 
-HOST_BINUTILS_BARE_METAL_CONF_OPTS = \
-	--target=$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE) \
-	--disable-gprof \
-	--disable-shared \
-	--enable-lto \
-	--enable-static \
-	--disable-initfini-array \
-	--disable-multilib \
-	--disable-werror
+define HOST_BINUTILS_BARE_METAL_CONFIGURE_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		mkdir -p $(@D)/build-$(arch_tuple) && \
+		cd $(@D)/build-$(arch_tuple) && \
+		$(HOST_CONFIGURE_OPTS) \
+		$(HOST_BINUTILS_BARE_METAL_CONF_ENV) \
+		$(@D)/configure \
+			--prefix=$(HOST_DIR) \
+			--sysconfdir=$(HOST_DIR)/etc \
+			--localstatedir=$(HOST_DIR)/var \
+			--disable-shared --enable-static \
+			--disable-gtk-doc \
+			--disable-gtk-doc-html \
+			--disable-doc \
+			--disable-docs \
+			--disable-documentation \
+			--disable-debug \
+			--with-xmlto=no \
+			--with-fop=no \
+			--disable-nls \
+			--disable-dependency-tracking \
+			--target=$(arch_tuple) \
+			--disable-gprof \
+			--enable-lto \
+			--disable-initfini-array \
+			--disable-multilib \
+			--disable-werror; \
+	)
+endef
+
+define HOST_BINUTILS_BARE_METAL_BUILD_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		$(HOST_MAKE_ENV) $(MAKE) \
+			$(HOST_BINUTILS_BARE_METAL_MAKE_OPTS) \
+			-C $(@D)/build-$(arch_tuple)
+	)
+endef
+
+define HOST_BINUTILS_BARE_METAL_INSTALL_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		$(HOST_MAKE_ENV) $(MAKE) \
+			$(HOST_BINUTILS_BARE_METAL_INSTALL_OPTS) \
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
