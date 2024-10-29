Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62A3D13594
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 07:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D41D80E6E;
	Tue, 29 Oct 2024 07:04:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fd4-rfo3aRQP; Tue, 29 Oct 2024 07:04:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E08780E6F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E08780E6F;
	Tue, 29 Oct 2024 07:04:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EC584EC0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 07:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1014480E6F
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 07:04:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dyY0GUmmB89N for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 07:04:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::60a;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 87AA280E6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87AA280E6D
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::60a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 87AA280E6D
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 07:04:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WF1z7ZT0npBXUroODoqRD0Joc3Gh/7PEimfEzuLyxnkatzkguhW+dn2gAeRayhzHUtwq8cF8I6G1HnxnvZKRNn3CEYPdxWQYCiYcrpVLiQl5BieQKfPAy1DhSaQc18iH47SJGmPL3F8SH2rcYDk7eIgcqb8ksxl5Dw4f8YMIKgd1VUYmOZ4ztJgs0bms9gmXtexqLLgXYJXIqoOAVhCWq9hKk+gq9Kjpe7Z6uEQPioFBZKHqFPZDXffuREYlOwAO4UQ5ycTV1AE5RvAhdjtrEOEsmws7t+cNYyK/fgrdM98pEXxJN9qzVrF40F2yppKB4ma3l1T5aOa7gNVwMdTudA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9aTELw7odPcmSKHpyn6xsecTGzyoZf5KmbmWC48EcLw=;
 b=tPL1bBfSZvx9WwMwqCMu5wCqwcn2Z7KbUuczxdFPUuMgBvRvL6ZvWL97ochyo7kmz9sM4e6nGflDQ11GZutPmrZZRdgNZKPGnpYQyZykt7QKvrbcfP5fNF0dmBYyNZ2rRZQN2y5G2YVuz3ouO10QpQhw03hVxDAAYKquYxwUj4RrvuyqZVIZLEasBSSIcNNpOwdDqeGGFgag4puPwLD7yfRCs9gzd3l6AlDQ49sGclO29fxmZ6P4ziUbWh7yXpbg6TnwJYsVQZGxbSdphFu4O+Uvi+D2DYQAgDvCuIZKFtRRsnLUJznABeTBcIUNand5E2Z3tfaFJf4w/58B+jkKGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0372.namprd03.prod.outlook.com (2603:10b6:a03:3a1::17)
 by LV2PR12MB5845.namprd12.prod.outlook.com (2603:10b6:408:176::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Tue, 29 Oct
 2024 07:03:56 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::62) by SJ0PR03CA0372.outlook.office365.com
 (2603:10b6:a03:3a1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23 via Frontend
 Transport; Tue, 29 Oct 2024 07:03:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Tue, 29 Oct 2024 07:03:54 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Oct
 2024 02:03:53 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 29 Oct 2024 02:03:52 -0500
To: <buildroot@buildroot.org>
Date: Tue, 29 Oct 2024 07:03:44 +0000
Message-ID: <20241029070344.2661276-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|LV2PR12MB5845:EE_
X-MS-Office365-Filtering-Correlation-Id: 17b2acdf-a3e7-4bc2-73b9-08dcf7e7d9ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vIOf2DYt440IWlA7s2FwKnkh9O320DWkQfpLp9A265DXiM/VCnPFU1yuXVI0?=
 =?us-ascii?Q?CZrB5PzJRAjKhJhmY/CbzGd7JMZJryrjaZnaBUjPSU2uHt+ILFYDsR+Xe2eq?=
 =?us-ascii?Q?u487/Pxs0U5ixOyLynxDpNioFjtR2TZHgYxdd8e+pOh6KYrn/fcgLaJ/E0o/?=
 =?us-ascii?Q?eLhkz9C/He/8p9Jgcnrge28rQZZeXvP7Wug+x4gFets8ShS/JBEfj/apbsyj?=
 =?us-ascii?Q?MwJg3Vq3CPqTb+37BZMqiNuXqj4chhJUlDrFmWbE5M4dAFBuPhDL3iWwbolp?=
 =?us-ascii?Q?Ib22PRKM8NF/tRov5BHS4RhOeHO3Mv0SC5pdk5du1yyzjVu00X42Na2L7Mkd?=
 =?us-ascii?Q?a7v21AGVlXR2qo3GJjgJJjK/thW8M+rOMVu2VlABNDIdXmHl/v3KPytEOOzq?=
 =?us-ascii?Q?gtMo3FPKfaOW+VhvoMTXQBBxx2KaTC3L+8OCyQ9YBeLWtSrlCQjxDkRdm9rj?=
 =?us-ascii?Q?O0oLUbsimW0ITJm6LgkLr+TaWHxEnKwYEbLaVxN1PDjy0131IZzH1c+t2IU/?=
 =?us-ascii?Q?rxOz1CA4skLweTMonIzZg/4HkqJ4wCyaqicJ8wuaLAf0ON3iMfY0QcJxAqv8?=
 =?us-ascii?Q?Bi8e+ZJ7e3DPkmxn7PFFJ/i2rGTfoKew8uFRnCCtyK+c3xn1V4wyOCVpsWzO?=
 =?us-ascii?Q?78qiyf7K6Xd+HPW8fdbnr4ZJOxKcFQ/nUhfaW+/QJIWaPvuu3QVoJ6P1QfgJ?=
 =?us-ascii?Q?Si8bubll+Mu149aGmUjFu62tsDNGcqIWakIsH3iIkBw45O4IGKvJpc5+0w7P?=
 =?us-ascii?Q?1sbfx4ZBGmVugsczWfbecGoeJqmSgyl/Paz+SlehOtEl56eGptpZJvWT2VJT?=
 =?us-ascii?Q?k9vhN30QhJA5htCbYgw5/+cEycKkat6gzrZ+ZsdywqMVIRVNmaiB8jMwAQ01?=
 =?us-ascii?Q?qmbaE37TnB7WmZbLktLHe5dUF5lKZ9kh5icNzd1T12iznI+PDE+Tz/rl21Xn?=
 =?us-ascii?Q?r8b1zUliWvzRYrepC8DHEcutfYPfJIun21eAzG1oMKXoXHZAIbGAhZdqbh9N?=
 =?us-ascii?Q?EDnDB204a5YTcIOblgHoPVbgTr4mbkfBpxfpie70llhmUVSY2zaQYwl2jhtp?=
 =?us-ascii?Q?u2LPTmAH5N4jiVxsNgkzYc5CMicKC2N+zMQIh9zGmynAiMgeBlp/otFtjEF5?=
 =?us-ascii?Q?/WU0JlO/+SCiJZJHMAyK/ZMo1gGxVgWIopp6ZSC6kngYmh2VmkRnO8FCcMVo?=
 =?us-ascii?Q?rsUNgdxT1NAObsDxUKoPohhCZwQhJFHFjI0az4PLhNnK0e6aFiB8IlM4ASbt?=
 =?us-ascii?Q?f/PeYC2zP9oPtnFfX3SO/6dXmNuSqoCZCjoeGDkrNdRzPxBIVFnWjx/Fx2MX?=
 =?us-ascii?Q?+u0VLPgsRc+jybV4gsRxGbyeg3VsaZOifry1ErFZJNtFq0F9wPjrN+rO2rAE?=
 =?us-ascii?Q?k7wHiMquMb56PvNBsTy7ckQkXMlZPx0IeLpIFCPekC1Ev6oUCw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 07:03:54.4952 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b2acdf-a3e7-4bc2-73b9-08dcf7e7d9ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5845
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9aTELw7odPcmSKHpyn6xsecTGzyoZf5KmbmWC48EcLw=;
 b=MLkeCbtfppXCE/EOo9t5oglu3WuXeK66/hJI7qczs5k0AJ9rbIbh1h1yuzeFk6SGkP2dyGPljlBZmFBh/2JWzQ3GE5KvFieQBswmTJijeMbMshllFh4U/Iu2OPZRO+430ofV0fiP17Upkt44/+hr+jP0gqs+NwAlRLOYBU0eugU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=MLkeCbtf
Subject: [Buildroot] [PATCH v1 1/1] package/bootgen: clean up variable names
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
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bootgen is a host package, so the variable names should have the HOST_BOOTGEN
prefix and not just BOOTGEN.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 package/bootgen/bootgen.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/bootgen/bootgen.mk b/package/bootgen/bootgen.mk
index 912e2e31b3..840e89f827 100644
--- a/package/bootgen/bootgen.mk
+++ b/package/bootgen/bootgen.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-BOOTGEN_VERSION = xilinx_v2024.1
-BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(BOOTGEN_VERSION))
+HOST_BOOTGEN_VERSION = xilinx_v2024.1
+HOST_BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(HOST_BOOTGEN_VERSION))
 HOST_BOOTGEN_DEPENDENCIES = host-openssl host-pkgconf
-BOOTGEN_LICENSE = Apache-2.0
-BOOTGEN_LICENSE_FILES = LICENSE
+HOST_BOOTGEN_LICENSE = Apache-2.0
+HOST_BOOTGEN_LICENSE_FILES = LICENSE
 
 define HOST_BOOTGEN_BUILD_CMDS
 	$(MAKE) $(HOST_CONFIGURE_OPTS) \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
