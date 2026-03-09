Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961C3EF36FC
	for <buildroot@archiver.kernel.org>; Mon,  9 Mar 2026 07:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACA0F80F6B;
	Mon,  9 Mar 2026 07:51:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UwSCIZwznH5x; Mon,  9 Mar 2026 07:51:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9A0980F1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773042709;
	bh=A2RN9CyILVQ4BpZP0E5dyiThiNP1gA1fdHChyYnObME=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=o2C6T4RQvvhQE3ZzF1pgVXPbIJYJveXW22TJDKtucV9v1wfnoCgcF9G2H3OsAFsF9
	 l9euRVy4kXvCZX8ZDsb8JvKu1TIhZ7ACgENo6kW5qn/CfxDQ58LxVo7WkuKZ71yDqQ
	 ST6yHLhK7hJU1TBYo96wq16JhXq0sxQ/dlLD+oubJUxu1Gr2Lqc0DP9ZpdYh5oKuAt
	 f1MbjCJcpyG02oJCwoeN/YEubXUDBpbDl4QhP326druTyt9qLEnr4b/MxgPFvLlavA
	 LnOn0JxkvAewlzbU38xl7oP3egDPl6BgVLYPNWgAlpJhBfYzTQCrfdXfFA/lkzQ07A
	 3IMyMyR3zwUwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9A0980F1B;
	Mon,  9 Mar 2026 07:51:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 56367158
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 07:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5412340542
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 07:51:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Otx-zD59VBPV for <buildroot@buildroot.org>;
 Mon,  9 Mar 2026 07:51:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c107::3;
 helo=ph0pr06cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 46F0C4053D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46F0C4053D
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c107::3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46F0C4053D
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 07:51:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+430md/LKVl8iyGo/8PvcMFe/qXL+FUDXoBYwsOobdfHSXAyU+l7l1ZJQFkNgt5ngvqJoKWrCy+lIWib/BMgw7tUTZDwzvVDbjCtQ94MKrMZexufnl0vQL3rhXyL1PzFe9LR0CWdl6wgKXLPSHS3CtD1NzhWPGcNluNuo7E7wSaBl0rtVARbb8kPg9GYrKDiyFSD3FfrL9UsifMd2y/krhCCYC3QSW8GDKl2pSatC8rHB/NTOPrERKkuBVGUDOYwJ9sP9ZzsCgd8AzCXvHBjuqlQtx+bUePylRS7Yg47bAS7NmHtY7PGjP0yhPjZ2pJqZlu8WrJjwROGWJ3zK4KzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3KwWVjqyI3XqRigyoi5e+lNoWceSMQaS0/tlKf4WNU=;
 b=KTGl2QVwWCw6mj6v7feZh3737+01rIHwEaJ7tLlYB2OtasFBkeBpWEQ+ztm3zwsO54f42NC36ZamNCTkNJgcpAO8pLdjdbCMdr42ClvMV7g1hM5XYAMiui5fbwmg1h/1FqP0r3ePxkzgUL2OVUtC2KTR1ry0RWwLEuX28sMo91kWxENNHrJEuq1qPCABvrYWIn06YLjmvw7UKmrva+bVpWajlnhDqauT92ndsrrXEKhH0BYLUdITcvcAATv8KMtM7jJT2lJcvzSczJVLaguWWta40vhl9edgY/fIXu6bsTpP0DNuVI3TXZTc/bPu10EGA/ZUw0v5IdvS01XxgTFIoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from PH8PR15CA0019.namprd15.prod.outlook.com (2603:10b6:510:2d2::21)
 by IA1PR12MB6459.namprd12.prod.outlook.com (2603:10b6:208:3a9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 07:51:41 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:510:2d2:cafe::38) by PH8PR15CA0019.outlook.office365.com
 (2603:10b6:510:2d2::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.24 via Frontend Transport; Mon,
 9 Mar 2026 07:51:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 07:51:41 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Mar
 2026 02:51:40 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 9 Mar 2026 02:51:39 -0500
To: <buildroot@buildroot.org>
Date: Mon, 9 Mar 2026 07:51:27 +0000
Message-ID: <20260309075127.801847-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260309075127.801847-1-neal.frager@amd.com>
References: <20260309075127.801847-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|IA1PR12MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: da9b4348-f30b-43f4-a954-08de7db0b36f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|82310400026|36860700016|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: 3BA8kZ50qRSGDWwmc66nd7waLw7JbJmm3HIWb7HZjFnUi/hRopzX+MQqtUyWAvtIXjRFg2dzp5WAJyLzJ7xFHs90hFYwP6MM8KhBkhnZTvG7MPoLECfzg7vfBDQbjTajTmE7/SJp+Ang+J1RjkbC9jK3PXTz0VN762Vn2N6xQSGVpUH+0CCui4yZfQol5GWsaIeVSv2bAgipHXPz3cOx2GdheeOD/bWyPTbvDpz9SaQiuEJR2VwQ7PCRVye0WgY3U5oMv0t3RMo5L3kqgaaU/JG2LUnVe6G6DDxz60iN/Adx/up/2YKfKbv9Ai0mxJzlT2GguViAjJxbeX3OMz9W+EXYpEnGc03He/t/vWt4NUt/lVyGJZ9RcSsqXKcvLhsT0+/tyorzbV9WUQRxGEtFpArwg1zKtCTbHjvyHltSy2MouO8ap74dzlPJzEEZIDkw9lO3Qjh7jmGyUk0xw7VbSCca3RBu0fSNN73N88p1dMBaaZvdIDdY4aGvQocIaFfxYZ77h8qyK8Ex4NdhPE2swHgeuhUwebiyvFFvBID1o2R+/6RCnPoPRKCev7hJ9tGg6xaYPIuToelP+Y9rSxskkYsCv/X221SpTDZvfeGmqpMMOtbKSo67ttT6UnDs1Tp1Btj7Hjt6l49/tcbJ6KBitVWyq9cW6t8I1lptVNGyuKFBbOLeDiKuK5qXv8j1g5jGX50M1gGD7xtYUuDexCFndAHyqATqw41lbcnVv4zFKjJblBkgUpZm6NErySwzUjWNfzv1BWms0qHsH0wvNZ05YnrcfiKQFwpt6Egu/7DcB0c6p0leHGh3g4THUmh2vMRlj5IM9QNtRSe+8IN4jvLVnw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: je51CevCcMOwEXzPYyVt0y1PiJqpZWGrVkW/cndCD0hAzfHBKlZdEsmzQtwAkvQdja79x9u79vTSjMRY1NLWmFf8TXzPG7S+GPwPbaITMx+KFlswainkBkFUqumnauWqr6pKPzYZlLtAtVpgI1fnbJXCbBt2+Vq34f15CRg6k44WAkKO2BAm6m6C71QDAh4n6c5exYHatwKx7q3mdRqE2qEex7yfbKZ9p+FD77gMqbMFKq4b7pkdfkrBDKBnny8vzKCfew6F+pey54Ax4E77t+XojX7o45yeVE/EEeBCbNsslLo0TGtx713brpkHvGZKjRVb/yZdD6cQ819EjHJW9FV4msqxHo5kGwe3XI59FO1ZfxJBWmdtx2OkM1Qhm/vPN97u3fxRb2HyfbVYEE95V4evpcwq/mooZudpqGk92ZEKvNwJLo2J8BDr1gd/48jJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 07:51:41.0466 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da9b4348-f30b-43f4-a954-08de7db0b36f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6459
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3KwWVjqyI3XqRigyoi5e+lNoWceSMQaS0/tlKf4WNU=;
 b=M9Lhl1oFo+oag/ks0cCHlq05KV7jJIT+H97vV2UMyuWK3GOAdcgX+b/mFSnt8V70m7OQPo7UxmbZ79TPo3I/ssjYq+DRD1Qoj1PqjghnuNU4J8PUzXwkMFOp+0wmgn4Mua6eME3ZPrzKR/0vRzzn1y4lJ/cewhZjt9xuo/WikHg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=M9Lhl1oF
Subject: [Buildroot] [PATCH v2 2/2] board/versal2/post-image.sh: add custom
 hardware support
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
 yann.morin@orange.com, brandon.maier@collins.com, fiona.klute@gmx.de,
 ju.o@free.fr, Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Users will ultimately need the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR config to
import custom dts files for custom versal2 hardware. Improve the post-image.sh
to support either the default device tree which comes from u-boot or a
custom device tree for custom hardware.

To keep the example post-image script as simple as possible, it assumes that
the first DTB in the LINUX_DTBS list is the one for creating the system.dtb
filename that u-boot will use for booting. Users are free to implement their
own post-image scripts for use cases with multiple DTBs.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- new to patch series
---
 board/versal2/post-image.sh | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/board/versal2/post-image.sh b/board/versal2/post-image.sh
index af50909fb1..dbef33db28 100755
--- a/board/versal2/post-image.sh
+++ b/board/versal2/post-image.sh
@@ -1,9 +1,17 @@
 #!/bin/sh
 
-# By default U-Boot loads DTB from a file named "system.dtb", and
-# with versal2, the Linux DTB is the same as the U-Boot DTB, so
-# let's use a symlink since the DTB is the same.
-ln -fs "u-boot.dtb" "${BINARIES_DIR}/system.dtb"
+# By default U-Boot loads DTB from a file named "system.dtb".
+# With versal2, there is no default dts in the Linux kernel tree
+# because the default is the same as the u-boot.dtb. This means
+# it is necessary to cover two cases, a custom dts or the default.
+# The BR2_LINUX_KERNEL_DTS_SUPPORT will only be set for custom dts
+# files, so it can be used for checking which case is configured.
+if grep -Eq "^BR2_LINUX_KERNEL_DTS_SUPPORT=y$" "${BR2_CONFIG}"; then
+	LINUX_DTBS="$(make --no-print-directory VARS=LINUX_DTBS printvars)"
+	ln -fs "$(basename ${LINUX_DTBS%% *})" "${BINARIES_DIR}/system.dtb"
+else
+	ln -fs "u-boot.dtb" "${BINARIES_DIR}/system.dtb"
+fi
 
 BOARD_DIR="$(dirname "$0")"
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
