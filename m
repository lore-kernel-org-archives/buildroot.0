Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA35C02183
	for <buildroot@archiver.kernel.org>; Thu, 16 Jan 2025 15:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA48560877;
	Thu, 16 Jan 2025 15:01:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9mtXDolNFC_j; Thu, 16 Jan 2025 15:01:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5E5060A92
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5E5060A92;
	Thu, 16 Jan 2025 15:01:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E3B2BB89
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 15:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C090C40BE2
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 15:01:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zSK1gjJfVVR6 for <buildroot@buildroot.org>;
 Thu, 16 Jan 2025 15:01:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::603;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B701540187
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B701540187
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::603])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B701540187
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 15:01:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JaaLjhzHRjHVtPhT4vub6LNr1ihBXB3t3+LaJLhZEzuf+9PnAT8zFyzMwwKNZfLWetei8Bwh5bet+eBVtxGRUKJROXnvxf3gaP/EdrX7pEe0MOF7Ye5yl0VwF0Pr6mXGo4GyyB4VRPavNSzoZzPvS6mJtN8fXTAZPwK0JF0zC7n0Q92BVOkogLSyZtqknovCe9pkjYPTnhKqm5lOlj6g7YbCr7WmWUel3llHdntnWFXYMUN/LU4d4CMoD0MbyFcWQGdqhml/HqjghcWZ74VGSoWWXih3SUMk3uf6iGLtNsahrX7YOBFqMZ81s6VOLdnh5Llq5nqzGCodWLt1s9f2wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnneNT31gw3+j6wPxrJ4nGZe7oQn1gGq5qifdQudl3A=;
 b=YEvHgQOuGIgCtA14jF3pBvJmIawYYEu9aEJ5HFMZQejOFJuDeUV9qX2ZwMtisrWSIkGPbwc15aI09emuljG0mjVlTuZEOfM1eZAI9wBJeExZ9Ij8GZsVklaEMR5adD44Exz3jkf34Q9WiTx9F16CZq2hwF1Pb5XhpRoNQVzZswLfdUAwIPMz/pN7+Rnzm2J6keg+JAgvJG7Xo8G6XPkHryVgP1oDtyp9KsYMg+1L5ot235xkqN/gJeb3Q+2hhxdr6Yenlo9yXdTo2KDTlgOQdhWFRu73iSNo6DscIonSfFrmiwKsbooU+QVQJS7FRuhL0Tw660anIbukZd2zuK4opw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN9PR03CA0909.namprd03.prod.outlook.com (2603:10b6:408:107::14)
 by DM4PR12MB5770.namprd12.prod.outlook.com (2603:10b6:8:61::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 15:01:42 +0000
Received: from BN3PEPF0000B06F.namprd21.prod.outlook.com
 (2603:10b6:408:107:cafe::3d) by BN9PR03CA0909.outlook.office365.com
 (2603:10b6:408:107::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.13 via Frontend Transport; Thu,
 16 Jan 2025 15:01:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B06F.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.0 via Frontend Transport; Thu, 16 Jan 2025 15:01:41 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 16 Jan
 2025 09:01:39 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 16 Jan
 2025 09:01:39 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 16 Jan 2025 09:01:38 -0600
To: <buildroot@buildroot.org>
Date: Thu, 16 Jan 2025 15:01:32 +0000
Message-ID: <20250116150133.3828534-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250116150133.3828534-1-neal.frager@amd.com>
References: <20250116150133.3828534-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06F:EE_|DM4PR12MB5770:EE_
X-MS-Office365-Filtering-Correlation-Id: 050fb842-6500-4a46-78e5-08dd363eaf8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ejQzHk0lwltUPr9fXreqoRxOA5yjXQeM3l6fW6kav8T/mYHGfbO/7GMXLS7E?=
 =?us-ascii?Q?9GmsGa6rdeYUDOpLhHjNlhFPkBF1+72tephhYUtzh9U6pIdJqNm2VmHwW60A?=
 =?us-ascii?Q?bdxj5ecpbAQWArxiBVXPgLw62WHChS3aQRKVrHIiMr50O3ey+oVW37ylqWvP?=
 =?us-ascii?Q?2LCXGVc9XaGOIp1lusISHlrb5IH47cqeZw6qVyhKHUroH38f9L1lomkfqINM?=
 =?us-ascii?Q?nH5iY8paPWxYWL7ATtY0Bmoti0pU2q2HowuYd96w5bSY3B8nB7nLVW0j/6pl?=
 =?us-ascii?Q?gAG4GnXGENVdWQk+AHb3kByV4VwMrtt2Hip0Xuk9D069hkj9jbGVvtXihzZ2?=
 =?us-ascii?Q?gHvS2FUzpwOUJVgS09DQzruHiOf+ZknMgIbYga/nG7iXos4JuXv9uUEBwTlQ?=
 =?us-ascii?Q?Q+lyHQD+T0EZdkERlpC3HRJ1fig88vYikYcskQxxfCB2TBZNpQNXx+dn+mcQ?=
 =?us-ascii?Q?QLJiW529n0r4kL+EZpXDdBxzDtHH4zobCMt3Pp4zOV7a+eNE2FlXebaC0D8/?=
 =?us-ascii?Q?8MzSjM4bcAK+OF9yYgu9v5pAGVlN+nFt+ykY4//h6BVQvUJFDOdWg3wgb1pe?=
 =?us-ascii?Q?Lx9pAWFSaBQ22pNQQurejKted4BqL/6invBsaB9PBoDvYoFzz7R2F/58AY//?=
 =?us-ascii?Q?GZs+EPEXS/cCcTrHdXWIttKwz4WMMUylHAvrvRMShP05m25H4kzeUMeNvkY5?=
 =?us-ascii?Q?Wgapgq2xPrY4BKkfF5O1m37MTGkF1tG+STCfzXFUtpdL2vj50jmD5k+q6AUy?=
 =?us-ascii?Q?7H909wK/U9Tpl2nYWCt6BzOtXUbaynAqzPGCzSLDmTexNFBBPkjhCOtRNMHI?=
 =?us-ascii?Q?neNw7LMlP54bP4uYEFANS2ohdCIJgAy2hdazKC57wKDTWi/vFST+HEwwDUYQ?=
 =?us-ascii?Q?+KfHM1uWmRzZ1v+RHgb80k8INxAHJOZ1X/NVLWjSJrkKUrcq4mIVfP252qiZ?=
 =?us-ascii?Q?jKKooCT48rf9I7b4Md1Yc1Y+FJAJ1A0cyCCja4U75SBp4dDE0FEJekIM2WrX?=
 =?us-ascii?Q?yZkxFHQi8hPb1D2WSdJ+zyp5DDwS1wK7Roda6CSbMSZS8tsty5QRJJv9jjlk?=
 =?us-ascii?Q?I95oDIim7ULRmUOWSNuMBHIJJythUnmL3+kCF6TSA5Zqr+46FJtYSxEKqlFa?=
 =?us-ascii?Q?iadNh726cP2Dlc1el7rFkoizXEQhP5B1sADlK3Sj3kpsAZ1f1RKDnlpvfEYR?=
 =?us-ascii?Q?RekA9UT17Z140hOzCAv5BdXQDr3vF9hGe7FsBv21en9PYlXPpL0gmiQ3vIoO?=
 =?us-ascii?Q?LGS8D2kLSyT7Kpz0sNXp1GP2jHpuLSK9C7VK8RCgj2A3g238mTV9Z5n6iqXK?=
 =?us-ascii?Q?1f0E2JbIbu5S86scnQF5KOfd3IpGFtwaPlpaBJbMJI5bQXDmB3fL/dDCR92I?=
 =?us-ascii?Q?TlS8M3rHTiyVFcv87ByqIbqVNnGStiDTF8Al/yD8ESKsq5bjw/Drl8gQgQ96?=
 =?us-ascii?Q?r321Jgqzs2a1IWZ1hsaRVrxT/Vnv1aB4fT78TwxXRINUoF8zBuOmJRzUdpI+?=
 =?us-ascii?Q?vzNkRQBhNpA3xYiP0HOMWf+gw3Q+YM5I//RJ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 15:01:41.7075 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 050fb842-6500-4a46-78e5-08dd363eaf8e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5770
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnneNT31gw3+j6wPxrJ4nGZe7oQn1gGq5qifdQudl3A=;
 b=nv3Akoi65eY9nxkUEaySkb4mcT/ldq+A3NTc3jT9Ekz9vpHW62dXFWuW5BQKPgQau1e6NN9r5XABu10at96lKDdkf8SyOMrhIWH2Yqfb7l5+qnvL1uVH9QRtFMivOL4qTPrW3GtKPsysi+ZtLqfnlV8qhZXa01d2KP3lobL0XaQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=nv3Akoi6
Subject: [Buildroot] [PATCH v1 2/3] configs/zynqmp_kria_kr260_defconfig:
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

This patch bumps the zynqmp_kria_kr260_defconfig to Linux kernel 6.6.60.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_kria_kr260_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index 809cdd0dde..a5d308a4d5 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2 ${UBOOT_DIR}"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.2)/xlnx_rebase_v6.6_LTS_2024.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.60)/xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kr-g-revB"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
