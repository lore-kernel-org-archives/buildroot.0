Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B35C25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 06:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B25E40165;
	Mon, 13 May 2024 06:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CHmiiVncoakh; Mon, 13 May 2024 06:40:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A323A40451
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A323A40451;
	Mon, 13 May 2024 06:40:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0765C1BF4E3
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 06:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8D2C40451
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 06:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WaVGNcAWFvcK for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 06:40:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::600;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A3ED640165
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3ED640165
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::600])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3ED640165
 for <buildroot@buildroot.org>; Mon, 13 May 2024 06:40:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GhnOpPJz3BVjiOohtyJFQqG3uEINcoBh4VD288DQy9vRqrrLhoF8ktnjXyEXwobQNKm8MzHZIj4AzYsbCK6JrCMw8X/S8WrdnusegS44NZNHvrhlj1RNTS83wZc/zskfjgoRvHOllEts/w3rAM815QD7elvYuTuiXhJ39bZTjXk0dYfD/uEH8Ox8x3RFshXxcbhC5AD+LMxaYJUZXpiv3Un+z8Zxs7rOCcOj7ob9J6k7r//7Gig9XzedDQ/tHdQklqQ4ipvaw4j5B8yWCL182nAojj2Dhf7Iad6iYvONpFkw26g+cElpuCoOLO2L0Ys+V5toMhJDlqKjEcxK85ws4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O3J+0xlX/qb5LgVgvLtGc8z0lYa8nc5BaHcKDLLY6TQ=;
 b=J1TfiJDjCU9mQOLdbpjyRbmZ9B0Tm69f+EZ9dO5zBxLUuPxTaI8rdhiKMKi7pTGtptJN1f7SKsPpp1p2ggyS2WOVfSS4E9/pZtv+VlglVAcALvpcLdiHEmVRhWEL5GneAbPnJDnNl4wPoI82QIrb+FKVu8pzHBEKX6n6OZOD4OaRWW2sFliJtrIPh59LvTvpYqbJunNGeSiRxW79OmofVJtQAdVAwmDeaXNPZGfwMAXywa+Dq5F30EnuY+UxFDHWlc0/h5Lcxs6lv/BqYDT2rXoDggOAy9+EKkfGj5wlaTprb3/Lnd1uxn+4WT5kFWyt57eNIBK34ccneVwhcHn6IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BYAPR08CA0041.namprd08.prod.outlook.com (2603:10b6:a03:117::18)
 by SA3PR12MB7831.namprd12.prod.outlook.com (2603:10b6:806:311::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 06:40:49 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:a03:117:cafe::b7) by BYAPR08CA0041.outlook.office365.com
 (2603:10b6:a03:117::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55 via Frontend
 Transport; Mon, 13 May 2024 06:40:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Mon, 13 May 2024 06:40:48 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 13 May
 2024 01:40:48 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 13 May
 2024 01:40:47 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 13 May 2024 01:40:46 -0500
To: <buildroot@buildroot.org>
Date: Mon, 13 May 2024 07:40:38 +0100
Message-ID: <20240513064039.2091596-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|SA3PR12MB7831:EE_
X-MS-Office365-Filtering-Correlation-Id: 8de02dfb-4781-446c-5ea9-08dc7317a025
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|376005|36860700004|82310400017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jp7veCZS45sc2NDSFWuUOsFnD8AExyETZgktT+FyFQZjaLsHWLAdTn5jqEwy?=
 =?us-ascii?Q?ZDK+ydidmaH24gAW5zaiEeqIeo8N/gdXBnJo40K3zA37us4haHDTccsI/PDR?=
 =?us-ascii?Q?fQxirj40Iccr5r6fw+Lk6TkKbs2RUQnPi7lRY+MVnDTUf5AMMlexxN+bQIkM?=
 =?us-ascii?Q?n5YR+KMK1KYKmsJ7c3r7+jXYwgut9syPTkC1lj0gVCzNalqC6C+uAckkznhr?=
 =?us-ascii?Q?bkLBDEA4HJf3onV4LoxOKMle0KeUEySYeLzG+WvA2EDvnhFiWQlvB7u9jB2I?=
 =?us-ascii?Q?2UEHIv0/sYojNRMTHCosuFS2kq3/TaUI1Sd6zaOx78E3Ec6L6MWbm+gm/7/N?=
 =?us-ascii?Q?JCRYi3y9HKp0Q+U2qmRlnx9x8mJuKan8N9f211bGXPdD4u/ZyB1bGKVpyusM?=
 =?us-ascii?Q?uyJsfX4GpUhHoorf9MSt7qj8iEQmdGLeLr3W/gb1Uroe0qOcAyMvvaHxPQHT?=
 =?us-ascii?Q?6FR0P31bePF+IW+Bf+ii42czNZknX6bs4w0WQRt5srmdMfC10wdA8Cq3eHjW?=
 =?us-ascii?Q?Hvmqxp1+yxMKxnAnUEWiJd08VYM6YI9UfSaUWwfoij6vBcJh8PX4dwejBfa2?=
 =?us-ascii?Q?lyFk3up9yk22+lqxCIU93Uh8/O2UBIY9alYaV85+kwYhfjIu6Ix5WgEGO46F?=
 =?us-ascii?Q?py0Yf4YJBCj8Z9BFpg44Bi2dLASplrAUyTF1qCQfSNg3cNp/qF2nxIW3zRVA?=
 =?us-ascii?Q?zvZQYdvY0WhcLDp9enBmMtHictHFo1pwOCyrtt/RDeokiqe/Ed+BNsM496T+?=
 =?us-ascii?Q?WOMWoVdfMyYf/LZdMitFthFsZpvoVtmjg0y/GKGnukcO0ytSzlIZ4LSu/Klv?=
 =?us-ascii?Q?re8Pit8331tY5ctM0yGZqQeMuuM4uZxr4VmcyImsIpkkEbeDmgVSJpM8G+nn?=
 =?us-ascii?Q?f1d8+b01r7E/pGSFK0nTgAZiT+iLQBwIhfRJ9WBrQ3+ArL7UC0AGLE8/B9b/?=
 =?us-ascii?Q?qczNzJx8pus3lVp6W4Ca8btUOfAXBtEYw/5ALJIcWZB7J/pllMeb6dnYdWxI?=
 =?us-ascii?Q?sG/k9XhtJIsXUUHHvpZF9PrWW6qHMxG9pgDcSdOKxXoKsOx9a+NYrqkHtaS+?=
 =?us-ascii?Q?U4OIlyLM9ls2biS1y4mYq6WSaL9xA49/6EasUo8J7IXykA2jBlYIzzrQrfzQ?=
 =?us-ascii?Q?1V6Tu0BKRGNn8KB/4RxNu0AwrL7qTK5sBF+E8LW+V9vbW19SxEjYmtWak1+p?=
 =?us-ascii?Q?pmTyt5flWtDRxJxg7M0Cj73bq82mJ/IJJb9KPBz4KXTgAlJ/EpF28r5hFBkC?=
 =?us-ascii?Q?RkttmdFh1SGbuHXlRa/SdWW8NbwHHHqz0TtlwZDQiVBzqw8mpk9NcvVGPftY?=
 =?us-ascii?Q?DbM+M6uxfuLSkQEgd1r7Vn0S?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 06:40:48.6607 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de02dfb-4781-446c-5ea9-08dc7317a025
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7831
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O3J+0xlX/qb5LgVgvLtGc8z0lYa8nc5BaHcKDLLY6TQ=;
 b=uON6ltrvm9b5fEHyE9ppWRiCm1B0WiJPHnDfI+4Kx9QxKyeeqG6TeVWYFL5xiTlmJ9EJoZNf5RNUqG6r/XojRPt0WiM1ZET5JX0xjy0TSEyF9qDZAPdJ7X0Gh2n3BTQMgucNGnIQJkNCALMk90dHn+aqhDb3eYtKhOOOff/zgfc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=uON6ltrv
Subject: [Buildroot] [PATCH v1 1/2] package/newlib-bare-metal: add patch for
 gcc 14.1.0
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

This patch is needed for building newlib with gcc 14.1.0.  Without this patch,
the following build error will occur:

../../.././libgloss/microblaze/linux-outbyte.c: In function 'outbyte':
../../.././libgloss/microblaze/linux-outbyte.c:3:9: error: implicit declaration of function '_write' [-Wimplicit-function-declaration]
    3 |         _write(1, &c, 1);

This patch has been submitted upstream:
https://patchwork.sourceware.org/project/newlib/patch/20240513062419.2042278-1-neal.frager@amd.com/

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 ...oblaze-fix-read-and-_write-declarati.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/newlib-bare-metal/4.4.0.20231231/0001-libgloss-microblaze-fix-read-and-_write-declarati.patch

diff --git a/package/newlib-bare-metal/4.4.0.20231231/0001-libgloss-microblaze-fix-read-and-_write-declarati.patch b/package/newlib-bare-metal/4.4.0.20231231/0001-libgloss-microblaze-fix-read-and-_write-declarati.patch
new file mode 100644
index 0000000000..8901f60c3c
--- /dev/null
+++ b/package/newlib-bare-metal/4.4.0.20231231/0001-libgloss-microblaze-fix-read-and-_write-declarati.patch
@@ -0,0 +1,39 @@
+From 1ebecb83607e9c0cc44ad1e518169ae03c0f2d26 Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Mon, 13 May 2024 07:22:47 +0100
+Subject: [PATCH] libgloss: microblaze: fix read and _write declarations
+
+This patch resolves the following build error which occurs with gcc 14.1.0:
+../../.././libgloss/microblaze/linux-outbyte.c: In function 'outbyte':
+../../.././libgloss/microblaze/linux-outbyte.c:3:9: error: implicit declaration of function '_write' [-Wimplicit-function-declaration]
+    3 |         _write(1, &c, 1);
+
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+---
+ libgloss/microblaze/linux-inbyte.c  | 2 ++
+ libgloss/microblaze/linux-outbyte.c | 2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/libgloss/microblaze/linux-inbyte.c b/libgloss/microblaze/linux-inbyte.c
+index 58fdf1957..2f8d33871 100644
+--- a/libgloss/microblaze/linux-inbyte.c
++++ b/libgloss/microblaze/linux-inbyte.c
+@@ -1,3 +1,5 @@
++extern int read (int, char *, int);
++
+ int inbyte(void)
+ {
+ 	char ch = 0;
+diff --git a/libgloss/microblaze/linux-outbyte.c b/libgloss/microblaze/linux-outbyte.c
+index 9d7bc4890..46de511f6 100644
+--- a/libgloss/microblaze/linux-outbyte.c
++++ b/libgloss/microblaze/linux-outbyte.c
+@@ -1,3 +1,5 @@
++extern int _write (int, char *, int);
++
+ void outbyte (unsigned char c)
+ {
+ 	_write(1, &c, 1);
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
