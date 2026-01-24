Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C138D715C4
	for <buildroot@archiver.kernel.org>; Sat, 24 Jan 2026 11:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 483AC40A09;
	Sat, 24 Jan 2026 11:57:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TjBnDcEEdvgD; Sat, 24 Jan 2026 11:57:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E90D5409CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769255875;
	bh=9841d17GgqER49UOetMMOu3uQigHFrejVajoDnR4FR4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=BTlW3fP2hfmOx4a4wqGrVNpEHoEfeng1Zw9MFoAT48ZjbbJ+Zw3ey1Ao9logZe/8A
	 EVvVY11z8BZtDPS2ASw5ykAX5TEtmH/dlNfVJi4QODGZjkT0uSsHTdnxhAQilWRsPG
	 MZBu6crNFj0krS/DSQPbZXxz53X70sPwe7SnCZvnkhsXR0CgusY4IoP/o14rSlftrS
	 asPUNlpwNYNCcnDZB/ea1H2OZfNuSdrSsy3If6Wle5o7Q1AV3h1lR7RLMSNXG6yyMT
	 OT5duka+ZrE887Zq3Grpjhfv8kpbaKt6JOCBuPDxGpC+bKLhdahMbUIB6+NBops+7q
	 fDGrDf79OkdCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E90D5409CB;
	Sat, 24 Jan 2026 11:57:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D8BEF71F
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 11:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8EE66070D
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 11:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ofCsYB0xJHVr for <buildroot@buildroot.org>;
 Sat, 24 Jan 2026 11:57:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c112::5;
 helo=cy7pr03cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A802F60706
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A802F60706
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c112::5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A802F60706
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 11:57:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D1XStvC83FKoSoso8EvQ+SqK4U1HY+lI99MHS09J8cuWADjb8ZnXiTOQE4ND5Ck+DoKQhRoO0IePqnASVvGF0tK5J0knbm45N248UYbfiG2BARFBR479H8tI7vU+SzytIxKF/NeoWJjZbZSXeEvaIhn+NtkXyqnFyCdmElk4Ke5Qe6rcpTTbCA59/Ii6D7INRqG/k+zHxG4bp/iyVwf+AeEBna3wCiItgidb8V5kBO57sgKpToFJjslUujEjaXh+mHWXGVqDE80XfQUfbw/PrP+BuvOrBp72JzkCs9pHro9qUMK0l7NQj8fAMSPSJ0uikYb/+s5g5tRN0Ff6bFtCUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+El2wktjYFmzGoJPu+vnMA8UlYISTfcYsQxZbxd7JY=;
 b=VNriLFklZM2HRJ/O8jagLnGEa6inCGNMorAFkGb0PR/PB77ebWP8yMZcY081PTRxgaSf0Yzg2SYCsUVp8LT16QlUtITby/58cRDAdRQDitYAggj/qMrD5ajLUhutW8Uz1uRwTgzymqTCMwnaPPaunE+bNVYGA24I4A6e2K1YCSRP8fCcQs9xBlKy/Z6llPzEADbBr8DO2u/aRpHFCfVFTFZaztS/PfUsybzn1h0fYSWK1dyLzR9h71WJ1RP1ZhQQZ4XvaKN7z/ntFlJPJ+HtCBrgj73LRCel5mbBC07bluy5Z5YMKkYPtOgxyfdeYh4JgEwS95XJhgU/HK3hLw1wxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SN7PR04CA0104.namprd04.prod.outlook.com (2603:10b6:806:122::19)
 by CH3PR12MB9172.namprd12.prod.outlook.com (2603:10b6:610:198::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Sat, 24 Jan
 2026 11:57:47 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:806:122:cafe::e0) by SN7PR04CA0104.outlook.office365.com
 (2603:10b6:806:122::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Sat,
 24 Jan 2026 11:57:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Sat, 24 Jan 2026 11:57:46 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Sat, 24 Jan
 2026 05:57:45 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 24 Jan
 2026 05:57:45 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Sat, 24 Jan 2026 05:57:44 -0600
To: <buildroot@buildroot.org>
Date: Sat, 24 Jan 2026 11:57:41 +0000
Message-ID: <20260124115741.828751-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|CH3PR12MB9172:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e4cff11-ce17-485a-089d-08de5b3fca17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|7416014|13003099007|7142099003|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MzoXpnbMKTzxvfAw5DUg0Dwgq1azA82++MfDeMhlpH2MbZjHdny1yH8lTJiC?=
 =?us-ascii?Q?Kjw6Jv2goY8ducpQpaVIZKYJCzgyXKXeeAF/E5+onACIPTx/6u6ZOi+JSepA?=
 =?us-ascii?Q?1KGNLH6NzR9VoK3oLvWavcSFyLpxeKqTItIkVOKufcf188/zUf6tnEmFQRzV?=
 =?us-ascii?Q?SZNyxscPfbGNI0Xk4euTijrmS8VYI4ock+64BXyaN5M9Jl5MxpGVxJ0Eug+R?=
 =?us-ascii?Q?eUdN8jcMiqqE1t1XjqBRq7v+DCjDBXv+m/VO1mfRn3tCzVezpOitew2sHP/2?=
 =?us-ascii?Q?+DtWI6FGF57ySxNQondiJU+0BwALPKsI68GQKYwbVWXqdQAyA7p8gAg3YRHx?=
 =?us-ascii?Q?DC7yVh2EKlkNButIiSOmdnzLRz4lajt/5g/xDi3DsR8WWWWUesrQGp0zakNc?=
 =?us-ascii?Q?sX31Lqy15ch8vXqg5idc/r/Wo8/h0PJd/aD1un7u5ohC4TZSNm7OuhuQ+MQX?=
 =?us-ascii?Q?FsjtYo/HS2T9BLeVuNFFlwnLtXsYyIgoqL62vsw42UY3AU2e5eRBcOjiGnuO?=
 =?us-ascii?Q?d7zwPCk09mcGrRCmrc4Pvr9wCPR8/R9AyrSr7yFbv3zMH8kh2ybANsKc86J8?=
 =?us-ascii?Q?aeL/r5VKQmqMOaXG3v9aVWp8EtV1bgAv5rsgMvsvGV2oIpEuEc/uugFXnZKn?=
 =?us-ascii?Q?rIrqReZPT/9IcAfuB9fuyJwoWfmR91VdJ1MXPAbf7PZatgDg2JccCB+E1uRL?=
 =?us-ascii?Q?aef8Xlwe41Kx+qkGlf4Higzq8wLyv+4nqJRni9xWa2CkGli4SOeBHK/XuexC?=
 =?us-ascii?Q?AmytpuIfwo1VFdraY8p/+Esu3N2/8zQjFlCQ17mpfRyBz7Xs5Vvji2MH6biC?=
 =?us-ascii?Q?Q7fg6To+0poP6yA2UjzskKWwt7221HP7EbNAeWq+gCNRN5SxKpvhbwV4F1oD?=
 =?us-ascii?Q?ZVYhvYk3Vbrrza703UT6kROUvWqm7ngryw6VzVp+Tb0zFbQoNQfc87WlOFWi?=
 =?us-ascii?Q?CP8J1ttEJ7d5uB1DCk49kUupNhSmES0hBnsxP3nl0DVo26vXsQ549knMhxzl?=
 =?us-ascii?Q?QPHpC3zFW1+AvkyPhH0/iYhskIe3QwLHZAnbtWMkRipAv/cMBvRzuwUC5pv4?=
 =?us-ascii?Q?1fFvWt/U4s7jCwMuFziim4j9IOZ/I+8DLRgL9niT9EgdUXFTsC6hODN2bSdm?=
 =?us-ascii?Q?anVB5Tt39x+2wlPaioarvpGCzSZkOxaInbdlyJgevOG+CoxPFd5ArUcoNjaw?=
 =?us-ascii?Q?cWzDEzQuwRsfXRtRd4oCx820hvtLPgpZskZRYbc9Al2QTnQJTgz75UW06NqF?=
 =?us-ascii?Q?WK4f3VtfeK/3/xfFxJPYKpxKv3KFMUROLopan9gDMV3tN5YYQUFatTpTqHFf?=
 =?us-ascii?Q?jdu65x69NyneDz9D3irUQQWfCSD+MBg/Bfiuf7gFfTacZOnCCvTDQWe9M3gs?=
 =?us-ascii?Q?7aokv4Mw7S0K1F+g0dLKlZMIG1YFcxWXp0znk9ztGgHfPDJZx+uIAzoh/Jr9?=
 =?us-ascii?Q?c2LaNEU47lnFsmArSKB8V2LwHaGkXP8IfFJ+TTRnDtJbvbwZ2OsB26Mv6I0y?=
 =?us-ascii?Q?ckWQ5OKL4SCrSPxmq5hUa+QiVCia7XEzAQVuFgJZ85zupOcqeAp/wbe+a+T1?=
 =?us-ascii?Q?VL3l4Kloj0tDFo7D+5jiG2vZwGqM7GA7wd+REBS1Ro8qjswkw62LxNju43JZ?=
 =?us-ascii?Q?DzR7OZzxaKg5Lb/Zov7xh6KkcP4YemoMbBw1tKTwReY2uCuVS+zhWPsModih?=
 =?us-ascii?Q?cvkVuyJ/FG12fHa9jbDckcgvWpk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014)(13003099007)(7142099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 11:57:46.4116 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e4cff11-ce17-485a-089d-08de5b3fca17
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9172
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+El2wktjYFmzGoJPu+vnMA8UlYISTfcYsQxZbxd7JY=;
 b=h4dLdbRfa3ajW0wLW577PB1S9/6Q7Pkuf7LJz/azusUAMD9PHVMrt4VsWGcEITVZk77udX++FhxGhD21sm4VYhIRyVeyLLXerVQK5LocTlI0fogOnUFwihWlYhPnpcGfp5xapzQgclkuXXA0v5Dsha0xrTZ4FcYnvVl6F6SKWmE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=h4dLdbRf
Subject: [Buildroot] [PATCH v1 1/1] package/newlib-bare-metal: bump to
 newlib 4.6.0
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
 yann.morin@orange.com, brandon.maier@collins.com, ju.o@free.fr,
 Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump newlib-bare-metal to version 4.6.0.20260123.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 package/newlib-bare-metal/newlib-bare-metal.hash | 6 +++---
 package/newlib-bare-metal/newlib-bare-metal.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/newlib-bare-metal/newlib-bare-metal.hash b/package/newlib-bare-metal/newlib-bare-metal.hash
index b22602033c..69d34600d7 100644
--- a/package/newlib-bare-metal/newlib-bare-metal.hash
+++ b/package/newlib-bare-metal/newlib-bare-metal.hash
@@ -1,8 +1,8 @@
 # Locally calculated
-sha256  33f12605e0054965996c25c1382b3e463b0af91799001f5bb8c0630f2ec8c852  newlib-4.5.0.20241231.tar.gz
+sha256  6ff27e3bf022666f43f7802255be680eeff722ac181b1725d21e2e8318604ee3  newlib-4.6.0.20260123.tar.gz
 
 # Hashes for license files locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
-sha256  bdaffd5fff30cb5fc7a239a4fa0b95f703590f7b3813ca7f4e76ff46437aeb81  COPYING.LIBGLOSS
-sha256  fcfb5ec69b6ab52676dcc4dab7cf4338c8000ef97812dadd35b8592a640a8419  COPYING.NEWLIB
+sha256  4ef33c7bdd57f5fa8fbe3bdc0200245ab91c564c2ef530d95bbe7fd4070757cd  COPYING.LIBGLOSS
+sha256  f3afe48e4bc6ed8466a42e9dacb6be1d8f9cbf5aac15cb8e474a5ccde8b40ef6  COPYING.NEWLIB
diff --git a/package/newlib-bare-metal/newlib-bare-metal.mk b/package/newlib-bare-metal/newlib-bare-metal.mk
index f1e54d6f9e..5881993d3a 100644
--- a/package/newlib-bare-metal/newlib-bare-metal.mk
+++ b/package/newlib-bare-metal/newlib-bare-metal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEWLIB_BARE_METAL_VERSION = 4.5.0.20241231
+NEWLIB_BARE_METAL_VERSION = 4.6.0.20260123
 NEWLIB_BARE_METAL_SITE = https://sourceware.org/ftp/newlib
 NEWLIB_BARE_METAL_SOURCE = newlib-$(NEWLIB_BARE_METAL_VERSION).tar.gz
 NEWLIB_BARE_METAL_DEPENDENCIES = host-gcc-bare-metal
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
