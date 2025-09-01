Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB82BCA0FF0
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 13:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91EEE61363;
	Mon,  1 Sep 2025 13:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oOP69Xc92Egb; Mon,  1 Sep 2025 13:29:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD3C06133E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD3C06133E;
	Mon,  1 Sep 2025 13:29:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9024710E
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 13:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7562841332
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 13:29:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8EhzJOSiREce for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 13:29:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::62d;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B1CAC4012D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1CAC4012D
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1CAC4012D
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 13:29:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HoFq5bzCfdoB/BmCjg9VNe2/2G5zUCFwMS7Oruspm1Dy/01WH2V7TjqIkc7LnOQAalqlHvlJ+FOYfFkzWoHbgHIpcBNKtI8srtKN4Epjg3T6360w8/BfHLalP++7Q7AvB9EK0jNIC8Lcg4NqfE9X0lxm33wAjq44nCyqc09giQMcnBh+XWymmywjytvrX7JZ7brYZPnXFJUCqEeNEsoeJAahXmIPOZ0nWW1bPrQkDFDE+apcDhkihGGszI6UzA6xEhbEuMyW2VtWXl9P2NxQS4yvox9TnBP8bxd7jcb+itjJT91Qtt/nxk8/kJpUQNFdFRaUDTtNIbVBkFj3ENJjlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGFdgwxHa13Ok/EIe0kJSRQlMJsnrk9V7ytg8MWYQeI=;
 b=GELShjzj6rQLLB93Run9CC8SahGTOEtXIIkQciPY0KIoI7flGma0ACnDtfzwbkFK920/Jctcq6fTqV/g+1STLW8KnBAhgg2/lulgwT/a4brRbSbCHKJ1IS13u4VVTkZhvfcsA50TOjZ5YJOYs+NuspnlyW33T6nx8ySBFV7O35rgZQb4jeVNej23adkm8Zg3AE9KyqDuoVsh6kzabD1TjO0H+XF1OMF/4UpN9FgKGRIB7ORC9OU0gYT0R+8aqJhIl7x3UK9lxlPSaEeYTtTrT2pijwcDPxUemsLUxcRzOLrByRElB9g4FyW9tcFvOlU6swrVqT4p158kJAORX2YbAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BY1P220CA0021.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::16)
 by DM4PR12MB6253.namprd12.prod.outlook.com (2603:10b6:8:a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Mon, 1 Sep
 2025 13:29:40 +0000
Received: from CO1PEPF000044EE.namprd05.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::b8) by BY1P220CA0021.outlook.office365.com
 (2603:10b6:a03:5c3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Mon,
 1 Sep 2025 13:29:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044EE.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Mon, 1 Sep 2025 13:29:38 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 08:29:38 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Mon, 1 Sep
 2025 06:29:37 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 1 Sep 2025 08:29:36 -0500
To: <buildroot@buildroot.org>
Date: Mon, 1 Sep 2025 14:29:32 +0100
Message-ID: <20250901132933.937424-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EE:EE_|DM4PR12MB6253:EE_
X-MS-Office365-Filtering-Correlation-Id: 2083b7e5-5016-47f0-a8c4-08dde95b99e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014|7416014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LdI38xwju+ctt2omAQxiQaEmVtXTezgmLmlMIJqqAF+VidcARQ3YU48zPBie?=
 =?us-ascii?Q?a+UEqSSUx3Abn50hl5ES4Wlmkzb5yZMZp3mhvM+EZkLTE7Ftt3Dmrzxm6xc6?=
 =?us-ascii?Q?aEtUBjMRynBsg7LJSruK6XHs5oxijFGCfhpxtk4LVJ+DBMwKI1mRMJrLQhLw?=
 =?us-ascii?Q?85k8nBa9RtoBCZ3VgRkjfmw6EgZ1/Bhhs6G9DDy5nrvLrJSkciTkAGX33wvX?=
 =?us-ascii?Q?+DuuQq79whu84KSx40UBHaL1q/2oR47avN7MPH7djF6aC6bVJcDQLMAuLVt7?=
 =?us-ascii?Q?msrjBlab3MwUtX5P1+i834Q0jgFlOLn0YksmUQdDO20s6XuPp4e1iCJeu+pL?=
 =?us-ascii?Q?lfuj9rWeCx7GTO6UtO/I7DGtnSJvQvalPfr68tbbk2WOu1JIcowyZ5z3wMhj?=
 =?us-ascii?Q?Ggpy3DaBGLpwRY2yR22DwYtMa4HyeA1UScPxIVk0ycsROCbBwY8ctFwpU89A?=
 =?us-ascii?Q?UiTLZLKtVgxOSUvR6zUqy7BDe053TRRSLrjHtila9DPr+/wg6YXb9PyB1FpR?=
 =?us-ascii?Q?amNz1yCZsPjJoktLXp/ly6EDQ4vvpi/cgc7NB3L+Wx/gm6ncya/9K3O5C87K?=
 =?us-ascii?Q?fkpj1BVR9jlXWDFVwzJ9dIix9GQjb5eD290EL11BGhhSeahdvudlf1VuSezi?=
 =?us-ascii?Q?+ZTXf2QkkHgKHH1RUm+GHH0/LSaKXJtma466a20PpxVGyabvAPzPU6WOZ4CT?=
 =?us-ascii?Q?uq31K6KJDlJ6xhcAxbwy4TG7KoEF6VNFFfQwaGz9E8EAU34/VJmcp6k29hl4?=
 =?us-ascii?Q?IZ+xI4vZOwUSXwAYPiZijjkrKxz+fi09giAWeGwMT2D2uJ8UOPgIVrL+7KiA?=
 =?us-ascii?Q?zS1y52A6naS8NGtJTh7ey/Vwhp1wfpZm93KWrPQ4HwvCQpxonL6WuL9wecXW?=
 =?us-ascii?Q?a6OOZF4zBvp9zR0zw5H9g8n1ltznLZYiAL89WkLa+WhYL+lsXPkJ6kpk6Lyq?=
 =?us-ascii?Q?itPU56207mLo62MPkRQlYZc4loaT1/EnWuETQDOmQPvQODmcIRReIKdohK4y?=
 =?us-ascii?Q?RXK9riEY+tFIJuG+e5aBFtw1GQCGb4R/P+rjt/ygbbEsNILxcsNC/4+npacQ?=
 =?us-ascii?Q?fIhU/2JIp2/W/VHlcz5RWxUo/1GwGCOB+ighu5s36c1jtD5sHcdgMsEMN9EZ?=
 =?us-ascii?Q?EtFIEwk/xeC3VaoTevLgrKLJmjq8Jq/3lsg0QvQFaU9bR/1FH1R6z+6AY4o6?=
 =?us-ascii?Q?yxmeKgUIUI1fTo7DJ2RJIU8sqC+qNhT9A16qvpfDKE4DfNn/5XGeEEbM1LZ8?=
 =?us-ascii?Q?KGS4eruj0EjKPKLV2B6p3PcbtExLW89Zca9D4V9w+gkDfB17rIcTowgi69aH?=
 =?us-ascii?Q?DaFrlgrpQJqlHZVZdcrzvQElMwqpJ/UZ75g4bnR/KC4oysmG+Ip3W6mx0MZK?=
 =?us-ascii?Q?oUNvTkoftnbR8IomiAFPHfMleDYp0EluaIzr1l3M0WUXUp+n0D2RBRw4k29M?=
 =?us-ascii?Q?flx5UmQmRN3DrEa8TgAQD1RCy+oPvzQem6umgIB25mueTsUeQvD7pl+5OPhb?=
 =?us-ascii?Q?GEqaHxcHBDzSg9PFS4kCNSPbjFPsh8qjvvVF6gSNUw0nrhTzDwLuxEv0PylY?=
 =?us-ascii?Q?QGzbybhI4QOv05pNDo8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 13:29:38.8065 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2083b7e5-5016-47f0-a8c4-08dde95b99e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6253
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGFdgwxHa13Ok/EIe0kJSRQlMJsnrk9V7ytg8MWYQeI=;
 b=o1ONpeAi9JxlOmxDHfdJVrSQORc7OUW8SiwzWL4k+xdqmdpNkEmJ1bRgAV10FZFngr7uby+U5ZUs7Uq/7owRbwXfshBTuQhcYCILu0Sw5DnLxzBvJIAYBoCEaL3rSyXsuFU8x5wwOrWkkW/I8pV80nF39NcQs8+3H7EDew1YNpw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=o1ONpeAi
Subject: [Buildroot] [PATCH v1 1/2] board/versal: increase vfat partition to
 64M
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

In the process of bumping Linux kernel 6.12.10 to 6.12.40, the size of the
default Linux kernel Image file for versal products is increasing from 23.4M
to 26.9M. This is leaving limited free space in the vfat partition meaning
users may unknowingly exceed the 32M size by just adding Linux kernel configs.

To avoid potential problems, this patch doubles the size of the vfat partition
to 64M, which should be plenty of space for any configuration.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/versal/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/versal/genimage.cfg b/board/versal/genimage.cfg
index d994d3a2bf..8870777f19 100644
--- a/board/versal/genimage.cfg
+++ b/board/versal/genimage.cfg
@@ -10,7 +10,7 @@ image boot.vfat {
 		}
 	}
 
-	size = 32M
+	size = 64M
 }
 
 image sdcard.img {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
