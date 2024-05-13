Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DE2C25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 06:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44C85408C5;
	Mon, 13 May 2024 06:41:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id myiLBd8FZv1R; Mon, 13 May 2024 06:41:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A818409DB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A818409DB;
	Mon, 13 May 2024 06:40:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 02BFF1BF4E3
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 06:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0CBF608AA
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 06:40:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id spFTG9wBINIH for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 06:40:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::600;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B26376076C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B26376076C
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::600])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B26376076C
 for <buildroot@buildroot.org>; Mon, 13 May 2024 06:40:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZG5N+oYVDcPi6+6Vf9iiU+E4gBHArBghlaI9eyDuqNQZApVH4d4H/MfiUOgpxxI3UBWcv6mjnuZv7xLvSOPrFmwcd5FZ8SkLGRwLObPBBGxTJGw7EjpMsG85FurUqQGoBW/JcNjlB08f8lQ46YWJehFTO4G+Sz4G9nlSvpc12wrJ7s3uRgPNauNMTB9oVFWRgMowf3U67bSkAfmDX9faYVuk0XuykO6k3UWQy+lBeWTXWY47RE2dnQERaVPKnLzdlHPVM9Y8qkTb99yucr9hAyrbgt15YOAoLiIGtz5InvgS0iZgsyxsNkRn+91audH76519Ny6y3yxe9hw7hsdqpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9OPTyS/62qH+6vF7siyalTQUYdnEgLk1mDUSSYFQdw=;
 b=Gm2NX2JEb6K/JI0v6Ys1B2m2OtF3mxdMitVLCsKk2lyQ0EC+adV7bsohFro96tAliJxNkNuvNM/Z4owfRv2JTCIsDSt/MQwyVSAkD8QFhhxSf6ow5GudpgUKWmhzjlHAU8mjBshRF3WmIV+MI4RbsvdOMrg/4dAud9eQl0WnH7C2ERQrrUQSnGtRWaBci3O84OooPEuMWhKyzryyEHzW+bL6Occwkm+FiubQYpjLKuUazbPXpK1SP7BQ5bKjbHu8/z80vR9z7dSNmjWXG2hnqUQfHTRLAaeeeEJXslJll1URyVD3L+zwIvUCAT6/7ZDhTPpalZAQXiZDFiP29GC5GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR13CA0006.namprd13.prod.outlook.com (2603:10b6:a03:2c0::11)
 by IA1PR12MB7733.namprd12.prod.outlook.com (2603:10b6:208:423::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 06:40:53 +0000
Received: from SJ1PEPF00001CE1.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::af) by SJ0PR13CA0006.outlook.office365.com
 (2603:10b6:a03:2c0::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.22 via Frontend
 Transport; Mon, 13 May 2024 06:40:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE1.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Mon, 13 May 2024 06:40:51 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 13 May
 2024 01:40:51 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 13 May 2024 01:40:50 -0500
To: <buildroot@buildroot.org>
Date: Mon, 13 May 2024 07:40:39 +0100
Message-ID: <20240513064039.2091596-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240513064039.2091596-1-neal.frager@amd.com>
References: <20240513064039.2091596-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE1:EE_|IA1PR12MB7733:EE_
X-MS-Office365-Filtering-Correlation-Id: f2e6a3a7-8210-40ec-ab9f-08dc7317a20d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|376005|36860700004|82310400017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Jib+c/RL4+ZtX0e85JBOU/Dl5HDUfDI/CVvLW64/nTLZ8turUjS/07evCKdp?=
 =?us-ascii?Q?WGPyZToeM8x3Jc2Y/FfsAqsNtcfEeStNPQ0SvWYDjnTy2Xfd1Pz4k9KYylZf?=
 =?us-ascii?Q?DhA82cTZRltxBi8Arm2Mkae5E1NNO7BWiOFpfp8XoGjlYfp4Y44duFroM6NH?=
 =?us-ascii?Q?aBBqxF7CEQ+kDA5Z6ufM1wCqiMAehIp6AgS1IXgDNHW4UM87QLVCuUwcBIfA?=
 =?us-ascii?Q?i+9noupJkhcT7n5nJT+8DLyHb1isTOpGo32nAZPjssqmxXzLBmrnWt16LsSq?=
 =?us-ascii?Q?syyDMnt9zNZgP1gMj2iD0nahQu/6++WdlkXcTcC27fFHjU4X7kXLmYj2LZOo?=
 =?us-ascii?Q?8wzM9QxCg+sbw0cS0chVww0qOuhXB75Vn75H7fWshAUIOdjyeZ8SyMdKiBKM?=
 =?us-ascii?Q?YYYh/ibo7t6+8ynQdU9uTGNo5syjK60zmuZjssRlV6t/xhJDEAEV8zNjOO1d?=
 =?us-ascii?Q?yribiTqWCBcvEF+HTxnh2gvCoFfjasC0kp4lK7S/W1jJjLr+/8+OC9NhJkeQ?=
 =?us-ascii?Q?sQVZ2wi/K6iDyQ83HzijP5Aayhymlfm8NaJRej82+y5KxCDq1tTSrPr8BVeW?=
 =?us-ascii?Q?/qXQHdEjykvjHdx845ltz0bGYrMXgKrZUI7Aqlng3TH1uHX3SeIDjrpg3RP+?=
 =?us-ascii?Q?eAcgUR8i6sVEZcESNg7FHLG/DbYauA6rWQ1VoNOuv/kwIDmlt63knQVTNdB6?=
 =?us-ascii?Q?WEOdZu51TB6SUSaOEcYo+nu30twuBHELTTJBGGN8Hg2iA3saItBXYUUk8l4P?=
 =?us-ascii?Q?hkgYG9Di+vKrtuLdEPwqupy1ZPNoUymc4s5vN8Rs1wx1HYBCQef6iKp2GHBz?=
 =?us-ascii?Q?FQB5TyUCSeO5TW8ipcKgm/UTLH5cDe3buH/ewD8bD7OMuq4MU38+KBallEXH?=
 =?us-ascii?Q?RDW6cNT2zOeIjy4/S0SS/6DvMTRawix+9XEGGMpOng0gjUx0Pv9JbxzoGnXZ?=
 =?us-ascii?Q?OiVlQy9nMSt8aDHUnv6Oi4okabJ+mEOrmObGOZjPsiMtlNb284DvZp32q20+?=
 =?us-ascii?Q?pgdWmVpTTpQT3JKMGcY3Z9010mu3UenRAKZIjNSzQ2phD4FOJv0si9ETMNW2?=
 =?us-ascii?Q?+PDrfs39BeKVOqloBCqTvyrBdthLddwX/AAg1DRl65wKaQurBVZX0DJiTq9L?=
 =?us-ascii?Q?32HLz5HIA6LTLF+D4vTyogqxClVqCDJOxqqaLymtLkkDsCF9RZ5ZwOVgnOEk?=
 =?us-ascii?Q?mfyreqeUUYJtYALGBYFChuJxmT7v7qIZ4NjYUJLj8F87DvnHzeaftU39hthg?=
 =?us-ascii?Q?TGR7Dx+0XIAruj4MNpGLdCJH8BXWK5+hVj09XgCSA0Vlqa9RfJwc1Q/zl0k7?=
 =?us-ascii?Q?46R2/LXq/ceHus5NHfdpp1lM?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 06:40:51.8921 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2e6a3a7-8210-40ec-ab9f-08dc7317a20d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7733
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9OPTyS/62qH+6vF7siyalTQUYdnEgLk1mDUSSYFQdw=;
 b=GL39Jrdtya0NgGN7WC9D9Hz/Sc8XvsxNpf0AQj4KzPNBln7Lb5zDIkjicgofLEYcjNZ39p3JmIqd4doSdC2ud4+uSWCVG2KZ2apQwi99mY12v3zWnXPYjOYoRtN4qtvHH4WGHlig+rSJaGye2Tp+1WlYUe7jRF0qxOn6tKGp5RE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=GL39Jrdt
Subject: [Buildroot] [PATCH v1 2/2] package/gcc-bare-metal: bump to gcc
 14.1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See here for changes:
https://gcc.gnu.org/gcc-14/changes.html

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 package/gcc-bare-metal/13.2.0            | 1 -
 package/gcc-bare-metal/14.1.0            | 1 +
 package/gcc-bare-metal/gcc-bare-metal.mk | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 delete mode 120000 package/gcc-bare-metal/13.2.0
 create mode 120000 package/gcc-bare-metal/14.1.0

diff --git a/package/gcc-bare-metal/13.2.0 b/package/gcc-bare-metal/13.2.0
deleted file mode 120000
index b7a75dc7dd..0000000000
--- a/package/gcc-bare-metal/13.2.0
+++ /dev/null
@@ -1 +0,0 @@
-../gcc/13.2.0/
\ No newline at end of file
diff --git a/package/gcc-bare-metal/14.1.0 b/package/gcc-bare-metal/14.1.0
new file mode 120000
index 0000000000..e519bfb6fd
--- /dev/null
+++ b/package/gcc-bare-metal/14.1.0
@@ -0,0 +1 @@
+../gcc/14.1.0/
\ No newline at end of file
diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
index 0dfc8d7a5c..2f36b49125 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.mk
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOST_GCC_BARE_METAL_VERSION = 13.2.0
+HOST_GCC_BARE_METAL_VERSION = 14.1.0
 HOST_GCC_BARE_METAL_SITE = \
 	https://ftp.gnu.org/gnu/gcc/gcc-$(HOST_GCC_BARE_METAL_VERSION)
 HOST_GCC_BARE_METAL_SOURCE = gcc-$(HOST_GCC_BARE_METAL_VERSION).tar.xz
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
