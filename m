Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA20CC02183
	for <buildroot@archiver.kernel.org>; Thu, 16 Jan 2025 15:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 542DD4123B;
	Thu, 16 Jan 2025 15:01:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UzE4cmGEhBdF; Thu, 16 Jan 2025 15:01:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 147174123C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 147174123C;
	Thu, 16 Jan 2025 15:01:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A0ED82BA6
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 15:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AB5E848B8
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 15:01:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s7y42Gms8QhD for <buildroot@buildroot.org>;
 Thu, 16 Jan 2025 15:01:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2009::62b;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8B367848CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B367848CC
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B367848CC
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 15:01:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MimeeLYv9D5752NBauAoXDNH4q2skUw7bpwJaxO4yqZMDfeexsOmnutFtWs6jOeTa/plESQ3FtW9xAsMt6zbzwhMyu4x2Nt5P2NcpuFsSX0v8Ns2j7YXbiNu4dco2905/jfuEzgg9VLkPcl6cb14DdXm/mTlN57t7xje/x5z/pcZirh9FD9sv12YzVaHvHYm1hyI2aSvsQ7ReFIlLa/DBPz/td3aH+JTmWrN2Zvt/243L/HAz6z5TlrXM48UQ7UaTSWRfGs27lIlcLt9sfKrLQjcPS5E5Fxvdo9fEcGJ+vseXBxXpWD1MDl3D7xKYwJcicZYJ2uWdqO3Y01KXsBMqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRdd21Xo35vhJ1zdkBhdkxlV/2z17uZYS3Wthbbrzq0=;
 b=VyKaAG6ZDLnuVx5gYnCoaW86EOAnlYSQtMquktYe1hjoLhtugYbbqQ31Nml6zD5t0LYcyeadRveY50TFA2fY2/Rhm1KGeTaiB/vKpKEQcOcyCt7YbT/EUAcwlIBtECSMD4c0D3ggcah/xgN4EOLAJcf7/ppDI+QknqPggFzHTm95aMqxqAEtHBp3u1fh2UKUtCuGgEDDZbphfJg5aOpXpq8e0BWtZVTyd7RAQ4eFUSu0gggvp0gYez7NaZpAgvxrUDF3yawcOgPWs3nVAwIvpD+ky5ZX+rEPephrMMvbET3x1ZMPB7APQ3+/EkVKdgqsMIYQ2CHQomdLEegeBdEQug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN9PR03CA0918.namprd03.prod.outlook.com (2603:10b6:408:107::23)
 by SJ1PR12MB6025.namprd12.prod.outlook.com (2603:10b6:a03:48c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Thu, 16 Jan
 2025 15:01:41 +0000
Received: from BN3PEPF0000B06F.namprd21.prod.outlook.com
 (2603:10b6:408:107:cafe::f0) by BN9PR03CA0918.outlook.office365.com
 (2603:10b6:408:107::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.14 via Frontend Transport; Thu,
 16 Jan 2025 15:01:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B06F.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.0 via Frontend Transport; Thu, 16 Jan 2025 15:01:38 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 16 Jan
 2025 09:01:36 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 16 Jan
 2025 09:01:36 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 16 Jan 2025 09:01:35 -0600
To: <buildroot@buildroot.org>
Date: Thu, 16 Jan 2025 15:01:31 +0000
Message-ID: <20250116150133.3828534-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06F:EE_|SJ1PR12MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a8a5d01-12d8-40b2-a63d-08dd363ead73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G5LYL91wHP08nJAI0PcakTVpxcMCzfjDhxqSEGMi+4KQZwVKY5IH6K19GVbr?=
 =?us-ascii?Q?vG3mxJge7ueB1t5g47Nf0OOBeRLC/dLDUWAAftleDUeEBEniHCEEs4C4P7fp?=
 =?us-ascii?Q?8bsFDD5oMrjaBpNHAS6ygcqQ8EIfCWzaobd9DAjNsqZqRUNV0yWFwszZSajn?=
 =?us-ascii?Q?Frm8Ft1B2bJpkklghvFRLGuDtHH1QQjUM5wuA15DZfPOJ+0UtzzHmCLymXV8?=
 =?us-ascii?Q?5t4ZF3JEereFqEEF1VAZ8KBq76c/vhiW1xfL7e+AIq04Udypvm7jgTkpyKyM?=
 =?us-ascii?Q?0unvwfZE5F8JHETBlLUbJKLh+ypli5/cGOjd2IAplrc03Ayf7yAshIH3i4cw?=
 =?us-ascii?Q?SDxw3fL7yhHvKumfjXeQlfCy5Un5VFfL77vC4dqUGDuYZ7ucNWo/sMbikIQc?=
 =?us-ascii?Q?ULswTP85gnjhhg1HFK326rJ0rD1JiUzoVCr9kcVuYVb9ft9RAduEPU/OSEju?=
 =?us-ascii?Q?wxFWju12+hMhBLlrzpMrxAQyTZHDOjKnsFlxtU+m0jO3nClvpVbGbz6reoQr?=
 =?us-ascii?Q?w13lQ1bPcIyixRSYvPs6s9XOtTRKkGc+8ndLKtTNoLmVLKNyH3ef4qNiPuLH?=
 =?us-ascii?Q?iZVr3hCe6S501hKRpzHQf/kCGLapbgYEJ5zNTc36GATDsfqIJWo1wrAPTV6A?=
 =?us-ascii?Q?dK863EbA7xeY6QGU9seCRYbEBOm+fSn1garyNJTih9brv3PHYb2tlpgMmqNW?=
 =?us-ascii?Q?PAWlGGUuEbO6hsV0oXGA9fMqWXMdMEiFOJRex5x9oAr7Gp8pG7PA+PmWDp25?=
 =?us-ascii?Q?07chVaInzVmPmtk2TY5k4xSIdIRZxR+3B2IgYEU9yI7XM5AbgiFSWaxHmd/K?=
 =?us-ascii?Q?CkQPh/yxk5Ero6hP586N+Y9RHwKYqVocWTjpbUPTBrNcRgQkY3GCQXAgZkhG?=
 =?us-ascii?Q?ggKqBhZ8gFhcF9OQB9RzxPZuRUI7/W6PrYFDLBkeo12XcpWfpddlbcz2C9MO?=
 =?us-ascii?Q?YLTGWRp6Uta5YGoTeaAT9RJ7ar17tCNjq9GtG6dQiDGYM7cYLdP8olznrj9e?=
 =?us-ascii?Q?YGlgGtSVMX6/8nWeKkBLvOMqBV9hxilzHURS+DPNmU88+BZXWo3MatzsjlZQ?=
 =?us-ascii?Q?TMYtOZfcGbZv3oViVUYBk8Qiy+72fTgZtSUsTYu2a9qPXKaPiJedLtiBUyQY?=
 =?us-ascii?Q?Bf50HrtBWBCTLJ3cSJXgHAkLwcvr68ouzjAf5O7Z0UxhXFK8Rx3aQ8bXu8DS?=
 =?us-ascii?Q?gqwRG31Zt5S8MsSEmxfI4VS8XSYmoVf13VOH/5nI3Stc7GTji6ElG1V80ula?=
 =?us-ascii?Q?48MheB7SxQRZKNliU0B9KUww3Vds7fCr8u8CL3HftGIN/R64YImmxg5SLPtH?=
 =?us-ascii?Q?DydQebBXZ3SbZiFVCfAxtDrUws0CcgR3lKsGnYRH+rjqrQgm2cIT8GfIjqxg?=
 =?us-ascii?Q?0gFwzfHMPDikDCZqrH1Gcpwp29zij5yem6kCDDot2IX4ZMMyGFXHyMB843pq?=
 =?us-ascii?Q?qqULik5eEs9FDKRcJbP7g6/E2wzQA8UJH7mfdnt5zycYBnGvQiyIsB1gsFwt?=
 =?us-ascii?Q?2e4aDbNLG1DvhaCJH/7xblg7YXmywQheixlP?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 15:01:38.1763 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a8a5d01-12d8-40b2-a63d-08dd363ead73
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6025
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRdd21Xo35vhJ1zdkBhdkxlV/2z17uZYS3Wthbbrzq0=;
 b=IREqSjRCeYZ+apQ+DgiqUcY4Je5YHdFyiVcC6fuvunsMopX1+cy8l85UiP5m05qCSn+t69Ayf7t4h6K0snRozqFecGVsXVWIh+nq8yDGMqETZUHeU+8vxKU47w4EsgufYkRttC/Ayv3FJagYc6UBLJ1oJ0hc/rMldr9GilZ6apU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=IREqSjRC
Subject: [Buildroot] [PATCH v1 1/3] configs/zynqmp_kria_kd240_defconfig:
 bump to Linux 6.6.60
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

This patch bumps the zynqmp_kria_kd240_defconfig to Linux kernel 6.6.60.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_kria_kd240_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 8e841df2e8..38a5aa378a 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2 ${UBOOT_DIR}"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.2)/xlnx_rebase_v6.6_LTS_2024.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.60)/xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k24-revA-sck-kd-g-revA"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
