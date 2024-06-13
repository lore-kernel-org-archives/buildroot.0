Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096E6C27C6E
	for <buildroot@archiver.kernel.org>; Thu, 13 Jun 2024 06:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3B8460B50;
	Thu, 13 Jun 2024 06:15:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8CfJMPU6NH4B; Thu, 13 Jun 2024 06:15:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7258560EC4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7258560EC4;
	Thu, 13 Jun 2024 06:15:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B3BD1BF966
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 06:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 920D181E35
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 06:15:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s0MwNOIaK2cT for <buildroot@lists.busybox.net>;
 Thu, 13 Jun 2024 06:15:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::60e;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B807381E39
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B807381E39
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::60e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B807381E39
 for <buildroot@buildroot.org>; Thu, 13 Jun 2024 06:15:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLTELah7T1aSoqPS/YK2qnNDzGkwMx/Ku5A8m8OnHArZ26kzIRjJXLaX9KD+bix5YQUX5e6qYLzBX1vmR0vuI1D+RHthfUU/jb4vg2OE5jwBln6ipULU993Eww0yFqO4TEstFcJxnIo/Q/4I5ot5n+CquASXcD2S47WrQx3zn2pYTMiFnx+XGVdaNI3fff/agi65ThYyr/lMmGOfWEHiB1SwHqRdhTAhiPa0ULJwWWlHF2nQEBnboA700Lofoyc6OV3svsXJeHrBBP7GluIeZjFVSsMVz33czl5TBDjXjMOmxZlugW3f+7g+fwXrIxaVnVj+GjUzYd2fORB0zjW7aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BjIY+XehiQ9VVyJzsoclQZ0vfhBCw0lxDNV/SQjKWLs=;
 b=eLDeGXd+xelDweokhhfI1A+RorMqsQJy8CD0Z5/vv01qJKuVtSxV9Y9ZEnY+BLb4u70B5i2NDVVoxz8lYuziVHCzxQq00VZ5+ZrjRPQTLfmLCoWNSPeXcdRCrI5CwjZHZAHP3DpmaLZCpjl3MfN1J5ZiGXj/dIKHa5jF+/gJdx3kI/JnWAUglUYFZJ0lDK1JQgp/GPcOrVmRkLuwvl5PgLSH0jXmd10ijnDCaSnAXXPPE0KBXjGvrwB1VV0jegqLdhKZ3oKQa4iUfCNuMz2GcK7u97GSdwDm/Pwvdb2tNP8xwUgjiq6DBVVuRPOq3rFnt36OwDi0/8IetaV0jL4mPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MN2PR05CA0022.namprd05.prod.outlook.com (2603:10b6:208:c0::35)
 by PH7PR12MB6417.namprd12.prod.outlook.com (2603:10b6:510:1ff::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Thu, 13 Jun
 2024 06:15:00 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:208:c0:cafe::aa) by MN2PR05CA0022.outlook.office365.com
 (2603:10b6:208:c0::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24 via Frontend
 Transport; Thu, 13 Jun 2024 06:14:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.0 via Frontend Transport; Thu, 13 Jun 2024 06:14:58 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Jun
 2024 01:14:57 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Jun
 2024 01:14:57 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 13 Jun 2024 01:14:55 -0500
To: <buildroot@buildroot.org>
Date: Thu, 13 Jun 2024 07:14:22 +0100
Message-ID: <20240613061423.1737631-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613061423.1737631-1-neal.frager@amd.com>
References: <20240613061423.1737631-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|PH7PR12MB6417:EE_
X-MS-Office365-Filtering-Correlation-Id: 85dfc667-8f0b-45a2-1728-08dc8b702700
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230034|376008|1800799018|82310400020|36860700007|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Aw2R+MwV2ywmjvaqiGpeYJKxcjtLPNk8ZkziAR0aJua6cIRAY1P1nRjZJSew?=
 =?us-ascii?Q?LCQAQn6GswrgarLe3rVpH7cUFSiiqMU6Tff8uZxWYFhYJWamX2l5fu2hLZQV?=
 =?us-ascii?Q?o5xsgQ1QijyI8l5KAEwcOiO+oZI79R3NHdK7hPHwxxJRr8QxQjquEjmKGQYJ?=
 =?us-ascii?Q?cVj9kyQRiXWkkk+bFgehTvLIDWCLyg1W6MPkNCgLMslqEei8tQwxtuGHYglb?=
 =?us-ascii?Q?YMAdOQHq4DT0R2CBZMoAlj0cwKW+VCBRK2fnwsxcqaBy0z4bWghLYLvPDS9X?=
 =?us-ascii?Q?/5/nTJ7pycWSPgdDS1IlOLi0DcXCobq01c26+05GKpOXCfPAEN8zUOElauAC?=
 =?us-ascii?Q?ktDVgAtTUeOrWgkU/3MtLxxbqRubCQcd6lWVnAE99h7fnDWqhiLPvPtWEb4c?=
 =?us-ascii?Q?kNAaofIJkfmEIwu6uXQPk1LBn2JdnBTfP8bD6GJl+fF4aiFtlMT1eCXS1uUA?=
 =?us-ascii?Q?Zso8ECllEeU8Sy0ZmZCK8XROwqDQBdzNl/5303uPwNI2aqRQ02BuSlaoYj2F?=
 =?us-ascii?Q?NFy6j9l1KdKfOXHTSoAXHNQjdTmeytlLII1zsXAUIMN6oGwrX26wmtpyifjo?=
 =?us-ascii?Q?s7oPpYDXjgeIO+qsjZzBYQVXVyXr7SFT6OCEfYyu/IUSkmEiCm9mC7NaRzoV?=
 =?us-ascii?Q?3C0fmy4o3sluts8E/rwr5y7t1qQ0K1vCuIC0kCOOFgwDS3ozxamuSjJ4anJ6?=
 =?us-ascii?Q?+kBD8ZDkU4V2MNXYUsVd4/kYvRvm01aCLQuuyYPpNpBLmeLQmr0eal4Vce6f?=
 =?us-ascii?Q?EffIr1UFtMEF83/83FdnzWzJMitFGm9WWVuJtuJIIfak+eKHh1RW6DH2p3aa?=
 =?us-ascii?Q?JDkTAY1o0aC9gwZf+xm9CVJS/b0XjP9oxZlRziUETUs8q11j2aO2WD2j9v/L?=
 =?us-ascii?Q?RWHINaaZlsR+RJDV/jX/IxtldGXO6YA+IAUMGzMf9zZjzh7fh2O7juWl2vJY?=
 =?us-ascii?Q?+1/VD5GYDcIH7Y0ouxc8rg6iTB/gmlmiHJ+k7hPj7vRWfSmY/ophOa1++u4Z?=
 =?us-ascii?Q?o3Fr9bjKTYwBVOZZHws930hNuNwvoid8pBh6GmKfQDWjiJUIqywzBNgMueNS?=
 =?us-ascii?Q?npEJI+fRl8CejEpiSWva7n+poM4ZZTWC2BnoQFQtwT+GhDx4PGnT1BLhHR1P?=
 =?us-ascii?Q?wcIVFd4A4G4ZyQJEd7zhJTy5A3TEgT8p1zjX7j3uVzyxytNEkOp+5xPichDw?=
 =?us-ascii?Q?MpFC+tbx7qi5IGuzhcriKHd9rLc2R9xJjrJ5SjsMTQ/T6FxyPQwOI2fEKSQl?=
 =?us-ascii?Q?0oIZwDfSqlUqYThtL5DJGvguuJY+05ZvVcGqi1s6GPqibhddpSsVk9rRDzyE?=
 =?us-ascii?Q?SNkGrUlMZOqf7dTnS/HspEWEQnISYLek/GickYq8FylAcWACCpU69bO1VLwi?=
 =?us-ascii?Q?n/Lb1DStS0nWVxhwM/SDfkLCcZV+5pLdOqJYdS61jdVPjh+lqYHwMhNDa3sa?=
 =?us-ascii?Q?1lW7wUkCdBmarr6/k+7uaSYP/zjpN68r?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230034)(376008)(1800799018)(82310400020)(36860700007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 06:14:58.4183 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85dfc667-8f0b-45a2-1728-08dc8b702700
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6417
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BjIY+XehiQ9VVyJzsoclQZ0vfhBCw0lxDNV/SQjKWLs=;
 b=366k6EY01Dq3cZ4gNkFl+vbdKcu4maIW8nPh9ehJGBKzWEmi8LlzKo3s656GlL6HZ035jtnejqPqCUcMPxlESXsXkSRhdu/5qOMGVYoCv6mDK4+CBp26CgSSROqVbmPSQ8MyN08+co56DMA/b4Jun3Z7fHoQIwbywsjkhT9alrc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=366k6EY0
Subject: [Buildroot] [PATCH v2 4/5] configs/versal_vck190_defconfig: migrate
 to xilinx-prebuilt
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
 brandon.maier@collins.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate versal_vck190_defconfig to xilinx-prebuilt.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- no changes
---
 configs/versal_vck190_defconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 69272e721c..ef5c0a4929 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -32,9 +32,10 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_FORMAT_DTB=y
-BR2_PACKAGE_VERSAL_FIRMWARE=y
-BR2_PACKAGE_VERSAL_FIRMWARE_VERSION="xilinx_v2024.1"
-BR2_PACKAGE_VERSAL_FIRMWARE_BOARD="vck190"
+BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
+BR2_TARGET_XILINX_PREBUILT_BOARD="vck190"
+BR2_TARGET_XILINX_PREBUILT_VERSAL=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
