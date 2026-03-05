Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15ECDEEF31C
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 08:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E13A819F3;
	Thu,  5 Mar 2026 08:45:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JTGbbEDpjaHT; Thu,  5 Mar 2026 08:45:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E70F81975
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772700339;
	bh=77I1i3ael6v0rAFoNNEDMDcZLM4k2HuC8yG0omB2bac=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=VD6I1WJZtq50haJco3MWS+jyKNoyBpgDKec1YwR8EPf6Zh3h7IEJVq74ox6LtOH03
	 rc7owhvLhXuwNTa8S/KsEHJM/6dywhrjc/3gr2CgptqDJF6XirufsNYzjDD7z8Pq1H
	 6liQxybVA1MBvgGgxdqGlovjy3hHwZDeGvWIFmCQExyartmA0ttHwQOK607cfmNl8T
	 sHZs8doHtd37QpAwctXeTZ1nG8VyxZpB7/RnfDkH1KEe8UNH/30LvVNlVkJMAVC0Ds
	 8AkoRwDoUXaB4zFAYFrfe62Jcehi5lNzr5IUPGp4HdXO9/KRWj4FnNhEan2hLd+O5B
	 MmMVq9tI6QTNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E70F81975;
	Thu,  5 Mar 2026 08:45:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D78A6223
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8D7081975
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:45:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CHN36AafEoC3 for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 08:45:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c10d::1;
 helo=sn4pr2101cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B85178195D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B85178195D
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10d::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B85178195D
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:45:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xjEOkjQFGgB5nxP7Rjr6+qsQ7t1fRl+dOT7E/06zvhApf5FlkTADGOqjgeBNL86xT35JZZtMLlxhtbfsjdVPYvzUAVfuCdM33iKARVgjjvcAIuPBGWRFO/AvsjrccdOyX8rVJz/AAC10nzhoLnMrUxnDnXij/05poTvIwYX7ACWFSsObPpm4aLt5LApxI6nX7ZyV0T6uRYdcaBRhb8aTrJxIkWh/x17BSVOMsp5lksNy50FkDZYo/wIE77B85HhgkJ5NMFfr1uJOIN3CyhsxtD4q4v1q+TAHv6Yqi20kMxo2/2P2A9FQ1p/HcLevwl5kkJEASx+SomTTj9Uip0T9Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TqjpjuRO8MJoI13qyfbqiSBJXowxhx83WOrh6f6xrk=;
 b=sGEd+JUNGVsnQ01jWFX8omQ3G0CG2cfGpRwzMlhXp9rIJNYVH6j/6m3oRfHEh3esrYA1nS6Vhct9Twvu9UQ1EbU4MO3lgSBR+6N7W/SdPHafhJvgyZCGBukJ9FkMol4W8GRhLVh1Uf0ithpwjqJtUJWqmZ3sINqThCsT7d89MMbtaUWDHrbBTEbHCaxjgMMER7Lt3ZNCNV+UmY/gU9GYCea5kV9MLbBJheFhOLd9L4taS7xlgKakotONUCFUDfgfhbYU9vqWSSc1ZyfJgfGxMqkqpNHsJnUqWQSJCcWQhvKMuxyNxBy0JEcs88ue4C3qXbdN3pMsjqz98YMss7t03Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BY3PR05CA0057.namprd05.prod.outlook.com (2603:10b6:a03:39b::32)
 by SA1PR12MB7246.namprd12.prod.outlook.com (2603:10b6:806:2bc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 08:45:31 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:a03:39b:cafe::8a) by BY3PR05CA0057.outlook.office365.com
 (2603:10b6:a03:39b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.13 via Frontend Transport; Thu,
 5 Mar 2026 08:45:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 08:45:30 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 5 Mar
 2026 02:45:30 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Mar
 2026 02:45:29 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 5 Mar 2026 02:45:28 -0600
To: <buildroot@buildroot.org>
Date: Thu, 5 Mar 2026 08:45:26 +0000
Message-ID: <20260305084526.798988-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|SA1PR12MB7246:EE_
X-MS-Office365-Filtering-Correlation-Id: 976b9283-0013-4444-ec38-08de7a938efb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700016|82310400026|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: UtBFc3jnybWzxysygac5s1rFEwnFZR8lruVcVgNA74qdMhaIa/nKZnkJIFJgIYzDlG3rr2LjPQ3SQ0mvN6U5ztubbAUYfxTxDBE4JKkVdjEE3ZdxIGQGYTJkws1qVjdsYDBBvrNyC87m1zpZjlkgp5p270RgB0j+tT0mB59XMd0JkwxoQdP4eStITKdPaIvQMzvokk34ybDPacnPLTQcKX1LpLhaHoN0NJSsxc7S9BypF+rhfG3u+Nv0NjdhLlzJL91Simko8zlTp35EcbaLQ4tRCL597ggBHo3Ge5s4I3FYZNP6sShH4CqnlJvO5nRBjrmiJzZzMhq2NtD6p1DE3Q/O1FVef6ZUg9S2YRjAsqAP4CBTyjIeB/yO5r3XDgftMNOvIbn1jAFnc2b6XNBAfaT2M9R4MadxWpAnQGZVx8M99r5wniEDHwazUFlIVoac32lapW4GlcUuxPXm7Ro7MRE6UWNjVtyEZ4P5h6cZFVFHOgryoRHsBwa0u8ouQ4plr9GJguDLOi0ngSyXheEMmDNakDm/tgNaOUVaVzFO4Vsf4GlKs96qrgBEj/1Kiy6u+Z2e3tpkJz69kc0hmRRctQwC4WmGiEvTlNT9XWPett/MZEgRKC5fpAF/QMmv2c3UHJu46gEvDG/azwGx44CSYuWYOioixlMq11Itll4ffASYZ8Xx4S9ONV/GTsBJsI6d1VKuuO5rY1VsbuHj1jd22yLtPVkFVntBfsg2KuU4vunLlq/PUl9fykPoynO6Q6WMcU16ruOtJlqJlOXN+OGfM6rV6+Xy8ArstXhzlKKV31Ks70yBUpExSccVwH7umxKIzRrpzpsQqPLzJuJvcXgvZg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700016)(82310400026)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +gv4Y3BK4xOCs/PbTEgDrL85aSWHlqv1DCMAGBeFHLG43T0Q2OttXWTz3Ilgi/1ZOnj7+w+CFJnRQqoFq2wfKco2lGsIDXeCgUfkd+HSGEwbtEJh/kioxe+osQuq9ang4lhtF1ZVFNImnSeCZJFLR4ksf2bFUKrigSSAwtBfq5r7/ntrik36XDr8e6CKbqPqEs4xwySDIHgOFhS7WLch3hU+RoW5cdBxS4ikmtmPxd1gQarklfk6YUbiEu9BxxcytGI2XCHVLGW6Wh6IQIYPZsMRB54bgcbqISC+6KgthBZj/yYUzOrk1IfZlMMDXeKbrGr+6gJxPhD8iWUhsN63BTpb9ja2V9HorrHglfH7MjKDa67y+ga6P4eHAxXQdRZsXUs+n12FMATZYOL5vSRhJOssOm+MsBhC62NW2s9URxndySoY5TqHqHpCzkpc7Foz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 08:45:30.9492 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 976b9283-0013-4444-ec38-08de7a938efb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7246
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TqjpjuRO8MJoI13qyfbqiSBJXowxhx83WOrh6f6xrk=;
 b=rW3LXkzONE/FJmgtcPBWMmfKkQuyx9osISXDv7YqW3ObsWVDAtEDI10iHhyIX5122u3KHV2uAGgXvapUpMknkLbm4nj35fpFWXNU/uJaeAr/kw/lwlnrAwL+725cSfctGlYRNTTpBtfxw0QRlfDkOPCJUvLPk77EtL43GRyZJ/0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=rW3LXkzO
Subject: [Buildroot] [PATCH v1 1/1] board/versal2/post-image.sh: remove
 unnecessary $BINARIES_DIR
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
 yann.morin@orange.com, brandon.maier@collins.com, fiona.klute@gmx.de,
 ju.o@free.fr, Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove unnecessary $BINARIES_DIR reference from the symbolic link creation.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/versal2/post-image.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/versal2/post-image.sh b/board/versal2/post-image.sh
index 17746271e1..af50909fb1 100755
--- a/board/versal2/post-image.sh
+++ b/board/versal2/post-image.sh
@@ -3,7 +3,7 @@
 # By default U-Boot loads DTB from a file named "system.dtb", and
 # with versal2, the Linux DTB is the same as the U-Boot DTB, so
 # let's use a symlink since the DTB is the same.
-ln -fs "${BINARIES_DIR}/u-boot.dtb" "${BINARIES_DIR}/system.dtb"
+ln -fs "u-boot.dtb" "${BINARIES_DIR}/system.dtb"
 
 BOARD_DIR="$(dirname "$0")"
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
