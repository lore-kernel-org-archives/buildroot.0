Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE77CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 05:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10BC5608D1;
	Thu, 14 Aug 2025 05:26:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mADrOZIs2vn4; Thu, 14 Aug 2025 05:26:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33BE6608C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33BE6608C9;
	Thu, 14 Aug 2025 05:26:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E125D1BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 05:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D27B840A6B
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 05:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OhmYS-tCtk4v for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 05:26:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::615;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2287640A3F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2287640A3F
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::615])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2287640A3F
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 05:26:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OrsFwBelz6zYnytJf5l8nCD7PVnp9cmlWjUJ8UZPHYin8fllTK6vcfjL1+OO3JqYlBRrMJ5gYOPSiLEhshLuFBt00eah72di7mx9C0jSoH6r+EHJ2BVo5Ecqyj0nRH0N9+ihigYeFaHQae0d2nazEpLQ00C1R1BuLL8DZ9JD+nqhkPubpPuA3X2m0xHqCm3OmYJhCDmp0gBVXvgQ1X/j92kGxaOv+STbRKzayQRewvEZqmoDpCdnySr1czAAMyE9NRbiI3EdHKEQ4gHk3admDgw6I1/2/lEvYDZfglCr6O76cMxeOtPwJ4WvSj5CopkSmMESMoQ7wW5oXjJ/M+BrzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+FvLhKnNSdKxRypZ3vQnBktcpjV7Pi7DBOdTUfkhMs=;
 b=n5WIbP+/15dYdsRgWqs3kLPGkJyKqtlOEuOopRim6+N3XCST7zsm9pQIYyRFs4iuHS70qkcHRhDVMbMEoqpUTtup5nnzsT5Wm9NrZWBG8jAiz4fnwxUFhym1VplnJdUSqIO0nlwwkJDnZnbu1UXDu1T3hAFu1nifDFru9+tJtBRkCHIgXIL2tb+f1+VrXIaUXIucCV/0Uqjf/mh52UdSnLkTl1WqYNCuXZ+eyS/g60gsIZ+1FPthcERB8oe/0ed8VTjM9eZQ4O0Xu1N04LCcTyhN47n0wX/wcQVZrV5BQLF/TqhmE9JKshluabLj468pJDkR+SusdYFyA7WP+HZbMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN9PR03CA0213.namprd03.prod.outlook.com (2603:10b6:408:f8::8)
 by DM4PR12MB6256.namprd12.prod.outlook.com (2603:10b6:8:a3::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.13; Thu, 14 Aug 2025 05:26:40 +0000
Received: from BL6PEPF00022574.namprd02.prod.outlook.com
 (2603:10b6:408:f8:cafe::78) by BN9PR03CA0213.outlook.office365.com
 (2603:10b6:408:f8::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.16 via Frontend Transport; Thu,
 14 Aug 2025 05:26:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022574.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Thu, 14 Aug 2025 05:26:39 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 00:26:38 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 13 Aug
 2025 22:26:38 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 14 Aug 2025 00:26:37 -0500
To: <buildroot@buildroot.org>
Date: Thu, 14 Aug 2025 06:26:27 +0100
Message-ID: <20250814052631.3412836-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022574:EE_|DM4PR12MB6256:EE_
X-MS-Office365-Filtering-Correlation-Id: daeeec96-4993-4c93-4a83-08dddaf3251d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|7416014|82310400026|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DgnmsmOtdLrUn5Ki8EGbXpZc3gYMRCXOpkSUPlNVd9hnB15vs1D5Ir23SXav?=
 =?us-ascii?Q?ugp7Rzl1HFYzJBSQ6nrwB6gMZrS+IOVP+liUnMzqnr51X71gqjRhO3J0uaFX?=
 =?us-ascii?Q?XeaJdhLE+13msn9f3FFFDjb4XATXyE/pbBnaIn8xABwvkgbbldZKCIQtg85+?=
 =?us-ascii?Q?YEQU1lPLiNkJA7HM/LGKJRQzCaRbpgOD56TzfdCG8T8xFeGU+7JDU5DHjUUp?=
 =?us-ascii?Q?GW0pbiFfTd4vYO0Fio34MjO5tKbM8MiWIFAcXSak4ZqjtJukISWqpzuSpKEU?=
 =?us-ascii?Q?Lyf7eGttSm5ahJnpeg3KvFRyuWkso3vZxBuQP3lHOe0mQ/EKHpHFhR5GO2j3?=
 =?us-ascii?Q?JQzFEjjZfjGEXbCPtAyuYRWUpZYMKHTbm0VYqWqb3hMGwSZDv46/pVwwMwBD?=
 =?us-ascii?Q?xOZ+uRNNfw61WEbL0Fc20QJyuhdIAPyNyR+qWrWABeGAOFstEoc9RuLzZSvx?=
 =?us-ascii?Q?MDfPGPQGuHQ3Xb12zk38cEK/uAHIrI25kOeNDglzdg/tlrQXX11kBWAjvrDI?=
 =?us-ascii?Q?chmEByAGwtqxcKaqrMj9MdRyTSHzi2cvQUHWzrdoWOrsCxKZjP3G4vJyZOo+?=
 =?us-ascii?Q?d92GIiiGo/9t7BYcKPzaDfp4z3mW9fKOumyTZ4U67SdbvLI5iidefMz8dxHL?=
 =?us-ascii?Q?j2BGnnX7OaA1CLomE8ynWdVyl1CdU7/fLTdCxL+iCa0vQbwW532U8dLuwnWE?=
 =?us-ascii?Q?9oLT/zM3PKmy4+aYE8z7yPEmF9DByN7qmJwV361F+wT/F8kfYulvOzhKYw4/?=
 =?us-ascii?Q?edkB8q1H9/D+PlRhLnYbIAxH8DQX8w1IWicIgj5/UkrH5BGR0Vtxvl5m5+l/?=
 =?us-ascii?Q?MKv1DDDuLLQ7AFxs/Bj7K9x69yHDL8fN9NhBjsWHyCd/1dRKz7Fz3d/62IKB?=
 =?us-ascii?Q?zpAAhnpSoNVKSJKWOnRupGMvR5QDFdeTe7K0XaKRUiEfstzb7hWuX5A+Hwwm?=
 =?us-ascii?Q?Uj8s7AJlGm1bQSMLiz9vZVibSFPXrBfqad5kuYdXXW9j0tPXLWDeeSeuuNq4?=
 =?us-ascii?Q?/k4bZa1fyACrB5HAkFoWBrZXfqZGkAajEBR6Lb/5jp8E1DVabDVpFkX78fZm?=
 =?us-ascii?Q?8YBS3m2LFzOr0kU7dijCIyfPIE85P4DgqUSUSpCd0RS6nXGRaG0Fqfvs+lSU?=
 =?us-ascii?Q?ynfWhiaSblR7AREYJXB+Qe17aSQ6IcVz/x+f2mv2G04jPjClkNtLkBT6cedc?=
 =?us-ascii?Q?fN/yraxTUpvLGjW1KliP4W8+L01EUGBYDE3FMRz6ote2kIGC+BrvIuXp6bp5?=
 =?us-ascii?Q?BbuQqkT8bYzVpV/D0nbAMiCl5uK0WuXlZA9KJgsaxFILf122KMQ8VvyHSEDV?=
 =?us-ascii?Q?Y1mSzmHl5KN+fDugJp7Z7TZfI9eeuoS/IrAmP6yLCFu6dys8JqD5u956o9Xl?=
 =?us-ascii?Q?5/secjEaOyANVcjPAF/P4sCJUQGXXxNq88XZZkFLgqUoxDc4+2T60NDSneNR?=
 =?us-ascii?Q?LjjaKQUfCd4NxGKBCpI6k1leo/bCJk8bxSrUiYOUgMk5UfuUq3UAOjF9VDm1?=
 =?us-ascii?Q?TC5pOOFLHuu3kVfHh9Ywm7I4+n457eMrNOtgFuPxiWQDOgh0PBPRRUttcpz6?=
 =?us-ascii?Q?+qAB4sxDujDYo9Qod5E=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(7416014)(82310400026)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 05:26:39.0632 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: daeeec96-4993-4c93-4a83-08dddaf3251d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022574.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6256
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+FvLhKnNSdKxRypZ3vQnBktcpjV7Pi7DBOdTUfkhMs=;
 b=lttvJnyGfF6T4xc9VfXR/A0sGilavoMR4Kus80PhS4kwGsbl8LNVhC63v+NVUEyXn8HIasT+plAEVOXy726lXgtBz50gQkIZIp3bEoBGFj8XhZh34xMkgsmsRuAaPPIFHOZbOb0ToNKggHi9WexTFQ0McC4kvhUXuwstC25T63w=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=lttvJnyG
Subject: [Buildroot] [PATCH v6 1/5] boot: add
 BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS
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

This patch creates a new symbol BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS to
make sure that the xilinx-embeddedsw and xilinx-prebuilt boot packages only
appear in the bootloaders menu when a valid aarch64 cpu is selected.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V6:
- new patch added to series
---
 boot/Config.in | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/boot/Config.in b/boot/Config.in
index f167346cdf..08a6c8353d 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -1,3 +1,11 @@
+config BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS
+	bool
+	default y
+	# All Xilinx SoCs using this package are aarch64 only
+	depends on BR2_aarch64
+	# only CPUs with corresponding firmwares:
+	depends on BR2_cortex_a53 || BR2_cortex_a72
+
 menu "Bootloaders"
 
 source "boot/afboot-stm32/Config.in"
@@ -19,7 +27,10 @@ source "boot/ti-k3-boot-firmware/Config.in"
 source "boot/ti-k3-r5-loader/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
+
+if BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS
 source "boot/xilinx-embeddedsw/Config.in"
 source "boot/xilinx-prebuilt/Config.in"
+endif
 
 endmenu
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
