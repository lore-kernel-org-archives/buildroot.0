Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0B4CD4F54
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 06:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 337F2409C1;
	Tue, 19 May 2026 06:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8reNHJvBuSLQ; Tue, 19 May 2026 06:57:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A1C140A08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779173842;
	bh=myoTs+L1GjiS8GsZD0dL7ctvxDQP5+COStsh/C3C25M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=nmXb86RDVXnYMnnsbVGFqGva7X0yevHD4hxFhk/+2zygvAZBelZZ97OLIGzZlybNx
	 Oz1H/s3IiQmuM+s2aumanRFZ4yha3hO62k5MdWvqC+x7pPbA5ixZkDErfjy4rYw7B/
	 nyG45Tv/vRXHu5HcovfDKulmJAzPshnIzcw2iY9Zz0yLBhnLBd5m3BVSacKL1EwoR+
	 mmYSqF3IYhLXQRt2ZjghTrAdsrAmnbRjNeKQA0uxHbCMwJnd7AMYgkkpEJpE34E33i
	 ErqBYo4D/4uFcAba30K7F+JKiFYCu/Mmg7Hahrr7cnMkgF9jxxbf0L+yAaqmvd3Pwb
	 5EX2zE7q320Dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A1C140A08;
	Tue, 19 May 2026 06:57:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 974351B2
 for <buildroot@buildroot.org>; Tue, 19 May 2026 06:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87F42409C1
 for <buildroot@buildroot.org>; Tue, 19 May 2026 06:57:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CiGBJAnCQ8fo for <buildroot@buildroot.org>;
 Tue, 19 May 2026 06:57:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c007::2;
 helo=mw6pr02cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 130E2409A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 130E2409A1
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c007::2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 130E2409A1
 for <buildroot@buildroot.org>; Tue, 19 May 2026 06:57:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gszaxrvdl3JP2vtcFGfelagURcH6nc4RtHKoQWGeCRBNwVgF8kkRi6pRt99ECfhxBnR+1NlRHEH8IEaHX14BRC/wGxAmG20c5lgzfSE3BYR7BcD/eQ0LCvhWx4laanUAkJffI0f2cgWm2W9HAjJ7/IBVYKH/PhvqHZB0p6UsCqnkNj7o5GBp6V0l1jweylrVS6xRs/sfn1GPcTqHLl2SlXBlJ+cLZW12qlO0oq8ueGKKWarnehMKpOhuthWYixjBcK5fAC6lEhx8clfoXx1NqTC23EJVc0eNuFMuKpBqj79C7jHJmK5u/x6HQu+MGQl8hMjfaIJRCwEihMPgcI32xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IgBlPnMMaM7e4RQNzDEVHI4aWNzAjetqWGUiVRrMEfo=;
 b=XCsqWlOwGj8sUg3ZPdi4UtM7uhmqqvuQRaT5EC9rITuw2X5utgvZoWqTKBgqK/PSCax75beeLjOzBfMMeHbw5clv2nHeskeLTJolQ4eTKH0mz4vQlnDI9VUWTNWkvkniEMZHTWbev2qIXIo/WEqbbLs1dgIlkRgEw9OmUT+l0DS8fU8gJJHZTxPwZsYHoHfxZAUp/UdGfmkz4YrnUk/+Kk2NEdAYj0HS/IjpIbPSZIUZMUr8WMa9vn8mS+OqG7w7YQz6gOfh9fCUGRMEDUgCt0CAp233ONa20ZDAc3nJBLA/rmxsnvJ/WA1E0/E7R1fmMPQNZFtYBZuOVcl58ta4qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DSZP220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:5:280::7) by
 SA1PR12MB999254.namprd12.prod.outlook.com (2603:10b6:806:4dd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 06:57:15 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:5:280:cafe::7a) by DSZP220CA0004.outlook.office365.com
 (2603:10b6:5:280::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Tue, 19
 May 2026 06:57:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 06:57:14 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 19 May
 2026 01:57:14 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 19 May 2026 01:57:12 -0500
To: <buildroot@buildroot.org>
Date: Tue, 19 May 2026 07:57:10 +0100
Message-ID: <20260519065710.324849-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|SA1PR12MB999254:EE_
X-MS-Office365-Filtering-Correlation-Id: 59c9d703-9139-4335-a6ac-08deb573dbe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|36860700016|1800799024|82310400026|18002099003|56012099003|13003099007|11063799003|41080700001;
X-Microsoft-Antispam-Message-Info: eFXUOpckJ/+Vk26j8FqVmIdw5aovSDHxrJXaP4Y6p9l2YrDLjt+bVPFcXB1izIpEY0aF1xoA1lw2YcG4zHaDs50BVpFpRpQ3pN0TSBOyo5A2BFb5LyqoNK5Wmh04laJDJWoXYb76KuDJWmiU7WYWiNZ9KPz4nyHjLlQIk0TwmC9Brh1PHlhNqECtfj6+oA0y7ZOCMPuAHVBOB4jdg2Zxu9JozYqe8QIjw3Zpxr5uQQRiKEsgpkZSBgAiq3ftg2Vi3wdb1xFjhzAI3dTRhYoDp30UnzC7q2ea4+oAo7SlILEGR0m8Q1RCFHN/2A8d6EpEts5szE/KjB6RneRlB4ZxKUfWf5OxF/j6+gnfpdIcS+GSptEQdTe04B7J/LgWeZX5dCpknfewraH774j9Ax5964Ja1xZNSFsHme2hgrrO2IbW989rvVnWFDAG3Va9id+e6aOjFCvJJImrsSxcA2UWZtDqwIUP90JBfi6klR0OvWEhacCxOsdzlmcNen2GrXP/9KcqNUCiWuKHY5Azw53D5ROkCknNdeZ3NdevXq5wvca3+/wnzmKH/jZNF4o3R5+xfna+vn7Niklx9UaHR1FfZX2AsYAUoh65Y9LP5rKkxpmsoSu5W5HzTgoM7BEq/bEz+zEwDdo4fQpcJxNTr2pbVRenN3mAuU0EFgK5WQYcceyxU6azWlNI9v0Q9B4WgLvtx4Ugw4IuYi5/qR+O4P9hFMOugl/Xi+zt6B2jjfBk/ULamiEASNp9Jvdg5ABJlJEOQPf2Yfxjen5Vno9TOBuYLbxOrGPPmOf4k91HutwhQ1M=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(36860700016)(1800799024)(82310400026)(18002099003)(56012099003)(13003099007)(11063799003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Ceu2HkxzzK13Pj2on0/2hSGzz+GutfbjiKAarIDxQbJnWvb8KqZj2a4Hrh4reHvfXplMKW9ljI0vyFa6cyOFVVlJ2c5avsXh4Uevog4X9XBsPsX3eLGqX0it9XnysgjQoT8TxTv9yb+2EhKLURI+H8SUy1xLgsVVLGNbH3lUmsR4SBC/Kv3zAos3qP3PhozFfKdFg+nuZtoHbPyMIDCsndE8reMgL62B/E2NbSh78CmnAsko2MSx4p9fnpnBLyLCMweq8Orbm8bqky34TXCKPnZXIYolYRJWXvdfMnlornMIkGOPVkN9yoKc8s8Np6aF/XXkgbUzcD6cmGFj+G7clJ/kJEBr3oj+twGzgcMsSe4Ic1Ode0gyHWGHGDmyD+fulkrQtHGCr/5R57r5isAqg1cZemohzBvP58AepHkUMyS/hUSO7FGOmFlKroM+zB/0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 06:57:14.7422 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59c9d703-9139-4335-a6ac-08deb573dbe1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999254
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IgBlPnMMaM7e4RQNzDEVHI4aWNzAjetqWGUiVRrMEfo=;
 b=AOqY2zliYgZt7+iACKzk9GyGTkYwwQpg1F1gJxslir20cFm49BrfrHQbtu4kYJXOTZP5DpmyvCQ5XqXHMzdoGRyEd1vLJG1tYqk1RpJ4WtWwmApxE48t0+J/1FO3wmKITLmP/byNqOOjc1pPQh6uU4vC7yYA2tsoyKyN17uA5CA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=AOqY2zli
Subject: [Buildroot] [PATCH v1 1/1] package/gcc-bare-metal: bump to gcc
 16.1.0
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

Bump gcc-bare-metal to gcc 16.1.0.

See here for changes:
https://gcc.gnu.org/gcc-16/changes.html

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 package/gcc-bare-metal/gcc-bare-metal.hash | 2 +-
 package/gcc-bare-metal/gcc-bare-metal.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gcc-bare-metal/gcc-bare-metal.hash b/package/gcc-bare-metal/gcc-bare-metal.hash
index 19678dec30..6104962a22 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.hash
+++ b/package/gcc-bare-metal/gcc-bare-metal.hash
@@ -1,5 +1,5 @@
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-15.2.0/sha512.sum
-sha512  89047a2e07bd9da265b507b516ed3635adb17491c7f4f67cf090f0bd5b3fc7f2ee6e4cc4008beef7ca884b6b71dffe2bb652b21f01a702e17b468cca2d10b2de  gcc-15.2.0.tar.xz
+sha512  b3454958891ab47e1e5b6cb9396c0ad3b04f32fe2a7bf1153a143f21013fdb6b295ca94c98964698a688e4c1d7555ffd8ffbc20187507cce6b1c32cbcc09897a  gcc-16.1.0.tar.xz
 
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
index 6c2c8a5e26..d4f011c2fa 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.mk
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GCC_BARE_METAL_VERSION = 15.2.0
+GCC_BARE_METAL_VERSION = 16.1.0
 GCC_BARE_METAL_SITE = $(BR2_GNU_MIRROR)/gcc/gcc-$(GCC_BARE_METAL_VERSION)
 GCC_BARE_METAL_SOURCE = gcc-$(GCC_BARE_METAL_VERSION).tar.xz
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
