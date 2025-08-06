Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4FDC87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 08:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14E5E6081F;
	Wed,  6 Aug 2025 08:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TeYsaxKeIUVD; Wed,  6 Aug 2025 08:24:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5795B60B2E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5795B60B2E;
	Wed,  6 Aug 2025 08:24:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A0AB231
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 08:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 923B860B2E
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 08:24:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f6EHYLT7Muze for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 08:24:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::630;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 066396081F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 066396081F
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 066396081F
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 08:24:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y8NF4pX2u0OE3TaPyO8wLD4bqachyD/R46LsU4ngrdk4xyE2jWRg+oowOGwAVCZKWKGvRgxnJ54hE4QP7x+xOuboJC2YeZJWDF8Ssstd+rv5s9fb0c2ieRFRB81fDMxJtloto0pJaWapor5kBmxMV3zz4eeN4vvQumdK/kkLWYny7BtbLuAfevb8rnxLKsdhY4LWrJC5PxNG0omoBOY/Zc0UFcWBMPoYVxF4mxV4P+PgKNrw5h0Cm9VBGTuY5kl6uZVh9B25tOoV80KH/YAlmfQOtMf/Bqu3QSwBjjnCqsk0t8uoYRdoHp+xGTpRHm0rDSq/Xu8EuyIgwvTZ6vsZSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSya7HLqx7Mfn+bkoeK4yzt/ceP/71+SJ1tdVMHI5ow=;
 b=Ii6oY2kiLpsD1L3XUk5Uvzs9RbAqS+JDV9ASfdb/pJPeHGkxsCHuOYu8s23Xd0iFbqQLVqsCO8yRLGt4aMB2aAcMoRpyS+5Dau4JejSIO8AE4P49inzpWa19v8BgeieIpfCxYTL34Rz8dfwjNfngFmRmT6kgL/1bhsPtfednrxXLJapWy8DBqg1RIRZVYGYEgZH89hMgqdH8SU0gnJJa73B4sb+Ue9xn4UtMUDwO24QeKANhNFrnPgdKt9O9g5UoQLy6QqQeP53+Nbr/Diyd+bt2wvOY4KIFqtUBLCVtiGQSz76HkkiqB/s8b4BWHH4OrAPbjyTXS7ZqgchkXaYiqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR04CA0225.namprd04.prod.outlook.com (2603:10b6:303:87::20)
 by MW4PR12MB7240.namprd12.prod.outlook.com (2603:10b6:303:226::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Wed, 6 Aug
 2025 08:24:33 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:303:87:cafe::e2) by MW4PR04CA0225.outlook.office365.com
 (2603:10b6:303:87::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.20 via Frontend Transport; Wed,
 6 Aug 2025 08:24:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Wed, 6 Aug 2025 08:24:32 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Aug
 2025 03:24:32 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 6 Aug 2025 03:24:31 -0500
To: <buildroot@buildroot.org>
CC: <thomas.petazzoni@bootlin.com>, <giulio.benetti@benettiengineering.com>,
 <ju.o@free.fr>, <romain.naour@gmail.com>, Neal Frager <neal.frager@amd.com>
Date: Wed, 6 Aug 2025 09:24:28 +0100
Message-ID: <20250806082428.1044021-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE18:EE_|MW4PR12MB7240:EE_
X-MS-Office365-Filtering-Correlation-Id: f6265cd5-56ab-48f0-c10d-08ddd4c2abfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jof2re0lzDP4LDTQMbeX6XAv5KlZ+U6+HXCzl8VgdT9EYIlh/O6xtIQbr34J?=
 =?us-ascii?Q?k516IJBZHbRL4Vsi9HHU+4QLYNQQMqqbifRRoVqbYNaIycsixHIPBO9kNdux?=
 =?us-ascii?Q?Mta7o326sfeR98fyUcnSS8JbgelypR1XTz4XPmWhG3naOV2Nrv4B17JvQO43?=
 =?us-ascii?Q?graw6zv+tQJor0031ggTpTYrST+z3afTRhyEjBHS3AH2HNWFhZFqGUUiCJXx?=
 =?us-ascii?Q?pCvEFTeGou6hURYfp5tt1zh6mBK/lukpsXe/ikWG1A4PXYLQDpF1xqnd7QWK?=
 =?us-ascii?Q?IyUJIXHntLKU3r/aWMbC4hdAp8h3TLKlICuhctfkGLBQNbGbgaRNqy5oUOxX?=
 =?us-ascii?Q?Pezxz3lcjEhbAGneMaJSbVLl8gmt7G8ZxlwPrcms8TVhdJ50udEFVxZLuwcP?=
 =?us-ascii?Q?fQMUyFyPKVmdGYWEext3YH0wIxdwmqbDzLje8WQN0ZRTxAcXYY+E5UlKtKbp?=
 =?us-ascii?Q?93oUUT6gjBQ3Jn21TFLlGr8bxlSH1duihSabYqjhWDAYJjjfhziWSffRS7Je?=
 =?us-ascii?Q?hc264qZXUvKushrpRB3YkdgpQFtDn3I4T8DSAuNBNNbn5EvhY3EEw8BMkHcF?=
 =?us-ascii?Q?KUVq2V6JsX5ERC9aRwnf5Cn6TNxHyOd0dPP0avrm0UDyQc0nYatvse1rTJ7b?=
 =?us-ascii?Q?D3ZPsIJu3ZPTUZHebgFhBvyLAYIcMdv5dOzWiSAaQw+dAR86zoAdtTmThLyK?=
 =?us-ascii?Q?vWstcOcX4Up/B8jhFIknsgRa4XUkH3PuIUeryGJmRUFBiih8DGb8Bo0x1ieP?=
 =?us-ascii?Q?pnUUaYywU0m3fjbX2E2dITex35zt84lbZ1XbCVSmZXtoj28UxXI+uQlkjyU4?=
 =?us-ascii?Q?tWr9RimjW7+nC6q32mi6p9RQzUb+/CHMeHKVk4TWa/m7i/HWyAt2IdO727hl?=
 =?us-ascii?Q?x7eEKJPC//W1e3oV8WUU98C1A7O554WmkzpgMvJPasi45XUryzmIrteMrLLf?=
 =?us-ascii?Q?2Doy9QJkGsApNVkkI25gXb2wH1Gv8zugDT6g65NiAXMBy5ytl0Q5dHGsIp7S?=
 =?us-ascii?Q?SFILp/IwtpG3BRI8G0cwFNw9/RqgF73HrTCta8Oog4Qj8aiTc9kul/3xKUOJ?=
 =?us-ascii?Q?dwzxujq2QsqUIOYOK+nz+QGGqs5a07B892moDQO86tZiZ55c9wqYdmUYnppC?=
 =?us-ascii?Q?/qOaLSHVGokBhmDbFg6Bc9xTXamIY3DLKmKm+ZdRJKUODmGDPWWEcbER9wnJ?=
 =?us-ascii?Q?o5H1EqTkJR5FdGZuI2bdi6fWbyk+YSi1dk2fzI4DxqnOaSgivypBQLW9+Tyh?=
 =?us-ascii?Q?F9+Ief8OvCUMJqfA2JsBbIPBOv/RwaffQgDx6JoUxVsbZlbzSSfyDV70vaDJ?=
 =?us-ascii?Q?m4U1ayQVuvaXCIG82WK9D6Uo4bnIQIuxqbQ//xz/4Pv1Mqwv2bSXgXEnzg4n?=
 =?us-ascii?Q?+9BxU0WkxeHx+T3JDbbAVZ8vLrk/o/5VtU5SrRtgqKLfy/i7NOS2ilo1T1Rv?=
 =?us-ascii?Q?F+/NeNdelCS3aPIHvNlAkceI82+xFBUE8tLKfRjtuh8/yGXjj/GhWHV1hQy2?=
 =?us-ascii?Q?B6gGAEQfzb7FCOm7bY6Z3ci2sVSXduVPFaeJofCfY8VP23RwNu2zerNmJfzN?=
 =?us-ascii?Q?Fc4rV8556+1E65xNJS0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 08:24:32.9440 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6265cd5-56ab-48f0-c10d-08ddd4c2abfc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7240
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSya7HLqx7Mfn+bkoeK4yzt/ceP/71+SJ1tdVMHI5ow=;
 b=pkPxtvQlaTYrUKj/V/rOVw9YPqMZAK4+CpeGVRCT+Jg/gvERVCX0+NKTIXFGqN0L/7tZ235lwe2/90xPq/292zqM7B+OZCdldmHZTBZsRTAoRkKzZAqa58XCNtuwKR+kD/T7PgT1gPDXLpdjhUIaF56J3OgCRDVv5WhVCG8WPsk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=pkPxtvQl
Subject: [Buildroot] [PATCH v1 1/1] package/qemu: correct help menu spelling
 error
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch corrects the spelling of 'Xilinx' in the help menu for the
qemu package.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 package/qemu/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 2d15ab1ea9..ff7423bc4c 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -211,13 +211,13 @@ config BR2_PACKAGE_QEMU_TARGET_MICROBLAZE
 	bool "microblaze"
 	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
 	help
-	  Xilinix MicroBlaze soft processor.
+	  Xilinx MicroBlaze soft processor.
 
 config BR2_PACKAGE_QEMU_TARGET_MICROBLAZEEL
 	bool "microblazeel"
 	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
 	help
-	  Xilinix MicroBlaze EL soft processor.
+	  Xilinx MicroBlaze EL soft processor.
 
 config BR2_PACKAGE_QEMU_TARGET_MIPS
 	bool "mips"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
