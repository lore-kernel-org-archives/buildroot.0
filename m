Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE834CA0FF2
	for <buildroot@archiver.kernel.org>; Sun, 31 Aug 2025 13:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B23340A61;
	Sun, 31 Aug 2025 13:35:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZgCs7p8E4KwP; Sun, 31 Aug 2025 13:35:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2AAA4030E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2AAA4030E;
	Sun, 31 Aug 2025 13:35:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 26268222
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 13:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 040314030E
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 13:35:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ba9jaKgkDEjF for <buildroot@buildroot.org>;
 Sun, 31 Aug 2025 13:35:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::603;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4B7C7402D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B7C7402D7
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::603])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B7C7402D7
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 13:35:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NKOmutV1KVs/UgXGGpILXSLx/LkS42gcz1vZV8ZZt2sXEtlwXk7s8/KXVpd+umWHJRhcvmandn0Tg3hzdLevN3eLcAhT87rhLNOSpovB94jGbOmm91cej8s4uQTD8ZbUBrft8RI8SzhSd6RzfrbXrqT3PQsUQZsV7MBvuDMkRg/UhfL6zK5ZAF7Y0ciytehIcqnr65zqWcZq2xEK058lbnXR/AFCQNfQ//qo0t1CGGTEUEM6x9m2iesLdTjNa9rwr6ARrPgzIggngXaBwYgWbBkp1/UuIb8kLnRtbZ6UqbR3pHRKUrXUe01bFFY2u/acRgE0das78/Da73usrN85Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VV9dr1mraB3HJOO0symlfhNf+9zPaTja6XeEzOsZHOQ=;
 b=MVELIShdG7FD/dZecXGKYi1MUFZDyyd4wz0poCztfHCq4mH41cymMZtjrIo/Cp0QbA+8sULCxaZF7N+V5SRVKX6GZH2mWXKtdZVF/JVRR3tSBVx6vTCMjvlpmUriCjUMLUyJoVqigf+xEAQMu/o1Ir+WNvuHqkO45sgVDyPlbwIo2rJ7wNw5Vl5ULsRhBH9bSXFwf5zlsKcnKaUWoULbYPOFYnUag7pfqo9wL4CRRIYf4nqVKO5pehZqyxv/yUJ8ghhrzZ6sFG+gZR33y9ufI2b+zwwPfYWOkhE9nafOIK2ON/GWgREyiET5j5leuaStNyCnEsXJcLBoVo+hZ/kS9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0085.namprd03.prod.outlook.com (2603:10b6:a03:331::30)
 by DM6PR12MB4355.namprd12.prod.outlook.com (2603:10b6:5:2a3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.25; Sun, 31 Aug
 2025 13:35:34 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:a03:331:cafe::b) by SJ0PR03CA0085.outlook.office365.com
 (2603:10b6:a03:331::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.25 via Frontend Transport; Sun,
 31 Aug 2025 13:35:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Sun, 31 Aug 2025 13:35:34 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 31 Aug
 2025 08:35:31 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Sun, 31 Aug
 2025 06:35:31 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 31 Aug 2025 08:35:30 -0500
To: <buildroot@buildroot.org>
Date: Sun, 31 Aug 2025 14:35:26 +0100
Message-ID: <20250831133526.332716-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250831133526.332716-1-neal.frager@amd.com>
References: <20250831133526.332716-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|DM6PR12MB4355:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b0e10a9-80a9-498b-a61f-08dde893435a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fLWphtr7Fi65piCl/Ud3IhvQcg3gHtR8o3Cem946Z2KMdcP2NkA+6byd6Bo2?=
 =?us-ascii?Q?iE6fhYXqkIKfu+uPSWMevFkv7dboMiLwhiGpV5UMwXJEKLh610OzAr8lM7Ga?=
 =?us-ascii?Q?ScvRgiZr1tkjAfkeevqgEsGdC2aP7cXP4szw21QY5l2RAUr4dr5bU6CxApRI?=
 =?us-ascii?Q?kFL41e1Rexbtjtd9zwOrsimvy3AEpslUxPgQvlwaogx5Y4Su7MQRIHuVPTjr?=
 =?us-ascii?Q?IvPVcxKA9bG9euhClDmtbuFpV7dWU5lbUzktZqlvSlaHCO0fkfcM4GFtwze6?=
 =?us-ascii?Q?4wDTA8vyh5AH8DuNyOudx23yNo6TdPrMVh5L+NyRXiC749TEco+n8xsP06ca?=
 =?us-ascii?Q?ptxm6JTJyc6lUwYdOsDTH4+LQsLee7RSDa3lb9LzOqyuRIJiRtYnSfGls7Vg?=
 =?us-ascii?Q?P3vMVB3I2o30Gwk+uTb4sJ01e0ennJWY70z41mTCxhFmpTQgROmbT1IxDD80?=
 =?us-ascii?Q?eZqTrE0NH/0HO75Vfcr1YkfTcGg8Gq4yOWkaS9Iu0tcuLWIJmjwxb/J4hO+0?=
 =?us-ascii?Q?yt9h1ADr4mqOGfQi04Ck5eSTz38nOdJwY0fuUoVlhUNpbZMTIGikq2Y193qh?=
 =?us-ascii?Q?IYAKjmED+m584I22p75P4Exs7pwhymUBIrY8pc92DdlNIy7ODUsRxsScFbqH?=
 =?us-ascii?Q?HuU08uihM5FgJwzwfCo9euo03BKw8l3kKW7aLlmUarcFlTCX4tx/Toc9OlcM?=
 =?us-ascii?Q?gsKjBgBvSip+IN0Pv0sIvTowFspqT/AmRp8eOj0ZzbJayJkc/JvuzFJyo47G?=
 =?us-ascii?Q?6QZp86wleEgIpxbbGcmXmQYnMOx/3y7aVa3VT1hDpiBEPe06a/ieXHpvTruQ?=
 =?us-ascii?Q?zr04JNohm9rjNcW7mxuFcJQNnyDSVPG4/8ycG7JNHejaLS14V3Iy8U9rgkPK?=
 =?us-ascii?Q?ZDvNSzTSclQFCb011+fDjMuclqwyF9sIGAiOYcqvqFh5UAbLEWT7QjWJNDMu?=
 =?us-ascii?Q?5R/q+IBiPgnaL0lglaNEHIjUGr5jyBr+mqe4w32I0D1sw8Lk6CW62bEHNwLk?=
 =?us-ascii?Q?IUjw0QjS3QO4ECovCcCpRkswGtbNVyacPs26KOowdKWKvJgvPEgjqZDMZoq0?=
 =?us-ascii?Q?OPzPRwyGIR4RnoZT605GWHbC8YCoZpkM7OmeColzWYgHneX28OgZmNxhNKkG?=
 =?us-ascii?Q?4ntfce+aciF9wmBYWeKNsOc/Odh1+LEeuuZCERTkSR1fC5j9YimYRRxKOKc/?=
 =?us-ascii?Q?cL9ynIy3nUp6z+7WaQchiYJ8PIHNGLMySru/MunawKl0kFpzk41lOHAfeFYI?=
 =?us-ascii?Q?inOrw+eekYT9lIDrJxT4GWibKE+/nkii1Kj/ucA8NXcDcEXfQ5zp6R7W6s1/?=
 =?us-ascii?Q?G4+Nv5drlxlNJXJ9wQ4fqF++k0gwN1oIT9CJzfK4IY9gvCnBNYMN0MhT+YX+?=
 =?us-ascii?Q?fJOQ3DGc0sb6y8W+aKIgnXibGDrAQhCXX9+BHGSxfwiAosE7Ovs5QkgjBeCC?=
 =?us-ascii?Q?+dW+EEZl6PLc+Vdcy5gxf2keYV+XO/QTIsvSHcK+8c8CLZtSd2S+Uqibppju?=
 =?us-ascii?Q?t7SH4RYl39cTIIQ0em19cJ2XIJKrdBmA6LQtv/PpfJNw5L87t7d/hOCg1cgC?=
 =?us-ascii?Q?j9l0y05/omW0Ga8xUTw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2025 13:35:34.2993 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b0e10a9-80a9-498b-a61f-08dde893435a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4355
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VV9dr1mraB3HJOO0symlfhNf+9zPaTja6XeEzOsZHOQ=;
 b=T/zc0yYuoQImHj3HyON3tAa88CbQV8rZUSgwWKZRNVemF7+vduWZk2DQzQpgAxJLD0vqU4X0bKccva4S/UE78PApUktYjEzsX9vlk68wW4Th/bBfu5vX+DfWkoauK1uf2bK+xzgTlRn4vzfEgSYYi/Mr0kXz3OJl1r/8BcPdy40=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=T/zc0yYu
Subject: [Buildroot] [PATCH v4 2/2] boot/uboot: add cpu dependency to
 BR2_TARGET_UBOOT_ZYNQ
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
Cc: martin.chabot@gmail.com, michal.simek@amd.com,
 Neal Frager <neal.frager@amd.com>, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the Xilinx Zynq SoC family is always based on ARM Cortex-A9 CPUs, the
BR2_TARGET_UBOOT_ZYNQ option should only be available when the BR2_cortex_a9
option is selected.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V3:
- New patch added to series
V3->V4:
- Updated commit message to explain why this patch is important.
---
 boot/uboot/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index adbe8d142d..756eb2b2fc 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -704,6 +704,7 @@ endif
 config BR2_TARGET_UBOOT_ZYNQ
 	bool "Boot on the Xilinx Zynq SoCs"
 	depends on BR2_arm
+	depends on BR2_cortex_a9
 	help
 	  Enable options specific to the Xilinx Zynq family of SoCs.
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
