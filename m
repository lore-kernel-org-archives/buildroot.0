Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F75EDA687
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 15:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB61861209;
	Tue,  3 Mar 2026 15:47:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KOxhLz4PRkUE; Tue,  3 Mar 2026 15:47:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97647605C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772552854;
	bh=j5kO/7LrzCM7yVM2GWrGZdqKp7+fxlpkvvToJQ1chdI=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=SydqAZ7psvHxh1TfIbFbGEuzrRwgpDl7TeYE0JZrsvAY3iqOY/+QNAXRt1Nbrba1d
	 9Oes4/E6KK69uhlNgLbyo6sdgm+IRLHBnLi+4vmW2lvX6SxK/LJYrTr/XwlhF6yN/x
	 ZAYNVb2R0S3XEdbirHmk5zgVvR7XL7PtRUj0KlJIT/Nb6tf9CNvJae75b7GH+gd0Tl
	 jEIIqR1/iJbhlPA2GNDY0KIQOgxQmceuH2tOa/3TRS3SqvcmvgejmEsNjf0EsWjauo
	 ri4OkaGlm01qgQizSgToKjliLM2CkkWjz4vvSncbnKQXaCqFl2htl8nRIqKRRZ8JTq
	 45cYGUDBtnw/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97647605C6;
	Tue,  3 Mar 2026 15:47:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 347CC2F2
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 257D4815CF
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:47:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kfJO0ljIFulr for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 15:47:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c105::1;
 helo=ch1pr05cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4D3D58156B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D3D58156B
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c105::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D3D58156B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:47:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z4qSTPotTFjtpyg/Ogk266UlCas0a1w7qPj/5VrtdcLQGCrLzOkjfFXmcdaJiKY81lm4adCmDfPM46EUv+4nQ5AQAnf4wfsxFXa4eSlxTTjQnzMHs/xvFsvPPQIyPwc4TjW91weJPBLqIJmPVeLH7bc9AaT65Dm3yQyPZVIYYq4S8JDdH11w2cDn7dZkcD7/L3RvBYLzy40JwJbRqEPxSxdGlYtwhj7qVxy3JVyjhXsmwpVbtilZv5O9dbugNQwvqx+Fbak7rdyoJX+5csX4ucTeMujqTtvVme5ivlp4muj8/JipFQkZpEG/miwVQTLJnzkNWs0RtNQP6R8EIHVX8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJNiHN4cx1T4iU7pCgFvBvc5ud+zmfu2cV6L+Yuoqds=;
 b=ds+umZ/BGs28Kw+07rwhZF4ADbpYyl/DW+ORe2yMA5/6/ZOe03UD6OdPq8jotZ/Y7hmJdR10Z7EqP+ekpTmrjF+2PPDWgGtLDLzsjR/K7ltVTnk+HPvU0vYTZbZolleKP6ciTgDoln9zk3k3Q8zq4p61rbbTOaf03sF4ZmT9vHTa3GzkkCXWyr4ljnMOpDhpA4t38N2RZN7IHfEE2f+U1gG2p5Nw/g1GfAXLnbkpFAMHcbLfn6n63LBUaccgn+jvXUkLmETamDEpOMmR1RAQc2t+JKwzoPe7Ea82f3+lF2fw4nO2CD0Q9MEVci879IHhJ2NIXjVA2TXvyMq8mML4pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR05CA0084.namprd05.prod.outlook.com (2603:10b6:a03:332::29)
 by DS0PR12MB6654.namprd12.prod.outlook.com (2603:10b6:8:d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 15:47:24 +0000
Received: from SJ5PEPF000001CE.namprd05.prod.outlook.com
 (2603:10b6:a03:332:cafe::6a) by SJ0PR05CA0084.outlook.office365.com
 (2603:10b6:a03:332::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16 via Frontend Transport; Tue,
 3 Mar 2026 15:47:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001CE.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 15:47:23 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 3 Mar
 2026 09:47:21 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 3 Mar 2026 09:47:20 -0600
To: <buildroot@buildroot.org>
Date: Tue, 3 Mar 2026 15:47:15 +0000
Message-ID: <20260303154716.2122822-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260303154716.2122822-1-neal.frager@amd.com>
References: <20260303154716.2122822-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CE:EE_|DS0PR12MB6654:EE_
X-MS-Office365-Filtering-Correlation-Id: 410ba4b1-8136-465b-46c8-08de793c29cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|7416014|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: 6rIiUv7Swzw7eDxCx/PIul5jnwU6M6y4AHplMFoPQDxURvrS53gGcv1uzIt3fk9YCS2scePCqT9dc1ucyfYx5j1VvfrQ2QgqbAl0wBLISgWkxTq20kY4oEblmT+8KSHE9bK2nRuvvUv0HiCD/syh24y5/ys0wGV9nV+MhRU14ULDsYH2SiZ9Wc/mJ+Axv8Th5BWRHA5Hf2ZJUg5hrVtbgvVob0IkKRnVrbcAzBXHzC9lYZY5OrFcjoNCLKPY3+y4XJzjZ8cMRe7L9D9j62TOqUWastiOmE4ZxEfty187FyDoNDIc8UKKNzgn1UTmS9w3qUfabQg9a2eXbaLt4NMvTDhYZssYJn+fdrnjnNSeeWJC0QiHaUULP0vdLnFub/XkF5Ob0lHKua7VQixelST0MRZR+CBne25DD8SHB+NNYsuYydHVXlcqO3D+7gjLJkLxcfpTIQvzfhfnMcCxTes3RwrrzDxdAUjkyPM76m304l2OFU0C4SUh/c6ut5747j9831amFtNiJRoxqYQ2bd4SiqXS7oGu/HiNgKlzn0q78/79cA69O3h2ol5tFhlKqAWfdYF/UIOEuwQ4dOQCieNEmwEuu1OeHnGN1TcVuG7bZwQlDmRRVHFbjDhLRLMNb3WAF9b4VxMShvUPuTqIOfhdNs4DgwKuH8JyhUlRSZAPY1WCf01elCuCH68UicqTZP5Z4odZmocaFdsUn96u57d2YzGnnr2jHJebk5ADF9svD5YJi9tmapB6qPUYgPgKD1vTl1Z8QTf7iWn8eyUAIhw3H86AOOjPbH4KG/Rn0SDBfLP8vnftu4zy5Eb6s8/GN8/CQ8/WFMagTKAUJpXAUKFiZmDGHHkSDFe56whSr7Shcp4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Syd6KAy5PJq76HZYTIViciwIePO+KN/aG4WVIpTKuJXc7yLX1QPaghTieKHpop7PhEx0my4ZsPuErVfyIfxmTLyP1nmdKl1gqsqHcGGqRFwl2K8iGSwzXefsltIG0x7a4H7LwDLfGaGU5fEIa+k0hBHzDwF4rcXY9czOysUq60adbY2qJ7EFQpffA3y57ItAtyuzYsxUSOtldMPAtY5ai8VyLPMplaCF2SzxZH7h50zUn6Od2bWHcrnO6LhVy4o8xtwKIziyM7wjYoeNRnsy5UWxQk7VQdSCW/V6uuDDjEqVPd82oi3ApUTLTwkrZeyA6OVqsmHQaJ3JrIP2d2IsK8XaaMV79Ip7areo1ovgF4CfMiD2tF+ph6aR8efGvRmP2+JT+KpBt1dPApBQcEdXAIE12oZCJW/HSr+Bjoarsz4wU0UnAWjJeTl+Yv8f6YMq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 15:47:23.8362 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 410ba4b1-8136-465b-46c8-08de793c29cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6654
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJNiHN4cx1T4iU7pCgFvBvc5ud+zmfu2cV6L+Yuoqds=;
 b=sss0fywPja1UDVc9c/qtp+CGDwobK4ZiT7LUCpbI73C4koSVXUDYRhzbUjroMWhfBsmTiu4FUwrDIBT3Uh37En3ivBid0m1XtePCy+rbHYBRVr8So+do+lV1ZupN2PjTHM5DZjqG7yx++wnYjyVrv0WAOIBXCkgiYumia3feaEc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=sss0fywP
Subject: [Buildroot] [PATCH v1 2/3] board/zynqmp/post-image.sh: use
 LINUX_DTBS variable
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

By switching to the LINUX_DTBS variable, the post-image.sh script can now
work regardless of whether a user is using BR2_LINUX_KERNEL_INTREE_DTS_NAME
or the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR for custom hardware. This simplifies
the transition users will make when migrating from a zynqmp evaluation board
to a zynqmp custom platform.

To keep the example post-image script as simple as possible, it assumes that
the first DTB in the LINUX_DTBS list is the one for creating the system.dtb
filename that u-boot will use for booting. Users are free to implement their
own post-image scripts for use cases with multiple DTBs.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynqmp/post-image.sh | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/board/zynqmp/post-image.sh b/board/zynqmp/post-image.sh
index f44b66342d..c1a9062909 100755
--- a/board/zynqmp/post-image.sh
+++ b/board/zynqmp/post-image.sh
@@ -2,13 +2,8 @@
 
 # By default U-Boot loads DTB from a file named "system.dtb", so
 # let's use a symlink with that name that points to the *first*
-# devicetree listed in the config.
-
-FIRST_DT=$(sed -nr \
-               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \
-               "${BR2_CONFIG}")
-
-[ -z "${FIRST_DT}" ] || ln -fs "${FIRST_DT}.dtb" "${BINARIES_DIR}/system.dtb"
+# devicetree in the LINUX_DTBS list.
+ln -fs "${BINARIES_DIR}/$(basename ${LINUX_DTBS})" "${BINARIES_DIR}/system.dtb"
 
 BOARD_DIR="$(dirname "$0")"
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
