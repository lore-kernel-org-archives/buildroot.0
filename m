Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24443EF8FF5
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 15:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E84DE81218;
	Wed,  4 Mar 2026 15:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aD0jFXYMc34w; Wed,  4 Mar 2026 15:21:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B35281219
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772637691;
	bh=Ys491zfgd37yA2E4LgrCwdPiDpdPaall51Vydt+lcfM=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=VuBbUNloZtc9swWyl1tWK3fu0iQQBTUFuqmoDRueMzcLyzHks52EGXocJrEV3YBnw
	 AjdwIVrhKxO2x7kkdTrRHoeA1Oe8VuNSetFkb3VIenQTTgj0muu+mpi1j++Cp/ddMo
	 MduZneWMqnhEccE/Oox2hEej2bl+IABVJZn5d8/LXVq1gDj9nwJkKptlqONFeI+2nM
	 k0UQ1uw8h1u4goDI+8aI0Tn13uZy1589b2H+lvOksngp4Gn+y4oyEFG1PDvwGz9VWO
	 cibtFlNPyfzPHwMbxz//SHuQGaOyhFmqIU4O0Wlfx3j7eaj7melIjhsD8raP4rXLxH
	 kzT+Mqgm6Ns7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B35281219;
	Wed,  4 Mar 2026 15:21:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 295E61EB
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 15:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26AC540834
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 15:21:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rPazlryok2OX for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 15:21:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c105::1;
 helo=ch1pr05cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3578D407FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3578D407FE
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c105::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3578D407FE
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 15:21:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HOLQj8m4EuCtKFlNLF4Q4mWE7wBe53gMz+fPH/KOWNbvbdJfeFptV5kLMNvslTOypal7zcJ90C1EnydUK7NpjGQYwX6ricVbQW5GX7Mltq7R5laPEerHvKvlbeEj57h2hG3834GFiXf21gN5WfAx31Q1NjgAyc5D7rrsYfBJTqqjvz6o1Fn88rfJtpisloPY4jiRVTI6liCo2x0wl3ByiXcsJK9Zt9PwftbbeaQnOUKkNKo39nSdAeUgY+/S19S4NoSBBZ7w95Yw7Fp+j5kW83SV6BTloP4UszffHe7zWySgP4Ng+JshLPpvcqL84SCcCFVeFHPV5Qid6Ulab6diYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VPA8CKO4pfQ9qfLD5wE2l8Q0a3NRfbkmnYnH+H9wUhw=;
 b=lOJgtBF99fV33LWYk4NW8mlwsLjXrKNIzj5JPCc9V91GfhiZmHWuN1CXw3BdRoW1Jg3I0xxb5fjn8k62miy/OR5QPjPkBId1Zl27ZUYmVN7iDllQkbuzQIiF1OcvjZHvQHWBugej5klrfTm+pU/g1ieGJAtp5coBnc/mdPpehi7foDRCT53pZpqRVuEPRkhqAFzEXMjDwJg2q3dAgCY2A/4/P+quYNaQThoR1Ee6H96LhTZ9KX0jK3rE+QX6gxdiZo3445bjX1NJQE8aXX1aGS/W7DfAFFeVZc8Jbs+f9ZYGwqI8tOHpXH6Pm26i++IcGH0U8gF7trw6zrxMITQ4rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BLAPR03CA0062.namprd03.prod.outlook.com (2603:10b6:208:329::7)
 by BN7PPF8FCE094C0.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6d8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 15:21:17 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:208:329:cafe::2) by BLAPR03CA0062.outlook.office365.com
 (2603:10b6:208:329::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Wed,
 4 Mar 2026 15:21:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 4 Mar 2026 15:21:16 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 4 Mar
 2026 09:21:05 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 4 Mar
 2026 09:21:04 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 4 Mar 2026 09:21:03 -0600
To: <buildroot@buildroot.org>
Date: Wed, 4 Mar 2026 15:20:57 +0000
Message-ID: <20260304152057.3465672-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260304152057.3465672-1-neal.frager@amd.com>
References: <20260304152057.3465672-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|BN7PPF8FCE094C0:EE_
X-MS-Office365-Filtering-Correlation-Id: 13080cda-4870-4b18-aefc-08de7a01ade5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|36860700016|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: KjRfO8HeCaymHVIFCPmMBXvjrMhAmz0ilGfIYcGRwY3M3PeMUWQJCB9zb9tOyiDT0Se0HHnRtoTYGIX3QiadEWN6Gfll1cc0BF5pGV5KhxYoyL0PUVwkI6v+w85r6C1oM8+OOzRFInj0ESehvFE72BhePyxes3nx1E6PwE6KMDCl7itLeDbwdUB/nvw0AoyoL9IY52hmnWnDUQJIarokiw+5pw5xyNXl6Hivl/zB2YtS1ExMZgQ+NSoViM/RIExQw/NBDhxYRMPuURNG51u/oC66MgA/RpnIX9csGKyq2Mf/6nPY5bwSSDUTLC/zqA/HctfoRugLguxrkImOBpQedhwsDSiyguxY/7HWIptNlgDvjkuJO4e/rDhuB4KMuhy/y4XBrfnGKeDN5dvnv4A0Tlv28jY3n0xrTg5OwL7AQikYAEZa0fdswKPMRphdCaRHlyCjJKC8aN0Gl2bc6/zv8qxLdD+nXoyqjU2fFmfvsqwMtyyvaWU0TuOyxBOeDIwAPS3+xl3FiJ2Yr3sqTYKU8x5m5grwY6B1KAxLLaecQP9kQXGPeqoJpWm7aYfd8MnnQ7NcvlWo6q09URyWiTDd2hIyM48yucb70S0E7p7D292ravLo5h/AI/El1e/RBtT2m78KcwaZm9LibqRfwYEVu15+eeTD3HCLLXF9GUpp16UVmNiucbgaufwkPeQkIgrLCii6WQLq2wRXJ7ZJmPkGfECT+3u62EXPd8wegR4/EfF3MS2BUHqoKIh+wUYxWAhp9ykjokWgBfMNlWFfkx8SzH0fZHaPx02ERCPVuTD2Ehe5n5NzFc3zy54lEpdHLOIYDMCvTLpAdVc509MhWOewkQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(36860700016)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NkyzH1y9505/btP80hKfcQCdWYK10aUMzQ25Zw/1KXfpg1064l8+7j6+vL12zd4pOmThepU6y6CvqwKpdYZNlAJ0n6EuwlwL5e3bwWfsuuBO5YFbcQzG2bcSz9KF+pvypU8PxdGCyNCOOsOKzP/3yzfPiKNb3+no0TMBCW3VloYMpVGCxVjhc5NRGoTjisFmGMlTbyjfaPfg9zty3KwACJalzy9qhEd/NhZ2W9j8yOT1wBqQpLtrAXv3yJK6qEFA07pwKSKK37Q+q7lnO6rraH/lJdspqhZTxRzejgSxseyNRHL7H9Ehji+9dNNj3Fajc9/MmIXF076gfr0f66WUBnraboGDxz6gzASQLWpwodLOccs/Y0DL6cS10rsKb83V+fI2a3/4Tf4UH7YzLaudXpj/0tOSrPaLgTsi5kBoIP4dgFJJqqbe/kPU1jEwBrKY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 15:21:16.3815 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13080cda-4870-4b18-aefc-08de7a01ade5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF8FCE094C0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VPA8CKO4pfQ9qfLD5wE2l8Q0a3NRfbkmnYnH+H9wUhw=;
 b=ay/k2HebG6znCVLfWqJSGBlTsnddobzBZAZVrjp5uyU5OZS4Bnqggd5hlR+bVTeJhLfdAVxHyHQT+zIqX3JHfm3kzI8psR3pjEVQDyro2gXgp+9HOQuu2lUB3f2mZupOwNZxJrMgebzKQyvoaP1Dtgwin8VGAr0iULjN6XPfBDQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ay/k2Heb
Subject: [Buildroot] [PATCH v3 3/3] board/versal/post-image.sh: use
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
 yann.morin@orange.com, brandon.maier@collins.com, fiona.klute@gmx.de,
 ju.o@free.fr, Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
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
V2->V3:
- ignore anything after the first space char of LINUX_DTBS
---
 board/versal/post-image.sh | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/board/versal/post-image.sh b/board/versal/post-image.sh
index 3242e4384a..4428e02fa1 100755
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
+ln -fs "$(basename ${LINUX_DTBS%% *})" "${BINARIES_DIR}/system.dtb"
 
 BOARD_DIR="$(dirname "$0")"
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
