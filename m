Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4F4F5A8A5
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 17:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 977AB82171;
	Mon, 20 Apr 2026 17:39:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tO1PnW-h7jDj; Mon, 20 Apr 2026 17:39:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4815481EBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776706752;
	bh=qkCpi7rHGen4VnTtbwikUCmnf7HD8/ozzsqGzutkiiA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=pNv/3IK4o+O+sDECNOM0ceL+hRIIMmQFZ1aotZZZh/TBxHrI/z6h+mXBJ0HSOTIkQ
	 C0DM3DtoHpHPV7y/y6794PAnDYUtFDPpxLKXQWWvdxreBuZr2vk03G8qdI+Iue8rKK
	 dpdJXZ2IH5Bdr2SZ/s8lwPztonv432m3YGcN893IDgnIoO8Gm0S+hLSmCHUpXuO2hE
	 Z218ZKUaTCk7RNnWzti28Buu6bndpWSb0RjzOB11+Jjgoy8Y42qvVjErDcLOwPveZ0
	 0crJHMmMyK/vfe0VOK59DXAheVyMled5OSfAuGpQ2kcfWbHn8VL7hIvstj05NO/ts5
	 8r8EqUy2WYDuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4815481EBD;
	Mon, 20 Apr 2026 17:39:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B9FF8257
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F5F661063
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:39:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EuQmcfcQ2NHr for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 17:39:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c007::2;
 helo=mw6pr02cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8352B61010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8352B61010
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c007::2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8352B61010
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:39:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vVblvfXaRtPHlk3nNWUw8AsvV4ta3Elqmo0+K+AYyYPQZ2koPughuweh51QpzAXDS7nWmMZOawq6EhYJtC0ySeAHOTrLlHoGCVB61mhWPKZLWf/f4yIgQq2tm5cFklYDOVkar4lT8dakc0XdII2BcF7dODLiflu1euwRXsFbVhJIFTh5kKWCKjGcmq3Ia1p5XRG59v6kCyJV9SXqVoVKpMvaB2oGwh6i33H2JrCOQTHzc55pOtlY3c5UKNNCo33D44vKnU7wReFObLSj05vqze8urmA4kIsyKbcZRFMmnUC28lDrwo3EgEh4fQ6CVg9spraZyyvcApnAEij7njeeXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=exk8pTYeQBW+Faho4bsoHHtOesXOh0iBhtpdQb68pOo=;
 b=USS8OqeZk+xsV/RM+1f0UQJj+z2Wwr9iKl+h6MUqd7XbgZzmPe8m4sA4yLVFnb2UrF705DWcZ6gZk+NOSpeCPGfXWcS1tQM1GVwWYwvRTaTsOmKRJUjPM4jI89zw1UZ23NatTBB/CVNZ3Xc35Hed+fcVBsspULJwjM+UsNP9XaB0/85E5QzdpA65ahIgsl304OWNMEfE1RYuBxBKfpmjnE/XZUiE5yv5NxjCr18ezCmPj3ZhDYzx10+3WmhVduA+yu4XaZgbDx63iuSCIbEFdk/W7/JsiTY2sQv1G+K5vhkoWbGoWGpUs815PJZc/peprqVQh4HOVttQlT3DOfwKqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN0PR10CA0002.namprd10.prod.outlook.com (2603:10b6:408:143::16)
 by CY8PR12MB8339.namprd12.prod.outlook.com (2603:10b6:930:7e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Mon, 20 Apr
 2026 17:39:05 +0000
Received: from BN2PEPF000055DF.namprd21.prod.outlook.com
 (2603:10b6:408:143:cafe::9) by BN0PR10CA0002.outlook.office365.com
 (2603:10b6:408:143::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 17:39:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000055DF.mail.protection.outlook.com (10.167.245.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.4 via Frontend Transport; Mon, 20 Apr 2026 17:39:04 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 20 Apr
 2026 12:39:03 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 20 Apr
 2026 12:39:02 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 20 Apr 2026 12:39:01 -0500
To: <buildroot@buildroot.org>
Date: Mon, 20 Apr 2026 18:38:53 +0100
Message-ID: <20260420173858.1655069-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DF:EE_|CY8PR12MB8339:EE_
X-MS-Office365-Filtering-Correlation-Id: 80f6fc35-7776-4e8c-2009-08de9f03b78e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|7416014|376014|1800799024|82310400026|56012099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info: t71t89Wab0iFa1WJIGene9BhPmoVEMYVbOwRbUH9lJLIrxWAaPET2ltomHdbvXJiaJQ2nkqXMT2uiE27ZG6Uix4lMyYArTl43gew4Lcc+ntGn0CzBDynK3Zt1qDI5WJZxKDM1rCR/b9HHZUp18EAhBBJmi84pLagSVF02eKO4kRp/A/XewrYGEsJRCNLYajNjpu+qd7NpunX73bizNrk/kjdlHXeI0R3GnPNDkDJ95Rni2mu6E141Ijl993NbPhLDOKgZLGflDR95Hc3lDxAVo3WgPlvLEOb6qXzIuVvEOo6QQYAqqVbowNz5lAlOne8Dnb3fu6lLr6EulttR6WP2gCWODZk03w+EFXlMbB3f+6nsPzo69TF0z/VIqrzqSZGDwL9X6+yGP0uRdah49+p0Voj1WpqqSvLFBMvZx2+fJTrOzNPJuiDaJEnxjOQAZVrbrPmHPd0ys5GSlgM7rIFrM4FpSjUR5XZITCK2FNKexq+F0HMLZdPw6zhF16Gw67X9K+wvY6tX+F4TPjBAUxGtrz1DddlI2pWZDClJN+ek/LmGAYUbcLgLuXAoOak35tALMCO1d+V6ZW5oZRc2cG2plc/6WwoPQjmPH/dK2hMm3SV19heaph+LHjtFccOucQyMXS4+ZDr7pVM5tOTWoMqw6+c+UHvb8oaZoQDVsiwFG2/MouDl7rFeb+AT7Ri057JvzSswnCd3k8+3YuNmRxy4yB8DIPuqc4pbRMcfqxUTQZDf5NI/5IMARgOlkGQvPieD3RYn7S052Zh8qoLHMy7ksUZlLOUAjztHdK5mAvvEN2D0ul7i0YjgxVJuouFzfbqk2who3/3bBiO9N+aY7Q+bw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(7416014)(376014)(1800799024)(82310400026)(56012099003)(18002099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: F2/04dgdZNtOkHBS4h1/lWqXHPlFTebIG+t3M/uWyrzpCkl8woEm4lQhaN8W6zzv53e3DhONEJtycxRrttuC5FJtfJ0UqUceZp2Fu2BULEjYUgW4qRjk5JVYdcvKBuOadtHWj5yacrHKbt/LE9mcMyeWSkxR/dbeR7/6ylid36GqGKCY3RTJMdIn9VS3TIwoHJ1KBXa3n8gMzr2weGqOaRgCJgrh12a30OUnlwIL6IGQCS1eZHqqZwq4Ucp9lna+qJSwwDKxSbLrNowVPEu0dZeRiB8G8kLZvABdT+bJbz4ml45GQByegxk3bCaZstPNGKc9/5BVErCXalyzkm/mhqK8bXoXMc3hCCKSZbVaoMuoe+E5stt/LyG1md2TvVJA1ul3BTj0PQ1K6av+2/29grzeKrjYPhS/UOb5jOtiupdtR2BxQRjtQsBnGAk7aoL0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 17:39:04.5992 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f6fc35-7776-4e8c-2009-08de9f03b78e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DF.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8339
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=exk8pTYeQBW+Faho4bsoHHtOesXOh0iBhtpdQb68pOo=;
 b=ZbBBASCq35Si5eIXTUGda419lJz5/3rxDpdnybQIcLIQvoTIGNthsJl6UT2xHNhuWty9gfcmLm6GlOYPrNCtRGFLX8O7uQuvrO0ecrZ9XNEEcB2b0dF+ztPcyODTbX/0CtwhqCQz1FNKBKWxg5Ngu1316hpBAlLi9w6msfPKXKk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ZbBBASCq
Subject: [Buildroot] [PATCH v1 1/6] board/xilinx: add Linux 6.12.70 hash
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

Add the hash for the Xilinx Linux 6.12.70 release tag.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/xilinx/patches/linux/linux.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
index d843dafb20..87db73fc78 100644
--- a/board/xilinx/patches/linux/linux.hash
+++ b/board/xilinx/patches/linux/linux.hash
@@ -1,5 +1,6 @@
 # Locally calculated
 sha256  444f573cd4438af1f5062fd69fcc82965a56068e6a25cd43c062a68398f90b03  xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz
+sha256  002fa6c617d3d3eaf1e16219079f4e4303b84ea472b2b3c5d47f766a106a79c7  xlnx_rebase_v6.12_LTS_merge_6.12.70.tar.gz
 
 # Locally calculated
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
