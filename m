Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320CCC5518F
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 10:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F47C40539;
	Tue,  4 Aug 2026 10:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DMWXvmileTGY; Tue,  4 Aug 2026 10:25:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B18BD4055F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785839106;
	bh=hJLm8c5raiqCxbaoO60nrwEHdcGJxnxwDK4Unr6lHGI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=RUj3BpNdsNJJbts7Xgt0VTD2ZtUNYa93cIq9a8Kp7/FwND48+MV6gRGhuGM9pNrSH
	 c+aIlC90RsZvo/mZffdRW0db5058FYC86vzcW1R8fNgczWSQz75V6t6rv/1/PvoI4h
	 ZEQPii/g56uiKsBa+J1BgnM1Lnq8sgb23hLK/TEWfFQ82/jggBHsdtcjZE8fMS244e
	 ugImU3TDgMuupdTsIQMBnwbHYmrJi7PNvdqwPvmHcVcG84ZkLLDrauXp+lLDRBNe4c
	 cPCfrCduwSW9+BmVZunxOtq+FWBlmuMOlWnIQLg0Dh0kKwZ3GdYJJNZQCOIh0ClkK0
	 e1BDRIVmeiKpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B18BD4055F;
	Tue,  4 Aug 2026 10:25:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D5917296
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 10:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA2D760725
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 10:25:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a7IpKbdkthFo for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 10:25:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c110::3;
 helo=bn8pr05cu002.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ABB2760724
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABB2760724
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c110::3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ABB2760724
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 10:25:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QZAUzhVJKKYEo9SszVEt0QYrMmBuP4cR+K9Ji01hAHZorbFhXMb1lUVPLJjRP/de6NNXnzrXRX4bybZw48+vPgQu1U9QeevuI2XpgCfoKI1wdV3p/KDtvw3EW0onxXg0gtmcBaa+EmzxH0konc7P2ATIJjtgd7X3GEwISrXaXuF6XeT2CUUW8CNwyou4gtypbfSkunSt7roeIPC1hFRWAz9+i4Oy8viCEFmzjxdJ64gug/FqLyHylh0yRuH0CiMtX7ndMOKXrffie73YeztFFMf6e7dNqEhuyWWOAya0OMxEr0podwq7FeXUsn8RfIAGuEQyVlgrkVJLRg0ktWEF+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=flYAXZEs9k0UgiZPgRr28tEoffcqCGmSU/YBOpW1ScA=;
 b=oOulvOrZvjaKyqcx+1lmxDyQE6YxE+AZ+I9+uzBsZzdlbYbyjW3jp9uodFpqydr3RJ7bRXlQLsYij0ofOK/l78v9A51cPiWOA3KrqqLfK8eCcvXIrg6lSi41NpZRxch+QRRCS6DWq6tZTrbRBGZ3xbjQ0X5n6KDayiEFyQsPTRGw9GlFkLCvl2l//WJ3wC/4v9T9VRFDO2HY8ACiJtY+mK4lrvzkuBKBnaFC0iz+rFt5V3Mmb6UzYeOxjm9wO8gk1hK90gbHVHUNBJYtjOif7UKQCJVD70Yv8IaHpVQA7to7cLOlTQ6N0/zDjGDj0/MV66/pcHo6bE/A7xU3hT0M/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0334.namprd03.prod.outlook.com (2603:10b6:a03:39c::9)
 by SA1PR12MB6871.namprd12.prod.outlook.com (2603:10b6:806:25f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 10:24:56 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::8) by SJ0PR03CA0334.outlook.office365.com
 (2603:10b6:a03:39c::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Tue, 4
 Aug 2026 10:24:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 10:24:54 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 4 Aug
 2026 05:24:54 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 4 Aug
 2026 05:24:53 -0500
Received: from xirengwts12.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 4 Aug 2026 05:24:51 -0500
To: <buildroot@buildroot.org>
Date: Tue, 4 Aug 2026 11:24:49 +0100
Message-ID: <20260804102449.1532082-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|SA1PR12MB6871:EE_
X-MS-Office365-Filtering-Correlation-Id: 728f28e3-30f7-4003-0eab-08def212a074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|23010399003|376014|7416014|1800799024|82310400026|10067099003|11063799006|56012099006|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info: S8eOJcMaQr3C+YHDWhgDkxbQJ131M52JJwBrrhj4tNRR2eqVvCrbJ1bZzDL7xi+/iVWRbFvVRsorgCrbTKqveyASeXgYnanyP4Z76zkDHukTIFFttjen6IMZe04aaNezrP01nNe0+o5M/G73ae0tkK7KGA6ziEwVIl4gHttHZcferUd/7Y6MaoYVLAGXFAdA+/rXUtH4Uqim/4WhK9spH722YIu38N65OFwaaJBV9+Fx/lH4v5vZO8oUGC4vTtoa/tQsvUXTPzkqjkqIkWtlbuMe2gXmDHHOIUPP4Xp7+8TO4f1cOW82f+6gA9WHI1+euvluPRW2let5yxqTG9kklo/GtVzP+Yj7Ou252iOpsRIQrfmndk5DsutQGQFQbMBKFpJntiU5ECetk9lDckFFIGLHyvx1FZnednSXT4BhgDzhkwBx/3VrBOv3x18OZ+mAvvHGHOMafoaybR39GQUjHv0GaVyFLcyaAJ0vny8tl6thuXk9czYstrOWYbwhHUm7wdqqsFXWokD1a17X4VStkwQb9ueFRmufuvTxw0At8KmvzMtpPtD0VgRiTZq2edCk9f57Uqu1uJnSapAMINKMUtbqJazJ59v1HQ6ONc2St6E1fHWwXamxPsL5m4bMvkWhZI3UAesW5ly98TGK0fBG0yAj+nvn0+jyMuPPqpDTlcpuoitmzERE1a2imMppl449rKkZE7X+L+FqCQlD68SUuPxJ5F2G1JGEpiC38+gnELvraQ0k2H7/0uiUKUSXXDlw
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(18002099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: GkJI+si3ErWX/G6Z9tgE4eZLkmCH01x8gCvd3MvqmCxhfG1PFuan6lhqRQgYi5P027icWw4ITmahW5/7q8g33IzmzmOzq7i6rnaEwrHmWMT5nPlu8Ejy4Iz6fzbAJ7hF2gBk2QPd+hqY0Q6khZRKeIkDU5YZdFJHay5ZjitbLz5m/b5ZKsF5iNm8mxPl8OKVIbp+8SPkWrS8Ar+ageaqyVgw0jpIiof5E9xLWdCt6Z9XJUQmES+ACDH5Y7KhBgLxXdcRGTTqDOOIY1op6fg3Sctv2LHNQv9VMReGgevSki7fm45Y3rDF/6M9TJ9xnChYLbtmnXwWGUKIY9GqyX1PZmNA3uaUQPqvea0NcteB/9OUuW3HIJLSBM/3ZcV5brKXKNQWzH950ghD+wDKOLsec5sjvxAgsN+h5KW0IS0ieFSietDTjWBGOOSwu6MBqrUp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 10:24:54.7224 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 728f28e3-30f7-4003-0eab-08def212a074
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6871
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=flYAXZEs9k0UgiZPgRr28tEoffcqCGmSU/YBOpW1ScA=;
 b=MufmZJxkUYd/LimhP8auoVY60N2QhEzX3uOmk2QQNb1tZ+VJlIZAsk+Kj+aCYFhgRuOseaxLL65K3kxDM5sCcfd7BrhPk9DxTm9r6gig8CQHfnBBC4EVqK226Y8oUhkws9dmeUtuhvHCugyqaaywdTDL/jRgWdbBkNRqkY6jL8c=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=MufmZJxk
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: add Neal Frager for xen
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
Cc: alistair@alistair23.me, stefano.stabellini@amd.com,
 ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com, micheal.saleab@amd.com,
 yann.morin@orange.com, matthew.l.weber3@boeing.com, brandon.maier@collins.com,
 john.ernberg@actia.se, brian.j.wood2@boeing.com, ju.o@free.fr,
 stewart.hildebrand@amd.com, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add Neal Frager for xen and qemu-xen packages.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a877140992..d8b1680c48 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2513,6 +2513,8 @@ F:	package/binutils-bare-metal/
 F:	package/bootgen/
 F:	package/gcc-bare-metal/
 F:	package/newlib-bare-metal/
+F:	package/qemu-xen/
+F:	package/xen/
 F:	package/xilinx-fpgautil/
 F:	toolchain/toolchain-bare-metal-buildroot/
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
