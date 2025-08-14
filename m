Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2CDCA0ED1
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 05:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 766A4846F9;
	Thu, 14 Aug 2025 05:26:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n0zXjNFYeym7; Thu, 14 Aug 2025 05:26:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73565846FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73565846FA;
	Thu, 14 Aug 2025 05:26:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BCDDA271
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 05:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE3FE608C9
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 05:26:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xvv40Fzx_Q7m for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 05:26:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::610;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0CF6A608C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CF6A608C4
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::610])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0CF6A608C4
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 05:26:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DbX3yKp2VVa00ERe9HxCHBFJjRYOkp0/T+L7vSaJaQD5MT0Q2gZSL16PQh7hohMxLBhSqoJ43Z5D7sAxvOxkNWprxnLH1YZQ3bZ6SnfUSW6EEGJvMbz3J9GibMOa3ZTSbU5QBaCk29UH82dfTQ+1ILizs5mbCSVoYM0M0Z3AMOydMdLq+CoI2LS++WQmEmi7NAMpczpAJg71FpSjAV+oTiTtVXU5Eay4DllBP7d3NZKGLrM0mxJq+QYbA6kC23ih7n1y3mfdChZ+ylYfWaIaGOsg7T5jobT2QzR3V7gQFybCm+hJ8p82jFaDDB3GYCkpGJRJHJjSGn4ya5gsaF3TsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ooiNCD8Fb8U7+v1rTE+plB3hiX7dEM6cu3S9CozX5YM=;
 b=IomemxETddPnQphZfGZ5Z5kJCLU9FArb2SUOyoOuaEfBSIWOb/akgCiB3I8eYNRSUrGWwKfNYZztFfli6qA4hyqVQSH/cgq4IMwHOTfCEL9sE+5MfDLbx7BALRpX4te/nwc7vRZGvXqPD0joLQBo7LS5TqhGu5q7KvdaoFv+583TFmkipBta2Yzuezi0GBKRTmepIXTJiDwaPHgrwCIT0ppdFy5Sw9hWmTsM0mEgZGCZpUllockPcv0wxZJsANLSRCZ1W+HFIGyE0WKN+nNCUX5v+sfI6vv4PDnqrXGfoBu7nOFcdFaBxbl07G7AroY63YauBkjn0Z4ysL5vMAUisg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BL1P222CA0005.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::10)
 by MW4PR12MB6706.namprd12.prod.outlook.com (2603:10b6:303:1e2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Thu, 14 Aug
 2025 05:26:43 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:208:2c7:cafe::f3) by BL1P222CA0005.outlook.office365.com
 (2603:10b6:208:2c7::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.16 via Frontend Transport; Thu,
 14 Aug 2025 05:26:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Thu, 14 Aug 2025 05:26:41 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 00:26:41 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 13 Aug
 2025 22:26:40 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 14 Aug 2025 00:26:39 -0500
To: <buildroot@buildroot.org>
Date: Thu, 14 Aug 2025 06:26:28 +0100
Message-ID: <20250814052631.3412836-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250814052631.3412836-1-neal.frager@amd.com>
References: <20250814052631.3412836-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|MW4PR12MB6706:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c8aa408-6202-4650-55d8-08dddaf32692
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|7416014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ChyDG4iykm9Llg0HvTIuZfaQaEM2u2isIoCz4nxrgzh4XUzCmeHJi/JPhRkf?=
 =?us-ascii?Q?MFgdEhHgZMjZ8wsY7kdBMbJbydLZo2UlqRLsTk3SxZeeuFNlFSxtApRxfhHN?=
 =?us-ascii?Q?5hI4Ega70qXJRdxbbUa8hdylsWL8GVnW4QUJca3NP2/rWL9s6Q5jA0hlRnvN?=
 =?us-ascii?Q?7s+qFn3PPCzS5Gdz/lJ53WydHQZ3eW4EpD6iiRapvogCGl5Nv9a3qSQPXRqJ?=
 =?us-ascii?Q?+H2GjAWTB+wyLWdxl18f7aGRMcyWVxH0kQtDX5wVSpBbPjk0e07YRLphW+8C?=
 =?us-ascii?Q?ZKFp8pTssyuo9cfrb6oWk4Bd0PIRZCR1U//Hwgosxm071Y9p3RFGTaiu6z9D?=
 =?us-ascii?Q?7Qh+HEYSSNOXeyu8IY2jqZq5CxWn9girSnQwrHmlYuf1fFmzJyh8QKBRcpPm?=
 =?us-ascii?Q?GZSGvgz71LzIrjSvMH7CdYQzUHvq+UOv+skBvS7WarK8+09EorhiH1ON29kU?=
 =?us-ascii?Q?gOiyPYI/asdtXxSolfS2sgHwnvDHlNPNfQBWSn8CfSZ6qq7xi81geNztGGLU?=
 =?us-ascii?Q?i+Md2xzzSL4+SeeYFbGGfKZO8ovReHqydUJc7f2JyDRnEi0kSk8plVYn0ghD?=
 =?us-ascii?Q?yivuhkMAbYFq7RiOMLjTywWVe2vujoqafB9HWjEUTmlZaw9AhxWRfEDMVqyZ?=
 =?us-ascii?Q?qY4s/HkOkLfpLMEcrCRg/ieqh1tV/2jt8gbXdjCTvPt+YgkVG660zoEBKjKG?=
 =?us-ascii?Q?O0p6OYUHu8ypYnXRs7SXzJww2N5eIRKdATpiRsA+d8RZY24l4dweyyDms2yw?=
 =?us-ascii?Q?cfR8GkE15NEV5is4S3ptRYULNJ+Ueaqg7prcU8Q2jINK/ZdjYpxsGRSjPZla?=
 =?us-ascii?Q?gVxOO+CBEiVzHsOmX5ZsAPvd5bJjkMufq8yqEIOr1jL3RfNn/59AuEb8aQ1W?=
 =?us-ascii?Q?y8q++5/3/Bhrn4tfd/Ss9VtM48+ZCT70AR0rw/wMHmp5BqClf2uRmZNEd2VS?=
 =?us-ascii?Q?JlzxlymdshDTfaRDbBINAAbNve2pRZ5GwV/rpzW7+UcJNF1xIfkxNOScRSdX?=
 =?us-ascii?Q?xjz0Q8xrkds8ljym8OtlZ9qonU0qBnEt4RT+7lh8WZDkFBjblgWxQYM6P1/k?=
 =?us-ascii?Q?jCQ5AWEyPpCB8KRftRX1m8tNq+KfoM3q8s1ndnPl1NQdWwY4cyYTieYN5Cy0?=
 =?us-ascii?Q?YJoFiUItYNGDUameSVbIv/ukk3FSdcA3dx25G3bnYqBYE8ACR39Nj2tSzEWG?=
 =?us-ascii?Q?d9omnMZhSYaVNUmRWed8B5FxVul9f6i5M8B17oKbDFq4nn1WO4INYGQ05rR3?=
 =?us-ascii?Q?BGAERv1+/zIwzyzNdFbAE+zYoRajNgsrmx+Rdi99EF28Rv6tF6VY3eTOOlZE?=
 =?us-ascii?Q?EvefyKZiUVutU1zGrD45gOgYfZMir4ylkHyxu+n8JLNNOvUbudL1WmSxhQyV?=
 =?us-ascii?Q?q8XZSrkrpUzln2JGLDc4A9p+P/BfmlE1ID/keWBxVnvNOr4J1Fjwt/r8YCM8?=
 =?us-ascii?Q?p4uIeI6NG1hyVzT5eEhAyPUzWwZKLlHvXm2XSMV66bDE2yKjOkRaxuxNFwuD?=
 =?us-ascii?Q?8IIF9YZkFOscR5DJ1CgKjo+2o6QlaGKy+LJOExwezZAs1IPhJAZLAPIkp9nt?=
 =?us-ascii?Q?VSxvNv/z/zGQZjVvbGI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 05:26:41.4984 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c8aa408-6202-4650-55d8-08dddaf32692
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6706
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ooiNCD8Fb8U7+v1rTE+plB3hiX7dEM6cu3S9CozX5YM=;
 b=PTOhjxBVZtQxZ00Mq01Clj6t34H27b54+JsQ1ywSu8wYXITeLELT1TMjZUr28bKvu5yaqVM3v/aX0M8xeORMBDZLMqktnA4w2csQ/MnSm69+KiCgRZpk871Y/RKimDuTPa47vR9iHQNZYk33aVmLNe1msm4X0q1TZ6wK3dKnKWE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=PTOhjxBV
Subject: [Buildroot] [PATCH v6 2/5] boot/xilinx-embeddedsw: only allow apps
 for device family
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

This patch adds an architecture cpu dependency to each application to make
sure that users can only build applications which are applicable to their
target device family.

The versal_plm and versal_psmfw applications are specific to versal devices
which are based on BR2_cortex_a72.

The zynqmp_pmufw application is specific to zynqmp devices which are based on
BR2_cortex_a53.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- Replaced new family variant config option with an architecture cpu
  dependency, so no new configs are needed.
- Updated patch title and commit message accordingly.
V2->V3:
- Changed package dependency to only appear if the cpu is BR2_cortex_a53
  or BR2_cortex_a72. This way, the xilinx-embeddedsw package will not
  appear with zero application options if another BR2_aarch64 cpu is
  selected.
V3->V4:
- Added BR2_TARGET_XILINX_EMBEDDEDSW_ARCH_SUPPORTS, so that all arch
  dependencies are in one place
V4->V5:
- Replace leading space copy paste error with tabs
V5->V6:
- Take advantage of BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS from
  boot/Config.in to remove dependencies on BR2_aarch64.
---
 boot/xilinx-embeddedsw/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
index 0dd6433608..3826f2e18e 100644
--- a/boot/xilinx-embeddedsw/Config.in
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -1,11 +1,9 @@
 comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-buildroot-elf"
 	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-buildroot-elf"
-	depends on BR2_aarch64
 	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
 
 menuconfig BR2_TARGET_XILINX_EMBEDDEDSW
 	bool "xilinx-embeddedsw"
-	depends on BR2_aarch64
 	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
 	help
 	  Build boot firmware applications from source for Xilinx
@@ -30,6 +28,7 @@ config BR2_TARGET_XILINX_EMBEDDEDSW_VERSION
 
 config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
 	bool "versal plm"
+	depends on BR2_cortex_a72
 	help
 	  Build versal plm application from Xilinx/embeddedsw repo.
 	  If selected, the xilinx-prebuilt package will not install
@@ -40,6 +39,7 @@ config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
 
 config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
 	bool "versal psmfw"
+	depends on BR2_cortex_a72
 	help
 	  Build versal psmfw application from Xilinx/embeddedsw repo.
 	  If selected, the xilinx-prebuilt package will not install
@@ -50,6 +50,7 @@ config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
 
 config BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
 	bool "zynqmp pmufw"
+	depends on BR2_cortex_a53
 	help
 	  Build zynqmp pmufw application from Xilinx/embeddedsw repo.
 	  If selected, the xilinx-prebuilt package will not install
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
