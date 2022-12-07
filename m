Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2630FC352A1
	for <buildroot@archiver.kernel.org>; Wed,  7 Dec 2022 12:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C408F40A01;
	Wed,  7 Dec 2022 12:49:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C408F40A01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4d3qBzJhqsfR; Wed,  7 Dec 2022 12:49:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F44440B69;
	Wed,  7 Dec 2022 12:49:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F44440B69
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B3F561BF4DB
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 12:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B92580B99
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 12:49:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B92580B99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qgaZ3ZdBVjtb for <buildroot@lists.busybox.net>;
 Wed,  7 Dec 2022 12:49:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B83580AE7
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::60c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B83580AE7
 for <buildroot@buildroot.org>; Wed,  7 Dec 2022 12:49:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aF6glwqJPeNbCEMaPsP183uaGeeibteTaP7tDdNeXRHJT9C0hdw6ujUAA1tn48B14/erW50XkrquqIDxIp2bf3uKstxkuL5lEYJPSdKbM34X5B76gyeD6R1m9+BEb9rGjfkC8Wr8ad1drXe2YFead8uc8JZh9+FJyyePQi+HxkPrHoFK7iYpuMWl+kMvgNoGkX0k0PA4morr961jA9W9MNEi4RNkC7JAFRbJbjToiuSTzs22wRxlEdQRtRNKNiEu/Pkvr7Wdf1nrDnUmaKl3q6kTfH9ZWifg8ojL16v0eyArKY/xjfytIr5W93ygVSTydrLSAATJGePf5AKQ4qDR2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TEuF07H7JxHt0/OWDowDo1e12RK3XVR3VwWpNco/nDs=;
 b=HaNZwPUEhlw3eSLQVNBLs1wbtVuitB0W1ZzZYPCKu57sPg9lMSBaVWB+nhqwQys/WCArV0iNWLQdEYnFg3RuW3ecFu6ajMMz0BEeYZytkwIATFgKfGWMnsH1rK79UBDADE+Uagj6X7JM6e+MAnRb5fV3oK1AD7E0HrFeeuzjoEXuIQ+/DPtuv12Mqax58TMX03LPTXaI+is6gzBjrHdymBhRddGBASm5kA+MkXzRGN6yiUUr8clRPTw3kGwabWKIDufZKMvLgd7So3g0TYFVXfapehaeOpXr5oolgkGxkMcoafUrI5ozETRo0HuQDDNFqigTgbgzaYuIGt0C53h0fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MW4P222CA0008.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::13)
 by CY8PR12MB7196.namprd12.prod.outlook.com (2603:10b6:930:58::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 12:49:12 +0000
Received: from CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:114:cafe::89) by MW4P222CA0008.outlook.office365.com
 (2603:10b6:303:114::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Wed, 7 Dec 2022 12:49:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT011.mail.protection.outlook.com (10.13.175.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.15 via Frontend Transport; Wed, 7 Dec 2022 12:49:12 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 06:49:09 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 04:48:59 -0800
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Dec 2022 06:48:59 -0600
To: <buildroot@buildroot.org>
Date: Wed, 7 Dec 2022 05:48:55 -0700
Message-ID: <20221207124855.1831-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT011:EE_|CY8PR12MB7196:EE_
X-MS-Office365-Filtering-Correlation-Id: 09d61946-4080-492a-8442-08dad85170e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pc2bj1tXeNdh+DHkeGubTMAUqeSw80aPbYO9tWKdHur+c6msgLKtbQoXVf0PrFmGoGjw22WNJVuFzBEG8/HW+nnl4viVHvTq7aQB94JccJ0FkrS12tX/8x2F5QA7yZcho52IHG+buA1WHtLSq5eWZjgZiY9balY/k4NbPYmiPwV6+ZROi2bSIqMyNsKBDTBl5lsR5ExMfxGKN8jprKt5zc1nv+4tYpIT/wWiL/jOu+kJ8RTdaZ3IpgyU2KIdVkLunr1eDMcrHFAXdYhYl5FrQ1MQq3T4mu5/dwK9BoLFHLqgzH9daQ/+Cfx5w2KEyoRJdK7+4B7ZWCrmvEcrVrjy15BaSwNjlJKPAgfjEnv7BnzsFnuZs/laRY/V0cqXfAp2QP0esy1z7JUO48aFE76e5mM4+bD6iir4x2UG8APG4pG1wC4SXEtPLsOK20U2nS0PsNDqJhR23s6CSeI+ayaKM6dFQBJyKwuOj6e4zJxu9l/Nyej/KMEBYL3iDWqxB3YKK+tDIx7Y+G1JRLHPdRqzfMgDvL7SwwJXQxMTG6sd3ClTbRreb4dJ5Q90rG0d0LW2nMbRXm+kgWimMMHcBplQZDNTug6XNl4Wcovji4vYpn28tNROhV7ezIg9jPXgzDXM5TCTeUqiFbGqlJS9toTjeOvjBdeHW2TapTZG69ktzhrepWOkED9nRPlBsMaj3iqpS4ETXnQ5h6f2DPGADQ4U/6nfCEKVGDFOfEQRfjB74s0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199015)(40470700004)(36840700001)(46966006)(86362001)(47076005)(426003)(26005)(2616005)(40460700003)(83380400001)(6666004)(186003)(40480700001)(1076003)(8936002)(336012)(5660300002)(36756003)(4744005)(2906002)(478600001)(44832011)(82740400003)(36860700001)(6916009)(41300700001)(82310400005)(81166007)(356005)(316002)(54906003)(70206006)(8676002)(70586007)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 12:49:12.2471 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d61946-4080-492a-8442-08dad85170e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7196
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TEuF07H7JxHt0/OWDowDo1e12RK3XVR3VwWpNco/nDs=;
 b=meUpvqv3LHtCxsf8nqv1pZMxCidGzzclrK+nPFIx6NJowW7PL8PDsT77uNj9kgibYcukuz/FtWVq/DWiwxerAYlTcwMikWu9VS7fOM5iGM+o1VO/au8Cc+hlYYOJBrdtJQDtkQOwGgPrObz9YLSLNrESXpLsZNMU4F2KEO9cNQ8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=meUpvqv3
Subject: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_kv260_defconfig: fix
 linux dts name
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
Cc: michal.simek@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Linux DTS name has changed for the zynqmp_kria_kv260 with Xilinx 2022.2.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_kria_kv260_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index df01ad30b8..aef67b3cb4 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -8,7 +8,7 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.2)/xlnx_rebase_v5.15_LTS_2022.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/smk-k26-revA-sck-kv-g-revB"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
