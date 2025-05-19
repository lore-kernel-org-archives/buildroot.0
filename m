Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F9BC2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 08:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B79374051B;
	Mon, 19 May 2025 08:36:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qDJtcMCJWmje; Mon, 19 May 2025 08:36:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE5EB403DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE5EB403DA;
	Mon, 19 May 2025 08:36:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 959AE193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 08:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 867B84035D
 for <buildroot@buildroot.org>; Mon, 19 May 2025 08:36:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c7a9ggHEpDsp for <buildroot@buildroot.org>;
 Mon, 19 May 2025 08:36:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::608;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E44D340A00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E44D340A00
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::608])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E44D340A00
 for <buildroot@buildroot.org>; Mon, 19 May 2025 08:36:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SiZtDSpJBciwt/yBks6H0m5pIWURZi2cETL+Myqiyva+A+igrjqWFsDBkN1AlMTx5NN9CrltbpKNzKbjLZKd4tn4i9zCEDZIfp2mI//73JFlC7wRm8vcsy//J0jPXiHugbP+ElaoepQleqlNmAd/mzBhYK3nJ7lIp5VspDhpbFF00l/heAruHyXX6MC9YhwhXEoOsUor/LRhB9Br0b8nXMalEzRvyFv09xrS0fKhWdXkCMYrlFBoZK1Iyzec/RChicUkBv3hgicVCMHB06eTredL9yO1C2Ih+3NXvqNH4Iu/5PAYpQ8hcBRaxnty2DNoNQaC44Xv2/+IgoCrRzAdQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIFdtk8EcGBXWb7xbC0QaTLMpG3idVw98TiJyfpZG2g=;
 b=uRmpS2uhlCMctbCULsPwCb3aqndYFvTnbu6QkLLZaMtWtKahtC/vGyf3IfC3rv/wxxT1hnAj9rXGEMWqpThLrMA5cT0z1uxvd6Xgr8m39qyRxyIpNCvZmyg6uIH03bCDaA4YvrqdqkIpzssuDQlhdHG8rn7/LvocT5P7su4TvKpdFqLq/VBSNi4+E8Aq/Hm0T0Gn0Z4caw4LGRVnBI3obPOxJdM032c/iGO/6fqtewZnsZWloCg/t0+ZK9mGD2MbrvTESPvW2ZmXS1Y78BN1/OqW/b50140gh4fce+lAmbrC/sGQjmr6k3tnxMHoPFvhn2ZeJgRwcFUwiu0BLN25Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH0P223CA0023.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::22)
 by PH7PR12MB5806.namprd12.prod.outlook.com (2603:10b6:510:1d2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 08:36:37 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:116:cafe::de) by CH0P223CA0023.outlook.office365.com
 (2603:10b6:610:116::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Mon,
 19 May 2025 08:36:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 19 May 2025 08:36:36 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 May
 2025 03:36:35 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 May
 2025 03:36:35 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 May 2025 03:36:34 -0500
To: <buildroot@buildroot.org>
Date: Mon, 19 May 2025 09:36:28 +0100
Message-ID: <20250519083632.1930804-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|PH7PR12MB5806:EE_
X-MS-Office365-Filtering-Correlation-Id: 513f8380-eaba-4cc0-8fa2-08dd96b04457
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e7MYSsmLZikTGG7GkDO2slov3i/8pGkGFiu1a3JLa6OS1SZUIze85kMozg6P?=
 =?us-ascii?Q?8lULVdnj/7wAyZ26SlanhtzuPDs9OLPGghVY3U8UwibhlR+Gh0i8vOls5A5K?=
 =?us-ascii?Q?zgtpYYy7Ua85di1qRS+6E2S9ANbeDfJFZLcTgmydRsBZLPB6EDF1O+tyyqAD?=
 =?us-ascii?Q?HDlmyjUJPPRXdFaqsyL7X3HtwJzIknIE0KD9O5XmDq1cGrJfzolMGExNwTjT?=
 =?us-ascii?Q?d/gCkIm1JPjohD9nPouydKWCgnhajAnx3KWyWD/UmP/htptNZ1Hsd3E+MeQQ?=
 =?us-ascii?Q?5qTRMUdBkK7lqdyL/Z9uidXCF7Q7TTfktuQDe2hO5iBWe04H+nyiG+n3P6+V?=
 =?us-ascii?Q?saSXzc7YQAbp9AJEfQuG5NCUkoIJaj9U9QYHRm0TGq5rBlv7tGj9mq+/JDCh?=
 =?us-ascii?Q?fD3D8JWF1bpMevFyRYsKyw3zq7+6aXY05yE8vx1Qhs4C5JcFlyPYgOezzAzx?=
 =?us-ascii?Q?AVuFMtxIEjCjrtj/fVkiUE7sa4yAQBEm2jbHw7sGwjlcg/S1Pw/j1tIFmyLo?=
 =?us-ascii?Q?4ukPTZ0CuJi30gP44gg4EwcNHAsaY9Y0hYC5MpSrF8q5s4iQTLSvHBRLdRsg?=
 =?us-ascii?Q?9TPANsk/az2XHtlPsB+aViiv1wq7pg5DmRStLhOfZYXt7Pnpc5z8LnRf+5U0?=
 =?us-ascii?Q?d/Kxp1WFDe3OdzeGwadWlwAcZcnBv/sSTLcJZ+H8mczIiQOAwQxn8ViRyyPp?=
 =?us-ascii?Q?QCVKcpHEkhOJySKnAFwD7X0PDyQpLdNJUrA2B6KvhhB2loHf9VtxuFc5HKlH?=
 =?us-ascii?Q?qKKZwp/TGsSqwrULYzXLU9iQSt1yGbXcuF15E0DzVzfwrWLEOXVLnjQzB5Na?=
 =?us-ascii?Q?dUIbrbHT4FvNq7idQznvrTFj28WXedBujbiVdpbidf+SAwkGgeYir0nV1AlY?=
 =?us-ascii?Q?++40X+TVIqLYEphZWd+QpB1zxUsGQUS0dfqN6ZQweNC1xBzqYFDFDope5DJX?=
 =?us-ascii?Q?IwgJCX782IX2hVKcSy0gpPjqsW9S6JDLcPaQLSLWOz9ghzuX/6a8QcVn/iPa?=
 =?us-ascii?Q?dp6AJp6LljmMVvHSlVSd9p3q/Tf+N6IMe4AJ4JUDUD9o5pWjoyKen4iQeqyY?=
 =?us-ascii?Q?W2PlO8cNloAw1GLyytpBGSOgFFY/vmDKCClPQr3sekuTGuDXXRR60EEmMkml?=
 =?us-ascii?Q?A7KTzsF8dRC/OI+dYEsD2Os0sEXR5EwT7ug63rqXxQSDCqavE5JQSz0arrCA?=
 =?us-ascii?Q?+V/Yd0shgVBlPE1C2M1UprChs4WkPLE8dS818V80hUTHQ42ZmBt8gHTZCile?=
 =?us-ascii?Q?jF+Cl9Ue8o8pSdnxNp5yJBwnXXvZq2pN5ewM5bI5JEwQkkyUJT2rj005QSJZ?=
 =?us-ascii?Q?jlEwCa9+P6x6G1/AgOSsjdVHPKHN9+P4a+o+GDCAvlvCh5mFvLLSPh48iW1E?=
 =?us-ascii?Q?RvW22O1qY1djS0XTaTjN/PngYE+cFNT/ZbYssd7Wc6WPwZmLqTIjWwU/q/Ld?=
 =?us-ascii?Q?S8hd1ZA0Ncv6vU+SBiN641GwkS9PKEMrJ/puQa/IJxpb0fiIIoQQk+rO5Kq+?=
 =?us-ascii?Q?bxb1YBUPmvomoXw5MulkXTz8MnkKA1bmMCJHjJtzHloMOqLDeMtCftQpWX1w?=
 =?us-ascii?Q?xpiH/HhlZe1vkMC3fgg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 08:36:36.0938 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 513f8380-eaba-4cc0-8fa2-08dd96b04457
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5806
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIFdtk8EcGBXWb7xbC0QaTLMpG3idVw98TiJyfpZG2g=;
 b=nF8ShAJt37Cxb8Cfkx6nS8Ip9Dxt8lnn1UEDlDupL14Sm6PU3aEj0xGKcV62ODANPJZlUVbk8H/mcm2D8IFY4zlJuz5F9J+Vw9oWPntB6I8gbO7fkcxtYKzPJK/VrEfPUR3F6/pXM/xK1CL7if2CHYxwUAHP3+UWTUX1nTOk8kM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=nF8ShAJt
Subject: [Buildroot] [PATCH v4 1/4] boot/xilinx-prebuilt: change versal pdi
 file permissions
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
 Neal Frager <neal.frager@amd.com>, fabio.caccamo@amd.com,
 romain.naour@smile.fr, michal.simek@amd.com, arnout@mind.be
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The versal vpl_gen_fixed.pdi file is not a target executable, so the file
permissions should be 644 instead of 755.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
V4:
- new patch included with V4 of series
---
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index d0817d3cc7..72273f0d2f 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -61,7 +61,7 @@ endef
 endif # !BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
 
 define XILINX_PREBUILT_INSTALL_VERSAL_PDI
-	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_PDI) \
+	$(INSTALL) -D -m 0644 $(XILINX_PREBUILT_PDI) \
 		$(BINARIES_DIR)/vpl_gen_fixed.pdi
 endef
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
