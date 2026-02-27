Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406CEFD5303
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 07:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CCA7813F4;
	Fri, 27 Feb 2026 07:04:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NHok_hYNPKmS; Fri, 27 Feb 2026 07:04:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4681581352
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772175882;
	bh=NJ2JuKmcH33i8YWzupE0Asmindi1Q4t3TKZvTATP/nI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Br3pk+rNNZg+hZ1C7IbrkaZVKi/hehBE7W6eFIWVIQIh51ls5hbxj+fnOMuybCoYr
	 ia2FCglDtZuykeU16ITspohg0B2SFilifT1DM5J1DUnb2gjwVRTA/dQKpDtqpNpjGF
	 phz+V+ILYJEKFXpsSPD9dlWG71x2YCYa1o0kUoOieq96l7BdV+eTUKl9fz/7+icgVY
	 U49322JdDMcF2XrFCt9+b8A6O5oTBQgNiz0l3Bkt8t/u75kaxHqONah7hhMT6iLHS4
	 an/cP/bfYEGANhGkQgpUP8k2Rv+9ltGSvhqKDiQcvwe4l5c2rj+z8TpICROZm7vbbo
	 k6Ny6JsdpATjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4681581352;
	Fri, 27 Feb 2026 07:04:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 705661F3
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 07:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61A5D40843
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 07:04:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b_zxCbZsx7bs for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 07:04:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c10d::3;
 helo=sn4pr0501cu005.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CFB25408F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFB25408F0
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10d::3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CFB25408F0
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 07:04:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQVv5nR5YvqJxbvfJPzE0Z187QjcNA+YfynurPa1MaV6hSxO6V38Ch/cWtGPLmDNm8bL7IuKhNHbFLqezZsKUWgoMG5gFr38SFQYvpGSqXnDKELq41l9UW8/uErmo1+IbLguNdl1lN4CNvrMLT9dLjw9gQkGJemuF7/KU7vT3sXC/8KCiqfL22ZYAB/jlmt78HRzEgKAsuZA7KcSFfUb/+WNgYYIp1Yt4p/IWjUwGZztX1F2zFmHFSMkHxYNYJVj8oXm0iCrQlKSE1DrDgSKK8RZSbRcr2Dk4MVNh67Pts6SerTQdJf7+CVO442pOOC4oCTX5eLSI20j7c/ImmvNMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WddCRsF+VX4uKxx5s0trlSQbiUQUyVObLMWyN6MACoc=;
 b=BkuEQ3NRlfTRjPej/eqFtY2s/faRwsWiy9FZ2Ua8xygOYi88GS/5pIwv8Jh/zvffIGcdng4b2bI7HhitzuNgjm2K2vB9rdlKsRFKB99auqIUJXTUTGpqujh0MAgxGTpdnVAclMo1fvqbJWcVh/cFMWHuRNfsmrMUW8CHd7VIttGUC2jaPK/sQLywiqPRl1n6zWU4Eqq1QRbQdjFCJ9QiUynklEt60pw1pf6gQqGqOiRHtIi+nVOgyLdgzImDSJILgX27uV6EQgcSzPuBowiuLdZt5cEcG8gCxJ+slo5OD98bxH4C1ZxtoR+U6KMcN6mFDEM3KGrfJ3FjkTjGFATvwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR05CA0186.namprd05.prod.outlook.com (2603:10b6:a03:330::11)
 by BN7PPF0FD1DEA27.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6c8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Fri, 27 Feb
 2026 07:04:34 +0000
Received: from MW1PEPF0001615B.namprd21.prod.outlook.com
 (2603:10b6:a03:330:cafe::1) by SJ0PR05CA0186.outlook.office365.com
 (2603:10b6:a03:330::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Fri,
 27 Feb 2026 07:04:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MW1PEPF0001615B.mail.protection.outlook.com (10.167.249.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.0 via Frontend Transport; Fri, 27 Feb 2026 07:04:33 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 27 Feb
 2026 01:04:32 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 26 Feb
 2026 23:04:32 -0800
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 27 Feb 2026 01:04:30 -0600
To: <buildroot@buildroot.org>
Date: Fri, 27 Feb 2026 07:04:23 +0000
Message-ID: <20260227070423.1309460-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615B:EE_|BN7PPF0FD1DEA27:EE_
X-MS-Office365-Filtering-Correlation-Id: 28a73723-8ea8-4ceb-f00a-08de75ce75ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013|7416014|41080700001; 
X-Microsoft-Antispam-Message-Info: QFhVonJdMuoWP1Txr7UCz1YXG7oNooos6+bDvmghhur9TU9om9HN6G4OSp1ewz4bdgm7jNiX/aYpTAKqHZuWxKcHMSng7WTpjkzSEOnwpvqCLGydPpyHOm0jEDA40l2/46ygxm+ivG67pK6hY+JHvuHqqLvTt/FAkoINiW9PxlBjEsKIzF5a4fmFlnIL+K+r4AGmqAzE2Tbmeq2FyhDtTiI0HwFVCkjPOCNkfBNb9huujGOfh/Hmw9yKXfl+KV0xS/WrBZnZcTytHUHZiTq0e1/h1E9nI1nEuRTXPiFWAr3J9hbfs+RX/ExqIQk+7u2q5E5FJXokgxVy+SWVtdhhFZ/E4sLpb3IliJM2Kxkqi74ycnm0gyRmJT7kx+wVikIS7eRu8uR9ekJmOKVZoaeYVMRNvoGTTfazFcnBe5yTicyZ0aSsbBitnygcJCrF+l5dn9cnvZTpvUINX3DIC21tY476iT4t0+W5+qejkDlCD/rUh4mwWTUuZKxchjlRL0xBKW8vQNP0h53daJYD6RPSELgx5wcr/ewqKGxbKGKWiIzIl0vAKTBP7GslgZo0Mk+CV884f1XGa8mgAZjk1lwk7RCY91NTgtXRaXxaVwOAHkeahxs0Jf6d+0R0cr7v3HbahWMTnA+wKLbGTsOEGaztx+lUZelfaLJ5w+O8pmo3ac9EwR9CcqnMTPqUddZlVhtVAPca/JWMyRf6wKyRjpHCGeponTvjYNN70gsAQ+MnLyG2Jika6ltfn2jX1MGN1mWtI6k67K+MQpCnEgrJcxz+Lsj75L/mJAf8bHc7Z1GF4VDVxwUz0XBpnTt2kMqHMG83nDXo1ZCdB44CZYEitKgqliDnvwpvKeIoedOm1GCP9Ww=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7416014)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CNz49CRI1g6qqCbyKxoAZDemJ1lEvNrx4HgZeVtrMvhe4cXgoobXhVN8O8g3oH8lfa2z7nCtikuKYpNUYn2rZaAYBo7jkV7HmGzn/1BIPzk9T3wCdCauWHKu0R8RmsJ2R1PHd2V4CVLLu8xTqIUm2YVwuVvm6M9mseKvMisq/fVPCIm52PMSidFi1dekxR8vR30fYNk6BwnNT88wEMgDYXqw3nuM4f7MvmfLT+WOb9xxP1W36lM7zHAUaHahE3B96bLNHX7LeS4tXrWE3G2R9i/gVYfnhtFpyr0EwEadPQ14EBNXI8uRtvv6c3UPCzvFPjvpoUy182eKlQoHzr9z3V6DlbnXMuQH47hdwIBMhrS5J9V8ZddUQAZ8ggjummtdMGKAGpftjcTK6k1ss9olJwnkI36OKDyy1iHDtEOa6A3eLejcUiatnynYW3VVMZTZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 07:04:33.1933 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a73723-8ea8-4ceb-f00a-08de75ce75ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MW1PEPF0001615B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF0FD1DEA27
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WddCRsF+VX4uKxx5s0trlSQbiUQUyVObLMWyN6MACoc=;
 b=t0dXQekLYgBuQLGcba1nlxwiCgMarBEnrpTUTpCv+vfLGuqZ3E+6f0j4RMf3xnYh63cAF3gxvwT5Yz4v/5y3AufptQRPehUv2TZXVIMe8hzcgMvqoIz11cYSh1SbAZesk3mBllUxPM1v8ouPRAgONzlgCzZ+HuePdO3LJsFZtdA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=t0dXQekL
Subject: [Buildroot] [PATCH v1 1/1] DEVELOPERS: add
 configs/versal_vpk120_defconfig
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

Add configs/versal_vpk120_defconfig to the list of files I maintain.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
I forgot to include the DEVELOPERS update when I added the new defconfig
yesterday.
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9e983ae113..88a684d9ac 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2510,6 +2510,7 @@ F:	boot/xilinx-embeddedsw/
 F:	boot/xilinx-prebuilt/
 F:	configs/versal_vck190_defconfig
 F:	configs/versal_vek280_defconfig
+F:	configs/versal_vpk120_defconfig
 F:	configs/versal_vpk180_defconfig
 F:	configs/versal2_vek385_defconfig
 F:	configs/zynq_zc702_defconfig
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
