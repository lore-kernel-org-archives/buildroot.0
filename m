Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CB5EF8FE3
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 13:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70C29810B7;
	Wed,  4 Mar 2026 13:33:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mqrvXR5xu1Cg; Wed,  4 Mar 2026 13:33:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 925B6810B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772631183;
	bh=5yfu09yNMnH5LJfwhU2P2o4vUsELwTaIImdVYCU6zLo=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=WRm3HYyFFbem3U53rWFwzztPBYkLVjtRadHbzR/h5lU/r/+0QTau1jUOkDD7NpmXY
	 gso8upfJKQAZUwp6LAAk0NZyNWkco4PgS8BZCr0S4emod/20uJwQCYcJXK3VcF+zZr
	 mXBsMYKMq/HrH+nhJuVQAhIMWAG9hr+H2sveNjidzihvFmltmnknL9XPyt2ihpmeAf
	 azu7eLxA5IDZuYaF1apXw8b+aZAVt1qblr5xIxEdmfiSlwRR9FZnu5yy2NJsWFnoOl
	 cAhSy0k0opSVGj8G13xpq9r3eRiCxxFiAFzg9F68ioicCHfpqEbap0cgIfAPFWAI07
	 8i4GCrK4reR3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 925B6810B9;
	Wed,  4 Mar 2026 13:33:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A3861EB
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 13:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BB94810B9
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 13:33:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Md6C62JgHglQ for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 13:33:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c112::7;
 helo=cy3pr05cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BC382810B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC382810B7
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c112::7])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC382810B7
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 13:33:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cKPOj6tYyz8yaizc/Y7EqHb7Umq8eLGj9SaxYflwDv0mZEu/9o6wKpTxbxcUfjHeFvuF0iqIALxyDl3xYgquWh5IQGxk/G4sVpC58n7zb4xv8URCSh7PS6IB6yO7xoBPp4exx8xCsTXPtyLyx9q2Lm15fPQBAlzZPfIGDIWrArQ1PDpu0JaK4D3qnZpyLRAcmFLR0FOowS+9LkQVkX0qI7uYuYTmAFhVgpruym3MasjIayyD4AhkM/SAfVHwYKCfaXY+ovFLW9iXlzk/CO3ewkKe+wOYpnYxxf7/ynXdfkI6f+5LjYl4KZ4rhxNJJPeFvAbugXeIfOL0gGoSu1JugQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/LnQUjjvBsIsEOASkWVcIzAiRq3EwDjWRjTVIGI4UI=;
 b=QEJetrD1LF3bjLVGcAAXMohQKB0kEl2brd5a4eqnGvmo2yg5deo8ui0THsY3LXk4pHTb1+zbNg+CotGKpt1SBYPexJxp6kCprjJGBTWkXGXEJSFflabLhd+ihrNIBqFs9WFNP5+zRRxKeWZXfBQEt6AFc9gKsR5ekxShqZMHiXym5OrOdawaD4RRS6dPDynBPFU6cVqlfEZNtvjbNwUvvkKgEyKm6HMKeoyiGXY6bsgT6CmZeawfm/xDZn1SdnrwJk83KoZPJC3WIUJFbwOtJ3W5W8idgrIf5AafqtAwVx/ZcpJ5PGqDsjMWowj/11tVpx6hJ2i+fQaPsIQWex+GEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SN7P222CA0019.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::13)
 by IA4PR12MB9810.namprd12.prod.outlook.com (2603:10b6:208:551::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 13:32:57 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:124:cafe::71) by SN7P222CA0019.outlook.office365.com
 (2603:10b6:806:124::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 13:32:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 4 Mar 2026 13:32:57 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 4 Mar
 2026 07:32:55 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 4 Mar 2026 07:32:53 -0600
To: <buildroot@buildroot.org>
Date: Wed, 4 Mar 2026 13:32:41 +0000
Message-ID: <20260304133241.3389941-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260304133241.3389941-1-neal.frager@amd.com>
References: <20260304133241.3389941-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|IA4PR12MB9810:EE_
X-MS-Office365-Filtering-Correlation-Id: 13fd4930-fbd6-469e-e00b-08de79f28bf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|36860700016|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: ANwMRmQbyp+R52wckNF0Vsw/1ndZbalejikXp/l/GQxHrA2hwSt4sBM+IpHCDlay7ywLkBFSgI7Dtmc2IJUDg2tnZ+HAy2V5Rxf/5gX4dUGZOaURwUOQi34inSsKbBZRmmJBPet34TXvMwe/ozRjSHxBhgLV8B/vtBrM0vAhIwJ+jq84Z4+xRM0Z4o6KPXwHOwkJMPFLqiBTEkbMkqAk/lE/9JfpepsMlI9PNVebZOEWeGNsf8mVoQmDbs+aUlKWKvD80FoPS63sWEKFYeI2eL7QswMdXVtZOX+0ur9BT7m0qj0nnYp7Ub/pVhPIyS9HzcSQbloGoCQdITHcImRae4nRhm8KD0weaJiIXZEs5z0cDuz796hHnXc2DpsIvTB2tJhkB9QZK1EiPy7VYCYy9z2Ff+CvFrdIE/omMqnFuJ4egbxORXSbWJAE9yfGPwxkxg3EXGQT+l5rQzhplYgjx/iesPyQN7bDsyMc6JfvSb5hAZ/T8rNeKlRwIp3p2R8m53REdc8syUMdjXK7ZqFgD+sn/w7xKOyoV6lwcmCCWUnb01CLsqvHDP6zmiyng7tfoEDz56wcbAoMk9LQURCjte/MU0A5eW6rYXG85J1FT3S8nE22rA72x0eCm/RU5Mady1BXdQxJG/aZ/UsDxte3Vo0bil9KAvOJW9YAkjc6q4qhLlqVZg292nBR8og3bV6o2irkLWl0mImsuzpYOo4U1bkqD7xIedd2oEUicKC8SLEhfFmAJebuVbtG8hEyr6SfxrhEFPJEEs2+2pH9NMNUzpjFoQteaNGoiTQSUR7MUeBNnGrwwOa7k87/CyXWqD5sJLgPH3cRcuvHDEggu3aSGw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(36860700016)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wjQG/c2R343onXSh2Qz/lr1HzPXiJBtqAdICmAGekD7RlQNimhtUkGj2v++xTa4JbzTc5zllmYeZ3NrIQYygzY39L2LvdZB0i6RTLh5JsG2X7RP8A5v+73UauClNjzAtYebq8M4MOJcVLkK9FPvyM93J7aMCJ+l8DXvNCbxuSzy1+3QfwjfJ6dKkLzXS9U7LyYFk1/0wl+hf8Qyl36DbAKUBNrD2CIBbxEO0GEngFUecjY1vLYILOaeZNUT7b/E+6TWJsWzIwt7Gtx4w5ULteYG6pZ/3hfsZvb500DcQoVstDiWV/pieLINbgG4AyQk3urUHzyJ3I19NccRpb8+paYINNREdpPvHoToEUkzR1xIOxywj8hH+kqbynURdPJrLX7U1aTz/WkDXe9C2uSSUznlJLI5+i9yueYSVwZ5cbBKPeuwvpET1UNkNJ5TS4Rmi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 13:32:57.0018 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13fd4930-fbd6-469e-e00b-08de79f28bf5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9810
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/LnQUjjvBsIsEOASkWVcIzAiRq3EwDjWRjTVIGI4UI=;
 b=GILe0A1b/IPH0TUhkWQ+pcAu3WBJ4i56C4tw6MiK6L7tu+mXMaFzm46j4GVewte/DVs0PD35+E5kf0umuVs3P/7GaFkqjflWqlqUmO5eUZiXz/AqRD1zkWnxivJnYjnaHL/BW0hgZNn4K7WA/ZvTNyp2GF5kv5D5iSCQpqcs+Pw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=GILe0A1b
Subject: [Buildroot] [PATCH v2 3/3] board/versal/post-image.sh: use
 LINUX_DTBS variable
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

By switching to the LINUX_DTBS variable, the post-image.sh script can now
work regardless of whether a user is using BR2_LINUX_KERNEL_INTREE_DTS_NAME
or the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR for custom hardware. This simplifies
the transition users will make when migrating from a versal evaluation board
to a versal custom platform.

To keep the example post-image script as simple as possible, it assumes that
the first DTB in the LINUX_DTBS list is the one for creating the system.dtb
filename that u-boot will use for booting. Users are free to implement their
own post-image scripts for use cases with multiple DTBs.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- removed unnecessary $BINARIES_DIR from symlink source
---
 board/versal/post-image.sh | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/board/versal/post-image.sh b/board/versal/post-image.sh
index 3242e4384a..0e120623b7 100755
--- a/board/versal/post-image.sh
+++ b/board/versal/post-image.sh
@@ -2,13 +2,8 @@
 
 # By default U-Boot loads DTB from a file named "system.dtb", so
 # let's use a symlink with that name that points to the *first*
-# devicetree listed in the config.
-
-FIRST_DT=$(sed -nr \
-               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \
-               "${BR2_CONFIG}")
-
-[ -z "${FIRST_DT}" ] || ln -fs "${FIRST_DT}.dtb" "${BINARIES_DIR}/system.dtb"
+# devicetree in the LINUX_DTBS list.
+ln -fs "$(basename ${LINUX_DTBS})" "${BINARIES_DIR}/system.dtb"
 
 BOARD_DIR="$(dirname "$0")"
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
