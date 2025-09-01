Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F589CA0FFD
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 08:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4AC040ADA;
	Mon,  1 Sep 2025 08:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3wjGNatKZFg3; Mon,  1 Sep 2025 08:37:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 009D140B86
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 009D140B86;
	Mon,  1 Sep 2025 08:37:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A0CF510E
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8749F4044B
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:37:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zh-nURr0NCUr for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 08:37:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::612;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B624440450
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B624440450
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::612])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B624440450
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:36:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DobIX1Mr3PJPUhU5xbdoWtlZDyVAefvxjeMtVcaVdmrtRuqGDMIy+sZuKRgG/btaNhkr4tihPNdbpnCPIIqjdoxsFWBzmurGXKLglyLh4Qugp4HPvjT37TQLAhK/ZxGm79DLR8AKaEkIIegMi6es+2zBsOxifsUUtmjIgs5u5v1dZVqB+CWWX+6VmDq3VEUg8Xr2OYNN85/byNCaZ0hQsZ3T1/9/nAU/wHobha7ZxITCtL/+B7KDRwSiJlnGzaB0Gek/Y4YOT6BUIzUag/yW7W7D00UYMlhkNhhkZyzasTMJlKk/Pvq5uJXNN23DEgMNyDRe5vt0MNaBQZ8Yqiw6OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6dFSmmXsFpJ1cfe3i6oURwGjme5f9m0EKrOR4H7yxaM=;
 b=XayAxqvdXDD3LaanAiwTIpCyoyYaVNRHiHVzI40MwwGzenbIHm4/DD+4RtvniXaM9ZSmCx4VGjyVKE5lYrezVVi8OfVHKk57PzEMBJJGmahMa7/yIRqkOAs0jFo6AeWHYkZ2L3mka9O8lUxMvTblKYo8byIjz5F7nfD7PrOEGutLo3JrR7sCWiNcCmEy+mXOOsAFJhRRZc8//r3XImC+xLfDnICrZ7ot3Lbz+MDqt+GlbGxu/R4TKCdQlfJDE0+6jJiyiESgpA8SNG6OpXQUB9p325n3Lp3YA5lt1fd0/ygys5igxf6zNsOabgNqeU6IJn2rMiVMHVQeiRYCIVJuVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MN2PR12CA0021.namprd12.prod.outlook.com (2603:10b6:208:a8::34)
 by IA1PR12MB9522.namprd12.prod.outlook.com (2603:10b6:208:594::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Mon, 1 Sep
 2025 08:36:56 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:208:a8:cafe::1b) by MN2PR12CA0021.outlook.office365.com
 (2603:10b6:208:a8::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Mon,
 1 Sep 2025 08:36:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044AC.mail.protection.outlook.com (10.167.243.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Mon, 1 Sep 2025 08:36:54 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 03:36:54 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 1 Sep 2025 03:36:52 -0500
To: <buildroot@buildroot.org>
Date: Mon, 1 Sep 2025 09:36:46 +0100
Message-ID: <20250901083648.458639-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250901083648.458639-1-neal.frager@amd.com>
References: <20250901083648.458639-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|IA1PR12MB9522:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fb9037c-f938-4ab9-1150-08dde932b4f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|7416014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v2+5CJDVZg6FAW8qdIqBVhLdarf5RLc20R7k72X6MOsRoQV4/SEjcudysASz?=
 =?us-ascii?Q?G979iyS7dPVwbAZY7UV3Z9VR7fa6Ep0Q9EQ/dLXXqJw/fd89eXxESvzhcMWw?=
 =?us-ascii?Q?6jcCQHJxN5RyqV3umHXpgLIzxOSikcFKVE0KAEsE0s9w13MQBTns92fijXMS?=
 =?us-ascii?Q?4CKPlMhcA2qtLLmYa+6JBdPZbR3YSuKJADLHBLZCgxQTYkGKLW62Su8ISyYn?=
 =?us-ascii?Q?QySIAJjNkf0l5Ml3AfB1ViNf77uuErVrzoQP2JgB7WsJMi2laqLoQe0nD6+2?=
 =?us-ascii?Q?rfVEwFRvrRItxrDFJsJec6Upl4P1nVXEwLAP5Ex9/rRm0CuoZgwldTzC+OCZ?=
 =?us-ascii?Q?1RoaN46SfaTacTy+NPVJ5E2sqUUwlc9XoEzTQo60zraR6VeXDLKUCWvJuyJ7?=
 =?us-ascii?Q?ylNEwv9k9xJVKgVxlh5fWBTAM6vjCmS1+bW+Hv1HhwLYh7/2IuravPL3yTLI?=
 =?us-ascii?Q?LPEMo/hGpv/pQ7TaEsYBYfXAzNILbHs8arxkvQ1uBjNTtW4K09NZqb872dG/?=
 =?us-ascii?Q?0B28DjuEcL3+bKeul+uFQ/lHv4js5jkl0yB+3uVnN+aQrqzynF29Mnr/L3Vl?=
 =?us-ascii?Q?xNfj+H0bUYqPUqaf0deGvYepPIXHcYkNMEHon1eOcA1byC+9BMpcm2pMjCkc?=
 =?us-ascii?Q?RhYd1QiqemR7Y5/QBLkG0J5DSwS+JD+QrL6rdDVNBTNzWNlrbkctaSVKr0qX?=
 =?us-ascii?Q?xI3YOTySJj6PoAKoq33YUMZSc6tfhY/2IowPK4g1BTZlFAnNqvSeQS0v5y62?=
 =?us-ascii?Q?K5YRD/zF0vkXFBG/CQyrMsh/5sC9QfSKSZE1eAKsMrw8BmcQMjvZ4PHwqhOb?=
 =?us-ascii?Q?ipF4KCJw8LA6P9kDEJuvCB0FpyYJFcxQMSeyIYQGwNctNmaPS3tKCcoYW8Q4?=
 =?us-ascii?Q?tedM7V5LMJULaGQ52dLUs6fdfO5zV8iMGFE4nkFFgJRStqGEIAB5MQxz3aQd?=
 =?us-ascii?Q?IeKBoWdgWHnkujgpQM05hbMVcI/9gz3kYHfY1B3w4/bZJz9grRPIsiuT78bO?=
 =?us-ascii?Q?/CAc8DQf1n9I3jBkAafXaXM5MOPUFrty9lzBwCWov8ktYoAavzmamHjdctId?=
 =?us-ascii?Q?NvHAXXSwFXHSQ4KCCL034GCf+XWKdWSCRmtUHg6AABGUlmu3RBYxj2xG39qE?=
 =?us-ascii?Q?0UO0OQ4UqC7bUn/X5q3upss7JaVRqsd6bhxDdj07dQVXDjT4ekJXM/oTRtdf?=
 =?us-ascii?Q?ct3Rj+Z+a3bMkwxffC3yK1EJRV/0NvU4AOwtPG6E9ysG+Be++cvdApGkgF/5?=
 =?us-ascii?Q?4nvh9tXWYsO9+ieFdRI8H/QtJ6Mwkj4GZnzGKOzrP46Pw8WmlGzBSdZ2ZIQX?=
 =?us-ascii?Q?OsZqm4zP+sVe8G5i8koI6knIsE9HZGthCQYoX0FQukHxaMwq7zqXU4cUIpVT?=
 =?us-ascii?Q?s9PYCfG+FqZATmlNROWbsP6AtiW6YnaXxocJ24Qum37YCoUZrM0gHrRYbcn+?=
 =?us-ascii?Q?uQ0EJorD+XgT+4KEwHWv4LzyMb6AuwFh5nwGd9mmMlz+bmaJp6Y3dpoL4hEl?=
 =?us-ascii?Q?lC4m3EmUX6fSmQm1OhvPcVpmSq/OVuS1/AqPfICjjknqqXqfoMCWYiSO8Wn/?=
 =?us-ascii?Q?TC0GfEjxLJ22Xd08mLA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 08:36:54.9790 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fb9037c-f938-4ab9-1150-08dde932b4f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9522
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dFSmmXsFpJ1cfe3i6oURwGjme5f9m0EKrOR4H7yxaM=;
 b=vfj74XApGvXy0rCPb4UEcOlgmQDHXNHM2sHRQUO0CTdHE6iWWP8scqwM5OZlN85ekwTFMJK0bG++gBxwXapHmzcHNa+3kUnI1Qfw/P6JsY5boSqbzIycV6NZres8kMSE5jfrp0brkOsiofE+WqcOEgVn+2iNoemQOs5voW/Bd6U=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=vfj74XAp
Subject: [Buildroot] [PATCH v3 2/4] boot/xilinx-prebuilt: add hash for
 xilinx_v2025.1_update1 tag
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

Add the xilinx_v2025.1_update1 release tag hash to the xilinx-prebuilt
package, so that Xilinx boards can use this new release tag.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- new to patch series
V2->V3:
- improved commit message
---
 boot/xilinx-prebuilt/xilinx-prebuilt.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.hash b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
index 9f12e88e7a..a8dee8f129 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.hash
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
@@ -1,5 +1,6 @@
 # Locally calculated
 sha256  b9e2572885ad12243e10d48d9fccb24771a528b9f27aae1b29b45f0806ce9f1f  xilinx-prebuilt-xilinx_v2025.1.tar.gz
+sha256  48fd698a16f79b9a828c35ca5b2b50fe832149d1a2938c94c0bb6a2e249b0bed  xilinx-prebuilt-xilinx_v2025.1_update1.tar.gz
 
 # Locally calculated
 sha256  7b2074b607264a07347e1a7ef0323229585942793469f34b2cf9628f7623e05f  LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
