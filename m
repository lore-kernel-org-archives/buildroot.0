Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AF6E77188
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 10:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FFE941741;
	Fri, 20 Dec 2024 10:35:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8F5gzEBl1XnL; Fri, 20 Dec 2024 10:35:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43D3B41746
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43D3B41746;
	Fri, 20 Dec 2024 10:35:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 68D36730
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 10:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56E6360BC5
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 10:35:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZEaWDNmmjMgX for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 10:35:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::627;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 250D06061E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 250D06061E
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::627])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 250D06061E
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 10:35:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s2yszkwGxzMbz4HLEMIhZBb9DIsdfLe+htoO5FguYkjzIwAt8+ZOTU9U+z7IqtfphcNJWtrQL+GSuwFirR5nN2Wy0A2ZMGtGJ9x5d9zV3HguvFspe7wCFG1ucqA+BYAdOrvExYGMa1WuM3PuhJ5KQBI2PplwMoWh9OeFdUC3QElQCczG2Q3XOGjisF9pXAmVRWyDGNSqIxjBG7koo/BFbt4h3UkFzy50ZkY9idnkYA8DrscwYr5LVRmCCP0f1IbSPpY5ulFP+mFwYOh+ghzN3Y+GJ0I/JcvxVbTcWEuzwo8hZukzijvT0+eswMntK6SMI8NEPVcwTEZr4XAilAFW6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1br3+V/H5g8xxm3HHk9VKaUoxoSJ/c/TA9Qb4hwpF8=;
 b=U/PXt8u/38Fl/bFgI6nuAuTws0n00FEiX2mHHm1Ch4n3opQ3otYiHQZdDiuRieOSQ9++uKw6J9Bms2l9IYzcXGAO5qaC0y7cNrFJJM7/imkcaCGM3yPy+Q2BxeibAnsnFsAQqPqRJPUG2r81GAjkCIQHJr3jaL0W7XcdOyYkzJ7WVPadYeXhLU4izD+Njl/Hbu/2p5JAqGc1Hg1xwLmu7GQiJYuk0EddOGqU5NKyVonNCUwyAik+NlSXJIJVYRK4fNYnkMk1xpLekOrBLuqMjoaNfBYBxT7d65U0+74zZuW6ybTDp7eKdkqRHeSm4LsofP10W5FUi6prxb0cJeOQ7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SN7PR04CA0163.namprd04.prod.outlook.com (2603:10b6:806:125::18)
 by DS7PR12MB6192.namprd12.prod.outlook.com (2603:10b6:8:97::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8272.14; Fri, 20 Dec 2024 10:35:33 +0000
Received: from SA2PEPF00003F62.namprd04.prod.outlook.com
 (2603:10b6:806:125:cafe::5) by SN7PR04CA0163.outlook.office365.com
 (2603:10b6:806:125::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.16 via Frontend Transport; Fri,
 20 Dec 2024 10:35:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F62.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 10:35:32 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Dec
 2024 04:35:32 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Dec
 2024 04:35:31 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 20 Dec 2024 04:35:30 -0600
To: <buildroot@buildroot.org>
Date: Fri, 20 Dec 2024 10:35:17 +0000
Message-ID: <20241220103523.2301721-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F62:EE_|DS7PR12MB6192:EE_
X-MS-Office365-Filtering-Correlation-Id: 770d8d6c-75a0-4d0e-b7f7-08dd20e2080f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qVJLj2sKMai0/QyKlWats3AcCQ1Qztw38cpISdaxL71QbN18Ni3gbkKuHPzq?=
 =?us-ascii?Q?wbsIObaR8ghu/7T2aMEb1JlRSOZS+rupvRWRZfcbY75zpynGoGyHTlqYLLnM?=
 =?us-ascii?Q?MfFjsbXYLdax2bRFBTS5o5BOHfeSmABwrvETdoPYOMz1IwABNX4a3pQnq/7f?=
 =?us-ascii?Q?1TtdlSUgIpdrLtot6Ss6RZh7+y3SWoZYBU9L7kP0CIw7imVls3h12HsfYKJr?=
 =?us-ascii?Q?m7EjncFiEi3aZoIHsL2qJBVVVEvmApDhcfMUPbv7TGw8MZrw2ipLk5fDpN/C?=
 =?us-ascii?Q?+PXONVh8X4/Q9MCsfJdwD26q0LuN3LU+gVuYLGDH+qUqJyFmBz4/n8XcJbyG?=
 =?us-ascii?Q?vgzHmj/3j6wHarUkVuuuYCXRlJ5o3wVKeBph2mbLBhJew9guVPB88dQyxKB2?=
 =?us-ascii?Q?ZhJ/FlQYZ79Yy6C70eUNElv7BzuKaLanzGlNPsTH3pVivZmvahOTDPWi6At8?=
 =?us-ascii?Q?Qzq8ujqOPp68/iVSoLhXXfuYy8fmTObSQ+y6tDgEnGSUucCEhsYR2AnvqYvG?=
 =?us-ascii?Q?Y1xO7xC1xQOW//LI1TC8JaeUzLx9cQZ+TIQLbwc49g1wFMVmX1gXuh2eTkJb?=
 =?us-ascii?Q?54M84GKH8lkXxf0QjlJaN2d0QQGwm3Qo5BesHhy+iZtPDvF1HY1DdJRxHS2J?=
 =?us-ascii?Q?fNxbprr1arr+pAmZmJAAPjwSawI1ox9bflKxF4zGy4trWCmce3GaM3YoJ/Q2?=
 =?us-ascii?Q?AURa++1osw/Cv/PX8YJIC5Nq/mqtuE7zyoJmKeFu/OTQhcaBMQDxe/AZpYBA?=
 =?us-ascii?Q?iTZuD0617MIkJWEggtss4pdBnHVD34k8hLI5n9fN1MYUowux00Xh3DR/68ZU?=
 =?us-ascii?Q?HiNtz3fooWpPTpd3niuBpVNHL/uV0YSspPl1KDlc7kgcj+xY5qXWG4c53LJs?=
 =?us-ascii?Q?SK8ZFKT7ZAVnJwXa8tLaLnxLbiuCatVOTqFDby/0j9qTDf9YJGAamAoqoq0t?=
 =?us-ascii?Q?6R4vY7vzrADmQXDKdL4n5DHuPvjP0gAse8MArY9gt7VRxDfIllxCYks2TnUz?=
 =?us-ascii?Q?RXvo+TeR/u5AuKzBO5nO517ibR+lOa1znrdPCjyYTFsGfvpzxLhFFsL4wSIA?=
 =?us-ascii?Q?Z4oNbPXIhWq/h0/HKOzKX5LVfVTmdEOzoiL/iVrX6F5jbpYATAyXnzjBVt9i?=
 =?us-ascii?Q?kGCmionW/ngjeZ50Hg8WhfK8TzHhB7cdXEP1EauSmIHV42SvDYZPO4S6whsS?=
 =?us-ascii?Q?92jjVO6MVY0UTn2+qMgD8JJQcPwXIaXG9BrPYPPq7l5uPkHPas1qIzyYqIz8?=
 =?us-ascii?Q?uFiqO9xxf8cSAIbwglhWsMH9STk4MU/VFzO2A+OAxYeDCbI1VcRp9GlLvLBe?=
 =?us-ascii?Q?Zcw+yWP4735JIrWdCGgKzZ3Ddxs8yyoLgVmZ5WGGaHH0Juqn3/qm1nZkdfOK?=
 =?us-ascii?Q?pPezwrkJYu31D/s6/yd5gz2c9/YIArrLxGWRiCnA8XZHOmB60Drxhz+3FygX?=
 =?us-ascii?Q?pyEBVmLg2I8mWmYlUW0i1PlFHBSBlyE858e26oJI2NbHzqrH9FRuu93gDMOR?=
 =?us-ascii?Q?px48CaG+TCwuEPvgQXbpf8Gny/GQryFxh+T0?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 10:35:32.5642 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 770d8d6c-75a0-4d0e-b7f7-08dd20e2080f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6192
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1br3+V/H5g8xxm3HHk9VKaUoxoSJ/c/TA9Qb4hwpF8=;
 b=Eb++Q/pVwYJUXlJLh66F/tH/PP4MGM45TvVXzRhB/mFKJLN55m63IvsBFqq+rmlhsmEHFXHzvW3BDUbBYxbVa8L72pXq6Htf6HH1V45bjHMEuCs2yWPl9mm8TdlAHPFifx6gFLxYqIsF0os37CGl3ZlwNP7wTi7ig37fnm7v8pw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Eb++Q/pV
Subject: [Buildroot] [PATCH v2 1/7] boot/uboot: binman generates u-boot.itb
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
 romain.naour@smile.fr, michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When using binman to generate u-boot images, there will no longer be a make
rule for generating files produced by binman.  However, these files will still
need to be installed to the output/images directory.

One such file is the u-boot.itb.  If the u-boot.itb is generated by binman,
then the file still needs to be copied, but without the make rule.

Here is an example of how binman generates the u-boot.itb:
https://github.com/u-boot/u-boot/commit/a4c98119109a60b9b236996f47065aa8fc0de9ca

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
 - no changes
---
 boot/uboot/uboot.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index d8faef648f..fd0323bb71 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -103,8 +103,10 @@ endif
 
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_ITB),y)
 UBOOT_BINS += u-boot.itb
+ifneq ($(BR2_TARGET_UBOOT_USE_BINMAN),y)
 UBOOT_MAKE_TARGET += u-boot.itb
 endif
+endif
 
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMX),y)
 UBOOT_BINS += u-boot.imx
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
