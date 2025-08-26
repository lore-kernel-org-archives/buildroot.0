Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419BBCA0FE9
	for <buildroot@archiver.kernel.org>; Tue, 26 Aug 2025 07:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDC0441E0D;
	Tue, 26 Aug 2025 07:27:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2-8yoQsmP7Cp; Tue, 26 Aug 2025 07:27:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 019F041DD5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 019F041DD5;
	Tue, 26 Aug 2025 07:27:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DB47B0B
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 07:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23D0E6F7B0
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 07:27:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GDQD4elG0VIw for <buildroot@buildroot.org>;
 Tue, 26 Aug 2025 07:27:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::621;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5AF3F6F7AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AF3F6F7AC
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::621])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5AF3F6F7AC
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 07:27:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wkOIf7fqxU7WyUtEgCOia1F+yBilxuakPlw03M/l3cb9lpwJEb6f5FaQlwwJlM8i+9SK4tync6e9/QIlbCDjoeRPlfJyQ/SpKqObHjSj3IW3V2nNZGvrE2Bo5CNobpd5vEU9mp5B0NQk4oSZeVxU7U+8UgMFtBV7d2UFKwkNmjdzmYJsfo8OHnah1e4puV/y161ncuiTIc3ExUWA8wHBO1lH7DHhIb//E1Kw3kPibP7n2OsrXQ2QExx7SLDWDEwFTyqehRh/aOSldRterMddHuPycCalkBjcBcXM3tpfmxHII0dVSbHhvXL2P0fZY0LunFtshgyc8MSf9F7woJrSmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHCHNNNUvY86ZVuykqSmOtzWEj5FiS9e9Su9+6GP8fE=;
 b=VM3lHYU6YHjjlzE0EnljJ68sRtFd/8EeEjxK/Z5Wi7CaplMp9EZ1AjEaaWgTFHj0y2McP6rRS/riLqedgmTNiPhjBTwA3TmzO8/wbiuwmghDWSRvM65ZBnVnIYPmqhhuwby+JYsygJGC/26IcMqsZ3Q485Yzgsmo6uTSfGNcJ8Fd0TnAl9pgzM7tI4131rpayOzirUZydxfdSiEoEJ9WGdbDz6IjuEo2pBowXG+nnkYQwcy/bLfoMBholrkjFZVbJ6/XYSOfoWrOxHS9Ro3anURLHYKz8pt+DgIl9JB25WY54tBlQ/C5J6/+mrLPTevmxsj5m3l6zPC3H8qxHnQK1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BY5PR13CA0005.namprd13.prod.outlook.com (2603:10b6:a03:180::18)
 by DS7PR12MB8201.namprd12.prod.outlook.com (2603:10b6:8:ef::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 07:27:05 +0000
Received: from SJ5PEPF000001F3.namprd05.prod.outlook.com
 (2603:10b6:a03:180:cafe::c9) by BY5PR13CA0005.outlook.office365.com
 (2603:10b6:a03:180::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.13 via Frontend Transport; Tue,
 26 Aug 2025 07:27:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001F3.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 07:27:04 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 02:27:01 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 02:27:01 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 26 Aug 2025 02:26:59 -0500
To: <buildroot@buildroot.org>
Date: Tue, 26 Aug 2025 08:26:51 +0100
Message-ID: <20250826072652.1581813-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F3:EE_|DS7PR12MB8201:EE_
X-MS-Office365-Filtering-Correlation-Id: a49d89e0-648c-4bb4-e09c-08dde471f497
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|7416014|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sGZQwqx8udPTXtnhKF47bGzU+ePrfpKyQ2/c6lnZ0bWf4mbpuae/Wlc1o4hr?=
 =?us-ascii?Q?D57MeQ1ntYfzsJGobtSXlUbOuYCjxzv80D4LbbdvXl5TLvscvkGtua/0Ll76?=
 =?us-ascii?Q?ht0/7Tg1kJzzG+xpxTxOnlCQCTJpFD/dfetvFMnEg3CxPywt+rIpnf3nX35v?=
 =?us-ascii?Q?UXCe5h1x4g9KgANEtspkz8FpCXujSyP4ZwDhRUXZZSgLxOPPn45QhUW2WYLl?=
 =?us-ascii?Q?mYJZi2lEw+lKnpBWlKISYbvl8ZmabWOtWk0kOx85XlVg3Jso4qDITFC2UGZS?=
 =?us-ascii?Q?57ix+SvEADIKuNJ2AJp5Q1f13KYRodXZ4kJK0/a+ga+NIkaOw8WHIlrTjkKJ?=
 =?us-ascii?Q?MKgOmGYLKe2r0q1yE4lpRlP/Zfw2IR7C5cvUXGg22vPmM8jGQU4OWGUuo1f8?=
 =?us-ascii?Q?la8iY7ua7L5NFNWemJ6nqq6d6Owti2D0Z3SyYrbTg5xi8XpCw56dcAx8Wkow?=
 =?us-ascii?Q?Qz8vxDg4p3Ej809EcYH8b9+V/LaiVcEHyZhJjQG5fvAjdPwc9pcIDObq4kUK?=
 =?us-ascii?Q?gprlOda8TafYUvk6C68wasC/slsKJKJ+arT8EHYdodxk5cqTagfWJhHQI+Zl?=
 =?us-ascii?Q?TLj56JXzRsi20cwpg4K8eGVSqRU2K5PlQdd6+GA91ROri1EhFh3eh1d5gVp7?=
 =?us-ascii?Q?GTnIYy9K9Q0R1K8kNlHMTxeTm+MPQE7vMxXXeXfFpkpaXdpZ+LzvXM5BZsfc?=
 =?us-ascii?Q?Ug+DwCUXmRX9TRMrcYBH/e4nlb3fdG+OdbwBEhtL/M1r6cMEhTmFxXNclwhu?=
 =?us-ascii?Q?97pkJS0IvU03YbRxiIbPuM8dkc+l+q1/6YlPydHsRTfvSjE9wbMnaM7wmj2x?=
 =?us-ascii?Q?Ry03Rud49k2baskRNp4cCjooxF0ICuq7oCpWxiwJQRVcNF+tzBusTHPhOBa3?=
 =?us-ascii?Q?dq39QgeS2xP/cfTdPooBc72buz/Vg2qeQDriim5utg72bIhxtmVIhp0s/UTU?=
 =?us-ascii?Q?PTYtbksQl21i27etVxY9F/0RvlDOo8+Ckt+L2iw0AcI4vrRVcp4x2KV1FVpK?=
 =?us-ascii?Q?sTEPPXJ9Ws/Mjf4+oWVl+rtV7+Qqv+UglmIJzzf4qQ9JgwcSFbt3h5Inkhe5?=
 =?us-ascii?Q?eRFQIZV4NWWtSCIJUyoBvxwQ6QuU1ljF9DsjqHeOQRono3oY0iaSMR9aewWp?=
 =?us-ascii?Q?eqOW/ZyNcUYGyFUHWy3fgls/K7cop1TUuk2plOjQwT+lqw7AEBA6NE0TXatK?=
 =?us-ascii?Q?KEZhBYz/8HB4eB+UQSrdqoS+FeQhE2P/w3E2izoFe1QGykBo4UYOW1XgRyPF?=
 =?us-ascii?Q?saUgxaapV4NU/TnPo78BxSyZfq4MytILZ3gSlOSTdsjqJe8EQDSshi1ptXlH?=
 =?us-ascii?Q?vwxW2wjqSpAdOGYOnvNRRaT8zKqIEJM3Z4ZVS765uWD61frKGJA+dQlT7/S9?=
 =?us-ascii?Q?Sh3kelnwSZlKO+TsWOD3QwJLT7E/S9THm1ZRbtJTdUKr6CKy5plzmdKSVxz1?=
 =?us-ascii?Q?ZPaGYCB6x7HT3iqktJ4mZdl4xWJPlY1Uq73a6xc68RmAXuBqVY1CFyhI2dU4?=
 =?us-ascii?Q?6gSznBmNqtuuj5NEfXQNVwSpJnrLrqh3Koolavz8wzeh1cPfgPJUSZ0EoqXT?=
 =?us-ascii?Q?lyJ8GZ88/+QEmq495g0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 07:27:04.1245 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a49d89e0-648c-4bb4-e09c-08dde471f497
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8201
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LHCHNNNUvY86ZVuykqSmOtzWEj5FiS9e9Su9+6GP8fE=;
 b=5UirJ10Ixfz8IKLcQVHy/TmuY/T36C9CBaoRvagttKvO6DdbQZWpeUHHInnmRJgSE7iSHw3B+1s2oGKBp0teKq3tNRNe8yVNWoJcaboO7CiThMAK+eiwG07Gu1f1CPRZnS6tqYR94qEDehB60TwOC9sXpuUj/xDCwNszsWJRG0g=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=5UirJ10I
Subject: [Buildroot] [PATCH v1 1/2] board/zynqmp: increase vfat partition to
 64M
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

Now that the qspi.bin file is included for zynqmp images, the 32M vfat
partition is getting dangerously close to being full.

In the process of bumping Linux kernel 6.12.10 to 6.12.40, the size of the
default Linux kernel Image file for zynqmp products is increasing from 23.4M
to 26.9M. This is leaving less than 1M of free space in the vfat partition
meaning users may unknowingly exceed the 32M size by just adding Linux kernel
configs.

To avoid potential problems, this patch doubles the size of the vfat partition
to 64M, which should be plenty of space for any configuration.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynqmp/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/zynqmp/genimage.cfg b/board/zynqmp/genimage.cfg
index 0a6aea7a29..193aff2a2d 100644
--- a/board/zynqmp/genimage.cfg
+++ b/board/zynqmp/genimage.cfg
@@ -12,7 +12,7 @@ image boot.vfat {
 		}
 	}
 
-	size = 32M
+	size = 64M
 }
 
 image sdcard.img {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
