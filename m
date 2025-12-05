Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B466DD33994
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 16:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D73084A10;
	Fri,  5 Dec 2025 16:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aNwJuMg4mlSn; Fri,  5 Dec 2025 16:44:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9387A84A92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764953043;
	bh=YkmwAISZXysH4iWqQdNAPVJJb0Bp1XIhQEP+gruVBNk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=AYhT8JLOqaaOlm/vXUGgt2wjVj56VEZDUZnxhx3nqjlDdpeLifCJk1N6viYxBtLSQ
	 T9yAB7TAv+NNLdvan13uxoFV6vIlzt0dbXqYINYklccFoFU8QKuC2qkjr5y/0lxfH7
	 h6fftyYIScS1M9adhTfiweu9nfpXQJkRweHX1596e3syOoPptnKB40v8llkq9AMrOf
	 VbRu59BYK6Mqx3z52vxE9PXxGGvVNldf9pJD101OPyj5OPDLCO0wrp5ul056giTw9h
	 5uhdIJDC+DA2JM8r4iQ8urgZqCOlGhwIZOOaksxUCWW9YwWmJjfB4R3hcdC9ldgvL4
	 nfanR7QOxXcMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9387A84A92;
	Fri,  5 Dec 2025 16:44:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A3BB41A9
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 16:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 874D0607EB
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 16:44:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vnrQDa0VkxcA for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 16:44:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c10c::1;
 helo=sa9pr02cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 99523607B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99523607B8
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10c::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 99523607B8
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 16:44:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBQAasNt+bIclGR3xznDAoVBnamqmKd+OnI9CHlUGOlw1yhs0h8CeWSTqa8ZmUZkeYMvtuKNrpiryHgE7hgfpQSv/9PF3sEWBaX3LDu8oNbrIKrK+r9p2RIcCdWNTlbv1Ukdi2q1y/euy6q5/V0+R0+1owmFvEHO4rbHTQW6pNEkuOv1+ZKyJq0ynA2AA5TxBw5atSmXQ0d56+HiyDqznu7a8hmGi9zdmFMJC1ZxeRScql26rEuTRue1QHJ8ESl7rQ7J7EF2ZytnidRQPeGYxRJ1TwyvAM2d2jbEkICDBgqTYPN+ZDE4Kokql7qLnFE8G0FRl7WXHoKLF1xbKkLr0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzqbHKThhLJfo5QwvSBvQ60Wlvbh0yRS0uRhQdj2RYM=;
 b=Idkjp4VtOPIb2f+D4th/rFva/FPNuxfwklPJR0sJDydB6bbo6KY4+pO/IrP1KQ/iUxV3qWF3WFdDk2InvMNtRyLNApQsc+E2R0i2D5Yv/apRwxSgCXEulbPmowbTSKTLZ3ByjzYAdcRF8z7uR0cpy2wr6QM+WLVeb5JhAn/Y4LltlhOdlwGjhiMvWcUzxLRo+ouQClNMYkqcZEen0b6F64vb840ifJdhLpgzzIxBD0VlJrxndniLcvY1/V45U6BOYlk641vykhTJ95c9iL49kSpFRS1Xdqq1rllPVVgFpfpOfIZgt+DZ/n32XbXecUQOjk4Ge3c0PDVHIrYmDrIDBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BYAPR02CA0016.namprd02.prod.outlook.com (2603:10b6:a02:ee::29)
 by BY5PR12MB4147.namprd12.prod.outlook.com (2603:10b6:a03:205::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 16:43:56 +0000
Received: from SJ5PEPF000001D3.namprd05.prod.outlook.com
 (2603:10b6:a02:ee:cafe::d1) by BYAPR02CA0016.outlook.office365.com
 (2603:10b6:a02:ee::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.11 via Frontend Transport; Fri,
 5 Dec 2025 16:43:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D3.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 16:43:55 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 10:43:54 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 08:43:54 -0800
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 5 Dec 2025 08:43:53 -0800
To: <buildroot@buildroot.org>
Date: Fri, 5 Dec 2025 16:43:45 +0000
Message-ID: <20251205164346.2031642-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D3:EE_|BY5PR12MB4147:EE_
X-MS-Office365-Filtering-Correlation-Id: 22a4672a-9629-4ee0-07ef-08de341d7b0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|82310400026|36860700013|376014|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HX9LwKq+KrL90wCwdKsMMwVsMjiJGDOL6YdvPiBv6UZzaGC+UbbNfRCb7N90?=
 =?us-ascii?Q?9Sx5JRWY1Lwku0+A0U+XwzuWFFBFVDbetfTB+ylJjL9gKRRaIGQhEWmIvovz?=
 =?us-ascii?Q?io+ujrMMSH9y/LUT7D1G5OKlBgvznPjKDBoJzhQqlY8JoORvAH6XhlFdzUVO?=
 =?us-ascii?Q?ys6CsExkpyxBV5BN0pxj6Uk1cZH5i2bk1DDbnGvK3evM7IxxPiEsZcqfisvs?=
 =?us-ascii?Q?CELS3NGMDUfOVUSKPuf2/fafE5ejFZrvwa2ZI2ry5lwg5+W+bQ3SA7I65oBj?=
 =?us-ascii?Q?y/NbZoUT+umvvxQPvMUcxDcqW0CSY5kUHNq+s0VaW4YrpkRN4YROpLBocGZp?=
 =?us-ascii?Q?ld2qUUKZzIzFyy8i8jtHdq87SEGQ3g0GsPP/BglxgvC9D5tCUJYTfim6XKBh?=
 =?us-ascii?Q?GlucmcbFiOSjiUPw6TeZinCOa0rYDtkvBvHJlOlHEK+AkGBnvkckBNF72Fas?=
 =?us-ascii?Q?oUvOfpJ2147am1qQwmYJwqpfuHVMM9HevckNCMMki9qfsZuult5XIRjqw5O+?=
 =?us-ascii?Q?tQ2lqd6mOJCcFh3NnEroyeDz3h6ayvrxqSrHrO6QZ7w8XN2Y7wIUTB7ueP+s?=
 =?us-ascii?Q?nk1Di+aDJhuhsgF8WxiXMnBqk6Pv4/Rp2pvZe5jd7bd75+9FAtTLhMJNZrFI?=
 =?us-ascii?Q?iuIC5XYWr0r1fLW4fPPDveX7r2csuz5r8EQOxYWdxh7b5iMhSQQ5fbhaw+j9?=
 =?us-ascii?Q?x6BIZmVr3ifvFKP/3bGKqr/moE/IygH2/0tyWtxnkWo0UXXE1UqNijwjWUlU?=
 =?us-ascii?Q?pALQzL8EopJGmc/lQfEyzA32L9cUQXkB/F2ltsQ6xqx67wkiCgxTTaxaapbQ?=
 =?us-ascii?Q?C9STkgzDCkTcBdhCrWDc+TeKFP5fEqRkd6Z7dJTPjrFSYciEZmwyNIFnhqYD?=
 =?us-ascii?Q?rwOBB0LOvaDIR/PiHUdi6if071E5kICNjDj8ag1hIRiNXxtGpppwed/1vCnz?=
 =?us-ascii?Q?obvx0eSFztSnZhV9e195Tegs4SLb5i/TgukTTCqVEyExIRCzRlHH26K1Em25?=
 =?us-ascii?Q?ceMM7QQWsyK7Hu2hHCRdyXWqfNCPLADSm1H/wybTwK8VWZ+XjAReQfwHYBWq?=
 =?us-ascii?Q?8x6skuOVxZ9gSmYhy9zhB4uXvW2FvtZciBjrZRv4CMEuzt/ERrfZlH4Tdi4Q?=
 =?us-ascii?Q?+HHPW2NJvfwg7aP+tcAuFy5VG5V/5w3ZhFONNgYUYXCfWnBvJ9Qlxf0AuD8Q?=
 =?us-ascii?Q?+77LlKvW0Ku3LGjsyFgfoRv5h77vJW+h9/nTbNYNsaydwI5hq1n7dHQMSI6A?=
 =?us-ascii?Q?i5+jbR3eZ4tsZI1efOcqSVb94AlbAVG1nfE1s1WW0nNz4cpEGOPzDY0tYWfN?=
 =?us-ascii?Q?J5SAfPQMTD+v5lUsa1pH9Rxv2n8vq/ImluzNjCqmNjglTo2/SnAMQyZ+uiYK?=
 =?us-ascii?Q?UYd50Uv63qwPT5oJKlZCQG9Cu5iJmZLH9lATpwlp94GXxVdbN6pKm8IcgSi0?=
 =?us-ascii?Q?h/h+SqiNNh0N04nvdV/vDBRToPfiHoecZi9dbb6dyt5wjI89QNeudzMl1YNi?=
 =?us-ascii?Q?BGETrdd9tTu3d26IUK7m84vpx4aIHYFKvnI5mOno/TmbX8C9uOGW+SZiqbq+?=
 =?us-ascii?Q?9xRMkhEj+vJJ5qpDrq0XDNEWf+pdgW/oGIxOHIOF?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(82310400026)(36860700013)(376014)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 16:43:55.4868 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a4672a-9629-4ee0-07ef-08de341d7b0b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4147
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzqbHKThhLJfo5QwvSBvQ60Wlvbh0yRS0uRhQdj2RYM=;
 b=LxAZN9Zw35N52u/hiiSst+42mXlPU96burqZ+gKzXDEpGrol66ee1dGltHXyehTW370Ct/6SCls4REQScy5n470mZCg6wdNByY+53MXL0rDK2mvFt2bo/VgOhevSb2GPDqq7fJ64syJsja5J6cfEAR+WNgelK3UBdR4qJ2ZibzE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=LxAZN9Zw
Subject: [Buildroot] [PATCH v2 1/2] board/xilinx: add optee_os hash for
 xlnx_rebase_v4.5.0_2025.2
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

Add hash for optee_os xlnx_rebase_v4.5.0_2025.2 release tag for Xilinx
devices.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- new to patch series
---
 board/xilinx/patches/optee-os/optee-os.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 board/xilinx/patches/optee-os/optee-os.hash

diff --git a/board/xilinx/patches/optee-os/optee-os.hash b/board/xilinx/patches/optee-os/optee-os.hash
new file mode 100644
index 0000000000..69bca84314
--- /dev/null
+++ b/board/xilinx/patches/optee-os/optee-os.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  3b8969a25815a0be84f34033827e5eb557e10f0f13ebabaee339461f8520ec72  xlnx_rebase_v4.5.0_2025.2.tar.gz
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
