Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739AED10DA3
	for <buildroot@archiver.kernel.org>; Mon,  2 Dec 2024 06:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3F6B61579;
	Mon,  2 Dec 2024 06:48:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HMdQMgD_WtJ7; Mon,  2 Dec 2024 06:48:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C69606157D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C69606157D;
	Mon,  2 Dec 2024 06:48:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ABBE31DAA
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 06:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B4B641861
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 06:48:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c01an64_FL1N for <buildroot@buildroot.org>;
 Mon,  2 Dec 2024 06:48:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::608;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5D27B41816
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D27B41816
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::608])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D27B41816
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 06:48:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e0cTOhDcB+jkq1TTxHbRw6gm0xkmim0lAlrxLJzQgHob48WMIVb8o4EboSe4DMC14u6gU/isQ8tl5SoTJcf3H/AdKGmoLllETvL26tcklhEpK258iN4HK+n+Jhaiz2LBxr1Kq95dewRNGFVabekitplqUuUQyChPwcHtUDhSM608erNaZYGl0JZkfMIrDxsPKpMbkZn5bd0aW4oNInJwy+QXXgaFGWqtOW8k2eBz96YnUc5OWXippUeUkXJPCSZXoNQIFbPqUxP6X80S1HiSK6+7GXimDL+oBLQf0pyXmq7rucrVugXsuJZDHCQu/UO1E3kfJmt22v00fcUZNz4ciw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kOA3aSGxAseSlMdYG/D3Rt54ZiDfD37Vd1TqKCQYAs=;
 b=krDsLK4GOrh8X0Csccm4XDyi14uZZQ8uqgA1n1hcjvy4Zxbz7EDyD02xUKsLayoZ0P985Hf7uK2UxzRTIe//qigZhQATfgoZ1ML9ZgnC3uhAUXP1oRsa2kJHbksr524gtiqluYlsLd27XbWMYugZG5ZIJkVCjQ84CaDV4zj433dYtwLI64JFxcUYWMuxaEu6bxwqHv2zliSCIJdUntJ9DtJ7BYuCAWm/U/a1hugiQnPFdg2P88faFZPCXDP7gW0+6b0G9JvzwfGAQVxDrd3KY/XQtF72/e+oxD6ahg1WWRkZeZ/Jong6PhqZOZjjXy/oO36WB/M7oUmbo5D9jK78qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW2PR2101CA0022.namprd21.prod.outlook.com (2603:10b6:302:1::35)
 by CYYPR12MB8923.namprd12.prod.outlook.com (2603:10b6:930:bc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 06:48:48 +0000
Received: from CO1PEPF000042AA.namprd03.prod.outlook.com
 (2603:10b6:302:1:cafe::be) by MW2PR2101CA0022.outlook.office365.com
 (2603:10b6:302:1::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.7 via Frontend Transport; Mon, 2
 Dec 2024 06:48:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042AA.mail.protection.outlook.com (10.167.243.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Mon, 2 Dec 2024 06:48:46 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Dec
 2024 00:48:45 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 2 Dec 2024 00:48:44 -0600
To: <buildroot@buildroot.org>
Date: Mon, 2 Dec 2024 06:48:42 +0000
Message-ID: <20241202064842.3705597-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AA:EE_|CYYPR12MB8923:EE_
X-MS-Office365-Filtering-Correlation-Id: 9598e57f-6c5e-479d-42d9-08dd129d5f03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qNqvKPcqapu+OySovpSCm2FbbowGDi0wmvZRPAoVLNJHNfrwc/9KRdtXPXdo?=
 =?us-ascii?Q?9VCCVRyoxg10xz7ie7YuB5hSmgg1JibgHN6rTG6j6Xlm74DoWhvhiniPrFnR?=
 =?us-ascii?Q?WKdOOwmB9p7o1dY81wm50w/3cY+OUfJuqfYkud8WwRxXOPUYIdwvOhM0HB1J?=
 =?us-ascii?Q?ZQpF3MlqjQnzyh1M0A0P1ARze7jDw22zzganFygTfl76xeFy481kq3w3YK6G?=
 =?us-ascii?Q?Z+h0RdaST1nrq2KXQFKy9z9Ld1DsEXfvzT8dRf4YUD49RiRlldaweSPPlaPZ?=
 =?us-ascii?Q?Zj+BqBKCvljTsvwHK56071/8v/xOa+JiJBmN1fKP8HFOwJwVS2YxVOvYQAgA?=
 =?us-ascii?Q?F7Wg1IpJKciqqoFbkzSZ5ZLYUEVdxClSP2PtXUdn26lQ1RpQ79dvADpPqjUn?=
 =?us-ascii?Q?fRePdL3bPb9rQSfrh2g7TFy3Bci6rkdi6NNWIQmiUOndbrO/hTlppgGhgElL?=
 =?us-ascii?Q?Bahl4YPycKr5H9QbBo/I47lK/yHqwygDZRZwx1CADbDsR8BhS9tx/XJtHtmA?=
 =?us-ascii?Q?rJX4WB7bG7o3vklHkXYSXspXO5Sqfv4gJUHH+3FfH35X72AcQKn0CnAPy0lr?=
 =?us-ascii?Q?YTFWj1Sg2Fhm+GJ73cMr8nCAUN+R+Boe7lZK8p4v/JBK/AA+6Nt5pXMaIygi?=
 =?us-ascii?Q?lHObp1tkL9keAybdWTRueiGVQdg7UJtogasVXn/G8fdz0MqoYM/HQjt4LAw1?=
 =?us-ascii?Q?I4T2UtfPTWvjI6mzSbYjZAr8UC3ohtmSAyHVYMMTA4j/kyTRi2X6jlMj+6AO?=
 =?us-ascii?Q?jODeChiIgTJ9HDbhNwuJKRYQi2MatiMRQSt+ECGkIGAgxlMW6CEOAUMxFieD?=
 =?us-ascii?Q?iypXKGPP9rfLH0khTxmlwSmZQ9Gpi7ShsWc88s+zaybqO5/3fEoRIEzXCxu7?=
 =?us-ascii?Q?l30oVg98F9wdHClFgBu1GHEISmVcIC4/TvpxceLoZ/FAecrxe5mlh2Qahktj?=
 =?us-ascii?Q?NIJWlWs2MnRfkZWnCMebTrw320+z9a2DS5YZ/e0YpWxjzig1m/5XXanek1ro?=
 =?us-ascii?Q?GuqPk7kzl9cUWIwnt/fmsUt6OqEOgn8W9OzP36wWOyhlBj0VhW8O7idQUGpR?=
 =?us-ascii?Q?wQW/6FgOPLuH0fto8zNHAks+TebhSHkTuucngLOq0KfzbuqUcIrS7oiImGXg?=
 =?us-ascii?Q?+n5oDYVJnrRhK2elOGffjGVDZb6iC60q1fqfd8aNr77j1gVu9UOOh5p/UHvA?=
 =?us-ascii?Q?g7tS4C9RUaSgX8SDxjtjn3wFWwCaoJ7pgMsyW0dZKfa81V2blMHAT+n8KOc0?=
 =?us-ascii?Q?HBygQW2QpZnp+RJJbwXV8Zuz7vNU4RVljjp9w/W80BvOA9mYb4eATRAUUzIr?=
 =?us-ascii?Q?hB4rr19X1t2/gboymXaxw2dX/6CBgW3FG+sIBHm5JtoY6QPDiIH8EsvcNN4H?=
 =?us-ascii?Q?4gFv8zVByDWNuGFTNlcRnp3V1dfufp0FxfsMfeEkBsKKXqvRYcjj1Txco0VR?=
 =?us-ascii?Q?RR8iegoGvjqnhmAtbeQGPnDUURWsxpvnfSgZn+64if5GvtpHjrILuA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 06:48:46.8130 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9598e57f-6c5e-479d-42d9-08dd129d5f03
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8923
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4kOA3aSGxAseSlMdYG/D3Rt54ZiDfD37Vd1TqKCQYAs=;
 b=Qno/vC4X5+9awr0YqfUJJEc3ZEiG4hf68Zvez1kVOxZUmF49Y9umqcl1PjbInBhSB5lR/AGOrW8iiFLeEtjqIVfmF14y7wA6ss7bE64cxWePjkf3wIG6SjhnOsW4cdMRFyc6vTaWqFiCDa7AtXJ2idUcevw3BYivJgabSfWJ1oE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Qno/vC4X
Subject: [Buildroot] [PATCH v1 1/1] board/zynqmp/kria/readme.txt: add usb
 start
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
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 romain.naour@smile.fr, michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When halting the boot process in u-boot, the 'usb start' command does not
automatically run.  Since the SD card is connected over a USB to SD card
bridge on the kd240 and kr260 boards, the readme.txt instructions should
document that the 'usb start' command needs to be manually enterred when
following the reflashing instructions.  Otherwise, the command to read the
boot.bin and u-boot.itb files from the SD card will fail.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynqmp/kria/readme.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/zynqmp/kria/readme.txt b/board/zynqmp/kria/readme.txt
index ca3164383a..7d3a520fde 100644
--- a/board/zynqmp/kria/readme.txt
+++ b/board/zynqmp/kria/readme.txt
@@ -101,12 +101,14 @@ Flashing boot.bin:
 
 KD240 / KR260 Flashing Instructions:
 Flashing u-boot.itb:
+    $ usb start
     $ sf probe
     $ fatload usb 0 0x1000000 u-boot.itb
     $ sf erase 0x280000 +$filesize
     $ sf write 0x1000000 0x280000 $filesize
 
 Flashing boot.bin:
+    $ usb start
     $ sf probe
     $ fatload usb 0 0x1000000 boot.bin
     $ sf erase 0x200000 +$filesize
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
