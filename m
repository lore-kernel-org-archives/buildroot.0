Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D8ACFC29B
	for <buildroot@archiver.kernel.org>; Fri, 21 Nov 2025 18:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C46154104A;
	Fri, 21 Nov 2025 18:06:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2y4psP69Ij7z; Fri, 21 Nov 2025 18:06:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE29E40EE2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE29E40EE2;
	Fri, 21 Nov 2025 18:06:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AEFA158
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 18:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D2E840EE2
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 18:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6qGY9fLKghBw for <buildroot@buildroot.org>;
 Fri, 21 Nov 2025 18:06:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c105::1;
 helo=ch1pr05cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 13DCF40EDB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13DCF40EDB
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c105::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13DCF40EDB
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 18:06:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TEX2vjwayJg0K3eeRN9v8uYFUugewVU6kncLLC+8J7+GTVvjKgyJV9fbYpC/m3LQAaqVMfsnVLKIx5PeVuDIbOJs3levuszcIGTimSvmro0gOmpn+uA96JS4SoMNo5fmLqee5yhoIrUxvO0FquO+GoQCTrTke9W8cXXw1RCjmL1TyhFI/hHFS+qKM9p4z+E+oUhNtizF3b9fCqAjdQOz2d5d15QOE7L0KzekUmiL4SgWwmplU08PLp48tXKKaodwAdBHGP14MI9xfoa2hIOCclHMtuhR7uyPwl1eTnXGFq4jsxxRQ3/+buzrBdh3LhRHazM1hJEtOkF16IaKyWQ3Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fP2pSsIK8EH5gkCx58msBCM3NiCja/vjmJP/vaOrhYo=;
 b=BIIClXyf/cG+cqSGahB9h3W9ER6uERUv7zY7PB77tAWxnYW9jOJd2DbJeBmY0HBUDmCY5CGrBMM+ioVAHIdajozrFUXnzQNrmTihJ1Wrcqidg6fxB9UE5W0V0CAcH26ha/BGIMpKOKNjh4HKUX82gfH9GmNklNPchsXQl4+tny7t6A8R+8e2zu6/nnt/rUbsUyEnqucuGhC4Da8Qkgmr2Rq7QJ3U0gQHmr3aMNdq2c78LhSf48VaFbOoGUFLHj8bQdLSiAUVuHwC0mv4jm/GvvXqQWn1FuU/oeOIyCwW0qRg5bJ5XofkEcpT+wbqDpH614l7SK/qFOCpTuUicGG/Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=buildroot.org
 smtp.mailfrom=amd.com; 
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none (0)
Received: from BYAPR06CA0006.namprd06.prod.outlook.com (2603:10b6:a03:d4::19)
 by PH7PR12MB9150.namprd12.prod.outlook.com (2603:10b6:510:2eb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 18:06:20 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:d4:cafe::7b) by BYAPR06CA0006.outlook.office365.com
 (2603:10b6:a03:d4::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.12 via Frontend Transport; Fri,
 21 Nov 2025 18:06:20 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 18:06:19 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 21 Nov
 2025 10:06:18 -0800
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 21 Nov
 2025 12:06:18 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 21 Nov 2025 10:06:16 -0800
To: <buildroot@buildroot.org>
Date: Fri, 21 Nov 2025 18:06:10 +0000
Message-ID: <20251121180610.2084189-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|PH7PR12MB9150:EE_
X-MS-Office365-Filtering-Correlation-Id: 5feb9106-7156-4ad0-9de6-08de2928ac52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|36860700013|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zWfcR7tst5DcPIBuySyCo0ihSZorKbXT71oRoztrnFU9R+GfKbit1YIgXu9y?=
 =?us-ascii?Q?38Hkg+PkXfNFQELiQKHd6Z6vUsjjVRgW4DBsuFJ2f97EyMXmVC/sxPJOU2HW?=
 =?us-ascii?Q?XzFs5PfpXELic8wUvnXoocuNeTbyxnRAVZHphnf+plwsoJ+gNrnL6SE/BLcW?=
 =?us-ascii?Q?VMN2ntxKzLTcwxA2UfJwdLw1l+7dvgiGQismyQVo2kx5Sf6tmfztLXYxQqk0?=
 =?us-ascii?Q?7gjX9fEOea+E84V0FszLr9UFDRVbmr0uX3aupKa+Lg7l40mpGw64TtKjohbh?=
 =?us-ascii?Q?/0atms4JQs+6kd4+c+2RKT7gHwItkf8HLBb2Rw4cqTWSESgJWPP7tEfsgvNw?=
 =?us-ascii?Q?jwBDBUWMGuh02Q2Lvu4x+3amwaK6yuvWtlTtSK4y9q43CysEWe6+2f5XVWxs?=
 =?us-ascii?Q?BoZ/2+IxwU9N1BHWc5n4nFwkyKZJNbi+X+X+EdPo+as2XqtAeRXOEiM1YIn7?=
 =?us-ascii?Q?f0ZAbVD5J65JErb5wQc5LOKgN+Md4rd0FyZIeCiV8omuzbI3yv7ElNkA9zpC?=
 =?us-ascii?Q?hzCPe7iueFrjnQXL340nuWpaKPiISblB4yor+iE570mblLVidazOCFUZtp8o?=
 =?us-ascii?Q?v/zuaBkdFfTo2U73sPwpJ6G9DwF5XSLE/c7CL0rhkOOJbwRyaOQ3uQF2wWwi?=
 =?us-ascii?Q?hXjOOMcgf9yLBCEA6TYhcl76ODEBdDKCE2dHlbUpwOghpZFlTnYB5n6wL8PU?=
 =?us-ascii?Q?/tdMz9vVAl6+bR1kSuyAgL9B4Ln9w6VnftBqEfzV6qOY6EsGQfMGYrSt4SBC?=
 =?us-ascii?Q?EYAfugziRfNKjbv5KxSFF/S5bC3VM9doVkQC5HBWS1DD8NjWSXTZVnLU9HiU?=
 =?us-ascii?Q?wSHPlsgvwyBgjftj21+aRTdBsIQp+P35JhKuSi/pHJmHe3adbv52/KAsQX68?=
 =?us-ascii?Q?P2dpWaWUSrHHSKKhrCbm3T7eGJJsn/1lWGsuzJ/p8rlnfAqifRqpPYyp/YKK?=
 =?us-ascii?Q?8K3qWX+I+n4OBKBGh8clHVP3bRI2EX8t4RC++ddZK2ZXeLXX0FzNGwdB2VIT?=
 =?us-ascii?Q?DtLeimkGOFKHZ2ZkemMKII5WVxYJyz++uPsmkUyNsJgN1KERELs+IvE3mf/r?=
 =?us-ascii?Q?2CUNpTiBjKPREAqMs/4bBcjhBnV4/dViMqzaMy7T5XFAul1yj9WGZdqbeFgv?=
 =?us-ascii?Q?8DbYmVNeEi0It3GQ1XK1brOOi3ccP2Uv9gDcgXxHkK0zcORpdcmZkrXKa/Y3?=
 =?us-ascii?Q?e3gjK5WsOmrg5SKRk3ucLMDQklmdG30vieMp8MUfEg+HeCYDqm3cFipDHFV8?=
 =?us-ascii?Q?c+fgXH8bSBXr8iAnEbG21E9F/TT6XFfNGyZ3fz2ibjWIQwSPLmgmlIKgDyl3?=
 =?us-ascii?Q?n8MEy62h8XQHMoOELr9qz3r6+BDtpEDKcQO9+XU+AFj4BSMAHzHVT0nd64q+?=
 =?us-ascii?Q?+02RtJPS84yJKvCq3ZO28uGgzW/lV8LiEy7q+/6C9T0Rul5HwaMU4CSUUZuy?=
 =?us-ascii?Q?afrRP7lzWK8sUJ/lKqd8lQMeEtwVeFEJxlQXXV4q8wfpKyk6YM0uYjK1exRr?=
 =?us-ascii?Q?VPzZWSy+yakpnRDzW1MgpcaQQHzX8X+MeibfzaTNoAcFJB3Ov19q1AcBKYQ6?=
 =?us-ascii?Q?eefVZrSrylhG7pMb8S8Eex3LWiRuc59QC2FkYQU3?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 18:06:19.7717 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5feb9106-7156-4ad0-9de6-08de2928ac52
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9150
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fP2pSsIK8EH5gkCx58msBCM3NiCja/vjmJP/vaOrhYo=;
 b=PmCqhNSR0SLEIMHgUPYN7TU6C1ExjaF2r86qg7ARN8VUNtWScb2s0Ydd5gIyabOJCmejgaQeIBoQtiZ14bqxiskyoSMjxfU23ZX9DussrdRcR3gBfzlLq3xTf+vLC+qGO3mBgM1easo8MLSysbKqjGpDStE04/uqq23TFyuuFAM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=PmCqhNSR
Subject: [Buildroot] [PATCH v1 1/1] package/xilinx-fpgautil: bump to
 xlnx-rel-v2025.2
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

Bump xilinx-fpgautil to xlnx-rel-v2025.2 version.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 package/xilinx-fpgautil/xilinx-fpgautil.hash | 2 +-
 package/xilinx-fpgautil/xilinx-fpgautil.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xilinx-fpgautil/xilinx-fpgautil.hash b/package/xilinx-fpgautil/xilinx-fpgautil.hash
index d214fd4269..b66ef8186b 100644
--- a/package/xilinx-fpgautil/xilinx-fpgautil.hash
+++ b/package/xilinx-fpgautil/xilinx-fpgautil.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a0185fda33a538379eb5ae48253f721037485be85c51555e2ad49e322d389429  xilinx-fpgautil-xlnx-rel-v2025.1.tar.gz
+sha256  043d87f12550283008ee0850f18ca807a48cc4ee085182ae84f8bed65fa73425  xilinx-fpgautil-xlnx-rel-v2025.2.tar.gz
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  COPYING.MIT
diff --git a/package/xilinx-fpgautil/xilinx-fpgautil.mk b/package/xilinx-fpgautil/xilinx-fpgautil.mk
index d41af96ee5..f53ed80e2f 100644
--- a/package/xilinx-fpgautil/xilinx-fpgautil.mk
+++ b/package/xilinx-fpgautil/xilinx-fpgautil.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XILINX_FPGAUTIL_VERSION = xlnx-rel-v2025.1
+XILINX_FPGAUTIL_VERSION = xlnx-rel-v2025.2
 XILINX_FPGAUTIL_SITE = $(call github,Xilinx,meta-xilinx,$(XILINX_FPGAUTIL_VERSION))
 XILINX_FPGAUTIL_LICENSE = MIT
 XILINX_FPGAUTIL_LICENSE_FILES = COPYING.MIT
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
