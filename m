Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AA3CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 05:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A891384708;
	Thu, 14 Aug 2025 05:27:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F1s6TxAYxz_w; Thu, 14 Aug 2025 05:27:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD22F84706
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD22F84706;
	Thu, 14 Aug 2025 05:27:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 276901BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 05:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E2CE608D2
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 05:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Q207RolEIVg for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 05:26:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::626;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5C560608C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C560608C4
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::626])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C560608C4
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 05:26:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4mV/KK1P+BnA5iRMQsVQaQxckIU7kIGHFNeXUvntpefNrKSjjoBmEkISRqwdo1K0OkrNFqM557gIKwjkQClxBMUVNeylJJBKzUilsWmVRrRSqIa3+SOQmN63pSG3x674OrYeyAr3e5ii2LFaEZk2zYIIXNEV7qofVISCZdR0y75AmJwVXi8sYS1l2wpfw4mLD0fXXzIYYdTcZ9ZRcDT2G3PeUZMKFivVVRsBrKyISbilM7EbObjqOf+0mIsRrkOrOWUEQlur/H2b2XCwupNrYutibrUbJzA/WlCKE7GxyLSZV9njVlndwzQUIk5brIHWMdplPhs3HbkaFTSoADvQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJNmaw7ak1kyKk++4JtOun+yWnbB3GdSBtxtZnWJfW8=;
 b=f42rMc9dXDypdzrAdz9AwsIcbqVDebGGfctKNrrLPuhzW3TNDSB//eD2Tvg6hNgMHOy2UBTZx2uAe4Lu2Sjn/Ti9Z0It8Y56WhfRZZ2DnGLHz0JOL0KjfSq+0+cTbifQ2dVKA1eO6ONMYOZSLhVL5+otEEKBVYxdleRqZnHVa0K6fgw+KPmXf9OedZ87jW9zQytCykUGg5chaPnw/8OzZtxdWrpRRySDeFRK0DbZOCYpuKJ3Kpb5EA83o3eFZDZXf7jdSFfv3UG/lCNCpLcss7KX7A3JPzLAk5RcA6i6mA4nqCJo4mEFW58cCCSb7vMTdHTLMCyCnA9aA5tWF7kOTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN9PR03CA0218.namprd03.prod.outlook.com (2603:10b6:408:f8::13)
 by DM6PR12MB4074.namprd12.prod.outlook.com (2603:10b6:5:218::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Thu, 14 Aug
 2025 05:26:55 +0000
Received: from BL6PEPF00022574.namprd02.prod.outlook.com
 (2603:10b6:408:f8:cafe::74) by BN9PR03CA0218.outlook.office365.com
 (2603:10b6:408:f8::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.17 via Frontend Transport; Thu,
 14 Aug 2025 05:26:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022574.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Thu, 14 Aug 2025 05:26:53 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 00:26:53 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 00:26:53 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 14 Aug 2025 00:26:51 -0500
To: <buildroot@buildroot.org>
Date: Thu, 14 Aug 2025 06:26:31 +0100
Message-ID: <20250814052631.3412836-5-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250814052631.3412836-1-neal.frager@amd.com>
References: <20250814052631.3412836-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022574:EE_|DM6PR12MB4074:EE_
X-MS-Office365-Filtering-Correlation-Id: fe734776-fdec-49b9-80a4-08dddaf32dd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|82310400026|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Fmg+QxYDj8C7Kn/RhYavkbTPOwdJhyKcPbCBStTpChuIE6ALenAB+42IVZwY?=
 =?us-ascii?Q?zxFCcNvc8OI6zURscO5Fl2DnxuB71GRi4zG75OM8JPPLzQcOgyDkqfpUZnqv?=
 =?us-ascii?Q?NwZP33hyBLnPTWdMgrd+Emve8/Jenl6FrfF2TfFbSLE8/NFoaE3YUqNN6Sex?=
 =?us-ascii?Q?pqwwbrekq6LwyrDa7FTj32uS1jhFc9Ye78OVbnnStBRmR9Uo3Rd5aE7FpAbi?=
 =?us-ascii?Q?LzTy7YLFOuSkfnVdVLtLZWs+VVR+LORVyrGwIac22OkGH7OlHDTwR8Zbvlbe?=
 =?us-ascii?Q?3DtKVmc3Nk6k96qzuZve/mShk+cS4OxhFIZXVEKT5TlypQQWAE/OMzxKe4c1?=
 =?us-ascii?Q?qoOopn+PmU9mH8lFj6fqzZwY7tG0SQXyziHLnCQhIlMNb34yn3b3VpTPYGzv?=
 =?us-ascii?Q?tTTvR/1FDGkgwMJZJr+/1L4xmzHOXDCVVRNTpQA8rDsiyd5mnbW0t8HotjtU?=
 =?us-ascii?Q?JCiY/V1eBGoLGHbP7L4WVGZYvgcx0M1OWu83cF8fptBdM2CjIa9zfM6GuvaS?=
 =?us-ascii?Q?Ydmf5Ko9XQ65pjZSJ1sbImoarekVd7p90cQ2M4aLTSWntOS3yINnp95qVuL9?=
 =?us-ascii?Q?19AYrmeVqbdMEHE+9ZT/rtaA8TfRZXPDVFYCwTizy3g0ARDGFpx813z277Zj?=
 =?us-ascii?Q?J+DFzJyGX4VqweCvqTfqUeTInX6OiAwfUmtN53vMie/CZmJC+3k2cz0abaZA?=
 =?us-ascii?Q?LhB1/vVgm4LI9eB1YgRz2UZ6mX2nUln6sG/Y9Nd/D5C83uwSsPCCuXIBLpll?=
 =?us-ascii?Q?3uB/5d+FZi9sEY7HgS/JSHeSuSpeYzSfjva/fTp6QX7gXFymWHpHeN60MkRp?=
 =?us-ascii?Q?0awjPmi0UU0oRgjJODMrnY7hPxQerZdBv0IvpeA8NRAj9RJtpBHWB5tSeEz6?=
 =?us-ascii?Q?Bknz5AjJ+B/NOtAvQrdNmucIMhWhfWMWPwgNdE1gnz3/ZEg/z2jEDfyYb+2H?=
 =?us-ascii?Q?uXcS5072JXiTk6ivOfvYzY9pts5iYki52j+z0B+Km3QG40QWujoc2NmcC3mj?=
 =?us-ascii?Q?nG4Ia3Y9kRv28hSHKRSI8X1PPgVCHaeBeKkntu6EilDzN4PYCg5bPPdPCMPx?=
 =?us-ascii?Q?ykTjgTBFCF1CtRwwvMO8bjPUEwdpQWA0dtVbMiCr9+oXGdmPsm/zGCDYqeaV?=
 =?us-ascii?Q?/lqoBEmORNJbc4Xes/srsNJMsQib38CvyrgMSOnAhrY1l7qLFbcVhD9tY7eK?=
 =?us-ascii?Q?jzbc3Sn6UKmEQeC7NOGKbdnH+sf5wWN+bJRm8j4E+sxjl8TQvFyAHtK0Q0pd?=
 =?us-ascii?Q?uSO9+8YNMVWQxXsSk5dgKnrSCfsAz2IagKefbV106Kg2jmf7wFb5O/cLJkuc?=
 =?us-ascii?Q?uMmcqQBDOtsPqstxTJ2u50AEtHOLkiNXMI092WlNsIQA9W4qMo/Gi4oEa0pZ?=
 =?us-ascii?Q?muRtjblmUwh6jiYguQYAGKPyYIhMKwLYPw51n/g/oj2dEw+TwhWOks3uoBDM?=
 =?us-ascii?Q?0CvhJ1BbIKIbeF9G/xUd3xaAYK0kW9t0XnRKBWQmHwa2+vqKk3dVdPf+BXXY?=
 =?us-ascii?Q?zw96wdfHe/Vt4B9WN8dTDTFPbDjxWKaqf051uIrLfkPm2ZuSVQgpgF4BgFEb?=
 =?us-ascii?Q?wkKFjlwKd8Dda+sQRR0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(82310400026)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 05:26:53.7066 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe734776-fdec-49b9-80a4-08dddaf32dd8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022574.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4074
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJNmaw7ak1kyKk++4JtOun+yWnbB3GdSBtxtZnWJfW8=;
 b=zGLYFVGjW43VO0sdSlgnXObrgTmvhEQ/7Q4zwJZxPor1jXUmElMICuVMel8zh6rHCPz/YVhRrTjwz4+0kf9pWKrgNYWydjxbZlJQcmzKmcVHEO3umwvm56CEAl/lriLIvTEeyCO9hU6tsW5wG12Dr3cG0rHjMkb3/mhN6XOjA6Y=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=zGLYFVGj
Subject: [Buildroot] [PATCH v6 5/5] boot/uboot: use
 BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS
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

This patch migrates the BR2_TARGET_UBOOT_ZYNQMP dependency to the new
BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS symbol. It also adds a cpu dependency
on BR2_cortex_a53.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V6:
- new patch added to series
---
 boot/uboot/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 52e6050c81..0b27874e24 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -575,7 +575,8 @@ config BR2_TARGET_UBOOT_INITIAL_ENV
 
 config BR2_TARGET_UBOOT_ZYNQMP
 	bool "Boot on the Xilinx ZynqMP SoCs"
-	depends on BR2_aarch64
+	depends on BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS
+	depends on BR2_cortex_a53
 	help
 	  Enable options specific to the Xilinx ZynqMP family of SoCs.
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
