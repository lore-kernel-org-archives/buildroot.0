Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1E6C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 12:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 162DF415E3;
	Fri, 28 Jun 2024 12:24:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YdTwRQ94NjrE; Fri, 28 Jun 2024 12:24:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7A4D419D0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7A4D419D0;
	Fri, 28 Jun 2024 12:24:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E6271BF41C
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 12:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79C6C80D33
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 12:24:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9p1-g1Lo8kyc for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 12:24:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2009::617;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2B2B080D2C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B2B080D2C
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::617])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B2B080D2C
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 12:24:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sejbq+tEJJr335fIOtW5DWuLNq4yAtA1nwSH3t+MnYurhTR4J9cv+UpjkoUwOYIy66NEB9d7/RlQFYPlqGfNjQQwqy1U9lXrZzs/JAg4NQrU4pzmjzd4W0j0N/VricQFA+aJ6Tcm86FOzkCu+0xuIdCh8yJgbb1dSzwsqEU/6O6DAwTuHDOBSERBeg2+hK1subQHowewGm+5ZDUrpWXJJyZ2HN1I0Gnh8K7T7uxKH0Inwnd2eX3JXcT6Tr+2jmuIbvwP1/bx8i1lOFKs9F8Gr6hzKZJ9THqqpI4PVGHzVCHfBOWC3lem/1+hpag4TYk7HPtS0AByJmAluSxhjMpMvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNJAeIQ1jky2dBLqzat9aH7y7V3KGZTqpKXWoUMuKNc=;
 b=T62pq7k3Mobbr8csooIHNMFV5mcgQcJ+rNnf+HBgupcvYhukzN8bG+/toS+7L8O7AxkBVIuL6QYRdWS52ylB5E/XsMJz8mtZmRz0HDKAdzwa/TvudSYDmTNvc578JZCBg7pyEI0sWdvmlfubLy9uGFTVr0kngzQEZIOpSbNK9xH8ot3LASvNAHZOSwonGQAavG0G7iiPXrR9yO4ylgHwbmgs6isII/b4tHVypXGDkNSUn3EBvzkJN6U+6JDKmFPhq061g+u0zLyFqOa3Ml0MRgShQJNzPkkNalfLAA2Z9eDHi7Ij7TXjLjZjKr1OJ8ZhmN3apufduWQKColoqr8Tig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH0PR03CA0010.namprd03.prod.outlook.com (2603:10b6:610:b0::15)
 by MN0PR12MB6055.namprd12.prod.outlook.com (2603:10b6:208:3cd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 12:24:46 +0000
Received: from CH1PEPF0000A346.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::37) by CH0PR03CA0010.outlook.office365.com
 (2603:10b6:610:b0::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26 via Frontend
 Transport; Fri, 28 Jun 2024 12:24:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000A346.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Fri, 28 Jun 2024 12:24:46 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 28 Jun
 2024 07:24:45 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 28 Jun 2024 07:24:44 -0500
To: <buildroot@buildroot.org>
Date: Fri, 28 Jun 2024 13:24:36 +0100
Message-ID: <20240628122436.1630911-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A346:EE_|MN0PR12MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: 7508f3d4-0e11-4cef-da86-08dc976d4c00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?N9lYa09sAOgToJWBoc1WmWo0nH4TnTr1jmBKjcyG8ywjpGp3Bvm8KhDTsJBi?=
 =?us-ascii?Q?J7FLca2N4h+B9dyozkxBChtiua4aLdnD0GDjHDCfriWhBjstEYVA5SkeVZ4s?=
 =?us-ascii?Q?Mo1+mf59hLIrgVTknnNtBAF9oMtTHqxu2CUmi+aaFmsg8smIZFdDyhChDIk4?=
 =?us-ascii?Q?3NPAwIzoC9FH2Pf3V534gy+x/TUn76Fl+EqZMaG/voeqv9e4ZMqp7FIXMLBw?=
 =?us-ascii?Q?gYJSdZNINrKfQ9vK3cOB7pWJ0annyju1JksJGkcd65E5+yF1exPtP1nUpXjy?=
 =?us-ascii?Q?7eoj93tPmS6c+pzhomQl2sK+XqPfN+iShuj6eywtm/pAnDFxSpHLY7WrEZlW?=
 =?us-ascii?Q?VWRVAUL/ydkACCSyB2b93NlYJLoIj4HC7ZHDRfXVqpuXK41vDoRKoUOIsEWF?=
 =?us-ascii?Q?8mBheAD3x5EIzYI9WL+nywize10JpQiuWgvpvZha5oucxFsZTRQJE74Huvny?=
 =?us-ascii?Q?NHhk67DDc24kPmKZ5gDt35hLrr4fLKvrgxyi2nGH4QYme2G0bqRfjyDKCyyq?=
 =?us-ascii?Q?7gBYkYTgza2E6z9dw+bSzpXTLE2lZmcKwryPcjgWgDG/7+w+8B8KBBe4vD/Y?=
 =?us-ascii?Q?n4/rx2/qCBA93Ewh+uZ4vGk5NxPfrtRlrkjOF2S3fNZwvz/CottC349ditgn?=
 =?us-ascii?Q?6FPfapbVosWBjf8kh8n6vsKNIi00xagC0ZhEygHyEmmj+dIXTINmqx4lRziH?=
 =?us-ascii?Q?rtO6riNr3k6AU9I65U8DyTWwsfGxTtjCBo0H+5tldEdMPv9wIs84fURwAdpD?=
 =?us-ascii?Q?hGYKzTq5fFtYRgvGZCty0tn7Xuxwtb5rXUp/LTMRi2Onk6FWAyMByQ5lReen?=
 =?us-ascii?Q?NiMrxfUe1l5nYEB/Cfwyjc1Dn/VNScUgKD1181ZOpntQJwNolWEhTE34ihv4?=
 =?us-ascii?Q?kcNWQQRPogVMXFC+MehRGP3e6EX/MQldphPHTsyT41peOYaxOxPBal/XWsMT?=
 =?us-ascii?Q?y+8w56x7BfR4hSkPFEZpBSPkZUPxmo7qoq2qBPeePy0rQ9EUGvimS8lAGouy?=
 =?us-ascii?Q?ViGEbep+HAvqHkVyfjWf4Ceac6OjE6UvKGZrZtvkVDhG2IKq7GfpZpsrq7iM?=
 =?us-ascii?Q?KL+1E2WBV6opJX827XdvokZoXhq9X6eu9elnpiB0GrzLTTWM0n3+xKwTwXjk?=
 =?us-ascii?Q?pvHrm8kWaiAMLzVwrWmVOfWMyywLtcGNL7cblGwcLkkIHinSqPobxChaRIbg?=
 =?us-ascii?Q?oItHMsd1P9ihih9U+X03HQq5ui7UVYjt/kSnwt8yo0OwRP6vcvCBNT7Zh/t7?=
 =?us-ascii?Q?aZTPbKo6hPMkLsMXyQ49uUeLv0DEa7mFLgPOTElINsuJfx1boUxRs2f25WDb?=
 =?us-ascii?Q?XL1hBugZ43WKKO9oFh8DOgvHVniAroUIuEjVYNFs02E+lkg+mVFuISFEG3z9?=
 =?us-ascii?Q?CjVV7yJjrCfRbklKBvqUns0h7jVT7uKCW2dVnp+emBQ4MtO+39KC984SH8cY?=
 =?us-ascii?Q?zdRXNbxKpGp4C44im2K7y3V1xh7d9pvnKbiYImkfTzoTS6yJrR+YeA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 12:24:46.1184 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7508f3d4-0e11-4cef-da86-08dc976d4c00
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A346.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6055
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNJAeIQ1jky2dBLqzat9aH7y7V3KGZTqpKXWoUMuKNc=;
 b=FKrlxgqAv7y0vGCKzLwl5nMbB33YyEdN63qCh9+d1rIIqCHAG/Zbiyp4+vFVXl6vOP1aBB5x4681UF4LceiB93sghqP1LGxkuOupCu8jQmjMJqUuEwHIHgXYzobgVWie/8RBThVL9Eu7lGIZi7PV3DA7+Fnq2h4D69ReCS4rDvA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=FKrlxgqA
Subject: [Buildroot] [PATCH v1 1/1] boot/xilinx-prebuilt/Config.in: versal
 needs bootgen
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
Cc: andy.a.kennedy@collins.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building for versal targets, bootgen is required for packaging the
boot.bin.  This patch adds the dependency.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 boot/xilinx-prebuilt/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
index d3df1c06e7..a1c2075d7c 100644
--- a/boot/xilinx-prebuilt/Config.in
+++ b/boot/xilinx-prebuilt/Config.in
@@ -28,6 +28,7 @@ config BR2_TARGET_XILINX_PREBUILT_KRIA
 
 config BR2_TARGET_XILINX_PREBUILT_VERSAL
 	bool "versal"
+	depends on BR2_PACKAGE_HOST_BOOTGEN
 
 endchoice
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
