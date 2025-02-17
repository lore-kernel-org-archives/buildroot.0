Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3CAC021AA
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 12:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64E6D81EBF;
	Mon, 17 Feb 2025 12:49:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZUuWfaiynWEv; Mon, 17 Feb 2025 12:49:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED08181EB3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED08181EB3;
	Mon, 17 Feb 2025 12:49:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 241BBDE
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F07B981514
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1nSlhseACP_4 for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 12:49:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::625;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 25574811CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25574811CB
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::625])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25574811CB
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:49:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o0n+Kz8ipDQ8m7uk3CzBUmH0fz8uI/RBiEX4bJlbAKVmlekD6abBNNTaMdD1dxdRnl4rFqLCo2oDBi0cFgLefLgMNBfxQwOj/Lrprbe5NIxSb17zGko70VSVUdSxEJ+h+9E10AbcEz5NEvYaX6vwyJ2ywYuB452vNtYhz0KjqC1h2hnUs+FdZFrlNBWcG0pfohd4DyHBNYNi9LrH4sUwOzBGgl5SvoxyLK2Ly1X3gELE3zsc19oc6ZBjUWC9IO/1kMEbaBW2eKMnnk9kZRreNxmMSXFYfkKIUbu6Z0//6KzgvRhbpzywWB7eICmj+FX5MGI+xZM59GP0QsRi/r77pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjCqV0RaC3yHF4+5LdvmuGB+RoYeCUIisUGX6wojjeU=;
 b=jOatkovHK1FuvfU3cNUgMX3Uvuz3Agyiu8HRRZYn4InuhaDn+kGoJLVSi0jaip++j/qL2YU+i7xvEacukV4FKSy5cZPUtq1iof2H0AEQ0OTWKtMZXpp02+JtAvfIMtXof8dgimqCjZEpzlNDzM6Nw9ptuVBeG/llLerGDV+aynrgIqXo3AhLyl6e9+mjPjbrHUH0GIFwyWrJJuq/Qb1N4Hwg/WFhlSXZSW/9HgAMT6x1IvRfYAzKPp2FCd47FUvrbx5PCpTcHlRoZmI2Kj7CnLWSLXPoSAkQzbz4t7d0GiNBzJoFCzzLVSr9i5V5tPsJyrzCV0CeqDUZ6uOUSRBszw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DM6PR01CA0020.prod.exchangelabs.com (2603:10b6:5:296::25) by
 CH3PR12MB8934.namprd12.prod.outlook.com (2603:10b6:610:17a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Mon, 17 Feb
 2025 12:49:41 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:5:296:cafe::14) by DM6PR01CA0020.outlook.office365.com
 (2603:10b6:5:296::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.17 via Frontend Transport; Mon,
 17 Feb 2025 12:49:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.2 via Frontend Transport; Mon, 17 Feb 2025 12:49:41 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Feb
 2025 06:49:40 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Feb
 2025 06:49:40 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 17 Feb 2025 06:49:39 -0600
To: <buildroot@buildroot.org>
Date: Mon, 17 Feb 2025 12:49:30 +0000
Message-ID: <20250217124932.2653445-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250217124932.2653445-1-neal.frager@amd.com>
References: <20250217124932.2653445-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|CH3PR12MB8934:EE_
X-MS-Office365-Filtering-Correlation-Id: 48a527ad-21e2-4709-ab2b-08dd4f518bbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C1oaTZuslwhgMmpXGU3PgSpzxeh4LxGGi8pM8DlATVozy4Mk+p0kbfg1JBOq?=
 =?us-ascii?Q?tA4b23JfiGHS6vG2OuAy4mGfcGNzTcDC6ZLWzyKHRxllKMn2nsDonS18xu2V?=
 =?us-ascii?Q?LerT40HGgNEcmeEcPnuQTncEqvp7KiLQ/8ta3ykKV0oQd4LmMbRfuAyFMx64?=
 =?us-ascii?Q?OueZMAlE8S2J5MfkQ8QcmESqW211qo7DjEO8j9fuOwLG2DEbSA5+OD0HDK0N?=
 =?us-ascii?Q?veQw0/OrIcNxbi924/9gQ7Cp1MRH/OEpEbqiXeyzLLCINUu4aeOd2Qca81+p?=
 =?us-ascii?Q?+viHWKOIAi1mbDHDEj5wHyF4zdtkaRyzw5vzlvuM9vuNv134iOc2LrhDIlAH?=
 =?us-ascii?Q?dFO/5rcca7TPLWwC6iTh7icDRsc3ZmRqvPT/CyxlIXFPISyr/hZtCwSJOF12?=
 =?us-ascii?Q?lIiUq8RJHOKOjZHC93GP3Ry1JtH4lJs0wERaf2c7+8FEsq9vedsyeoSu8udc?=
 =?us-ascii?Q?GG0n0nLnKObzwi0+8YNVkgk+7yQQYO+FM0cjVRNsI0JreUzDfzlKdke0BJ7x?=
 =?us-ascii?Q?BNEEyI2Uf0fQtjCGKagZntVluT7eLqzfGCKbmhsuwPmCUan3JFYxXNa3Aiyf?=
 =?us-ascii?Q?6qN55k0QQZvpANpdTyUfRbA8WaDL9TXd76GS2jhscn3I3KySwtQCu5QMgGpi?=
 =?us-ascii?Q?er2GvnIPPw0F3ZOiNrHOCis0xkxUVi9gEhJo/FzMh8Eqn49p4oZelihIfugn?=
 =?us-ascii?Q?hJdbol8RE3NLU8I9Y2wYHD3q0t63hJ69TqiAYJxZAeEGAgdk6C0S1kNa/gp/?=
 =?us-ascii?Q?0aSaXjkNdW54IsOlI83CvStVJbbvjLQlQFumrMjHgnWl3KuoMnta+SrvvrCY?=
 =?us-ascii?Q?0mWVd2Lrar1x01gprH8AJbc2BDtGR+EK0Ipd/Y2mAvVrdfA252of1B3aIxSL?=
 =?us-ascii?Q?MyCj55UzGNHflXvVMRALXSZQ5mYMQfPBbGTucMekCxLtB9/yDMRLy3jlVNOJ?=
 =?us-ascii?Q?l5rOl9Vi7M4+wBfx60f7oEG33cw+J4aH5Owv5F1h7CgHfjzi06qe8Xw2b0Ot?=
 =?us-ascii?Q?tTXDXbf0GNLUg5jLzF+vs09vFpRDNCOVB0ddJDtMun0FgTZs1Y9qQV9gYi7/?=
 =?us-ascii?Q?RmFqrXkTm2ydgzT+mF3C50aNHsDHifxZYBTFiWG8jjy/m0f1GSjp+2NB7Xyb?=
 =?us-ascii?Q?ectw/QS3QCsvyBftCw1R7RcKiNXHk3spvnABK1T/BzlSRslTxI9aNWrrazgN?=
 =?us-ascii?Q?BYl7XeK6+V53EYQ1rQWbFpP1LgrsG03FVvCqf54Md/DJs8sWRkLtha1FddWd?=
 =?us-ascii?Q?Y+Knfuh9CBDol8qSOdJn2MiM+dYgVJDs6dZvH52mDEdnbAotzIzt4iODpMVY?=
 =?us-ascii?Q?q7qHOjidb1XWqYyDEivShMylEb8xfSsDQ42arH7Sred1FJUeH/AmWoGWnB94?=
 =?us-ascii?Q?Ksm+YNJmGvYsQ2wcvrWuy3JR80anwsrvqRxEqp1siFM02lvi/ECDRmjwmCkZ?=
 =?us-ascii?Q?h1j9du74TZrGt3hGeIZHdC3FnAF9HC7gFDcWtVHTAgZBhlU0/Gt1kky3kqEz?=
 =?us-ascii?Q?K5x6+UbmyALaSx+KlrIfUhhFTfrQg1DuP/iN?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 12:49:41.0974 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a527ad-21e2-4709-ab2b-08dd4f518bbb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8934
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjCqV0RaC3yHF4+5LdvmuGB+RoYeCUIisUGX6wojjeU=;
 b=QdOIc/lmxLP8p5WWbjVt+a1FWCjx90Aox/4x2hNyK7nuOud3cJLICENwB1UX/euiu1kD0m1OzIwxIXFsi5AHbLMVEaUK9dL0GUYHjhE4t/wCK3WgMbz5wflfv6jV42q0Rahf06KX4MLkjZsrwm7OmhaXRKmGi7O7uI0f4J5VTno=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=QdOIc/lm
Subject: [Buildroot] [PATCH v5 3/5] package/newlib-bare-metal: add multiple
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
V4->V5:
- no changes
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
