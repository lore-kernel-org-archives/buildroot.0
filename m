Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E2BC02198
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 06:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83F7980E12;
	Tue, 18 Feb 2025 06:30:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nvVUHgOGrcZi; Tue, 18 Feb 2025 06:30:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8958080DEC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8958080DEC;
	Tue, 18 Feb 2025 06:30:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A835372
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 06:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 730C34122C
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 06:30:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CLsmQ-1gYyAX for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 06:30:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::620;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 106504122B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 106504122B
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::620])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 106504122B
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 06:30:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OE1XUYZOVgKXXqFbKQsV76WRCdIh+b2Mdqa6ka3cczthPbJtmhdeTpKhmMIb6v1U3cXrfsiiKSYdwnp8zpJyJ1L1CBRQuwju0xB2n0WCVMhe2Owew62viQIn+7Rz8eUYPb7VNg0UgfKnZDMkzCOrIx4deYguXsW3QEIROzwcQ/Tf5wh+Ho1aA0vxRNYTNDJpXzBxQzEcLpXtTfKUHhKtypc808t4gU4xSeICwLEJPs9LW/pr8G96Z2eA4syPrGhBKRYfktsn6gnypyVh20Blt0NRvBUF+AgpK7rEIT6aXjgLuK9+XufgpT7Quewmc8n3ozJjjPCZK/kDeFddUVbCkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apFedn4Q9e2nHzSifhA09EdXHjYTk6aXd0xHP0PVLNs=;
 b=V5B4PzS75jwmr0irBSuTQvsk4G+EePc66gI475sVEB2eaHDYOL5/jt0q4MbVep5O01egzdz+ERRtx4W10+wVzA4u0rTzu/jsJAS1iGIG9CiqZUT6D1yV8B0vwKwCJjKS+KXA26SB+Nfkzg/fnVlk85bHqYMk+9U5iMa0/rv2+uMYQulcRNCXx6qOanJ6lNJA/YaXyiMwZbA2crwh7R28d9W/+5dMHxshvg1J0jTpzUIsMXRnT7C2SIABxeMBW1YNydnXVi+rIjTINMODJnrMAT8L+XgnphsJT38qOKVYOU8kqPvFMjHETRcM5AJQFaRholGoJvlHv/+eEBr0mimcqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN0PR07CA0002.namprd07.prod.outlook.com (2603:10b6:408:141::17)
 by CY8PR12MB7290.namprd12.prod.outlook.com (2603:10b6:930:55::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Tue, 18 Feb
 2025 06:30:07 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:408:141:cafe::fc) by BN0PR07CA0002.outlook.office365.com
 (2603:10b6:408:141::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.19 via Frontend Transport; Tue,
 18 Feb 2025 06:30:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Tue, 18 Feb 2025 06:30:05 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Feb
 2025 00:30:05 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 18 Feb 2025 00:30:04 -0600
To: <buildroot@buildroot.org>
Date: Tue, 18 Feb 2025 06:30:01 +0000
Message-ID: <20250218063001.4170296-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|CY8PR12MB7290:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b8886b2-734b-491f-fc95-08dd4fe5af0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qt0nigWEa4RdgwLlq/4zQNJtqhYcvqJK7gydALoOsd3Y/dvrfh3OLRiDNW3s?=
 =?us-ascii?Q?QOUH79nNwocbelbRxpnfTfSglizPm/SgFhpFgX+L3mCTcAOPwtPG/g/t2G0f?=
 =?us-ascii?Q?w9lSShF6L9n1H75q1PGvCdEhcQZnIeezLD9gp3cuJ28GFS3vjjef3WOsZhOW?=
 =?us-ascii?Q?fwvudfNSjfuQ4wbAph4A3ZFcFnEtDdAQq+MXY2oWsRq4Qz3nfYJo4ULm/2KE?=
 =?us-ascii?Q?KxijyAXNI4Wz1u/eg1MvOWDsGTTSdy0g2np6nXl19qObjmaNaRsnt+s+xKtR?=
 =?us-ascii?Q?SCevSCbX80owXiOL+BqgXwpQPS+I37ALgEyReXydM1ECx9wJIDQMaCy6/kG1?=
 =?us-ascii?Q?UL4ge0CVvihHEhgaqGcM5KW9t5CB80ATaL5+dnptlI2XE89+xF0Wsxb9g+OE?=
 =?us-ascii?Q?f9BCw+qC9gkE3Hc6RPoCYEWYxo3pog/rpPcjknID91/XC9+OH5czkq8d75ao?=
 =?us-ascii?Q?Ebqp3msnKOsekkrj448LQxH/0qxVtchKtS2qBntlXwri+P3vfY0vTYAbhOaC?=
 =?us-ascii?Q?LzwMlqhtkzZpHUxo2MLuqW7LLhy2nCofFNjQHw6c9x5jw3hur6DIqQkCIjd4?=
 =?us-ascii?Q?j1fu+J8o5mbGj94PxoWAiTRdx3rcHTRaMYct0corj9cMfl0/Ve8E5aSWdUB5?=
 =?us-ascii?Q?zrq/dT51Pq64iF4avF2DJZseGChVkrY+Hll4FiCeEKIC7aPzv/a2N5q1MYFk?=
 =?us-ascii?Q?K22eVDauLkYNEu87FkaM8StXL4SkN6W/hI//K7ISf5liGFkOBwh+2OWC659t?=
 =?us-ascii?Q?sQHfPJfHgQS9uVh69GAwl7lo8zXIil5DpK9pXuTsLJiy5garNt2JaTEFS8Yk?=
 =?us-ascii?Q?6UfKue2qAsJorE7kq4RfdlRDC6+bVmR7KvoUowOsT7AdZmgQWEqqlNK+6cYV?=
 =?us-ascii?Q?t5NmYF3HWc381NfOFrTMv/UfddxqUpw3qiZjL/zt8HOXDZCoLRopxCq2/6vN?=
 =?us-ascii?Q?p5s4w0Ct5kuoh1B3uXLlIjpJjo224y0R07BbhofbsXWWPfQBadiilVHwkE0w?=
 =?us-ascii?Q?XS93VdDGkiicCFcoCGOWSIn3W1G8p7BmtvOMhVNwBzmgaCkQOpM6MSTPhXw1?=
 =?us-ascii?Q?apKGmj1nrNUj3xf7fMjhFlhl1XhF8DnYVjHInVBJjbfm3h8gLGo5uMo1rmGO?=
 =?us-ascii?Q?1hMb/FXBQnhQLw/vsGd+fr7h3tD+KnrZuJt4jB4319SSpw6rDKroCqJ6L85U?=
 =?us-ascii?Q?Au5xxGJx5tk5gQK4czzMSsgv5IQbUIsMWC09o0L7kMMc3QWGHHNhX3LmrF8D?=
 =?us-ascii?Q?2q7gAdtxo8J7UzQM2m4DF3shYKvMbtnH3xjeuJiFzCJMTB/l5ybuvIvwv4cZ?=
 =?us-ascii?Q?e6mkM2xMvFlshDVi2ODasBAKiFGWCYxCb+5DexSJduT1s4DKYkrcEpeiDtGY?=
 =?us-ascii?Q?a8FNxjW4/wW/HkItw45FC00dKZjNvRs/N0TKf8G8BPBYRB5iK0G5GcK9dXkU?=
 =?us-ascii?Q?CRszohDCvrE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 06:30:05.8600 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b8886b2-734b-491f-fc95-08dd4fe5af0b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7290
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=apFedn4Q9e2nHzSifhA09EdXHjYTk6aXd0xHP0PVLNs=;
 b=4dezHe8iQP860tGy2XrkqINajALBcnhinVpcbRUf6XCZsI7Nu0ImArcmOAmTPZF5qZnooYY6AAaG2f9aoU9VmB7ObCClC67TCVl+kQegeGvGptDreo54M5+1S1ijliKlHvoSo8oWGhPHemTeSerpRjxUYkriaiVx8czCQhJXRzY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=4dezHe8i
Subject: [Buildroot] [PATCH v1 1/1] package/pkg-autotools: remove redundant
 configs
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
Cc: thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the following commit:
https://github.com/buildroot/buildroot/commit/b07030a708293756e25edd6432ed02cc53ff758e

The following host configs are included with $$(HOST_CONFIGURE_OPTS)
	CFLAGS="$$(HOST_CFLAGS)"
	LDFLAGS="$$(HOST_LDFLAGS)"

As they are redundant, we can remove them from the autotools infrastructure.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 package/pkg-autotools.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index f17186dfe4..8ffb0e0047 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -200,8 +200,6 @@ else
 define $(2)_CONFIGURE_CMDS
 	(cd $$($$(PKG)_SRCDIR) && rm -rf config.cache; \
 	$$(HOST_CONFIGURE_OPTS) \
-	CFLAGS="$$(HOST_CFLAGS)" \
-	LDFLAGS="$$(HOST_LDFLAGS)" \
 	$$($$(PKG)_CONF_ENV) \
 	CONFIG_SITE=/dev/null \
 	./configure \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
