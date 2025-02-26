Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81944C021B8
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 07:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D7EE4051B;
	Wed, 26 Feb 2025 07:07:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YbzqCQ8J1lGa; Wed, 26 Feb 2025 07:07:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A2124052A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A2124052A;
	Wed, 26 Feb 2025 07:07:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C76D2DE0
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 07:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D6D381E86
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 07:06:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RYlQT5Fa7t_z for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 07:06:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::613;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EB4E481E58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB4E481E58
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::613])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB4E481E58
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 07:06:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AAE01tgE5LstovYB8BNlkO/bRpztUpX8+R4CXHjiwgeZj5bnMtb2MmPUelcHfPVsA8f+XdDDtafYztfE2iTELUo2ftXVT3u6cDTvYEsJZGtTe4M4dwmch9EZyF1CkYF8H40B80pICZOnEEBSrMgb21DNi9XBgltomPWAOyCvz5B0sqD4A5Fji86quJ26QhvnqtWApmSugIXtnyX4xdVyEkRBvHi29mtWY1XvlPhty5tTjeUKvTbHiGYK1srA39LRTp/mkFomyo9GLtQbfctxAeyVgmd3ZkbNhX09+yxh/XRPUdkoOw92vRARdDlBkuyNyv+NWYDRu2A6uAeMXMpncA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVsQnlf+njKV5tKGtnDXTnpSDIOmpOAnaRsJ7ILHHBM=;
 b=ESVzCp3SEoZZsMtmAiE8lnfVqoVDrJnP+cGuI0+Rw3AteLDDgv127vZRSY6n/rJXZs7Z5KiiUuGH0RR8D8zVCFL7r96t9y1bVbG8f8oKbFufuyLtbSNvnZeXcHAGAHyDvgu+8hkJfhDMwrELon46D4tOuap9AoGpu69c+7e7cUWGcWDwBVktl/7/HIxQN6ml8MyNpP1Xrw35QJn01OV8c5rck+b7FSqEHFrs49bOgWJ+LOWzG4aOF7H2UWHnhdNEn76ZOBvKKULVTZ8S+j7VIvZe1vK84gH3RmUV6CKLq2xDFL9IIIKuA4kp1GzshIZkaIiSwbfd6XZscxwRiqD+CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR04CA0292.namprd04.prod.outlook.com (2603:10b6:303:89::27)
 by CH3PR12MB7643.namprd12.prod.outlook.com (2603:10b6:610:152::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 07:06:52 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:303:89:cafe::b0) by MW4PR04CA0292.outlook.office365.com
 (2603:10b6:303:89::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.19 via Frontend Transport; Wed,
 26 Feb 2025 07:06:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Wed, 26 Feb 2025 07:06:50 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 01:06:47 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 26 Feb 2025 01:06:46 -0600
To: <buildroot@buildroot.org>
Date: Wed, 26 Feb 2025 07:06:33 +0000
Message-ID: <20250226070637.3866930-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|CH3PR12MB7643:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a0f229d-000d-4b60-63e6-08dd563424ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XbPX/edH5JLqIAjpAKXwVv3NG2aGZCH7slRpfGHqcEY3vE4NH99yWSO4NTfz?=
 =?us-ascii?Q?xqU4R1eFdUHohL7s/ohQj+GmZjjbkwFprzCbz8DVKB/VddLnt9QeAMwOv3+2?=
 =?us-ascii?Q?TE0JxkAnLpqDtwBwPj5pCuzn4C/iXM25WVEGIUTJimXgvK2gg0rKNWcvSAjs?=
 =?us-ascii?Q?Krg/ZHfmVjjg45cNgrc9O3ZSVfGtD8XSkI3yRQLMHxleGe+hJiZ4FrQcfI/B?=
 =?us-ascii?Q?pRIvCsMrLOMsUG94tz9hobkPfoXC0iBzdhEySm2Xk+mHzCAaBPKzoj5ot1Qc?=
 =?us-ascii?Q?3w7BuwINviitPOSmu0j6FEv1j//IbzdwqXTznw+yoSm3cI53BJsfDXSixYEI?=
 =?us-ascii?Q?P4mQb+lXXLT4BkKgarubR5Aq9ddRkJPvyGXMHIlMPwHnC3UBbAt+j60zqrcf?=
 =?us-ascii?Q?Lpjhmz/AfQqcGSbbDq0I5y7DV2zeu0/pCZsYjQumTqh39PgE4fWoGqYqECz3?=
 =?us-ascii?Q?pg4DUsSJac/H8NQ8Wt4dDaIZu6iRA85N2RDgw+AiwIb3MpoivPWSRyN5K9UY?=
 =?us-ascii?Q?PNBFO4NuRZhsH4YfIPsp83mEAO8CydxrX8v/fCOy6KrdBCPLurwhhv/b3Ix7?=
 =?us-ascii?Q?fmdCHKlTJV7DRU6sepQNBZXS8rmixeO6maR5j/Tusaf+157bg8B0P4IrndrZ?=
 =?us-ascii?Q?3eE5Rz3HzQHtxoFyJHrM0JcFLogWM0Dj5Hz+nd1eW0nGshkL9OTzIWEm9yCv?=
 =?us-ascii?Q?W4Z5LOLAcTgvuv+8x9PTnLztlc0TRNBFqyk0KxNpmU1f9PS1JXE/vbVAY0Nx?=
 =?us-ascii?Q?sagGVE4scrzUK7yedwoQz1/qw/hShJ4+dyAJRIilUiaRYbkFX/Nl+rqCfOWh?=
 =?us-ascii?Q?oqtHoERgJky7ySyoLbi41bz0Kvsb0efAJLd71nQaoCeCd6w2nRta4aJCUcfC?=
 =?us-ascii?Q?6XQ+RNHzAxsuTvNPsKdsx+7PIR6L/Z7gjr6/LAjmq3Q/VPQfPC3pPEaN3WU0?=
 =?us-ascii?Q?cGjZssmXRHwA6vCw6EiWvtlu21a5IbVltPeLUcExlufQ7IBX3fUuG1hZgY6X?=
 =?us-ascii?Q?//SEcJj79+1NfdgZM5NyDVlGKoGBq0mJodSW9WB1qZ2gGZiOCMauAZP+NJCe?=
 =?us-ascii?Q?3T8zUk7amTytBCpHYiiTdMW21jOy5tq92IOkUZvG0lSsfwa+pCRyCORxbgLc?=
 =?us-ascii?Q?ZVlIwuV1WdmH1miTyaGpE6oFxw/EKpZopxlCCm+2KYZsZk4Gf7atQ3lVEq1W?=
 =?us-ascii?Q?+YQ33fhvb05reH99cnPIWArQ/gg/v0sNDtZ9d/1HDQMwtgk3dRbVeMOyVV8F?=
 =?us-ascii?Q?s+4FDC0tAesZ7YCmeIizosZ5JvxijVxusJb1S6VPu142OWOcH0DhYi/1JQin?=
 =?us-ascii?Q?+xqrUDTygMx590oqUf0ylVJL+GuEQ6pmP5yelY5lCUlLY+kAIItECIwWwqGg?=
 =?us-ascii?Q?VVpYQxgD3umGJG4dDlDJGteYVKT3Jn+uNc3pjZJ1l8bbPPmmO3DmxMUv2qec?=
 =?us-ascii?Q?Mc79diZ6e0qLX674JhjLb698Lo6GF8RWVkM4VYqGiQpTmOfrKAjO4PHKL00n?=
 =?us-ascii?Q?RwsPrDFEa6aTKck1I6hiEw+lYV9lEnmOXOLR?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 07:06:50.8456 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a0f229d-000d-4b60-63e6-08dd563424ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7643
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVsQnlf+njKV5tKGtnDXTnpSDIOmpOAnaRsJ7ILHHBM=;
 b=heEg6snjFQpHX8vuu1y1hcN+dFqTLCruaEaNM0jsz/uBg2NNgDNI42S27rGohnFEqlo1pWtlDh/ZLdGx+Qv1SR3JI7ca7Xs74aratFqDflpi1H1Hxz0Lg64dFX5eskzDdA/hAgjJY21X/LKZTno89gtIKUQaLdbNoTj9zeHwMzY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=heEg6snj
Subject: [Buildroot] [PATCH v1 1/5] board/xilinx: add hash for Linux 6.6.70
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

This patch adds the hash for Linux version 6.6.70 for Xilinx boards.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/xilinx/patches/linux/linux.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
index 09e59ceeb9..c759cf0d88 100644
--- a/board/xilinx/patches/linux/linux.hash
+++ b/board/xilinx/patches/linux/linux.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  f59c7d260794d73ee519ba2579ef41aa8ac4985ac5af9461f94fa314969acd2e  xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz
+sha256  b726226e8784d92049190f19768d393eccf3ad111c7a2e685bb29cfa1bdf1f70  xlnx_rebase_v6.6_LTS_merge_6.6.70.tar.gz
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
