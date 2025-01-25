Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B21C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 22:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58EAA60B65;
	Sat, 25 Jan 2025 22:16:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oH91qGHmWwM4; Sat, 25 Jan 2025 22:16:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CEA760BB7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CEA760BB7;
	Sat, 25 Jan 2025 22:16:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 01307941
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D69C181F01
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:16:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Il2DkKregVmb for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 22:16:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2407::605;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1F15B81F00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F15B81F00
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::605])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F15B81F00
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:16:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TgZQUxysgTsvHlhRaxHTO9xi8yHWNwkd3z2MiGkhmPrnAJXZYWriD0dplK/J/Tp+2QJ52zraXW+2BjJZXb5D6vo5aSWWgcdFylY/kPmUtLGXJsOHzKDiBtcB8uJUcjzMM4uzjeOTjM9MF+tjS2cgZJRr6HG2Pt/R4n+KHpVmudaRsprbv+mIC6S9t6CKf93szPwXzbSLv2hZviEDa7OHpNHgm+gFqsDpbc/YAsz6GUBR8h9QUrIoSaG38V52gmqmCY74j37gfAARRALs4+uC3GJNFUV41NgahLLNMgMRLWno4wxJaIp0KcSvvJXTbvTSYjvjwE7nTJ47ylOhU7hN/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5iZvM6o4ZRQLXmCX9kJefjsk+lrE7qGT4fBOZXd+npI=;
 b=uo+rPZZBpZj5HHNLaK27TMh3ATlcpqdAXqo3TAUv7dr1uDeDddaDR6Kx+ktyb70cDmSc9keDckzh/khnPPMjOo90PxJS2YiIQq5uVtt2RmArmetr/SVjvqGP6+6MiOD1amPDDSxEno13TCHqeONY/Q3X8G9GEuI1ZECllbAmaUM3sFuR7xq/qpn6HVeN26N+rNfG9IGxn5aHKtBgO+ZrDZ7Cd3saM6g+sptgWD+mhOzmjZ9VctvzQ90s70ODQlUmL0WV1ZeqG7AanKr+AwnGNulXbmwO3WEskCJJzE05PpEKFuzJLvgsBGFSBW6+ZyPc1+dTM7MNyVFqA8HdKSOelg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BY5PR13CA0032.namprd13.prod.outlook.com (2603:10b6:a03:180::45)
 by DS7PR12MB8321.namprd12.prod.outlook.com (2603:10b6:8:ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Sat, 25 Jan
 2025 22:16:41 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:a03:180:cafe::ac) by BY5PR13CA0032.outlook.office365.com
 (2603:10b6:a03:180::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.13 via Frontend Transport; Sat,
 25 Jan 2025 22:16:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Sat, 25 Jan 2025 22:16:41 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 25 Jan
 2025 16:16:37 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 25 Jan 2025 16:16:36 -0600
To: <buildroot@buildroot.org>
Date: Sat, 25 Jan 2025 22:16:27 +0000
Message-ID: <20250125221627.3315039-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250125221627.3315039-1-neal.frager@amd.com>
References: <20250125221627.3315039-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|DS7PR12MB8321:EE_
X-MS-Office365-Filtering-Correlation-Id: c0103fd2-4334-4a5c-3fd8-08dd3d8df1c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?82n7dsYzDLai52WIQSgrl6cveDAKbzgobd1pTkRkOb2uk77pu6E3phxIBcu0?=
 =?us-ascii?Q?d0FIJEJ33iSwsZ7IVtQNx6Kg/6D7PZBRCwLqJ2+BjzZrFgFch2+aj5P3aeZz?=
 =?us-ascii?Q?wSa+N8Bl1DY4RKiT8LfgOxkXfHl2T5hxjD4PbllUyqnSK1F3CYKv+lZ21ReN?=
 =?us-ascii?Q?eQtac2fH+ZnbwSvhSvGY4LtqrHRUozaImtLe5ZNmhrEO4IkcgVbNmStyBFN1?=
 =?us-ascii?Q?Rj4aNek7/LhA8AYJ0Ow4dq1h+u+si0locD3q1qAL3C2QBBaCbyJhZbjDECqX?=
 =?us-ascii?Q?hNJn3pRwOWN+whMmzticHxRfGh4tbxA/0Rf56P9ixbkUtOjICy/ds2RsE22q?=
 =?us-ascii?Q?DMbauJaWWMPn97HDOXAWJir8oFBmex0nsoQOYeaMty8fMtVLKGWMSXobrYq9?=
 =?us-ascii?Q?au47syKsqxR/s5yZJnFUHQj1a35txwq9hSVwU0HUiPiLyeIRSe8Ublpx1boC?=
 =?us-ascii?Q?Ryz7qq7Dxx71Vr4bItsnuqOa+G0ns3zov8QdBuIwyqYBIExlAhGcvwHNWfK8?=
 =?us-ascii?Q?H2abQTBLCGrZqYUdYXU+igWUeAlQZ7DIg74sExAZlFkPRqdqOPBkLo1OEeQT?=
 =?us-ascii?Q?yoys7+jLqFtFWuUJGESs0eG8qzspFTVRxrD6ay/wyNr7tD1SOpG+uLUnnHYl?=
 =?us-ascii?Q?SbHxeqqI+XHP1g623Q3pmuvxOftVjD90HTFlxFYnh49VGhDjYYMf24ZnuvsR?=
 =?us-ascii?Q?SPzeyQMaDLUZtjjVUDm+/nQufoJig4LQ6/g8cLlvt6ny8OG9CC4l2JjSPVtS?=
 =?us-ascii?Q?scVdbbgKK+sAWba07AseuZF56ptsyjJA9OE3eRMnNNYvcg3ZZRfBPLlR86/+?=
 =?us-ascii?Q?aPbz0SE1lnJo+J1iyhZa+O6NE/cW8NRANp4pwS6ZusiZlgdOVdOSU5ECU0fr?=
 =?us-ascii?Q?1U2y6G43CKdApgRdUkJRuHeiiW23TZbgmAmhWrHvQiaASxk2I4LNKyFAPMsr?=
 =?us-ascii?Q?l9dkwRtrO6jKUufn4PE+OQIzr7mOcQxeznAo8egV6dJxnRGPe5w+kfT2Fvxb?=
 =?us-ascii?Q?0pgGKc+4gzQgWj6PFC3I9Af7cqmm/eRn+tOO6oej7i2HXuK2x9ctG5yuurzl?=
 =?us-ascii?Q?HbgYnymKe1kfUQ+za0iFEqjvDnCrnDwyjV6J4zl4e8Dc2kXy0NTi6XlM7MEl?=
 =?us-ascii?Q?ARzJFe5R1s5Bmr8tpyExKULtj0vUokXhhGcxd1svi8IlnZALxQnQCxdwik14?=
 =?us-ascii?Q?qYNP/yXly51iDSImo6E+LzCf72Qo/K6tRyrTuH2iKG6kjfTZokTzmXYmargZ?=
 =?us-ascii?Q?UoyaJIdt3Txea5uyZWmYGp8nyzULkWbQa8zqQpbS4Mx/yyQJ/eYYSLLyRg+o?=
 =?us-ascii?Q?eyBshXoSvIx3zTDaVZMXy6YNLplE5HmBOyYIrKxTR5xxYWwPhS8/hYLU/V7Z?=
 =?us-ascii?Q?SoH4NAoQ7uyXS/yxHzG6yWhv4QRagyWfTxm+CCakdeWAoo9uvHYpVV2T8bhg?=
 =?us-ascii?Q?syb3sb+2dQ5VP4jTek3EVqljTOn4v/z+C8cWX/+ipbjHBLSnFCfx5ne6oNzT?=
 =?us-ascii?Q?xNMD7qf8gEgrrzjn3to36Pl0y6OnClOyZMXg?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2025 22:16:41.0638 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0103fd2-4334-4a5c-3fd8-08dd3d8df1c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8321
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5iZvM6o4ZRQLXmCX9kJefjsk+lrE7qGT4fBOZXd+npI=;
 b=nYHQN3wpJYxjrcKGB0wIuA1DA0yzN5c/lRpFQDD5LdAMf7JdtldWlDZIdrczcjhHzBLV5KiRmVczWwPsO1CYZG9RzyEKnO4c28npT0f8j3oE72s3s8gnQ1bb9dYrHl26j5eWBFgsNSMr3XB3JNXldMsu8y4b0dVcfNzJ/78yo9M=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=nYHQN3wp
Subject: [Buildroot] [PATCH v2 4/4] boot/xilinx-prebuilt: remove
 xilinx_v2024.2 hash
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
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that the versal defconfigs have been bumped to the new default version
xilinx_v2024.2_update1, the xilinx_v2024.2 hash can be removed.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- New to patch series
---
 boot/xilinx-prebuilt/xilinx-prebuilt.hash | 1 -
 1 file changed, 1 deletion(-)

diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.hash b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
index 827d76f2e3..35f7070e5f 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.hash
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
@@ -1,5 +1,4 @@
 # Locally calculated
-sha256  ef61a4b249ecbf632a25cc34c3b03b8290be44397ff739467ac92ec1701e23bf  xilinx-prebuilt-xilinx_v2024.2.tar.gz
 sha256  86ee9629366aa8c0d70b87202152a793804ed4090e3a6fdac4eaf855bcc4d458  xilinx-prebuilt-xilinx_v2024.2_update1.tar.gz
 
 # Locally calculated
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
