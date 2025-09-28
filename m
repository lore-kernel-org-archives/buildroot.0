Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABFAACAC5B5
	for <buildroot@archiver.kernel.org>; Sun, 28 Sep 2025 14:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6213C80CA5;
	Sun, 28 Sep 2025 14:42:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Bowfmbod1Cm; Sun, 28 Sep 2025 14:42:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54AC180C93
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54AC180C93;
	Sun, 28 Sep 2025 14:42:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F00E111
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 14:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64FB94057E
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 14:42:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bJgZo913y4bh for <buildroot@buildroot.org>;
 Sun, 28 Sep 2025 14:42:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c100::f;
 helo=bl2pr02cu003.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0005040533
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0005040533
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c100::f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0005040533
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 14:42:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nrd0iIvxMeZkjTw5qB5cS4Jo8386O6/VmrNjk64uGSKS9jwWE6K2mnYt8DCSuGqJ/JAvYuBFdM6pveBa/tlFruTY82deiWyn7ZaYoP0bT6VG47QJR2H0iCa/55UJGG7vESQXRI4YTyEJF5EyPy1XCIMeWU598jaRfDttYlydtuK11b3NdFN1rdrr52R+qc2Dxf0Yeb42Oc2wPBReBV4rC1ok3BjTZTnSFIsaC37g8VLDUBPrCRfBOl3iTIcf8cmFO/7iypgK9RQIg4XQtvnLdKAsHcpPx/U5oREheHvAGi9Xl393dwISdhbJviUXYgq1TRqmvRvQn79BP4X5VNE3aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UASMaDpEjqrXzMv7oH7tsZ4cT7V0GOMSIvkUdK94Er0=;
 b=GM4DVEgsGiJncsXfeMTOepyu7kJrGOUFNosHiXNfzF/GWgN6Xz9+s9+xnQkM8AL55zQl5Rq1u+11/EzwILTObVJmUsFNrH7HLVb3RxQa9Fo+QzQRBs9ThcrL5tZhK+xopUh43ZiieukhLBzWnjPrU1Lw0gFdxQXF7kJ5fAOitFVCqQ/DgvH4hI9T0pKmj1Hx4CKFf/i9ZZnyGKs50lT4ZAnN9VV0l7JLFB1ByhePhubfhXvtbp5kza3CG2uqYmJPe+x1XmHRt5hWQyS+4kBSqawrJAqrDo3+tJgPJAz75uG+2JRhBwhjMGqbBiF/NIa29aNUxqZRaBdvWonuBKWwEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN8PR12CA0016.namprd12.prod.outlook.com (2603:10b6:408:60::29)
 by PH7PR12MB6953.namprd12.prod.outlook.com (2603:10b6:510:1ac::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Sun, 28 Sep
 2025 14:42:15 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:408:60:cafe::fe) by BN8PR12CA0016.outlook.office365.com
 (2603:10b6:408:60::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.15 via Frontend Transport; Sun,
 28 Sep 2025 14:42:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Sun, 28 Sep 2025 14:42:14 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 28 Sep
 2025 07:42:14 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 28 Sep
 2025 07:42:13 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Sun, 28 Sep 2025 07:42:12 -0700
To: <buildroot@buildroot.org>
Date: Sun, 28 Sep 2025 15:42:10 +0100
Message-ID: <20250928144210.4094868-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|PH7PR12MB6953:EE_
X-MS-Office365-Filtering-Correlation-Id: 41b315e4-53c8-4d7c-935b-08ddfe9d3710
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|36860700013|1800799024|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cr/hsvCF5QmtYoyS/OTqWfh6v2j7AKarnUIvw6SsDGUG4/pKXVVx5sq8Z+vO?=
 =?us-ascii?Q?oKkXw1sQjX9AS6u+3dRwofkGUyMlaoogQc8E4TwWx3lbF5uhKkUXwKBswYrs?=
 =?us-ascii?Q?KlSL1GVJBSL1wdP+aIqVwHYunV53M4Nz8vzn8Yv8j7wwOSTLC9g9ssw4CkQc?=
 =?us-ascii?Q?NA4vDXma4CTfMq775qZGlpjI2u7+JU5X0nSBGc80cCRWdjj+UqlexzwnyOST?=
 =?us-ascii?Q?khLB2gK/racauDCdVwFZnzuitl83CM94AJ2trSiZ1YVgMP0Mf+CAq1HUMCPb?=
 =?us-ascii?Q?f9qq/dMLKXOVDCfq7uu0btN2hrE2yzaP3gqvAdyFNPl8O3rUeI+QCplwdsu7?=
 =?us-ascii?Q?zhoQ9Ms3PqAj+dMOvXo2gN9XR17y9tiIGpe0Hi3nv6pNhsIPlCj2bfJXhA31?=
 =?us-ascii?Q?RAvyj2cQW7aP9+tM0q5aaHqd8nR4pjF61Or96iYQkvxJ2D7yjD2PFV22mJMP?=
 =?us-ascii?Q?QEA795JWT0bQxjLdYmwME7yALlEdB2Ag4/NkNA95l2yjQ/3+Zhc77AaBH+ep?=
 =?us-ascii?Q?MnETHUsolBvmDe5p1YDvVRFgKh/jn3DjxQiEzBrs/Uc5hC8EAMfqvnhitvac?=
 =?us-ascii?Q?sLMtLCSdwgfHkrKmdVVY7NgaEBDulLs894MMw2wXV+br2RbywE8lUfw9YJd5?=
 =?us-ascii?Q?ppQqvnHf8qLt5x55RQnsIStRa7LSHsQeKSgVhA99shStIOvnBUQ6HpfGkJef?=
 =?us-ascii?Q?SHBrAyWTEsT4vw+bFQ6O25abElCUU0wH9E13Otbl3vDKKHhAvP3tAAVC/ZNw?=
 =?us-ascii?Q?Q9/1QaJ4OdlL3JIEvOqR08lndHmANtmTtigdjRy3djuX1z8wjvGIsAvbWLXd?=
 =?us-ascii?Q?bfyaxolCN3547tGRvBJuhpW4ZPNsVvJNHsZF/yBUz1sg9tcenQQgsO4if15X?=
 =?us-ascii?Q?qra5lgeAvb1W5tlgBGbKdEJnbwOw0cTf16DjMzJOqO5P4Qz1KNKf0b5C1J/z?=
 =?us-ascii?Q?ZvmiDH+I7KWOwo9A8QE1akfsHvsYyj9i77/IoehhL886AX6U0ga0iGPPZiJu?=
 =?us-ascii?Q?/CWup9Uxf8+Bvnmq2ebVT1OKc6j1mjOoPPfXUB54RWGRJrWEdTkbRTCFRG6S?=
 =?us-ascii?Q?AcZJTxMltlOUjwNcyejYTFdteEGTM9i0kU5iKyIwWQFOWwtaIs7bCLNwJocA?=
 =?us-ascii?Q?zU9tc/9GRc2DmoCgOdm/oOcb2NlshL8EtXGrKPSvnzXlR/V5JFhyxrCcox3k?=
 =?us-ascii?Q?h4+wqP/IcCC+b89ONvWBMA5I1L1L1PXn8vWXUk7OWmkraBRVdgouUSngWfrx?=
 =?us-ascii?Q?T+IoVzjRndaZwbdGrOyFFpWmRpNrCEY62H4tTd5vSutCXljOjvpIfC+kBdGS?=
 =?us-ascii?Q?qSLJjmsxaSVP1UasY5q+xTW5zJv2X7l3hnZC8BlN058BdCaMJQ8s5T/YxIVn?=
 =?us-ascii?Q?UaHUVjptgdwbJRcy7KzhttdoBtZr3TmOq8T/hkB5m9mn/ltEsLQN9FMVdPx9?=
 =?us-ascii?Q?4R9LtHRlAstaZ86AKnUA/7lNxCrefSXZWIMpYiAMug/JL+r0zq1UImAfUf9A?=
 =?us-ascii?Q?3qCofsdTSpfnSeeMkLB1OHRV4+7PIaiySQA4nMRtTd0giHN6gYRol4ka+Q?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2025 14:42:14.3202 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41b315e4-53c8-4d7c-935b-08ddfe9d3710
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6953
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UASMaDpEjqrXzMv7oH7tsZ4cT7V0GOMSIvkUdK94Er0=;
 b=VNW7Y1PmR3mC9UXpqbWncbOSBYRlr5a4Lz6Ug40AzMi5AX+z4kbtjvgp3Kz/40nSDmcmhTya7PwBd0YKGdSMr+fAwFSvHKCKOjISDFLrKrKGnpqA08fTWrY0xpI9PpQ+qY74qAd4lw3xSyr1+62p6NbnZWebenF+9V17bHPqdlw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=VNW7Y1Pm
Subject: [Buildroot] [PATCH v1 1/1] board/xilinx: migrate board web links to
 amd.com
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

As the xilinx.com website will soon be going away, migrate all xilinx board
web links from xilinx.com to amd.com.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/versal/readme.txt      | 6 +++---
 board/zynq/readme.txt        | 4 ++--
 board/zynqmp/kria/readme.txt | 6 +++---
 board/zynqmp/readme.txt      | 6 +++---
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/board/versal/readme.txt b/board/versal/readme.txt
index cd308a1226..3bcaccbb0e 100644
--- a/board/versal/readme.txt
+++ b/board/versal/readme.txt
@@ -11,13 +11,13 @@ Xilinx VPK180 board
 Evaluation board features can be found here with the links below.
 
 VCK190:
-https://www.xilinx.com/products/boards-and-kits/vck190.html
+https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/vck190.html
 
 VEK280:
-https://www.xilinx.com/products/boards-and-kits/vek280.html
+https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/vek280.html
 
 VPK180:
-https://www.xilinx.com/products/boards-and-kits/vpk180.html
+https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/vpk180.html
 
 
 How to build it
diff --git a/board/zynq/readme.txt b/board/zynq/readme.txt
index 085f47b09b..ed7509f2b5 100644
--- a/board/zynq/readme.txt
+++ b/board/zynq/readme.txt
@@ -36,11 +36,11 @@ myboot=...
 References:
  - ZC702 information including schematics, reference designs, and manuals are
    available from
-   https://www.xilinx.com/products/boards-and-kits/ek-z7-zc702-g.html
+   https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/ek-z7-zc702-g.html
 
  - ZC706 information including schematics, reference designs, and manuals are
    available from
-   http://www.xilinx.com/products/boards-and-kits/ek-z7-zc706-g.html.
+   https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/ek-z7-zc706-g.html
 
  - Zedboard/Microzed information including schematics, reference designs, and
    manuals are available from http://www.zedboard.org .
diff --git a/board/zynqmp/kria/readme.txt b/board/zynqmp/kria/readme.txt
index 6fd7ca61ca..8d008332bf 100644
--- a/board/zynqmp/kria/readme.txt
+++ b/board/zynqmp/kria/readme.txt
@@ -10,13 +10,13 @@ the KD240, KR260 and KV260 production boards.
 Evaluation board features can be found here with the links below.
 
 KD240:
-https://www.xilinx.com/products/som/kria/kd240-drives-starter-kit.html
+https://www.amd.com/en/products/system-on-modules/kria/k24/kd240-drives-starter-kit.html
 
 KR260:
-https://www.xilinx.com/products/som/kria/kr260-robotics-starter-kit.html
+https://www.amd.com/en/products/system-on-modules/kria/k26/kr260-robotics-starter-kit.html
 
 KV260:
-https://www.xilinx.com/products/som/kria/kv260-vision-starter-kit.html
+https://www.amd.com/en/products/system-on-modules/kria/k26/kv260-vision-starter-kit.html
 
 How to build it
 ===============
diff --git a/board/zynqmp/readme.txt b/board/zynqmp/readme.txt
index 242c643480..12b81f4a07 100644
--- a/board/zynqmp/readme.txt
+++ b/board/zynqmp/readme.txt
@@ -10,13 +10,13 @@ boards.
 Evaluation board features can be found here with the links below.
 
 ZCU102:
-https://www.xilinx.com/products/boards-and-kits/zcu102.html
+https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/ek-u1-zcu102-g.html
 
 ZCU104:
-https://www.xilinx.com/products/boards-and-kits/zcu104.html
+https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/zcu104.html
 
 ZCU106:
-https://www.xilinx.com/products/boards-and-kits/zcu106.html
+https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/zcu106.html
 
 
 How to build it
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
