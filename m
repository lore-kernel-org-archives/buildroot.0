Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26604C61DD3
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 08:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C100760747;
	Tue,  1 Sep 2026 08:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TdxIMmGAMSlB; Tue,  1 Sep 2026 08:45:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788252322;
	bh=Vn3Jux+ZxoIJaPKb5DaTSe4uvpfMSAfSQ/uzueDTFQM=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=NEYeGqZ/xc7xuOPvyhDxOE8XDNsWtdTegQGpSABNflB5/k+dNWJ5JlqIeNznyupj4
	 rNz6u+u1rEKVcS3C9Up7rJL7vkiAHBP/nNzmt5PxUmL+LF3p87P66ZgPQk1OT+UWe9
	 JqdIhlTHDYrpgBz+Q4+zpIlTwzOw3/cF5SjxA5m3Ar3cSjdOmmaF4EuyTxAyRAH1R6
	 kCQm1sVUPEzbOi77Bvbw5H2vgcEfxj88cmSyih4xfe9RcUkPz2QpOaRtXZIQQPS+0V
	 exx2yTon0XJcOWyDUcnLqYWfdnugL+k3Ik0cMfOWmCtBO6kGeY54bbAofkRvsrxPGm
	 K+xaGvxCmTYoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8504E60745;
	Tue,  1 Sep 2026 08:45:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 85CD02AA
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 08:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75F7240613
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 08:45:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MTRr6cSUNMnd for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 08:45:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c111::5;
 helo=dm1pr04cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c111::5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3A4B40612
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 08:45:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D8WgBAXkSVOR6lGZUrOoCZHR+Whk8LR/s2KiorW16pHS7kuaiFeh3aRmh0pXCGd8gOFY8uFVW6KLNVhjIeUHQnuhfq9NJx6E+w287LnB48CP2RbAweGuDwo/G4HBvLtkHKpJ7Q5FOxFhCQ2CohQ3T/cEX8T/qAGkq31zjUXIWEuNoqyDAkBWFazm8/W8hL53R3SNSx3G0IJ90yhokctIp3l+xVBeBLf+9VWckOB2+qD+/aVXVIE4BsFtilzN5tywRasVdER+GZdszYuQR1DbwLXypS1yYv76Q5AViVUOJ9xj+DybL0fW9pXbPn8WpH0tG/drZ7TUPHqNVz7F53NXWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QONaHdZ+B9OLIqCZ6wmKEXUZitTxEpPWYeakFZhjX+g=;
 b=hKo7cuQca5hfR1PsCcDUUAng6iDn4HafLGb/w5DTVmb3lgqSJ8yQmzjUdUE/4wM84l0J8L4IVB3Im8AdYEuU5FIDpS9Dm387+g3obk4dDTcaeguBZeO3so7GcYD08qOlf1tUNJUDewWsHeZFTxJF1zhKRWTF8pqaBEqWwvW1XTtaAR+6myVRcu7L+KNPwgsSpkXlgeKKRoLOkKg8077QFrLEjhrCsF7faoz6HN7CHOJyylaUbz6GCppLtWh/iXiL/sevZYmH7UeJYYHIS0l6vL7pjGh2l7dyNekz+FXK7+MFgvHTVnUfZPfnWb1qLHGRZLWgIyO5QES8cC10NDMDBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BY3PR05CA0059.namprd05.prod.outlook.com (2603:10b6:a03:39b::34)
 by DS0PR12MB7777.namprd12.prod.outlook.com (2603:10b6:8:153::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 08:45:15 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:39b:cafe::24) by BY3PR05CA0059.outlook.office365.com
 (2603:10b6:a03:39b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Tue, 1
 Sep 2026 08:45:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Tue, 1 Sep 2026 08:45:15 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 1 Sep
 2026 03:45:01 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Tue, 1 Sep 2026 03:45:00 -0500
To: <buildroot@buildroot.org>
Date: Tue, 1 Sep 2026 09:44:43 +0100
Message-ID: <20260901084443.584247-6-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260901084443.584247-1-neal.frager@amd.com>
References: <20260901084443.584247-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|DS0PR12MB7777:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aca1db7-33b6-463d-b9d3-08df080557df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|56012099006|11063799006|10067099003|18002099003|22082099003|41080700001;
X-Microsoft-Antispam-Message-Info: yNV+OV4bOy20h5Pls5d+T0Z9GntITN/HYilaqIYgUW7YHRJ38hn4fv15yYfEDLk4SwdVpjrhPL5BtrXzrz/0qU4qRo3IMpzhODF4yB93B8FZcxtblT0xI4twwbBULkWXKfFZ3eScNA7fjeriegfg+TKM9lbd7EBC0/xqB3IgBozlIy123aQuynsLuECEjJIYw+JhTHOPxbmDopqftrmMgWBfXbxdWrEioBGHhfA8qHydqiGSQ2iYf5oZAKenGEx0LQBSpQFjj7som10bKWEtsgJ6SHzFuk3bDM3Dkjdy9hj16laldG9UfwV36IgV/OSQDjZ05us0w5fC9WLfWzxoUsm9PzWnFNMEku8mL9XN8x/wSPxup5OIJI8PYTQt5tJmQty2/UWpg8gI6Hzxh3Ar6Z7IKxbUd0UkO7GyxiKCOjoECwhBYG3KV5v7NgaX6boAjNd0LvQE105a+9CiC6tJ6etdgurwQY7vrsYXZJMRmtpxH9Tc7IUbuU+qlieHsZesMJXKcQdw1QwZmZ4xZqKPDy2iPwMAvnr+VcmVEtuwv79QG8Yw28CypB7NH3kKSnuXub4IbYGiI55F7FM9ItvMXLExEiOgskPOhNgEtgGqRGGClNvYonckZjDQt40f/09Or9WFklWUjN+NGwESsgYUZiYthuU400izaHK3Xnho7CY2dkuE+s0J393lYwdiBd6mSJIUIJ9ude2xsbg7uf/uyY3rkpY6tdTrEYCN3TT0wb7NQ3vGml1yTAPK9pg6tS1/JopmlbkVvZMJX5belBg8Ew==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dAWAHhYP9gVoihpfqgeUTjc5YOmxdVxDNwDZW4dkU6Z5oLwZOuJ1nAjqLcY0IOqi5miaebkXglG93D0T92rF//gKwQODormkEU8K+PtO08/DN/d38aqLIxO2p+5/UdNYE8uw5n3poTLgl7anWXzVD91Xlxt3E/N2c6VnbklnEBsc2C3DFPS9y1ngM51InTLyUCeNGkiPnHXm8eCb+0hSc6LOP/RGXrRclfEfqMKgAvwDIkO5L+GyotHlwWOURzhtsG71TJX5qb4ol1F/qW3w2bjDKYXKJbPPSI5OrrlmHGUSIOJWMmXxTOJyXBOM5ow4PtTzjhXVO4zwwZxf97F2WrT4LjaHEi7REuXM8E1aMcr+1Kn4ZC90OHj0twc7hLcLkmGOLNYKSMQhx/Mg/fv7m6imWXh3tUUWaQofIxsd8ktGdLgDgeYE54Kq7NyEmhHV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 08:45:15.0781 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aca1db7-33b6-463d-b9d3-08df080557df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7777
Subject: [Buildroot] [PATCH v1 6/6] board/xilinx: remove
 xilinx_2026.1/linux.hash
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
 thomas.petazzoni@bootlin.com, arnout@rnout.be, romain.naour@smile.fr,
 michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that all Xilinx boards have been bumped to Linux 6.18.40, remove the hash
for the xlnx_rebase_v6.18_LTS_2026.1 release tag.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 .../patches/linux-headers/linux-headers.hash               | 1 -
 board/xilinx/xilinx_v2026.1/patches/linux/linux.hash       | 7 -------
 2 files changed, 8 deletions(-)
 delete mode 120000 board/xilinx/xilinx_v2026.1/patches/linux-headers/linux-headers.hash
 delete mode 100644 board/xilinx/xilinx_v2026.1/patches/linux/linux.hash

diff --git a/board/xilinx/xilinx_v2026.1/patches/linux-headers/linux-headers.hash b/board/xilinx/xilinx_v2026.1/patches/linux-headers/linux-headers.hash
deleted file mode 120000
index 5808d92afe..0000000000
--- a/board/xilinx/xilinx_v2026.1/patches/linux-headers/linux-headers.hash
+++ /dev/null
@@ -1 +0,0 @@
-../linux/linux.hash
\ No newline at end of file
diff --git a/board/xilinx/xilinx_v2026.1/patches/linux/linux.hash b/board/xilinx/xilinx_v2026.1/patches/linux/linux.hash
deleted file mode 100644
index 6bfa4d2408..0000000000
--- a/board/xilinx/xilinx_v2026.1/patches/linux/linux.hash
+++ /dev/null
@@ -1,7 +0,0 @@
-# Locally calculated
-sha256  23c9cf18f5f419dfaafe5c3d3eda4812eb71bf1f2fbf3b35470478bbaa3d96bb  xlnx_rebase_v6.18_LTS_2026.1.tar.gz
-
-# Locally calculated
-sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
-sha256  8780e78a1a737e127f25a65f6d95269bffd36158dc261114de7859b490bfc5aa  LICENSES/preferred/GPL-2.0
-sha256  8e378ab93586eb55135d3bc119cce787f7324f48394777d00c34fa3d0be3303f  LICENSES/exceptions/Linux-syscall-note
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
