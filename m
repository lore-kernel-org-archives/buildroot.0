Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551D4C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 19:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09D58406C7;
	Mon, 19 May 2025 19:38:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id td1YPikf474O; Mon, 19 May 2025 19:38:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CEB1406D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CEB1406D7;
	Mon, 19 May 2025 19:38:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9241F193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 19:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83BF74111A
 for <buildroot@buildroot.org>; Mon, 19 May 2025 19:38:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GgfhqsxA_Wtn for <buildroot@buildroot.org>;
 Mon, 19 May 2025 19:38:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::62b;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D9696411C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9696411C6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9696411C6
 for <buildroot@buildroot.org>; Mon, 19 May 2025 19:38:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KDCOB/FWrYIGDvo5KmpgOAfPraPXPQvvKCA7a15mvRQDf8GqWFXNQF6J+Bm3WvMhpY45xIhlzXAFMTheSJ2FKCAbe6IGjwqyUoTxj2tHn/5TA8a4YsTYLleyN2y2BlIGUO0l/lCUqbEKU5E67Q83BYCCBtYtSg1+RxLhKIMH29M+dxV7sVQT+lyRryjM6dNCUKqp0f4/IKziEnOTyRBB6lY7edyG0T32KMvycUFUUN8vpNiI7/UaDxrH8/PFLu6JF91rR3ApwfmxLXk1ljp23dZ4bkIBMDWZPdOoM10AMyRO0EzxovbHvA2JDvoZFdR1OyNZMLWqYWJtY09WCrobOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bW6YsJYf7FesbfGp5KYFDLEE9kDegEC6I4d7YREbO7E=;
 b=TAs+qGwVd1bacjqUPp4/xzDKBL0uLzofzFTkW8g3bgR7NQdLX1nABJJAzjpo5eqS79ikd0NrlOoI3ArOyKV/tyP1howFFSeVWg+c7a9UPZlc3gFYKiHcYK3QfU/pyNLf8voYNStIh+MoO50TySzYLte6cwDaYFiadiTaqPf+0yUFC/FL+HIDecT+xpY/E8ub7EGVFbWClt8ZrC8jciaZeSy8GJexHjRcC75OIRjXNlGb34sHUsSaiNZ4Xb/KvRLb4sbueRsF4wwTl4OPGWiQAMYg4rAJvWJYT14UVQh7zFKg5Y4UH1GuZugoX8M+v5f4L6dqdKFaQcko6IUKzMvCNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from PH7P220CA0178.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::17)
 by SJ2PR12MB8184.namprd12.prod.outlook.com (2603:10b6:a03:4f2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 19:38:35 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2603:10b6:510:33b:cafe::42) by PH7P220CA0178.outlook.office365.com
 (2603:10b6:510:33b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Mon,
 19 May 2025 19:38:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 19 May 2025 19:38:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 May
 2025 14:38:33 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 May
 2025 14:38:32 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 May 2025 14:38:31 -0500
To: <buildroot@buildroot.org>
Date: Mon, 19 May 2025 20:38:16 +0100
Message-ID: <20250519193818.3192717-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250519193818.3192717-1-neal.frager@amd.com>
References: <20250519193818.3192717-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|SJ2PR12MB8184:EE_
X-MS-Office365-Filtering-Correlation-Id: 5850b1a2-3dc0-4307-dad3-08dd970cbdca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JkhBzonSDKZkaizsuRBrHdRIKwLNRoxHVdfOH7jDy8bWdwa8H2DwykooUUap?=
 =?us-ascii?Q?tN/CXHAMTT+Z8WoPWmMinWITEOMZJV1JpRLbVJvH9zsSTQM4pnQNBOwaX+sz?=
 =?us-ascii?Q?Zn3rOzGGYNVTvS0/BjsRm5WKzLY8hgxsrDxAwUVtkUc8EDDT5rb8bfFW1wP6?=
 =?us-ascii?Q?V642wcz7fWV+JeQKmp79HDmHlA90nQSGK3UQvLCaSJkaCQGIJJ8SjoE+5/bk?=
 =?us-ascii?Q?IRftUFALK8ExT1CJylzwywc/KMiZ/UaqXs7V2BFpylzYXgiXvv9W46E0ZQZ/?=
 =?us-ascii?Q?WsSQWMvVR8Nt0vshXpNqv6wcri6LunjNPkeMYmZH2DBZxLSUaZvkTP6TQ2LU?=
 =?us-ascii?Q?1bNyEnnmMA5ULCk/Tkp2bMYMcD0jZnXQfyccEoBCV+JlhA0FZ1iY0e/D0TJm?=
 =?us-ascii?Q?AjaZDXt3mIKcwDOsoLQyqHsQcWuld7oKS9OPspnHa+HEt1PYBMjTyWI1VZlO?=
 =?us-ascii?Q?PUNs8pL0mbTgmSKAYuAQkZh+OVLAnKvjWA9vDsJM0bYrhUocubfr02TwRMmH?=
 =?us-ascii?Q?eDgiX3jMscwyVvTlWB6SzLD2+XaAEBn8d1aqZgfuoeicGxj0QR/XS+vMxsMf?=
 =?us-ascii?Q?hsD3V/U1G8gG/EZYDCh1cxysZcqIP2g2+A96tqfvA5Rb5rTE015GvPriTbS7?=
 =?us-ascii?Q?CVqqd0HrDA83OsM5mnCE8b22YdZu68mr9/86kb+R/tulcOIvLEu9qCgBckr4?=
 =?us-ascii?Q?shYF5HBgi/kbzrkWU/wCM1VYgkt8OSndV4XQV7RVcPaAKXn3JaFGU5hgSLWe?=
 =?us-ascii?Q?g+zn8uBrO+Kl5/xc/2cjVyCnTB05uPmrTGuRWiVUM6z4QtRrk5mnmfmDESRo?=
 =?us-ascii?Q?zIy55UwPHtCir1Pm6tGNo732SNziGofJzVYM/MlqlQGbw3kZIMwkOtvcCSoC?=
 =?us-ascii?Q?AKjOa5XJnX2a8C/7ucspmyQirF4lILxZjo9OO0CIr5YRvfwkWyXgBqEE6ca0?=
 =?us-ascii?Q?vEEh+lR76kNvfPE0txFgByepNAUbSqoc5v02kd8RblGd6/oRSOtke46t/1CH?=
 =?us-ascii?Q?O2mubcguZh/So9+z2Pls+BBlg9iQdj259w4W660c0WzTH2VDF49WkwRXFCnd?=
 =?us-ascii?Q?DyeNWrxXEHDyq7SiHWApcBlro2u950T2D8WSkJnkKPKNIlr+R0RpoE6YYRCM?=
 =?us-ascii?Q?OEoMt1IdQohk3WVMuSZCYCEaDe/I0XhomlKmbK6SmWLnoO1ZmdCFfJr7TEyC?=
 =?us-ascii?Q?PXrwQT83TFw0Zi+ICWL5aUJoX9y5R7aT8YW+11LpURo1AqIw25d+Z0FyVi2A?=
 =?us-ascii?Q?6RUZHFqaeKd+CJ1+WJYL6bSVTq6k6lrlrxy+55A4j1Bwhy1FGGap++p4Ccz1?=
 =?us-ascii?Q?Ve6vMi9W8nR3+A28akKmZzxEH4pZpjSeTQ/GqPuqpgPdivfM13sju2IPMoPy?=
 =?us-ascii?Q?Zu4nU+JAo8XfFasJyJlexN0bygvrfPf/gR4zVQHLHwjyNRcsaQUYkaDUw4q0?=
 =?us-ascii?Q?bi9lC7aVXRfKZtqBc6dV3QPIbdAqTsPR6HhsbIJmzuDmHU95/olsP6QkpPQm?=
 =?us-ascii?Q?MIMg79VW1XE7fS92fZzxYGVytsPNTt2rG8W8YRaOIPOQi0jNKrH95mGgy/I+?=
 =?us-ascii?Q?NoSzzGP5AGlzAhLeHbc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 19:38:33.5307 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5850b1a2-3dc0-4307-dad3-08dd970cbdca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8184
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bW6YsJYf7FesbfGp5KYFDLEE9kDegEC6I4d7YREbO7E=;
 b=Yp9PbQqzFEzsyIBDnJQO9d64Ki7ww7OA2IXWcCpP+k/TSGztkf6Rhifw/jNCBx85T5f0BTu5aaLjLgnWTiYenYlOzDkj0cM5sDaLeypmhq3XiIC/8VUOsWQy6YvGJX5Ty0pEBud09sWXFuouJbTIS0q9PELn7CioYdIx0Dx7cvQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Yp9PbQqz
Subject: [Buildroot] [PATCH v6 2/4]
 toolchain/toolchain-bare-metal-buildroot: rename example vendor to
 buildroot
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
 Neal Frager <neal.frager@amd.com>, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that xilinx-embeddedsw is compatible with the toolchain vendor buildroot,
this patch modifies the toolchain-bare-metal-buildroot help example to use
the microblazeel-buildroot-elf tuple.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V3:
- new to series with V3
V3->V6:
- no changes
---
 toolchain/toolchain-bare-metal-buildroot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-bare-metal-buildroot/Config.in b/toolchain/toolchain-bare-metal-buildroot/Config.in
index c86c5d725c..19c97410c6 100644
--- a/toolchain/toolchain-bare-metal-buildroot/Config.in
+++ b/toolchain/toolchain-bare-metal-buildroot/Config.in
@@ -10,7 +10,7 @@ config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH
 
 	  For example, to build both a Microblaze and a RISC-V bare
 	  metal toolchain, use the following definition:
-	  "microblazeel-xilinx-elf riscv32-buldroot-elf"
+	  "microblazeel-buildroot-elf riscv32-buildroot-elf"
 
 source "package/newlib-bare-metal/Config.in"
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
