Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DD2D3A661
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 14:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56D1C80C21;
	Tue, 29 Oct 2024 14:51:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7t3xQDP8_Asz; Tue, 29 Oct 2024 14:51:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B69EE80D19
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B69EE80D19;
	Tue, 29 Oct 2024 14:51:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 068415E4E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 14:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7799401B6
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 14:51:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Xspv24HAEKx for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 14:51:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::60e;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E08C24019C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E08C24019C
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::60e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E08C24019C
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 14:51:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bF0vSSUZ+chrl9SSL89OdQ0YhQ12fY6nnUS522nyB4vyaOTaPDmTZ/WjFSIX741rknzibp111KHIjgP7MdijUNs+zCczE83w9VFYxLN9QCk+RlarQUoF5ufSlAwHB5E5AzpQ+q1pgxLU7pj6KNXl4Z5tlEWKJwKgeECwpugTIEi73NIogFCzUx9WIAj1u62cA6zGLTBS8tIJXTBi2Mgd65o4yCXNAuxhGgamDBnMZH5lN3VyHV4MzFKYzuAIIyMcTS9sxMOkyzoPBxNIny1EUQrj8v6o8c97AsGtdxsD8Bq332k2PNNlBB3a3usn8cZoIDD9XCBgkJya22Wl9DzNhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYN4kiWpRyVFOMBLSClc3o/A45xemNjUqnaYRMOYfg0=;
 b=pq9oJUzO/UKt4o/a5Bnm8oUydmwK7MRk4EfX78//wWYnCPMpFRVKIBFCQaW1DJHX49M0ktklJG9dhMkNdU2gikItdzzbiNsN6qCXvDTYfCVsSNBwop+B9h5jJT2YwoTpUHjUhDfiSloocEQCLVMoJqy1n+3twz1gl0bTMf1c/AHu3ZJXdAJHmHrDmOFBP38bTkuv8HYQxrOYIZxbUq5wPgs38RwLaqJ0aIwtxFuGkV7oqhLTCpmPIEFkwGfZmkOiplbbvIYl9dSbZas8NbPnjqxanCzJrH+KZs6K1TU0NigtnP92ftwgVzHJ3U+gkrKWroFnHpqdMAwQOJpyHRPzNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR03CA0169.namprd03.prod.outlook.com (2603:10b6:303:8d::24)
 by IA0PR12MB7577.namprd12.prod.outlook.com (2603:10b6:208:43e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Tue, 29 Oct
 2024 14:51:33 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:303:8d:cafe::3a) by MW4PR03CA0169.outlook.office365.com
 (2603:10b6:303:8d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21 via Frontend
 Transport; Tue, 29 Oct 2024 14:51:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Tue, 29 Oct 2024 14:51:32 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Oct
 2024 09:51:31 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Oct
 2024 09:51:31 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 29 Oct 2024 09:51:30 -0500
To: <buildroot@buildroot.org>
Date: Tue, 29 Oct 2024 14:51:26 +0000
Message-ID: <20241029145127.4011427-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|IA0PR12MB7577:EE_
X-MS-Office365-Filtering-Correlation-Id: 41008d5a-0f3d-4dc7-7871-08dcf8292df0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Aa28Y289bMbfPfnY8s8+SDRQ0kOud3lVg4pY2vQNoITbuZ1IMgQme+G5rs4Q?=
 =?us-ascii?Q?vn2FZK7lQQkC0eZ2suOcc0lORR96Do52l/GMQOsHDIqxWtK8goKI3kJjLLdL?=
 =?us-ascii?Q?6ETvVVUk63z24KIn43yW+eAZw0vPcON7Vgermqyeo8YQkCxyuA+I/dfT+y+K?=
 =?us-ascii?Q?esUvHMIc0yMm5HG8myR3tedWreurEzdOcF5Fyn70LDlgVGD9KkjnEL7ufMP2?=
 =?us-ascii?Q?vcex4Qmo40g4BXZgXXukjnnKs4Fns2S1AkdOByJYOdeWDR0mZwJK+by2C55j?=
 =?us-ascii?Q?lWd5TsibRooLs0TPLzRa6qQBp63Ma77oXAfhVs/KPWuP2n6kAzunZLd21+KC?=
 =?us-ascii?Q?PS2iQhTZf7qpQ8He5fEGNQ+DURxVSYkVD9nkHWg56PGLn2bybXPUsgaxrmtY?=
 =?us-ascii?Q?kTo+cSdfBo38lMV70QQMokAi/rr3unjM+COTdwFCtJYO8Ksq//UJvexcgVBo?=
 =?us-ascii?Q?IkcK3EGpq+pY5J6ij2ecelcXl1DIL9zSpZcPtV+/MgNFrpP67Hlrv5SJlnqU?=
 =?us-ascii?Q?OfRFCh8jEqgCkLTCiUnGkorJLYwO6M9KGiNMgq7CWfWK57uogbBQ34IDhY8o?=
 =?us-ascii?Q?fF3EvzgTWOkfLkW8TtquOKtdL2K4JWnyabtQKRKu8RgImCbgxThHT5+YiiUC?=
 =?us-ascii?Q?JV6vr9JKWEHej6czFTPnX+Z525lFb07Wa0KE0wEcAl65pvfAHWVTUdGDkC5e?=
 =?us-ascii?Q?8tlVyaR53JLlYZbksWr4d8AFyDqhP1x2i+y9aSaMJKKuRxXjjHOiZR5OJCNy?=
 =?us-ascii?Q?k3jmm4+Tb2E0BpXj4lbugMHT/FqA1RGDybHJRsNjlPXXIDY0BIPL15ZuQDe+?=
 =?us-ascii?Q?WzsByDuwR4Xy3cIOD5wFd/Mi6Hz4+Q8nh1eMQlZ2GoDwXabJgJaZndYnaMnO?=
 =?us-ascii?Q?uqiJ0a64AH35l40K6uKDwUu7FgSXXfeffnb6Mvk/3d7LP6QTHbPF2mOC1GMD?=
 =?us-ascii?Q?ITEW4UHLS6NE7+JVrgQTq5cqgO1sUs3ywCBADDWUp46WAUalAMo+HEERQpIe?=
 =?us-ascii?Q?wO0BirFeiY1JZtww7uvodVrqLAtlTsMbhTFPAxOu3idttM/qGj6dmmft6riA?=
 =?us-ascii?Q?89pTS1s+T5uRpDbdxYD3rIttKy4bORrnlmchQte98+fVE+qWtsnq8X9NncmV?=
 =?us-ascii?Q?wQBYiOPY3rg3zIzkeVYWF5jU5P87xDe12nXewHKPIxTiot1DdNIlUkWJiEZg?=
 =?us-ascii?Q?KLp2+U2yhS4b2ON55yjJMP/xFrkQrvx3YbsxC8m0o8HTYPSZPnkvsissJ+jh?=
 =?us-ascii?Q?c/q6Sm3sFnWulF14ZjrWQNDQDo5cAi/50XiRQWXPH1kdsdNmitEY/1eEneXU?=
 =?us-ascii?Q?APrR/7DCpVpkpXGH45p2Mqiex8lVxt4UE0xm1KD+VpYOzYZg/v073UjcYoUx?=
 =?us-ascii?Q?aB2wlcStYx7plPQlyF9csS6T1WN4q1M1LrSrt4A+i9co2IMrdw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 14:51:32.6287 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41008d5a-0f3d-4dc7-7871-08dcf8292df0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7577
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYN4kiWpRyVFOMBLSClc3o/A45xemNjUqnaYRMOYfg0=;
 b=qUPXYcGc62DAcMe5ye+ZRa+Nbo+hFdgBG2RIw7yaVD5S+a1m/Q3PDKbjWowbWO6rLC+aLIKuP2T+MFow0T+x2rRe/TNoiCMu6FPxr+KgY2j90ClE1PdGCGS+4m1F/0MPscgG3oeV4NYElNpw4dzXl3ZLl0OLgLodVql71MWL7UY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=qUPXYcGc
Subject: [Buildroot] [PATCH v2 1/2] package/binutils-bare-metal: clean up
 variable names
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
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removing HOST_ prefix from variables to follow buildroot coding practices.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
-V1->V2:
  - Correcting BINUTILS_BARE_METAL_VERSION variable name
---
 package/binutils-bare-metal/binutils-bare-metal.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
index f2f223387e..97a242a6f2 100644
--- a/package/binutils-bare-metal/binutils-bare-metal.mk
+++ b/package/binutils-bare-metal/binutils-bare-metal.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-HOST_BINUTILS_BARE_METAL_VERSION = 2.43.1
-HOST_BINUTILS_BARE_METAL_SITE = $(BR2_GNU_MIRROR)/binutils
-HOST_BINUTILS_BARE_METAL_SOURCE = binutils-$(HOST_BINUTILS_BARE_METAL_VERSION).tar.xz
+BINUTILS_BARE_METAL_VERSION = 2.43.1
+BINUTILS_BARE_METAL_SITE = $(BR2_GNU_MIRROR)/binutils
+BINUTILS_BARE_METAL_SOURCE = binutils-$(BINUTILS_BARE_METAL_VERSION).tar.xz
 
-HOST_BINUTILS_BARE_METAL_LICENSE = GPL-3.0+, libiberty LGPL-2.1+
-HOST_BINUTILS_BARE_METAL_LICENSE_FILES = COPYING3 COPYING.LIB
-HOST_BINUTILS_BARE_METAL_CPE_ID_VENDOR = gnu
-HOST_BINUTILS_BARE_METAL_CPE_ID_PRODUCT = binutils
+BINUTILS_BARE_METAL_LICENSE = GPL-3.0+, libiberty LGPL-2.1+
+BINUTILS_BARE_METAL_LICENSE_FILES = COPYING3 COPYING.LIB
+BINUTILS_BARE_METAL_CPE_ID_VENDOR = gnu
+BINUTILS_BARE_METAL_CPE_ID_PRODUCT = binutils
 
 HOST_BINUTILS_BARE_METAL_DEPENDENCIES = host-zlib
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
