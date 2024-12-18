Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633E2E77187
	for <buildroot@archiver.kernel.org>; Wed, 18 Dec 2024 06:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1945E606EE;
	Wed, 18 Dec 2024 06:52:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UqJWXRyZ2zJu; Wed, 18 Dec 2024 06:52:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B41A61346
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B41A61346;
	Wed, 18 Dec 2024 06:52:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 09D84E3
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 06:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC73761346
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 06:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iiamckd6Fqcu for <buildroot@buildroot.org>;
 Wed, 18 Dec 2024 06:52:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::627;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 91D39606EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91D39606EE
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::627])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 91D39606EE
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 06:52:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=enQ65gxJqKkaTuVgLyhB0B9q1ORtGXaC9QNthcF3UtSM4a88zR6RL1+xutsdzNjLSnGTSwRv5JDqqS8zHj5VhraEfFKAxEY/TVlXZFDhvAS0cs3quGoJgTlmMzG516pCaareLmsDZyEiCmkjMVce7OFUunQnLPoIEYEfv0fI49nEXpWH0TL9NKtYWbwNux1D7gqmCGwXyTBgTQVabSTN2osemhKHpNH15K5YhBtqKH+JvgQnyY+yt2gqt5ui8GbOYd0wJ70yxZFt5Rh2ik75QH5NU+rSo8MFKKubtjMknUihhX+Jf7Lkau0Nl0W4pDlypYq3kjXgQfidxXn76GjZzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+7kN000D7q0VadWrteG5mEMqfbd5o4lOt3z3vqK+pY=;
 b=iZfO1XffoWWEYU+5pilAZBClYrGlvjeaoxxjtPckK//yrGTa7fPx9YDWCxh5VLlOyKRMGntcGEEeCRtdQgnDbnpUknBjvFJKNk4osaunwZmfGDXTjuWraLBhGkcF8YWzi6v0SZh3KtNMqI8eX4pmSHF6KBWVkmRbtNQiHbueN5UmEpxPJNtyog7G5RfVJTYHENjcuXdcpYSr8mTioqlOnaxstw5oDw9t30FwHrQ4CjBZWRz76stHkjGQto9rtt2WwbYzHSi+Y9GlSh2bK4C1OCXjFz+HCaxNIHFYisvS0F+y6lb4IxWOA+eO00P+aivqmn2Ghebz49jA5i7x0W0H8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SN6PR05CA0033.namprd05.prod.outlook.com (2603:10b6:805:de::46)
 by DS7PR12MB6165.namprd12.prod.outlook.com (2603:10b6:8:9a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 06:52:48 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:805:de:cafe::3) by SN6PR05CA0033.outlook.office365.com
 (2603:10b6:805:de::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.8 via Frontend Transport; Wed,
 18 Dec 2024 06:52:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Wed, 18 Dec 2024 06:52:46 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Dec
 2024 00:52:46 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 18 Dec 2024 00:52:44 -0600
To: <buildroot@buildroot.org>
Date: Wed, 18 Dec 2024 06:52:39 +0000
Message-ID: <20241218065239.503162-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241218065239.503162-1-neal.frager@amd.com>
References: <20241218065239.503162-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|DS7PR12MB6165:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fa8813d-0b76-4695-ecec-08dd1f309493
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jFtJyhdXClNo2PuW3jvIAHQHvdepIiHXVjE8JjU7TBBC7wOhmLNRiWgLkrV/?=
 =?us-ascii?Q?74P+mC+e1X7YZ34vkNGKUkAN9iVEShAgC29ABO3LXcOUO3d99SbVlbCDoPBf?=
 =?us-ascii?Q?e0YepZsmy3MT9yqlI7rgAZrwGPVFR0UUIhge6d8unqwFkPn1pwWT3ZGQ+jjD?=
 =?us-ascii?Q?uqefOZdNd9+7pns4rVnuN8mMd1BqINFZZNqqllRR5Q38DSsDokYNP+qTXmY2?=
 =?us-ascii?Q?WOdtpW3/wUpkSVauW/KLvVOG1bAG7YxSJlBtmui3EL7INxLSOt2Ue+3khKwv?=
 =?us-ascii?Q?SJpg71JBRF1hTd9+U49NPQmZ2kw5yrbOzTogX+A0v27EFA9AgJG2wYyBb40q?=
 =?us-ascii?Q?V1GnYXjDXPsneDHUr00x/EhAvse5fcs+VCSpaoTbfsZNeHN4kLOgbhhH5M0p?=
 =?us-ascii?Q?LQgjlf4QW5cKg8dIT6XFF2udveMHO/uqyG3aaLGkynci7OT07PwU8lg3sItL?=
 =?us-ascii?Q?4E5qdXpWjl/qJQwwMaF58Lxmqp5Z/jClj0oJYiEk/CuLMbHH5xvSYlxNaIlu?=
 =?us-ascii?Q?8nE/cvSC/chPKNB4vvBPJVkpPFjERTSgT13Ig6wKK+JJ981D/12v9lm+GnKe?=
 =?us-ascii?Q?XkX70guYzS5VX72+k7I/IVAe8NFSY9PE+LNWRcen56ndbcmU1nMy2egiPNkA?=
 =?us-ascii?Q?t0kJJfWIhWmtLxn65T1KkT1BEHZQ+6jWbKj5z5Ar+enEXxZ1O6AXQznUEHR0?=
 =?us-ascii?Q?+Qv7WW7oHK/bAXdlX0abkn0FDiMtQMX0+lEOwAgm47sNA2hbsaFckTLI8Dyg?=
 =?us-ascii?Q?+vzEw89wgr0kSy+F1SGo3FcTemlvSkWcq0EMSTWgGpX1CtoyateMECtmE113?=
 =?us-ascii?Q?zc16c+eC8KzqEHeCl/C3D/HW8Sx2yMLbkr6HEp2oz1Cr/fQbA6RkhkarltvA?=
 =?us-ascii?Q?JhE4erglEP4SwRGgPadE4lTDmr+l2s6UYKO+2ib5scsRL9+ZNIORxgptulPC?=
 =?us-ascii?Q?MR5NhQYk2jSQCamST+1ffB6ph7s7uWxz/KODlA8mQTeWT66CPHDIu7GvO3zI?=
 =?us-ascii?Q?+xmm7CphI4dxuCNq09Ko39iziZaKpiIxMeK0dIoMCUar1D86ELO0/KrFCvxh?=
 =?us-ascii?Q?YWeC5iE5LURtpFa3xGTaej+59zrN0Apm5pmATgPrunq8FhsyHMJIxaS4vPj/?=
 =?us-ascii?Q?imop5MC0PDolxaqFDMB02yoZwf+xfKLwwWNh+5CQkCU/Hq2PGaWJH40k9Ckb?=
 =?us-ascii?Q?vRceUsyF3YEhczHwm1xdvkL6vs3f6AVx+PkopxcwZHyjjcXsf/laxfGWgiA/?=
 =?us-ascii?Q?6EgC0Cstp3nXU5UK+X3b1B4ns3G6cJqzRstAt0JNG64O8gpsS4ZRnM8JjZBy?=
 =?us-ascii?Q?B8ZYYZkBUfnO+Wa/fbclF+eqh55wol9d39xrJc8T6DGEttR+L75gZXkscw6z?=
 =?us-ascii?Q?96oaRkTvqURAmEjX4u70/gIyG/v6AZwRWtjpJug8LAIMXyTFxaxWjE9BQ4a1?=
 =?us-ascii?Q?R+Ime3Az4vQ9xOeIF8ilX6JgZGXH1eFXMuVt9Gfq5QYZxVBGl7nwKFIowJZq?=
 =?us-ascii?Q?aiv1KY822lSVyKw3Fsulz3y+MhKVLvyVczSC5JS7OES2ak+hU0/SM411WQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 06:52:46.7310 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa8813d-0b76-4695-ecec-08dd1f309493
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6165
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+7kN000D7q0VadWrteG5mEMqfbd5o4lOt3z3vqK+pY=;
 b=onSW5FwLF4uHCrnsLuhSUeg82pxlxcNQF/DmyT1z9Stva6GSEpw5p2G3yfcos9NGZtR26GARxb/wErXZ/DwhWA7CGrkfdF1pPMlU3qeyo7LRiGQn+j7/4x7hbXUhaXu23rq24oXJXJrLKkfx1bt1ne8bHFeAMvVJ2lwE+cU8B5c=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=onSW5FwL
Subject: [Buildroot] [PATCH v1 2/2] boot/uboot: add qspi.bin file support
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

u-boot has introduced a new file called qspi.bin for users who boot from a
qspi flash device.  It combines the spl/boot.bin and u-boot.itb files into a
single binary that can be written to the qspi flash.

Here is an example of how binman generates the qspi.bin:
https://github.com/u-boot/u-boot/commit/a4c98119109a60b9b236996f47065aa8fc0de9ca

This patch adds the necessary support for buildroot to install this binary.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 boot/uboot/Config.in | 7 +++++++
 boot/uboot/uboot.mk  | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 8648d6eb7e..9a35d29dc4 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -446,6 +446,13 @@ config BR2_TARGET_UBOOT_FORMAT_SD
 
 	  See doc/README.mxs (or doc/README.mx28_common before 2013.07)
 
+config BR2_TARGET_UBOOT_FORMAT_QSPI
+	bool "qspi.bin"
+	help
+	  When booting from qspi flash, u-boot can generate a single
+	  file for flashing by combining the spl/boot.bin and u-boot.itb
+	  files into a unified binary.
+
 config BR2_TARGET_UBOOT_FORMAT_STM32
 	bool "u-boot.stm32"
 	depends on BR2_arm
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index fd0323bb71..d7cde420ff 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -108,6 +108,10 @@ UBOOT_MAKE_TARGET += u-boot.itb
 endif
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_QSPI),y)
+UBOOT_BINS += qspi.bin
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMX),y)
 UBOOT_BINS += u-boot.imx
 UBOOT_MAKE_TARGET += u-boot.imx
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
