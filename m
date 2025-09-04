Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7919CA1012
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 21:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 712AB40773;
	Thu,  4 Sep 2025 21:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pscTGiFeOIqY; Thu,  4 Sep 2025 21:13:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 857A84076F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 857A84076F;
	Thu,  4 Sep 2025 21:13:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C79C01E04
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 21:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABFFC40762
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 21:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IBy2Kdqog4MC for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 21:13:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::603;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 261FA40760
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 261FA40760
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::603])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 261FA40760
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 21:13:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uai41wotPkuBMJzXl5/3WZICUcZbRpb1G9Xbit5fEej1Y7aU+KtjhxxcX0vSgBvwwusYCv5SYyoiBaK4a+Ql2fQfpHCuJ3NbzGzHPQWpE9hJwLYmum7BbR40L7pcd3ENCKFba0ratzTOXaT42JgMTgxc76gHQiothnYfbPgtxuWzPnDvlyqN+C4p1LI5eEjQg2hTuvSNtR8yCCmR8ozraKwTW5V6rp7iyuIyCH2uxBNYVQJ/3kJo2umhaZcykkyx7X7ChINBA93O6myC9QxLA0fil3/xv7MqKo75CVi7m/vtNvYkWDt58q1BDaoch8FFF/Et0HGYP8KXBxEL/zAkPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYhm3fC/2m3sSnG4ocnUNpiPbRNbOqdC8MjwfUtB7uQ=;
 b=r9bIY4U2uhKWzj7Dvkmv9GZWZ4K1mRbMLp2+R4/71NyJEWBiCPcjZGrN2897Cgx8qRj1pO0S251tfadxIRk3ZlanIPTCgLB/F9AVimRqdNMAqOrkf4eDAiKuufuy3s071UuUxtMjkW/yMTtwYpAJQhSoKP0pAI4kYg/bfSBeN4YiIE2Eox6RUSBDaij6JLxgyZsny6FO0ZughJWHrHotRvTEEasVpPynn3fYccl7gw8Pdks+B+/iiLcWABUJCysIR0HMmlb5TPg20weO7Zv5NU0WHFHAC66d1BBCtLccAJ85eVnbv02ShS+J4o9NkMt5gV/gnSnd7CQKp/aZI26kTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH0PR03CA0436.namprd03.prod.outlook.com (2603:10b6:610:10e::33)
 by IA1PR12MB8334.namprd12.prod.outlook.com (2603:10b6:208:3ff::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Thu, 4 Sep
 2025 21:12:58 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:10e:cafe::53) by CH0PR03CA0436.outlook.office365.com
 (2603:10b6:610:10e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.17 via Frontend Transport; Thu,
 4 Sep 2025 21:12:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Thu, 4 Sep 2025 21:12:57 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 4 Sep
 2025 16:12:57 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 4 Sep
 2025 16:12:56 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 4 Sep 2025 16:12:55 -0500
To: <buildroot@buildroot.org>
Date: Thu, 4 Sep 2025 22:12:39 +0100
Message-ID: <20250904211239.1928818-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250904211239.1928818-1-neal.frager@amd.com>
References: <20250904211239.1928818-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|IA1PR12MB8334:EE_
X-MS-Office365-Filtering-Correlation-Id: f6ea2cf3-d017-45c7-348d-08ddebf7d29f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|36860700013|82310400026|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CJDvmnT2Lqi2s/AwHYRzc2cgim8Z0FXsbHOtAedh59FKrOawX2Wo0fW/rJsm?=
 =?us-ascii?Q?WBTWhp+k2kcXe9inKHLBiUQgheHucay7YFGuT6ThC3jx/FPFiHdRyW4HkHcp?=
 =?us-ascii?Q?0SGLqtcAuhOyViqUuzCxEHsRtJYwinGIeq8SaVV0nZZcz75NFHAxFDrmWyDZ?=
 =?us-ascii?Q?9CjNJ/qTawtpPywWM0uD6bYax6Y03qOxgSdbZqkTbSbfjW5lD2/lCZUHzB0J?=
 =?us-ascii?Q?l8i4jpq4mUYYymLaFsX5R2Er9foa3DhlBU2HAolumQ2+iEJIo79G2Bn7yWYL?=
 =?us-ascii?Q?hqS26+5TNSF+iG8aMh3eJjJnrQxb3wNfNeJlgDAFwjJOD9Vyh50QYfkhwoP3?=
 =?us-ascii?Q?DWAWU2cGEqCWrKzJXlRFkGzP+Q00EK/qJTV0dhqJnw3mtbFw+lnwdjsV7deT?=
 =?us-ascii?Q?vrpEfIwPILshDJPPFm3oZ1Eh0a2R2TKy0hGX4wJgk/2P/lTmvatVoMWdtxDq?=
 =?us-ascii?Q?vFORpRpjjpPmGgbsh4X9QWse/iDJ1kMrzrGar5l5ah5w2oj2kiLygekkyAlm?=
 =?us-ascii?Q?mkQwi5EXxLm5Jwic8SK4jSe63etIv+Q43U+9knnM8Z1/jyve0T7XqfBtprQ8?=
 =?us-ascii?Q?kV/zeF6U5H7464xbsbzwsEw48xGpYTrV4nCm/y9MU73GFrGin4ewVYv3iR+l?=
 =?us-ascii?Q?XgSXCdoeYN97KdwmrPkf3uzg2XctMYooTpiBTTvi1OfcueL7ipZ56kcZw+VD?=
 =?us-ascii?Q?4WV6rd0wZAuj1GppF8Yug3iL5RDYh+sEqWx5coiEC8BEGrXLP0fnEwqvMuFM?=
 =?us-ascii?Q?MXEvmwo9dQRrRrr/uZi18DkHlfoqtX3LmnJMcElzcZOb6pVgB2V0sju+Yn2a?=
 =?us-ascii?Q?ekGuX+9Au74PUGqmu2h1PD2kBRvbh2htwSizi5RC7H5kiHPditD1eZ+xp4c5?=
 =?us-ascii?Q?4cx5xnqWjbOlzoGLTzgDDM5GWeetHxCc/BbwAqEN/t+cVhY4ZvKrQfGtAIZD?=
 =?us-ascii?Q?mzZkRa/wdzexszzOI9uClNarccvzwD08QxTeOXeOn/NWBlhagkyPanZD7U23?=
 =?us-ascii?Q?OE6r918v6no7WsncFSwWsa7JIZDeN+P2jPUdVtwkDe9zAWuH+OJ7szAZGP4q?=
 =?us-ascii?Q?WYqiJaDGCrUVlRc+1HU5f4hnKJK6lq9wmqH1CMo2s814bzgWI5hZC+GYhnxe?=
 =?us-ascii?Q?SrwByMwfyRQkuomV1mB2PIDsi8JaEiHYp6HlCEJqhbfezPGIsJZpAIAmsKDo?=
 =?us-ascii?Q?qQT2tr8aDBzWN8F9OIgRtNHNFLMZH7cReKp4GYq1prQoBHWTtjw2DTwNLDuO?=
 =?us-ascii?Q?kDmYzF/RIvNpPdwJwVlk5Em+PUOt8QUnppn2bOdgUJp8G8Q52E3s9tAWPdg1?=
 =?us-ascii?Q?vfwN86CfZg2PKO4+2QrLCBshL8RJRdR1G4c81eXoiNV8pvZX2cwUm+9wrFt2?=
 =?us-ascii?Q?mj5jVyGRxPAB8jHKjEwQYdhCq8WqbDl3S/CYxmJYnyDaoDjjnJt0Df6NmWZy?=
 =?us-ascii?Q?H1RTU13HmXtY9+ADKhQo0r70q8bOsmF9WhQw4iCkOARlaQr+h7XoeACKzdKl?=
 =?us-ascii?Q?eQOlRWoCN1VpmDReTP2IBzgi34L/CCthn5PTTeC4jnWXFRc8T1nMtsVYPYJI?=
 =?us-ascii?Q?tcI/fsZ6OxwQfC9C2+s=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 21:12:57.9037 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6ea2cf3-d017-45c7-348d-08ddebf7d29f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8334
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYhm3fC/2m3sSnG4ocnUNpiPbRNbOqdC8MjwfUtB7uQ=;
 b=3+W7MCp35G32tdm6+FvhPGHJeuc2UJeXoATF1DcuNSgEZ4zLgX1Lun4tHS5D09P/NE7oAb1baZ/860ZxdiBdQ/zLkcc8RLtL5xOaiHo04V7hqhs6d6ugK/n8DaITmd3cXA2UN2+rBr6+qZaXwg67aM2l4kU67h2ZWO/i8Azh9dM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=3+W7MCp3
Subject: [Buildroot] [PATCH v4 4/4] boot/xilinx-prebuilt: bump default
 version to xilinx_v2025.1_update1
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

Bump the xilinx-prebuilt default version to xilinx_v2025.1_update1, so that
all versal defconfigs use this new release tag.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- new to patch series
V2->V3:
- squashed the 4th and 5th patches of the series together
- improved commit message
V3->V4:
- no changes
---
 boot/xilinx-prebuilt/Config.in            | 2 +-
 boot/xilinx-prebuilt/xilinx-prebuilt.hash | 1 -
 configs/versal_vek280_defconfig           | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
index 836cd8b68a..1bc6b3b8e8 100644
--- a/boot/xilinx-prebuilt/Config.in
+++ b/boot/xilinx-prebuilt/Config.in
@@ -18,7 +18,7 @@ if BR2_TARGET_XILINX_PREBUILT
 
 config BR2_TARGET_XILINX_PREBUILT_VERSION
 	string "prebuilt version"
-	default "xilinx_v2025.1"
+	default "xilinx_v2025.1_update1"
 	help
 	  Release version of Xilinx firmware.
 	  Must be xilinx_v2023.1 or newer.
diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.hash b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
index a8dee8f129..6879b88d83 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.hash
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
@@ -1,5 +1,4 @@
 # Locally calculated
-sha256  b9e2572885ad12243e10d48d9fccb24771a528b9f27aae1b29b45f0806ce9f1f  xilinx-prebuilt-xilinx_v2025.1.tar.gz
 sha256  48fd698a16f79b9a828c35ca5b2b50fe832149d1a2938c94c0bb6a2e249b0bed  xilinx-prebuilt-xilinx_v2025.1_update1.tar.gz
 
 # Locally calculated
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index d3a73b87bf..91d9240ff2 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -43,7 +43,6 @@ BR2_TARGET_XILINX_EMBEDDEDSW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2025.1_update1"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
 BR2_TARGET_XILINX_PREBUILT_BOARD="vek280"
 BR2_PACKAGE_HOST_BOOTGEN=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
