Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C95C3600E
	for <buildroot@archiver.kernel.org>; Thu, 27 Mar 2025 11:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CA4C417B5;
	Thu, 27 Mar 2025 11:17:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zQB6NO6zkSzY; Thu, 27 Mar 2025 11:17:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DF5642E8D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DF5642E8D;
	Thu, 27 Mar 2025 11:17:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 65F4619A
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 11:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BEBD41E6F
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 11:16:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7-jwO-V2QoFl for <buildroot@buildroot.org>;
 Thu, 27 Mar 2025 11:16:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::61c;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8AB9C41C8D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AB9C41C8D
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::61c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8AB9C41C8D
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 11:16:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVe+ZVqx22HuDjQGaBzOuGj0Rqm2lqsQ6aVlmh1mkk3HIvr4QGGGppgxO8d9noULKmgn3dLd582tKq7Hp8X0EEj6aGx2XTekkseZkPzRrrflyGKSHznrcqQnqpvbqDmrlXCRVjrQ9ExYOFP+sCpf4PS5F5Xz8GdhQecMiwRXrovx4cF/uiu6tHJSB1tHbCz45oxe7aqHTb2ARpQSgTR4w5h+Lhlf3wlmfug+ZRH4XefQoa3vV62PAuQrkRBDqMPyPQ6XgbpxH2qTmG8jo3c6g9oIorTqb6MTdhDVsUCo62aPXGcQxUnKtFfKCmUsDnBNIj3APMW2ncbKo9P0/0X42g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3n5y5WwyDoYaP/hiuCQbtPIe+L/Pe6TtEEe9xhjtnY8=;
 b=NoWeNOzDiyhkAkDD62j6ryIRdhJsC1swr7M2j2onsNluQlhDB5ybreygOiaflQn8WOdEj3yecB9FAPimKnrZRueweBPqEmzyBd2+ap8jZYTFg9VLcCvUVrp7FhTjsJwW4BtF7jENM6aedR1MnUVFIhYutb0tX4PETkN1Pkdy55O4Ic6WTWOTe1IHP0WW4EtKUnYZcjJ8bQxKAnrnIW9dI4DYznwIGKnfu/9KzSrxvRL7iDUcgTHCGcXmpPfOxnRProdDgnJ+mPDBMPQ6KH3w/N37LD/LQgJeUzCc58ZdgQwpSqF+g7Sr9RfPrfZWuNbWvdqFB63WnSOJIpsurK1xsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MN0P222CA0001.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::6)
 by MN0PR12MB5955.namprd12.prod.outlook.com (2603:10b6:208:37e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 11:16:52 +0000
Received: from BL6PEPF0001AB71.namprd02.prod.outlook.com
 (2603:10b6:208:531:cafe::36) by MN0P222CA0001.outlook.office365.com
 (2603:10b6:208:531::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Thu,
 27 Mar 2025 11:16:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB71.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 27 Mar 2025 11:16:52 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Mar
 2025 06:16:51 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Mar
 2025 06:16:51 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 27 Mar 2025 06:16:50 -0500
To: <buildroot@buildroot.org>
Date: Thu, 27 Mar 2025 11:16:44 +0000
Message-ID: <20250327111645.1430919-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250327111645.1430919-1-neal.frager@amd.com>
References: <20250327111645.1430919-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB71:EE_|MN0PR12MB5955:EE_
X-MS-Office365-Filtering-Correlation-Id: c0a22d97-1315-49bd-c0e6-08dd6d20e00a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y1ztCSOppIUJSTB7Zwc0O8e+no2H4BJAD+6dyO1yUFkyvHqXgDXpeks6YSK9?=
 =?us-ascii?Q?1YyZg3mMiDAHN0b1PCI64X20oo/Dy2ikl7lBhhIqk1msJPCGgVPZQBi5Rf9m?=
 =?us-ascii?Q?faF0UDONKuJgrPaffi6rpE6X2xBQwLfToEGZfxiB/Y4wR1zwaws/nWou3H0b?=
 =?us-ascii?Q?ntrEn98M0u42kTq77Ty0R+zo53KrXmvBCywpb4FJ5XOuGtdyegt1oFcn2MEJ?=
 =?us-ascii?Q?v0n2MfAbWtHmiKyObv1bg+zu0PONb6xyqs43b6k62NF7hmKl1Xe2QB06z8lD?=
 =?us-ascii?Q?rpdFrwAqwObZCq/mqz9SGbGK2XKsg8DjcllvVB7UEjDiQvEUEvHFr5NFoRLc?=
 =?us-ascii?Q?qd+nkmIKjqGo2yJUlb6jBD17L4iCB8m9pPmS9vDmXfjZx2ksrBVWoWLFixtz?=
 =?us-ascii?Q?g3f6o3EZH27LwTULI4FOvE6HfoZzFxTkUy3IMfCIsU5bTcgDqu3ovN+dHIHb?=
 =?us-ascii?Q?rOIj5qsCoYMOdcTnOrQtbXC8/YrXa1cfaRpBrQAOXztJ51X9quaG1njm6P0o?=
 =?us-ascii?Q?VYIV2tGmi0EdJJgeOEwNBvEBd8+uy6HH+Yks6UsSqFtAb5gMxOmHa7ktm3Re?=
 =?us-ascii?Q?utl9vZ14l53kTw+Nb3w2fuaQcvUXsKi0jgF+4HITZb/iqv9gFGyAz+r2DWaH?=
 =?us-ascii?Q?JnXsVfM7FVVqUEivNpBM0Z7djwPu3a2Ib+cDBgTw86Q1aVPAEkL+2VXDAYQ7?=
 =?us-ascii?Q?3WAdWqE14JdxAU95Hu/lceUvgoxLIQLvdMFORUHtvlWz8+4gtKETW2qGP4+A?=
 =?us-ascii?Q?rmQZ2tIDfGCVD8kDxdKpiGbPyaSocaoKFcRgn64sEbU/28MQyGpLXI0nooRh?=
 =?us-ascii?Q?DOPkeWTNaStmfiUltehb6LkBUXKhOwNCEOYeWX5tvT6EAI0ntJnxA5p7OUXa?=
 =?us-ascii?Q?ahbimoABNuGOXVl2cvlYT91Wv5r6U9Ol2QRtvxsOiXbJiB0E1p8dQtoXt/+A?=
 =?us-ascii?Q?A0QLpUljxMCsGtuoSnxsQHcVE3RyiMBsHkUK3iTjRnXTQ8a5UBSqlc18uIeE?=
 =?us-ascii?Q?k2Yltg7GkC54uX9o6eolIxWRTsC6bc9vAx/qJOSCaJU4LmKkuLO+7Rk/4gh5?=
 =?us-ascii?Q?Q9zM1OV4KhrPNTLQ+PFn1/83sFPwzexcWG3pXt+G+DgwlyYwW+J1vEQOqkP+?=
 =?us-ascii?Q?UMvN0OWUkx0hAZmp3JU6N8Mxvo0+AWCdjTF56UqOhyvwWCbQltOBPp7fFsC8?=
 =?us-ascii?Q?rFGN7fui7aNYJKpZCVWxDQcAMNL3NRJlK83ShwKpwJ9BkXQiZGyI/s9LA4hR?=
 =?us-ascii?Q?izbsqJ7FoZW0X9hnMJvKdsggeDW+AvegF5818TZR2GfmhdkDkiAt35sW9FbD?=
 =?us-ascii?Q?xqBZGXdC6DTJaWEVU16ObKsTie6FbylOY1E4PWO8BaywP+MCtUFLD1p1+eAb?=
 =?us-ascii?Q?/q9DdXasZHhLt987NXkP2TjWiO6cdHjKNK8lwGLteQhEQTBapGwf7fSwhgus?=
 =?us-ascii?Q?A8MFOz12S12+b9YNm1uBPExvxsZcArXOrGniCM3yluKl5Cp+Za7ZKx28u4dz?=
 =?us-ascii?Q?FK4q9X8bgGIVq9mDRgXgvG6W33ySvxoBxAuE?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 11:16:52.1191 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0a22d97-1315-49bd-c0e6-08dd6d20e00a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB71.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5955
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3n5y5WwyDoYaP/hiuCQbtPIe+L/Pe6TtEEe9xhjtnY8=;
 b=wlXREI7vWul9amO5X3URp9QyurB5jHav/GeOM8GVvkCWMb1Vr7xhQTjvqHtMTdCtBiSRn0YrGJD2F/I4dGCZdCHEnxH0SDKCu4YdQH59mMqGZFnj3BwI9E3A4Dst3Xf2VRNZTYNIOHUt4HZPcOnBSuTAb6QCvfqrgi7EXbiuVk4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=wlXREI7v
Subject: [Buildroot] [PATCH v4 2/3]
 toolchain/toolchain-bare-metal-buildroot: rename example vendor to
 buildroot
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
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that xilinx-embeddedsw is compatible with the toolchain vendor buildroot,
this patch modifies the toolchain-bare-metal-buildroot help example to use
the microblazeel-buildroot-elf tuple.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V3:
- new to series with V3
V3->V4:
- no changes
---
 toolchain/toolchain-bare-metal-buildroot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-bare-metal-buildroot/Config.in b/toolchain/toolchain-bare-metal-buildroot/Config.in
index c86c5d725c..19c97410c6 100644
--- a/toolchain/toolchain-bare-metal-buildroot/Config.in
+++ b/toolchain/toolchain-bare-metal-buildroot/Config.in
@@ -10,7 +10,7 @@ config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH
 
 	  For example, to build both a Microblaze and a RISC-V bare
 	  metal toolchain, use the following definition:
-	  "microblazeel-xilinx-elf riscv32-buldroot-elf"
+	  "microblazeel-buildroot-elf riscv32-buildroot-elf"
 
 source "package/newlib-bare-metal/Config.in"
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
