Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D358F3026D
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 15:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01D6B823A0;
	Sun, 15 Mar 2026 15:44:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h0pNn5C2CEHU; Sun, 15 Mar 2026 15:44:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C45D1826FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773589440;
	bh=Itt8hCMAAItQTeXu37AJ3H321ioFFkI/mDKybGjowXQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=MvmLsE+8eQPRnvqgIIUAE/jJgGQXSe72dAsQJfKk04aoO8S6prc3lMcfeR2ZD9Hx7
	 PzEzh3wpqbiwgFsATGKfc0lfkJgxVEfugm8JYu5XhPLpzcJpnphotUbesvlNL+T4cH
	 j55HuKh3vrn3hKPSKYO/zU9IbjsHk/sZDykuu6V1mppNOqd1zi48SfrsuItLB5b1tZ
	 NJ1GOaEBg0ddejDDmVvI+vWfjoz8upcTTJgOusl6oXlEeTf7+RS9zYFYc4KViJH5wn
	 jgmWm/oBgWkkQNybACs46ERdS/AKADYGZ9uuQzfA292efzcgi7botUdPs2tWjeXIbB
	 QUKf/lkrdJSLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C45D1826FF;
	Sun, 15 Mar 2026 15:44:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A7DC201
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 15:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEC11410C8
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 15:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vr5Ouxfj87qJ for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 15:43:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c107::3;
 helo=ph0pr06cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 851FC410C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 851FC410C1
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c107::3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 851FC410C1
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 15:43:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S23bB0yYCw6bvTq4ZFVVKiOKZtQHZ0RCRzaHoCB2zebAhCgYgoMeMofcV+6PRy/AeTezfOTUjsJ9F0qOUEUuYKt626l+OQe9Y9lsKli6HKDBzvdFQ+WslXIorwxJre0ff2IsdZsorTpkYPgv8YWM1D6zpSEA5bgVsWMD9TStCIsZmDytOR/Zy0YnGnBL4U3ef6PC++1OMfaVukCwQ6yiTgICwzDv9vzmDgdsG5ENizD/LGWFykvzbt145dIyVl1dXaby+fSFVsMK7Rzjs0IwjkjXzNkfN5PIICFEYelgYzn8uIOc1QnSMjJYX5JUSHiHq28EnDftDR0pTitPsNKj2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mB4kc8HIKlCNkC1Tjc0os5xwk1SL4qzDMsH1yCS0rBk=;
 b=RL0eMcguAMQxeYeQ7f0T4wHZUrhOhxVJc3neXcMFTmc6zE4F7etZ/cHqPPAbxdrexi5+36h/+UrtHN7jDEpNQq07HiTbSdBml5UixmElJpSkZp6FBUOPfUqsi/qfDpG+By2cIjr6Okp1MZYU6sZEHYurvb6woMgzYileTXa/5xBuffZ3/hK6p2ME5rDWBnYRM5hfRyyrMy3BbbpZ9cHAMAbjjJjz9937pNNCbSy1zJmv5dmXTnQfi7Qpfg+VQ7J7UxGdkB1/hyoWAXA8SpUEgyNJAu477Wa8369ls+zS0uTSrnz/O+4OX/LFwOLcd5Fu3GYaa35jSIcEd7J9a8h/ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DM6PR05CA0048.namprd05.prod.outlook.com (2603:10b6:5:335::17)
 by LV8PR12MB9136.namprd12.prod.outlook.com (2603:10b6:408:18e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.12; Sun, 15 Mar
 2026 15:43:53 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:5:335:cafe::f6) by DM6PR05CA0048.outlook.office365.com
 (2603:10b6:5:335::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.22 via Frontend Transport; Sun,
 15 Mar 2026 15:43:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Sun, 15 Mar 2026 15:43:52 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 15 Mar
 2026 10:43:52 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 15 Mar
 2026 08:43:51 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Sun, 15 Mar 2026 10:43:50 -0500
To: <buildroot@buildroot.org>
Date: Sun, 15 Mar 2026 15:43:41 +0000
Message-ID: <20260315154343.3144013-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|LV8PR12MB9136:EE_
X-MS-Office365-Filtering-Correlation-Id: d1e962c7-3a0f-4754-ea0f-08de82a9a8be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|82310400026|376014|7416014|56012099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info: 0Rp6/UkbQOHWoJPxgtnYwzIe1NHc6PZ1clb96lQQ5tUbjAZbbG9eb5qh3yRP1NrQh2oqeRSGiL1VWF4eLiRJ9vhuDh6ONzFWkdwoUYyi608XgDe2p7mdBkcAVsYYbTua+8+JamfFyMeV5mM/OMR0gbKzEfVCimkMXdQmkD2sAKgPUG/vpfJMMmvJhrvQOh4T+A29P70UeXYEZq/zTrO4DJdbhlyKPWO86dAqAOHIp1QNNtT05l6QAgfXyd3Ur9JwDJ7RABRKrmrih8kmrFT4KZxRKafh7s1QrOjdP2X+Pg2nL0YKDzwFi1n8icfiMi0O5ESDEwXdsce2zQgPflqHyoBS1vbG28W+LNOWncq9lizwkMe43f8tOf7WbIFERfdafvc8uFB06/Hn9ya09bsruz41rySifIPA8O0uCqBll8Fy0YGVhpDFAd7+1C0cqgvWzRKnQfCqnRXy/M5FFhR5XA8epqHpDW68RViTlNY8SEZwJJgGKFK9kFRMw8qsUTSqtMWYf3KupHqMuTI+qAR0HzGDeqDQgJZcZYpkJdo2UCiXxZClY1i+OJ1oqdf1ndmUbDrvlk7N2ELXOcMeOm0eFLISIMzbPuftLO5TfAcvL6pk9iylQhs8A7aH3bxNwitcCMowArbVImY1lc2fqnm4pZhVfeykmqvFpBEZQFLFcP0vGmvf1AkJIrHNwb0K337yCeZoDUYCl9ai9y5wNDOc25dkm0ap9z02QmDOpXlSCUTRXgfvoLpdmXB9nkgt5FxIt/xOlDv8s1Zh8XciXh8kP3bcQxDHIDCEP8zTvjXCJsTdlVrr4ZP9pXkN+ULJZthyXZJHDcgMh4dRGolh5PYDOQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(7416014)(56012099003)(18002099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 40YFeK8f5I6HlPwXc1VYOorb5bhE2ui7ajeez072Rs6XShMaky7VWcqrwAwyE2SWzKPdyXJ8WjyZN1jn9cawROFnKMsHHhrJia9uvkxz86VbBy6eWlHxFdO8AOBX3c+ZJIiyIEXnZ+tp9f0TmCfR0d1brGh0TotoyyUZ0b3bcr+EOBpErCaJLXxHR6dDN11GVY0aXJH74Dp4XVsKnvkxlaJFCZZHbaefwF0myVUIF4XbdFanQeKMtXs1QI6Gvn7LeXan30Aiuu4fPb7rm8dA7hdvq/38DEhT+/X7b0AQiSsNT+cOkgqDLvqLcea7fzcOgmEefFly6DEO5EoOXZ4RHHkyhU4XfM/hFhg0yIr/iD3QZDLoQXWEX9OfU0PXgDbLH+8ttn30XREKUhG2OWOedN2+IiT0g7Tk9qgnhKauOcKQtgnlPBlwNoTVWobYs1bK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2026 15:43:52.4727 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e962c7-3a0f-4754-ea0f-08de82a9a8be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9136
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mB4kc8HIKlCNkC1Tjc0os5xwk1SL4qzDMsH1yCS0rBk=;
 b=pmraaTWTzOwJH43bRb8nA0ZmCJaDsuK3HE+kRJ7MGtt9eT+5vYW6A1GCQ1c2/8cAvnIUs4VlEYeH1RQ4s0A8nVwxhWjc+8cyc3lHOc0h7DIRCdniu7/dlepJn6BC/2+1T48ZootzPEBWXBWGUWhFHNMfagFtE6O3Tufkbju05yM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=pmraaTWT
Subject: [Buildroot] [PATCH v5 1/3] board/zynqmp/post-image.sh: add custom
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
V3->V4:
- use make print-vars to get LINUX_DTBS variable
V4->V5:
- fixed shellcheck issue
---
 board/zynqmp/post-image.sh | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/board/zynqmp/post-image.sh b/board/zynqmp/post-image.sh
index f44b66342d..67b0be65b7 100755
--- a/board/zynqmp/post-image.sh
+++ b/board/zynqmp/post-image.sh
@@ -2,13 +2,9 @@
 
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
+LINUX_DTBS="$(make --no-print-directory VARS=LINUX_DTBS printvars)"
+ln -fs "$(basename "${LINUX_DTBS%% *}")" "${BINARIES_DIR}/system.dtb"
 
 BOARD_DIR="$(dirname "$0")"
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
