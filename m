Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5CDC87FCE
	for <buildroot@archiver.kernel.org>; Sun, 27 Jul 2025 11:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 938E340CCC;
	Sun, 27 Jul 2025 11:26:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VjtQLqKwBTi6; Sun, 27 Jul 2025 11:26:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 864B441043
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 864B441043;
	Sun, 27 Jul 2025 11:26:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E5B96231
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 11:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D623340BBD
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 11:26:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sdz21CbT9AX2 for <buildroot@buildroot.org>;
 Sun, 27 Jul 2025 11:26:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::604;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C915D40BB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C915D40BB6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::604])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C915D40BB6
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 11:26:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eEEygc9B8UgCAITc28IP7EpsBVKOy74B2EsqYvZWrgpteewJduM/SjXXHK2eV8JDbKFYdV1OM/DRYeinJZr4di2HDMoWJtzVcmf6uHzvy46UQTni7REC/OXLT7C9R/UyxSU3WG+Dz6MaSNIKRDS8B32MoWb12bfB1Eem3WpujwVRfO99YxVyPy6En9nd3KNVPnGmeEiAY2nJ2dcqCGuvR7czugmobu0xroCY0bevs0h5JvxL/BP1sohTz98RdKC2laZGjrLvoetu+grvhqFfPWAFSTOesRHLIle3gEx+gYPYVq8T3ncCbv0TbO6bKlV9SjOXoqqZD8R2siI0EhCe0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prM8h81NC3zIAkamzKiq/fmpmVyFdcP7yOIrQE2rM2g=;
 b=XXtKshE4Ott7N2eoYNHUiE32NWB3grwA9Ief4Etga6+HQ3Uk9I/zebmzJLUaBYoYCFrYzpwZ8IXrTDIzEI69YJf0PJMnQSk9iT8ikbLgAA6+dYFRDlAVD0v7sWYxHGHujnfrNr1s7LgxGLlha6GgFKZHaIj+OBkhsono7nkDrIVrXK4YB87cGKZfONKqAzhKbEWyrSQ0VL0T3gPM1XxE7Jay2izeCc1GH7D97/ZhwLwWZn3+U5Myb0t+/etU4Pi+XVGuqHe3cdFrT8hrBPvyv9b+PHUGf5osP6RH7reQKqZeqVc1na7McMw2zHgV41V7n5x5pp0+pey2fUbV44q8oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR03CA0268.namprd03.prod.outlook.com (2603:10b6:303:b4::33)
 by PH7PR12MB5949.namprd12.prod.outlook.com (2603:10b6:510:1d8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Sun, 27 Jul
 2025 11:26:46 +0000
Received: from SJ1PEPF00002323.namprd03.prod.outlook.com
 (2603:10b6:303:b4:cafe::86) by MW4PR03CA0268.outlook.office365.com
 (2603:10b6:303:b4::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.25 via Frontend Transport; Sun,
 27 Jul 2025 11:26:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002323.mail.protection.outlook.com (10.167.242.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Sun, 27 Jul 2025 11:26:44 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 27 Jul
 2025 06:26:42 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 27 Jul
 2025 06:26:42 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 27 Jul 2025 06:26:40 -0500
To: <buildroot@buildroot.org>
Date: Sun, 27 Jul 2025 12:26:33 +0100
Message-ID: <20250727112633.3245247-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002323:EE_|PH7PR12MB5949:EE_
X-MS-Office365-Filtering-Correlation-Id: e2393284-ff45-410d-1e71-08ddcd00776f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6jN06GmBygMXX6P3lg8mueDXscpt3lcRMiWJeBI8fsOsMEk/u4Mcr7YBmCgG?=
 =?us-ascii?Q?VEnW2P2USK75HTdVY5xfGjctBdUkRcUsyxhwwvvG7xc91KMWSV5CHyBiyQpD?=
 =?us-ascii?Q?00xeVYPZ6WTXZU2GDx5102pgz8FhgZRZzwja0HB1jKAyu0DhiKTEWh1zsV16?=
 =?us-ascii?Q?CRX5Zhplp3Ejq3Axz+o5qjaqPyH8ig6sEf1tWK8wWvzu/KJSawgcqfjKv6Ob?=
 =?us-ascii?Q?Pjp2ekHMKX/2x6u3SpNAfZ2miJfybuo+kH1wZLx2aKbSEaRNV7t9P16N02wC?=
 =?us-ascii?Q?PC/veuua1GXpVLmDCymjL48yJSsocoz3ZHTJMPtv9UVZYx0Ewvdhp9SKwDrx?=
 =?us-ascii?Q?Ay7ZbO+w1aGgpWmeQkoIm6QRlIBKIGPwhJ16tJQ3HPvHdHUHobf2gWCczntq?=
 =?us-ascii?Q?sQI4yUJYLnLavBEwP6lSoLlbjMRlDdhiqXWisr3g0Vx4t3H5KrAnWQV5IUvb?=
 =?us-ascii?Q?4IHkfSrupc+3AMHDUS748O8mTcZJdiTwHklPMMT1RglBcYqgIixhGNPPH03H?=
 =?us-ascii?Q?8Ed/lK/UHghsDsyzPQ8JpyzuDEpKNft5xGW9nZ+iVkY/4QFlE9F2qdNMx7cx?=
 =?us-ascii?Q?IT0w+PMF9ANfDH5ZznGKapqyuebSI/NdaCLNGpy8Zm67Ey1mOZJlsg7YmMvp?=
 =?us-ascii?Q?t0OZOlhNztWtKVwcfVClkvhYBkK6jrxjfpu7PUAOvt3RpuxYjruyfS+Floa+?=
 =?us-ascii?Q?wkrHqndcLVMQZ/w8DxPuUcB5zQYRovnDl2gbHNKl1feOGnv5S+dhKtmB4BDT?=
 =?us-ascii?Q?T7NcfizuchEcwYGTOa3dIAx+o/SkOFIGGU9QKLuwDJ9NwN7O+UCgXU0yj2A1?=
 =?us-ascii?Q?SYWDlSrCe2DfulJ5SS7/6TqqOZD2SXbI8FY0G0GqsNltyj2T+5tOPCus6Otv?=
 =?us-ascii?Q?ljoHcIGiDjoajmd1Kl6621ojC8FlmvpCM83EoS3/66aBpA6IgUQ56FfvxsS8?=
 =?us-ascii?Q?YRDBEXIzKDXhOIGQI1zP2L8mqgAvV7E+eNdvZ1Ojrnj1kKxAMd+OuGr69vEv?=
 =?us-ascii?Q?QvIbLqJrrZCUn+hLJHpgdtcmEcP7xhLmFzw+sl0k/Gns3F5pwsM9nrDEeiB4?=
 =?us-ascii?Q?jqFTV6W5Klx8ZlaVTDpEiNbBal06A9BuOtWzyP1l3lCKSs5gEvFrFH9vSnSz?=
 =?us-ascii?Q?GPLvgeCGQAPWpvDX+aLgRfN00tDiOQDT4q++hMhoMDfXZsB6ilBeNIU2REHm?=
 =?us-ascii?Q?5EsbzfYIjSbloXhlN/n6/qmi18ynIDR2WrKHlhtYoBY8pnX7+bEcamkCy7xa?=
 =?us-ascii?Q?GycJNg1K5P7Eu7r4CDYZrj+D5kQU1cehb3c0XV6iJT66LPuT62YnmU69NFaR?=
 =?us-ascii?Q?ORcKVkkRpMf4cqTgEYP0jVMI2SWZppVYMpirFvXQDmxHt79cVbo9dREqFuMA?=
 =?us-ascii?Q?EmkNZH1pjkyzMLCd6r2J0EwLKo91gNCHOFUPuUKPkziVI0dfFq3BtF6V+dVV?=
 =?us-ascii?Q?HZfwUg8JBz22zrzigZFyLsKX+zGT33zx8bs8ypY/CHO2g43P0uyQq+izfwYD?=
 =?us-ascii?Q?HAeLq9rEI5MnihW09F55YMKcwRwIUMbsF597DKJbHKhiwHvRJvKynP2J547+?=
 =?us-ascii?Q?SZdjespdnBT+p7/JDSk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2025 11:26:44.2594 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2393284-ff45-410d-1e71-08ddcd00776f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002323.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5949
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prM8h81NC3zIAkamzKiq/fmpmVyFdcP7yOIrQE2rM2g=;
 b=bLZ8fa9KTD/K92w2Ts8Sh3MSGENTPMY4uJG+Gjlfcyox+HTQIEacd/4uTN+eWefpz35gOpiOLTSBRNoxc8lbIWfuFVlgmmTL22gRhGEbamhq3sYzLGaYIxSXoSKJ/5GhB/QUrL9YxZRcBrvuqMsDSMSfm9xJ+r3NIYmTSUAzLqk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=bLZ8fa9K
Subject: [Buildroot] [PATCH v2 1/1] boot/xilinx-embeddedsw: only allow apps
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
 Neal Frager <neal.frager@amd.com>, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
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
---
 boot/xilinx-embeddedsw/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
index 0dd6433608..608b293712 100644
--- a/boot/xilinx-embeddedsw/Config.in
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -30,6 +30,7 @@ config BR2_TARGET_XILINX_EMBEDDEDSW_VERSION
 
 config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
 	bool "versal plm"
+	depends on BR2_cortex_a72
 	help
 	  Build versal plm application from Xilinx/embeddedsw repo.
 	  If selected, the xilinx-prebuilt package will not install
@@ -40,6 +41,7 @@ config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
 
 config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
 	bool "versal psmfw"
+	depends on BR2_cortex_a72
 	help
 	  Build versal psmfw application from Xilinx/embeddedsw repo.
 	  If selected, the xilinx-prebuilt package will not install
@@ -50,6 +52,7 @@ config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
 
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
