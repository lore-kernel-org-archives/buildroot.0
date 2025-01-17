Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E44DBC02185
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 08:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 704AA41619;
	Fri, 17 Jan 2025 08:00:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o5lOAliUBCBa; Fri, 17 Jan 2025 08:00:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB7ED41680
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB7ED41680;
	Fri, 17 Jan 2025 08:00:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1651F94B
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 08:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 465286119F
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 08:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BSVMlWrmFxmr for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 08:00:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::603;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B00C260837
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B00C260837
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::603])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B00C260837
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 08:00:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pNzxtGIeycpluPbv4pbofjHAvDzKVUHMOp+KkbUwtcEF7puojSTsjdPSGa6LCWYcjEMTUY55E17OMe2ypoYYiAZtVTBEEs0zXkw4gzEv3xfLyxkrENYrk3BYAFlDWi0tj+omwPaUnC8kSubxyJvupY8X3rB5tdVxNfjKRwTpPs67HPec/WoaRPxxkmx9IcMUoi/3zU/4VpOyQAm/D+j+c9Y0E1QXoUQSv5EUq3fuVOn3QxgDb/a4dUKsQuWezg+vyYaxUvSfQFCidFf00x+03KB9evUZwM7qsZKgtT7EIAq1Latc1JVqItF4+qmgOFBOYmTS2Qo/pjHbJ79jsMiZtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTWZSpAFdlR9EgyzvqawNkoPqqrhlVvB+6AvcNvwfLA=;
 b=ZlsAUmn60gGSjNYrSbNP/AdKk4nFgmIyynEha0uXznUHRuqoIvTbTpuA1u7T5GCc3uKpalRJOwqG46oHMZvg7OstZ5h6yO1krDNeIZ+2zl3jVb/pq+8vxA68K1SzLktdLR0MGsceVzLl2NN0T4fagj2pYO/CszMSEW+tUzRZIEVz8CvB6NWNRUbDUY71sGqvj1ibS0s1NPiPes/nMsSW0pnWG7tgt4N3irUxtMUlgEMfYC7HCf4MRhg1w3fDzOQ3aI7sD2+2Ijqmha4v+A8W34qncEXfU3faGVipVQoUm3s00MS3eHzBtXXncVnwkHmWb/MEFvy+ZwxDFdxa5LjY+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BYAPR01CA0013.prod.exchangelabs.com (2603:10b6:a02:80::26) by
 MN6PR12MB8472.namprd12.prod.outlook.com (2603:10b6:208:46c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.15; Fri, 17 Jan
 2025 08:00:16 +0000
Received: from SJ5PEPF00000209.namprd05.prod.outlook.com
 (2603:10b6:a02:80:cafe::bb) by BYAPR01CA0013.outlook.office365.com
 (2603:10b6:a02:80::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.13 via Frontend Transport; Fri,
 17 Jan 2025 08:00:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000209.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Fri, 17 Jan 2025 08:00:15 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 17 Jan
 2025 02:00:13 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 17 Jan 2025 02:00:11 -0600
From: Neal Frager <neal.frager@amd.com>
To: <buildroot@buildroot.org>
Date: Fri, 17 Jan 2025 08:00:04 +0000
Message-ID: <20250117080009.774814-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000209:EE_|MN6PR12MB8472:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a34bb11-711e-4dbe-bd81-08dd36ccfa36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XA/MBSP97ZwDNfWCjwfg87in4OOcMKo3vMPoYdRv136kFVeY0piKctbTJn9/?=
 =?us-ascii?Q?QC1TXDa3iJU4m0MkTmrVCTv2GEmKjbfpn6/aAaqDIwcupjuaVgh4IO5oDmR1?=
 =?us-ascii?Q?QmCZNyQdqBU64QPDp3Zy0sE55GDZUYtA9bwusP+R3lnRz8myIViG334uHOyU?=
 =?us-ascii?Q?VCGSrH/KTq8uXByb+ak107x9OmVf+LF7HshFtVH7d6YD2USIor5EOsO4tIjy?=
 =?us-ascii?Q?sA3Ic8gTJE2wq6fbQXSBJan01n0OfN3EwjAYk9TcNGECuxlYGnAZnSRYVBp+?=
 =?us-ascii?Q?uQdhreR87xa3LhaubV+5VRKD8iFCPdaAo6xX324PMUUVZAEjioUfPBfRoDiH?=
 =?us-ascii?Q?QfbmZt8/+UjP9j5+R6ju/11WMDg21GojQgpQefS2uIBnsuoaUo/PXzSOPIeY?=
 =?us-ascii?Q?y2AINF1Q/0SC5RGKGtGoeOppIni6RIBfiGHwhtx7lNPHQc9y8fUs+lOwLSNz?=
 =?us-ascii?Q?Wu9twvsWnK6oJCmr8u+4XKNlUOxxIezesT8tYoMU4aOMfMgyxJZ9AmH92Vmz?=
 =?us-ascii?Q?qC2Eb+7OZYXT5ZVzU/+vV2hSTCf8w/ROpB6WCxQs+/XHbLqdeyxUwVX0k/Yk?=
 =?us-ascii?Q?YgLGlrmI7CPM+3YeTFK1vmDY9NbmjezPJKXUkJLgZZRragUicLqUXBl5XxlQ?=
 =?us-ascii?Q?JoGd5XhaX+dHnUj8hfmGrvUij5BtDBtuYqhmVaSkVN0zEVQQ8x9sAlEj33dz?=
 =?us-ascii?Q?d7JrUX21X265vr0K87yAoXo6bVNofuaYxg8s6rASVRR6gFXZbkFuGigT5Egz?=
 =?us-ascii?Q?pFdEtW8KFxIFP9iO+IYsEsNq69dV+FOqcCXPVlKlp5lOveCspXA3nMKZn9ff?=
 =?us-ascii?Q?m5LtcQzGqQVEsXsELpLUHTmG+rEw6Qm5GtqamRoP5tGBJ3C/GCBswDY2ilCn?=
 =?us-ascii?Q?B4iqWNeAoQeUySGKCKEz/o9LmYQLGaSozONHWb+lrz5TbveWoQiuLZPetNNq?=
 =?us-ascii?Q?jFbuJnY4dlGVIQRlEU36Wj1eRaiNGmu71OiNoaQ2M8s/Dva9w2LRffLpDrDh?=
 =?us-ascii?Q?OkdN5j9xgAojnciApq+vxxP5fQ+smrT9Ps9QpOIKmRXVoNsaWsNRalHJM4XT?=
 =?us-ascii?Q?NGf+st7SEDK4EChUtUO5i3XHqMcq7jyhXJSa3oXUCeabexPtDE8sdc9mAX4m?=
 =?us-ascii?Q?DkK8QOKjMuL2V+kNPfVgXV+lw0MY+CHx8LwWQ7ZYZb8Gdb1O9JnGioGEl5vW?=
 =?us-ascii?Q?12dUj4Kf4Qqsi2lvE8fV2g+PtghOI7KK4hyT81bk97xFU62TCurJ6qm0Ad4t?=
 =?us-ascii?Q?5ZubcFe6+KFrfxXVhznpYhvcoz+IV3kgIkGkl6XCINJcKwSTxL5hsiIXBZiS?=
 =?us-ascii?Q?fNag3N+BMQEoS1YLgKQ2ATsOeditWiE0lVSYJI5LifF/c2ZDrlAUl66ZUirS?=
 =?us-ascii?Q?ABasNvOEvfOw7mWgLIr00K+XuGYXZgJTKF6XxevPVasW4x/dnpu2c4B4QkFC?=
 =?us-ascii?Q?o5rETZtqddbCBorhpAboJ5rzJ95Xari51ZjZOe26H44SfblcZdhdLw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 08:00:15.4035 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a34bb11-711e-4dbe-bd81-08dd36ccfa36
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8472
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTWZSpAFdlR9EgyzvqawNkoPqqrhlVvB+6AvcNvwfLA=;
 b=bnNliLUXXORO7R/rkE/kI+JvzCbdQDaqnDbp35MbnaoD4WeWLvr0+bMYn7jydiBLRJ85/I7gIDWb285MWPRodH3/YXtAS9ZfMQ4BekRxFrmWgFaiZZk+UJZHQNZlqFLkuSRySoRWGfLS1jYd1cCZeB8Zh5QGRlx1KJbfL6Mkeg8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=bnNliLUX
Subject: [Buildroot] [PATCH v5 1/6] boot/uboot: binman generates u-boot.itb
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com
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
[Tested on Kria KV260 starter kit]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---
V1->V5:
 - no changes
---
 boot/uboot/uboot.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index b3094029e7..d06ee2a792 100644
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
