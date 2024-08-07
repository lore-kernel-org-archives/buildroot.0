Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D73C3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 10:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA9AA80EA3;
	Wed,  7 Aug 2024 10:58:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eqs6yPa9sIiT; Wed,  7 Aug 2024 10:58:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FA3E80E90
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FA3E80E90;
	Wed,  7 Aug 2024 10:58:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 304B81BF97F
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 10:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A1F2403E5
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 10:58:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dus0AnCnyOEc for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 10:58:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2408::60b;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EAF654019A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAF654019A
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::60b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EAF654019A
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 10:58:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=flGOKXRyqL0Qv/ySj3YgAoyhH/V+mYQbfBi0yJU9ZyHTfBPlxU8W3NwR1lvmg1WuDFCd7sfy4OD0tC9kODs0+JMhtIBj1N3d9ADJnNDuOypoENrL9Wni+nHjS9yQlIVcQJFfuiLZvNENKLxYu0EZ6DyzdwNO1+gypaYX1cr2cAceW5Wm5ILV2DhvR0HtzX8rAwovsPjPtQkAiF705d84PjrHTWJpQDI2pbt/pHoXhGWG6EhrnN/JSEmS0Zpm7+oGaWYwbxPiHPgdDOqZ/du5Sc5OjeEGLTFrlFSHddzdEYbBYI1xJY0r9pxJVvcpe4Gkc/5+MWUvs6kBXZxPrGB7Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0PMNfO+HUS+P9hyuHUpzqGSlgb+Rq+yqbCnwZXgoSKw=;
 b=Cs2M45Vn5skQkNyLXfrWMKZF5ZWAES5t4A9CZ1+2YGfUt0ZF1H4vRzCiK776ssunksXVGZ+41fw5k1xrNmRIe98838SQHA7ifJFK5Tmge9HLZWAscB7CVvexmxgPC5HvIVn12ofRezmkI/zsWRcQD1vODZo0rEJTpxxbTk/t3fotijO3h6BF3VJ3r09vxVrizL/bvh03dc9gMyrHjdS9y34GQpISVLYv6aU0MpBif70QMv7FA8PgZQb/okqBFVP//YEXk5AviJm2vnUSb9cfrlwFz39on/ehbZFpDu51jkynOPxVivQMKf8C3kxndD1OSIhyQejqx58Hiorwo2ITpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH2PR05CA0071.namprd05.prod.outlook.com (2603:10b6:610:38::48)
 by PH7PR12MB7938.namprd12.prod.outlook.com (2603:10b6:510:276::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.13; Wed, 7 Aug
 2024 10:58:27 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:38:cafe::90) by CH2PR05CA0071.outlook.office365.com
 (2603:10b6:610:38::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.11 via Frontend
 Transport; Wed, 7 Aug 2024 10:58:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 7 Aug 2024 10:58:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 Aug
 2024 05:58:25 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 7 Aug 2024 05:58:24 -0500
To: <buildroot@buildroot.org>
Date: Wed, 7 Aug 2024 11:58:11 +0100
Message-ID: <20240807105813.3844985-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240807105813.3844985-1-neal.frager@amd.com>
References: <20240807105813.3844985-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|PH7PR12MB7938:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e291cde-db6e-4a7d-d3f1-08dcb6cfdd1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ydxKYVF8gqvwsgO1xCroB7zsc7NTbc6CAA1Je1S6gu281Sy7koEocjnzrld6?=
 =?us-ascii?Q?m5sDIUuMDKo3l0exBkFCCB4eIcJ6gT4d9fQYxKKqhwevTnDwNP6B4oyJZYeO?=
 =?us-ascii?Q?f3a77OLJvuBEoWc07aAHbfs/RLyX0q46pEp8zRpu5OSdSoHwZ53NCDpMaMH0?=
 =?us-ascii?Q?2tjyqGgF+MyvpRGNMXzwiO5D4lsFNgKJYJcLl3/gpGvuLpegZSh9h4zAer/D?=
 =?us-ascii?Q?V4kSNg34L8BIYtMeMBQqrD7AJeWWJelo2G19eJFJTIlp1wtagubfYuCZtE7n?=
 =?us-ascii?Q?bT7W+k6JU97QRimAeKZn2UnPqFY6Oiomqj5TxNLIfn0s2KZoZz3rwdkbKFt+?=
 =?us-ascii?Q?oYMgL2Z57rE2plG9oXxamkDjYlMgUx1R2nbHiiXcgizJajcYbRAqMYo6ZY2O?=
 =?us-ascii?Q?S4xREAfD1YaUB+m8KmHCrwlI4VNOEclg4mSMFgefvGxd/5CHEHwaqOdwfKwe?=
 =?us-ascii?Q?ABOMdNSS1uetoTE3DkCrBJZ1wU8guMXw0sHuGCPv8CriAMejQJ1EHRARVBpS?=
 =?us-ascii?Q?rc2EPJ4IcPXT7L1SwZmxSBwJfJlK/M24EuU4F9qUOj6aec1Eh4l+cxtfHd2+?=
 =?us-ascii?Q?ABsD34aIglvhUcwob9wugtB6Z2dsObty+fOJWjmpBPhQcARUMwTG0gPL6Nr5?=
 =?us-ascii?Q?wovYu1g2WMXcZdedKNm/D0NXpT0dwCsRoznCY12MDvg8RkJ1yhEooH7xkee0?=
 =?us-ascii?Q?ACJR2Wu5+kbLmw0fCW1pcx4ejxaYC4k8cAPinVy1i8kzgNdIUWo4IFwDfMqo?=
 =?us-ascii?Q?1Fnm8Qm4gvb9RIh9cgotv23CGi5P+GCv9VCoCOh6oFe0cPGjhNAHKlMjynHT?=
 =?us-ascii?Q?28LdJJvaF0xwgpzvoA0pIZvhK2rL+eFXaeGcU0XsNLk+ckhrv1W6LQcqKdaW?=
 =?us-ascii?Q?TED+l+3KiWzNW5rLFy4yTCF1Jr1NN+/ZNHMTSsw1JCYvFxnHZhaAieSOLBiA?=
 =?us-ascii?Q?HIoimMnsIE2xW8CTx0Nuzp69hbyUiFshzXIaCVEVKsNP7m9hwXicXfXlvWta?=
 =?us-ascii?Q?OK/1yZe0AjkQTGrGf8Y8E1i0UFo26QDBrWybEnx2SZsJp3xIJE/ElRkPA54V?=
 =?us-ascii?Q?8Yrwcm9wulMfgREWEp3M+mJul4mkbhXBOUWLbyg9WTy2jbjIJZYIlPM+i8uj?=
 =?us-ascii?Q?v5TxpnDEOsIuItS2e5AlY+6RMaeoApBM3uV6DdzCfswkx+6aTrrIAwiu0XDM?=
 =?us-ascii?Q?MRMcqYNSGTHJZ6zXTk/VW6Iq4caTSDVhSrq1l4x625Sd6rqTWdH1SMx/ZSiT?=
 =?us-ascii?Q?zu0QHIM6ilXBFjuXktJHeHpbNpI+g6DBP0O2vxDpGlmkTdIW/+CzqxBbilgX?=
 =?us-ascii?Q?BBV94tNqmq5lYi/mH5HlWG/rtSIpOzfR5f9v+vkW2EVb30GqrODxRf/32n0r?=
 =?us-ascii?Q?XCog3HeQ4S9qka8CcjEdEA/0y5s2Mhh0LuJdPfTVRi7Xo1C60ken+43XVEMW?=
 =?us-ascii?Q?+7ULrGb+Rnm1zKTVPIvsV4jQKtSaw+YA/WMjdrlKM8fQemiPBv+/Ww=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 10:58:26.3060 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e291cde-db6e-4a7d-d3f1-08dcb6cfdd1b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7938
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0PMNfO+HUS+P9hyuHUpzqGSlgb+Rq+yqbCnwZXgoSKw=;
 b=spK5VDLD78y87T+cWccry7k9DLiv3E2dGU+5ApTeEdSHao2uy68KmzDM7nW5JZEhwhS08hGPajUNm/0rJeVvAGqCNDtzkxOD6GaPuVyrN+E6fRR/eXZ1N4GmQn2CZSBzz4DobxRvRK3yt83LUbr0fdzwzdEwFuLD4ys9349kOHg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=spK5VDLD
Subject: [Buildroot] [PATCH v1 3/5] configs/zynq_zc706_defconfig: bump to
 6.6.40
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
 romain.naour@smile.fr, michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynq_zc706_defconfig to Linux kernel 6.6.40.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_zc706_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index ce539eefaf..f1c9bd6622 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
