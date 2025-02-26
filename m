Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C518DC19776
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 07:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CDFA81E7F;
	Wed, 26 Feb 2025 07:07:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5R4oKxhaWdYI; Wed, 26 Feb 2025 07:07:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85BD181E86
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85BD181E86;
	Wed, 26 Feb 2025 07:07:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BE08C2DE0
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 07:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A214F6085C
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 07:06:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZlZ_qtI9u0BB for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 07:06:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::62e;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BC5A860F24
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC5A860F24
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC5A860F24
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 07:06:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hohp0gaLr+bDb3qm69FGNNQkQd9mLm6/1mv4kjJDs2nvJqGGD+tQW0fR3ofCdUuNGd89eo3AxpBIqYwxlDGiwflaKTCkVV50ic04kKPizwlROIplX3KjHKo2AIbT2hBhOYi8XI+Yhfm96/s5leQoO7gsJW7pNqvZVP7CJb1kLq+5SV0TtLCiNrkHxW7voypRi8koW4CAxDOa/wJEmWd2F781deuyIc3zsFToQEIJujuAguadkIcVDDNAHmaOLIa2gIdSJsNGGiowtejcwwOkyunrJEDgs14jZ2qD6OoPHFxQvJrGToOQPCaNHCA5b6ptDS7wQCYR+rBUXf9S8sqWbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yy3EMuqnqS0CWIk16WpScUqjrCBC6DJh1ZMYn/uUdkU=;
 b=fKookY75Gcidt+/WEUjZ916NAvIU5ZpeUzZPOo/sqhalqf7zWWGy005iyK5bvGgxuxmoSEK+/nzCdZ0bUS3QodX/fvGoXJMlDT1EiOXz3Apgl0PKhD5k3el1o55rofyCMTKE4byZMsm7hMfPi1JzFnwiihP+N+PdJkHOcvN1GiHS61iZFZRL+SsgmIkv2tYcLInW4wyONoo4dMjJPEgufa1WQx4QkA9qKeVniv8QQvBXBNJsqFTugNcveFpOAqcnTgz8lD+VXlhlvHHU17lLaj32uHZuJtsvFmYv9oi/9hhiQU+vsmsKmCbQKrqkJJjZmofHylCmNeR5hZep34XYjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0378.namprd03.prod.outlook.com (2603:10b6:a03:3a1::23)
 by DM4PR12MB8570.namprd12.prod.outlook.com (2603:10b6:8:18b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.24; Wed, 26 Feb
 2025 07:06:53 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::6d) by SJ0PR03CA0378.outlook.office365.com
 (2603:10b6:a03:3a1::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.20 via Frontend Transport; Wed,
 26 Feb 2025 07:06:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Wed, 26 Feb 2025 07:06:52 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 01:06:51 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 01:06:51 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 26 Feb 2025 01:06:50 -0600
To: <buildroot@buildroot.org>
Date: Wed, 26 Feb 2025 07:06:34 +0000
Message-ID: <20250226070637.3866930-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226070637.3866930-1-neal.frager@amd.com>
References: <20250226070637.3866930-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|DM4PR12MB8570:EE_
X-MS-Office365-Filtering-Correlation-Id: b8201bd8-34cd-4f7f-3340-08dd5634257e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3YUgwVlDWn9rxi+wwsmKoes0v5VNMdl/dlB8fdBUA/cv2FpSVr7w9nKzR20A?=
 =?us-ascii?Q?vkG5AES+ke80+ZDngFqaTAoV79WlUuk340hhuDEIi+llnwK2Y+WKw82MiOgz?=
 =?us-ascii?Q?TC0f7zWbaH6iAA4ZC+cbFOCYJG2m1Wuknc4o8Y4MtBOxq/+9GZYkUxj9/oOx?=
 =?us-ascii?Q?MB2JcILuaD69w7/Uj4U3ok3ahPLdmqKeob5QGwjqrg13sEh98k4EYzyun/E2?=
 =?us-ascii?Q?tuh9vO23FWmhjZuvOZRe2zjd72VlnMXHWXM7sXPBMkjWVgQwin1mYpu2Ca0i?=
 =?us-ascii?Q?xh9bS/uE3W3SXuB7zRubFQsekDnLMFgAtOas3gyILKZOAl8S+ZhURda5WzQZ?=
 =?us-ascii?Q?OX22vWfL/xVhOO2cb000m9FSzOQs5MixkRM61UHzKzXIQX4wluMFeaSP+Ap1?=
 =?us-ascii?Q?klc/B4r6n/kXaccTXPsjhryfgq0yTUuU6u9n2aVGZJvDJsY+1JjWVEapxPIm?=
 =?us-ascii?Q?60x6+k1YxGM7QslOeINmgbOOxoVY+3bfYBxDltK3+jRzj3f1448g8PAW/7D9?=
 =?us-ascii?Q?FGEtZkLDJPVAiI0uLsHISSRGtwWa+185Edh1NsDjx4+IF90zyZvdVdfbWyG5?=
 =?us-ascii?Q?K5zg6fSSVxERNR64ktPU5rHy8B89yjzIkjpEGG0duHYox54FEQzh0FTF3AJy?=
 =?us-ascii?Q?4i59qNZWVlSfs5yzEQffhdZmjRZN9ZUsXRdqgLHB/paf/GmjXanvoXgphYAU?=
 =?us-ascii?Q?LV3oywZR96DrtnvbVTdteEVrWXrpKPjQbZHO/QzxIq0W9L/DesavD4Msl4Ap?=
 =?us-ascii?Q?U+OsiGHjq/tIeXkUb6NvzA8Hn9ylaGXjoC+kI/54btqguIvSkx8ox/7X7crO?=
 =?us-ascii?Q?7W2GlwM9GPe8e4IVnJWbDtPnTvpXONS+cyNEhKd9ed7ljegLiSnvIoCXpMqN?=
 =?us-ascii?Q?VidG1qS4m8bB4rAwvla7I1dYZiH5qoFngDR0YRgo0i/PcTbDGZvOioqf9OYn?=
 =?us-ascii?Q?zxumW3QwJQJIfm1YYDHtnVAnyQixs3/1F81mgTKAsT2RUi86Bvy+LAZ9URz7?=
 =?us-ascii?Q?R3CpYcfTX5XHsPePbRfekffeNYSj4kgSLBFeqooh3lrGSodxIW5wmSm7YwuS?=
 =?us-ascii?Q?nsKaLG4wQUqZeT4YxXcugeaA/ILGeeRsRqCQzkyBOiAroV4qfmlPr8to2U9i?=
 =?us-ascii?Q?wpqxgwhS4qjetHcqeCe/xjcYi7HpyZeZPYiBON3ePFVJtE3jyiokCGokklmB?=
 =?us-ascii?Q?6wh9xtpKcDXL38b9EenuDiX3uTDabZxe4Mm4QHhcf8J2hQKgXe17EX6WjAXW?=
 =?us-ascii?Q?nseAaLGc52fOBtQMUfViZfUwkLxzXKfo2Ggm5nU7OZuxUtm027saRX8zX8dK?=
 =?us-ascii?Q?8tVKOxLlA8hnsfMUM5nDmp7Lwp25DYpb4clGGtj6rf+CWV2bKqeV8LhSvXT7?=
 =?us-ascii?Q?Nb+XySfr+P6BGvTOhQgegpqzfdEW8zTwnXygGCJrufU/lvFYFYckU28RrUNY?=
 =?us-ascii?Q?Is/Va3+CbAeMEvpiRmLrrd+rb8ksXL/EFNWXzBd4uu4Y2A3U0luerf67AWU4?=
 =?us-ascii?Q?vGLie8AYv2xC+rmvUdt+GCdmTagpOya8+aHj?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 07:06:52.2388 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8201bd8-34cd-4f7f-3340-08dd5634257e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8570
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yy3EMuqnqS0CWIk16WpScUqjrCBC6DJh1ZMYn/uUdkU=;
 b=ti5ja5jJ75+lXvqW1IFzHiii4Bx6JI/Q7EYIHJ8glyEB8cZVctcD4xL7cIXJoZtAFX1/reWNGJevpYVXpFd9F/SxmJ7K/ycFjEKqRZStcte4ItASD1SSKbhI8M/0tV9ZJ7g564s2VPbGBUnnCvBRpInMiNbLHO77X1ppXWTwdl8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ti5ja5jJ
Subject: [Buildroot] [PATCH v1 2/5] configs/zynq_zc702_defconfig: bump to
 6.6.70
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
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynq_zc702_defconfig to Linux kernel 6.6.70.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_zc702_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
index c97fb563b0..ab42abe655 100644
--- a/configs/zynq_zc702_defconfig
+++ b/configs/zynq_zc702_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.60)/xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.70)/xlnx_rebase_v6.6_LTS_merge_6.6.70.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
