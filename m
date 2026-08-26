Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC3DC61DBD
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 06:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AE8E40550;
	Wed, 26 Aug 2026 06:47:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2a_6OElg3u7K; Wed, 26 Aug 2026 06:47:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787726841;
	bh=LVO3j084lM8jdVRKZ1+HQXYylZ4s8INuudt3gG15NEk=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=etYuG3zWHhUdp7SLrm9UqTEuvi0fELzz8F2EreB/pBq2E/Lqe1Yipn9IFrt42i81F
	 2hcbaXhxEKpKqXGxIphmT0vxSqJ2vJRr/9fNCH9OBH2EQoVjRqop3yG2asSnJKZ2yL
	 XYhx2EsTumkNwouNps2DBp4Uug+FLtq+cHLBAwq38NwsufrRvNhxOupg4HYtybEF6H
	 cxTmqr9RpmECipzgwDWInbMob6xRTg02pJP6esdlLC4dmdvMR2AiAgLe6E7JTLv3zN
	 d2nVux0fPRj05PUcPD9FIwE4uqGyvRmlTpw7ki/O1xA4aPhAS/y2tdLvvFgAzGcUJC
	 qSOpIXKPx1Qgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17C2740555;
	Wed, 26 Aug 2026 06:47:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9941439E
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 06:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B7B580B9C
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 06:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MF0qaC60w_uG for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 06:47:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c000::1;
 helo=byapr05cu005.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c000::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E59B80AE6
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 06:47:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RwA2YFtFQj9VtgdsP06AbuJKz8+YjTP6eWZfFOQ3oW+oComFNe7+N+iRK6c6AX6WDk8Ny72IJ3XmKydDJhg2rlAPVv3t7Nr44OUwEN8zsCauLmi919Fig2jz/Mrsj8um3Fc83p3Yv9DgJQA7K2zHE8wfjESgV8IeNMYTjFLJk1yl5WNlW5EW8yogCoxa27XyWeRt86D1EfhzyInlc87okFbPz1n/ThWOO2d/9RGMl50Z4HD3mUUUB5Gjtlu2Xf5rpRaG0nDvjz4KhTWPWqUF1Sm6tm+KrjuIZWhW8p78oTRLjtv5tnfukNzgj607rjasDpzkg27tdOixhX6IhL8kHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ec0UojxbVfSb4i3WQjv2uy140PjJ7fpMYNYsU9/EskQ=;
 b=QQi8SbJmhoEGrmQ/trk9C+580FkyO8AHg1uoXeUS9K/sUMwUQYVWycIPMvRF8ADp6zBxvKVaLN+333PN3O0B7ELNJm5hgxzsLQfJ1gNcq3yO8k/fAJSnqN7iO/C/NkX86Gn6U5Hogv3IRICu1lVFu8MLRhVaFIJb9D7cRbqaz3Isi1AZ6Ogf+S+ajbOuPc7suzR+u2+EdOdlH5yLzlQuPl8D1Gly6mhZt+u/TTl0wcrzTPGvVLvLQFFpwZeaoD3Ao8es61l5Acio1+W5P2OSvwmDfOs+8V0r5sHRJkaQPqHnR0xZ8AY9Q737hHlbDl5IzqG6EKpa2/KPorLTRya2vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN0PR04CA0039.namprd04.prod.outlook.com (2603:10b6:408:e8::14)
 by BY5PR12MB4113.namprd12.prod.outlook.com (2603:10b6:a03:207::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 06:47:11 +0000
Received: from BN6PEPF00000071.namprd03.prod.outlook.com
 (2603:10b6:408:e8:cafe::6e) by BN0PR04CA0039.outlook.office365.com
 (2603:10b6:408:e8::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.7 via Frontend Transport; Wed, 26
 Aug 2026 06:47:11 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb07.amd.com (149.199.90.133) by
 BN6PEPF00000071.mail.protection.outlook.com (10.167.248.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 06:47:10 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 01:47:03 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Wed, 26 Aug 2026 01:47:01 -0500
To: <buildroot@buildroot.org>
Date: Wed, 26 Aug 2026 07:46:47 +0100
Message-ID: <20260826064649.292291-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260826064649.292291-1-neal.frager@amd.com>
References: <20260826064649.292291-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF00000071:EE_|BY5PR12MB4113:EE_
X-MS-Office365-Filtering-Correlation-Id: 36fe48e7-bf65-4d21-e44f-08df033ddad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|23010399003|7416014|376014|36860700016|13003099007|10067099003|56012099006|11063799006|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info: rUnKphkeEsa5veO/o5v2IqPNXo4zeY4ODGP1eL4xu2r1IFD/wi0vvkOpOD7GZx2DcICU5JZWgci3MehnI6ZErPjVNRngzOQgpXFH2eSO3q14nw9T8nyY4NZRu3GdGwj82v+4+s55EkkJ4nMFNnvTmMqVJIRVR1eXUq/lIEv78FdQK22acSSRWJUQS4A0yTq/rocZNoPgfQEoQzjKXPda+aIwMcmueJviy3hgEYNSWgURVw7tswl/BGy+ISEQwsgvXmMQmFc1H1507vqYP4LtQJovg0mo0Kreai8J9fpUlof4ZlefGickfw0QM2fAL0kRX1W7B5PuCyiH3a66nwoGuqHI3uQfb9+pJum3D1jLa2nI3vIeQIGlN7jocJj3p1O9kvD14npVlucGcHsqkithAJzLe9o/BzLYTgbHhfoubs64FexwN+lgJKxOJYnlk/BIS9/JchoHIo1H7dIs6z+l/sLepMhP8sxFl6kW/Nbk9qute5v3JCX43GoBZTR7simFuIzdG7Sm/iukUROJ9u2xGczAZkC47kFL/tUf0MyQ3JZwULejm1ret2LpUEIjmMJyjUE18TlIujTfX+Glmgmg9qHalhq7fgbmJbFSpwOxXZ0ZuHlcXceuhpQdSSO/HpuUzo3vX0y6wi+7avNkgOZvBfFsqk55UX4ZVAGhUCPHEZMQID4EgEA3Rs65aek53nTc1hQbahZC5g8MC+kIwbr8Yw==
X-Forefront-Antispam-Report: CIP:149.199.90.133; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:unknown-90-133.xilinx.com;
 CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(23010399003)(7416014)(376014)(36860700016)(13003099007)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UzVHVpITUBdDdprXkAkRvW8gc8BX4eAZlX/lWUf3eFidFkdennA7iohgkla05LiJWzVapMz4zWDUt68TOE201jexBtk9JVWEC2ZDO6USiv0++B/c06CtbAyFzkxvym6ykvRFLZCWekOeUgCl1RcW/OWcjrfrBCQXrWwVEUPZj1ejCxqZhiSFmiLY8znLDbMr+ijddYTqQOXKWjJCj7ClBNWPe+jPfKOXyTx+jvoA6V1Plfo12DlakNsuk6K2SYaQwT+94x2fkW0FIT9sCYIaKxcmkFFW2BYwHXVJv1DJ1p70zZRTOh8Tiy2M+4z8JoDazgghXzjJr7DFNuzgiEa00qC6ksVP0cySsuwoKECZDPshY0IurQYaOB0PRdJ3ovHUEoa/VzgoDkQg0WFnR0zE7rYq5zC24WH2bpKWiLPN0B9L1/DGjp8a51Utjn1aRa2E
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 06:47:10.7215 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36fe48e7-bf65-4d21-e44f-08df033ddad1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[149.199.90.133];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN6PEPF00000071.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4113
Subject: [Buildroot] [PATCH v5 2/4] package/xen: add custom version support
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
Cc: alistair@alistair23.me, stefano.stabellini@amd.com,
 ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com, micheal.saleab@amd.com,
 yann.morin@orange.com, matthew.l.weber3@boeing.com,
 Matthew Weber <mathew.l.weber3@boeing.com>, brandon.maier@collins.com,
 john.ernberg@actia.se, brian.j.wood2@boeing.com, ju.o@free.fr,
 stewart.hildebrand@amd.com, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add the ability to configure specific Xen versions while leaving the default
version unchanged to avoid breaking any builds already using Xen 4.21.1.

To test:
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_XEN=y
BR2_PACKAGE_XEN_CUSTOM_VERSION=y
BR2_PACKAGE_XEN_CUSTOM_VERSION_VALUE="4.22.0"

Add to package/xen/xen.hash:
sha256  b2a14ca369e3cf26f123a455b1603f3962ae9fcee0b8640a9cc33879de198223  xen-4.22.0.tar.gz

Signed-off-by: Neal Frager <neal.frager@amd.com>
Tested-by: Matthew Weber <mathew.l.weber3@boeing.com>
Prior test details: https://gist.github.com/matthew-l-weber/c17f14a3793ccee440a383e4177ff3db
Reviewed-by: John Ernberg <john.ernberg@actia.se>
Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
V1->V2:
- rebased to updated master branch
- removed the line move of the XEN_SITE definition
V2->V4:
- merged into new patch series as the second patch
V4->V5:
- added custom version test to commit message
---
 package/xen/Config.in | 25 +++++++++++++++++++++++++
 package/xen/xen.mk    |  2 +-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/package/xen/Config.in b/package/xen/Config.in
index d63a3f6002..e50b232f0a 100644
--- a/package/xen/Config.in
+++ b/package/xen/Config.in
@@ -10,6 +10,31 @@ config BR2_PACKAGE_XEN
 
 if BR2_PACKAGE_XEN
 
+choice
+	prompt "Xen Version"
+	help
+	  Select the specific Xen version you want to use
+
+config BR2_PACKAGE_XEN_LATEST_VERSION
+	bool "4.21.1"
+
+config BR2_PACKAGE_XEN_CUSTOM_VERSION
+	bool "Custom version"
+	help
+	  This option allows to use a specific official version
+
+endchoice
+
+config BR2_PACKAGE_XEN_CUSTOM_VERSION_VALUE
+	string "Xen version"
+	depends on BR2_PACKAGE_XEN_CUSTOM_VERSION
+
+config BR2_PACKAGE_XEN_VERSION
+	string
+	default "4.21.1"	if BR2_PACKAGE_XEN_LATEST_VERSION
+	default BR2_PACKAGE_XEN_CUSTOM_VERSION_VALUE \
+				if BR2_PACKAGE_XEN_CUSTOM_VERSION
+
 config BR2_PACKAGE_XEN_HYPERVISOR
 	bool "Xen hypervisor"
 	help
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index bddfdbba38..4e953edeea 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.21.1
+XEN_VERSION = $(call qstrip,$(BR2_PACKAGE_XEN_VERSION))
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
 XEN_SELINUX_MODULES = systemd udev xen
 XEN_LICENSE = GPL-2.0
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
