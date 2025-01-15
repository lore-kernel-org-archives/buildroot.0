Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159BBC02183
	for <buildroot@archiver.kernel.org>; Wed, 15 Jan 2025 09:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAD0F4168F;
	Wed, 15 Jan 2025 09:50:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZVFWEF7RTacO; Wed, 15 Jan 2025 09:50:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 969574167A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 969574167A;
	Wed, 15 Jan 2025 09:50:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E0CC94B
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 09:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3EE683F70
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 09:50:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id upRM4y201Ys0 for <buildroot@buildroot.org>;
 Wed, 15 Jan 2025 09:50:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::62c;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 398ED833C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 398ED833C9
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 398ED833C9
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 09:50:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4+VOk5Pn502RI6HdXwvjlfMw6izd9M1Qr2bSzkWWYyefEOOuhKv2wTCVIpEBwgJ2RJObRTYrug3iNrF2m0R6sxC/bNbsSyMVJxkn7JdED+RSxpvA9PYmKNjld+DwlbCbD62UxwAR0wh8yRamcJqXbYG/gWq0yzDP5HA8teeCSTCmRq9bquHy3CwOCTNiv8dK9rlS+sQBzHYPmkjYYn4DntsMPvnNLuKXvM4A2ZLbMS5BsnO93PrxGyfiGJzgAgGZaosHEsYk6vBoxgGgIi5oz7nmic2mkD43GSvy7Sk+TbO5c6nBnPdDFNOKIFflGVvdGdZNVLXTA7yDTzOvobiJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWtqqmZRfsVGlM9hCD5oI3iIv65yy4Jr4kf4vuuUiDc=;
 b=tlCwYXllmBMQmFrV8zEHGOPtzP1pjNbfpvzOhXcZptGHlr6aVhl6CxBAEG3FfB+kpGUbmt+pRX7XfhsI68SsffAn4cOK6PW045yaITWYAkDD9OBKtBbIrFSocBk/QHZlGWO+uMhivD1SplhlpYXcutd/qapXBax6KeoRNt//jgiZvg8Jan6jDDgJKalFSaGeFMjuhnqsnEt//R+hVIO7G3klhKOp6tAdo61LYIVIeY/w4XlD4g38vXkwRkXjHHH64lYmKLUKNqayh0HAuB51ujE2Wo6v73HgFXiChpMY56VqeXQ0LfBS/wXShZj02bJW967+q3MgiXzNG/fSJJ7fug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SA0PR11CA0168.namprd11.prod.outlook.com (2603:10b6:806:1bb::23)
 by CH2PR12MB4309.namprd12.prod.outlook.com (2603:10b6:610:a4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 09:50:20 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10b6:806:1bb:cafe::dc) by SA0PR11CA0168.outlook.office365.com
 (2603:10b6:806:1bb::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.14 via Frontend Transport; Wed,
 15 Jan 2025 09:50:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Wed, 15 Jan 2025 09:50:19 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Jan
 2025 03:50:19 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 15 Jan 2025 03:50:17 -0600
To: <buildroot@buildroot.org>
Date: Wed, 15 Jan 2025 09:50:11 +0000
Message-ID: <20250115095011.2469162-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250115095011.2469162-1-neal.frager@amd.com>
References: <20250115095011.2469162-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|CH2PR12MB4309:EE_
X-MS-Office365-Filtering-Correlation-Id: eb8e20d7-3707-4d1a-818b-08dd354a05dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?638mL7lFYYqm2acxmtRD1jMq8N9hLI56wUBs9Fw0Rs9Dxqy/JBvkfhhwtIfM?=
 =?us-ascii?Q?SVrTHVc26eQz+WtOsLV1Or2whhxLdzGs+3tT1ojBUkZk7ZpZH26zvFUvbrrX?=
 =?us-ascii?Q?yZLzVkpWpfmPlol1zPlJj0cxp2XRUtnRULHtM5MRvMDj6A92edkz/vRU/LAB?=
 =?us-ascii?Q?V6R5C+zVUIKTRGOou4cx17VUed5xgkl8Bw3tajrQBXcsaFPt3SApVDzybUvn?=
 =?us-ascii?Q?YHBDjjwfUHLuqS7c2GNREI6V8vK/NtC8KJYvPRaBJP4tdXsglddgjQP/4HPx?=
 =?us-ascii?Q?QMDZKwt43CxJTwpv5DWHI6xKkI5Dgy3jaxPzD86Vaf7ObAlCdSP8mDtEBDS0?=
 =?us-ascii?Q?DMR1f4KM/f72XOExc4cTco+Q4nEv/LzWFy6IU9vS8R81oqt6e7jAud/CQJ/0?=
 =?us-ascii?Q?5HjcdZbkwxlajsm/W/bu4VFh+pVhi75WEF0KE71LD3U8Q4V5lgFPXmAqkM5f?=
 =?us-ascii?Q?99EUDsM1RWycBUjo9KY+U/JOGCEoMJYzphK8qEj8cnxErrQid6PZyf6qUOcj?=
 =?us-ascii?Q?q+TLphwITnH+QOeIVzqXTWBEdyoTSqYv2pELKIDBpr8eWZ82aFVp4FcmhaZb?=
 =?us-ascii?Q?oRyVhZe4XuIwngbNOjWiSoLT9L95zxndkOUJERmYs+PVYeVRK3i7dH8cecrg?=
 =?us-ascii?Q?ArVXqxjxXrDe2balCcaiPjpUvdltVPY8/nvGSuB0qDVeW1Xai9M9VR2HZVSL?=
 =?us-ascii?Q?/PMiMIgU/sdApjIhZrjT2mwrcQapOq7P/hq1d12pHgagLsbEuULlAZgw+Db8?=
 =?us-ascii?Q?WueSkQyvYTO5V9QeWlEZTPLitYyE8WZmi8xjJNO4sVovARWsnxPZLVeFSs9i?=
 =?us-ascii?Q?neXs65GVBbupkoL2GpaDJIQKyvWR2loi++c5LUhmtr2LOC5xApfvkqqlH3bH?=
 =?us-ascii?Q?DNARAaf2l3E+h6x30bsgO8fftN0N+Pm9HphpZyegHFKGUVSF+XoGlWrAW1xi?=
 =?us-ascii?Q?3QSN9BhN/ms0VI610EdkH2E0cPvtzIZIyv9KgwPorlCbtxcAedgiYgeEdVUW?=
 =?us-ascii?Q?MH9WETEcW0njqxkX5VX4Iv9/BFFKXK8s9bld74zg9Du9UErsyGWjjUQ9gxzF?=
 =?us-ascii?Q?l0VWaWRgDQWX+FnG0FsaGQbtoMhp+WPMwtPSwub6SXjHuSU8UbJ+JJfR8lrC?=
 =?us-ascii?Q?rh95w2IelJ8Hi0QJr1NxrxJAjbTCwjhc26RLwrbhWTIGZz/U5h+/Y5J9xWKe?=
 =?us-ascii?Q?hTzrwJnTXi8Gh23xMHA4sxzbznnhRwhb59Dok+3rYwlqVd0SssCXkrF09BW0?=
 =?us-ascii?Q?1WeoP2gZcrbsD3edwLn3cYRjCYuA3JrYR49VZLmVJsquYj8IyM+F3Ys0e8IZ?=
 =?us-ascii?Q?9QOb+tH5t1lHKewC2atcrhC7jEjBXYA0iZPNMe9lnvPEfGiNBo241bXoDgOT?=
 =?us-ascii?Q?AHkaevdzk7UQKb10S/ucv5a6Ly/48zD9oFg+MUvyuCzX8ZK1ojPSYlmJh9Si?=
 =?us-ascii?Q?iT9C5SYJFu7ZgBvpGzL5X2igyn49vos/AFcT8OAnxbvBR3P9G+Lm8Pt+41XF?=
 =?us-ascii?Q?5twQnKuK68shcWUSffvvIMel79Z2jzDzmOPM?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 09:50:19.7951 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8e20d7-3707-4d1a-818b-08dd354a05dd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4309
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWtqqmZRfsVGlM9hCD5oI3iIv65yy4Jr4kf4vuuUiDc=;
 b=R4ETjxkfhz+/ibLtJj81CgtXna1u+bmLSRDnWLtQJFrB0HwarWsB4no47ObX0HVgD+04YDyP56Z2bBKIiRmhiy3LKk7Bk0mBzjQ4EbHQtB5OgB69ZgBc7CzDN4bE0oX1Qv2aBladvsmQxtCINzFMdggbCYnbYCAHsFCz/RslFVk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=R4ETjxkf
Subject: [Buildroot] [PATCH v1 3/3] configs/zynqmp_zcu106_defconfig: bump to
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

This patch bumps the zynqmp_zcu106_defconfig to Linux kernel 6.6.60.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_zcu106_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 4c5ac16f0c..2f3edf7972 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.2)/xlnx_rebase_v6.6_LTS_2024.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.60)/xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
