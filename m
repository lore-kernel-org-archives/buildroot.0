Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B238F5A8A6
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 17:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D53CF82F20;
	Mon, 20 Apr 2026 17:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YBD9zW4k0Y4c; Mon, 20 Apr 2026 17:39:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E16BD820E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776706763;
	bh=6W91agiys90SglylE8WIcHaklw0uK4BhwJqTC26+kWw=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=KAl50q2ASGMT/mfWJxRNZ+uqHQ51EMkdbbevr0njX2rhKZlWf4m1IDAIsfPZhJ3FA
	 mUQj0kJfjNHM8o1sAvLBM4v3b1hptNXoTdlOOCdEvXYYJMoLA3dubGZWzg8NJuxJtm
	 8zn9EVwuTb47JzDplY/noSbald/fMcI19Dhesg17jCX7HaNBiZ2pNJpDL6lY2ZqMMM
	 ztJqrYy48Hjv0FGKZ8+lDftPEe1fvegNgwZ+2O+IXsA0RMdJS+yTJEPMeMwcmoAi1Q
	 O6Fw9pJRJa6yX8LFJAlkftEr43FH+XB6VZ7Pjb6HBMZdT6739KNzy/UcB1fWxEyr9K
	 qP9u8oCqyPVyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E16BD820E1;
	Mon, 20 Apr 2026 17:39:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C1A024D
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79F15820E1
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:39:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RRJyPKvaZynO for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 17:39:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c111::5;
 helo=dm1pr04cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B8002821AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8002821AC
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c111::5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8002821AC
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:39:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JwJGq3e+A3iiA1MPvdRRUf0dTP1BbW4MOJ6hx+MQh+SXZG7gs3vL/CABl5fDCowln0qhnkflPIf3990uzTYeSdTnMgL/t3cCZSg68S5uxUyamN95Bm3kBiKwKO/zyPdya/Je4H7EdqTC/yO9lmXG4PQP4pWv6rtYVgzwgc+0I5CSv45WOfRZWWueyFnZZpAHeLtp/8Vq78WQRiXJHv+UmEUEHajN1qo4VekTj2o6NafS05m/4Jwc+/i4lP7VHbqhQBdVEbPJafeVtP5N+SsUi5IERyxt/+D2f8Bdy2xfZSrOuRT4Y1sszCriVABYYTPjXzoaewBch+csqW9u7WdizQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLUL6nBNPbbdu92kd8vpihTxWrqF509sKv+7gTzm6kQ=;
 b=TPYr75PWw2BUT8vPOme38ColJ8zxpikMHzOX/FhwyR8n0zNIMjmlaDI7LKjJGhGFVNuQQAdPrPbZgowVyzbB1kp9LXGuEOXQVvv8p5NU/1+xBkwwGWoHtA2JzAZux1OBKyKIpXNIhwkpos2461mT7SJ3nRKjQFzlOtSLhgMsn2eu7W/pG3f4WLF2luTGkjoVH4ZFx0Q5cf7vOfemU8yLaOws12VSvuKwOaqODZPtdbBwtf01ufnhwLwZ9+d7v+VTx4CnoDJZE7oNMZ5Z9nLvFJ74JcQDGhMpXElgqx+AJ/FQ9jhjYr8oO/XDBUt6QIY/bmweTGzW6w7j5XX7BU+Uew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0248.namprd03.prod.outlook.com (2603:10b6:a03:3a0::13)
 by MN0PR12MB5883.namprd12.prod.outlook.com (2603:10b6:208:37b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Mon, 20 Apr
 2026 17:39:13 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::23) by SJ0PR03CA0248.outlook.office365.com
 (2603:10b6:a03:3a0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 17:39:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 17:39:13 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 20 Apr
 2026 12:39:12 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 20 Apr
 2026 12:39:12 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 20 Apr 2026 12:39:10 -0500
To: <buildroot@buildroot.org>
Date: Mon, 20 Apr 2026 18:38:57 +0100
Message-ID: <20260420173858.1655069-5-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260420173858.1655069-1-neal.frager@amd.com>
References: <20260420173858.1655069-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|MN0PR12MB5883:EE_
X-MS-Office365-Filtering-Correlation-Id: 15467290-cf76-4f59-1ba5-08de9f03bcab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|7416014|376014|1800799024|56012099003|18002099003|22082099003|41080700001;
X-Microsoft-Antispam-Message-Info: EmXadLvBrM8oynveu04nCzmDwLLv5D9f3HBsZnzzHoeEc12ZsMRWvGdWLZy+eu7EXh8QDM69h7SkBKnF6zkUMB0z10aB6b3MlV4DfDPgiN8r4mhMXTZGAWrjeIoJx/1Wv/+K5Y08i6cDYH/74k37kM7ctWVyRFsxlc/yFcFEHf3LF5opz7gNUYxrOozLdzInJSnTtaxtcM/JtoMfTvU2OZzxXjh66AoWcInv//YMmqjO6unfPlW/5HSFCoF8nCJPCb67edRmAKy2/1NU29L/5m/E0JlSOCSh2coMUXRh5Rra8K4B9WsiAJcqprdzCOgpCZJcOr8No8pqvQBqbeQQCSWxZfiq96mPy0Sp1NODR7F9BJY5Ok4BmHOJNKNvDiVA3RiTZOhDKHVyysm7IImttsyOBpWCz20OCX0mnRalPLFHvJR+VV5FenL+H+zsgAsdUccf3+1NI2Qte34dQnTTvcbwToD8VKLp3m1fFkM7t9qaLXftqCqLn2G6LfFYCHUIdBK3l9+vHg/7bQBb/aWsl/ENe8nyFUV/srgPtGwcJYQN/zFe04ogBldL6PQecs99zxbjsCnC9TY6CylWsgivp6j2dmHRl8TiAhSPGoct27UGhexkSLAYv5s5mQlOPVbpf3zt0F8b9KgHlPGOXpW2oXhQBkCTkARnEYxxz3i7whgNoHkDrLUBddWeXyJLO3KIaayDkhZ9CjjMox4pWB0ELwv7YoTGe3Jsl+D/GvQokEQQhir0oniD16hEaFlPno+MgVoMujQ5/DwIGSKfinPF/S8pN6gkW3ErDGp9QdNaqJ0GtngWF+JAqWvUYRTCWNh031NjcfRcTUkEHmHuxIPBzg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LE7h9BXfPvZmH92Ff7AuaksAaVRPpGitmn+9obesB0hFAqz++ac/UsCOntlaX40IeBzv0YTp1ciWoxkISl0qSAk2f/f1DcOszqJ2ggLMP5RLZ7koxYRKUQOFPbSgpl/RnlDUa4ObPUfthBJtZ+EaZk/EoiMTr20c1meM8zkXZJPFsuWmUvAY7RE9s/JNMus/HrCVjCI1ePelNgIpK6snKje+JLnJlCRvVRakZFoQG4j1gXH2j1C+0dslvyiUswtIt28H28ikf3V5uBoRu2+OFHOjYcAsptG597m1wyV0EFvaBmD1mHVSTTPh7/CgKl5ozpVz64KMRVoDo9OadaB4UVl8kXOHv0ArZ47FBYWWYPn+tlUYJeBSvS1mkRCQIun6925X0oLJPfjlbqNZfnDcDtvLe8yejRpllBL9v17xLyAbSZvm9sDoW2mrnDqimC7B
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 17:39:13.0893 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15467290-cf76-4f59-1ba5-08de9f03bcab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5883
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLUL6nBNPbbdu92kd8vpihTxWrqF509sKv+7gTzm6kQ=;
 b=RgwfUXyqu+36rukZSGnAfa+ZWxdmg8aYuPFcLC1v9s94VqdW7Us+3n1rYJkpuT91oLPwePk2FR0Hzaqgpinx7p/rcnnaVTzFP8GA4tfiJJG95IHSqPAIm+127pfoEt2OCQVcE6WocWAUSktg+9frA5faEN7WYUATT4xiGRLAHes=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=RgwfUXyq
Subject: [Buildroot] [PATCH v1 5/6] configs/versal2_*: bump to Linux 6.12.70
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
 yann.morin@orange.com, brandon.maier@collins.com, ju.o@free.fr,
 Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump the versal2 defconfigs to Linux 6.12.70.

Run tested on a versal2 vek385 evaluation board.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/versal2_vek385_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/versal2_vek385_defconfig b/configs/versal2_vek385_defconfig
index a9dd9d7af0..3096cd9b7a 100644
--- a/configs/versal2_vek385_defconfig
+++ b/configs/versal2_vek385_defconfig
@@ -13,7 +13,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal2/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA1,115200 sdd2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.70)/xlnx_rebase_v6.12_LTS_merge_6.12.70.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_XILINX_FPGAUTIL=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
