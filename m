Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D676ECA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 05:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 951B5608F1;
	Thu, 14 Aug 2025 05:26:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C4yzAgx-YbeG; Thu, 14 Aug 2025 05:26:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A55F6608E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A55F6608E4;
	Thu, 14 Aug 2025 05:26:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 81320271
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 05:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6732840A86
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 05:26:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hpIzCXnIeN_2 for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 05:26:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::605;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 896B440A6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 896B440A6B
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::605])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 896B440A6B
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 05:26:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IHb267ihOUWkEGIV7x/VcoKgkyRwAHbm9KxOdfUCiJ+HMi+7h+xvuD55EqFET63RNX6BSVHODubSvFP+EpmuLkyyuaiUGybQqpmSvWJ3e/6StnFmTtJD4aFAYYJr5g1AMeDzTclHYzvy+PssbIOuBXqsK5FQD9MkFvnWSNQKRCtWn7N8GmxJWlP3stW9gT5FfoVzJiHI2nL5LYIB/vZgkKlFL9y1THA3DaOZ9naq4lPigad9G1aEtdnEPYDn9WS967UsptLoKBLcRoIJTxuoeT8UMcT5Z/pvw7HShMuhJ7flfV5bkJrNkd1Sj+mPJQPFZUy+xaE6f0ZnYGNR9XT98Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7MwfqMn1gk4DivYgw+LrWuGADIBSh35wGlVp/jPYUk=;
 b=C6jaV1VE2WqdYvTzDl2coOFYIEtEvhOmtBtWGLblTJb+DUymfw6QRCVW/nNGLSuTYx9nRzFRkc5bAkbSC8RzF0IhPBh/0Dl6AyguEV50JpvR64y5jEGhHuFbT6Uudqrnn+qU7DQWxBxLNv1p/ntCbxrv/kGaS4jMSK+1I57QSJOk9vBuWOyeL8jaeEXBU83pOR9qve+smY4QZFJQCyM2cD4BiiOy55mNhm4wqLJN43Uwq8G09rwI/9Vy2bqX7AC9g53gy7r0ZHiRc2V3KeqejNZ4PL3imRXZJa5GYQ+/7WZXGaT1z1FxNsGuT3RaLRmdbIfPj0bWRNB9dK1N8VoN7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DM6PR17CA0033.namprd17.prod.outlook.com (2603:10b6:5:1b3::46)
 by BY5PR12MB4082.namprd12.prod.outlook.com (2603:10b6:a03:212::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Thu, 14 Aug
 2025 05:26:45 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:5:1b3:cafe::41) by DM6PR17CA0033.outlook.office365.com
 (2603:10b6:5:1b3::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.16 via Frontend Transport; Thu,
 14 Aug 2025 05:26:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.0 via Frontend Transport; Thu, 14 Aug 2025 05:26:44 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 00:26:44 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 13 Aug
 2025 22:26:43 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 14 Aug 2025 00:26:42 -0500
To: <buildroot@buildroot.org>
Date: Thu, 14 Aug 2025 06:26:29 +0100
Message-ID: <20250814052631.3412836-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250814052631.3412836-1-neal.frager@amd.com>
References: <20250814052631.3412836-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|BY5PR12MB4082:EE_
X-MS-Office365-Filtering-Correlation-Id: 732890b3-ebb4-4b81-0274-08dddaf32854
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700013|82310400026|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W3+1km9NdVkjpJsIID6s4bnv52MxC8km1GNGDihJE39gvCOueG9kD0wPL1SW?=
 =?us-ascii?Q?bHSLqjB4EJiHOx3pIUX8UHgb5u05pifgACXCuoUG0Wqw5S6CmSzexuN7kHM7?=
 =?us-ascii?Q?A06TYM4y89PUmvM2ZCxtpygHGmj4EzQyowkSk39jZmKYg1uubiZu9TeO+UKy?=
 =?us-ascii?Q?9JyVUNmtznVisTvntXf/C9aI032mFz0Z1FhCA6UQM6hlJsISeRwSfZd4oJWZ?=
 =?us-ascii?Q?0asOuukSguAuuysI+w0Zul8jeP/S9QPnsN6p3RFucd00hpgImkXhLa/8nb7Q?=
 =?us-ascii?Q?7uW5lhOY88QcsZYJG9udfUBjZh8//DIrPpOZmxFTfJuI0z5x/rhue5tcwkas?=
 =?us-ascii?Q?i/h6dzda/ALreKU34irIUNnIQNixf0DoQ6us44md2Rao6s9A2gKnHYtZBHHJ?=
 =?us-ascii?Q?OnPrweTKHSBjJ3zW2DkT9d/Z9nrpnB3NknCl5Adh2Z6GUB6m7gxpdbhfcnm1?=
 =?us-ascii?Q?+X7fXHbqadmIfTwYywO+eCB1iui0IXTQeJgkxJgpMoB5TWSNpcTgaEJBpmMM?=
 =?us-ascii?Q?TIor6/sAkuTkwrH7jGRAyxwbUiVY5bkvByQI/eBG+jy+IomZstYPnGijo0CX?=
 =?us-ascii?Q?kPnL16701hs7kEFOiAxIYJKSKjYLDRWilJ1JqKqwAzKYpKqlTl0i2Pw+i2bo?=
 =?us-ascii?Q?zkGZO9KlnOlTmAVfhGJT0dwzEb64cvAWrTVaCYGnUz5rNtWE9/3131bdj6St?=
 =?us-ascii?Q?7jUaH3FoV22FlOQEnSV11UPQeeOSjfWdReMT8MSKLUU9GoOC7XDwffYLzPQb?=
 =?us-ascii?Q?VZsjFj4u1b109kBB2f8q3YVhSkNXgXhPX7Qy/5ZQ87a27NUTFsh72nRE9xsL?=
 =?us-ascii?Q?8GJ1rFhw1p7zysGxu5XaXh8yhFHvWq1Kx3gkLgpMXPkzf90qRYIPggrZamAp?=
 =?us-ascii?Q?0241brh02GzAR6pyJPLBxTNRbEm8WMXcRWwTf/nR+wrU638T1W78OIUpjvq1?=
 =?us-ascii?Q?4JeBgQtEVgnwNYmHBMN4mwEl1ScXR1CCGtOli5LK6jbJOUiD7jpnG9YFtDxb?=
 =?us-ascii?Q?twJ+4RfRswQggluSO90UcqzVDSPxraRUrbD4nFgzGNm5xjEAkS43KhnJDUFi?=
 =?us-ascii?Q?I+ibuZXucZIe2RRqQoqN2SfKF4QBJ/GjF6XYqewedC9Ysb6yt1tq3ixQ+mAP?=
 =?us-ascii?Q?i1zW+1rXORzUMRZyIlLTkHSleuCeDdWqiNMqyFiEj6FLJWqhXFh8CBngHw9H?=
 =?us-ascii?Q?jczryp5ND9RJIKEwAPNPQxAoSPuTfJwzk+p5PuANgfYIOihFPFalAuZQ6hdW?=
 =?us-ascii?Q?NRKjFiE9rO4CglOYlOzJCKb7qwHAL64Kk85oj6tzcM2TV29PrUNp62jSLS12?=
 =?us-ascii?Q?bJ2K0yHEddbwxImxIX/7SKdNJ+L2LmfTl56nrAZji37dIA8e0MaLMvyyzBTZ?=
 =?us-ascii?Q?qW8S4d+PAELN1RCyQYl7hEazLddbT7/tQGKUgTe85P7iKXVil+oJg4f+7h1J?=
 =?us-ascii?Q?+ZEJlc/2YRjmkTgAf/d3U9C77+hxaLSOyAZb3oD/FS5IQnrivqpBB9syTSml?=
 =?us-ascii?Q?XbbE84ZaUegWWNkTl7/2w04MrJjjGkcuBWzsB0IekfebsXdcpUZddbda+a2c?=
 =?us-ascii?Q?kH8JMWSEMNnt7mgcoNo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 05:26:44.4439 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 732890b3-ebb4-4b81-0274-08dddaf32854
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4082
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7MwfqMn1gk4DivYgw+LrWuGADIBSh35wGlVp/jPYUk=;
 b=ShL8f7pKjJcQALZOQQj/zFJJ2CP8jq7GIdFcx6/rohtbSJpele0dWEJIx9CiaWkExkjF8S33DmGZAGgoPjSbWN/rxSxO6xwea+xGEjpy0E9Jk3nqL5oez5vEprV+SuNbKlNGMxXeGR52ptNEVjKmykXarQguLfxdwebcv4v8jMA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ShL8f7pK
Subject: [Buildroot] [PATCH v6 3/5] boot/xilinx-prebuilt: only allow
 binaries for device family
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

This patch uses the BR2_cortex_a53 and BR2_cortex_a72 cpu symbols to only
show configurable device families that match the cpu selected.

It also takes advantage of the new BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS
dependency to remove dependencies on BR2_aarch64 which is already covered by
the global BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS symbol in boot/Config.in.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V6:
- new patch added to series
---
 boot/xilinx-prebuilt/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
index 836cd8b68a..5ebfb83c25 100644
--- a/boot/xilinx-prebuilt/Config.in
+++ b/boot/xilinx-prebuilt/Config.in
@@ -1,6 +1,5 @@
 menuconfig BR2_TARGET_XILINX_PREBUILT
 	bool "xilinx-prebuilt"
-	depends on BR2_aarch64
 	help
 	  Pre-built firmware files for Xilinx boards.
 
@@ -26,16 +25,20 @@ config BR2_TARGET_XILINX_PREBUILT_VERSION
 choice
 	bool "family variant"
 	default BR2_TARGET_XILINX_PREBUILT_VERSAL if BR2_PACKAGE_VERSAL_FIRMWARE  # legacy
+	default BR2_TARGET_XILINX_PREBUILT_VERSAL if BR2_cortex_a72
 	default BR2_TARGET_XILINX_PREBUILT_ZYNQMP
 
 config BR2_TARGET_XILINX_PREBUILT_ZYNQMP
 	bool "zynqmp"
+	depends on BR2_cortex_a53
 
 config BR2_TARGET_XILINX_PREBUILT_KRIA
 	bool "kria"
+	depends on BR2_cortex_a53
 
 config BR2_TARGET_XILINX_PREBUILT_VERSAL
 	bool "versal"
+	depends on BR2_cortex_a72
 
 endchoice
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
