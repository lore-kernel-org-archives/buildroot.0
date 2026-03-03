Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A972EC142A
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 10:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 503E961391;
	Tue,  3 Mar 2026 10:58:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vx6r8F4elR4U; Tue,  3 Mar 2026 10:58:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 795C361389
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772535520;
	bh=OqBLeKjH6P80c12sQBqylF+VpKEBJtzEauOCAorp8iE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=OuSF2EHp/DdUZTruJRZ4FL7hkB8J+Eqx4lfQcrp2kdlSAbvLN4mFr+FnS4mYH3W6J
	 qC3NA82Gg5rMRehOhmbofVvAbprK2iTTNNGnPu56J918AuTRrOZG8rGvtiQXpZTDx8
	 kUFPrHiWgmHcyn50l3kQu0iBtHNqNvdT1wvAMY8JTV9H/uYkGv2XXv8PFu73sUSrq+
	 Jj16go4G6Dsu7aOmR+LaXfeZA7KPbUjIKUsAEPvD4Hw+oVwSG0FO9d1NRR2HRIpXBN
	 ojWd4VVZQfMY8x0Ducwl4sWjxzHjGvtYqZrMRz/ygeWA2MEw6tpy8L4TsVtOBH8hgq
	 nBc+cFiPnF+9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 795C361389;
	Tue,  3 Mar 2026 10:58:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F3191231
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 10:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4AEB418C3
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 10:58:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mSMpwMOQKLGo for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 10:58:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c105::5;
 helo=ch5pr02cu005.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 089A1418DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 089A1418DC
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c105::5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 089A1418DC
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 10:58:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VroFHI//u3UUJtZxmccLa1Tle13u8pBZL4CM3CaQ6wyjpEKCYMckJnTorRMa8dezbi4Y9orjIj7OWfG4JX+A1KfYBIFyGsmfw3uEAtlP/0eoFJ3JYIlsPDDlYqa6LWH71USMqDSnE1Hj6ASXqJFIBMjeddgI64DvVyHkJWs1HhwufF/TViFXtbSgSfeHBnOYVOu4HXfcT+j5GJF7S7wVzj6Sx5wwXmHiDYqQA0PobRtrfWY9E+ek31NVFW1cB19MYAEK2RleaWQQ8vi4m4UC3BHby+zlL+04V+/psttr0xB/JQ08xWcQjy382wGtuUnhnAZS+3Y6H3yyCyvVXGxK7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jA5mMPm7JvWNqZrtkO6lSAqRugSB+AT41kWdumwcTvU=;
 b=vQDuv+wXuvKh8v+JS+XOJSGyQP5CJ6rSRYwVXan7GnQWQnk2hRBxP/WvIz/xcBsKssiKUCluMorI2w+A7Tcz9j87Fbl0D/+vZeYEWcAyGfMaDUKv0TRqIqrIsMV+q+2VdleXRtGJr88GeS1cL+8tfQ/rqHFbIYjLn0eDKXrtRzZoC+E20bm18fL0dHtiuv8nviETKJiqCOorQK/4hHDKI2bFOF8xbriSa7WcyGv3brjUw8J4SL0E2P8Hh/s77SFC2QVs4Q5cLN7M5hAWmC7K+Xv7++4Bvc6HiS/jWKX5LTpfELm6AKA3Dap+wIp2iSGF64t4l5AnuCd5bUvPMVKgFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN1PR13CA0013.namprd13.prod.outlook.com (2603:10b6:408:e2::18)
 by DS0PR12MB8501.namprd12.prod.outlook.com (2603:10b6:8:15d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 10:58:32 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:408:e2:cafe::be) by BN1PR13CA0013.outlook.office365.com
 (2603:10b6:408:e2::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.19 via Frontend Transport; Tue,
 3 Mar 2026 10:58:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 10:58:31 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 3 Mar
 2026 04:58:29 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 3 Mar
 2026 04:58:28 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 3 Mar 2026 04:58:27 -0600
To: <buildroot@buildroot.org>
Date: Tue, 3 Mar 2026 10:58:23 +0000
Message-ID: <20260303105825.1234428-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|DS0PR12MB8501:EE_
X-MS-Office365-Filtering-Correlation-Id: b88b8444-96b7-4154-62be-08de7913ce9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|7416014|376014|36860700013|7142099003|41080700001;
X-Microsoft-Antispam-Message-Info: k3E/IsoQ9w4H4aUXGIFgrMY0QD4JU/dsMQD8bCrLRT1vH9mr68I5MTIZ21oupw67IcALbyRfQmnCpc4DQWWyvz52muZ2TiuSeKJlFM0j8b4Oz9WzFsQXzHVz1OYu6P3I+VEjPKnt8mk4uRYlBMM48NUYRS5+Id1gYiBQ6J99kGlVrtVgF8l2yaSTFnKxhqs2ActwhP9gjFCJCKIH5I6Wq7bqEBlZngugt7imQauKmEltfxqmoai2rhIv2iHSUEVvFKVtERy0WTI0q2Wd9aRh1rqSAi92Gi7wPOFltg/OlHtm249dbZ5AMburqwhDHbvynQaSwO6XXwUPl91jKXY/dSYj9BelOotP9Bz6idkCkWQoerI7DVRJbcFBZCAvHMMa4ygWROqC4cw0CtyCUpNNQlmEQzJb6MP+DA++s07lX2PO7Hb4GgAmr7a70xNbrhaASD8Qf7Zatl4OdJE7ngN3fwFfgwYG9zNVlsfd2bY0/EAcDfYse/2fHcUDTi6FKWbT78DS6MuQ8oertW9LMeHo3J3j5pVNmFsGXt32dezV98iOnTBHB7zyLYCtJ4Lwczm0ohoUmzeK8aG7nOnExHNHJzNjW0omS1w4QGld7ogVzGrKMCcaZ/FXCcZXfzuVmNFFPCzshndPZC03cVuLA/O2B6TOYQRrC43hbf6e4xZFxm3Phoqq6/g8yaCmKYLgqnFNWTSz1/nLkrIoMjDMhFH6l5JDfgr1mGQZDBi1uV2nAYDHkgUWTfunrW8Auj5+neffWrizvvzR0XYbouu2Z2C6veD4p8oOnmVeHM9sGPCHODF0QyYpGp3RxDYUHLIPdQC17SiD5iGWYVNm08AZNN11+T+7/Az2N/joPfLwfT2kakM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013)(7142099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zYNV0Tf3uwx/swjmsxF83zxKgdSmhcTzzgZ4PjUnOPVhD8avQP9qJDtvuUEUDRq+aT5BPuVxvU9XszMO6gskeHFV+WbEoTXFJfwjA0stzPFmmU4lqwm5mADLHii0Gx1ehGs6XxpSYm5uvd3oe2p4Hcmadev2KNI8U0dxH1YXR4r+sxNQF3i7/RXM8SJ++rtnEngVRJS7FbG33Ur0DIp0krF7U+jM+UROdJTZEaXcuwbjWyAMop17Q0iz5xMysUsgAUwyr5NcSKz4wkdT8KE7ia2AeNtap/mm7NuhwEQDu2Zy/CliiEVm97oVwFMuferdPSxZDhBP6MhZfWOuXUOEMCoGU8tg5ZuVEvLXNAdLu1He4leN/bYzzmRggz35v+RR5srMZT+1DSiXywp3PcWbHlPQ2HmmNS4nrXLZUJpbvTh81Ki7WQ7P6V9Oi4qfsv9Z
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 10:58:31.0589 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b88b8444-96b7-4154-62be-08de7913ce9e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8501
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jA5mMPm7JvWNqZrtkO6lSAqRugSB+AT41kWdumwcTvU=;
 b=KEKHqY7SGY3whpTUfmcnUAUouLvY4BzdbNsljqPKTITLrD/8CusjrKJVqmvGH7wfveF8CX+tktlJH5hTspt9ZkI1/otIdGp+vMUYzlLXriRA7+h2TM+YN5DSxNDh53+elSssNypK0tw+qaGL35I75LU+jgRu65XnF/Pt51SfmFI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=KEKHqY7S
Subject: [Buildroot] [PATCH v1 1/2] board/xilinx/linux.hash: add license
 file hashes
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
Cc: kory.maincent@bootlin.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, yann.morin@orange.com, brandon.maier@collins.com,
 ju.o@free.fr, Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that custom Linux versions can specify license files, add license file
hashes for the Xilinx custom Linux version.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/xilinx/patches/linux/linux.hash | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
index 0b1d9331f0..d843dafb20 100644
--- a/board/xilinx/patches/linux/linux.hash
+++ b/board/xilinx/patches/linux/linux.hash
@@ -1,2 +1,7 @@
 # Locally calculated
 sha256  444f573cd4438af1f5062fd69fcc82965a56068e6a25cd43c062a68398f90b03  xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz
+
+# Locally calculated
+sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
+sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/preferred/GPL-2.0
+sha256  8e378ab93586eb55135d3bc119cce787f7324f48394777d00c34fa3d0be3303f  LICENSES/exceptions/Linux-syscall-note
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
