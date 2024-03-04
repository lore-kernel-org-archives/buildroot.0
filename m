Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815AAC54E49
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 07:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5438F406B1;
	Mon,  4 Mar 2024 07:42:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hl9ITrSTr6Vl; Mon,  4 Mar 2024 07:42:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 686FC40818
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 686FC40818;
	Mon,  4 Mar 2024 07:42:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2CF301BF280
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 07:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 130F940167
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 07:42:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MNb7SUR7ijQe for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 07:42:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::600;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BD97C400C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD97C400C6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::600])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD97C400C6
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 07:42:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJ9DQRqogjrVsJ1aZ9Ww9/6C20/RO5RzONRWGuCGXW++eHqTf/opj4wUgQbVRmzcjUd4GPrphRnpkHQnJ4Eiht+SbQYXEFrVwh4tpXB5rn5DOR3MIqrg8by+aSqBQjrdd43F4ge9yrvwQVqtEw4BAipJDcJU3tI7AqDlpQfcCpF2PHBYIaDhOJIfiFK0IfnqjLunmkeinRjyTk3RzQTIN4bZXpdwPPrMINEbxpHWbJFDiXAlApOMnz2ekAXiWPpIais8vB1aq3fVMeAoWkb2EtxLLjpPDHMbhdYBBHMA6fWZQumDTqjT/OGbBTN4hMnPCwLINFnyrAoCYyO9tAommw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hFhqssYgw4h7WQ+SKfhNYH8efAjJtk3vXtgWkgK6YJE=;
 b=bmZXOzC0gOWxO9alUkPondsMOWD//vEI0ZhUR/quCTvR+qlQ0ncgUX4o9ptJjEvjpii7jSvG4JfmQ0+Qfh5x1oPS5+fDj3bX1FbwPaYvDv0/xp0IldtqkPJc+TFKtSE275nzUR0olOJe9vM1G3i+Ng59fIPaOEUHue2WQrPXuPHFM9tV4UvOzKevbuB74MULVdp/yVUVmGR/XwCr7ss852YOCfbrnO/GycO9ZOXuOUs6NeZW/Kuhc/AlSJejXsCxURPcRduVychGbNrdCNkgKkYq7X1/fr/a4SLa60XY7COjkvZ+YibqaMTJhdYriUqvFtkzCy/aP3K+/B5XhvXv2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DM6PR07CA0073.namprd07.prod.outlook.com (2603:10b6:5:337::6) by
 IA1PR12MB6115.namprd12.prod.outlook.com (2603:10b6:208:3e9::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7339.38; Mon, 4 Mar 2024 07:42:15 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:5:337:cafe::3d) by DM6PR07CA0073.outlook.office365.com
 (2603:10b6:5:337::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39 via Frontend
 Transport; Mon, 4 Mar 2024 07:42:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Mon, 4 Mar 2024 07:42:15 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 4 Mar
 2024 01:42:12 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 4 Mar 2024 01:42:10 -0600
To: <buildroot@buildroot.org>
Date: Mon, 4 Mar 2024 07:41:39 +0000
Message-ID: <20240304074140.1537910-5-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240304074140.1537910-1-neal.frager@amd.com>
References: <20240304074140.1537910-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|IA1PR12MB6115:EE_
X-MS-Office365-Filtering-Correlation-Id: bc98b9d7-6f72-4fcd-64d8-08dc3c1e9c75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bBCAFhR9PPiY1kG9rSsAvgj/uoygDuAMNhDnsPJEFqH0piKIUsrlShc8C/ZSXv1gBruMyGu5M0UPCk7mhJv0HN8kjXm6AM6dNlaDPI4qgyHMDz3D5BohjaRV+2ATxny6qMhGH/g9OVUdwcYweDC562goLXuYvFz7ycUfncs5ja5Io5uT60TTwa2LOIcPKPfL+TEaSbJH4kZvNRXZZuo4aNHmUitBY5SXoUUF4rZG7+QNn6BqLkFT8ZfbYqUOxtzzP4axRnnBZDbpMU4S/HEbm/0Hf/iCQ3N1A7USVVJQy8gKYSPKs2S3vXxl9ohHGo2bm3k+jTztovoSUGE6+sIPfuZHIM46Bk88hU6vVrrGVESp2xW/qsWsQ4LUMwAyJt80trGGJVBWMTCRnwzD5U2Bx34jeZBBA60TfB5ZKt8nCOfELvu4xJvD9TFMy5yC8BPOn8CJptBbRiel80lvEzBhlcvM4U1Y3JnVRrWYSsyQUpQxLz3ktcYOXe57sqDyHkyGvHA+nOHfg2vQBvayybsAgTTNl63aD8JS8EU7677VShYc4S1DchpArLpgCyXqwnRSwbtY0v8Q27Z3HFLjZTGxS1ZdZhbb5/pwCpzecWjrgpaGRQPLBBy7aoO7SiyZdLDsR98+5NIWFlvA6K5IF8UtXWa9c0u4wDNNKUT42DUy0FYDm1PB/r3IChg1pGHc4oZKMXFF5vrhAsR59u+lctgRHg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(82310400014)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 07:42:15.0454 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc98b9d7-6f72-4fcd-64d8-08dc3c1e9c75
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6115
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFhqssYgw4h7WQ+SKfhNYH8efAjJtk3vXtgWkgK6YJE=;
 b=CV8QggYjNUODcYcpwBwEuwKlkWfjSG2wXMDn8JF/rlVL3emLpM3eLQk9H2d8Y1ZORVJSVEYNuCUQxVVbnezN1vuYIRCOhNGS8g/du9t+qUW9vVeqiyhxRkzb9l5G7+OCWJDmtaIzXLTXx2fRTGfSbPJxCYAxR4Dg6vWACv+szr4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=CV8QggYj
Subject: [Buildroot] [PATCH v11 5/6] configs/versal_vck190_defconfig: build
 plm and psmfw source
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch migrates the versal_vck190_defconfig to use the new
versal-firmware package for building the versal plm and psmfw from source.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V4->V5:
 - bootgen is selected automatically now
V5->V7:
 - no changes
V7->V8:
 - bump to xilinx_v2023.2
V8->V9:
 - add BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH definition
V9->V10:
 - no changes
V10->V11:
 - BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH is set by versal-firmware
---
 configs/versal_vck190_defconfig | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 8561b6641a..d59e23792c 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -32,11 +32,10 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_FORMAT_DTB=y
-BR2_PACKAGE_VERSAL_FIRMWARE=y
-BR2_PACKAGE_VERSAL_FIRMWARE_VERSION="xilinx_v2023.2"
-BR2_PACKAGE_VERSAL_FIRMWARE_BOARD="vck190"
+BR2_TARGET_VERSAL_FIRMWARE=y
+BR2_TARGET_VERSAL_FIRMWARE_VERSION="xilinx_v2023.2"
+BR2_TARGET_VERSAL_FIRMWARE_PDI="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.2/vck190-versal/vpl_gen_fixed.pdi"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_GLOBAL_PATCH_DIR="board/versal/patches"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
