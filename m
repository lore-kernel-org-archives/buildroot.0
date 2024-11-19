Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BC8D4415E
	for <buildroot@archiver.kernel.org>; Tue, 19 Nov 2024 13:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B62B85662;
	Tue, 19 Nov 2024 13:46:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7AD7tvKZAxyk; Tue, 19 Nov 2024 13:46:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF2AF8565E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF2AF8565E;
	Tue, 19 Nov 2024 13:46:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CD9B27EB
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 13:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E0CB8565E
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 13:46:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U0RXj5aZPaTy for <buildroot@buildroot.org>;
 Tue, 19 Nov 2024 13:46:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2409::605;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4C3578565B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C3578565B
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::605])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C3578565B
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 13:46:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A+VSvGTJJmkQO1+chrJbPlFvzQIaDarN5wotH+ImQNuUK2Pd3w/xGgSyIVkeXDuKAM2sbEs0bE5KKKNfeKTZtrx0RQ/ORzhiTaM9ZBLfF8nIWsB56vymiHXwrG+ZqWfsnm5XHwTXGJ4f/WPPuFV67BejMKo0hppO7JTca2Fu7rAunczcPw4WSwyTUBJAN2rgVeWvYHPrMhHNswaaG6KklwA5iviBhJAkbk1RFwe83ELnN3F3deqEGEHk7rj76REZLJpA9NYqey/srWv85Anz1bxYVH4WzcUAMhQvXkd/e88E0incaSL8gq53QSr9lQbPH0VXdjNJ8iPwhdGOfH6fHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zxjfv8Q0PJQy1uFzCm0Kj+F03ejCBW7W5c69f9rjDz4=;
 b=Q9WARKBE/Jc1s18v7J6YErNxt04Pa4YzHTNKxp9zVn4z9XRmAj68jjG6cdzrSypBKtJgYJIIcVjO+YR8QjYFaYcsywrjpAlMRuL91UrZyV5pxSIJqQB51QuAB+u40NNM1D1efvEiD71xzQ/I4uaVA90Y3sDxHM3RED203obKTtx7x+ki/g5JqR37lwpejAq0jc9j7Rk73xV79BXjS8P2LgP+lf1yp/m00gA5UjR761MINF0AGKvPh1Vn0dppFIY54UWz+K0cLb5wGuXNHFA+l5K6yXwscpae+DfNmmv1xpCV3ucGLnbakP12if5LrHI4FZMs+E2/F2XKOCEs2ciqpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR03CA0273.namprd03.prod.outlook.com (2603:10b6:303:b5::8)
 by PH7PR12MB5711.namprd12.prod.outlook.com (2603:10b6:510:1e2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Tue, 19 Nov
 2024 13:46:11 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:303:b5:cafe::61) by MW4PR03CA0273.outlook.office365.com
 (2603:10b6:303:b5::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24 via Frontend
 Transport; Tue, 19 Nov 2024 13:46:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.12) by
 SJ1PEPF00002322.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 19 Nov 2024 13:46:10 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Nov
 2024 07:46:06 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Nov
 2024 07:46:06 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 19 Nov 2024 07:46:05 -0600
To: <buildroot@buildroot.org>
Date: Tue, 19 Nov 2024 13:45:55 +0000
Message-ID: <20241119134559.3891625-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|PH7PR12MB5711:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cec8ebd-6802-461b-1d47-08dd08a08695
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C7Sev1tVPnCGnvqZSKUaWvk/5o8amQlvlmSZ4CuxTwV2vfjAGElSt6O/a7+a?=
 =?us-ascii?Q?5tztNT6HA8VLPJNV8txcMMpfXf25O0FSoFip0lBwHsyGhINa96BOveo+8Ci/?=
 =?us-ascii?Q?h4fZZ9sf6yif5r6qIyYeLDKBOISqpbQx/lVQbaPJ4hi1eVduigb85P9RKTjw?=
 =?us-ascii?Q?ql6K7v9N+oYHu5qhbtGs4zz9zX9Uc/uAI4Vm6TRzf+vgBPhAZxRqGCvWZmhL?=
 =?us-ascii?Q?6lvC59Bmj2gmLafHQx9YbLzRkSZK4NS4bYdDR0D8ISPRZcfN0gBW2XTNS6mg?=
 =?us-ascii?Q?JlGcKG7o1hx/Dl98a71GCb0/dFX2OYBFrtUm4oNqrEJJLaOwkiygHQ/7+v0V?=
 =?us-ascii?Q?F/0Ca3UX1oTKRxR4CzNtWyE3xkoT3NB1mUvBhcufjFeLQjZfXy6Ia3lLSLRW?=
 =?us-ascii?Q?01bIH2yAIKdaTc+IP6UEcQaRVs6EGzbQya4bm2CoNxzYuxgoHz+TEHg90NH6?=
 =?us-ascii?Q?o1knmy9UvUg+CiNG7nj1BbBM+OMPhCyE4jJUhszJi0vl+tv/oJmSvMu998Na?=
 =?us-ascii?Q?YBo3zPUEEdyxFOGOK7aAAsaXAyU1DVHHHkzjExxza4Fc1CK1yyIKF4XWg+Cb?=
 =?us-ascii?Q?PFrrqOvSLJbEsmJxbpYRL7uVVAjFx6k7gRPhmcBEEKWHy3+qocsLZXnwiciD?=
 =?us-ascii?Q?g6ieVHWRmKspYRnsIVF6LjfFqI7dPHAPOXfOPvgCy+/IfOBgAbpHvFnBLkYS?=
 =?us-ascii?Q?/D/ix/KJkdWoqESnDJMqZF2lWpqEbnzQit1tjAn4zlzYmTn5nkRadNwf1OPX?=
 =?us-ascii?Q?bGmyMdiwCmxiJgtuRFNvUCYUWUIF5dbxcaNBo1wpPa+vVjNYP1vxe5a+Dipe?=
 =?us-ascii?Q?UzNEbNMR8y4Bb7rPMYAmAwZIMbIjyD+4LVSsh+X1oY5pAhiC5HXVXoPS/oVQ?=
 =?us-ascii?Q?HsreVIhiZXRK6RuEOIgttbvrw/3xnyu4xQZdgXapjeTIv8+2eBQEG//GkfVc?=
 =?us-ascii?Q?Jic2VJ0WSkUhByys+gjpLn6JNjHBIkVEI/AUE/Enh5M4pZIuaM8sLZNJbIux?=
 =?us-ascii?Q?uz1kcPQ+tRfUvUVoq6QUlyeANFYy41epROJbSiqYLwzO+cmcWscJiUwHiekC?=
 =?us-ascii?Q?WazU7pMcMoapPGJwJJdXU85h74xTYYaISdscxJLzQCiPz72va/2TE0HC6VOY?=
 =?us-ascii?Q?ETPU9+vchLFtfNcVoMpI9rDW3rIMq6fb6zKfjU90ity9kxPq4qYPPzfiKj7V?=
 =?us-ascii?Q?9k1WXARYvJ89TSQtIm7ykwfzIj/Y/ln9/lnKtqCeyZrb2/1uMCP5sa7ykTs3?=
 =?us-ascii?Q?I3I5258ZlGUTW7omk/6VNrZ8QlUKJQY6IMjEx9IWBLGM8CktdEb4BnmS8Dan?=
 =?us-ascii?Q?Z9eofwF1AFyRPp6Iiw+xYCeQiRB3r1maG6lSY1CNjFlPXWetqvlokHbcqJrp?=
 =?us-ascii?Q?kEdktlhCGyxUMi4vQXENPnGn1ETDzONX2qYt1t0SEoVcjp/3csG++ezacpIe?=
 =?us-ascii?Q?kS6mSkslaLIc0XnZTAP7km3GqEVeSKuc?=
X-Forefront-Antispam-Report: CIP:165.204.84.12; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:atlvpn-bp.amd.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 13:46:10.0624 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cec8ebd-6802-461b-1d47-08dd08a08695
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.12];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5711
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zxjfv8Q0PJQy1uFzCm0Kj+F03ejCBW7W5c69f9rjDz4=;
 b=O2SdQyD36Ia9E6QBnrEoiFWlwx0qANfgl36yTBY9eBAYEa7UTdVOK/DXLDGN0bGLZubypXr289ShN2oG/jxo2wm/ON7i6tdj2m91vVb0Iu2fIZV913SE1oNL9LQltKSje+AEQlzQG5Qc28Y1TuqLrou8aam/19MtC8wml8AP0YI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=O2SdQyD3
Subject: [Buildroot] [PATCH v1 1/5] board/xilinx/patches: add xilinx_v2024.2
 hashes
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
Cc: martin.chabot@gmail.com, brandon.maier@collins.com, ju.o@free.fr,
 juju@cotds.org, michal.simek@amd.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add hashes for xilinx_v2024.2 release for zynq boards.

xilinx_v2024.2 release includes:
 - linux 6.6.40
 - uboot 2024.01

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/xilinx/patches/linux/linux.hash | 1 +
 board/xilinx/patches/uboot/uboot.hash | 1 +
 2 files changed, 2 insertions(+)

diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
index b007db4303..6f269e1c71 100644
--- a/board/xilinx/patches/linux/linux.hash
+++ b/board/xilinx/patches/linux/linux.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  6415cfcfd74e943d6ae44f6c1edcae09bf6cd89410b03c4290bf1464a8368f84  xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz
+sha256  8ebbbe2d40597d9a5f36d47a1dfe4caffcef3d9f5ffa059ed4504bb761282593  xlnx_rebase_v6.6_LTS_2024.2.tar.gz
diff --git a/board/xilinx/patches/uboot/uboot.hash b/board/xilinx/patches/uboot/uboot.hash
index a5ab9fae05..1fb12d1a11 100644
--- a/board/xilinx/patches/uboot/uboot.hash
+++ b/board/xilinx/patches/uboot/uboot.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  58e391a001d9d8ed347ab3258ff7c8435c866b1ff2b2c22ebc95af592444c0f5  xlnx_rebase_v2024.01_2024.1.tar.gz
+sha256  f1a86ccdbe60bac89177a24bbfd56fc6e8e67823669f0997de563c3cc0ea4dd1  xlnx_rebase_v2024.01_2024.2.tar.gz
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
