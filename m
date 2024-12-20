Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5D6E77188
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 10:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFEE041761;
	Fri, 20 Dec 2024 10:35:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PszZuRIIBepc; Fri, 20 Dec 2024 10:35:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA4D941769
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA4D941769;
	Fri, 20 Dec 2024 10:35:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C822730
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 10:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 642CB83B9E
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 10:35:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BxThjL305Tx2 for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 10:35:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2009::610;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3FA0F83BC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FA0F83BC6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::610])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3FA0F83BC6
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 10:35:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x+O7LB6kc9E0wHS6WhVtBb92ZQrnWw+wLp1ahgbLCCupPkF6OZ1vSsWCostrvjeKBIqp0k6ldGY/BtNHRpEmv5X5/Z8lDfPS4Ae9p2LUuXmLyDtXq3PP0Wy9ZhQGFpo7CAh/mXjEsKY3TiPvUnH5ce1nMsbJUfKY9Ezj479td+1xujMVBRjuuk2wxfJiXx1O5gEj2qzSEvF6ohNYqN8w5RMRhEk2GyY75qp7wA/hfxIorcOOX4gt+x4ASWNERfhFo0TbH2lDxIh9Z6L1FndnYc8oLwMWye8LwaRQZj/7xGxRa60FoH70Fo6XeGuE+DhNCrQngNlBzRkWl8nClp/WzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pyvYwYuOiT+kieq9sxQnh3cf4HXqPuQA2aPhMkIsKJE=;
 b=iLll32UfuZIpmiqF2Zdg5e0SVTWLa8VMAdQSQKPQL+wy/OdN9/2j/UFd8x9oLL0pBYlQRA/HVJBL3wMlskS0jRI08/GqLTCmacs/qsSvOx5bRzOctc60+vSj3BTcNM2452HaB2xY1FBxhlsxqr7RjYjKwLXs+K4/H2rQi9JKBVkYQ6vBCB8Axg8AwGpztHAl/fDa7iCzZ5wYHVf51UDsUeGyq4sqRAcRd37h68Fm/+q4K/3LnwG8MLGNMhL1oR7Dpp4f+7Y1MEFwhX74RJcHmi9e0Vuls/ciwBouqXS4tTSDKyvpEghw0VqSjemhQpLoJciv1dIQd97qeF/Nt6pgkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN9PR03CA0248.namprd03.prod.outlook.com (2603:10b6:408:ff::13)
 by BY5PR12MB4324.namprd12.prod.outlook.com (2603:10b6:a03:209::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.24; Fri, 20 Dec
 2024 10:35:37 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:408:ff:cafe::13) by BN9PR03CA0248.outlook.office365.com
 (2603:10b6:408:ff::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.16 via Frontend Transport; Fri,
 20 Dec 2024 10:35:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 10:35:36 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Dec
 2024 04:35:34 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Dec
 2024 04:35:34 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 20 Dec 2024 04:35:33 -0600
To: <buildroot@buildroot.org>
Date: Fri, 20 Dec 2024 10:35:18 +0000
Message-ID: <20241220103523.2301721-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241220103523.2301721-1-neal.frager@amd.com>
References: <20241220103523.2301721-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|BY5PR12MB4324:EE_
X-MS-Office365-Filtering-Correlation-Id: 0293a257-1e62-498b-9928-08dd20e20a30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8WcyrItSbs2QT7bEDnarOHYQIrKry3IvArNpp2sQjZKW1NDDDopuxhW12XdJ?=
 =?us-ascii?Q?wh4Od7d1EV/NpezAN+sPghM15Ymaj51gnyVGECOuyjhqDGVOR2na+ROuPVJc?=
 =?us-ascii?Q?tZG7dDZm1j9A61DutDSjMddZq2xGckteRuQ2SlQzy6Pgym4peS2l+irjs4hs?=
 =?us-ascii?Q?Goatzysbb1yVe8p7ZJqLm6wEFgraYdJYGliHOERFE9On4G7JGmVPXQaC9+W2?=
 =?us-ascii?Q?MtLHsiHo18TaNP5nK1iGfGOsfDdYYhPjrLXEmniqtf221TUnzCRwOXYA4/eg?=
 =?us-ascii?Q?5tUuknsuDejkHAarufujAc6RzMqqZdAE1Ae6pw8qzQoAUwJcz2Ol/gWZxbjj?=
 =?us-ascii?Q?TMOSkcvEQKB/5SPImlyeJyRFbR96A05aH0Jo07vLhYLq+a60D3q3UiugINU6?=
 =?us-ascii?Q?lBJn3FTqldnZcFwtbuVXpZCSFnmYzgSBfGPpy300TD9yC9uHeRaPa826Kp5P?=
 =?us-ascii?Q?BmzXY4nyqDYc1tkOg/KvbKueLP6rUzOpcUBrTpocXTX4QE6fM8OKZPkkOIX4?=
 =?us-ascii?Q?BVI69yJv2NYN8t08+lMGeUW9kixJQTm6jgs2qnE59NH3fdr7ZTgZiv+nBxqZ?=
 =?us-ascii?Q?WBpEjesmP2XoHKSOU8C7S6GpJMNOGfpYhxleutvQF8BcTK0u4KZJn0rUVHKD?=
 =?us-ascii?Q?XvJB9i7f0abdG4FpsF4unkGBkzOOMqP69+eDfHWbpMQGyIrYq4rQpM4V9k4l?=
 =?us-ascii?Q?8h02e7H/EHkUAfvb1gui6HQgm9rb9/84UrL2PFvNpWdp8/KqvOl6zmrKkOho?=
 =?us-ascii?Q?8oyByAttkL0e4wCbxc1LZn4kHBc2ISrEjtIpJBQ65AF/O/ElGDaiMaMp+xx/?=
 =?us-ascii?Q?TUJzM8n0jcNOC253UjuRXDYhsV2UTxPzSc0kh/czNj3d26jzY1TJLit9mmY1?=
 =?us-ascii?Q?jXaDJyYpqvDNv59e7z2+jYbKGUl03vL9yhFpcFw/2r/1KjUhaVLYyylWPzqO?=
 =?us-ascii?Q?4XbK0hGDDFqgDXb1QoPx+3AXbiGh0sB7HrWSGRv6WvXFdq7qRpg7N8NGLx4N?=
 =?us-ascii?Q?5Undd/yGI2OVorhnrKx72W+Ac/H02RGXbzl6Go9Qz+YUFc/EUaTSPW/ITboH?=
 =?us-ascii?Q?LQwmBRWF2jPyovIDPeu8ier/54jJQrbGCLB4nrPfE0MTgyVvAg/97NdnyN7h?=
 =?us-ascii?Q?VsfCu0H1HTO25WdnTa8suiUkmAeFflVK/fQwjUDckz8lSj6ew4nPxb25Mv6x?=
 =?us-ascii?Q?BoYj9exJv1y/srmCmyggp0Ialj6kciV2Iv7QJRLO1cRABAz4KKR5XdKSrOcn?=
 =?us-ascii?Q?plp4ihyjaWeVwaKE4CsnQMBLTqWtKp22APXJKL3H5MLyn+3iU3CpJkZ4+zzT?=
 =?us-ascii?Q?p04X6rlYCnEDz1ZebyR54B+wv7uCmKc8/97xSGg+nEdJpyahhNID01ONS+zv?=
 =?us-ascii?Q?+gl5c4dvYVR1Q/NvzRSH6KhwTNie1hNkUYBKnP7Cf3vmh2Cfza/379Giwd0d?=
 =?us-ascii?Q?dcMrhVTsqy5HGpQs0nKy2V71BzhiY8s4B8IPASd2f2be8pAIlq6Dj+jOCyai?=
 =?us-ascii?Q?QWPTB0YfjmMZHVc8wfmvi6ZNb7rUyOIGvBULb94xQZXekVPeVe0kREMa8A?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 10:35:36.1352 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0293a257-1e62-498b-9928-08dd20e20a30
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4324
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pyvYwYuOiT+kieq9sxQnh3cf4HXqPuQA2aPhMkIsKJE=;
 b=TLu/SbT3SsSV6y6osacJQDvKyPSXsHxFY8P1mVRUzfOyPS7bTg7mN85GDG3EPoWa/Bz8sXTnmBhFpRunFxz6WdM4inuVxpz+y7MKtCzf1FuDmhPCgPCWmiLUCqLmQidLI1nXzpl8h26jLDvMQ7mTIXvA6LoM0SqKkKGfoeg61W0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=TLu/SbT3
Subject: [Buildroot] [PATCH v2 2/7] boot/uboot: add qspi.bin file support
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

u-boot has introduced a new file called qspi.bin for users who boot from a
qspi flash device.  It combines the spl/boot.bin and u-boot.itb files into a
single binary that can be written to the qspi flash.

Here is an example of how binman generates the qspi.bin:
https://github.com/u-boot/u-boot/commit/a4c98119109a60b9b236996f47065aa8fc0de9ca

At the moment, the qspi.bin is only used for the zynqmp platform, but other
platforms may adopt it, so the buildroot support has been made in a generic
way.

This patch adds the necessary support for buildroot to install this binary.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1-V2:
 - added dependency on BR2_TARGET_UBOOT_ZYNQMP
---
 boot/uboot/Config.in | 8 ++++++++
 boot/uboot/uboot.mk  | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 8648d6eb7e..2946aa7251 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -446,6 +446,14 @@ config BR2_TARGET_UBOOT_FORMAT_SD
 
 	  See doc/README.mxs (or doc/README.mx28_common before 2013.07)
 
+config BR2_TARGET_UBOOT_FORMAT_QSPI
+	bool "qspi.bin"
+	depends on BR2_TARGET_UBOOT_ZYNQMP
+	help
+	  When booting from qspi flash, u-boot can generate a single
+	  file for flashing by combining the spl/boot.bin and u-boot.itb
+	  files into a unified binary.
+
 config BR2_TARGET_UBOOT_FORMAT_STM32
 	bool "u-boot.stm32"
 	depends on BR2_arm
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index fd0323bb71..d7cde420ff 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -108,6 +108,10 @@ UBOOT_MAKE_TARGET += u-boot.itb
 endif
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_QSPI),y)
+UBOOT_BINS += qspi.bin
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMX),y)
 UBOOT_BINS += u-boot.imx
 UBOOT_MAKE_TARGET += u-boot.imx
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
