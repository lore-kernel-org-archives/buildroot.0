Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49E9CA0EFA
	for <buildroot@archiver.kernel.org>; Tue, 26 Aug 2025 06:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99F966F764;
	Tue, 26 Aug 2025 06:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1lBSWIiM5g8c; Tue, 26 Aug 2025 06:09:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A36706F761
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A36706F761;
	Tue, 26 Aug 2025 06:09:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C350DCD
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 06:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A14CC42B63
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 06:09:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R4ThkyDQ6e1K for <buildroot@buildroot.org>;
 Tue, 26 Aug 2025 06:09:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2409::62b;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B17A842B0C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B17A842B0C
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B17A842B0C
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 06:09:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I6GBHa5XjNpqAnfenm9WdcB3q4KXiG+Te5Mz3RXwuRvQMVMXGqbGb2Ehk02tpBW3Hrrkw+uo3tQMWIo60Al3CAF2if7edUI3N38sbtAN62Ept3IHAk6354Me7h8JIv2WKWzR25pKbfRs0DYwcTwx8SIbLGA5DrkeNU+FCiC1ekwFTym6MwDEht9ptMNHMd+ENJBPC7hj9Kaq0c8ovQYwiHDCqWTOp95cIpkKNy7RT8NKcBkg5l/jx8DKsrlDQSIG/VOtk5sCuvPwD5ZbeLUIT/htxKCqLZvi2JCAvempD21mGYm1mlQ4bEhr8rEs/6EQ8S/ugeYq+AzgK4J2X8oa5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9Mh+2K5/cWbV26qGD9SuhqXtWL1R5DT6J1WnhE0qNk=;
 b=N5bslUGMhF2BWmbJJZJVLFnaboTVXb8PZuHGViMXczBJNO+mqO4aARkUCyZWR7616qeOqvPkCCjgjkZQ0VXbqBtqG3KdhXjWmO5Xsr6x8zeBWxSzte74XSznBm8rNJ5EuhB5ggQAndySfncPdcG47eSgb/E0wChVtKNM1YG1ELnB6SifxepkiT0GlzJf3lgVHIZgpYYIxS0QgvHg2yckNY2L1YqrC2jhfCqgpJ6qGftA8ZkLEdKy/FcThGuDEkV1jBQuJs+WGODSv4YLUnbXLVqzTupGGfSdGMKiphIDqkTIuGIvnoxbVEgToU4dLFVLNlbWcory7KrTOSnQIRCnww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MN2PR22CA0007.namprd22.prod.outlook.com (2603:10b6:208:238::12)
 by PH7PR12MB8794.namprd12.prod.outlook.com (2603:10b6:510:27d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 06:09:52 +0000
Received: from BL02EPF00021F6E.namprd02.prod.outlook.com
 (2603:10b6:208:238:cafe::d9) by MN2PR22CA0007.outlook.office365.com
 (2603:10b6:208:238::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Tue,
 26 Aug 2025 06:09:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F6E.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Tue, 26 Aug 2025 06:09:50 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 01:09:50 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Mon, 25 Aug
 2025 23:09:50 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 26 Aug 2025 01:09:48 -0500
To: <buildroot@buildroot.org>
Date: Tue, 26 Aug 2025 07:09:40 +0100
Message-ID: <20250826060943.1394934-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250826060943.1394934-1-neal.frager@amd.com>
References: <20250826060943.1394934-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6E:EE_|PH7PR12MB8794:EE_
X-MS-Office365-Filtering-Correlation-Id: cbb3b9e2-dfa2-4245-0683-08dde4672abc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|7416014|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6nFPg+ucZBE1V30MGEmpAYXR0KwgPLpBbSElVW8ien/CQRiJly8K7UzDta5n?=
 =?us-ascii?Q?i06hBY+OyJLwfYOLRKNOiw4el1cGYGY80drGP6n49B3lrtFJq6Ub90sMMMnR?=
 =?us-ascii?Q?INCXe+eYkvgfKr8g9oionI1DXoD8z3oKI2htsAtRzctim5VhdqoErS/WZdYn?=
 =?us-ascii?Q?66POFgsVhOjuILm1k/+9MNUmIMu/15K9ZhG7VOoRxF85Bxan02m5rL9CBaJo?=
 =?us-ascii?Q?hvARmtj3Pa5NOWc6AZKW6yUlcyRiNkewI/GCcMYvDN4b+e4bSmUDE/7Nz8jU?=
 =?us-ascii?Q?4/nuTyglbwDm5gTFzedWkVRmQ61V4H+PVVPH30UGVxT0sRRK8k7EIl29BFUK?=
 =?us-ascii?Q?B+tYWkQ9VvaEohGyiPmzQLT4MkZhmkhSQZL61CVwFnXJn7SoyAq/ER6dbLsP?=
 =?us-ascii?Q?GjYLMGq4VVcJMiPNp/p0w+wbLBuLvTlwn75eSzeHksPxuTgl1WudZZneKUB2?=
 =?us-ascii?Q?DSUGOJVhYYxEljkPFitfKxS7mvlxqhi5k4gRfO0obEzypDRtaFvrr5QaVPTJ?=
 =?us-ascii?Q?bqftuBHqGEH3N5tbzcUFHNFhshk8VIy6mPPvAvlkTVMprAJzCRKat4nBeSU2?=
 =?us-ascii?Q?1lymXM4oAwfnxccxCkv7KCRfJgQeWP/ySPlNVE26xPChDLrtp0d/aoTUxW8t?=
 =?us-ascii?Q?xo28RMqgPi9LkZoC3Miyu78mQmq+thwGkL9B2UfKC3NhNx6WKZxkjV+Z3Gra?=
 =?us-ascii?Q?qOxMzciBSKq2NEWg+Zz8gb4ogYsDy9YXkVbUooEvW3R2c01bPY5nDycJFLcO?=
 =?us-ascii?Q?MSvZpEGQJgy+RZ3DcLUx3GsBKRdBcE6mUMedpzHkEwfB5O9+0/bNc4E4uQJ/?=
 =?us-ascii?Q?EdTOOSjFpAY01iEgw10vdH95TqM+xz173voqxrW+muLkcLcPgpJ54EigMAPG?=
 =?us-ascii?Q?NfM3/g1H+nmV6eJW5fUy2RhSpqyECcg4D/MxFsTyeNaqgK2wnXRcyCImVqMz?=
 =?us-ascii?Q?FpUl16+pxerqjUvKdHV4kFB1il5w5dZkXffoX1LfL85VZxXH4IT72/KINuDo?=
 =?us-ascii?Q?1Y66kZs6NcJcXxzDxryZzUQAk8FGuvP2pO96l1YPgqstVfH4aVO1pxlmB4ch?=
 =?us-ascii?Q?rkF61DmCg+F4XrE0HVgTBcZgZFfhFItl1IcKEv3236wg+VX4i5iB7++GBB+w?=
 =?us-ascii?Q?KpM/RAoqXJ1tA/aiG6xLspFMky6WxFOUj/WyRX0MFInyqcHomx3KqhYR91e0?=
 =?us-ascii?Q?TDLWhDYfTWej+3udGc5HFH7d6QZPU5O4yLuBi/Mafgd5PUSLLeJqBmGAKqlC?=
 =?us-ascii?Q?NhotChqulxxACT6sTESfDDilXj+/AWmJP3rfOCrGOqYFH92mHMMMbnldn7Vl?=
 =?us-ascii?Q?+IpNdwDIpGTQGixaIxyDjPyK1KnBavGb4JfBF9JJTkIjEwsxn7xzCeODtxir?=
 =?us-ascii?Q?U2h+Cj+zQN+XsZJzZDoWnJpgdvsEA/FhUUq+PToY2bCp2iAELXqFIsFMpL8I?=
 =?us-ascii?Q?e1CfOGCcS3uYKVsofkXC6X8GPsmIL98MSP0M4uASxeQ+OpwJ5f663AN7s3dN?=
 =?us-ascii?Q?gnNeeWu1kk+dHabqFQ3KA1aTh2y/eR5yhY9Qte9GhYSSBKDC0fANDpOh7vun?=
 =?us-ascii?Q?4E7Qtns4ikBU2GogP1k=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 06:09:50.5770 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbb3b9e2-dfa2-4245-0683-08dde4672abc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8794
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9Mh+2K5/cWbV26qGD9SuhqXtWL1R5DT6J1WnhE0qNk=;
 b=UFzLUgc8d4k4dZEptTMKLkSX8gNLPWCSwqKF0zmeK3vJJrnGzE6vlWXcfVUKIC6dmVt0aRnLDj5YXMbBvzTjJrt00cV/lD7A5RU3d9OVSiyDRDJfZrXWRWUEfNgMCKlcgsK8bjOpOCVp4D6z9D4N1CEhZt64dpWctd8qWMm/H94=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=UFzLUgc8
Subject: [Buildroot] [PATCH v2 2/5] boot/xilinx-prebuilt: add hash for
 xilinx_v2025.1_update1 tag
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
 yann.morin@orange.com, brandon.maier@collins.com, manikanta.sreeram@amd.com,
 ju.o@free.fr, Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds the xilinx_v2025.1_update1 release tag to the xilinx-prebuilt
package.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- new to patch series
---
 boot/xilinx-prebuilt/xilinx-prebuilt.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.hash b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
index 9f12e88e7a..a8dee8f129 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.hash
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
@@ -1,5 +1,6 @@
 # Locally calculated
 sha256  b9e2572885ad12243e10d48d9fccb24771a528b9f27aae1b29b45f0806ce9f1f  xilinx-prebuilt-xilinx_v2025.1.tar.gz
+sha256  48fd698a16f79b9a828c35ca5b2b50fe832149d1a2938c94c0bb6a2e249b0bed  xilinx-prebuilt-xilinx_v2025.1_update1.tar.gz
 
 # Locally calculated
 sha256  7b2074b607264a07347e1a7ef0323229585942793469f34b2cf9628f7623e05f  LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
