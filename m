Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6693CD0EE29
	for <buildroot@archiver.kernel.org>; Wed, 26 Nov 2025 07:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B53DC83E79;
	Wed, 26 Nov 2025 07:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hf3D7MwkvHw8; Wed, 26 Nov 2025 07:07:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D83DF83E55
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D83DF83E55;
	Wed, 26 Nov 2025 07:07:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 18FB42A9
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 07:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A9736061B
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 07:07:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h02PTCUdElyy for <buildroot@buildroot.org>;
 Wed, 26 Nov 2025 07:07:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c001::2;
 helo=sj2pr03cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EA7606068D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA7606068D
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c001::2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA7606068D
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 07:07:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZJHHch2ttxp4d3TfsGnoqs8BTkHefqx+1bLy9LEMoZLJ8Wy4wCjVng2aAOpzaYoHQtqaGv56aXI4Y2psixOv2NXmwT/2qblx4LflD6TNyWyawPOsAsggSDQWeDiE2QcqkFbHd72g8fxqJ+BSkDo/UKBo5Gg1SdXzm7dzC9NrUAL/H++3Ww0uCLklGa7YtnFTyFSvJ9qNDj2PgxvA0eT15qYF+VZG+96g/8zKA+zPBc5RTrqmRYMKv8dpGRTR1Eeelx/FOPRDcqIb+xISuv+8hDGcBYXDfOuNbX0WxZDzlr5EKi8ArJDACTqBys/cOR3ntna7XpUeIHY2lr8467113A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1Q/ORCIg/gCPx0yvzEndxfxj5CcFtKNcnhExf5dccU=;
 b=BcTudK23HbIQ9jQDvnRIKS/k0nj/uPFn+rCj9pViaMM5NbFZSSfTyN47SpInwulhssFqQmzL+4SceLXPz+HOJWMHo9lbd3/y8rMxlwh6VYFvtCntCUp0FS28iJ0PW0SLOCXGcyr9GEUuulyIY/Gi0tEp1Xs4qqV363UZAuDSsiKXxXb8zZ5QwWn4ElVjcYg7XOalLS8fIIBAtaa74eZK6atBV/DbQtC0j/cPqEaD0Q0SCwajxOWiYgDzTZbI1pb41rYP33uC2Q7YKnfx16MDXyqh3Zmnx1Pnw0bs0bHetPG+Y8788T/WqZg3i/l5bE+KAFwllthUS2xj3eTuReY0aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH0PR13CA0060.namprd13.prod.outlook.com (2603:10b6:610:b2::35)
 by DS4PR12MB9657.namprd12.prod.outlook.com (2603:10b6:8:27f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 07:07:10 +0000
Received: from DS3PEPF000099DE.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::97) by CH0PR13CA0060.outlook.office365.com
 (2603:10b6:610:b2::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.11 via Frontend Transport; Wed,
 26 Nov 2025 07:07:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099DE.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 07:07:09 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 26 Nov
 2025 01:07:07 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 25 Nov
 2025 23:07:07 -0800
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 25 Nov 2025 23:07:06 -0800
To: <buildroot@buildroot.org>
Date: Wed, 26 Nov 2025 07:07:03 +0000
Message-ID: <20251126070704.867987-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DE:EE_|DS4PR12MB9657:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f7c3721-bdd1-447c-b94c-08de2cba6a6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|82310400026|376014|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vtYm3opN6mUF0bFLEvt7SycrcGcpqMUQsIinHyBUtn8MwBnVDxJ/Xgf5usGs?=
 =?us-ascii?Q?kmCqIsSL0ymPmkKZOacJZzfq2KKs+UAah514W+SPI1ruuZqMtgUPF9E6eXVB?=
 =?us-ascii?Q?2V54LxfU1IBN2USQ62brxh0z9u24csARgW76bPDkZl2D/Zk4uB82JIXx82rs?=
 =?us-ascii?Q?SBEbnF5bE87mvHTMhtu2HQr7b5ff1SSB6phFjZ6QX7C5nM8TzNZv4tDdoKAQ?=
 =?us-ascii?Q?JR99n7fO/zpCw4amqhDvHC/sqjBCTs4RklC+KNCVRunkV7dKvS/zMd5YREYL?=
 =?us-ascii?Q?M/vvNgnEVRE6DOrvS2Ty7mpFQGunwHSFV1XlsLMrql2yj3bjo8c4HICroLdv?=
 =?us-ascii?Q?S32DPHKUqrvs/6VFUwCowBblj+W3BvI0sx8M1XVmBjOSbypWMFrnP83BYj/v?=
 =?us-ascii?Q?Tmd+08ELyAu9RiwfB8mmZawUwkI9gmv57ezs9hw2UjXEXs6H5ygqGunmEGgH?=
 =?us-ascii?Q?4yWtpU4i2i5896QaEcKRyyiw09WUhwMXNHYVIPG3B74roflks8o1S3KsVIuk?=
 =?us-ascii?Q?Hc8QKNnw7us4NvBnfKKiNYvGCxoLT0NqK2V2tKjLrlp4VJapDFHmlDm1vuqs?=
 =?us-ascii?Q?zi/DZf2QKZX/uxRt1EtjDzYqTz39LjfHSzR+uOXcdd8sO4ZV7KDL6ma+Bd/T?=
 =?us-ascii?Q?5WrqjDsGEYubYMocgdqVlp21mmEDiBhjasadC4iqO6S3YBJg9tWbX8ftyRps?=
 =?us-ascii?Q?aAlT0/PJWJcnsAfq3I3V0mYSdRPY6rFk8c3eTK1GuYo3iTdIhiSb9uJfddqi?=
 =?us-ascii?Q?v0jigS3OeWWwVu8cIIgXcYwKJxEfiEK175s3S1T5mfO2xnW07+wZ8Qj9vFze?=
 =?us-ascii?Q?NriREx4Ncpdnoq3yaRc4n3+7amAmyRQPHyyjWIdb78mbUYWcvI5OPHhU2J6i?=
 =?us-ascii?Q?fLKWX2j3yynl/zQKKPFxQMR8vhq7IoEQ4VaTVsPD7gMjzrYjdfKWTgNd1NnE?=
 =?us-ascii?Q?c14BmLKScVB9vFaOgJrx+9u5efLsHon1x6d2E7a4VtDqiduzsKajo7x7gMta?=
 =?us-ascii?Q?bNO8hZmUgTnr9c2VhDxIfeSOqaPgamJc4wS1X9yKHIi5welVVFvvDAi9yFXj?=
 =?us-ascii?Q?SUaG7UgmYg2w+cwH6IJd8+Ix7GZn0hwJIKVDoADe2M0btqPwxdl6ITvDBVlD?=
 =?us-ascii?Q?ooTOV4Rb2mI0hfcSQV0P8PWgDWKQpLSb4DEHcqZorEwI7LENef4h5QF/p197?=
 =?us-ascii?Q?mESMvuXoq6C9lq1n99S7AnQ12GaZATZpg+w33UjIdeig7zhBBujgqCgDAHG5?=
 =?us-ascii?Q?QP0caDhmGzYvYoYjJLlKpxJAOE/wSRldY6NktrEVzTMCWNvsU1FrkY3yIOl8?=
 =?us-ascii?Q?nN2wRuIBiydnbxXlemc1ypE9seCPBEdUB3siLII/7EhTaCh+0sNO/7cAUSc4?=
 =?us-ascii?Q?zRLrJr2Gpxa5cxGPT2/DRf2VC0mbtwesti8v8F9WXq1xKBwM3dqnk0bdgquc?=
 =?us-ascii?Q?FIl0r9KSxToeUtXlPj3bp6nrtuVlAYII9zL+ne5odN1YyPbandtOnpO3Qtil?=
 =?us-ascii?Q?8o2lI7AA02qZOXmJeyPlKd/TT717IbABVCHvt/fwUInhZqYPjiqG8WhKM2FU?=
 =?us-ascii?Q?3WCAK/DBEAO+AL98p3oj7lnUZ7UDj0jkEKlhfRDp?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(82310400026)(376014)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 07:07:09.3845 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f7c3721-bdd1-447c-b94c-08de2cba6a6d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9657
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1Q/ORCIg/gCPx0yvzEndxfxj5CcFtKNcnhExf5dccU=;
 b=DNKkN8I24KXtMRKTDKFtpYptEbDpB41PVtM/Jw+k8rGiXdj7xo3tBMiwk3IdgFAV9HOVGSTTRVEE10Yv9aS+XPqdTXrGNUeHoQp+vGsgbRaHqTP6Tv3z+FgGaYRjeX/Rq63o3sh6hQdKXS6xl0QnWlv7ehw5jfUMdrln7onvG9E=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=DNKkN8I2
Subject: [Buildroot] [PATCH v1 1/2] boot/xilinx-prebuilt: add xilinx_v2025.2
 hash
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

Add hash for xilinx_v2025.2 version, so that example defconfigs can be
bumped to the latest version individually.

Since the license.txt changes with each release, move the hashes to version
specific directories instead of having a generic hash file.

xilinx_v2025.1 hash is moved to boot/xilinx-prebuilt/xilinx_v2025.1_update1
xilinx_v2025.2 hash is added to boot/xilinx-prebuilt/xilinx_v2025.2

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 .../{ => xilinx_v2025.1_update1}/xilinx-prebuilt.hash        | 0
 boot/xilinx-prebuilt/xilinx_v2025.2/xilinx-prebuilt.hash     | 5 +++++
 2 files changed, 5 insertions(+)
 rename boot/xilinx-prebuilt/{ => xilinx_v2025.1_update1}/xilinx-prebuilt.hash (100%)
 create mode 100644 boot/xilinx-prebuilt/xilinx_v2025.2/xilinx-prebuilt.hash

diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.hash b/boot/xilinx-prebuilt/xilinx_v2025.1_update1/xilinx-prebuilt.hash
similarity index 100%
rename from boot/xilinx-prebuilt/xilinx-prebuilt.hash
rename to boot/xilinx-prebuilt/xilinx_v2025.1_update1/xilinx-prebuilt.hash
diff --git a/boot/xilinx-prebuilt/xilinx_v2025.2/xilinx-prebuilt.hash b/boot/xilinx-prebuilt/xilinx_v2025.2/xilinx-prebuilt.hash
new file mode 100644
index 0000000000..9828b6595e
--- /dev/null
+++ b/boot/xilinx-prebuilt/xilinx_v2025.2/xilinx-prebuilt.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  d292a52ac167631860b5e9a8d8356946289da164ddde4c5393977dc1652dcadb  xilinx-prebuilt-xilinx_v2025.2.tar.gz
+
+# Locally calculated
+sha256  e7ed8599c0cbf9e28d07883f94ee6ff694f6a702daa56c75b2cf4b30105baecc  LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
