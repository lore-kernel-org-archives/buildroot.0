Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF75CF6C00
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 08:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4177A40507;
	Wed,  7 Jan 2026 08:24:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aIptt7odyCCF; Wed,  7 Jan 2026 08:24:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E79D40524
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767774298;
	bh=S0RyO4Ypnn/LygzKBro1J5kHv+xngBW8B3qmVHxTxgA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=hhBn8YK9c3kKyS/+OIwxPKa83NEgzQyKIqtngyxV7OOtSjNYaZ1Us3q9uXRBdTOrd
	 pk85hgoxBZf9oVz3z1OU/2iVjUJIWA9sp6zPMLXtHqE77D3atoGdaxVFQqrvIVB9sh
	 w4ZH8NJPxfDhS7L303CYRafJJpA+6CVq+FNpjRYxEJIn0fAws71ADDI6rekFBzc0GB
	 TOj5YXgA53flM0A65ptdZB41DkrAgxeBzju/Jmol1vwSbpr6DfVzc5hfU3AF3pXnHy
	 HDGkBu5NzwFrA5oqq8miO3beNWgIeU0WmL9m6FGWHCunKE+Quep3l5tVR19GFZmsdN
	 WcBAAzvE+20Rg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E79D40524;
	Wed,  7 Jan 2026 08:24:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 90A222A3
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 08:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 828EE81C2F
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 08:24:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b2M1IdS6Y_KX for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 08:24:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c111::5;
 helo=dm1pr04cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7E30A81C11
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E30A81C11
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c111::5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E30A81C11
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 08:24:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ChRP+cfy1RtBLmRHEaO+cUuWlX2v2KSDKoLa4P+hc7s7ocpl6JK/6Pdcx9qAira1l4GPLJjZaITMEiJa99C2/ylzjChyPhpP4lB7fYTS7bDjn/ghz6d9sBQV2Ndqwt3M7EqC8qq3LPnOuabgacp7hpHJzVxrhKy83cK3iYF3lUcuAHp2t98qOynkgTud2dnn8pro39r8yRnld70keg704aRTd6F3ImUpZXBxOI9IXvsPwRPjrBpaeG1VvlUANCn5+HkgOxmJwL+Z2Z2YEUHQPb0AYIhbEMk+y8rNadifmZRS2GDYUAW9ya0Gr8b5WP7rJXzyqmiTYoEDhH1WGjo4Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8RxfEBW7jb8z/Q6/p5xD+t31CKZD2HaQcBvmbli8KN4=;
 b=RIgBGA4bNsUtzFWQK9HaB3jj9UxjhedDcD6zV8cpbAtU4foCtcQh7EbtM1yJ8/QJUa1rPmqkW1bo5FejcUmMImD1aXRGb2WWPH5hFB4nThmex989t0MpuixIeRDkDOzDf6ERsXhnXXx5e51kTP2+QGhg2Vmu5US2FplmE4SzyERnC7S5sGchuo5YG+W5QCH/aXBdHuOufPGUAsdHrnJfYG0F6DTCPR/O15b4agywZFJ2A2KK0LdK4awX1wNSp/LsLeRyFf03sOmY6DV4FXNjMWlQNys+HQ9Viyq3PB9LYbg+tSMY1t+wCwNZzDVQ1ek7z6Ne93gUvV0pFdhyUGWROw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BLAPR03CA0166.namprd03.prod.outlook.com (2603:10b6:208:32f::18)
 by IA0PR12MB8693.namprd12.prod.outlook.com (2603:10b6:208:48e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 08:24:51 +0000
Received: from BL6PEPF0001AB4E.namprd04.prod.outlook.com
 (2603:10b6:208:32f:cafe::c8) by BLAPR03CA0166.outlook.office365.com
 (2603:10b6:208:32f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 08:24:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB4E.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 08:24:50 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 7 Jan
 2026 02:24:49 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 7 Jan
 2026 00:24:49 -0800
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 7 Jan 2026 02:24:48 -0600
To: <buildroot@buildroot.org>
Date: Wed, 7 Jan 2026 08:24:46 +0000
Message-ID: <20260107082446.3326062-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4E:EE_|IA0PR12MB8693:EE_
X-MS-Office365-Filtering-Correlation-Id: a8185ab1-edce-4e73-6718-08de4dc639ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|7416014|376014|7142099003|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SACdaFDv6T2Egtxc7kD5ncbZ5ccvKNPr+vi6/XS+hUybhaNONuiIJ9oYzdud?=
 =?us-ascii?Q?nsbRPxosGiyd5YUwf5CDy0yfcR1gLeJX1QM7U6FFcRvnfAVWIEXOYcwSTiD8?=
 =?us-ascii?Q?KCrbk501FD1P2HfLbmivBq2S82DJNmRIo09v1s+4YjC46DEpLUc1i0hijKzL?=
 =?us-ascii?Q?4j/joP9YTKUIWRAc8UedmF88g8ONY/jNWhDu5lnw8zj1UHPzCO5bFSiRiaDW?=
 =?us-ascii?Q?2JjcGOXf9QM8vMDRgHPmKWDElSVdBos+apDQlALxBufY1Hh8/9osKp6FQea5?=
 =?us-ascii?Q?wxSfau/sgc8d0YAwwUnRizCWr6in6OePQ+bfjlWqAjkp6xfopshokUNjmaGx?=
 =?us-ascii?Q?NFsoE8mihkAqKx5/fHDZqazeeD+bhqC/7ryREGNwdDT4jPw2M+bBBwldPGJw?=
 =?us-ascii?Q?ih4n/81dSEl7MURf6Kvmq3Hx4NKpmf4rQquwFuPW3PIhPnvHhu2FwlWktrd3?=
 =?us-ascii?Q?FdWHd2JFFfjWR+479tLTxxZg83zr4J9/G64VeMlGmQVOIQwOP/Ya20r6G8IB?=
 =?us-ascii?Q?1H0AjSQIi5IVr8L41MctEc1VDbbRixrxhuDUV4xP//UOhlLUco5QKj7TzhMc?=
 =?us-ascii?Q?FOdC5ebbqcBFqY97VsksM223i9ZVkSqfe4ACIUd5UqdvkTdXP0rHYxZpo3st?=
 =?us-ascii?Q?kv5BFu/szQyPk6pmMMd/cVA8v9Fw1tYMkO/nvEdq6M/twjvBHbYTvsK05p3g?=
 =?us-ascii?Q?5b35ZGPfD6uHCHeaDfZigBafwSPWcThtAIS1Oc3h1JgZ6ZV3Uxy1PwX68gT3?=
 =?us-ascii?Q?SUNpzcKvsT/R41Wc6SRsUrnRrdUDTGIpEq+o/ThqjwymRpvE/vUmgm/tZC/v?=
 =?us-ascii?Q?lsac3EOd0eVePmrgoyaHbCSlrcxMPoZDNumUjKHWJHnbrtZ+STpcRyZNlA4H?=
 =?us-ascii?Q?FNhCsgAiuIp/rbmzoe+9N5upw3d5wtOzYq1WgoTWDOvp/IiYRZOtvyik0Q8y?=
 =?us-ascii?Q?Ja296IZh4fATYD0GAZ9juTmEPvvV7LE9L07lLSf7qSUQgLhn1lCMh5PzzDYI?=
 =?us-ascii?Q?aTkUpJv2wm3aSX8lwQkyT/9kj1Sy1Opd6i50sJfLnpjdjf2PIpEmVnaag7Il?=
 =?us-ascii?Q?rLzlYOFnABEvjNW6D1XoitVUlXN/9f/nCr4Ic4dGfko5f5C4EagngVqDGeBT?=
 =?us-ascii?Q?c7wJQLYwehtabHXZYDbQp8vVuhzSFgUK5rNEK6kEx7/P+ZUpOcwIIDovMpXM?=
 =?us-ascii?Q?mX0zXHPI6VNa+ANK6nCGs9qzhijU0OSVCAVMo15nx6C4kdj3uIW35As40Sx/?=
 =?us-ascii?Q?yFR0Wh8eXK9Z187nFUg9AqCDz7q86g3AIKFa7t7kcOWAxxTH1szHY1M9uAsQ?=
 =?us-ascii?Q?jtu2Y3RJsFWtWMJuHmMO6ocUGuB4jz5zctCurqrhpwZvcZgsIAf6acskNV72?=
 =?us-ascii?Q?wKqi/zn7pBYA3U/1ZOKthbS4fpNC0RkSYXtcmOaAS/2nxf1sK3OTr2z/K3LC?=
 =?us-ascii?Q?LtFk8YKU175UjGTSwxnQesB0HxAnHSDBiDW2+OSAm1rDY1Te+9RUygPP+LRr?=
 =?us-ascii?Q?cs1x9ivRhXnlWq+ixhCMrflAZ5HN8XvLp1PSTspq6lNo04W93/K8S++4l8qk?=
 =?us-ascii?Q?Xo8YF8Fi2ibWDrflN6raxahu1iE5V7dc5hyqgxdsspsFLQCP3Mx5D7UsIooK?=
 =?us-ascii?Q?Nw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014)(7142099003)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 08:24:50.1443 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8185ab1-edce-4e73-6718-08de4dc639ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8693
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RxfEBW7jb8z/Q6/p5xD+t31CKZD2HaQcBvmbli8KN4=;
 b=XdT4+o3c4mCQSmRw7xzMu35YMzMqbB1IfrNdyTvn4i0+O2GLVRywWQHR1V49P49DHr8M5k2dS77Wc0I9F4uQl4JFpw8a9KgVU1ZoBWAsTXeGYlpBEO+nFCQSDnV7vGFurzu+T9Kk3HL9wy6kVHwjymsWW28B1fm1z61FGwJqvO8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=XdT4+o3c
Subject: [Buildroot] [PATCH v1 1/1] package/binutils-bare-metal: bump to
 binutils 2.45.1
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

Bump the binutils-bare-metal package to version 2.45.1.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 package/binutils-bare-metal/binutils-bare-metal.hash | 2 +-
 package/binutils-bare-metal/binutils-bare-metal.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils-bare-metal/binutils-bare-metal.hash b/package/binutils-bare-metal/binutils-bare-metal.hash
index 7cf24141f7..9fec966c72 100644
--- a/package/binutils-bare-metal/binutils-bare-metal.hash
+++ b/package/binutils-bare-metal/binutils-bare-metal.hash
@@ -1,5 +1,5 @@
 # From https://gcc.gnu.org/pub/binutils/releases/sha512.sum
-sha512  c7b10a7466d9fd398d7a0b3f2a43318432668d714f2ec70069a31bdc93c86d28e0fe83792195727167743707fbae45337c0873a0786416db53bbf22860c16ce7  binutils-2.45.tar.xz
+sha512  ea030419eba387579ab717be7e3223fc99e93b586860b06003c12489f93441640d4082736f76aa5e98233db4f46e232f536a45e471486de1f5b64e1b827c167e  binutils-2.45.1.tar.xz
 
 # locally computed
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
index f7ee96ef97..3d1b9db343 100644
--- a/package/binutils-bare-metal/binutils-bare-metal.mk
+++ b/package/binutils-bare-metal/binutils-bare-metal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BINUTILS_BARE_METAL_VERSION = 2.45
+BINUTILS_BARE_METAL_VERSION = 2.45.1
 BINUTILS_BARE_METAL_SITE = $(BR2_GNU_MIRROR)/binutils
 BINUTILS_BARE_METAL_SOURCE = binutils-$(BINUTILS_BARE_METAL_VERSION).tar.xz
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
