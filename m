Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 075D7E7719D
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 08:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1676407CA;
	Fri, 10 Jan 2025 08:12:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gga50E2ulFw5; Fri, 10 Jan 2025 08:12:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3D6B407CC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3D6B407CC;
	Fri, 10 Jan 2025 08:12:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8768F76C
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 08:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74DCA407D6
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 08:12:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PceoMlcIfDft for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 08:12:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::60a;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7AA33407CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AA33407CA
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::60a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7AA33407CA
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 08:12:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M0gz7UyGFsgVWx4F4JZm9n5sm9kaPQemLL8JNE3PRn9/UAD3cUWuX2TXe4qZTKn68o0rHUhroOq/6d/WBS7o9IN1UOo3bwq2+asnOYZ7I6GC4h4uCJUX7z+YAIudfwsGe9Q3gxebdtw5EUo+MKKfdLEy5cy7eoa9T+eVhCdsLGPfGIMpIG272Vv+78BXwocFaDOYsmgeqPj6+M659NcOWZqKAwYjTJWh5kXYmyQJdBMBWx9gd1kIveOmBkeYnLg4dAZ+hFoyNMo/1601StT8G4X8LseNplv2elgVZgo1Hyn/mc6Kzlx66CC/n6AG72LFrZwuvlF+xLQ+tVTsoETTBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3LXr4cuwgGQ6o+/NohcZR/h2CBzIcRMW5HjLXRAIVAw=;
 b=OabAS9IhndYs563v276xTs6i0Tmy3M1DHxlv6qUVn8I08WBjPCRG2n5VmBEVhm5wlUXM0pfY/FyV2Q96D8YEZZ41wVw5WuRyBgnNQfH7bpDpGVvUcrhD+RJbae92SQHdH/UHo1oyM/UOMv71ulE6v7W84LSVq8gGHcVjH98QUgqXp6D4IGfE/7tqTJ4jHW4kRys0R8d/Ev2uRlJxmip/PeWKQSrGh+pTborFhSo0WTxDxGQlCpwpAPZbu44x1HmaUc76xvj9NnvNiT9PlJuMmIuCdt4AwstpgCalwVEetBU8xdYhD1bHFMnmdxV+80h93o9ZMWX13huIVCfz2k9WIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN8PR07CA0010.namprd07.prod.outlook.com (2603:10b6:408:ac::23)
 by CH3PR12MB8212.namprd12.prod.outlook.com (2603:10b6:610:120::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Fri, 10 Jan
 2025 08:12:02 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:408:ac:cafe::90) by BN8PR07CA0010.outlook.office365.com
 (2603:10b6:408:ac::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.11 via Frontend Transport; Fri,
 10 Jan 2025 08:12:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Fri, 10 Jan 2025 08:12:00 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 10 Jan
 2025 02:12:00 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 10 Jan 2025 02:11:59 -0600
To: <buildroot@buildroot.org>
Date: Fri, 10 Jan 2025 08:11:51 +0000
Message-ID: <20250110081154.2481-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250110081154.2481-1-neal.frager@amd.com>
References: <20250110081154.2481-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|CH3PR12MB8212:EE_
X-MS-Office365-Filtering-Correlation-Id: 20a2906d-72ae-4f21-218e-08dd314e75d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YjQ9myvRBfX2Ovx1nU0TUcO22GV+8b56W0ZVwzML0eaZzYOFOw13CeWwf6xM?=
 =?us-ascii?Q?sXfzOtsoQ0PhuzO7PrKFKyAkHlHcA6wHaWQS13wluj+f2qoE8H3Q89FPQR64?=
 =?us-ascii?Q?z+I0Z/vmhvfw2pmxTJYMoLA87Lq4inWLqE44JdUKrtEzDDMlcBnFxSLV3nHq?=
 =?us-ascii?Q?MmFK+N6kUfb9tqDGcNPtqj5Z35/ksxk+YmkG8Ntp9mDfAvmtX16lUoOlNy2Q?=
 =?us-ascii?Q?WIt3BdAFm3JsUIcdFm0pvrncV1BJbAtlvH+iO+NvsEYDrOVPHk5jhbmFMBb4?=
 =?us-ascii?Q?ak8qztbU4LvDVLkGn6f/ueKJcRPrnTqAO2KjnT4iTvwpdkSYTzlOQQZV4y5u?=
 =?us-ascii?Q?mnhD4XB87PhJKmFl5ir1yiKU7Ao5bfvW954MpYxbXxy0xLOGMLWVyQnjHnFF?=
 =?us-ascii?Q?u3HuJfllTy9h7I5/FbooYauSzRS9Q9jyNf+bD69bW777svt3zorYAZ04xTfw?=
 =?us-ascii?Q?dn1jFlHUlzOJYiRKkwB14HpL/sjNrb5i0gW7GKxRstb2NugBQyKmpSMcuPt8?=
 =?us-ascii?Q?Y4kEAHEK++HNeidA5E31Sbozi1BopInvhM/x9FfmAA7hrFzYqrhzg4+OxQZv?=
 =?us-ascii?Q?8x0taS4h9DHlTJTLH4IfvUYzQ8OZ+VRhoGtuSNlftC8xaKgtodTXGOXnf/hH?=
 =?us-ascii?Q?X7V09bqbwcWSzrugn4yMwODlpQI7JxYAa+YdP987xRUv0lnehk9oTMp4QeFF?=
 =?us-ascii?Q?E/pQFR//sgyABsQQCb30SuK5ugh7z7sz0xcyRd8NdfOeR21LNpCafb2ay4cC?=
 =?us-ascii?Q?s0Drja6aKsaUlJFEXQIH5eLkPD2IE+aHUib6K4jqFcIMMx+8wDZbyJ7SPyff?=
 =?us-ascii?Q?0uPB8JnWTg6OrXsEFzDdGIJThDBllSLEmYDN/TR3Ma+lUBdJaV4VvKH7S1YQ?=
 =?us-ascii?Q?x0DpU77+VW5bld/hmcIzLUN1E+Tr97H43gipSpJD5TakV+Qihpy1E8jQoaq4?=
 =?us-ascii?Q?1dntkjahNvqDw2Dc//zFy1ad6S5iJzEernJQbfCemrjJxBCaU0bHp14yZO9C?=
 =?us-ascii?Q?0fBBAimjE3rHZMLXsuFEAS+LckrJ7S6XhXlrhd5y3huJNy7x+wLsOhz8lea6?=
 =?us-ascii?Q?URiJZgNFLn6+k84Ojft4xS4NR9pED4yARd5zskWL3sHZpo++9Yf6yHrqsbZI?=
 =?us-ascii?Q?KE5dKZaHeHC/6r1E8IYJ0MO/P23XqduHyLK19mqMeD4FpqrcpkP3hsO3LNjj?=
 =?us-ascii?Q?qaB4VZGQHL9yP9L5JLfzRzjuXX/trCcW2jasukMdjOeU6rl/VFBoB+4bKwjV?=
 =?us-ascii?Q?+l8GKAn+Z25aurWugL2OhP0ycTw9y3LMdYd8asFJAcwDUbF18MeVpDK+v3Ab?=
 =?us-ascii?Q?BvRR86gzDV5GJcRufkDuRDSHFvloC8muZxKNC14rbvgAP6DU73tEKpGG7cgc?=
 =?us-ascii?Q?q9zg5ttYFRwgDMWpflfYqlUKTelgj8aMmuZYszLM0P65ugHqQgRPeOOd/uQ6?=
 =?us-ascii?Q?FRMl7EnqydX4/SxjhXXYkVM5mgtGcOSgYvjrOKZfoUGkbu2K/SfazwkQ9a1t?=
 =?us-ascii?Q?KnsBTBx78ymaF7hbGhHvCjtiTBjiPhe6nW6d?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 08:12:00.9481 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a2906d-72ae-4f21-218e-08dd314e75d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8212
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3LXr4cuwgGQ6o+/NohcZR/h2CBzIcRMW5HjLXRAIVAw=;
 b=kzMsLLkpRQfpTyPKg9C0vuJbkHit/voQiG1HyI8zjVo+qnJN7OQjHosae8cO0g2kA046rywlZRKWH+InqM+7Peu84G4lOn9Fs8RwqrS2xigiw43nor1wuey7rzdH03Wc3d4rlMklixj118IzLe+DF74mubwL2+YrwkxbxLfwoNI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=kzMsLLkp
Subject: [Buildroot] [PATCH v1 2/5] configs/zynq_zc702_defconfig: bump to
 6.6.60
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
Cc: martin.chabot@gmail.com, brandon.maier@collins.com, ju.o@free.fr,
 juju@cotds.org, michal.simek@amd.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynq_zc702_defconfig to Linux kernel 6.6.60.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_zc702_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
index 86c0f3fd73..c97fb563b0 100644
--- a/configs/zynq_zc702_defconfig
+++ b/configs/zynq_zc702_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.2)/xlnx_rebase_v6.6_LTS_2024.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.60)/xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
