Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F100C02181
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 12:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4B82406AE;
	Mon, 20 Jan 2025 12:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bz4Jl95Z6d1u; Mon, 20 Jan 2025 12:43:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E130406B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E130406B1;
	Mon, 20 Jan 2025 12:43:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DBE1D7
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 12:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B131812C0
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 12:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aELm7FBkDW9L for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 12:43:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2405::612;
 helo=nam02-dm3-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 33FC08125F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33FC08125F
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::612])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33FC08125F
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 12:43:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aD/GE3JgXMeVKXATscitTJX+v1NJ9iRl5uYtDbYvXM6v1po+BqBoMZpSBNRmxhbpR99uyTCXRj5kOEWLPZHulj1a18nFsAU/PJD7Yp1oejkLPNTVDaMFulsc/6oyMi1uF6pKhNuDb3DXSKvkkwOffjiBumP30vc9ryZJqC3wVDPGwkj0MD2UI2hZhUade/nEpB8cslvSCZxNn27zzuswhgM5JWhzfY1qanecw6IaJTRHhb6qXaBi/MXpokjwTE8e9+G+O+8+Ni9awuJbjuuUgSx3zKg+0iLgup3AdgDCKe2UIqoj6Rj8yDO0zc9Pw3NJ+3wVnttEJQPvZwipG6GJ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5r9C+ZgZkvDbsHt3xarWNcHsafQbEPgLUr2Vn/26wzg=;
 b=NKb1tDLjOfZuL8vsaXEj+EAkPz0XzsSxdnas1yiDeBIgFd900V6kbPVtR6CbAA0VSwoVZdqw8Xl9GVlwQIqtv2OnZ+ViJB3yK1ihOKhH16lC1GeRqODvOvJIoLvud8RTVta9hJxtWfdxYrteFedJ+7UB3xHNIruWM/AoxzYDv1yoecH+qTiye6nrNzF92nLza6C7qcfkgwa+BSgp/DijjQbecL75UmsFsBw2VZt/CmcJsclYjv1VvAMSGr9SpDX+Ua7m3TKeCLgDWvH0LSPKnr8uDGf+Hx8/PuIe8m4HZKuDVgi7En2umkF3UawI2OL7kwa9J3ezlsQfeZJj30dOyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN8PR07CA0010.namprd07.prod.outlook.com (2603:10b6:408:ac::23)
 by CY8PR12MB7268.namprd12.prod.outlook.com (2603:10b6:930:54::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 12:43:50 +0000
Received: from BN1PEPF00004686.namprd03.prod.outlook.com
 (2603:10b6:408:ac:cafe::ed) by BN8PR07CA0010.outlook.office365.com
 (2603:10b6:408:ac::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Mon,
 20 Jan 2025 12:43:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF00004686.mail.protection.outlook.com (10.167.243.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Mon, 20 Jan 2025 12:43:49 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 20 Jan
 2025 06:43:48 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 20 Jan
 2025 06:43:48 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 20 Jan 2025 06:43:46 -0600
To: <buildroot@buildroot.org>
Date: Mon, 20 Jan 2025 12:43:42 +0000
Message-ID: <20250120124342.233492-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004686:EE_|CY8PR12MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f1c60d4-f79d-4c1f-1ff9-08dd39501663
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dp70xOIFBIn41TGXsMznOQdpkwG+XG2ey7MqtKzIjb1OEsqFoZY9Tz2PGcCv?=
 =?us-ascii?Q?J0M7zepPopxMrpQVoNulmp+2vpVpOkihwma7826K7Uvepju3wmP49waJvmRQ?=
 =?us-ascii?Q?PZZZ5R0o0W02h09lvBhkY1pbojElOdCMChjZSqH0IR3A5CUFwhZuSo4ExCzC?=
 =?us-ascii?Q?RepRkjNITMtE/W3Qgqg9YrLO7QSzV7MVrAf9Czwwu9PQLoi0w7ybLPSciXoS?=
 =?us-ascii?Q?zKmRQc1ixT6Mh3cLItzQwAp/K/aZ4SUagve9SZv/v7k5fP0z0XFPeOkvJAxK?=
 =?us-ascii?Q?glNpTlpN+HiIHJ1vN9ddQC1D1f9QKAZJpb8qD0Z8ljrhQlkak9hvp4C4AD3I?=
 =?us-ascii?Q?i7KhEkTmGOJWFhKEUcQmZcVsxUBsnXz46GhY/d8W8rkel6ZpSnu/jvkN/nT8?=
 =?us-ascii?Q?QVfMWGUpNfJNlUw/7Tgb9hcuOucwfme31YKNzsehU83nbjFw1P+kflW54sK/?=
 =?us-ascii?Q?yqj4Ry4gpbfbhdDPC/3aNbCenXHsrD0fyEmquRNiKjyn7P4e4u2c9HnCHfFx?=
 =?us-ascii?Q?SxT7gpscSXJyPSOd1qgMdj3jga5O2FcXQVI/39tpcZGSH3zI0z8zQpY0h54Q?=
 =?us-ascii?Q?wn6zRORkAtjCRHRXI7LyhG7KoYRQJs9Hffd/uXHBz5rOGRCXMrCPwSM2FDwG?=
 =?us-ascii?Q?yNxOKCh1IPuVMMFBt184A5At6X7HDDs0kWksjDU3HwG3F3dJYC4dJP1z8NFu?=
 =?us-ascii?Q?99PtgNYgNQYe0vVEganRBCmBtbOFCaYzi9UeDcPy/krO16lfLt3gJl+WlzTF?=
 =?us-ascii?Q?m6C9DwDvUnBT0Nb/cXuZ65WtE4KFv9qIX2/7ymR0GsyBtZYa6DIjDsefDtMt?=
 =?us-ascii?Q?DDn6/P8Iyo7hEzJu4dQrl6n/ImoMQMF39DeqBDpF07tFOb/FO+NflW8RT5os?=
 =?us-ascii?Q?IJWiixTpjAboqU445fA01kPWVxxLVQyg2fRo5yUcCYwWQxbdvRtNE2Ycm9Vr?=
 =?us-ascii?Q?DtIPSb0l/2/0VUUqDNKJ6sr9KANzKjqxbAi+RNjmDCwSfRqJ2U1TWhSQ3J+Q?=
 =?us-ascii?Q?WVnvWoS3DzVR0QQnmKzWHsYTsM1y32RemN4YFAPzpPbcstGUQNuNxQjaFRqN?=
 =?us-ascii?Q?aS/jxO53ZxXA1xfVvM54j++1XVUQeUP1HvPMQQB9Ai34rffxGIzBvMAT/sFY?=
 =?us-ascii?Q?6JBQiEqTstcSBSmEFRXazO9g/0une/fJkTWJ6wF9SO4EfAxrbDYv7ajBghcW?=
 =?us-ascii?Q?/9EabQdc4xEWxp+GwbILddHMUyuPByMcMPnWjcZzBskiTzluxuPKX/UhDYjZ?=
 =?us-ascii?Q?QGuGJ+lbyQBZes+HLZKNuaxulpmJYF5axSIUnRfvkvQ76lSFMucJ6R1o+eCh?=
 =?us-ascii?Q?0eJNcjqZe1nhZyLpijb9OVRHF0vU6j/jJnHdASRob9pPg6DRJecH3dHbp7or?=
 =?us-ascii?Q?q7J5FsWKu/fgKrJXKJIxejBeY3/6CLOXOVhSlp0aTKPWOd+1T+QkSD7ZNzgQ?=
 =?us-ascii?Q?f+1GuwJ7RM39B55tRXXJr0IoTYs16Szadsq6GqfMEPK+Q1FRUtoyyXqXaphY?=
 =?us-ascii?Q?Z5xsbK/G6jIokN0HTTGx0EucRdm1uldxnleA?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 12:43:49.1459 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f1c60d4-f79d-4c1f-1ff9-08dd39501663
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004686.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7268
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5r9C+ZgZkvDbsHt3xarWNcHsafQbEPgLUr2Vn/26wzg=;
 b=eaov+gYbS5X6BSvmOxyvGRL+i4wS9ZER1WFMIBkNDQlV5nKMrZLd3EH+ABGsX4RwOLBkjP9wtbeaE4keAgMGfg+Afz9lvhuJmUreAP9yz9L/Z+GylXw8li5oD7zUpuu4tATGpElnjgdZrex7Wp64Z9zUIk6hga+7YVeLlxr0Pek=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=eaov+gYb
Subject: [Buildroot] [PATCH v1 1/1] boot/xilinx-prebuilt: add hash for
 LICENSE file
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

Add hash for xilinx-prebuilt LICENSE file.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 boot/xilinx-prebuilt/xilinx-prebuilt.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.hash b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
index c955cd79f5..048b93dcf4 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.hash
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
@@ -1,2 +1,5 @@
 # Locally calculated
 sha256  7abcba4e0e44e3a4adf9c1f971d918575226d7604dfd64a386baaa00c1c6c35f  xilinx-prebuilt-xilinx_v2024.1.tar.gz
+
+# Locally calculated
+sha256  7b2074b607264a07347e1a7ef0323229585942793469f34b2cf9628f7623e05f  LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
