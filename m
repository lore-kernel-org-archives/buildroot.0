Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F1BD6ACF5
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 12:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31EE440FFD;
	Thu, 18 Dec 2025 12:14:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id movepeDs7KV0; Thu, 18 Dec 2025 12:14:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D17740FFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766060085;
	bh=2CndXVmea2S2reql4Ig5BlM8mS5cERF7HNEuxyDA4gI=;
	h=To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=e9EvzsKDYVThIx5DHOkEgkPFH9vbmhW3DXAT7lDUUJ7IMBoGKoLg/D2xohQa1+YJ9
	 hfxb2PAO5PAmZjnj1mgraPhJc29QWgP0zrVcdJXiI7p5enfG60ynFU80abhuzdVNnf
	 stbdphCtUpoa81GIU77toKsubdrkw/gocRXQ4JG/M2kqgpT+ifD5dYNESZ2Hq66fc+
	 AwruKailcBgW5+DqWfxz5JVofSLOVwIv9+LmJQ7WTuv2Y5hq2+fRWIjR6yPYqFsmDY
	 u+AGtRq5M9vJVNqPceMvHUeRkQeuibTDOe8gfryzw9AW+Fg3L39gC1EdVYqwK0cYu1
	 PQSnm5lDUBbYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D17740FFB;
	Thu, 18 Dec 2025 12:14:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 56D5A2A2
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 12:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E63D40FFD
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 12:14:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1G5fOQXdIfmR for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 12:14:42 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c112::5;
 helo=cy7pr03cu001.outbound.protection.outlook.com;
 envelope-from=s-sadik@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5D9CE40F44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D9CE40F44
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c112::5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D9CE40F44
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 12:14:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qcCuVCelZDcpd1ZYcfB1N0W8tlNEohNAdzg2OhZ2xMOlHXJnaczqWXwyoaozzn9Wo4KwReIEn9FZ9u5jIaBWQ9yYQOlrC0KqQvLqoOwAGCTYCvp54BEG+QPL9j4wItj7qOhQwp6gtWEeqZh7laetVRt94b9+5vfYMFGCOmID8GUmInN1ghV0wFxomYjolwr/gQONjUnJ6CMdJkh0ZRSu1lgBabkCAUvcHr0g5u9cVIfB4DYHgrIAcycZSU/WUwdom82YfIEvI7zgiyx8vN5go0JXIDj3V/D6wXOY3fYsiQIeKqzFrefXtobub17pYCJflwqmZNsEN+r8ntg7vQhI5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnyPQsQ+2sUXspHmNeio95iRl1Urfp7iIz/ZnZYAEXQ=;
 b=pXi6bmzvSJ55vLV08ZZB7q8iTcJrhOp44VsSLAs6EXg6TzMMRR8jHjBuQMFiTXKdOvLyfuJnjanrskOfM0KsANyITcsoVKat9dexVQwZWS5VtuJt8zJ4kjlqGoMueQ+zkUz9OOS04jakzFriau/KbecG0WoV+xM8nS/T3q1XEAjCRXvuvzWI6lyslL6FsH6X/8+WqXwF7FIdtOabLH2BwDPL71dUV9IqeKlzT1SrhY2DZ2UgeDz99/yPzqqQV3GAIO0bE7W742o6QPCWm0/Ui6Wtop12n1p6hQIT9HaKxfPoEcVlptAmgUOU02HRZiPX/HKmymI5UpfNbjOUNkpQiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
Received: from SJ0PR03CA0366.namprd03.prod.outlook.com (2603:10b6:a03:3a1::11)
 by DS7PR10MB4989.namprd10.prod.outlook.com (2603:10b6:5:3a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 12:14:36 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::a8) by SJ0PR03CA0366.outlook.office365.com
 (2603:10b6:a03:3a1::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 12:14:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 12:14:35 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 06:14:31 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 06:14:30 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Dec 2025 06:14:30 -0600
Received: from sadik-PC.dhcp.ti.com (sadik-pc.dhcp.ti.com [172.24.233.244])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BICESMm3274415;
 Thu, 18 Dec 2025 06:14:28 -0600
To: <buildroot@buildroot.org>
CC: <kory.maincent@bootlin.com>, <thomas.petazzoni@bootlin.com>,
 <fontaine.fabrice@gmail.com>, <ju.o@free.fr>, <lothar.felten@gmail.com>,
 <praneeth@ti.com>, Mohammed Sadik Shaik <s-sadik@ti.com>
Date: Thu, 18 Dec 2025 17:43:59 +0530
Message-ID: <20251218121358.2002015-1-s-sadik@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251216151449.395253-4-kory.maincent@bootlin.com>
References: <20251216151449.395253-4-kory.maincent@bootlin.com>
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|DS7PR10MB4989:EE_
X-MS-Office365-Filtering-Correlation-Id: 2663d8d1-88ac-4259-45d1-08de3e2f0286
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/o5CH4iFJsI3xM5TsUlJPRhUyf/XZfqjRkALohrvRwwxmnVK2bwmmq4HyXXy?=
 =?us-ascii?Q?VW78GMDxvHJNrh8WdWAUL1zl7eY3CRZMmkB0x2W++54MRN7KE71Zqu1iuFgI?=
 =?us-ascii?Q?7O1qrkFFK8D8sCnggnFch3vsJ0C55v4VLJWDZPoIrdtjnNu0jUXqnbkcVxdG?=
 =?us-ascii?Q?Anc0/p2zLQVN9aAViQDFDfK4zDshA3SrU7vjXt//32/UAEOYALU1rnjnJNoT?=
 =?us-ascii?Q?RUSS3vWvFtIOVFfdTREDzb4yaC8D8lqPhiVHKRroUsRpUyiW2gn3UxdDbAtT?=
 =?us-ascii?Q?9si3C7mYxFOEXL4KtHjTlu/0bkh56lwPJ3k1cGNr8b1w9UWcpNx7TJhIkcMa?=
 =?us-ascii?Q?BF46/wnkpF6m6sglMt6TE8pTSctbxRblc+MHhNbbiM3JnROng+TkSU4FeFX7?=
 =?us-ascii?Q?l6lbzo4+CbRyH1ww+S/qq2SyEdIX/phJEJ8nlMh2B+plG+kbcz/jZcsETwai?=
 =?us-ascii?Q?qFSt/oT2y9I2VhYj8R2amXU3u4cPTS2dS2tbk6Ic4VccJ4QoPFXRlaU7G3v+?=
 =?us-ascii?Q?Z1rA7u/5MvaNSlPiYoW5/z04eGfGJzgHpcr1BIw7O/dLV+Z3CSmPToexoSVu?=
 =?us-ascii?Q?yX+LF2gwfOl9QxIYBBqYwpkY1FZyfCmqjxv5tP3RLwWZPmDrj+9n1BfSpgR+?=
 =?us-ascii?Q?ioEFXb/oZaIWLStSs0dKQLdFMxcWexvARlaTyBOtgAQKMfrRznk7RJAQMC4l?=
 =?us-ascii?Q?NGuWd8+kwSYvBbufNSbc4VAlrWXrPM8c0oz7MWd1dsrumcdV4JGAfLhrgXRZ?=
 =?us-ascii?Q?bzqeeGEVWZlEaU4elSmqFb0HPpxEtrpuCKKyPhKsmEaJsAS/8zyhW7JFyPFn?=
 =?us-ascii?Q?gStKmP+WlNGBtMRDNZ01gJulb4U0HFFMs9HSDJweWAKeQVyMDi/upgVv56bv?=
 =?us-ascii?Q?kHyJaAsRXIp8+pRv5dRR7wgOMa1X0oaBgty4Z6o5IZH3NGtwc7GGIAkPBkLm?=
 =?us-ascii?Q?m56FWdC/FSAbzeriD8mHAHVbSAnn7JB6E69H85lCAKV9aSfDRqQzSvafjPgz?=
 =?us-ascii?Q?kYXtfc+4kmcbsXmb5KxeJhtT5/f5KAFt4ziclbyLan0X0YZ2jN+uFe99ZeXC?=
 =?us-ascii?Q?iUhjgLXWbdEj452ooDCIu4zVLNB0dJk0ApViV7qSlwAoofligoAV6KmcXqC1?=
 =?us-ascii?Q?0P+ex2OGK6BsVqALXlJWvTAO9K8hGJ3QWVpCrFDLDw3U8skml1vKmkZkkCVa?=
 =?us-ascii?Q?eco/MIPCbh0jw05UH6s6eJTlmVnUVs7ahAXnJFm/P7imTbjAp2/h7DGh1fIM?=
 =?us-ascii?Q?ldb6k8I2/XJUEBW+K1GJR/rI3M0FJ1kJVQPTMZlNjf5BeLtsCCFX399jfjeD?=
 =?us-ascii?Q?5rMK/WnqSi5t4p2GwCm+2d+DTVobMf973fO7Jiv3tuL5UpmcoiA5cYLwcvNz?=
 =?us-ascii?Q?EV8R561tYDirM6EnEw0z6PJZB07VgVHYSLrYa57gx/idQ4HrOmckWp6WSe4S?=
 =?us-ascii?Q?WQ7YE+8sADDsEm4TetGGXh/+xEJkOoYx6Scu7PmAvu6einGtcJtPKTSZRdy+?=
 =?us-ascii?Q?GgRJ0vnA0sL3wKemNIKN6Nh+vXFLDp9mME4fqcsRRKN1A1/HSv9rbMOQNesX?=
 =?us-ascii?Q?oYiDokraZ1Uf/19lzfp3HXkuwLjrjJl1Fd/gjnDmpfce58M2J2spIOu6qP6B?=
 =?us-ascii?Q?og=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 12:14:35.9182 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2663d8d1-88ac-4259-45d1-08de3e2f0286
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4989
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnyPQsQ+2sUXspHmNeio95iRl1Urfp7iIz/ZnZYAEXQ=;
 b=c0/8ahom3G34PRp5rp6gnBBuQfRn2Nn6tbO5XmUZaYemmkK0hWSV8ILd1RgoHPZzYh3eFg9OTuuxomsisgdGgByO1ONjUvzNeZg1VI2J0m28/UVlOwrStDHWosC7vGRv3ne+EsdKhXH5eEZz/9WzNGT9v5nKzpoOH6C+8XKFkfI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=c0/8ahom
Subject: Re: [Buildroot] [PATCH v3 3/5] board/beaglebone: Add BeagleBone
 Green Eco support
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
From: Mohammed Sadik Shaik via buildroot <buildroot@buildroot.org>
Reply-To: Mohammed Sadik Shaik <s-sadik@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Dec 16, 2025 at 03:14:43PM +0000, Kory Maincent wrote:
> From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
> 
> Add the am335x-bonegreen-eco device tree to enable support for the
> BeagleBone Green Eco variant. This ensures the device tree is built
> from the Linux kernel sources and included in the boot partition.

Tested-by: Mohammed Sadik Shaik <s-sadik@ti.com>

I tested this on actual BeagleBone Green Eco hardware.

> diff --git a/board/beagleboard/beaglebone/genimage.cfg b/board/beagleboard/beaglebone/genimage.cfg
> index 4b026fda84..095e6e200b 100644
> --- a/board/beagleboard/beaglebone/genimage.cfg
> +++ b/board/beagleboard/beaglebone/genimage.cfg
> @@ -12,6 +12,7 @@ image boot.vfat {
>  			"am335x-bonegreen.dtb",
>  			"am335x-boneblack-wireless.dtb",
>  			"am335x-bonegreen-wireless.dtb",
> +			"am335x-bonegreen-eco.dtb",

This change works correctly. The DTB is properly included in the boot
partition and loads successfully.

Test details:
- Hardware: BeagleBone Green Eco
- Boot: Successful
- boot-log-:https://gist.github.com/sadik-smd/ed5a93b0e4080d3c0de1e92cf5e174f5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
