Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A862C8302F
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 09:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B27E940871;
	Tue,  1 Jul 2025 09:30:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w9hf_q8fEJbO; Tue,  1 Jul 2025 09:30:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5E7F408D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5E7F408D7;
	Tue,  1 Jul 2025 09:30:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 62DB4197
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 09:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 549B5829DB
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 09:30:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LLCsCjfs4vLo for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 09:30:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::607;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A44C982375
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A44C982375
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::607])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A44C982375
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 09:30:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wcOnDp0fOkni/S4oEejGyPSWnKIDhRHS93fJlSxHVab1XYlKsqFf3rFLCkijM5pBfYR+iRJ7Ns4s9NkwQBqbjOA0vdUB47QZhQv2etueAAAcT9y57CXVIdjQd5Gp7JJWTXs8mUjDuAnXL2l35xLZtvG31xJ/gg4R/4Y14a2EbmzpqnSFRwRJkCsD+ZZOPvyLjsRCCEFY+4gxD0iP/YLLwdT40N6FtZUhdIGvmaoqvc2HrkSq6sz0WXnMbfNwLgDFpZ6MU0jC4zM1S/8NxuXekaRZIIZZeom/4p3MlbDJ1IbtsCM82W+wTUCfTrN4Rp6qRyyhoxDp3vzhYsEhcnvBdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UrrMVkcL5NXCyV43/CXuif7B9bkV9lZyLrVGX34iS4=;
 b=eaPNzpxm8aDeRgys3tFjs7aGGpgjFcyCRvoGH+iHSs8bgzp3eN/hRhDUpjkBxq+4mFYBtpHk3qJ7cIysTVNAent8wnnIrVCPOzVNJnYCRuk+QGMWAEV16hLL3RslXUk0aVBRZw7VigttJp4XeJpjaPYo048TQqV+GEMZ87dtS+2VSrMjJxAn3veaPU723aSEL4eBDuD/noaM1QqEAzyBn8z4Mj7W+GwfE16xyESbTBN0aqSnZmX/Eq9qc+9JZ1svBJwCrurwgboeuaA3zZg7ddsATL75hs0UkzTFWJGzEWEEiIib8Ql6u9X876vXUYtKdVHumYp2EwlfLHnuvwcT/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MN2PR01CA0030.prod.exchangelabs.com (2603:10b6:208:10c::43) by
 DS5PPF6BCF148B6.namprd12.prod.outlook.com (2603:10b6:f:fc00::652)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Tue, 1 Jul
 2025 09:30:25 +0000
Received: from BL6PEPF0001AB73.namprd02.prod.outlook.com
 (2603:10b6:208:10c:cafe::7d) by MN2PR01CA0030.outlook.office365.com
 (2603:10b6:208:10c::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Tue,
 1 Jul 2025 09:31:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB73.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 1 Jul 2025 09:30:24 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Jul
 2025 04:30:23 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 1 Jul 2025 04:30:22 -0500
To: <buildroot@buildroot.org>
CC: Giulio Benetti <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Neal Frager <neal.frager@amd.com>
Date: Tue, 1 Jul 2025 10:30:19 +0100
Message-ID: <20250701093020.371352-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB73:EE_|DS5PPF6BCF148B6:EE_
X-MS-Office365-Filtering-Correlation-Id: e00b0c25-669a-43b5-9aa5-08ddb881e852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?14g6WDU+jC5uGL9EyP6A329RX3DEasoQTx/HVBP/+7WzuTJS3KS5J7F2xTF+?=
 =?us-ascii?Q?DDhv9GPL8PbhzLTNvQKRV3Mxyv9uAvZlF1pz8+4CzOYaMtnjcv634GrtbCpp?=
 =?us-ascii?Q?4DJ46dUUzWWg2prldXqCOPBJT+vkgVE/OGleuRbJUAI96clR/aOBHfn9Q5p6?=
 =?us-ascii?Q?h+SpFZxPp3Qt6r+6ZzJVmAyEO6QGa6yTYl4QgeKK07w0vWXZROUU+PPXJqNk?=
 =?us-ascii?Q?7UtWLa5D1YeTs1MDsy/xiSNa2AGutunl5Yjg3Ib6UVRvJ6HbzPAsAff8lQX2?=
 =?us-ascii?Q?JWCqluEETApZxq6a2SKFFkiBjaEpM11+dgOSsTEhP7AXiO7mxP2gOF2L7qSq?=
 =?us-ascii?Q?J6bK09FL0WMX1LO4kEGAN72XYWZTgm8Bd1KHfNvefjrLauwIxSAPrCUdD4m6?=
 =?us-ascii?Q?P82HbXr2nsSpF0bCNC2sr7bGZML/DYn9n+oYXQKhCqUz2PwnrPYnQZfPzPxd?=
 =?us-ascii?Q?rAu5Lip9+qSfPK32/XNnhAISDBwRQIzExicCuK0OiGyhdipz2OKADudAHmPQ?=
 =?us-ascii?Q?A4T+llYj2BaclkEnKUpPt/pzbf24RhckLJZL4T57GAQf9EqD7gL10nsLgyFp?=
 =?us-ascii?Q?Q7EN/hYRpAUEg0hvKGTe90bmvSUPqKKEf0kwZc5pjk2Wz2FXu4xWrvLRSrj+?=
 =?us-ascii?Q?v0Dgz2J1n/yUDRobiNut1aM/dR2rTo3sWPqXwpva+M3oyuiSIRluyB3JkqL1?=
 =?us-ascii?Q?e3o9a86F/pYcsVWbnIIAdtK8g5bo8vQgwiia04GLyrFyiUUfd35OVKik00co?=
 =?us-ascii?Q?htxA/IfwlD5o8bFAdWDGtSfboB8F8G4yPHnbSV01eL1UQRZlQygBGj228gV1?=
 =?us-ascii?Q?M+kO+2qUd9uMaRbm79TDAjM/VqvLFDUgNRRyP+keTdsGQgTwj4F9IzZaNH+E?=
 =?us-ascii?Q?91zKPQBTvkG7/qxukfgHZ7M9u1+B3Qli5qDOxIMKXzeV8TNWHZb6p4j1+n2K?=
 =?us-ascii?Q?oKZbTLz1BWAo3RCcU2QKPsdoMUrX/A7JxaVauBLgPHVnp+/Sw/ocIefw8Weh?=
 =?us-ascii?Q?mSr/oWUPhsARiQEeMw4G3kHYZvQMvZnMvcC7vRFS14Km0sxPmPfO0/Nn0w9d?=
 =?us-ascii?Q?FBB1bPVpXtt3gchdMAkMXymilfiXRiWRJn4N0go63YehNUw9j1AlqCeNcww8?=
 =?us-ascii?Q?3EEAoNCiEVl7WrOmVSM/7FvRYShGmFp+ePgrT5Eb5g0Z2xPcGnf+MEbO//nq?=
 =?us-ascii?Q?DOUlVmuoOffyY30mrYQi55jS4SMkSaMVilTwlfucSGK0bb6cA0RRBS3ow35C?=
 =?us-ascii?Q?ZCOpP0uT02ZmvDo22rYrrGeE/NzeUgCJffKZp9S2jmsRge9/qvxPhkgP4Yke?=
 =?us-ascii?Q?/LE9YqT6Vb5wMHfjyzt/Lf+bncdnI6PeiIIYh4pMprDof8w/HjaDVhKe39Xm?=
 =?us-ascii?Q?zHe9mBc02IhqvY0BnSpqJn5qUK85Afh6agxpGeyJCfGQvqRmhvBz4INIBoja?=
 =?us-ascii?Q?PClpINawAjcDn6qq4WehrCe5d0h17GB/zITsrPqjd9ucBmDgfvBbTb75aQvb?=
 =?us-ascii?Q?O+p6Df4L7tLHnMKUardivrDAyLSLyLzM5QYk?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 09:30:24.4045 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e00b0c25-669a-43b5-9aa5-08ddb881e852
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB73.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF6BCF148B6
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UrrMVkcL5NXCyV43/CXuif7B9bkV9lZyLrVGX34iS4=;
 b=rQ5gnju+CwxDSCnm0mlRABSHWA683+1RMr7qRSweGompvitSk71b7YeGsvyk3BueXizCJAtQf9Nbisod8H8iA3M4LSPJ0f0QRWzsUie9UG+hzmtgR8UF2mXksFpVPPbo0aBO3/olNmqmFz5exnt/dG9kqA+KnhfNSxNa7Una6kE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=rQ5gnju+
Subject: [Buildroot] [RFC PATCH 1/2] package/Makefile.in: microblaze: enable
 -mxl-barrel-shift as default
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

On microblaze architecture, barrel shift instructions are not enabled by
default, but they are required for enabling atomic support.  For this reason,
this patch enables the barrel shift instructions by default for Buildroot
target applications by enabling the -mxl-barrel-shift CFLAG.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 package/Makefile.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index 829636900b..32c1830399 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -205,6 +205,12 @@ TARGET_CFLAGS += -fno-dwarf2-cfi-asm
 TARGET_CXXFLAGS += -fno-dwarf2-cfi-asm
 endif
 
+# microblaze arch atomic extensions require barrel shift
+# instructions to be enabled, so make it default
+ifeq ($(BR2_microblaze),y)
+TARGET_CFLAGS += -mxl-barrel-shift
+endif
+
 ifeq ($(BR2_BINFMT_FLAT),y)
 ifeq ($(BR2_riscv),y)
 TARGET_CFLAGS += -fPIC
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
