Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8A5C54E5D
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 14:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5803540568;
	Mon, 18 Mar 2024 14:03:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nxb6rsU9xJ6Q; Mon, 18 Mar 2024 14:03:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55C2C4058F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55C2C4058F;
	Mon, 18 Mar 2024 14:03:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 00D811BF363
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 14:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E203A815AB
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 14:03:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NAz9g-OniWUK for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 14:03:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::601;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 386408148B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 386408148B
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::601])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 386408148B
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 14:03:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ATpqFuqcDTVuCNL55Yxz0Wz2AgTnYe2PevcUHaWgQyTPwhzOpCkpNLkCJNjbLPrbCHAMbAL3GRSO7pK2g4SQaUSjihwk3eYLPDWvm+QYXv6jznq+8PlVF82bLqV+9PriTSKt0tUAgPDvqIY3BhKVOl519kpilZf+b42kCAmYbbG1LsjqMcsWv9JuZjNTk4isEQ+7HrrdR8l+PEewOB0u4tvOI4GtHqhJuw7gkMtzO6vlP5TELLzSYKQYR75r0pJuTMF6fqCTiMTuDW+MoUE+tzJbKuQ9RL9QOe/3yLIGVPcxQBBSun5Qxx+Qkk8xCpiDyilEy4kSdwTTfy1J5UIOJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/e+5Yrc9hF7PGdqlKYakhqsenronGL3WQc8YwNw015U=;
 b=YChZWLiPhMETpOlEM5FvSb8TrGVOuoN+RgSZO+d8G6iy2mjN4S7RxHYqf4iji4ACRmom+Rqyji2n3/sLqzlE5sxlKr4vpPCtT4qTXwH9dWeAomT2Vcl+LXIHI3u/Y23DLZiKdtu2L5aABjFkVCErvI6yxemBgxhtO46wDlpkdQVDSnzDRk6JeNbDzHP16N/LpD2vF/ssT0//IoKGt7j3FG51DFKgupVBmzLTvrllY3aWAoJ5OQnzljVGakPfszZbjPDbGim/5Uf+XHYkI2N65zJUO4Jnrny6S22uBjvHJrJslbJBhvDyekpilA8U5AsnQxBDkt1Uvcq/1aUSh2Dz0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH0PR03CA0014.namprd03.prod.outlook.com (2603:10b6:610:b0::19)
 by LV2PR12MB5800.namprd12.prod.outlook.com (2603:10b6:408:178::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Mon, 18 Mar
 2024 14:03:14 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::12) by CH0PR03CA0014.outlook.office365.com
 (2603:10b6:610:b0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27 via Frontend
 Transport; Mon, 18 Mar 2024 14:03:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Mon, 18 Mar 2024 14:03:12 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 18 Mar
 2024 09:03:10 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 18 Mar 2024 09:03:09 -0500
To: <buildroot@buildroot.org>
Date: Mon, 18 Mar 2024 14:02:56 +0000
Message-ID: <20240318140258.1083375-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240318140258.1083375-1-neal.frager@amd.com>
References: <20240318140258.1083375-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|LV2PR12MB5800:EE_
X-MS-Office365-Filtering-Correlation-Id: e2585148-5b21-445b-ea40-08dc47542665
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ormO6j53r/3fWpLfCgOoOxCyS2/x+971gDTuTa88oCz+4dox/VPh++GiESZMraOjk2t0295GTJntfhivwW+sdhovqn7xC4Jf13+xu6BEs+wV/Qg8R9fpYKrIhrtsrAbT9SXez7RbwPl5/cPgpWo5BcQURKE9g/XWyWwjIfT8fAv8HUe0vkJpZVGFb66qntCHOt97pKu2nPA3Q2kAuAwGzOOJLJXYPIjEgy1H7r/CNzy8R85meQtsLkFTky3tduJ/espRZVXSUgkXvN9XCqKTVyQFRuW3JmvrLnsMtlRT7o7rdOvIs2OtYyaHY4iG4jvuoRqY+6UT0JG9XJdrccve5wehkaAMbE61FRuAsOA3YVIM2mT6CVyA7L/s/IQnksXE26ZnJeJONe3D3/284jBOAcUWZhrz+1pW3QnYxYVdcown2lI0uxxpU3xgU+QbbJVGwr+gObATpO04VIVQhTJaOLxPBapxT+uJ5Orwy4o5KGwKEB2ZZRLpEfX6Ay4U9ANRAmYBTuDPIWg9kNg0WjhwIS1a296gDUwLzrTq/KoqGZxoQN9zNwaD/TTuP+PCjLLUdZ6ibLG18bwo2toGy0JI/Sd7+sKm5qmmDmHNL/+O8ubxHbNMzQy6+T+Jj5WejlEiWtDd6MRcbZINt4Ro3YbnCaZyO96QyqDyxOQGb360MC9u6QLcsi5qpuuQhU2iNgyWetDjWxKsIT6Fat2RQe637dUwCUOy7WTOzarYCzi7UINt0hb7tBo1ZHJeiO4Rooxy
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(82310400014)(36860700004)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 14:03:12.6337 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2585148-5b21-445b-ea40-08dc47542665
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5800
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/e+5Yrc9hF7PGdqlKYakhqsenronGL3WQc8YwNw015U=;
 b=y3iDDGY4ysmBILbF2ox2nnsJoeJH8s5BoHmMHt2s3Ukqnb++fmSF+8lkxqp57koPwlXkLjjoLCBhmgAji1xjdq6V2GqvLr2/v4QIGFu3bhf/mJ3rw6zeVZwNyy/Nbqz3a/PzwZDWCX7yKQ3cx7/uhsuM09ep6+3la1pbgHNG0Do=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=y3iDDGY4
Subject: [Buildroot] [PATCH v1 2/4] configs/zynq_zc706_defconfig: bump to
 6.1.70
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
Cc: thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com, luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynq_zc706_defconfig to Linux kernel 6.1.70.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_zc706_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index 3489f864e1..ffa734348a 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.2)/xlnx_rebase_v6.1_LTS_2023.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_merge_6.1.70)/xlnx_rebase_v6.1_LTS_merge_6.1.70.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
