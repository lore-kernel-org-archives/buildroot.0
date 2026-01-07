Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A054DCD5851
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 10:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4857C408E3;
	Wed,  7 Jan 2026 10:35:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XrR-kis6no8j; Wed,  7 Jan 2026 10:35:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FD08408D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767782106;
	bh=3EiZXS04hkg9WVgCIhB7mqfdCsmB0nX4zImy/mqniFs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=qYHvXzo2b5KGivvUFdr+iSf0dADARwHawtfviMTXpjd3kqn3B/4b9Yg4P2aFAVteT
	 AcOAzZ44inZotVmPYD5WfoFn2UNpU0EX35Gahkas8se8AR9cIVh8MZY0okllXSm9NN
	 UnXB+Y6SFAkxud0Iqi0t0IwO94xy0rfwrQ40C2QUkqw6RhveJIncl+YpHn0Y2BnNT2
	 O97tzxFkC6OidT+DgpqUPAO3J3dpbHB9tv9ckUCU49qkVffERWVhJvtnwyLU7wOzQC
	 OyZ7UhEbM2w1XwZaFVmrpzKqYH1gcy/WT0WzRJjmpVgxsx0WuIvrMgDTHslWgq3qV8
	 t2DdVz3JzrSyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FD08408D8;
	Wed,  7 Jan 2026 10:35:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C882A3E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 10:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2ED72408D8
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 10:35:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nrnQnwT_XeiZ for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 10:35:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c107::1;
 helo=ph8pr06cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 14B0B4073D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14B0B4073D
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c107::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 14B0B4073D
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 10:35:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGEAcloOefo7/BEcU9UDncLq34y2K0OWX4CqCtDlNMHFt8Hs5Jw1VgJ/YeimWFOYlMoZjWKhXo+VzR+AKMxWRFM9qa9dsZCCNG3FDwrP4IF6EeMxYc65yCpkCpXUAJVk28rgZsMoSXYl4V//41ADZsNEVPsync+vEn9xHESlDdlbyhil6Yrm2prlvijOhLb6iP98lRYRPfpxFf9ud9aZsIUlzsz0R7v3GaCEOb+HplVfXCXFPPq0fNnfZFHlWdS3fPP2OQ8ezUlmnoNFgHhdVViErxl1jzQvpx655BwiUrhvUi5YBeKfxvN/yCnHFYhBM7DeF2t3PlEPKptslNO6fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubArU10aXpzvqIMiA+BigMMg+EUYca609/nojLM6NgQ=;
 b=FiLPVoRCmRUIaL94YpHmHEsmV1ogvCakKPt3PYopspwRC/xi+V9dEN/P5TK0fGGaLWm/vgE0q8n+kwaeXeTBuwIWPlqbXTFWwuwtIBZQ2Bw5qJbJ9ouI+3/JsMoqeQOzVq1n4Nc9bms9IPfdN3dR/BiYRi/FiUoU/MEww3oIJb0fGeywxz4+k7eVWU3toP7XeguJepFhF29biBaKO061R24NnsVDVvLqJ+3ERi/zowz4IyPv9kB8LVKK8eZJBcn4llJfzvxlaeGiAvXxXOmhnwEFmwkHzaxZe7Cxzx2XvYQhn1ujVxgJE0OXum7uM7dX1oSLCr6HdgozBszB7NjXDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BL1PR13CA0329.namprd13.prod.outlook.com (2603:10b6:208:2c1::34)
 by IA1PR12MB7542.namprd12.prod.outlook.com (2603:10b6:208:42e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 10:34:57 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::c) by BL1PR13CA0329.outlook.office365.com
 (2603:10b6:208:2c1::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 10:34:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 10:34:55 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 7 Jan
 2026 04:34:55 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 7 Jan
 2026 02:34:55 -0800
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 7 Jan 2026 04:34:53 -0600
To: <buildroot@buildroot.org>
Date: Wed, 7 Jan 2026 10:34:51 +0000
Message-ID: <20260107103452.84964-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|IA1PR12MB7542:EE_
X-MS-Office365-Filtering-Correlation-Id: f1b90df2-579b-4964-2569-08de4dd86672
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|7416014|376014|82310400026|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jYlrBrB1Y80/Gl4AL7Nr48kwT84FGeL0pjcWmuBnNL6qhhe/+264PW7SxATH?=
 =?us-ascii?Q?DayDG9mVq71ULiZQgplmwST35pU6rbhom7m357FoqMUtr3+wamMLE/JwM7Ce?=
 =?us-ascii?Q?jzsrJfA5mIk01lKVNmQYdNPfGBqlBVowsAEsKPkk48nNRg4PoaonZSu4lq05?=
 =?us-ascii?Q?4K9GA5GqfD3/BtWOLAmcv8+/tJoo1fAI0a94itpwXKktXRZLQE8ZZiiLWiRe?=
 =?us-ascii?Q?DWMJ6EFjVExYmTv8SBH0plkZH6qlAo6w6l5xpA47C+f4vPisDaWrK9OpLOp8?=
 =?us-ascii?Q?DQ+TI7z0zYTKmSvF5Rf8nsTOseswrsiEWolozV8x6BClX76C8d0sOLQloN2I?=
 =?us-ascii?Q?4ea4XJ8MI1dp6EtQ9KwhS9XVTjH5SwRvg7xwGfmeMsvvMLtR9w3B8uQ2p5Mn?=
 =?us-ascii?Q?beFtKXAk3C1bsOsvxO6ZLHdC8YVtTNBBXo7rfTmMH1TO1/8FKish4z4VnV37?=
 =?us-ascii?Q?ooLNDL+X0J027AVRpR9l+ulwAszrrpl7rEslpcV36rAcx+9LF12h5E1g49CK?=
 =?us-ascii?Q?b9zPfYxVxaB0mRry0XWrVC6iinBkP3pbfQ7MAMHFma1sKAMOSbQvgXGOSfuI?=
 =?us-ascii?Q?tjBEXlcu0pyAb/y6e+Xomh1dKU6hx22j3LD6vge80lg6xwIkadDVqd9qsGHp?=
 =?us-ascii?Q?Bj07QpHM6Bii5LUCC6hMRBPz4P4Bf+/3s9q+Nsjj53WeUp+JoZ2pHAB4fjRf?=
 =?us-ascii?Q?sqGwcru/wifC/hNFb1xzdzzfltrrTi/NrNl1jj2CBccj87kz7wPgz9u2EHFe?=
 =?us-ascii?Q?TpO8O58+wE+7tSiEQMiF5fTGXV4q8zBTv20iIQzBJ5BXWZ4NUTNazyTVkeg2?=
 =?us-ascii?Q?SdtCxXtCWcAeTwn1TUDCW+reG9oNA5iaZeux69jkEBLAc2y1RUtoswAHVkfr?=
 =?us-ascii?Q?Q1QTIqypvEOQ1u+jlgylz34iNzb5T8C+BU2k6sfA80Rl3Z9lGgdaxGv76yYJ?=
 =?us-ascii?Q?ikvaNqBNEXo4r6OgLbs7IX0Zo7ikDjbLjfOY/LPm99aVc9LyTIduWg2CH9CN?=
 =?us-ascii?Q?tWBbeQlDYdDWW4aCC2nQW7d4iEADoge7vqWNVtC32yEIEsd6L/P09IG0HY8h?=
 =?us-ascii?Q?5t4v4lGXiqFuVPUdQl6ShaQ/5pxII8RedbHmz3swZZh38J6RhrTGFOcK9IGf?=
 =?us-ascii?Q?sx66TrO2OepXxLFFHggqXGKlMny/VwgB+T2BBEzgYjVECJ8k1YHtLBbZFtMP?=
 =?us-ascii?Q?Hwh7Imvd/gRlGyAryR+DUl3sPfDVP+/pwXi5WftiY0I+eMtQiBnH8SaSgwhK?=
 =?us-ascii?Q?7Mvmj5Q7X/X1rhMMHDLpWHhOnp0iechCxRVhb5mW+IRJjU89DvCurZuX0l/8?=
 =?us-ascii?Q?40SpSaRVQPPVOBYP0RSEScJYQfSoH45uKbphROKXTJ9GzfztGjB0/5zhpMv1?=
 =?us-ascii?Q?UitBN2hnEji3BGpPTzMgeY8wHF3jXEmS85fKlRD0giIEKgb9tX4diaRsjdST?=
 =?us-ascii?Q?9iXXtJY3Doknm3d3TiJpKMi/67nzsS6WwtQoGlVvfRBhCPDoGgLPAgi4VNeJ?=
 =?us-ascii?Q?+IAanO6oP+qOsdVsAgeJH+2QFbX/U+pCvV2BKrx/O6+v+kAtyVrhnYAPVAAO?=
 =?us-ascii?Q?poLaEkOm8WXrO6Ui7j6UYAgGhD9k5EI+Nitbkh3p?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 10:34:55.9785 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b90df2-579b-4964-2569-08de4dd86672
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7542
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubArU10aXpzvqIMiA+BigMMg+EUYca609/nojLM6NgQ=;
 b=WHiTc+h7OAwTBKao0Sx1Rti2t3eVZj7Fa46x2oV0Atsze2j9mrBLqp6ACUBFPn+6IzudmFyuZ4Spi3+VX32+BFqnDgDsq4D95ik1hIoyM/ToMiRptE+w5dZz6+je0scOWNOaXeIqoqW+ejv/F4FbufAmpTqvWOltmjwtPwVm0Rg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=WHiTc+h7
Subject: [Buildroot] [PATCH v1 1/2] configs/versal2_*: bump to Linux 6.12.60
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

Bump the versal2 defconfigs to Linux 6.12.60.

Run tested on a versal2 vek385 evaluation board.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/versal2_vek385_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/versal2_vek385_defconfig b/configs/versal2_vek385_defconfig
index 9a70a6bcb2..a9dd9d7af0 100644
--- a/configs/versal2_vek385_defconfig
+++ b/configs/versal2_vek385_defconfig
@@ -13,7 +13,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal2/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA1,115200 sdd2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.2)/xlnx_rebase_v6.12_LTS_2025.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_XILINX_FPGAUTIL=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
