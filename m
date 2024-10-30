Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00B5D7497D
	for <buildroot@archiver.kernel.org>; Wed, 30 Oct 2024 08:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1674D810CB;
	Wed, 30 Oct 2024 08:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id La8aUZx71PLm; Wed, 30 Oct 2024 08:44:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F7EE810CC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F7EE810CC;
	Wed, 30 Oct 2024 08:44:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 619805E4F
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 08:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EB1040114
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 08:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PE3wxKXQM4dF for <buildroot@buildroot.org>;
 Wed, 30 Oct 2024 08:44:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::627;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D90F740134
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D90F740134
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::627])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D90F740134
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 08:44:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFmyI1Cfcguk450uvdZqO6ftdOc8qcJqVAPjV7F7JYYJgpgu2XPQMExBpRQYU0N2Zkjs7AQckQLLbo6ohrFEtm38ioWCiGcA0sn1r3ZDDfT9oMDDu8MZuNDmyDo8HUOgLYQcDui8cTjFqCN68UpVyjK4Dn1ZmD88sE5HsYtVZa2Do08KGbSJmfE3/IZFMJf63/YZkUwY3/8vYrvDh8jkM1daGLYNe6ByKmHIqrDda/gryYdPTWKUvNiHhd3wULjFKYm1fD47mfb5oRTDNC55AmHal80qMgAAGMJo2tOPXHbAnwtBJS6V4yC+l0X3sx2kxzTbHO0xHbQzkyqA7MqCAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aj4zhrOy1bN40IA3OhJIKDLtF3iZ8a4mlYJDeR0FieA=;
 b=UiDhqbHfdPB/+MfufrkEqljxowiZQGMqOY557tFEkTWBbdv6L2QJgUiPZZeE2O/D8MPQuB+SWUcs5C1cINwsU2Vvq8KAnJlRpb92hpCnSne/Kv1iqOJtAjVG9sxggW3aq6sRLBoEgKsIzuRyfDD2ruSM7RmJI8u9H4sv5ee/RlzzhP6YTAqNr39mAQMI1MQPt3q6vWkA2GTpPT11D4Sm8i6NZVfsXYkjqX1iKZZUS/svr6UMnqRusi9EFIj/MdVfrRipyTnZsA3GcBJTwsSC0kOMP5mYUMg11OAF48AgFDHgDMFxoWIJsPbkPoO3LrYJa2N1YMuHeuku21xcgs05Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR05CA0103.namprd05.prod.outlook.com (2603:10b6:a03:334::18)
 by SA1PR12MB7221.namprd12.prod.outlook.com (2603:10b6:806:2bd::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 08:44:36 +0000
Received: from CO1PEPF000044F8.namprd21.prod.outlook.com
 (2603:10b6:a03:334:cafe::52) by SJ0PR05CA0103.outlook.office365.com
 (2603:10b6:a03:334::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.13 via Frontend
 Transport; Wed, 30 Oct 2024 08:44:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.0 via Frontend Transport; Wed, 30 Oct 2024 08:44:35 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Oct
 2024 03:44:35 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 30 Oct 2024 03:44:34 -0500
To: <buildroot@buildroot.org>
Date: Wed, 30 Oct 2024 08:44:31 +0000
Message-ID: <20241030084431.633064-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F8:EE_|SA1PR12MB7221:EE_
X-MS-Office365-Filtering-Correlation-Id: c8aa4387-fdd6-473f-d57a-08dcf8bf155d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HjL7JRKcr5x8/z5EBP63+xKNGtmGFZeruBuy0YG0ax9YHoMLm5jrI5/ilshh?=
 =?us-ascii?Q?U+FSlLHtYrJA1xKlyhfcxzEy+VTF72ePAgt61d136RLZ8+og7gKJc3N87OI1?=
 =?us-ascii?Q?+4gr15pVXUcVS3BuZh3a51/13Jum+dcG5ZubadkHeTtLe5/hPn1269UpRgvV?=
 =?us-ascii?Q?7qPVeI7+3u+FMOXXGnsePzirfNQpz8FxNP3Jz6ANPfEeu8J5xU8VjSrU9GrN?=
 =?us-ascii?Q?lBIOEV0LEKn6lk4wB1JM8DYFs0DdElJWpNf5/o7+27C/OtzJ/lkw729tkVSU?=
 =?us-ascii?Q?KCvvAzIF6vvkLBiVw5ey1kTaJDCSgkE/rgb0ElOypMZx5o6Ld0sGRD29Fo4p?=
 =?us-ascii?Q?BwXEpVtr2TeIpbHhFhHlWdbjOhuAlpi3sP9N3Q84TdRxZoM8lC1pTDO5ddUv?=
 =?us-ascii?Q?NA22mW6BloOgeDvPPUd5p/BkRKtWWrklTCCrxmwJ1H6b+sSceHe/voDyBzrM?=
 =?us-ascii?Q?VeN6nh+A6rBAFo6gUHoSUv22ge+yb2FltOT9pyf80NSH1NX3aRCGkA3XcgTw?=
 =?us-ascii?Q?RP01uqaOg2iND7rP2waazul8/Z0T15YetUZsgsuhtFgPKaFGkJJtXesUPUPd?=
 =?us-ascii?Q?iBVtd6c8s+WCREnzBM2xNOK3FyEusYGJ0wp1dWNMWm1FUzcvYzx8gCmhcHdg?=
 =?us-ascii?Q?QrtdNDoLUMsTrHYCI4Kg3GhveNCvb/fruZ/RLlouR+i9ehpRmWHuOYtLz1BF?=
 =?us-ascii?Q?ceQ50s/nTIKOAiPMeO/Ss5PXxtcRe/aqrNmHus0ZzY4+6VBdKXKXpcdH0bZo?=
 =?us-ascii?Q?ZDyaThekTa7Jokv7EHY3uyi2LFpd9wewXM1nwrc/LtyY2n9VEG1ZQH0giQFu?=
 =?us-ascii?Q?t7bx0X0wM0+WaaQXdaCvbbDTkkxtHf1IGrhBOupeekW7IqA/l/6rC8Elna9U?=
 =?us-ascii?Q?cm+OoMwAO1530FX3q/TIxThASJ5jlQzhnUNS7cJStilGesSU6yh23EqRYdvG?=
 =?us-ascii?Q?AOBYkdGkU4zcP3NHVXPipUESxYV9bGUuJeWzkZgQed1e5NjoA9B6sbNSjrvf?=
 =?us-ascii?Q?yauspI7tp1Vs7iI95630gG2kwRFEUBPppAuJulGsL1zIryEmJBqaTOcNFjqG?=
 =?us-ascii?Q?8R83wDxfPKuYez2Nd7PuDdtk8yW68Y0boZMQNwBsj9/SSJnSCPHW7DzYw3H7?=
 =?us-ascii?Q?luagc0LpJujWpZr5H5x8el9Psj0Ou8d1qFvoJHhltq4n5YDLl6JtN2DYAnmC?=
 =?us-ascii?Q?yiERJhpowy2xtZ8V7jV2VOPPMQYWXTapVBehJuewRnFntNp8se1bt116qUGe?=
 =?us-ascii?Q?s9NWAWOHc9rbKYxYuLioLoI329tKWwBnpDVd9LPWIVDXr7s0gThPR3WvchQu?=
 =?us-ascii?Q?9wqg+c0mqoyQyyT7Bu3H8xD5KVhV4pbafNew0Jgx79mU/NStvYOoq7FhonEv?=
 =?us-ascii?Q?ClL4+0VdGHt4vXQHn7JDmIsGoG0Pp02D9vmg8V/OuykuBsZt6w=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 08:44:35.8962 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8aa4387-fdd6-473f-d57a-08dcf8bf155d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7221
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aj4zhrOy1bN40IA3OhJIKDLtF3iZ8a4mlYJDeR0FieA=;
 b=3f/cMqRoUFuOsqnzxzKAvsRSsfaUSX8j+rXqOoqR8SmYpIHpHx0blnh3ls4gtD8f4k5mHfv2bdDBmYyH44veLIs/hiicTiDW2Ct3rkaSChXzIvVRWeZ0FITsBub2P96QlyzqSw/bxSt1SO5Zuf1f6bViWuUN9iVAJU3IdMTQtQQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=3f/cMqRo
Subject: [Buildroot] [PATCH v1 1/1] package/gcc-bare-metal: align site to
 gcc package
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
Cc: Neal Frager <neal.frager@amd.com>, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, ibai.erkiaga-elorza@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Align gcc-bare-metal site location to be the same as gcc site location.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 package/gcc-bare-metal/gcc-bare-metal.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
index 5bb6baa74a..adaae6c307 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.mk
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GCC_BARE_METAL_VERSION = 14.2.0
-GCC_BARE_METAL_SITE = https://ftp.gnu.org/gnu/gcc/gcc-$(GCC_BARE_METAL_VERSION)
+GCC_BARE_METAL_SITE = $(BR2_GNU_MIRROR)/gcc/gcc-$(GCC_BARE_METAL_VERSION)
 GCC_BARE_METAL_SOURCE = gcc-$(GCC_BARE_METAL_VERSION).tar.xz
 
 GCC_BARE_METAL_LICENSE = GPL-2.0, GPL-3.0, LGPL-2.1, LGPL-3.0
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
