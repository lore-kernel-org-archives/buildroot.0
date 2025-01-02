Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C514E77194
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 10:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44D4D80E9D;
	Thu,  2 Jan 2025 10:25:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id omtQDEZXFBKe; Thu,  2 Jan 2025 10:25:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30E3880EA0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30E3880EA0;
	Thu,  2 Jan 2025 10:25:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 85A24F27
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 10:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66BB94096D
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 10:25:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id npZ8iJcJ4dSi for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 10:25:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::60f;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 09F0F40966
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09F0F40966
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::60f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09F0F40966
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 10:25:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EVm45FxFYHYdGeMmemC/EJNQxP43Svkphaafi3sx7EXm6D8IWNy9nLH9JkO0fens51eRhbS1a1L4x9CPSY3vXTeKhK9ikauBBtrCU0xs4CzAV/oB1kyj1rNl4fJwTFJZVEEVKgd2ot4GMhcgsnx5nFX8XJSKEcKyfROIrH2BRKLXW1vpfkQwdPuzOspLQQdkHdIbPKOqyfbuVAbrFNZVG3j4jnmg3SzEb5fBle4thdHmhjwqWmY7hfiGy3OelmcK50+uzJ0Iv7g76jLXb+0ciC1+PAaZoOF+3kpdgsGcL39ThJdWILfR1S4RA5mfv7H5hnkAHeLdyxRpDZRDYcecbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+32qGs8n82d+fxLD6y9lPVORYV3jcZQs1PHsjrqG1o=;
 b=L99ROax/UwCvua5TsubUjwTTxxjwuaNtftARV1rpJypTqd8ejG9n3akwq/jfSuMplb/Pd4qkR6kE8Yo6V8K6Of2h8MmPUTB9ksHUHMyGcCiF4L94zUHaDBvaAQdD1FtNqIz3ZBB6iNQ77re1fVXZWzzTpKSEaKWVSgfrJXkp3VaiwBD+YV/l+auxsDG7FrAWKx8WEa+ZSOkZuTKWUVjWgrNPD+sTmtgv7/ghhiEUmDyEroMEWvSTSiQrMITCNH0D3DwYnznUKG7s+L6pYNNFVuOr8B7Jz7vHkQShSVsHZTktiJa4yLBHvYX64jWc3LgAeGJLUYHTqkgyPC2+eIgDEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=buildroot.org
 smtp.mailfrom=amd.com; 
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none (0)
Received: from SA1PR02CA0008.namprd02.prod.outlook.com (2603:10b6:806:2cf::13)
 by MN6PR12MB8592.namprd12.prod.outlook.com (2603:10b6:208:478::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Thu, 2 Jan
 2025 10:25:12 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:806:2cf:cafe::19) by SA1PR02CA0008.outlook.office365.com
 (2603:10b6:806:2cf::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.13 via Frontend Transport; Thu,
 2 Jan 2025 10:25:11 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8314.11 via Frontend Transport; Thu, 2 Jan 2025 10:25:10 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Jan
 2025 04:25:09 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 2 Jan 2025 04:25:07 -0600
To: <buildroot@buildroot.org>
Date: Thu, 2 Jan 2025 10:24:59 +0000
Message-ID: <20250102102500.1420512-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|MN6PR12MB8592:EE_
X-MS-Office365-Filtering-Correlation-Id: 28c8ca23-03ce-433c-1942-08dd2b17bcde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LUC1f8twCLGWjIYphVOZdtjS70dvRdgsK8QI2YsRIE5cXOOzvaVLMgjZAFOh?=
 =?us-ascii?Q?DxKCCFJQzpmU4GVZ/naG8pX3wisTdQy+D6ElbEJj2UFbYVoUzUT3f59cZYgB?=
 =?us-ascii?Q?gOHXQVsz+3510aLH61I/P7O7pPy5XsoOah4GOt9tWZ+gPLuQzM2YP3VMtvJG?=
 =?us-ascii?Q?G7toKJVgC5oi/jykI6N95IdGVPnQrCGAH3TNBmmdLTLW9IOlVWxMjTkEWrWF?=
 =?us-ascii?Q?EiY3YfrJ8JggSr2Ydwy/5lVEt/3RjD2hst/8H4CySxX04fVapTf+BrzAu7pr?=
 =?us-ascii?Q?j84dpIPpP5BfcSRZkIQTlnovd3LqIaoDCmH53UbZjqTUYSZ4qy7QXmNtoWfy?=
 =?us-ascii?Q?EUV4gouasXUgSz6N5NfNjjCkn0sDIpUci1ww/mEOvjlaoUYa8C5LAV42o7aq?=
 =?us-ascii?Q?eZqQuu4uQ6ZaU7MEXkJMWUUrEbRt27JOL7aXcPxWAUIl99nQEJ860m9AD8Eh?=
 =?us-ascii?Q?QbRboxjFYoNW0a0bh/XokmImynnqLuSq/Gimy5jNZdIc84U96MTo4+GIisZq?=
 =?us-ascii?Q?Z48T7wk4hBTPUOgCBwK7p6XeOKLnKoAL3stTI0fx/YywJH2pLQNK4+izMd9S?=
 =?us-ascii?Q?C8H79QZysIQokGUNkecpXEcPMOUWb/vxOrqgJTrW9PBHHuzqw/K5unNmDsjM?=
 =?us-ascii?Q?a38l81yLbbvUr5ET1EYizVrDo5pcWhWOCvdL0dd5cKjrU8eYdt04OFSSBpFK?=
 =?us-ascii?Q?KgYARyL76IpqCkRhP4ubCF4gDwYQ1KkB7SMXmkuNokji8+nO6GSySZurZw3Q?=
 =?us-ascii?Q?mhPBAp18UUbqIy0+DjfVKgUqbQDuh9O/SUFewo8BIOs5v7/tusYQJnpgIMWn?=
 =?us-ascii?Q?+xMYHXTDKBLCXvYZAFMV1sbOQsw6h1cUfyMXemUrqUnFSIPVCllT5rSZCnTc?=
 =?us-ascii?Q?+BiHXY1orxIlc1gfJtNwy/22T0J1+6D9KFZxD4Xq3Bk59uDuEnZe2Tak8jQ0?=
 =?us-ascii?Q?tu3fRQIlMY5HhMLNJB83nD2sskxtwsTUeDgkxvw+2NCYayOF30iq6OHAMNn2?=
 =?us-ascii?Q?3HGmcbwZdgcUSwc4+GwzqIuP4gq8jFm3ZqY3uWa0ys/9oYmaafx3mZzmb7sF?=
 =?us-ascii?Q?/i983ZhwFSig+dVWzgN2TlzIjHw6ewRB4CQzwO8Jc3qSlqSzobjrHX9j1EoW?=
 =?us-ascii?Q?jRzUvuZalA9J0cS4HYolGrJrM01jY7dse08f7RxhiZA3qwlfpclrDT8L+amf?=
 =?us-ascii?Q?WSAeeMJQ5YhXGISWhTM0JwtvIgLKkN0Lg46KGIlNi4A9+ddKQFhTJYPXg5l5?=
 =?us-ascii?Q?Z6hzHgzNY2j3L/hU//0u+AoVGoVXm6fRvvqcNnnReTDSLuRJJCxjOCeeUvpE?=
 =?us-ascii?Q?5p3Bl9aQ9/2K5/14Adn0WJVc3coarIWCR7gTCI5aBKORYTgzFm3d/KS+74JQ?=
 =?us-ascii?Q?gTOY6NkrE0cjN0qrHIH96uzQDG3NTJk3IniHtf942TnrGMkHUU4cK673Ji/R?=
 =?us-ascii?Q?A38zkDikyeryF6Rp1xBFAdO2RRDXbG7cnm/y0hkHAeOGHd/D7tWNsA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 10:25:10.8767 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28c8ca23-03ce-433c-1942-08dd2b17bcde
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8592
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+32qGs8n82d+fxLD6y9lPVORYV3jcZQs1PHsjrqG1o=;
 b=g8CKWJgCdSMd5ISvEShgmDgbLm0JMEQhR6MhWzYPmwCQkscqGyVNaK3XgnTD6vNxzhkskL07hXazdfawPJ7NTM+M2C2dNZKXHYyqv2Wjc5SIDKrhZIX/GqXPxmydskABMdwkmVSi2v93X/7pBpxbH7Gt6piKAQFqJShBH3bD5/o=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=g8CKWJgC
Subject: [Buildroot] [PATCH v1 1/2] package/newlib-bare-metal: bump to
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
From: Neal Frager via buildroot <buildroot@buildroot.org>
Reply-To: Neal Frager <neal.frager@amd.com>
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 romain.naour@smile.fr, michal.simek@amd.com
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
 ...oblaze-fix-read-and-_write-declarati.patch | 40 -------------------
 .../newlib-bare-metal/newlib-bare-metal.hash  |  2 +-
 .../newlib-bare-metal/newlib-bare-metal.mk    |  2 +-
 3 files changed, 2 insertions(+), 42 deletions(-)
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
index 827925373e..03790fb57f 100644
--- a/package/newlib-bare-metal/newlib-bare-metal.hash
+++ b/package/newlib-bare-metal/newlib-bare-metal.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  0c166a39e1bf0951dfafcd68949fe0e4b6d3658081d6282f39aeefc6310f2f13  newlib-4.4.0.20231231.tar.gz
+sha256  33f12605e0054965996c25c1382b3e463b0af91799001f5bb8c0630f2ec8c852  newlib-4.5.0.20241231.tar.gz
 
 # Hashes for license files locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
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
