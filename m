Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CB5E6ADF3
	for <buildroot@archiver.kernel.org>; Sat, 23 Nov 2024 11:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D09942D39;
	Sat, 23 Nov 2024 11:12:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1jclEbZ-Jt3H; Sat, 23 Nov 2024 11:12:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ED7242D50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2ED7242D50;
	Sat, 23 Nov 2024 11:12:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AEEF31E39
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 11:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 981A2409D6
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 11:12:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XngBnqDznRhf for <buildroot@buildroot.org>;
 Sat, 23 Nov 2024 11:12:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2409::61f;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7D915405EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D915405EB
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::61f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D915405EB
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 11:12:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KFzvVji76D6EBgOeaSpGrx+uU3uXxfN8gP0ybEcddl9y4Ejp9vdyhvzz14r2LmKDD8HR+macKAFFm0T28BMLZ5n0A5ii31YBl6j6atKmKTV+d0YJzXa+vwwRWhxu4npUiDgPiyqmebB1vA6c8d0lp94m0+GaMjA96tUeoTpm3l6XHbBzevGbwYkvlcAAQKDue/jWF8cN1eaLU9L580LaSwVvwyGbGXj5p1nodAuMPc380vB2NT5pj5YoXYW0+3/s+3SpEa6/vChSwFpvteZjgXWQVjsAO+Ek1hsRDXsswi6je6nvJEZbNfF5b+sKKG/vXTBy5Ndko7ec61lGnirmcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y3D+QyZWqWL/U+wEjUIDMhQb+fhKyeAy2qmCYMeqZtk=;
 b=WfpEUjW//qaIDRpEi8+AefW6eWuYOdA4rNzlq/j4cKE4dcwGQWQCocTEK9Om1Xt7DwSm6x9+12UliPjAsHasNKgCofUfJ5AT5LKz6PpjTb9Z09A7zA2/ahgJpM+VMzyoj7C3mQ7WW21mw0lxnkiuavbNhdzyCNlw5PveQC3gUuMJQoU+4KGKKjAVcg2+qeBr/viMl/zfK8kOWDUfKlDhiUEcF5VGZBG9SFHrNNYJJXKTYknyX0btixuTMI3MoOUz+c/bfgXL34o3GFd2edJwP9YYMxT/pijcivOgWVM4Ez4diIB287VD5mvRRH0spU8548Vm4/wq6Aub97o0tyRa0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW2PR16CA0004.namprd16.prod.outlook.com (2603:10b6:907::17) by
 SA1PR12MB6871.namprd12.prod.outlook.com (2603:10b6:806:25f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Sat, 23 Nov
 2024 11:12:01 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:907:0:cafe::9c) by MW2PR16CA0004.outlook.office365.com
 (2603:10b6:907::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18 via Frontend
 Transport; Sat, 23 Nov 2024 11:12:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.12) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8182.16 via Frontend Transport; Sat, 23 Nov 2024 11:11:59 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 23 Nov
 2024 05:11:59 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 23 Nov
 2024 05:11:58 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 23 Nov 2024 05:11:57 -0600
To: <buildroot@buildroot.org>
Date: Sat, 23 Nov 2024 11:11:45 +0000
Message-ID: <20241123111150.2124027-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|SA1PR12MB6871:EE_
X-MS-Office365-Filtering-Correlation-Id: b157f752-2f09-4df4-1950-08dd0bafa6b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p0AkU+I/6p9kDa9VW7smqW6SJqHfocG6M42QJuDDgsmwHshsTqy0/8ZVT+uU?=
 =?us-ascii?Q?/cr9yLhbUxDKOkwbaHJIFw8crZkYPfSXHbnWLeoSK+d5jpUfiXftdUSpOpsO?=
 =?us-ascii?Q?dcK9ovtTeQvhwZdeqLDyNuRtrc0kxLYrYNcQm6KaNvVroD07RKJb9n6yytKx?=
 =?us-ascii?Q?Lh2TSx5oW8cQfnfOVkgoAiiVwqoyWLaP/X15yQYulwWtuIhOrIALlywue+LK?=
 =?us-ascii?Q?lDT+2mdjX9upOcxeDXKmOWykONWYDoAOmM0qrJP7vkhI2yhgmFPWCyXMcxqo?=
 =?us-ascii?Q?Japl/VzL5ZAruHB3T11CTWm2uF3yKisY78TKztRlI3twIpqQB7ScI35UQYEQ?=
 =?us-ascii?Q?A0Ay1yIdEfnKO8VlkMS7xZLeW5YTPAy8AhWRYALllWJW9AI0VtO0piWrXuIg?=
 =?us-ascii?Q?fdOIOs/ZJLRkNmOxJiLdHb+V84vGGSoq99JRzZXBOXd1/5bqgY1jZb1ab6ID?=
 =?us-ascii?Q?M5eHFu1XJ95wmEs1wn7+TolEM9sk4cvS1tSTusAY50DVMuAd+IxoJGge8fIq?=
 =?us-ascii?Q?83TeMd2/XVLp8rBHGEvvD85+8/9EKeCnAN+v8/16M9LMHbZg9LTiF+WWXAFx?=
 =?us-ascii?Q?1I4tmOU0+SPPlMwDXU4YJFnMQliSBFPhydK56zK4De60GqjrH7bgpijFuEXX?=
 =?us-ascii?Q?jMp5d4uh21y/stPa2msIBb5eYgb0oxG/kzB959+vGIr5pkhKKDOPevTZPP71?=
 =?us-ascii?Q?7xaPT1tVuHkRhqZALefdBVfOoccRcZOS9q5/t5q2xxTu9VBtGgLVmFUMJOL4?=
 =?us-ascii?Q?s9Wu+KAwUQk1IT5Wxm6S7DIK0EbmTbYNhpFkbgYK8NAqVQCTlTcXtdMPsiX3?=
 =?us-ascii?Q?o/S5NkQ03zduTWG/P0dJMfB8MoLgc5oAWgb+rXqNlZKD6lchoGYkAmA684DC?=
 =?us-ascii?Q?NmHMZN84ALaWd7H5TZaSR3SjOlLet2juzFlY2q5sAP1PL/qD6OI5DW6jrwJD?=
 =?us-ascii?Q?UJM4fKrd76/jEWnpn+52SchPwGnByoVMWEuH2W2Jg3/E/nmVJBTbvFY6Jcva?=
 =?us-ascii?Q?Tk/okDH9GwXDB1RCw4E06BtdKIj9HSMSxLmMPEJ4UlGfiORW8x8gUt5zbPx5?=
 =?us-ascii?Q?z5M7+0iNd7Wxtk8GuSR5pkWYHvrOgaJ9oMtEInrJxJvlmiIC26xXDci6Wg2o?=
 =?us-ascii?Q?zCVYqzVj5ILxTU8xQVFj16gd7UFSuRKpcDa4RvYaPB0OqzGPVvVMkpKmDnMz?=
 =?us-ascii?Q?eni82sV/OHiPaNGg0KiNOjMLojZRmEXRuMl6j/96NDw9LjgWeXfC6HOYL1e9?=
 =?us-ascii?Q?IAZ/5ntc7toqBm0CCZkvfAlMBmpO4cxOS+Z/s1ePEYLeW24vKxzaQofycQnY?=
 =?us-ascii?Q?JuaOirtJMpypcrWxZXro5Cj6EZWovz8BG/ajj/G6mq8X7O/VT8QraaDq/OCf?=
 =?us-ascii?Q?M3VCKP87azf7EoiaEcZM6hgzWooKP3d+gcOQnXJfjvEMIu04y4Pv2gJenxAE?=
 =?us-ascii?Q?kGcdJWf4LG96dqqSARDxq6xSRZnKF5IsAJIupo1Hr/0G8a7xgsTTKQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.12; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:atlvpn-bp.amd.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2024 11:11:59.8722 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b157f752-2f09-4df4-1950-08dd0bafa6b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.12];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6871
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3D+QyZWqWL/U+wEjUIDMhQb+fhKyeAy2qmCYMeqZtk=;
 b=afhoSFIQz2AzKFf3x8ial91VGSTUn1jVe/hlrN9/1iazV5Hr9jWHbiy9yEsqHPgu7TyS5n82De3As1XK+pZN9pV3rrjDafcLURRl8KXOluXOJAN/Jj5OGO45f19a6HdAwfZu4i5EKYT53FjlEVizXr0PwxtlKnPyIl709SiJiQs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=afhoSFIQ
Subject: [Buildroot] [PATCH v1 1/6] board/xilinx/patches: add xilinx_v2024.2
 hashes
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
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 romain.naour@smile.fr, michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add remaining hashes for xilinx_v2024.2 release for zynqmp and versal boards.

xilinx_v2024.2 release includes:
 - atf 2.10
 - linux 6.6.40
 - uboot 2024.01
 - xilinx-prebuilt xilinx_v2024.2

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash       | 1 +
 board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index e300398541..2ef3a98196 100644
--- a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  c3369c89eab4e452bbc76c630e5dccb6c0ae588c0175b6c8549aa0241deb06ef  xlnx_rebase_v2.10_2024.1.tar.gz
+sha256  a45390c9e1d584a389abd37ee49dce3f8d3b41718b1fd7c977608b5387a38955  xlnx_rebase_v2.10_2024.2.tar.gz
diff --git a/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash b/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
index c955cd79f5..3bd33a29a0 100644
--- a/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
+++ b/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  7abcba4e0e44e3a4adf9c1f971d918575226d7604dfd64a386baaa00c1c6c35f  xilinx-prebuilt-xilinx_v2024.1.tar.gz
+sha256  ef61a4b249ecbf632a25cc34c3b03b8290be44397ff739467ac92ec1701e23bf  xilinx-prebuilt-xilinx_v2024.2.tar.gz
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
