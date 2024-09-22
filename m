Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D38CF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 13:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC572401EC;
	Sun, 22 Sep 2024 13:12:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o4B6icTVmhtW; Sun, 22 Sep 2024 13:12:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B994401DA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B994401DA;
	Sun, 22 Sep 2024 13:12:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 258F61BF396
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 13:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14413400D8
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 13:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EseNDYRYUPgL for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 13:12:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::60b;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 90B14400D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90B14400D6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::60b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 90B14400D6
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 13:12:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h9sHho8a3zMPXA9gm3Oyjdg7QFUKw3CeySjPgyAOPDHg2cxaR6u3wjh480K4vz18KA6qR2obfbyBwgC9Lq5PxiMMx6YQlExACxNEnWnZmpU1+DsS3zi6j3o2O5ViedBDmLJtG5rpyWCIr3pc9sqHUI9nOwe8Zmo3v7BcsuqnNMTC72iY2Z2AjQ8324lQ5QWJQqmeRVhtSDjyp42ZT8tjCd/Re/nENIhTdPmHz6t0lHzA9B9MgKkry78zZ0tXGisLu5DWhHQV9v4XsnH72INCnMmv5jElILJquyRrJT10IHw7FixQ+8q0f78KJGL+Ql5rsG7Z0df3YA+6YgJ1SGFl/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zGAOTFcrPJxfIkrDJpu/5weTWJe/eeCYWerMX9R8e5I=;
 b=boIkxBdNFeUo+C1nipKOnTZMkV7au6oce/HAAq+5zN47SjG6JTO+ZguITZaCsH8/+6jLgp06D9R2Z2RbaLso8Fk19n9l//AShDhbxbZi5MRxeMf8GI9QM6Gj+NcaxlbO6HMv+qHdjiPzfs/mm0bYkDXLZLPSx8NrxWDZTJ1G7PJj4Ttu5WgfiIeMs4UMqGOieDsTALKY1oonmuacT/nPp85bPJWn/2YghkT4eSlD+N/UWZ3Y3YiqSFNxOD5e4uzfOzvBfC4e1lP0RqK8XSqpJQU+H5BptG31quCfxyg6PlznsaWoK6voZ4zOw1qU430L/GOvd2LsELAZScq0IM4e8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CY5PR15CA0188.namprd15.prod.outlook.com (2603:10b6:930:82::9)
 by BL3PR12MB6545.namprd12.prod.outlook.com (2603:10b6:208:38c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Sun, 22 Sep
 2024 13:12:35 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:930:82:cafe::15) by CY5PR15CA0188.outlook.office365.com
 (2603:10b6:930:82::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.23 via Frontend
 Transport; Sun, 22 Sep 2024 13:12:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Sun, 22 Sep 2024 13:12:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 22 Sep
 2024 08:12:33 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 22 Sep
 2024 08:12:32 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 22 Sep 2024 08:12:31 -0500
To: <buildroot@buildroot.org>
Date: Sun, 22 Sep 2024 14:12:29 +0100
Message-ID: <20240922131229.499878-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|BL3PR12MB6545:EE_
X-MS-Office365-Filtering-Correlation-Id: 70d38ab4-0b69-4c4a-dd5f-08dcdb0838e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jRCioLiJkulyCeZRWhb49O6q9v51TgLbJyI35Asb4BFYl7Oy1v32e6KiNb/j?=
 =?us-ascii?Q?/0EIxF0XlnAwhmMpFwNGBQHUKsQMKjLRbjpl895Db8Ld/YkyoPC5glEO8PpQ?=
 =?us-ascii?Q?vbdEALS0j3fAjO15hvvu1JXQjoVdtgCA2RVPRfGHCAQbwiWredwmEn7FVTEJ?=
 =?us-ascii?Q?XXv3aaZLVPrvpQN3yf5Ap9rvqLBET8jUeMCsXjMk2vUPIjnxXcHf8T0aU9wl?=
 =?us-ascii?Q?3ty3LaCGlH7KudHOvqznjT0eP4i3GZKBMwH6hDRfWivfJNeIcandEO+3ESFX?=
 =?us-ascii?Q?tdL62LwIQqemk13I4A4mL0uyuxQQtoKjjZ+pybUfetEX2fjDQLvWDUE7/xit?=
 =?us-ascii?Q?ErbrimdCb3i2P6oZfYMvE5+PB7dViY+BQv8r3l7CffmOwHLe+FZi0iE3NTL3?=
 =?us-ascii?Q?rXey2H39x2LLCE2eVfmCGKUwM4dO6bLNz1vPKZb2MZv25HsbO/2KV5x4T4MN?=
 =?us-ascii?Q?lAI/Z6I90NB+LO+sLC5bo9swF6et/xm6IOkg6FcQWwu6rPwkMVw1qgh8qzxH?=
 =?us-ascii?Q?kvidHfWcQmXbT9wLJXtPjsB2kpJ1R0K+oSPulQPxxxSYg0ogXr7SkyFuZnUE?=
 =?us-ascii?Q?wSpXsRNZRXLFFOFe1zqqjSrIUOH7DRtA4ndA/ImmWFuG2IrWOr1yZUYqm7Ax?=
 =?us-ascii?Q?t/6JF2NwbOL0tmfH/BkozOKvWMad0DzAUFJnUmogCzjxFNzGpXJv0/Iu2EMh?=
 =?us-ascii?Q?jARhUV22skYaH18lidKKU9DN0vM1DXq85d+qUYmu7H3IfPTRkxpvBiTmC1Lo?=
 =?us-ascii?Q?AKn0cSuJJD+wRSX0Q5BcKc6WS545ZbgzebP+qjr7EIPPA5hO94FVJTD1e4S6?=
 =?us-ascii?Q?hMTi3TJJl3CiYdCu8l6VajtLC2wDsbw3jCiPo5ZN4nxdD3bzfmn08ZVguGEk?=
 =?us-ascii?Q?ZGt4HttU9mGduvgRl8LSCaiU9j0UeAtU+bidXu+1TVx4FZYA6jP61rFcXqvd?=
 =?us-ascii?Q?f2sbjs4r1Zw59QEFCsXT4UK9GNoZpdCzztv34kR2kyR6DzL71DKKzBfMka9D?=
 =?us-ascii?Q?nAAW2ZmUG7M/UEkvWD6h6B58jU0LVdA1uzWXBFkiuNLJQ9UnMwgL4HR/zGIr?=
 =?us-ascii?Q?dNTe2E7o82PhkUMLHz8UGmIgGJZP6cAejFlKl6/t3pRsrRgc+caOkswQsJ7o?=
 =?us-ascii?Q?VouI2rzIm33DHBe0rsc6ye3YRNlhavYMY+xBaj9DPOrRbbEC1OnKdRp1+suB?=
 =?us-ascii?Q?5wEseLeAMxzTt73uApQnHGBaonsQhQu12VUB4j0yDM/DXdFGpUwakdAAtLCU?=
 =?us-ascii?Q?2vmofQ/fnIU/pY1t1K6c17Dx5pRc+sormyPth96JzlwRzeDd9xMtWscGQC5v?=
 =?us-ascii?Q?rZeVmZozHqDMIgKuMCSXtDlG?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2024 13:12:33.8793 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d38ab4-0b69-4c4a-dd5f-08dcdb0838e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6545
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zGAOTFcrPJxfIkrDJpu/5weTWJe/eeCYWerMX9R8e5I=;
 b=G2A6GD46XdeWw2hHkAX4xQ+yD3MdDHNKbvjDK+UIY9nlx0K2vzU1a0ZZs5Dcw/THg+eCxGVbYMHGWkUljPmHo5l8U89u9GgLtVvgPgy89w3HiAhuashG6HBoseFSZMqDO5DMbG2nf6eW1ca8+Q8eGVKaMdNgck4/R9Lbou2mAas=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=G2A6GD46
Subject: [Buildroot] [PATCH v1 1/1] package/binutils-bare-metal: bump to
 binutils 2.43.1
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
Cc: Neal Frager <neal.frager@amd.com>, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, ibai.erkiaga-elorza@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

package/binutils-bare-metal: bump to 2.43.1

See here the release announcement for changes:
https://sourceware.org/pipermail/binutils/2024-August/136396.html

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 package/binutils-bare-metal/2.42                   | 1 -
 package/binutils-bare-metal/2.43.1                 | 1 +
 package/binutils-bare-metal/binutils-bare-metal.mk | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 delete mode 120000 package/binutils-bare-metal/2.42
 create mode 120000 package/binutils-bare-metal/2.43.1

diff --git a/package/binutils-bare-metal/2.42 b/package/binutils-bare-metal/2.42
deleted file mode 120000
index dfad0ed2f4..0000000000
--- a/package/binutils-bare-metal/2.42
+++ /dev/null
@@ -1 +0,0 @@
-../binutils/2.42
\ No newline at end of file
diff --git a/package/binutils-bare-metal/2.43.1 b/package/binutils-bare-metal/2.43.1
new file mode 120000
index 0000000000..f605915e35
--- /dev/null
+++ b/package/binutils-bare-metal/2.43.1
@@ -0,0 +1 @@
+../binutils/2.43.1/
\ No newline at end of file
diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
index 778a5235f4..f2f223387e 100644
--- a/package/binutils-bare-metal/binutils-bare-metal.mk
+++ b/package/binutils-bare-metal/binutils-bare-metal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOST_BINUTILS_BARE_METAL_VERSION = 2.42
+HOST_BINUTILS_BARE_METAL_VERSION = 2.43.1
 HOST_BINUTILS_BARE_METAL_SITE = $(BR2_GNU_MIRROR)/binutils
 HOST_BINUTILS_BARE_METAL_SOURCE = binutils-$(HOST_BINUTILS_BARE_METAL_VERSION).tar.xz
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
