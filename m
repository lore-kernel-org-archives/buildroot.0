Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F20CA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 04:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E18784597;
	Mon, 18 Aug 2025 04:48:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zXRfq4PFex8r; Mon, 18 Aug 2025 04:48:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2045E84598
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2045E84598;
	Mon, 18 Aug 2025 04:48:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 27072196
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 04:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AF3341676
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 04:48:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zaAzpYiTqRF0 for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 04:48:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::609;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 980A541675
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 980A541675
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::609])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 980A541675
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 04:48:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uae7KippZfbN9cqTBIO4vFePIcRSAVs+hsL1CvB393ZxT2004ZJZ1OBenMLiY9DrujoJPc2mgcHp9IM4QPMwQfaPjvLclBIidyKgrKiuhV8W3ZOJFIqnlN2oBhZm2ctkBZWeQ4oIXd7mXFHMFswgtfxJ81yj62i7uffjfvbMBw1UtUu7mKSCRBWiAkRiY9eCBJTluq+Nj9aE496YeLE893Gp0AHIFG6cmuRorM6Yi4ntbmRBIV+bKTz8E2dx2BlXIhIhQCe/Uptxf7rKzzFYGkmhHB0Zk7O7o5iE5HEgM3XNGl2voSU0mLwiOF1UdlFjV4j1OEbiuwBZ2e9NQPRygA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5+AL2Cz1bTLytfh0GZn4wTH8kaTml1c2wHjIfAeUwM=;
 b=r1sJmchmdD7oDOeMIzYukyrxdpo07zUqhLAuFASe3VgFRb0pF/eWf9lH3J7ysoBWMUPA+r1SIEcX24ICjvbBMZ/FTBs79XGmOJ0TwBq3sBMbdfzo7O17AOuMSj9QMSs/i8Jpe9hkCDMhAOOZFOl85DDfPSsAYpkWRS3F3Ohld99+MnD6YFluv7Vixr50fwTuqiowgjoiArAD2jUX0ILMnCCdq5CKe1djNsx4IN43P3qLAJNlbCy3wXeVjl49CK187fwbWdMlHbDtLfTJJ1h4Z+liYq+qwNhpgH1zXHpid7r1z1uaovZlt6MUk5hwRuJIY+Zzs5V6opcRB8yBUVBc0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SN7PR04CA0203.namprd04.prod.outlook.com (2603:10b6:806:126::28)
 by CH3PR12MB9249.namprd12.prod.outlook.com (2603:10b6:610:1bc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 04:48:02 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:806:126:cafe::d0) by SN7PR04CA0203.outlook.office365.com
 (2603:10b6:806:126::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.20 via Frontend Transport; Mon,
 18 Aug 2025 04:48:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Mon, 18 Aug 2025 04:48:00 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 17 Aug
 2025 23:48:00 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 17 Aug
 2025 23:48:00 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 17 Aug 2025 23:47:59 -0500
To: <buildroot@buildroot.org>
CC: <thomas.petazzoni@bootlin.com>, <ju.o@free.fr>, <romain.naour@smile.fr>,
 <romain.naour@gmail.com>, <ibai.erkiaga-elorza@amd.com>, Neal Frager
 <neal.frager@amd.com>
Date: Mon, 18 Aug 2025 05:47:55 +0100
Message-ID: <20250818044755.3155924-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|CH3PR12MB9249:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d23491f-d400-4768-6460-08ddde12690c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?31OwkozbQRjcD8Qf32pT7TWRRkQJvMlZoPc7xViChni1/Qcq4///f8idAgHR?=
 =?us-ascii?Q?ql976KTdhk3uYwv546j+I3c436/jWmW85LdsWETq4uns7VQK2kvSpKvpNuJz?=
 =?us-ascii?Q?VxwcMTeLODcbDW9BPCRL2Akru4zy6mDk80VMakckDv0AjCzR0jQILb+GwhZs?=
 =?us-ascii?Q?wPxUnwNIhF+smWwydtOWWX9nRE26Jrg4DAkX4lSl8OkWmMjx3Hj7xCfm2alb?=
 =?us-ascii?Q?uH0xPkuzgIh6brnZV7MiZdfe7iUKp15twFrsSNCjHDrxjIkDNzc51Yty6wiH?=
 =?us-ascii?Q?Kdjzk1yLY20A6f9bfDJPfWXIMMIvYvlI+oYsm8FkKizJGHAnYb4uGocG6rT0?=
 =?us-ascii?Q?Ho+fhSCgealV9aJotUnWhX1uTuD8qHTJU4F5CuMqR+o/MKcWtcVt6wiTWr8u?=
 =?us-ascii?Q?3s0sRMQYj0DhSYForLtM6POZ5suh9E/SYICYOeLl4SM4Su6mlVg2gp+fGGtC?=
 =?us-ascii?Q?Eo8q2sIWvlpKsbYFkrIOGdxa23Io3RgJZw/4dJhT2C9gaku8tnfYZUe3gCKk?=
 =?us-ascii?Q?TDeaNG7IEGcHeR2jMJ1abLCdJsYjbriiYVt6R8ML3J43v9BaGnAtJEy/RDPP?=
 =?us-ascii?Q?n3WNq0IFFkzjHrAo8mEUhb1KThHGZnok2kQJRHpz7Bj63LgPXr3Gm4UH0gVU?=
 =?us-ascii?Q?RqSoK/hdZr5p6HDfYyxzljh2Gesi2AQfRZV6XO57UiGIUXocqkr6pqr8Frlo?=
 =?us-ascii?Q?SrVxa4QX9JZev+1z0S/+Jm7KgD95HlG/OYJn968PRB2iHcybjocS0s72erF/?=
 =?us-ascii?Q?mhOebB7H08dTEUShm5Xaese4442W6e8gx64LgfIHAkENO++xUZqoKyz+rTnI?=
 =?us-ascii?Q?s/FvbLSysm6PXr/s4OpqrfGzxc6UFREd7EETr3V7sQ8Xrc/KmSOQcZDb1Upn?=
 =?us-ascii?Q?HHe0egw4yR/9gs4UItJAbqZTSvI4FcdFiNwpok73dsfDY7MVrZJDYu1Ovi+0?=
 =?us-ascii?Q?BkoiUnHwAUgAJ90oEZr8C89AHA0/UqQIIau4lzvtxDmGtO5KRhVVqDmEfekA?=
 =?us-ascii?Q?nQyfnJM4QquK+rzJIP5Prrs3HL76U49uw2p3BkMDHwNR8kdbK5/2xnf/06nx?=
 =?us-ascii?Q?KSOb9AXgs7M7QaNxHhFUVpjRG/0BAAambxhOpeOcDxTbYWcPaIGbe1vl1Xjb?=
 =?us-ascii?Q?cfXme8pRuThXrEFzNDWr4323sseA6qDyeo/dxdP0xlW7c5TlV8FDrsYlX46w?=
 =?us-ascii?Q?9WCTQkcktvp4cZI0zv+V5G9igWc22xdwYWEo+cabVVlcdg4lwOU2BAzgu2Q+?=
 =?us-ascii?Q?EfhBs1R9EE/rtg8rHYsSfwSWyuxLFvvF1QXyS4SQ2IlgKb+y2lDwXRR3wgtC?=
 =?us-ascii?Q?3CFOmCXuBY5mAtWtF4JUN8JsGisvo9YyzXFMskk/PIvz+XniWfhgLd0pgWx+?=
 =?us-ascii?Q?6fEMndGcFxUz/PLgSL0zURtgSDc89uqbjBLM+0fGIDp9d8zuvLUOB4z/T1yY?=
 =?us-ascii?Q?LWBFUYsj31rohWev/kZGdai3goRBPhJlXAv0KIloGVudP16kNfXrT0pgnvs+?=
 =?us-ascii?Q?6pXiLP2Vhqu1zP4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 04:48:00.9031 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d23491f-d400-4768-6460-08ddde12690c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9249
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5+AL2Cz1bTLytfh0GZn4wTH8kaTml1c2wHjIfAeUwM=;
 b=lVIgYHQtsgGyP3U86Sa8YLtCkzJonkqEXW+avfnFbjp/1yysAiw4XNugyfC2iGV18gVa9KJhXEB1Id0qjV/2eCr8ki2k211ZtqVuyZ9IYOVQynoL/F+FsQY8e0CGtrTE1GWBQjQ/bGvE0RmDeD3ibbvkgH6rXDYQTHu5oRwjKVI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=lVIgYHQt
Subject: [Buildroot] [PATCH v2 1/1] package/gcc-bare-metal: decouple from
 gcc package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch decouples the gcc-bare-metal package from the gcc package to avoid
potential build issues when bumping the version of one package before the
other.

Such as the build issue example here:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11026775160

Since the gcc-bare-metal package does not currently require the gcc 15.2.0
downstream patches, this patch simply deletes the link for patching
gcc-bare-metal 15.2.0 with patches that are not needed for bare-metal apps.

As for the hash link, this patch creates a new file called gcc-bare-metal.hash
which has the same hashes in the gcc.hash file.  But by having its own hash
file, hashes from the gcc package can be removed when version bumping without
causing build errors for the gcc-bare-metal package.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- removed COPYING.RUNTIME hash as it is not used by gcc-bare-metal
---
 package/gcc-bare-metal/15.2.0              | 1 -
 package/gcc-bare-metal/gcc-bare-metal.hash | 9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)
 delete mode 120000 package/gcc-bare-metal/15.2.0
 mode change 120000 => 100644 package/gcc-bare-metal/gcc-bare-metal.hash

diff --git a/package/gcc-bare-metal/15.2.0 b/package/gcc-bare-metal/15.2.0
deleted file mode 120000
index d3d1bbdefa..0000000000
--- a/package/gcc-bare-metal/15.2.0
+++ /dev/null
@@ -1 +0,0 @@
-../gcc/15.2.0
\ No newline at end of file
diff --git a/package/gcc-bare-metal/gcc-bare-metal.hash b/package/gcc-bare-metal/gcc-bare-metal.hash
deleted file mode 120000
index d417b0dc77..0000000000
--- a/package/gcc-bare-metal/gcc-bare-metal.hash
+++ /dev/null
@@ -1 +0,0 @@
-../gcc/gcc.hash
\ No newline at end of file
diff --git a/package/gcc-bare-metal/gcc-bare-metal.hash b/package/gcc-bare-metal/gcc-bare-metal.hash
new file mode 100644
index 0000000000..19678dec30
--- /dev/null
+++ b/package/gcc-bare-metal/gcc-bare-metal.hash
@@ -0,0 +1,8 @@
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-15.2.0/sha512.sum
+sha512  89047a2e07bd9da265b507b516ed3635adb17491c7f4f67cf090f0bd5b3fc7f2ee6e4cc4008beef7ca884b6b71dffe2bb652b21f01a702e17b468cca2d10b2de  gcc-15.2.0.tar.xz
+
+# Locally calculated
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
+sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING3.LIB
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
