Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52B6F5A8A6
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 17:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F3C561010;
	Mon, 20 Apr 2026 17:39:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7oZK0d-aEY1C; Mon, 20 Apr 2026 17:39:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9F0161063
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776706759;
	bh=HLwdXDvo8jCKeD9Y6+3f8pTYi8Wt6dyI4klJMwQAHH8=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=ri61US2bTqnAtzxM+bubPsPf7Xu0g9x1nIn5xUVrew8+Srd9If7svFkgUq6ARXRYs
	 TVov5HEP0poHTLrUc4QQ1Etbb5FfbPisZLTFhwlDF0h3k4BxafqIs/eqDdOYeC3F7f
	 xYWsqnvpvxPv3spcKrx2JPnGIVo3pLuE/MruxTVcM72ANTES8x7cAqsfnIcSBCwqps
	 8s0EGfCcqQvcNVALek0QeBayeM2OGH41ebMb6P0+p64jYex0w35swDWdeKHfuiaLRb
	 qBm1JltqPNS+EWgFEbGzrP1ZSFZkuFhgqnI1wGKFCDW9aAXoGT1/5bJJ+5E8kmt/bm
	 IJQzrG3vwvN6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9F0161063;
	Mon, 20 Apr 2026 17:39:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F08F924D
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E249F8297F
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:39:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4j9bnk_Rvgmr for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 17:39:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c107::1;
 helo=ph8pr06cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5F67381FB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F67381FB3
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c107::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F67381FB3
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:39:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YToXZa4db2STqdriAevNDmABwZH6T1CR26uArRjvXdYjzevrpQF97jwealPE0mE5cpDW9oU29EEBaF+a3omV9c4Uu5c3gxtkbrYPOcVDgOVOQpvtK4BIQaaE8pJdEMEQmsW6sUv58EXWeFK2ep//MJYss5pH11lFXUtFeg90O0/bDpDUj9YvKPjuKcNOULUOKOlE0It3JcJr/KUsjcuSAPnV7/nTqq+nfEi9LtkaI8dHc+wSoJjn/c6fVQ9PzCsJ9qrRxYPwkDFU3ltLGCkq4THqtM/glVpiA89/bh2N+vvd/X5YbT7HF681UKaQYOyqlPHdTIPIgtkO2TjW3aNcOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/lbRSqAwt0Omzs842DJPj8uwJ3+MzftUkOnav78Ctg=;
 b=qDKe8RmbLIA0+mPUPzOkdM0t/kEpQSpNEew/duhOp8K7pkXUjjXOht7dfU1W/fxw9ogZoUqshyur2f11TQnheUMjIdQ4y2g+td8XlVP87RpobcPG9InCZmcj4evjmff6f9FlcrIx9uQ8zD8zkdfmgauDwJg9QYqoCrC/YyTCGmwsek7OB+4LWWlryer49+PIUDTIhM0U7b2u0uCgGVMLA1k0hnAGZbfWvLDCm0nQAhbCCqYJXGKJwp42dDVMKALUdrEjAGLGkYCwGLfHjlHXXZmRZuKBVfFZv81p/WwuMgwhjmQKpvF2vWQJv7wHx+1f73agCegAcFOaXttTkEnUCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0145.namprd03.prod.outlook.com (2603:10b6:a03:33c::30)
 by DSVPR12MB999123.namprd12.prod.outlook.com (2603:10b6:8:388::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.12; Mon, 20 Apr
 2026 17:39:09 +0000
Received: from SJ5PEPF000001EE.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::65) by SJ0PR03CA0145.outlook.office365.com
 (2603:10b6:a03:33c::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 17:39:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001EE.mail.protection.outlook.com (10.167.242.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 17:39:08 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 20 Apr
 2026 12:39:07 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 20 Apr
 2026 12:39:07 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 20 Apr 2026 12:39:06 -0500
To: <buildroot@buildroot.org>
Date: Mon, 20 Apr 2026 18:38:55 +0100
Message-ID: <20260420173858.1655069-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260420173858.1655069-1-neal.frager@amd.com>
References: <20260420173858.1655069-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EE:EE_|DSVPR12MB999123:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cbbcc92-8d8f-4b4d-9c74-08de9f03b9fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|7416014|376014|82310400026|56012099003|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info: RQYSEQvEjWcFKQ93fRfC0cm3CJP4xhNve/qOJU5tQUuzEvWA/ZkrxFjYMKgXx3ArL/2VBo6tx5vwZEs9CEWFcVs3HgKephj6RhmborjeAjRhwB4AtiLxNoX7oCvPksQYDRi39DGCWENwprTre5fd58i3XW43PX460cYzaQjIrNmWRNTGIaQBX2VhDGth4t58bPn2wxy1AQMy0+i1FueAfdTjuBcdH1EsUK94NdwftrjJn7UkjPNlN3aO8SawcS+2pW8RynRLq7+dQdGv19DlwYJ8WqDO38LVbNUmsn1kXxZqtRSPqpzDzPBfpq3wBnCUtQwJWkzjwMdaholsZPP7KBAWVoBTAgXfKA6lfyhBhwl4RztVxKbgIeypD5XrYtofVxrlAWR6T+/v/1cPMSvbrzdSa2QYNQPRVuEKV8i46XkJed1sce2MqmFYVfkJoTngrn/sO924kveWyEqhi+kBp7Uk0zvf3Jko4TDwCU7OLUW+S8jWtEVI9yfbwpDnsOLMh4uifvXZu3yCex2eKS93TRPhbSE/HRQ0/9+Tpuh4Ag8vlzbCQcVnsoskQxeKmdHhL+jZBZX+E4vP591gADIzR8pvvUCzTOXNhntiH2/4j4STzUzjkjkKDL5A280EmqhOqoWNDfNbJ73k/1q5asbspRRqWTI2OsSJctZ/H1tjcy2s4Cw2XfJS8NA9yNoLJe2IHedSb/z/5hmYAn+Q3+04eB1s6eSJSj7hm4B9thgHNHVNmMi+ZNPa5dO4B6ss39uNQWbs1AhaI0vEQ4aRgDMS/rt6cfPRnUGpi7k/dAjHngW8gtrWu9XDdsOJz2U90mLjG3H/cqQlCzlVgukMNecnYg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(7416014)(376014)(82310400026)(56012099003)(22082099003)(18002099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hmeVtgxGPN5tm0Gbol6+5qN3UdBHnZa9pKKzmRwWKv2JDThVmI3oqiL5p4gg2TrCwaLONbxzhm/SeyEOUnk8QAcjDSfll6wj8a2zg+z2OMMHBjIgoe6VNv9rR/4OpGNbN6EL9JWOFNkj2tul9553XbAb4RrA2XdPyYAwfrBt2KMCmF+45RpkyO5b5NT2lcXERdrVLFRfTUu7qT+CpHr98mSBkCUW7JcZLNVJt5Skg8LACx31vvVThc7/Fb9mSdC5uK5Be3nOuX+86upMyq2YxiMEwkNHU+1Ge+3Y1pJDWT62FO7kjoVYp74BqRHeuy0h5iz+aNX2Cx26ILXMK7opwRZIbv8EyCzQtEiLocVKhvvxuuxUVw8zG5XJqmuRb5zQqP2EPwi9OVPewQztKrVI2DaWXTOcaW40RdGI57pjYFB4JfGITafaYuIJ2I0xdP4s
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 17:39:08.5965 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cbbcc92-8d8f-4b4d-9c74-08de9f03b9fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999123
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/lbRSqAwt0Omzs842DJPj8uwJ3+MzftUkOnav78Ctg=;
 b=S0G64cBIPPc7yfTwYmNAwhDYFGzL9ifMywlxSzPCuaN9B89sseZvhIEOz7YF81P4OFxTLs5B8Ly1/Q1jXElB9I3A7FJe16+x5PEZ18KiRm1/66q6/ElmrcxTmxD8N7Nik2GPb5K2U2JDOJgCrz1pVbIX76dBnktYp8XjHkAKV2U=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=S0G64cBI
Subject: [Buildroot] [PATCH v1 3/6] configs/zynqmp_*: bump to Linux 6.12.70
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

Bump the zynqmp defconfigs to Linux 6.12.70.

Run tested on a zynqmp zcu102 evaluation board.
Run tested on a kria kv260 evaluation board.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_kria_kd240_defconfig | 2 +-
 configs/zynqmp_kria_kr260_defconfig | 2 +-
 configs/zynqmp_kria_kv260_defconfig | 2 +-
 configs/zynqmp_zcu102_defconfig     | 2 +-
 configs/zynqmp_zcu104_defconfig     | 2 +-
 configs/zynqmp_zcu106_defconfig     | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 08a5714387..7f2449cf95 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.70)/xlnx_rebase_v6.12_LTS_merge_6.12.70.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k24-revA-sck-kd-g-revA"
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index 85caab689e..2372d3b0f9 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.70)/xlnx_rebase_v6.12_LTS_merge_6.12.70.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kr-g-revB"
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index d5bdca42d3..aa5724e942 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.70)/xlnx_rebase_v6.12_LTS_merge_6.12.70.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB"
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index a0c99ac01d..f501846c23 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.70)/xlnx_rebase_v6.12_LTS_merge_6.12.70.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index acb8721225..9ae2093829 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.70)/xlnx_rebase_v6.12_LTS_merge_6.12.70.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu104-revC"
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 9caac719d7..c72a33a182 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.70)/xlnx_rebase_v6.12_LTS_merge_6.12.70.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
