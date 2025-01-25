Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0989DC0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 22:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F9DD4126F;
	Sat, 25 Jan 2025 22:16:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gRGNf4WHL9Xp; Sat, 25 Jan 2025 22:16:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D7F1411D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D7F1411D0;
	Sat, 25 Jan 2025 22:16:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 35E55941
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22B5140EAE
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rRy2Fic4_Y2a for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 22:16:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::617;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0097E40E8D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0097E40E8D
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::617])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0097E40E8D
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:16:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XhZkxaxxiEW6KEZy9DZ9nekGRo+naayKAqQQF3pCFnffKpKaTultkZzJyJF04tWXFWsUbp/m4CDXt0UF/PTH5ejzlcl1fBGtrvro5Lpsfszxbm43TN0zg6Wvu6BvpoeWGolv84Wy55raYHt55cSzdRJ2n1Ns+0MB6Etz+AO7iJLbTMzcmxQSWOwN4cisH91XdmcR94D+lhHl663/DDzZYOSviSMLUTzUAmAkmpPCXgmXxzRoW+A0wg3XNUhrtDTdXoUmHF1//ZGybl53l2ej4qg/f8Kjl8oEtDCIqL0C9nFGO3iVdboXMxfcDUBvg4+Ll+5iIOPMzxsFwq8YEfmNxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivh5gjPTndJDwfBngqYFZr+JtxGc50vJ5bXLyWwRaCw=;
 b=yj+b5WqgHC3RTRDIy5CXcqFCy4ujy4vRjDFEmbIDezNz1gQ8HOHGGENrtH2J6hVOi6IZK8LMBG0luc/5a86mpXfx4gbyTN5pGyX2HKATphhq8KLRkC6VV4EThEa3prwFQrjPG17CFeLnGY54rRfscXeJL0+Hs94XTHVJ1L39pyij8HSUY1OsLXxsA90GGSE8Cq28p1rJq0NzSjeBPYgkYOOwUbq8jWEcnYkmyO9/aJzKcJhJrqiMNRr+n6KwdQd4P/CUl0dg2eySXLbjbcUqlvI3Acb7YBWIz8zoQbS0GHYE6A9iNRBEBMxMv23OGLfGjR/6zJVPtAnKZTG2PdLmXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BY5PR13CA0035.namprd13.prod.outlook.com (2603:10b6:a03:180::48)
 by CY8PR12MB7754.namprd12.prod.outlook.com (2603:10b6:930:86::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.20; Sat, 25 Jan
 2025 22:16:38 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:a03:180:cafe::1e) by BY5PR13CA0035.outlook.office365.com
 (2603:10b6:a03:180::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.13 via Frontend Transport; Sat,
 25 Jan 2025 22:16:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Sat, 25 Jan 2025 22:16:37 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 25 Jan
 2025 16:16:33 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 25 Jan 2025 16:16:32 -0600
From: Neal Frager <neal.frager@amd.com>
To: <buildroot@buildroot.org>
Date: Sat, 25 Jan 2025 22:16:25 +0000
Message-ID: <20250125221627.3315039-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250125221627.3315039-1-neal.frager@amd.com>
References: <20250125221627.3315039-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|CY8PR12MB7754:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e7ba462-a8d4-452c-bb36-08dd3d8defb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?25vJt06FsEPFBmGg39RLZaTueHaZK5FT3eMm17Q7nRL2VRrkoKUiQgjN14kZ?=
 =?us-ascii?Q?41YdxkTxP7clznmFPbfJKqdFvCW+dhlEQnchLhRyAisDT3TNlnj8sYLGmQFC?=
 =?us-ascii?Q?bCVIB+uuDt3iAys+ccgldofJfi/Jqoz3Id5hL0qkoLnXqt8TRO88f8KOoqB/?=
 =?us-ascii?Q?HdEGCmz/J73bWS0b8/xbPgxGhkZlbMo30kx/MvPW6tabhIVLg5L6za0yl5mY?=
 =?us-ascii?Q?514TvOTzMALEXtAAeGj2TgZBxCpxBJEOrdITGCyUJk9kXBNnSWjoQAdg6Spp?=
 =?us-ascii?Q?xazcAXQH34z+7W2Yf/NIWHqA40ll41XTXo6ban5oSjjtuF4qoHJYgixLepmP?=
 =?us-ascii?Q?S88j+DDKqdcAo23AS+XdwlXtUkK/K3w2mVzIcAuH5MEu/YDJaBBwLcnNHW6Z?=
 =?us-ascii?Q?3sBZMQVy6taytmsEJtES1EaRbnn2iD0DJ0FFvYyi9rFNQoWHcLsC3TYRdJKU?=
 =?us-ascii?Q?B8zT9aI1U+/5jTKxmemkahEphDI4zKb+sHaCUC1Rwo9Au0C3NPGEspg5hu1n?=
 =?us-ascii?Q?IgOqaCCZJd5OhkBAcnduxLKt3GpZxwc0lJ43qaBdg8vqIm6fflbd+Kk/idHd?=
 =?us-ascii?Q?5fXpkOW6ACFkdcCLHSbqMqe3SNGU/IFdLrZ9j2fu/fMG9tpJKj5VU3S+lNi/?=
 =?us-ascii?Q?vQVSFKEwE029hOZTRCEkEP452HeK/Mk8/k2qEotj4HAalDn+WpilILwLmBjM?=
 =?us-ascii?Q?qmpLFet84IKluH+m9WDI2VrIuoLDNTvjJsRvEwjlTFufJgXJErREaobIdvw2?=
 =?us-ascii?Q?N+R3C4waX9wCbCWO41u4J931fTcnAGBhnprv39I7FtEe5J2j9WxsM7KlZ7Qp?=
 =?us-ascii?Q?9Nj7NTr9XM8p7pGLESa9lezK2MPVM0CmCnuh/vVO9+qVzZCUzExl3+Sd03O8?=
 =?us-ascii?Q?LzzysevXOMv2XDdb/w9pKnD4vRDmUIgYtxSnJxFnZKPygnnKI5bRd4WjCQ59?=
 =?us-ascii?Q?z1Z27ZH0m1SU0uJhhpSUhdc6sjlMTVDCUyqmHIqN0HIMZSzSfxA0NpSNqlKm?=
 =?us-ascii?Q?OTrAVAZxqRhVeRHrY/adu51qu2pjH7o0FOWJEcZzDymtesS4kxepfA2YlRNQ?=
 =?us-ascii?Q?FcYrlRBvMExYUi+w+ibTaP0cAABu0I4OUlUeqt5S2z7cPHN3mRiNEs4kpZ34?=
 =?us-ascii?Q?nRY7ELwrrkJ6oVqa2GRCA8uTvd4MVEOGRKdrgW3F5sDtO98BjOE8yCx1/f50?=
 =?us-ascii?Q?khPYSYIEluT0Qn9L7+j8VLl1nMtsVtFBe4inWKnAZLUbEYiv4camIv8JexCr?=
 =?us-ascii?Q?SOPr/tmQi8DC6XWBDSEPh71TZQ0YOLxl38Lr2iNrBPCS8xUl+X2Af8Zwd+W6?=
 =?us-ascii?Q?/wACb1xnKi/bJWZ07QT7VN4PoGPLQ38t6BRlR8FFiq1S3Wjl7wWlKTB7LLH4?=
 =?us-ascii?Q?aNiscO3DBe9zfK5RKGCr5AfVpkYxNVCoCNiI9hu8d+ngyz/MF1HceS3i63g5?=
 =?us-ascii?Q?s5ZE6uKiXYaZwnEm9bwwCkxABsa2gvf/W8RoEIqRAJZbX1cEjlaV062IswTQ?=
 =?us-ascii?Q?rcJ59RUGVIx2EQ77mHaec2Bit7+t7R1HlL/K?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2025 22:16:37.6263 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e7ba462-a8d4-452c-bb36-08dd3d8defb5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7754
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivh5gjPTndJDwfBngqYFZr+JtxGc50vJ5bXLyWwRaCw=;
 b=mI/kVRI0tszkv5W8q/bT+43vs1BJS1e7sYYxUj+fagsVlmI9+YlLMyomELqCJvV8Yt1BF/QuAhmnefdpQTbrNzft+i56wA0KdbJq72f6IT2vsA+HpAzJbtJFz93u+APrlso44LM9+oht6iI6SXs1qqMzxDSyqdPoL6nidc4P+Vk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=mI/kVRI0
Subject: [Buildroot] [PATCH v2 2/4] boot/xilinx-prebuilt: bump default to
 xilinx_v2024.2_update1
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

This patch bumps the default version of xilinx-prebuilt to
xilinx_v2024.2_update1.  For some reason, the original xilinx_v2024.2
release tag was missing the kria boards.  There is no difference between
the xilinx_v2024.2 and the xilinx_v2024.2_update1 release tags other than
the fact that the kria boards are included.

Now that the release tag includes all the boards, it is possible to bump
the default version from xilinx_v2024.1 to xilinx_v2024.2_update1.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- Rebase due to changes to the xilinx-prebuilt.hash from another patch
---
 boot/xilinx-prebuilt/Config.in            | 2 +-
 boot/xilinx-prebuilt/xilinx-prebuilt.hash | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
index 793baa116f..4e0850f3ce 100644
--- a/boot/xilinx-prebuilt/Config.in
+++ b/boot/xilinx-prebuilt/Config.in
@@ -18,7 +18,7 @@ if BR2_TARGET_XILINX_PREBUILT
 
 config BR2_TARGET_XILINX_PREBUILT_VERSION
 	string "prebuilt version"
-	default "xilinx_v2024.1"
+	default "xilinx_v2024.2_update1"
 	help
 	  Release version of Xilinx firmware.
 	  Must be xilinx_v2023.1 or newer.
diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.hash b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
index ddb2cf8bd1..827d76f2e3 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.hash
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
@@ -1,6 +1,6 @@
 # Locally calculated
-sha256  7abcba4e0e44e3a4adf9c1f971d918575226d7604dfd64a386baaa00c1c6c35f  xilinx-prebuilt-xilinx_v2024.1.tar.gz
 sha256  ef61a4b249ecbf632a25cc34c3b03b8290be44397ff739467ac92ec1701e23bf  xilinx-prebuilt-xilinx_v2024.2.tar.gz
+sha256  86ee9629366aa8c0d70b87202152a793804ed4090e3a6fdac4eaf855bcc4d458  xilinx-prebuilt-xilinx_v2024.2_update1.tar.gz
 
 # Locally calculated
 sha256  7b2074b607264a07347e1a7ef0323229585942793469f34b2cf9628f7623e05f  LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
