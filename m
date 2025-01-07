Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42134E77197
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 06:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE86980CF1;
	Tue,  7 Jan 2025 06:32:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wh1YakXqo-MY; Tue,  7 Jan 2025 06:31:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4585680CF8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4585680CF8;
	Tue,  7 Jan 2025 06:31:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 533596B
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 06:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F2A140295
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 06:31:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id reU_naSrndHi for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 06:31:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::608;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 622424049E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 622424049E
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::608])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 622424049E
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 06:31:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=owTNa+hmhwkgDToumYBhaempfWAyqyD7VyTSdH7nNMS0H2SADg3jkVd9MsV1RT7VIIV14j071KzIwJT18G9ER4KZN1Koazlh9tyipscWr+s7kBlYNrMI5MNEl3X0EHuBOFPxm2eMg2d/wKnw/oVrBjMvCPoRtWE1dgz1IIZG05F+ls450xqyA58yT5H746Hfqinl5iikQjjGtw3ZYUEFUNnrfMeBrkP2gPqAnsAwPTG3HDCLHnKlj8N8XIs8WuT3yy6jLpOB2ZB5WZsIFyGZ4DgtdUgKGo0G+JKZgafu9VVLEOAoEQhfdggnBwryI96mq1Yao6zt70IUimegCqGmjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5eYfoPu4X3eJFtjt99nuKyHKv4gcbB69YqAYWlN+qFA=;
 b=dAvXq6beioEmp6PyB6yy7NjuNOKNbHxXkN2WiAnn2BDLoH0EmAGA6Zz+/OamxEvLYPDbl/Bk1j6b5N92fiDHXCAChMucPIQSljaNnaSCQuTneoiQUA2v3R+iHhbFXgs+HS8zJSvZaZ82BrH2cbDocQUrq3/9RiIcUmQYah6RPdoFaS5fjwWyXM04VUhXIYRj9w7hxuprxKHlWGE54LNhEYBxVb6E1yWQnvIDgRcSrty+ZMaZ/fpPquqRAxOBO1DDToQhG/Dmalv5epgNSxG5MiHa3JzDHqGRH6sKsCx6VtHvL6bE8UtbrGZqi6BhIqoteDem5WlglPVP8J05wgUf0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BY5PR04CA0003.namprd04.prod.outlook.com (2603:10b6:a03:1d0::13)
 by DS7PR12MB6190.namprd12.prod.outlook.com (2603:10b6:8:99::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Tue, 7 Jan
 2025 06:31:41 +0000
Received: from CO1PEPF000044F3.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::c2) by BY5PR04CA0003.outlook.office365.com
 (2603:10b6:a03:1d0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.18 via Frontend Transport; Tue,
 7 Jan 2025 06:31:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F3.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Tue, 7 Jan 2025 06:31:40 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 00:31:40 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 00:31:40 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 7 Jan 2025 00:31:38 -0600
To: <buildroot@buildroot.org>
Date: Tue, 7 Jan 2025 06:31:31 +0000
Message-ID: <20250107063136.787314-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F3:EE_|DS7PR12MB6190:EE_
X-MS-Office365-Filtering-Correlation-Id: 80e3a820-3b44-4cf1-3fb7-08dd2ee4f26d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kBJcp7MXDtRc0BMsHFllKQGRb986iy4pnBAdMs0YsRkhhFxMBOzJFB3mmXMH?=
 =?us-ascii?Q?9dCJ6glwWxJOxKzz2y0CsGza+4+vXjJ6dmW0JxLal6eklV/WtngDjHjdsb2V?=
 =?us-ascii?Q?ecG3WQnFHw9j8yjgLSx7ZM9oebmurRyxPf5Q/r167ZQySawx0j/MnZ62ZyhY?=
 =?us-ascii?Q?r2vV8I6HltcaJRLWQW+yCxB/HcQE+uiebYW/m6APsNBiP0V8YyxSwE0f2Dmj?=
 =?us-ascii?Q?pPxsb2wFodmF+0DPIgvDJgf++Vyh9ZfFtd+r43iG79x/9YDLj6dxvhZWLSpN?=
 =?us-ascii?Q?UdrOD1m3LXDEUpCl7f8DtF407vWoe18GFn6yiTBkHilEAZ/XlWfLWMGsYnoO?=
 =?us-ascii?Q?iiYjTEbDyUP2Q3R2qSQIefU+bhVKvnEFIqRRRthCP7HvLBOktH/oLd0Cwg+O?=
 =?us-ascii?Q?hLZK3AHQo3+FvUlz94lgs/iL/ydX/xEBx48Z/WZg+uPu0driiknfpwj9AqMw?=
 =?us-ascii?Q?NEa6eLMoJqpY6cL9QdyzYhp+w6iYS91nX69jsqEAq0qVkfZjK9Ki6BpIREMi?=
 =?us-ascii?Q?Yv8Mxq9x3TP0mZVr6AKNZySxdVpJxkAuC4n+PayNF3uccwwbo3FiMBIC/Bcf?=
 =?us-ascii?Q?fF9ocsrv6UHHBVvlRFBn6LPlNvBSG9hluEEwUwul2RlwphxYg6CaZIrg/f6k?=
 =?us-ascii?Q?2Iu15H55VbUUhl1wKm+s43ovpTIq2/RwfgXTFc2CkrO/xB3ZJvmqJpSjAvSG?=
 =?us-ascii?Q?AjLuwRzCpZmBJJ2OQo/6Z8jYq3QvkuHm3s0om+ic685e1GXYlbBgtdzCxdT5?=
 =?us-ascii?Q?rR8npeaXMKc0Wn+k0Qp06H4nZ5Aw1hL9CXCV+mT3vT2a2mgPIpDfdWhT+9tU?=
 =?us-ascii?Q?X5H+7prqb2G0mjgOiHPhmJ9z+Aj5k9zfptAkP0ZPkMfjcCzGJbq+JZ0v+iqJ?=
 =?us-ascii?Q?13qk3TVrQNQG74JLEgqvgF54EyG+8wY6SY4QrL0+AKM8DmDnZPPq0KX/tZIl?=
 =?us-ascii?Q?lWnUL3bnvUvDfbJ3bMBCzlRb+hl0vP71cC4rkp+qVeDRIdsGqsh3v2zRHNvH?=
 =?us-ascii?Q?ZFHvIEIrAc3Jp3mhKjlw/Tawwr5UrqsDFdUEBbsUpaE8PiHOgWDJjlU/yrcK?=
 =?us-ascii?Q?2cAzGus26rRLP1q8m2eYWHP38Jn0p8ytDdFBe8+tCDSxGQ4ORPxj2nEW+D13?=
 =?us-ascii?Q?k6GlYQrRNhjcnyIq/cAwUGsawlPqVjKcE5aq87G9Zv5kHBL6ZlN1+4RAEWPU?=
 =?us-ascii?Q?pynskbSxlM5VBOKqhsM442AF5ZixoU1vLw49iJpGS7xS461NvHdncLgC49HS?=
 =?us-ascii?Q?+jhCERetslqouWZTxniDYp/xCfc8eA0+cu1xieZQyNMaufGSWZEpwS+9cpnu?=
 =?us-ascii?Q?v/HjWFYTGqfdVTgQe+h6Mvos/NQncx//aknxXXcMx4ATIqEiTobDOS1d3GjH?=
 =?us-ascii?Q?7HNHoR4t6aOWwMIaOmxYUQVJYoVukIeOo0hLGQJAfD1mD4htk8qYkX1POjHm?=
 =?us-ascii?Q?Mfj74VOkKr47yAyBu9mcJRy3im1afQuVIb/zkpqcDRmTkzkcydb8Eg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 06:31:40.9426 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e3a820-3b44-4cf1-3fb7-08dd2ee4f26d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6190
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5eYfoPu4X3eJFtjt99nuKyHKv4gcbB69YqAYWlN+qFA=;
 b=j0bvIL2AfILq7Wdi4uLhb8iF0Zsz+nAfGoY4HXWHzPk8tiJzhksM53cGztcjpJ8iwiHdvwldPuWhYGjLBnJONPqIPuTUP4C053sX/MI8/fd9SC2qh8gwTSf0C/BZIcwsHxLsWc2rTxkf+UFJv7E7NBrUm9TlVjNyRER9ya5W6i8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=j0bvIL2A
Subject: [Buildroot] [PATCH v4 1/6] boot/uboot: binman generates u-boot.itb
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
 romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When using binman to generate u-boot images, there will no longer be a make
rule for generating files produced by binman.  However, these files will still
need to be installed to the output/images directory.

One such file is the u-boot.itb.  If the u-boot.itb is generated by binman,
then the file still needs to be copied, but without the make rule.

Here is an example of how binman generates the u-boot.itb:
https://source.denx.de/u-boot/u-boot/-/commit/a4c98119109a60b9b236996f47065aa8fc0de9ca

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V4:
 - no changes
---
 boot/uboot/uboot.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index d8faef648f..fd0323bb71 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -103,8 +103,10 @@ endif
 
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_ITB),y)
 UBOOT_BINS += u-boot.itb
+ifneq ($(BR2_TARGET_UBOOT_USE_BINMAN),y)
 UBOOT_MAKE_TARGET += u-boot.itb
 endif
+endif
 
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMX),y)
 UBOOT_BINS += u-boot.imx
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
