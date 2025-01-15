Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB2DC02180
	for <buildroot@archiver.kernel.org>; Wed, 15 Jan 2025 09:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE88241603;
	Wed, 15 Jan 2025 09:50:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CdRzhOlt9z6H; Wed, 15 Jan 2025 09:50:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7033341602
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7033341602;
	Wed, 15 Jan 2025 09:50:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C8E7D1D8B
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 09:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B49B0404D1
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 09:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hg9bEN3lRN0k for <buildroot@buildroot.org>;
 Wed, 15 Jan 2025 09:50:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::609;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9C43340BD3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C43340BD3
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::609])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C43340BD3
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 09:50:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gyrMFrBbrIflsABKvRmszLzQCgyjDeZHu+hoM3Yqmc2fE3OG4oq2bcX7TFxPAIURtpphw1jdCVFsI5cZ3+mndNznHrIn4mv2HedaWCE1Fy6dzl+deqmIfjSsNPYfL5tRL4900bphw4fPAzs1CKmlyhPZxxyCIZkPpnMp7r+rsvDp5ex239z9ozA4M7QOQqjdJlax9bS+Muusk7xO+iA4AzRpGDkM7DJe+WkWQsIVGghdX03CcAmHQIPDUnzlgQRKtA9nT6iba4x/yA4fVcenbqK11U8LzjLi8+eXn67Scdamp5ndbBQg+O3qI/6s/kwMZQ1lzVR4pHjrSuzBDHSR+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPNEsWWyWMpGbi6PidEyLX5CsaOT/p5RD7GhmFwMSBQ=;
 b=LDi3GD1EV+Z48IxtukCLrAXPTQLPWjllQMazwjhz26hLVIAxg6/l6oGkmqaNqo3ZOqA1uRIQgGLJ+SslQH1Hd067s7k9XZ+POWzkzx99vIbk9HgC9EjP4nBzJhCOy2yxMQdvd9RE4zmcZ8Prs/arj8UtiWhQwlY2WIDJaaocyj7HnXlmcKQVNRF0zfebzNOhZGSq6zhu7IKyR9Lt4jgLygXgTihtfnEsXFVYeiQxO2dpC5ZDl3ESYKJWLdoDiac4FrKpGavn5kmuJTEWUf56JTgRq9eS05VLwWmwEmPuOPg6mmyVyPl/QIiaKxUWsDE/5ZzH/xA1wKoLsxiP6X6czw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SN7P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::24)
 by DS7PR12MB5814.namprd12.prod.outlook.com (2603:10b6:8:76::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.13; Wed, 15 Jan 2025 09:50:16 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:123:cafe::ee) by SN7P220CA0019.outlook.office365.com
 (2603:10b6:806:123::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.13 via Frontend Transport; Wed,
 15 Jan 2025 09:50:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Wed, 15 Jan 2025 09:50:15 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Jan
 2025 03:50:14 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 15 Jan 2025 03:50:13 -0600
From: Neal Frager <neal.frager@amd.com>
To: <buildroot@buildroot.org>
Date: Wed, 15 Jan 2025 09:50:09 +0000
Message-ID: <20250115095011.2469162-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|DS7PR12MB5814:EE_
X-MS-Office365-Filtering-Correlation-Id: 40109cdb-847d-4c0e-9f7b-08dd354a0320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Pns4uM9nSIY3K9x2mv2S4TxCiKusm6wMh14Tu3V4pXuXNyZ5V332FfXmXpBK?=
 =?us-ascii?Q?Dkfrx8ANWktcv7X5hfoNCRgQ3uH5Pxx1g1QAonQLcbsV3q735d7BONBveJpj?=
 =?us-ascii?Q?qyTzc2Rs4oj8VYySPwwcQ2XDzN02CaWTBIYzunQhhOsk27NBS5r1P0rCMN6h?=
 =?us-ascii?Q?Aenay7SP+zkB1CULfjT37G/Xz95giYRdfuCKB0d3EXmU/QVGTEd924GtAKT9?=
 =?us-ascii?Q?Qoky81B93ALQjNlPlvC8uNLEtwCiNL22gB0BdfBp0SrdGanoeE/BGMMoGp+d?=
 =?us-ascii?Q?QKzsLF+Va8Xl/Si+H8pdXOBfBSIMkc1Hncd9gvi9+3w21vGChkYrHp7R0gnY?=
 =?us-ascii?Q?0fCP48HB9Uy1hp1RwdM1tQzHMKCSrswsjvHdlARa/DcXR4uMrKAC7eZhe0zp?=
 =?us-ascii?Q?6H4P0nwVOfyfEV3qNnUfAHfxfH0FfOipzzo6R7h3PPgg9QWw77Btr+fEhKf/?=
 =?us-ascii?Q?2UU/x3zM6aEYd/TzeFXBsIOgX/3hYtSdrjGv9H3iVvcXpHt19jhoMTzfbjzF?=
 =?us-ascii?Q?VtKAg4Qiv8GhWKF+lNiUBRpYSnqfV8XMR+HjHWkDZoyLwxxYq0INK8HPtZTM?=
 =?us-ascii?Q?gmpFVM/WRwSMCgUlpVxKeeNLiQU/5s6CBlS3+3C3pVzXh80tXh5272Y8Foe/?=
 =?us-ascii?Q?uPaOhwTa4jV/1YN8//g3jvShSne+ydYISSTeA7CSuUY99uFATgB9pMob1FAX?=
 =?us-ascii?Q?6XBU5wbawrFnK3A4xn+GkmYG5/shoT5uEmX7z+S+U4aqjiWsQPxfIxRXeMGA?=
 =?us-ascii?Q?EwpV2AHwREA2BVWD2Eq4I2laa6zyT1bHHEuNgopXa03nrNBzSQ74skZLySXm?=
 =?us-ascii?Q?RoIo6Vsu8+sexsXUVSamyHNFN8q+ec8Z5HLfUlA9+dgfWAfI1Kqfe2fICUzv?=
 =?us-ascii?Q?rdvIszNxCg8wTNqsSNb47XO4rz0vUJIfgMJGn08jpvY8zGAQECLK2YCMD/dO?=
 =?us-ascii?Q?DtnIHhIt/Kzno6KSxpjDH+HXtlI6tlDFhRwK9FqG2gcM7D7R2iHAKyCbCAms?=
 =?us-ascii?Q?M25BcMtbffJc3xIYoNz11O/Aw6uHvQ7GxvfB2LKDxGsDWTMW+S+gXs2YAKXg?=
 =?us-ascii?Q?Bb09yN7f6IHU5twI/3ILqOvk3aD1cwyJ1SsBMrCGwcpM97vgtkdzpkYRPgkg?=
 =?us-ascii?Q?1Gc2ASffNbJxOmCzpQ65xZHNaSgBCXFbDv5vrc7N4wo2rUAbZnz7/TvZ6x1R?=
 =?us-ascii?Q?hclimjQjfK1WiffN8KqInF+6rkd8XNP/oMm+PXl3qdba7y9YwYc2bgMu+gVD?=
 =?us-ascii?Q?mxppQg80d+YWmyoC98pSMATrwSqO3fuMZNr9hdtJjgarHZeluEFuhY5M8J+E?=
 =?us-ascii?Q?UtHp8XOvRAistU06eoSVQjzfoHFYKfT+2WgJn5v+8XwKvYNdwJe9Hg9/Yu8T?=
 =?us-ascii?Q?wqio3HZdqghHr927zIqiQ0ujXcRs1izxmysc3RzN13NxlzW8ZPNy+J0jOs5a?=
 =?us-ascii?Q?eoGSRpIX5NPPYoy4e9A00zAdZdewMioEo0tl+/p6UuQ80hrLamXBKLPH0FOM?=
 =?us-ascii?Q?1g+6SjnFKk9QFtyXtND8sMFky7qJL8FBImDi?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 09:50:15.2018 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40109cdb-847d-4c0e-9f7b-08dd354a0320
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5814
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPNEsWWyWMpGbi6PidEyLX5CsaOT/p5RD7GhmFwMSBQ=;
 b=FqONGjpR/RkJyN6/WywhkSy7rMcyvIIr+T6g+3kp4So0c7DcpHXZkQ2cE8YFbwN8oCKgAXq4QunqJ73HJ9PGig53tXtNqUVVihnglHSCLJWRKPFfbkCvcGvyKo0og4agMrvWAhf/abtUccf74z/NrHMUsu4B4bF7SNS4vrjAQhs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=FqONGjpR
Subject: [Buildroot] [PATCH v1 1/3] configs/zynqmp_zcu102_defconfig: bump to
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynqmp_zcu102_defconfig to Linux kernel 6.6.60.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_zcu102_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 1ad2a064fc..849f5bd811 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.2)/xlnx_rebase_v6.6_LTS_2024.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.60)/xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
