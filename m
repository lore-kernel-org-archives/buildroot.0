Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CAF4C0218E
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 22:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3AB48118A;
	Sat, 25 Jan 2025 22:49:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dl842ye9ncfc; Sat, 25 Jan 2025 22:49:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7D2581A24
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7D2581A24;
	Sat, 25 Jan 2025 22:49:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3252094A
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10FDB408E3
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K7I4AOZpB89o for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 22:49:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2409::622;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C3DC2408D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3DC2408D1
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::622])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C3DC2408D1
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:49:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SSf86kYd2qSJ2GVsFue0Acl72e1JLkNBAqi/hKwksCb9TLpCkAg4s6EdmJwx/4v47G63GG4wsBi88ZpS0dxMnkSTz2IEdAfB3XLHCFacNx3hXaAZz1aLwoLEG8ewIAPrlzjfu2uQe6UO9Moah0QAMUt2n9KnmJJ2JlptC8cK371jAK/KBf8QcA01F2jdbpm4bBEQrqorqCBAsJGil4k3p0gz1cFCXDllLvfaKAjU2s4CYigmQlK/ncbNqVCVE0mRW53TbfSo+EA/nSNRRC4W6OloYsPofmtYXbmAmDwPFJUQgtojNDr6OW5eBi4r9Hn6LlVecx+VcjlBOu/ykw1Wrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1EN6qEy4HxoqKzW2ex62ZQJLB6uzvJaJxdb10CSh0hg=;
 b=NyNHmo2b+yPKLEjL8pB5BUvY9S2JMK21xF371tZMaKQFmaE04i+BbqVCa34GCLGtc3rNBR0C4vpdNrOZxWpz+m9PXUBj8n6u/csRzoHHfchQM8iYJW320DK1wxVpxLIZd6aCpWxdXzUXca6Yt4mA892lTePl2w3oh6rZT0B9Gw3oJxhEma26wUnpnCMOTGoOW1xnkXEjSWOcXU+d6rD8YrL0iwzU33mnU5oqeIQdBTBhZ89110DF0+kysB1dxTnpn3klyQ5nmh2P0ycKCxYUv6a+whgqf5X+W2A86v/jXKUU7krzHiWFPW/lJMz/E4Wd2rrMn3tyOZ103FRDNjqzIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN9PR03CA0886.namprd03.prod.outlook.com (2603:10b6:408:13c::21)
 by PH7PR12MB7986.namprd12.prod.outlook.com (2603:10b6:510:27d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.21; Sat, 25 Jan
 2025 22:49:39 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:408:13c:cafe::bc) by BN9PR03CA0886.outlook.office365.com
 (2603:10b6:408:13c::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Sat,
 25 Jan 2025 22:49:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Sat, 25 Jan 2025 22:49:37 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 25 Jan
 2025 16:49:37 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 25 Jan 2025 16:49:36 -0600
From: Neal Frager <neal.frager@amd.com>
To: <buildroot@buildroot.org>
Date: Sat, 25 Jan 2025 22:49:25 +0000
Message-ID: <20250125224930.3639111-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|PH7PR12MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: d794c65b-0e10-42d5-e903-08dd3d928bec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HFYRC0t+DcNSj7KaUr0k0O3a9vUyG7EXho/Y/ZatlCfIhhuNyGi9DOjcuxz7?=
 =?us-ascii?Q?E4DJy0RIr15f+kaIkgQFN931yKIZxcrIwObJcz0/FUytbePgf+22IptFFHv0?=
 =?us-ascii?Q?cl3nV7CJUF5wTrjvfE55/M2lsKL0VJ6nvymlU98CI6qL9KFjbqyNNWh4ch/8?=
 =?us-ascii?Q?yYlF5Fg+VUJH2pU746g1peER7Uj47SsoGLXLRNSmqZa176yhcmP3X/UUEK/8?=
 =?us-ascii?Q?xLFarsWLDnSatSRwtIB3UwaS7QbUFZ+7HG8FJ98pg9+OZZLHdr7WYYHNrMA/?=
 =?us-ascii?Q?Tdp6K/Bio87MZoQiAjiWS9/F6W2aoXtafFRLIlwh1q1JBMrFg4/2/+moB0z7?=
 =?us-ascii?Q?ZFLNcy0ogdNxmqbrhHtL18JG2FaV+a/R3ESu2agGwhrygQKDidzImMRxP00h?=
 =?us-ascii?Q?93y91huB/AR4CEaFmGn5GenCySEJce8VWdLT1FXQ9W5RGfKCmMm0eRlx5/2Q?=
 =?us-ascii?Q?1Gyxsl+WQX8HVYQVZg+UFIe/WRqMYmR3xgJn19lhRfCQw9V0Ohv3VgcfA2Q7?=
 =?us-ascii?Q?dR70DVUeUOjHa+JufEUH2KmotIdYNF082ujcrzWEN3+XEh2j1CQIMnBTPqoU?=
 =?us-ascii?Q?+3SVu6+29ny9ckTJSrOFx+GsKs/cCCn872wZ7FxqxOkY+DhaT03ccxvPw+Bj?=
 =?us-ascii?Q?Om7VaxKhJuYxVb48eh2OAT+c6ubfo+kRED+A96hTTpfgHbWDDJrLo0uhjC9W?=
 =?us-ascii?Q?B4+2rZjJfFmS+WnN3TpV8+4tcboDCqD3z26YmJ8UepidDGkWEBwuGn22x6dQ?=
 =?us-ascii?Q?N8HTWZHI+LI1N/lXWa6wi/08JTsW4TRmKaD33zAZBXJTXvnEjF5bBCgyR0Xk?=
 =?us-ascii?Q?XiqcNCu29H87FT1ZiOLxHwbLxvN+EOUgF98YPWPiOMqyxq033TMtFIMxQq4Z?=
 =?us-ascii?Q?Bc1+jGcE6CNLMRKFx4XkAp3b4niTfowwSE/vQdQB7GhYPnq3fjOUxTKu1wza?=
 =?us-ascii?Q?1B1Vz6B4s76DcFtuQuVqSCoOVXZgmtk0W7SP2qP2AIvLVf+W/TwvFj5n2Yw3?=
 =?us-ascii?Q?ueAWX2m7gyaTEbEdoWdtjkYIV3lIkY/pD0dRvGmaQ1Dok6jKz8LtrGses45F?=
 =?us-ascii?Q?zCuhvGRmb5SOQyfgDaKnb2uv1gImMYRQaU9DJYYoBSi8Uc7CtW8toTrYXXP9?=
 =?us-ascii?Q?62NlFEd0YKTYl8/TWAmZhlVPxnZjRwdNWVBf78iEINTB03Me4ttgQWeC6WOs?=
 =?us-ascii?Q?7LPmOitKxmjmGJgAep32+ukt9YJd0eLF3jN3P/4VIW9hglzeBlMeHv+4NLbB?=
 =?us-ascii?Q?7awRDCw1K03++m+nwtkbrm+c3L0qIJ8wjwvL2WhrS5bCHx9WzN58g9mjDRew?=
 =?us-ascii?Q?B/y0V4La8dN+Tgtd/xhf40vuDMkmwyJtZJyWe2smGXGnP0zCgfZMFqaT9MQe?=
 =?us-ascii?Q?3G2XX7aU64EPEM2tykOdApsDdpKpd2Sp8JVUeqDDfuVJY2TvUZgOY080TO97?=
 =?us-ascii?Q?J2bqN3e8CvSm9HPgmGfOl3QkK221jPW7XDPz7ZHCMcAMyC01jS7l+g=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2025 22:49:37.7775 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d794c65b-0e10-42d5-e903-08dd3d928bec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7986
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1EN6qEy4HxoqKzW2ex62ZQJLB6uzvJaJxdb10CSh0hg=;
 b=GucLO+e+NdQXmW1K6y6ViXGGoTw1ltQ1ZiyjXscvLCNyg+ba9AHOr3FbakeYt1y6BARCd11IAyVnkgdst5a6it4egBiCRVU3lnKPLgh7t2376IR3EN4zqankocAEkDy3Ad+82mb1yU6jKI3RSWnWHXSfJQ9KaYig378whOV/tCk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=GucLO+e+
Subject: [Buildroot] [PATCH v6 1/6] boot/uboot: binman generates u-boot.itb
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com
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
https://source.denx.de/u-boot/u-boot/-/commit/a4c98119109a60b9b236996f47065aa8fc0de9ca

[Tested on Kria KV260 starter kit]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V6:
 - no changes
---
 boot/uboot/uboot.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index cb745413e4..efecf2ca47 100644
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
