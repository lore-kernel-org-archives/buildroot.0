Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F0CC5B549
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 07:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2BAE60E06;
	Mon,  2 Jun 2025 07:56:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pWH9s9Imxrmt; Mon,  2 Jun 2025 07:56:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D42BF60E0A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D42BF60E0A;
	Mon,  2 Jun 2025 07:56:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 27874127
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 07:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DAF54057B
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 07:56:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v-njewLyAN6f for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 07:56:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::622;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 301054059A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 301054059A
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::622])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 301054059A
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 07:55:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wOWcRebgeekEcKbN9ULnkp0+9BL5PUyIXLnVWw2sqUvYGatnyPetxvZ4jBNAqFV/+jwKN45/qV73L9Eah7UU3SSbJZ+EfB5fgp5w4k/IrSQUFWKuohpYBVHj6225rLYSSl56//7JhBeioOZ1v4RXZMhXXm3vF0lEE3bISOSclWhNS/PAkbxR2XOsrVi0hPyuoCsUujvGp8iaQy3KCvSZ+NBGWIgVjM86LO2YtT9QSm+hJGZ/v3O7t8Fo1aC5KjbBxu6SCz/ph1kOZuxzYP5FRudGMHD92Amf8nST53b0fii/6HGRg6VTCWmTFG2nIQwzTS1htGICJVln6PQk4EgeVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0O0PVk6E3o1qS/E19hEYtRzYRrDDTYeL0viakHdpHI0=;
 b=tgOndTYlrPRp2yUe+Li3r9dCTcSFqoVNX0ZCQRjVH+bakxxgVKRYWj2Ivswoj2JeIaHEtx2R+3X/UoOOcS8NXHzQzV3j+Pewojjl8ktM1JOQHXj9Grzvid9VNJqIhdnDL8ZzNlWgREUav95AJ0wDk0Jv+nO7y+zdhItj1JNRqBlgnVSUzM4gPYi6SnTjHUHO2S1D1ZerNfn+HFV2Vh23QCi9N6Y0itAjDgtmcFzqrNP3Ij05VhD0OxAOI/XJEdD/rHsViRlBhBKQWj4ejFq8dhgxj+vGfDiAHKmvo9T/fNyyfxHduLxuMWHsaFZ9AX6ZyD+YgWQApvL3VYmsp7kS5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR03CA0065.namprd03.prod.outlook.com (2603:10b6:303:b6::10)
 by MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Mon, 2 Jun
 2025 07:55:55 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:303:b6:cafe::e2) by MW4PR03CA0065.outlook.office365.com
 (2603:10b6:303:b6::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Mon,
 2 Jun 2025 07:55:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Mon, 2 Jun 2025 07:55:54 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Jun
 2025 02:55:53 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Jun
 2025 02:55:53 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 2 Jun 2025 02:55:52 -0500
To: <buildroot@buildroot.org>
Date: Mon, 2 Jun 2025 08:55:50 +0100
Message-ID: <20250602075550.3792505-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|MW4PR12MB6873:EE_
X-MS-Office365-Filtering-Correlation-Id: 82c99ac8-1c5e-4c28-13b7-08dda1aae6d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Rvjm0nmsTY15xs9cFdTZxx1ddUYiLBz8pkbRf0/AFZcvHjhXio7cmyyhxm05?=
 =?us-ascii?Q?vzn+QTd8H3nq93pT3U9Zf3TacCw3i5ATXBcwZ8qRPCmPS+eGulfwc0V85JeO?=
 =?us-ascii?Q?VvUV0X82DrUUz9Tver4aqwUnfpWJcvOfeBuyJ6rki+XW2j+mAy5VDK7+5DmU?=
 =?us-ascii?Q?5V69KLDbhiujNAsqL2msXqFibtA0Nzm1zk8zFLOzWzm4RquddWbtU2tuiLqK?=
 =?us-ascii?Q?Yfz4BibhF892w9oExmy6zS9Mla4FW5DAoDYe/Thyt/2vV+KdyyodYhjIgW7R?=
 =?us-ascii?Q?/EgadusQGRFUwLyqKCG7qteiPbnf9nPctuwoMPThnwZjcVfmAHwbp507x9iD?=
 =?us-ascii?Q?EmKno1gyuWpX/dbsQwsN+EjlREY2vkRR+naFIHZnw+VgpOm0rcwZR7yqgxhG?=
 =?us-ascii?Q?nB+ibccjAlHfPtySnN75Az5y7P4Gu0AzknilWa3XpLC/tdQRRNWMABx4PboC?=
 =?us-ascii?Q?BX7TwDxYMerfZOuTDt9OW8biBXIAfVz/wR3jabHMfVom1f92HLtCof8kE1pi?=
 =?us-ascii?Q?TOdGaB1bKd8fxriDNcI7So1uX51lztZ3dBfO5n6SrsWEioblSVvfrrJDHTCX?=
 =?us-ascii?Q?JwwnQkHSVJhwoUSPIs7DjIr2jLTf0KOWWqaay7Q7rC6/mWHyD6Zv92qaT1oD?=
 =?us-ascii?Q?+V3OTqCLT6qEChHv1+19Yfpely4BPjQOEj4K5Z4xYUODprjDqATdS9y3p5aR?=
 =?us-ascii?Q?CpHDuhED/DFG8AFoONPyAZrk9irpmnrqF8zxMkEI5MRawOc28y07nKTrvK9s?=
 =?us-ascii?Q?KUq8YfrmaTvMrEuhxEys2s7S5bsfVnlxedspOmAKyJi+4R1VXEiuBi7TLj+G?=
 =?us-ascii?Q?nTEMBExIK0kGIrphuQ2BtFuYtrpl3An+H8fNd5zLqqkLJP4Tv1HSTMIv+TsW?=
 =?us-ascii?Q?vw9EYVaWfJyw5CGZoXM1qcJll1na8Sxq81obAPlbQYHRKA0emGBNr2hoYEPo?=
 =?us-ascii?Q?HriulBOzbtPO7sOXRBgohvRH+cvXWgL67b5V6GBSmgMXOaG3fZYWvC2iP9Xw?=
 =?us-ascii?Q?xT5md+veipCHiKaQwZigEN+irSFusG/iRRH2DhW+lSHdr8mnC/StyOIh7EFf?=
 =?us-ascii?Q?AT21qhyg6wMHeWvx7c7LGr3gaavyyuq5kn10j4VmjoGymwYh/RUWe+uaWKqJ?=
 =?us-ascii?Q?+IHFuwy/YFCFyfJuYNOEraDoUu7tCslv+nYZNgWUD8XgbNwc8qJWo6W1LDnn?=
 =?us-ascii?Q?iJ2Bi4ZZ0srpW1n4UI/uYi8m6JtUZfGA1RUqgv5HUyKjwtPvM3i8GSzNVSo6?=
 =?us-ascii?Q?Wr/f0MuNeWMQzNR6L30Cd+xaYVgIppIO0vpMgPBoqhdlS+1slezqSm4YYnLU?=
 =?us-ascii?Q?UBqOSkF2HGO3Q3JBS6ZPFsY+Xe/h6CHXX7m77qaW4BZ6mPPfH/AClqahh49E?=
 =?us-ascii?Q?kb8KT0ywasBSoZ13ZpvuU/7GmFD6n/BNwie5k0JJsaJ2FcwD/cxajnIFd1j0?=
 =?us-ascii?Q?/iVG1XsBPyHewFy7sCbtLgwa2tzU7VBJaCWJdtqgexRluEMm7SWKjjYRVcBI?=
 =?us-ascii?Q?Fm6z6yKFSDzr/RE3cgNa6MCTlMCgl9g1ermyEbXMxMyPmEfIgFcHWDxFJAbI?=
 =?us-ascii?Q?WAVwHxGy6Qrc47y57ww=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 07:55:54.4710 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c99ac8-1c5e-4c28-13b7-08dda1aae6d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6873
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0O0PVk6E3o1qS/E19hEYtRzYRrDDTYeL0viakHdpHI0=;
 b=CR1+V7K07lN4yVWXJtMiiRjAcOha3veoh5+PmYq+rzY2WpFeKbSoRMI4Fyuf7Bg+chAoJJ8Brtcb3vxzEu3+/Ss9JPyGV9srK97SgSJX9yeGfhXzjDz189OgJzhDHqreffNu0ryz5tDEvM+EufXwdaSJJLXyeRsy7jxDIm/Rt3s=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=CR1+V7K0
Subject: [Buildroot] [PATCH v1 1/1] package/xilinx-fpgautil: bump to
 xlnx-rel-v2025.1
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
 Neal Frager <neal.frager@amd.com>, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the xilinx-fpgautil package to version xlnx-rel-v2025.1.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 package/xilinx-fpgautil/xilinx-fpgautil.hash | 2 +-
 package/xilinx-fpgautil/xilinx-fpgautil.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xilinx-fpgautil/xilinx-fpgautil.hash b/package/xilinx-fpgautil/xilinx-fpgautil.hash
index 1329b9ad70..d214fd4269 100644
--- a/package/xilinx-fpgautil/xilinx-fpgautil.hash
+++ b/package/xilinx-fpgautil/xilinx-fpgautil.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  439a3681d8efa9641ab39c7645836b9ac78b2fdb36242f9bc94c1f3dfb2d9c4e  xilinx-fpgautil-xlnx-rel-v2024.2_update3.tar.gz
+sha256  a0185fda33a538379eb5ae48253f721037485be85c51555e2ad49e322d389429  xilinx-fpgautil-xlnx-rel-v2025.1.tar.gz
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  COPYING.MIT
diff --git a/package/xilinx-fpgautil/xilinx-fpgautil.mk b/package/xilinx-fpgautil/xilinx-fpgautil.mk
index 6f42b4799f..d41af96ee5 100644
--- a/package/xilinx-fpgautil/xilinx-fpgautil.mk
+++ b/package/xilinx-fpgautil/xilinx-fpgautil.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XILINX_FPGAUTIL_VERSION = xlnx-rel-v2024.2_update3
+XILINX_FPGAUTIL_VERSION = xlnx-rel-v2025.1
 XILINX_FPGAUTIL_SITE = $(call github,Xilinx,meta-xilinx,$(XILINX_FPGAUTIL_VERSION))
 XILINX_FPGAUTIL_LICENSE = MIT
 XILINX_FPGAUTIL_LICENSE_FILES = COPYING.MIT
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
