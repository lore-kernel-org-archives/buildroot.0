Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF9DCD5850
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 10:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48DDB606BF;
	Wed,  7 Jan 2026 10:35:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PSGISaTCRFpe; Wed,  7 Jan 2026 10:35:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7931A607C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767782105;
	bh=0w3WZGHhLSKu6nwNXUhYd/xRYW34u96nuprqxbCVuk8=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=K9McwoFLteJjLWHjMWCPCJJLCWBus+BGM5bG5uDgY7kzw38iVC8pHJzc5jwSzgzN3
	 SOP1/YqFPJINWL0ANKevVVbXDj4cN8y8K1XZcLpOyoe5n4E10P4MyUi9mTUJ9eHDw2
	 I4wf0jtBnFBi+hgpTlgzuoQ9BPMw0oDsoyfwnZMLBdqbT6p1sJubJsNxjtoE8jbLE+
	 YGkEu11sKp4udJAgIQim61NqnPwN/MQoq0T4S9F4r3mn/ySJa4kRecI6AxAJNFYlWf
	 fZIviT6gNxAZFel9O18tu/FwTr2b+fnnnDP8DxR+fSjgyp9UHj+fxTmOr3JmpQvI/Z
	 IvcHls8t8mfEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7931A607C2;
	Wed,  7 Jan 2026 10:35:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 33B3F2A3
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 10:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 317A5402D1
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 10:35:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H4bSgChDPmvS for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 10:35:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c111::5;
 helo=dm1pr04cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1BFB0400D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BFB0400D9
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c111::5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1BFB0400D9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 10:35:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tnMaX/oNdIQM8u/WJmpqzwn3c4R/4eIUafn0Wtfw5yFY2h0G0JSTX5yR1IMxSxPHYTPwR2Otb3uzZUMiGZ/zG5PpefxfxTAAA/md7En9VEbR+if0HDFOq/bNPrVZaklZ+OjcLRsMAxnAD+ZUXIXAZkRUhYoaJVuXqJwGzND4kG/kVEuOs64ToOZjOcP5+Rj0SrehizKwj3NSLP2MbHV8zcplsa+wbvUqcdW6KwwVFoygZlH62cupD/wVloSMUgCx4EX84TlMsGShBzxHKYmaClLb2UTSjWlL2urKCjtsLTJtoOoKFlNnhAj5MWI0LAGIf+2iYPanhRQ2REL5bGpCdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tq906gTer06/mX6zCyjFwtagBI/Tgx3AsAIeD/TEAlc=;
 b=M16zRtmrISkbUSzkki/utLnJbqBPKk0Zsya6+XeNQiyrlh6hKyJaSYBW+ppOarz1qLjL81LnzNtEk7NHC+gsB+Xfl028m1W1m2q50hBpTSpXp9tp8UCgXZp1RpFQv/oPze1ri9wYITHdFt+AqtmP4klWU0PhC7X1cvYkWF3Yf7xt6GZ7QqC0v/DykVrreO0jZ1AdHA4S/Qm38BPTmZirqvnZ9tmg9QFjZsuhFbdgVRJBb3GoZmNkmED8c1ytMAioWphWKOYutFy8OmJSjVJ1oasIfiIc7arNlVT2gOI6bH2plEnex1OGeti57IVMCN2ibkbwO/QcW6wPiwfRw/h+BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BL1PR13CA0330.namprd13.prod.outlook.com (2603:10b6:208:2c1::35)
 by IA0PR12MB8205.namprd12.prod.outlook.com (2603:10b6:208:400::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 10:34:58 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::b) by BL1PR13CA0330.outlook.office365.com
 (2603:10b6:208:2c1::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1 via Frontend Transport; Wed, 7
 Jan 2026 10:34:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 10:34:58 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 7 Jan
 2026 04:34:58 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 7 Jan
 2026 04:34:57 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 7 Jan 2026 04:34:56 -0600
To: <buildroot@buildroot.org>
Date: Wed, 7 Jan 2026 10:34:52 +0000
Message-ID: <20260107103452.84964-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260107103452.84964-1-neal.frager@amd.com>
References: <20260107103452.84964-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|IA0PR12MB8205:EE_
X-MS-Office365-Filtering-Correlation-Id: 29ca04c5-27d0-45d1-2b8b-08de4dd867fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|36860700013|1800799024|7142099003|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BGAkEOiA8CmHe/9UPIQVvCahtplQJ8oFXgGq655QU2ATDpSTDYx8oAq6vYpV?=
 =?us-ascii?Q?ioY+JpxAW2DwS3aTXBeql2PQUv3wKIaWOZEymTkNvdTAVKOFfNWgjmSQkVu2?=
 =?us-ascii?Q?GFu/raOyWtNQWpAW5Gy6xELGLPTdULUo/pJVm+mEyyymTfGGCxuF79ndpRdu?=
 =?us-ascii?Q?mnVrF6Xg5M07Jx8VlZ1BjaZmN6iUeyZvmlaJbjtxQ1GswfiFlzlOLuaMnZE1?=
 =?us-ascii?Q?isbNUMzqbtrBcsJ4meGpKHfbFaohmZViGfiBie1SzeTg2cGuEs6Reckwfu/8?=
 =?us-ascii?Q?Gx2paQVEy69JJ/IIfau8Ied0qCoJJYB40gmFAiPWC2QDamzGa1KMeoXg1rXg?=
 =?us-ascii?Q?CqGt8NrrPrihfdU/AeGPNSuCB9/Sz4WZoCVlnZiV3kSucJtBpGdGMQ3QKW3x?=
 =?us-ascii?Q?KpMYAp5b3o1nX3Tqdli1VMnG2jAAw2CmB0hep8UohGj8aobFLLSgq7Mdb7pJ?=
 =?us-ascii?Q?FxwKkFMcowXtHuH0/c8IcheiJcldIuEWanTGRDu0NCEYAA/G1b9gWUDTXG9Z?=
 =?us-ascii?Q?yCnolYcWAATyz2LmewfnnN5VcIhjMLa8Gw7w02OgVXJyqnEQqNzK9Zz3lW2y?=
 =?us-ascii?Q?MosmC/g1t2lLUpTAo27cg3FYUSuEROfVGDCdoxpbXjSbz/yF9IqfWTJ7LlhX?=
 =?us-ascii?Q?p5JNG7cxWdKNdxiQQogwiR7dgZEQEegg5piOuB9OSOZ3ZNce8189IuTnRRTx?=
 =?us-ascii?Q?eMd/8DJpGItFg3mwJvFgJ4Qpfr0jg7CnDySW3IVxfbvlIc7jnjNbuYRuGusG?=
 =?us-ascii?Q?UqHf2mSudPCYq4AtexlnSJBNhRObO3H6wewoMr/bKGxEsH949DrBLTHr68ed?=
 =?us-ascii?Q?VeeMokFc3aKA/z6zoRjDpkd6pdz/s0gZcj9tZCNITJ89lgUTbLQLCTnwer/t?=
 =?us-ascii?Q?37Mlg2Z9SLGx3FFmGLZtVKpjj5fnR79mSTs9Pgp3K2CYT/cOsyWCxGapR223?=
 =?us-ascii?Q?jPQlQXHj04PJhD1XgOPhF6LsGY+Bf7sxZ0/HVuPLi3HWOl1KxxVt/dEwhie/?=
 =?us-ascii?Q?R2Fk5ZmXUAer+dq8I1S7JeHDbImIPk2FJLIjpY9ewLu8w+QKV3wjzLU8pCxh?=
 =?us-ascii?Q?j+vuUt00KJpY2ixVnNQ3h4V420N89FI+2z1HT0QxFxFm4M00SFmsG+Drjf+v?=
 =?us-ascii?Q?8AxEqk54wmC5SCCpGhQsEKZlj6YNKNyw2ecOsHg+qX6rAioM6aWvzl+6qO++?=
 =?us-ascii?Q?kbYhDwBbrgLM4vKQjLLWhYvqA+7UJWTmiFCdNpOBFgI2wsi1qcu0YSYBqEPM?=
 =?us-ascii?Q?pdg8hB9mb+Heo+Kuq+Lwnod1/h7U+HbwdDxuk2Hdx/kqR7UfVeOSn1vvvF05?=
 =?us-ascii?Q?EQ1ibb63UDPBqn73DjseAcM33kk604k00ULlC2JoyUJasIx2cJ+LV1NGku8u?=
 =?us-ascii?Q?Aa1bOzzLh35wjGiw16qk7bziSCyJxZnZhhR20GGHpAb7qUodtFPOAaZMHoRd?=
 =?us-ascii?Q?bbM8Mh0RmmnETy1z2kFvaU+UljkevTuV7xUZ5TGl00okDhLT1lgwQL0g6ZoQ?=
 =?us-ascii?Q?A23V+QGpBbKoIZs9uuq/ix0oaGg6KECpk+zIUPq/ADf1eC6RrOwQ32yqFK9z?=
 =?us-ascii?Q?JOVA050snx/5+KaNlax8c9hrysOjmHrqtiE+Rt62?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024)(7142099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 10:34:58.5560 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29ca04c5-27d0-45d1-2b8b-08de4dd867fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8205
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tq906gTer06/mX6zCyjFwtagBI/Tgx3AsAIeD/TEAlc=;
 b=1YuuPEzCGgQlbZVLVOIu+okvs/Zs/X6+qjXUw+RAvvpK9PD4eD+mMb7uRLhSPuyAPmzljGs1W9Stqv88ChnAXR5FpIWZQyKB8iB8BBBD6ctra4jEKksyCDEu4j7VXeWLDksdz8K00FH2kOZuE+Lu/f4lYtdsj1iFh/rC9ZknMps=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=1YuuPEzC
Subject: [Buildroot] [PATCH v1 2/2] board/xilinx: remove xilinx_v2025.2 hash
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

Now that all Xilinx boards have been bumped to Linux 6.12.60, remove the hash
for the xlnx_rebase_v6.12_LTS_2025.2 release tag.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/xilinx/patches/linux/linux.hash | 1 -
 1 file changed, 1 deletion(-)

diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
index 2c5a57277e..0b1d9331f0 100644
--- a/board/xilinx/patches/linux/linux.hash
+++ b/board/xilinx/patches/linux/linux.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256  38aec9ce252ed6a0b64d294d4d58bf51e25b249eefb31b800a5ce62cb084298a  xlnx_rebase_v6.12_LTS_2025.2.tar.gz
 sha256  444f573cd4438af1f5062fd69fcc82965a56068e6a25cd43c062a68398f90b03  xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
