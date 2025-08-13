Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDD6C87FCF
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 17:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB06F60DAB;
	Wed, 13 Aug 2025 17:30:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QcCokYexsPu8; Wed, 13 Aug 2025 17:30:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C30760DBF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C30760DBF;
	Wed, 13 Aug 2025 17:30:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EC893939
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 17:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2D4B40419
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 17:30:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Z0sPOdqDJDI for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 17:30:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::61d;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 36D09403D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36D09403D9
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::61d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36D09403D9
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 17:30:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A/noAZrKMBMnfWzqLV6gRUFnPAb8+AnA1JYjvJswL+YxDAo/hKlTYlVFaqwrtGkLH68YnEOKNlznIJCfPfY34vPLvsKwK6IUUFbIvrJcCYCYMxF1PryB0V4ddXVZKNie7DdpSpokzuV5v5dpBvWrYzA/fItSYmu9B9U596FgZmYf5Xt2qLH3tm7Xcl5CciP8Y0FEsJ2XzKmbx4tJK6yFfXVjLd5m5kChN1bHn0kUNz9MqC0TbUiETc21ruIYTb25K2qtjQqqDoSMoGKitzwefMpK1UR8Ni0rMNu/cKIYT4p9t6M20bxztpAU2AHeF3MEqxZ0QFXpZrqBGdwhBdk2DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jw2MQZB16Pa/0RRPRCI5sFir1oVP8pmfIQI+NM1IJOs=;
 b=OGcH8FMpfZjR/d0dNWSiFY2LhFMC7IF9OPwSp9dNvBqchNQFfXOKeUPR2BbcY4/ihVGlp/KLWF5S8/BE+Zg3b6oUY/9wW7pDD20K/3L0HRQvvbXxOz7t57IYJcWbtnhz10ufACF5smVKZjh9dKBvQHj0p+AxhqZlUVsWkIrCtYiS5MLMeT+H0GiMFlJqpNtRHdr6bzBkdSxAe6rTfu7c9cKUdRxhl467R5LnDTTFEO4+WsZlGd3cCVs1fIuADR1q3pTsFiHwu4x+MHAW0L8Rx8R52+bMFGPapEIBNOwI+UTP0s5OYrrxK21J1/RUWT/JE1Nf3jKVr+QRoCICl2UYRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH2PR07CA0008.namprd07.prod.outlook.com (2603:10b6:610:20::21)
 by MN2PR12MB4437.namprd12.prod.outlook.com (2603:10b6:208:26f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Wed, 13 Aug
 2025 17:30:44 +0000
Received: from CH2PEPF0000009D.namprd02.prod.outlook.com
 (2603:10b6:610:20:cafe::e6) by CH2PR07CA0008.outlook.office365.com
 (2603:10b6:610:20::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.15 via Frontend Transport; Wed,
 13 Aug 2025 17:30:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000009D.mail.protection.outlook.com (10.167.244.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Wed, 13 Aug 2025 17:30:43 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Aug
 2025 12:30:42 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 13 Aug
 2025 10:30:42 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 13 Aug 2025 12:30:41 -0500
To: <buildroot@buildroot.org>
Date: Wed, 13 Aug 2025 18:30:37 +0100
Message-ID: <20250813173037.3052024-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250813173037.3052024-1-neal.frager@amd.com>
References: <20250813173037.3052024-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009D:EE_|MN2PR12MB4437:EE_
X-MS-Office365-Filtering-Correlation-Id: bff14c49-6d2a-4c9b-954b-08ddda8f21e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?R14+YXY1lEzXembtF46L74simC4r0HIbhXp+jGBfN3Q/lwDGwPxetMKemT9B?=
 =?us-ascii?Q?0TimKpqSU5kzNRuHJVXYicU/Z+P3R7Q3eBDPSnboAg4NTG46iXU+pyJd9VYP?=
 =?us-ascii?Q?U+tDnT3QHPeP3nVglD39HfA/cIEh6oNQqwDQYD1SeROcBe4Y0ghC63FiguVB?=
 =?us-ascii?Q?BljkCsEVQMxaMiy3tA396lWEdBYDskil4B0AQ3woB7QR5UrzLB331sKFEkM5?=
 =?us-ascii?Q?ohhSzYJcnZRJq8JJpdGvQ0nvNQwQZyZb336fL4l4oajJRNN62c6jkp0Dc3w/?=
 =?us-ascii?Q?2oo9AcKIrSdavzNIgtD46zKjfvDLy/Bz/+7EzvZx7X0oSrF6prn8hg93RRPs?=
 =?us-ascii?Q?U3tahaFaMmdKi7FlWg10IvSHQdzPHGNBOfTEufX3wa+DWcxCOL/e/D96sdEV?=
 =?us-ascii?Q?dY5arNTZamH3fWMYuf3nWs/RKdzLusgXJW1jPm/RVAEnB7AO9+Bq/wnVO07B?=
 =?us-ascii?Q?dMWp5coNHrmFyHnJ/GPyK57IPkHUZHJTjuXW9k3RZIOA6Y5pj7jIDxZSpNcf?=
 =?us-ascii?Q?fR6o32OwO8E1MqEI5+QwYWg/iOxUvq3PdC9DuPpkJBgUa6VatNwi90u1MJFq?=
 =?us-ascii?Q?fTjV9MdMowfpaVE7QWS1TGVxt8nqof2ZVk3jol1tLRAdAkuGKNs5s/zSanuF?=
 =?us-ascii?Q?C/JV6g+ct2J4ABCp2qfNj/kOwdN78tiwMP990Kqr7du7FbGXg86NR650gcVC?=
 =?us-ascii?Q?xqAGyAOMTcyPmyQjp6sx/Oyf1P18ktKN1nTsdEQ+og/40TAFHpmFkWhYesip?=
 =?us-ascii?Q?zd5CBghIPjMMxFnGBL+mm2Ja9bNKQfasy51RetpVStEFRZR11UwNSMX5bIQP?=
 =?us-ascii?Q?8Lsu0BY7Ej9QzqUcliTY6U8tpkPPe0pYP3ykJVSQRR0Z25lbfZYiypoOSFcG?=
 =?us-ascii?Q?pxTSS6ECUdzIDUqliz2Zny478Dy2tPskZC0IKYbkLZGmRXitXSWTS09bU+k5?=
 =?us-ascii?Q?lHVnk9FWnYGBQ7JsVtisc8CbiU6Nbm4znQUcT8/Ee+ZigZ3B6ZUgdi2YyrQE?=
 =?us-ascii?Q?yOCLV6sFZyJEFTK1BDWhkA+x/ot4++Rq6LQwgu2ARPHlcutNFDhs1si9Gcgv?=
 =?us-ascii?Q?DfYMpQle9kFw5vP7esEfnn5yy1vs3i+RolTMmiCHkVEDY6CfoP7FR1SK6S19?=
 =?us-ascii?Q?1Feyvn/xsgDLHZV12I5Mobb9MErcJvxly4hKzgqyfedRYIRgZIf5ZJcJ6uT6?=
 =?us-ascii?Q?Xclg29kkk8YQTuUesRl2GPzJ1cV4MY0s2y5BTUrw9pG4pC/1Gp7VeRgyUUEZ?=
 =?us-ascii?Q?haI1l0DGB7jKyyaeHtyQmNMf+tlggxyEspuAffFplK06Usqj9FDaBce8DP3L?=
 =?us-ascii?Q?yqoY7KOSGDqNPr+Jy+fA1CTfmkvN/mqYBi5a65nCgdYSPR1ZVaifW+bMUanr?=
 =?us-ascii?Q?IK6vNJGi6YJrsTQZTY5dGERgZZnHzCkqyu5JYT4I3t7TaTaK9Hh+ADmLrWHm?=
 =?us-ascii?Q?QRe2zUBFnN6cL3DvCrlWPRLhO2MRblMWEgh64nfsuqgfNTTNIxvHV1lQwA+y?=
 =?us-ascii?Q?TzuVPkL4CpZ2UfYPkQDWmyS0sJhd9p22MBfYLxE/I9n1GQgDCAtZ5E9D1q67?=
 =?us-ascii?Q?OU8jaZemTKL6bJz2YFU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 17:30:43.9712 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bff14c49-6d2a-4c9b-954b-08ddda8f21e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4437
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jw2MQZB16Pa/0RRPRCI5sFir1oVP8pmfIQI+NM1IJOs=;
 b=Hpp+dV6qZMtZxB7SwqzvZlmQVNR1gU6fMRvNlFKZC2Bu3UM/ovM1cnf9KP7XNW3immqfCj8wSiENKEV3pEA3iqFTubXn1mdacmxcez64YsBKAJjulNW4itPceXCfg0yXNF2A99Y2CwUAbffzSzGrq22++iWaT4G89elFTDJ0j68=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Hpp+dV6q
Subject: [Buildroot] [PATCH v3 2/2] boot/uboot: add cpu dependency to
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
 juju@cotds.org, thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds a BR2_cortex_a9 cpu dependency to BR2_TARGET_UBOOT_ZYNQ.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V3:
- New patch added to series
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
