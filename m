Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B20C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 23:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8709260F63;
	Sat, 25 Jan 2025 23:31:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2pkNF-domLV9; Sat, 25 Jan 2025 23:31:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D16560F19
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D16560F19;
	Sat, 25 Jan 2025 23:31:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D9198A6A
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 23:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C599A40F9E
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 23:31:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lY1cBJaIoJMq for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 23:31:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::603;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA49040F91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA49040F91
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::603])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA49040F91
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 23:31:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G0TPbp/OGxjCBJJmkXbUAP7cr4FQjNK/yoE2g4z0Dp35u83cVb2A6vsMrBZBZErpWpttkAYtANxdlOg2x5nIYGOgRSrwITQ0pNiquTzpofEPgVT+vCuK+1uFYKo1J0krZjcm5a9sYzmR16rXuBNTobzKaSRHPZd9362+63ZbxeyvQjklkkAU7fpY8iYnjLLrAYvKASbOfAiKfJI3OoJ2kgE46I5WX7QBAhj1i/Dy45prSq116cAvTUq0ihFWXR6pUFNeJiDlMufdxkFyoD6LwNyNI4p66OnWJNbry084RS3giJNDvDrUgOGz0VPhBnQ5zFS5ijTDI0+Vl2APO4Imvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gJVO5E2Z2OHgFkZPMqrgrcGR1gJqGDKuFkj90pjs64E=;
 b=bIss8ryj7VuYh8kvP54bO/XZZAFlC79UkEn/7swGJDQQKCv6CjRt2/xMgS1ifJr5gdAtB7oA5UnSzSQsgdj30uJs1pkidUlDahoPZw8+71Z3wyiV17KWmxUyqzDXM3/FAKG5ynTIRVGozibADKeYM+tj0cVhwOWQayR/2STUJzD/lcV0RFUh0ZV5vm/B7kHLykiS7/coXXY401tDHzdFHnvaBI2SZGPlGtsYTOFcn1YvMmJxz0P6HZ2x1+ruZhR6XOGfLvvNx4hkxfMxLsihLeibKNoV748BCfW2LBPU6sR1uKkrgHGbJ13k+GbQgqjeWGGicryhZWUVj9GKmebWYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR13CA0231.namprd13.prod.outlook.com (2603:10b6:a03:2c1::26)
 by DS7PR12MB6285.namprd12.prod.outlook.com (2603:10b6:8:96::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.21; Sat, 25 Jan 2025 23:31:45 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::2c) by SJ0PR13CA0231.outlook.office365.com
 (2603:10b6:a03:2c1::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.13 via Frontend Transport; Sat,
 25 Jan 2025 23:31:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Sat, 25 Jan 2025 23:31:44 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 25 Jan
 2025 17:31:43 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 25 Jan
 2025 17:31:42 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 25 Jan 2025 17:31:41 -0600
From: Neal Frager <neal.frager@amd.com>
To: <buildroot@buildroot.org>
Date: Sat, 25 Jan 2025 23:31:33 +0000
Message-ID: <20250125233134.78433-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|DS7PR12MB6285:EE_
X-MS-Office365-Filtering-Correlation-Id: 2be7dde2-2e24-4538-7952-08dd3d986dc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VX57eiI/ll8AK06la6EPMeDPUAidMnIqD/kkEv7rnSMKOEh72lJ+x76vNGU+?=
 =?us-ascii?Q?OuRAEuccJLP4hyE5Mzshyy5prLf98eGCau6bjlNkeTG+94XvaNOGnGe+Av4g?=
 =?us-ascii?Q?zkLXFDFxi4q6cYPD2oSYKRdy+CrYNmiOyrKFqw4YAk2s2MMPWuSiZDllykrR?=
 =?us-ascii?Q?IKiRN4AXXuvYjodL1KJsw8ADaxGv3gcQ/RMGaCag9g9GAQeXK1aCGYGKeQgM?=
 =?us-ascii?Q?jlzgJEN2UK/cHKR7RME61qWhJ9p/z3LuhssCnr2eV/0DuMVRQKMSayXh0MiD?=
 =?us-ascii?Q?0KQPU77VD4QKam/Nphz+V6lUpKe7+PMevhte4eTBkLDpQKMPyPeIqUPZMO02?=
 =?us-ascii?Q?M3LE0FUMxzHgngHEuGGPiHW5ksMXcVLbe4/x/XNAHQOhkqwbOTT8SBt+T0zA?=
 =?us-ascii?Q?wb7e9y6uGtnRhXdHYmewrfO6y2WiTmPxQdQKFhemKj6yRYaIoDx3mSCiucv4?=
 =?us-ascii?Q?lsV4tfh/zmZPNP292XSrY0gecyN4YYIXwOckHYdbKDADXkdARiUcUuWv0NjE?=
 =?us-ascii?Q?wotfGB1Q5pWStrA9O6lOZG1h+JPDpbE/0E5Fq2/QRGi0RdqRNKmMTyZWn4cp?=
 =?us-ascii?Q?piLNJyeNtoOQQ94OR6+3A3UeugeeeaSSvPeRNMwtnFRslc/lP1ShRkpbDQdC?=
 =?us-ascii?Q?Die1fzueA/2tMDXANAz4+Xepw1Y9kdVipa0BGGoRTshlKQ7rPWwBz86ncqoX?=
 =?us-ascii?Q?5+canKCTShNApIIMduWN/bdcKqE1+MEZk2nolCQ1DQGGGk1UcDqhxlsRcsr2?=
 =?us-ascii?Q?gnXzNvswEbSw0v8YYAjJMvDHBQdh4UO4D0QsnPkghdPE+f5HGTqo0daCUOvG?=
 =?us-ascii?Q?CxnnV2YZ1tHR9CXPzZZJyCuWqlduall/5mm+UHCtTdozNwKySi+sPCdvZDSc?=
 =?us-ascii?Q?9nQU26oP2iDA+IRMetvrXIIJWd4QwDGO7vVRumnxpeDgXc0q8zEapKkPYvcd?=
 =?us-ascii?Q?5Lbfhsf1K20ciD59loZydOc+xRyAA5hmBolLnADqYb/0Eptw7gRxfwoPOkY9?=
 =?us-ascii?Q?Y55KxPhsmbMz7bXdYfgGXiGCeK/iyQp5OYLzmiPGwvNoeji+XGJeGwc+Ha7s?=
 =?us-ascii?Q?V2zusq5ineURUcUOHNsZGXJE6jm7YMAY6C3yzi9aSuAbSlkMCKaPy/ine9+w?=
 =?us-ascii?Q?NI29CDLkk46BTcu6/ySFYeV97QwD3WYEL+nKsEL+6MdQWSQnrcn1d59WEIBN?=
 =?us-ascii?Q?jzSx4OAQ2q69eQBoxh9w1mvRerMgDxQKyxKe9MuP7PzqeY4tQ16qBJgRiEIL?=
 =?us-ascii?Q?xzsDeZK932kMRcH8dL9Gyt+2j8NH3KNQ8uviU/0RikWF/dSPS/uRDFppFKhS?=
 =?us-ascii?Q?ZrM8YqCcvcQlOxPKbqZyMTpn6zEvcWwsDFN2CK7Zz8TUEfuUfNBTNFbsSumi?=
 =?us-ascii?Q?SeijUtP1T1ylf/kOSlQFkSTq/bMZDSreRtlIfwdIAplgl8xJdMDh0GBAYj2p?=
 =?us-ascii?Q?r9HPYJ2K6yUonAuS3+1Xeg7OO9woL0SDpXCvW2sAl4A51wXScaEtkQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2025 23:31:44.0413 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be7dde2-2e24-4538-7952-08dd3d986dc0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6285
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gJVO5E2Z2OHgFkZPMqrgrcGR1gJqGDKuFkj90pjs64E=;
 b=kN3sko8fgvhprctaFMMrd3jt0elpT/J6cGj0f1BkF6PAN6vge5enJVc3YzSeKEcOjK826Z70gZXnqopcJaX3kW0+AYf3vQdGDW7APifWSr4tAKJlDBuGlLxCDyoIuRCRYKfcVFL4RCQcFXkhgcfZpjQR2yzLNfoPmKC8qPnTeEc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=kN3sko8f
Subject: [Buildroot] [PATCH v2 1/2] package/newlib-bare-metal: bump to
 newlib 4.5.0
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

This patch bumps newlib-bare-metal to version 4.5.0.20241231.

The 0001-libgloss-microblaze-fix-read-and-_write-declarati.patch is no longer
needed since it is now included with version 4.5.0.20241231.  For this reason,
the patch can be removed from buildroot.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- fix hashes for COPYING.LIBGLOSS and COPYING.NEWLIB
---
 ...oblaze-fix-read-and-_write-declarati.patch | 40 -------------------
 .../newlib-bare-metal/newlib-bare-metal.hash  |  6 +--
 .../newlib-bare-metal/newlib-bare-metal.mk    |  2 +-
 3 files changed, 4 insertions(+), 44 deletions(-)
 delete mode 100644 package/newlib-bare-metal/0001-libgloss-microblaze-fix-read-and-_write-declarati.patch

diff --git a/package/newlib-bare-metal/0001-libgloss-microblaze-fix-read-and-_write-declarati.patch b/package/newlib-bare-metal/0001-libgloss-microblaze-fix-read-and-_write-declarati.patch
deleted file mode 100644
index 5eacfd3270..0000000000
--- a/package/newlib-bare-metal/0001-libgloss-microblaze-fix-read-and-_write-declarati.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 1ebecb83607e9c0cc44ad1e518169ae03c0f2d26 Mon Sep 17 00:00:00 2001
-From: Neal Frager <neal.frager@amd.com>
-Date: Mon, 13 May 2024 07:22:47 +0100
-Subject: [PATCH] libgloss: microblaze: fix read and _write declarations
-
-This patch resolves the following build error which occurs with gcc 14.1.0:
-../../.././libgloss/microblaze/linux-outbyte.c: In function 'outbyte':
-../../.././libgloss/microblaze/linux-outbyte.c:3:9: error: implicit declaration of function '_write' [-Wimplicit-function-declaration]
-    3 |         _write(1, &c, 1);
-
-Signed-off-by: Neal Frager <neal.frager@amd.com>
-Upstream: https://patchwork.sourceware.org/project/newlib/patch/20240513062419.2042278-1-neal.frager@amd.com/
----
- libgloss/microblaze/linux-inbyte.c  | 2 ++
- libgloss/microblaze/linux-outbyte.c | 2 ++
- 2 files changed, 4 insertions(+)
-
-diff --git a/libgloss/microblaze/linux-inbyte.c b/libgloss/microblaze/linux-inbyte.c
-index 58fdf1957..2f8d33871 100644
---- a/libgloss/microblaze/linux-inbyte.c
-+++ b/libgloss/microblaze/linux-inbyte.c
-@@ -1,3 +1,5 @@
-+extern int read (int, char *, int);
-+
- int inbyte(void)
- {
- 	char ch = 0;
-diff --git a/libgloss/microblaze/linux-outbyte.c b/libgloss/microblaze/linux-outbyte.c
-index 9d7bc4890..46de511f6 100644
---- a/libgloss/microblaze/linux-outbyte.c
-+++ b/libgloss/microblaze/linux-outbyte.c
-@@ -1,3 +1,5 @@
-+extern int _write (int, char *, int);
-+
- void outbyte (unsigned char c)
- {
- 	_write(1, &c, 1);
--- 
-2.25.1
-
diff --git a/package/newlib-bare-metal/newlib-bare-metal.hash b/package/newlib-bare-metal/newlib-bare-metal.hash
index 827925373e..b22602033c 100644
--- a/package/newlib-bare-metal/newlib-bare-metal.hash
+++ b/package/newlib-bare-metal/newlib-bare-metal.hash
@@ -1,8 +1,8 @@
 # Locally calculated
-sha256  0c166a39e1bf0951dfafcd68949fe0e4b6d3658081d6282f39aeefc6310f2f13  newlib-4.4.0.20231231.tar.gz
+sha256  33f12605e0054965996c25c1382b3e463b0af91799001f5bb8c0630f2ec8c852  newlib-4.5.0.20241231.tar.gz
 
 # Hashes for license files locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
-sha256  f3b7f3e4426b1fa6f60198dae7adfedd94b77b28db2d108adc0253575011e0ff  COPYING.LIBGLOSS
-sha256  9a59b4ee3af067045fe0ea78786201c42d54756fe48cbccf44f3dfc398474717  COPYING.NEWLIB
+sha256  bdaffd5fff30cb5fc7a239a4fa0b95f703590f7b3813ca7f4e76ff46437aeb81  COPYING.LIBGLOSS
+sha256  fcfb5ec69b6ab52676dcc4dab7cf4338c8000ef97812dadd35b8592a640a8419  COPYING.NEWLIB
diff --git a/package/newlib-bare-metal/newlib-bare-metal.mk b/package/newlib-bare-metal/newlib-bare-metal.mk
index 89092eb973..a3532f0b22 100644
--- a/package/newlib-bare-metal/newlib-bare-metal.mk
+++ b/package/newlib-bare-metal/newlib-bare-metal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEWLIB_BARE_METAL_VERSION = 4.4.0.20231231
+NEWLIB_BARE_METAL_VERSION = 4.5.0.20241231
 NEWLIB_BARE_METAL_SITE = https://sourceware.org/ftp/newlib
 NEWLIB_BARE_METAL_SOURCE = newlib-$(NEWLIB_BARE_METAL_VERSION).tar.gz
 NEWLIB_BARE_METAL_DEPENDENCIES = host-gcc-bare-metal
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
