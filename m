Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAB8CA0FEB
	for <buildroot@archiver.kernel.org>; Tue, 26 Aug 2025 04:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B66684D9F;
	Tue, 26 Aug 2025 04:17:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2KXn5MAWNd3I; Tue, 26 Aug 2025 04:17:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A51E884D9B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A51E884D9B;
	Tue, 26 Aug 2025 04:17:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AC294114
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 04:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DEE76F713
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 04:17:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t6bacYpm2iMn for <buildroot@buildroot.org>;
 Tue, 26 Aug 2025 04:17:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::629;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F086C6F712
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F086C6F712
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F086C6F712
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 04:17:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3soAt7OR/3NDu2dy5wt/Tmhzs7XY1IaqQXGuTxSBEPaOdeEaUOFeXVHBaWTZLJf3U6za9CrTTQdWiUo3LqdIMWVq3aarMMvd3vzknRLd228mn7BkRBhHM9KVLjo0mThW2eLCaEqe+BijBdsIrXwkNeHgcC2HVoviiutARYXtZSt7UOKI5+/5kJ89WyRoQn8bI6TNEK5KvhmRowpanJPNMEzRJIt9J7ERRKGhaT9y9IzYsnG6e3tVtmUh7IZsALJQigFj4TOKHTcLqTB6v8eyfhhHd+aU2l/w9dtBSSkHtYQO2eQYRl/eMT21VkhiA25U2+TbiXPQRcrHvpmc5FXYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JoHyUpmj01qVDxy/0klb1TVhp0wOEqzRN2Vtsz3tqwg=;
 b=ohTLDuraESnYZMbQwO91zzBWSeclZh7ARmjml+2lu5CbgZiwprnEHx9QwHNBjKenhSxGXRa23WX6Sa+Ew+hPXqRp1bLj/mYBGUfVCQbfGB12HwE1c+RYMl714Hj2T75dGBiFVPJFuiadPMYyoqAnb4UU4iUAPkg0OAwJlumQU6zEWUwdSaxYHsk17a2unDb9WxkjvrxJBZLWhPl63sM7OjjsSD41r7Zgipi5W2GP7V5aHs4eJ5gcA+P5gtO+WtxhiihsYkz9epp456dwuWnW5SljA2k+xcvYq1OzaHAPPr5ok6EyGAt/hQZzFE2B+XbDn/GJHioZ7zUtqlunb2YAYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR04CA0191.namprd04.prod.outlook.com (2603:10b6:303:86::16)
 by IA0PR12MB8648.namprd12.prod.outlook.com (2603:10b6:208:486::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 04:17:15 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:303:86:cafe::b0) by MW4PR04CA0191.outlook.office365.com
 (2603:10b6:303:86::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Tue,
 26 Aug 2025 04:17:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 04:17:14 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Aug
 2025 23:17:13 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Mon, 25 Aug
 2025 21:17:13 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 25 Aug 2025 23:17:11 -0500
To: <buildroot@buildroot.org>
Date: Tue, 26 Aug 2025 05:17:08 +0100
Message-ID: <20250826041709.163460-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|IA0PR12MB8648:EE_
X-MS-Office365-Filtering-Correlation-Id: 20e6efea-a2f0-4cc0-0476-08dde4576fae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V9D311M5cLryk8/WQSudtQ4SD4pe5zbjsrTeYVXBmikk9zIa8Fe+3Hz0jxBf?=
 =?us-ascii?Q?nIqv4zBofxMnjP+A2j8qcQwPprAxYkt27TmiTt+OHlu9A352h+q2gcl2EBFa?=
 =?us-ascii?Q?P30UmJs388PeRLe6ucDTpsYzu/RHesUVnVrX19flvtlgVmrZp7zGyiNQ7QQm?=
 =?us-ascii?Q?T00PoPrSFqS3D3hVxLJtQxap0jBOLCSWtPenVD+GsgW57eOun3d9bpfvhUSk?=
 =?us-ascii?Q?iaWvJeVkIb0iOi+wDYyCTCiSXZm7748x8pWLYuC5CYhpZC6itbyfeJjf4M9z?=
 =?us-ascii?Q?r2XQas2UVz4OCgEP+DwtEZYAjEPJfSeGCSTLZ9SRpDcCBU0jDUpAaBOqouxD?=
 =?us-ascii?Q?Pz8DaKYvrmKNH3ScIxF3vVERmtcR1ywosKBns5HdaeXyCZ3Lp5JG7aHlViap?=
 =?us-ascii?Q?FG1H83IoWnPv8yJJSreEWAmsLCnBmBvvKJT0V+OOmZX0T9hfJ5tKfMe38z8B?=
 =?us-ascii?Q?549UgiOIZQK2P89TpucvMSbUxcgv2adx2SfXpuEtv75sBRIZ+iFTgReaDxX7?=
 =?us-ascii?Q?50qPoTO/siyBeqXUTo9b6NefH0PyvIjEMNp7Tn3n76+oPwkrd5uA70wbVUEK?=
 =?us-ascii?Q?1jUOesa8IzM7ls91U0DFS+EK5VodZHN1ikOSJbTo3WB+dE2dIeEY123QnoPp?=
 =?us-ascii?Q?5eKGtmOodlSbsWhaSSdhkP4x2excY6btgj7qUluAGyfKFWM75v98TKnu+UyX?=
 =?us-ascii?Q?IGMjAyLU2gKdu24242KNJHBJ2Ha7fQuqvklRACE0UNJurLOhEAoi50a1DDo1?=
 =?us-ascii?Q?30Enj5FEyzFVyPHuq6HnbwE/hpM5wtl/wO8SRq+9WEqYiEpAcG8GoU9JFP/K?=
 =?us-ascii?Q?PAhRc0h3lSz3aIRP6ugASvQARlluGwE2kkDcvHd+6yRj6gyhaMDf2vyysuhW?=
 =?us-ascii?Q?7c3NE6Vd3YXhqekWltMWtldN+sma1gTtZdP6uD14OZC5huDl7/qBm+tfk8Hh?=
 =?us-ascii?Q?1cFa5Bt7fCKVUQtmXb+Kp+9h4r8jFKzJyeOCaPId5kdmsKnK7QURQcEaLzWr?=
 =?us-ascii?Q?MlU6iIIWAZgAn7GLNqSpDT421eGach4dPJdxW7TSyUIW0wkublfS7UXNAc16?=
 =?us-ascii?Q?gaOm/yTs1qQN4ga/myQ8+RASswLgNCMcBvtMM9JcNUosWynHX2ub5+ISk06P?=
 =?us-ascii?Q?9HqP++e2qgDKHj/qO0DetnzxVytx9jeZ9QDh18MQkPu2LmQSBiTYvfI6q8k1?=
 =?us-ascii?Q?bzVyW68bPtoiqESHPU2NjV4RpRQw8s+alU+RpS73kpnTsDHQvgHw+LDPqlSr?=
 =?us-ascii?Q?MOU6cCalpPm85yNeCji6sPc2o8M32P9VdIMaSLkCvTehU/yIMXU+9yOcpkpv?=
 =?us-ascii?Q?rkcmeGqgr8MxSb/tl0dQfc+4s8yMvLMEnB4JFineMBwDyz5+hqdl5RoxRxbU?=
 =?us-ascii?Q?hfb+eWdB0qQgTm+hxd4c0PXylTl6xsAngG5rQWCsDXGqq+zs2msag2yOTSad?=
 =?us-ascii?Q?+dSbRF0oGpJaPtguXDKtkWuro7gKbdzSxEbn5IwdDcbwYGXEhjXjzhZriEmh?=
 =?us-ascii?Q?7/DJrvbXp8ZC16Iuz163BPvSRxA0YclHAGbBpFBYcaqbjkbEHWExFMbWnsL1?=
 =?us-ascii?Q?MVlFYUXt9VbVqVX3CSg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 04:17:14.2094 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e6efea-a2f0-4cc0-0476-08dde4576fae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8648
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JoHyUpmj01qVDxy/0klb1TVhp0wOEqzRN2Vtsz3tqwg=;
 b=Xat95z68XUPYxgxEC+Xs6XmFa2fgukyWBnNwSMjSanRtwYUfdcu9mOIOZbypprI/gWi8Gz8ast0/hpKNI7un/iM3cZX1yke+iLU3PB/aBnORqRt3DIVs3RmJY1/vuMwnJ51xDt9T4C9OtPDNMZ6RPlh24m90S9j8okyJQlM50gM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Xat95z68
Subject: [Buildroot] [PATCH v1 1/2] board/xilinx: add Linux 6.12.40 hash
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
Cc: martin.chabot@gmail.com, michal.simek@amd.com,
 Neal Frager <neal.frager@amd.com>, brandon.maier@collins.com, ju.o@free.fr,
 juju@cotds.org, thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds the hash for the Xilinx Linux 6.12.40 release tag.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/xilinx/patches/linux/linux.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
index 902169229c..b14fa3d7ee 100644
--- a/board/xilinx/patches/linux/linux.hash
+++ b/board/xilinx/patches/linux/linux.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  25795c354f30a3358506ab02deeac99e7f79850804c52d6c3d5539fd310f0491  xlnx_rebase_v6.12_LTS_2025.1.tar.gz
+sha256  ea55acf69bead3d4cf121de414cccfbe75a3c36465c93d9500cc00688d9b8d9d  xlnx_rebase_v6.12_LTS_merge_6.12.40.tar.gz
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
