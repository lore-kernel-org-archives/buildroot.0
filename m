Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402BCC5AC82
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 05:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3407880C7A;
	Mon, 10 Aug 2026 05:12:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id je9KbM6cJBlV; Mon, 10 Aug 2026 05:12:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1811680C72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786338759;
	bh=TVj4BAhcorY8PPdBdhaFgo+Efyt+m0wfYXNvKYIQRcQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Qm64ESHINwipIHIQrWH9iB0001/Hrgv1Fo2Bbpd1IE6Zmtex7SgzU4YlZmyKAKCzs
	 RgLISeRJRTx8x+SmOfaYYBNlEMJAN/ZVqjDgYHj8uha1pR44bn6CykpWum0MWd9+8T
	 Yl6bmcl1iXOp9gSov2nIzK8vbUqigpfqCYnUdty7goxwXuubCh/0u0JBc3etZ+psnh
	 Uxc9sLt7e4ihodTWwakUci2uvMnzea/yxriR4WUANEitaty63ITndyzmRhev2fVz63
	 dpkkMpV8hGj7BMOM2aeKa3ywud9K78SAvi+AuaHOc15TefQK4U6pGXHg1Oa94k8xjv
	 7QrKz1RihrCqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1811680C72;
	Mon, 10 Aug 2026 05:12:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E8B0840A
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 05:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEFAA60617
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 05:12:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cEUa_80I4lec for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 05:12:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c111::9;
 helo=dm5pr21cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B00646060E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B00646060E
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c111::9])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B00646060E
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 05:12:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AbHwP8SkA3CWQ6E7/ib77WI+haoK+ZGheU5cz7vMqaHakYuFmgd3X09DlZIxV5fZy3ZFI54HrzDY4sPhwMvTJVWpFAPGsK/uCDfNcnVyeswW2Lb84lCayuw3gu+/d8yxpdbqxmxX6oNFphu24wgPfwxng/goM5cfxHd/plS4yW5Ezi1la54gBFGAb8GCZ32Jw7EnPLIwtGyDUcRLy/PA9PRyIZab8c52EZp5aUa4ZsyjCIzzfZc4bjG6a+e7mrFUN+1KaB4bTHeCK/6murAx+9c/G37HdzTY/k8W4+fwLdhnpUA0nvYcprwBiMqsmPzvSbGnBVCt/lToFCaq3s5/vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t8PdANauFktk2b6p786c1kZ1ISX1M7ihDiGZbLJm1GE=;
 b=aftsC/M5hf6F9qH2fjAPvd3/xubBcClh/37ARsxgTFbL/jPfd71Lrv2uZZo15W4sBTicMiC5xDCwfga5MHOeUFejBKn4zLP5fkBRLsJ+ekPeG+WuuxvpPG7lJGxdYiCpv/O6Wq1BzGQiixJ3Hdz21tp5tETgyA1sg1Tg2jO5Q4PpvQgCamyBr82CM5CWq9uX+Jz0x1mAjHvZrMum/qyXM/lFAfltERo5b3IsZS0Cr1lO6PjSPAbFHvalSDRYnxDK7w2oqh/JKmwq+hA4VWAqzd/SguBL5vcXwIdfaHfayW/9Q2CPfsWL9m3qTlDZipQ+s7t4/n7pXwE5utaRQHRqzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BY3PR04CA0028.namprd04.prod.outlook.com (2603:10b6:a03:217::33)
 by SJ2PR12MB7992.namprd12.prod.outlook.com (2603:10b6:a03:4c3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 05:12:29 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:a03:217:cafe::8a) by BY3PR04CA0028.outlook.office365.com
 (2603:10b6:a03:217::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 05:12:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.0 via Frontend Transport; Mon, 10 Aug 2026 05:12:28 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 10 Aug
 2026 00:12:27 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 10 Aug
 2026 00:12:27 -0500
Received: from xirengwts12.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Mon, 10 Aug 2026 00:12:26 -0500
To: <buildroot@buildroot.org>
Date: Mon, 10 Aug 2026 06:12:23 +0100
Message-ID: <20260810051223.4149414-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|SJ2PR12MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f41c339-f8f7-4605-50c0-08def69df916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|11063799006|56012099006|10067099003|13003099007|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info: UFW0rfPFFMmjhd8Y+LxWgnSupV0u+wJ2CprhhU6WE+S7aqn1DyGmTLlDxiWhpeTQrFMoHOuxfrjAQlNE1T9MZrQMCP1PNN9KtUy8UMfE89yKxFZUR17PddlBmE9B94D7jEUiYkOCDNvJN3iVB45FS7wTAMiyKusXee4EEWYALysEH4KGNKSjoyIO4y8jzg7I+L4X0a7/gyRes2JuWqmxKIpAK5utyxa1o/MeS6HUyuaYJ1AI9OTmKYC9o+Ae8oobwaAjgFiap2qS5juVyEH9oo+6+Ib2g4DeC2BgeuKzmLT2dMVlT7HXHcQz3AcRSLKkELMAAqrbQzBhbUSPF1T5cr7mwf09ScvaEKXM5EOz9U475IUy8f+7Vu5r9cnbNwq5exXChQJ0ZgXN+7t+GLzGTSW+Zk43g1d9S3M+Y6tkyL9okqnk5PmENB1n2Uk9ri1yp1iqmH1qzzI+BgppPA7jNoDWvJjx76onI1sUUj/RGlbLnWoyvSt0Ec5zjC2qubhT8uWf5lBD1QC1RTXVYuy8b+awWQdONA35xQWrgLSw2+X9dpQ99GnunNfTcxTiCl4QvaFsYmTU/oDlx8PUuR4n/Yh1Zzt/4+CQCN/6zW4SV5IGmz2FLfJh36mzItmxGxlpaL5+YVNKw1VTBfZpgety9ARoVMuRCNdZ0eaBN5yhcgCS/c7QUk/sI0EpT+6R41BV7VxUw6iEX7GtMBOlHHxAMQ4MxuC0sapk3fiF25cMDgHjpwYSZMc1wvJH5p81D+w3Vge9P+VxJYzt+NmhgW31UQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(13003099007)(18002099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: kG35GBQYsLrGzxLOzAq84oVijytFLHoVhucO4ZaRkYrhaNASECz9D14d9PISH4Ni2fNfrJhWIcK+ZDjOokFeMzyoW7bRegDsfTmfy/YLWVK3uCC9yIU90RhzjosKkbvYUNQ00yiJqZtGnKPsJCLnavvu6gqRPJyN+EJw/I8wsCsZDReD+8tgDf/7ns0Ss+4MN6U4BvCgCbGydgplorMyfCm9oht3uCMcRcdTNv+BqRM47rF9aRysmOZhlYoa6mSNOYJ5+dTGGBEiEGXlxY/ZIYgYCJh2bsl+4vLOe3mhn2uKuuziLQfEsR6ax0T0DRENDRAEen1jtpkB6b89/PkqpU+XIa7a1eQnbfpstxO9oh9K5MOzhPuUKF7paEMCBUnFsfX+3sbVGHI4P311pI3ZiKg4WTqSDL4hhmaZh8TtYaO4NT3mqfemKlOIKNE192tk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 05:12:28.1386 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f41c339-f8f7-4605-50c0-08def69df916
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7992
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8PdANauFktk2b6p786c1kZ1ISX1M7ihDiGZbLJm1GE=;
 b=jDJByCPQDmimXhlYdwML+YwCqDv2mXVkrEmP3h/LasC/jtV+wU1KPHZmtXe+3E5bnojEO68BDswKy58Csdyk5oKzXlThnFfHbROanjV7l0kciGSU+XMgvjrJXaZW/9a+eWhyZkrqPGbKcL67SVbjdlG3I0OzAbHMRba5TqXAmVw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=jDJByCPQ
Subject: [Buildroot] [PATCH v1 1/1] package/gcc-bare-metal: bump to gcc
 16.2.0
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
 Neal Frager <neal.frager@amd.com>, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gcc.gnu.org/pipermail/gcc-announce/2026/000193.html

GCC 16.2 is a bug-fix release from the GCC 16 branch
containing important fixes for regressions and serious bugs in
GCC 16.1 with more than 102 bugs fixed since the previous release.

For the list of bugs fixed in this version, see:
https://gcc.gnu.org/gcc-16/changes.html#16.2

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 package/gcc-bare-metal/gcc-bare-metal.hash | 4 ++--
 package/gcc-bare-metal/gcc-bare-metal.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gcc-bare-metal/gcc-bare-metal.hash b/package/gcc-bare-metal/gcc-bare-metal.hash
index 216c383a02..1e1003eec9 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.hash
+++ b/package/gcc-bare-metal/gcc-bare-metal.hash
@@ -1,5 +1,5 @@
-# From https://gcc.gnu.org/pub/gcc/releases/gcc-16.1.0/sha512.sum
-sha512  b3454958891ab47e1e5b6cb9396c0ad3b04f32fe2a7bf1153a143f21013fdb6b295ca94c98964698a688e4c1d7555ffd8ffbc20187507cce6b1c32cbcc09897a  gcc-16.1.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-16.2.0/sha512.sum
+sha512  c51c30ca7422d0cbecf504b2e0f33c3aca31e0f90a76b65217f465163fa6fa17b3f5de39e145c47e5bab90ac0ce7fff3b03c8d553ae36e01faaea5a50f8648d1  gcc-16.2.0.tar.xz
 
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
index d4f011c2fa..4ec154bb53 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.mk
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GCC_BARE_METAL_VERSION = 16.1.0
+GCC_BARE_METAL_VERSION = 16.2.0
 GCC_BARE_METAL_SITE = $(BR2_GNU_MIRROR)/gcc/gcc-$(GCC_BARE_METAL_VERSION)
 GCC_BARE_METAL_SOURCE = gcc-$(GCC_BARE_METAL_VERSION).tar.xz
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
