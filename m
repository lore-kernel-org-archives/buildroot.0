Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A963EF8FF4
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 15:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C226560811;
	Wed,  4 Mar 2026 15:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I1bAUQdgIZNw; Wed,  4 Mar 2026 15:21:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6360D607FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772637687;
	bh=Rjf6EVsSRcwDW8BPeq3NjYANgw72faUWyGWj5/pD19g=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=dhOFqlg/Y8TY/On5frQL76Tm7iBbyESWwtmX7sP1D4hIKFg7PuiA8ZQaauNJDx7aV
	 VqTSUJFqL3PsGMEu3c59F/AjygnJ4UkS6MIlZK+6rUSDO8sZQunyulFoMGy2IXCZ9S
	 H3/x7+1F/6ohha+etoFmdLLqJPgd9SqCuhPBZ72G1Lxp8HjubE0JOpb4lM3A9/bQxi
	 v7JO7CSuc59gyov/yiFnjnG358UzqIzbAZGQBNRNN6/c2DwrgvvvC8oKhyRtKwmirF
	 CUwmhiFbs7Zc1MN3zwViL+yLhpwepgiuxfIaxB2MFFWs24wHzU2twhZab4Dn6lltD9
	 z0JXTKXuVY3rA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6360D607FD;
	Wed,  4 Mar 2026 15:21:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8670D231
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 15:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C4C440447
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 15:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6DkE2H9atq3I for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 15:21:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c111::9;
 helo=dm5pr21cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A144140434
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A144140434
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c111::9])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A144140434
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 15:21:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LC/wbxL3LJsEXKlRJ9cXKaMycM1IOVNGd8BO6PE24ZOrrW24bQSz3SPMzpJ8D94d6NuqqKll1gG0ch0B4LwZYosNgXBuhkjjBJxphaU+Ri3zKG5XlDC7AYZyWsLxUb8aujj8uQD+KPFVHjXRInNyFNFlFx0Vji7LmtizmRMeKYUSwGe3BnPwLdangdARer/keZGoSdY3wJmVyAkxqWXu5Tg67Ijs011BG+2WE3ynC4yYdmU6MbC18B5KgkGpa4sWKCzxmcg/DBrQIrscK5c5XpSV91DUwkTTZKCDN387yw0xNIEK+QohqwyqXWJem3o0Kz/R3qRkAtyti1lOwq1Xwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFcw53dy1RNJVlLb7ifvQbpcO9k9agrYT3A1Bhaj/2Q=;
 b=ZPpIIVRCTf4NeWfg0W8su4xUnnUvlT4QkwyQdI72JlMHtTMcUbIsykQvW5n2n7EmtJgy0yJ819EDsX2YXYb1ynswlb2MmQ9p3TF5i2I2mmP+w0xB7CAAQXHWmeshUh8Yd2cytxaMGR3nKKq/P5BV+1ilwoVzIpAa6e3aNKvqZQa7ZjVIfCO0y2e/dSY9dZfjPVof4bWMwjw0FcSqycgQfGkL2NEwtgBnBtx+VTZXpdz9axqjJ7u0r4QSR2YTcIgN5cxkaN6fSSgt2t4dEPu44Oj+00G6HN08ta7V2EzUnTCJYW+KQDUormM4F5roeWwGiQ/fIshEA+SFkWBtwdvW2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from PH0PR07CA0102.namprd07.prod.outlook.com (2603:10b6:510:4::17)
 by SN7PR12MB8148.namprd12.prod.outlook.com (2603:10b6:806:351::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 15:21:18 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:510:4:cafe::11) by PH0PR07CA0102.outlook.office365.com
 (2603:10b6:510:4::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.18 via Frontend Transport; Wed,
 4 Mar 2026 15:21:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 4 Mar 2026 15:21:16 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 4 Mar
 2026 09:21:03 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Mar
 2026 09:21:02 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 4 Mar 2026 09:21:01 -0600
To: <buildroot@buildroot.org>
Date: Wed, 4 Mar 2026 15:20:56 +0000
Message-ID: <20260304152057.3465672-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260304152057.3465672-1-neal.frager@amd.com>
References: <20260304152057.3465672-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|SN7PR12MB8148:EE_
X-MS-Office365-Filtering-Correlation-Id: e0693477-f31c-4fa2-54c2-08de7a01adc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|7416014|376014|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: VrPPITTwBR6pdn7CUwvSu00TYjkpeyNMn8WFlXzplPHiD+Djx7QuASRrl3YZiNWxsjiW8au4kD4QjEhIuIGR25tLBZvV8WsVo7JXS4qyitQeVkZ+4asmIkaKQRuDnIdvrqK7HXF8MlgaBrAYlchjuL54Ca8XII9st5E6YcxIY/i+nIgiEfw8sAC5tmqwQ862ZIgr48d40kupxdE/lffTNO8us/qZMzO/8t7lTrN5clJcO1oybRrEDSn9apRS2q/0sHx4bSbtoh/1qtM78y5aEzYBsWh+14NuPaTFLtbz6w2f4rr2TPJ35IlChBfhvO6wqba542yhOFHPLIBpXDgJrscJqXHFL8U+b7/XqT1Ras+l9bivcuyoCo64po7wSjfCrU9n0MyyhzgKkIRErwBJEXbKXqRekOuP5vAcyZu6WoEk9cLOB3qs/Xfn4WYXhfzK07RIo5Sa//aDUPOqD4Lf04E/33H3JDFgJsz1ALbzg3AK1+H2pErHndu9ilzDrQBLcBArvX8RW0JxLmfDKwjBdzb/GRHX6S4G4S0SQIvqFlNeG8tNEfu4wUfKR7+Fm/yP/RPMu9xzCnIc+V4XN+SF5CgvAo1hXWN7H1L1VT7qO9Vc8IZL76mUkO+ko2lzmihsnm11svV2swaR/towlBwuGxMBhlz9+hAvboOME6SDxgKmA2yQMP2cgak7olQOE++6n4oD8AvI+6Yne1WNa+uvewc2BmCBhbdP5/aEdemADMBE3wcJLPhPiZmdM4f9TbpgFxUEsKffoG3SbU5iGq6UEAVPFga3CTs6lvy68E7ylWxMzM0/KsZles06/Az0CwNmcX0JFy3H+6QBN9IfsI9AMA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(7416014)(376014)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RQPoomreBTuwXJcmXFnjtjYgjD41K2byaxC7ijf8IXwXrqBB2JpR4BubaO91FF44mtODehmebmWRK9SAR44I8PZYP3hz+H6twNwVu7+d+JgB0AGf14fs/TwwAwY0ha16s/BlPW2wXw+h8esL4txJhW/+aHuVHFEW4SM/uIi8stnY9Yo3DLyukUvxTNEaWyvOmkyO/W675zVgEzJ2ZLBeNceiNZfZ33IsHwBzyTnOiUXDmDipyus6uSZflA7EQsIwlgvsS0Qm8UyDnHn12fzSaXXjKZRWpm+H2fiVFs1a5wm3ER2gNzFOBlt1s1lHou6I43kqYB72HXoJCFxb7HgHFcBF82+VCYPUvRXNISa+ib+XqpV/W0A3Zy5brZdfVPOpoA3Nw6/xrnP9R4PM20xhEzOGG8Dfq53od+C//uU2QAb9yahLN7GKaXrzrrwquL3V
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 15:21:16.1162 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0693477-f31c-4fa2-54c2-08de7a01adc4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8148
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFcw53dy1RNJVlLb7ifvQbpcO9k9agrYT3A1Bhaj/2Q=;
 b=v7Mi3rr+3cxmmkctIg/jyfX0edNRTgp3a8PW8fIBWnJTBjiY++KL3CJ1aXDjTOW7EQEWwT2HgZSXcz+mJrchIqh6asMoxmTcAxMJ5M5FrDbqOwl9XAyx2ihDBHnoJsZxJvIn60OP46LF9tGf1mcKLJ2+EAzBLLIQN/T+K0yvw3g=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=v7Mi3rr+
Subject: [Buildroot] [PATCH v3 2/3] board/zynqmp/post-image.sh: use
 LINUX_DTBS variable
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

By switching to the LINUX_DTBS variable, the post-image.sh script can now
work regardless of whether a user is using BR2_LINUX_KERNEL_INTREE_DTS_NAME
or the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR for custom hardware. This simplifies
the transition users will make when migrating from a zynqmp evaluation board
to a zynqmp custom platform.

To keep the example post-image script as simple as possible, it assumes that
the first DTB in the LINUX_DTBS list is the one for creating the system.dtb
filename that u-boot will use for booting. Users are free to implement their
own post-image scripts for use cases with multiple DTBs.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- removed unnecessary $BINARIES_DIR from symlink source
V2->V3:
- ignore anything after the first space char of LINUX_DTBS
---
 board/zynqmp/post-image.sh | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/board/zynqmp/post-image.sh b/board/zynqmp/post-image.sh
index f44b66342d..54c75ff4cb 100755
--- a/board/zynqmp/post-image.sh
+++ b/board/zynqmp/post-image.sh
@@ -2,13 +2,8 @@
 
 # By default U-Boot loads DTB from a file named "system.dtb", so
 # let's use a symlink with that name that points to the *first*
-# devicetree listed in the config.
-
-FIRST_DT=$(sed -nr \
-               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \
-               "${BR2_CONFIG}")
-
-[ -z "${FIRST_DT}" ] || ln -fs "${FIRST_DT}.dtb" "${BINARIES_DIR}/system.dtb"
+# devicetree in the LINUX_DTBS list.
+ln -fs "$(basename ${LINUX_DTBS%% *})" "${BINARIES_DIR}/system.dtb"
 
 BOARD_DIR="$(dirname "$0")"
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
