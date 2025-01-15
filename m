Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41FEC02180
	for <buildroot@archiver.kernel.org>; Wed, 15 Jan 2025 09:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4633D415DA;
	Wed, 15 Jan 2025 09:50:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jwD9lDVmNccs; Wed, 15 Jan 2025 09:50:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0E2540B67
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0E2540B67;
	Wed, 15 Jan 2025 09:50:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D657B8B
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 09:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D59560817
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 09:50:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N3JPTrI12seq for <buildroot@buildroot.org>;
 Wed, 15 Jan 2025 09:50:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::617;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5DD02607E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DD02607E3
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::617])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5DD02607E3
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 09:50:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yNlynp5g/ufALcMHnt9BySRQCFn5ZQ0xDMDXGTce6PkkxVq8ZxND54t9AIpIq6hf2NmKbLAWgrt+JBihnFWkE2F34fVuGkEOsiQvrd86TCzZBzWTUbGi8f3432Y3odEHxw91v/RJWg88tswFSyjuUdYlY8RMP0cDFTXK4wtSg5RefKl3drIEpMAyH2R60+RD/YqvsshjGY472L5QMAr1+Cji+u7hrwXuLu2BGDkkjUg/cAnGjLnx56J3GgKxu/xjDFqlvf/aAOBdWqNhS6w46mZ8PKc1BqBeX1SNxHK1oYCl6vL+etBR7YjSZGM2u3o11E21D/K6QJVvO6zMLaYq5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cY5kXtVHYbAcEBl0nEsG448sQRlwtix4mTnIvbe+LSY=;
 b=XH85morIaoVxJcacv3EFoB2a9+th+3qpqiheHW+IlPHnY6cDZx7W7n6yuBjmqrGOo6TKmj/CUC5U/9W6+LDNiCEJ7/HspCL7oBINX2RQNKd58EEgOwpGzgaqh6nIJeWAxmrmZNwQ4lnyezlkFo4grZbn9EnxQi3ac/ly3zJlmfezMv0D4Y85fBiqRhEA2omga4t3EMmBSp3hSOISFXZqwBiD2FZRXYAAseLcbsNl3pK/q67pMkU/aSbC7TdDDqF1KE8+aMQOjAuHfGLe2NkEvIxA6vNNdIxC+uL5k6SPHUvVvYASJCILbXv63E080RbITeh0BtlQLa32rKdOJ/SgEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SN6PR16CA0039.namprd16.prod.outlook.com (2603:10b6:805:ca::16)
 by SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 09:50:00 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:805:ca:cafe::6e) by SN6PR16CA0039.outlook.office365.com
 (2603:10b6:805:ca::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.18 via Frontend Transport; Wed,
 15 Jan 2025 09:50:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Wed, 15 Jan 2025 09:50:00 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Jan
 2025 03:49:59 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 15 Jan 2025 03:49:58 -0600
To: <buildroot@buildroot.org>
Date: Wed, 15 Jan 2025 09:49:54 +0000
Message-ID: <20250115094956.2468555-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|SN7PR12MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: ba75c557-1360-4987-0381-08dd3549fa5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FcMvEM7EiJq9SccxSF1XyDq2yzyssXyDZfREb3fvGlCPdNvfFWVFsSjmXPMa?=
 =?us-ascii?Q?1j7USOz+pEKPcD1gRJViEUpFPLh/shDKAdKZ4LqEsEjSn639proqvHaci4R8?=
 =?us-ascii?Q?dMdeEDB3/SC+qBx+qoebQztnSrHQnSaq0ayO9IybMOr4Rq60Cai7F3G+WGyV?=
 =?us-ascii?Q?wnr6Ju7y0bgGs7aVfpdt/nuXdu4LIeK2J6it2PmoyfQrabCyR6tixknUdAAh?=
 =?us-ascii?Q?vULC5lZcCsmAxgWYyr3BZOjchvEVSGZkXAnat4575ER7BDU1UklXJ5rJRcYv?=
 =?us-ascii?Q?ijX7nNP4iwZsRNgGdmpZPa2w24svVrKtW94X91RLTWda0XQLA8AjlRbjxT1W?=
 =?us-ascii?Q?FQQXsceE5+jtI77Q/MAH7kJOqYy0uqWwH3ks00tyfQtJ4wExGBkhXA241kIc?=
 =?us-ascii?Q?pGSLs+q3RCYqcqZ4GdUbxawl5u2U6WghOwxp2JQkuH/vn1UUg7SfygefFRDS?=
 =?us-ascii?Q?YVX3VLgBqyNOKPkCcB2RFL7mJYHZ5hFPqa/xYreTY5Xb1TFjlUTJIp7EEotC?=
 =?us-ascii?Q?KiiSw+7Crhp/75x0D3lXhMCrIJkf54ZhkkcspZ3lN3h15r6kSNqPjHTttxXF?=
 =?us-ascii?Q?YGtnkbRF5XC2/1KdThXxBM5joztUy1thI15eu0uAhshYTn28fvQFmhi7h8wl?=
 =?us-ascii?Q?z+83++Ykcw5XPgRs89+66mZCyR4J2OIFAUeOWR/Lx1t+AllqCZySDKUkU9aV?=
 =?us-ascii?Q?ZXPduhn0mjba2z7bVZ1OMAYYVRPvbfM2DWlJx1AKIjcVgXHCKY3Qxe6rE+94?=
 =?us-ascii?Q?bMo81sag9+DQ7CHUJbI6v3GB20CDb9C2a3qNhi+yQ/dGSBbRJiAAS7n6caLG?=
 =?us-ascii?Q?NY5g7S3VDxWURGGXbNSUquOvNM7DCHmdG2gG3GfaAssFRrpCL3fkrk4N0dYb?=
 =?us-ascii?Q?Z8TJ6bbt1YpRg4QDTsbBZv7FhplI5BZyugCmWFsa/RIJE0zIEY6lLoXArcA4?=
 =?us-ascii?Q?YeFpIS5YylGaqESpK8FLpIXjQh2hsyd2UgbRq9k6HVJGk+WsZHtEOTFtqMDr?=
 =?us-ascii?Q?JggW7CZplgKFoQ/qxuCoHE9c3FTjtpFdSyvaQ3GnPPOES3IicPSwXtLQJZyW?=
 =?us-ascii?Q?HEwuUFpveZ8hBkBsw63e36bVnv/eTc0PiLgd8hYvFf8W4x6Z4KZ76Q+h2zYq?=
 =?us-ascii?Q?XUU/R5jv0omQROW+JB3kNSswX1R0q8RxeqwZHWzdmKs/jSiWGiOPItg4F17V?=
 =?us-ascii?Q?42Zgrak1IwUzpHEwnsNX5Xrz+WDTulST0nkNSUDAHQ/SVswzGhWz58Gc+N10?=
 =?us-ascii?Q?Dc0K781jDjLUYqkJ2vacAyWnmYAKOhbyvuZvZJKsnMEuC9qlUanHHr60z0EV?=
 =?us-ascii?Q?B/aBMhNhk9uOlXRnWoEGxKLInJ/xLARLd+JDdZWiIxRHptPocFt1PZ6BWJgy?=
 =?us-ascii?Q?0Wi61fdJlATQ3Wy/1OO6x/t21SxZmY1kzlRTuNqdaF5gd2QKOx7TieO25LDL?=
 =?us-ascii?Q?zhZaeJb3OWXBL6DKsM6SYdY8SgeGOc983y/dH50laYgbmAHX8DNl8q/YcbuW?=
 =?us-ascii?Q?+VEonpdC9cqoy6AZVyQFTDpBVPQvOXT950fo?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 09:50:00.4890 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba75c557-1360-4987-0381-08dd3549fa5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8059
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cY5kXtVHYbAcEBl0nEsG448sQRlwtix4mTnIvbe+LSY=;
 b=FSdcPsUy1KE1UpCkQQU5eOZRwHMVlimsZCvEVe4/S5KvtUQWMUXBMZaOko21OG0v8QSCPwRwWVK+o2hBXgfrnAum9ugQiacOyhRDBnJeWCsWNYxBNw0G6p1+wSLOp6v7PdsrX2ehjtPtbFv5dTjSPcIlkK29L3jKU42Fiuo+fKE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=FSdcPsUy
Subject: [Buildroot] [PATCH v1 1/3] configs/versal_vck190_defconfig: bump to
 Linux 6.6.60
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

This patch bumps the versal_vck190_defconfig to Linux kernel 6.6.60.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/versal_vck190_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 21fc202b30..c046d53010 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.2)/xlnx_rebase_v6.6_LTS_2024.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.60)/xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vck190-rev1.1"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
