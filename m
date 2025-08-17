Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2202CA0EDC
	for <buildroot@archiver.kernel.org>; Sun, 17 Aug 2025 17:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0930613D9;
	Sun, 17 Aug 2025 17:28:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4v5KY-XvkNTV; Sun, 17 Aug 2025 17:28:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B656E6144C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B656E6144C;
	Sun, 17 Aug 2025 17:28:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CFE74196
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 17:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B65CF4194C
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 17:28:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id shikBv7L9P4o for <buildroot@buildroot.org>;
 Sun, 17 Aug 2025 17:28:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2009::624;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7E9F64193F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E9F64193F
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::624])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E9F64193F
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 17:28:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RiyAzCLyF7CqUn9QtaI5xBO5ovOQlcseoqNPcNdgUEnSvi5T05dWctx4/Cfk2Ix0uenp12lvulIsFnbAkor2aratry02o6Bc6kgDs3L3Npj9zSqI4v0vR4QatE4eau84admkBPU9B+wV8uvXTKFGPX1ePbgXm7R9s97UUmcw+pJQFTlkjaUoULy4NtcuReLadXS8zdzMExHyWiuxWkTZ+Y44VnQAeaojBL7T+5mMrdNQ7EA3UtlPwZ+9TOq0s4SgFJidrZ1C7FFPjys3FgzNqUp3UjX3Fo+cfaDFEvfJHAZZZItvar1N2PzqCG7TQTXdjXf77gWfZ2QlqimDYB+8KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZ3pJeqikrVwd9OcRTp9Jh4YFHoy5YlY5D6FGyy42Ug=;
 b=hkSt+Q0OVeEXeVN1bdFaSy1wd0QXJhTIA9bdMCiNH2G7PBxxZ0Tme9Z5xCH9BPvY1z87eajYpqKvXvxmeJ1O5sSlOa+IuH3tUAp50TD903yPsB3YH2CAXx5FDPzTDu4KCgj1FKJS2D44HUcE30r7SziqsE6qw+9MUrQiUkrKK80SojDDqbmmxPHPNmkbtzA/Gng5DkKmYIwSHoL/GnvKeqbYLtRFveMeRJwVeC9HLDD9BIdNV5J5QW3ShXeprUf2gbhnVcXnJYjb2+LuRNqGpCvHorXbXHgKTPFYY4InBZp+WP98AzxyArly3IPiTugcd6WzoO0q/MIOwBPwYoPhuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN0PR04CA0077.namprd04.prod.outlook.com (2603:10b6:408:ea::22)
 by DS0PR12MB8368.namprd12.prod.outlook.com (2603:10b6:8:fe::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.23; Sun, 17 Aug
 2025 17:28:22 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:408:ea:cafe::7b) by BN0PR04CA0077.outlook.office365.com
 (2603:10b6:408:ea::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.19 via Frontend Transport; Sun,
 17 Aug 2025 17:28:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Sun, 17 Aug 2025 17:28:21 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 17 Aug
 2025 12:28:21 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 17 Aug
 2025 12:28:20 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 17 Aug 2025 12:28:20 -0500
To: <buildroot@buildroot.org>
CC: <thomas.petazzoni@bootlin.com>, <ju.o@free.fr>, <romain.naour@smile.fr>,
 <romain.naour@gmail.com>, <ibai.erkiaga-elorza@amd.com>, Neal Frager
 <neal.frager@amd.com>
Date: Sun, 17 Aug 2025 18:28:17 +0100
Message-ID: <20250817172817.2431423-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|DS0PR12MB8368:EE_
X-MS-Office365-Filtering-Correlation-Id: 8396af8a-b143-456e-1a2c-08ddddb376ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LfasuEDG0JHih+mGstoW1jwYzZHOTw7+lrypsj/rCC/UllJx5ZeU9ljyJ5rz?=
 =?us-ascii?Q?NSI2e7Xpmao+oXs+GgOhHMgN9PevV6PhKKMwlnV/96AxRXWFGa079bLpHH4x?=
 =?us-ascii?Q?a//CHXmjLscxx3A/utHEem+jA8ui0dDYTJUE1D9AU6Ej6N5DMn5WGw64BSCK?=
 =?us-ascii?Q?kbJIvXFavfFRVGWSEtewbFdW6wYNNxuRbEFq0rRQ/FmGjfE9qay92WRkUulz?=
 =?us-ascii?Q?tT4yI3M3We6KhAH1vooDfAAHox7lfkMEorUpt2uFjlkMcDsJYBT6p5MhZJfs?=
 =?us-ascii?Q?5LxNSAd+FWmk/Vc+czfmTPQOXqOfulcEsZ5hIaapQTkt2FbCrgzghy3GFL3h?=
 =?us-ascii?Q?bWCBJiNYMuHACLKZkFrrTvLgMaSyhRQc9WH6yF4iEROy+mIBi7oq8yeMo6Ep?=
 =?us-ascii?Q?j5/Aey4JDb2d/GwXr5nqfxKaEdog7+vU6lVvmFLMD84TcYccGwKYoqqjdcmD?=
 =?us-ascii?Q?IVBUdEDSJWr44mIcGT5pBW/J78GAMCmWOxw10qwi44mwvP/+fMRZlAdgzLmB?=
 =?us-ascii?Q?BYlzpbqFxU0zW6nz2S4yQrFrdH52yei96kzI5hfOJ0I6cFlMVzmFDm82IVxI?=
 =?us-ascii?Q?VAM++bBUIiovtNlSbH+RgJ49EubouazNRBDgPiQMsoLUGBVftx8efoN5ZKsD?=
 =?us-ascii?Q?x7ZxiGTDjzoj7niMXlh5S9ZMKmW0iP3jjGwOeUvVveQzkUOthPcl55EomS4T?=
 =?us-ascii?Q?ve0MESVxSDsjs16ggt+eTih0+VaLh8uYH8K8S5kHgcvbhf/ouNVWPSI4bCx6?=
 =?us-ascii?Q?qeaX1ldQ3y/UVENx4uneE1nLEoA0RFopIzvZEce5SI0vZckwbwiznncNLHGw?=
 =?us-ascii?Q?qXa/0jYeb/kE11Z5gQG8GT7Lk7Wnqc8eXPQLpJvawqu1EaZL5PXeJ/G7gGfG?=
 =?us-ascii?Q?fyiBbjTddaBvpSS1iF4jzw23qhuG7JCfVt8pX0NbgMI4ODoaqERxvBofHZwm?=
 =?us-ascii?Q?db3dxsNeiTCfOT7+p1VjdY3bI6gOzWyB6fxXx9rLXqWuwcpuN1koHWitZBwZ?=
 =?us-ascii?Q?CzON6oNUHTyCI4fQkv343l6mXMmrUIF/1PcbjUKo4j0Ytg98b2XoJcUmHfeb?=
 =?us-ascii?Q?HrL8WRdLfDx2H+8PvhtbmZk/rWtjuqG+JLm5sTwORpAkxZ0fU94SkSaSyEaG?=
 =?us-ascii?Q?lkSIFu5h96dapkwMqYJI7IayFWuP9jAfjzYPueNuIp2YBtNn+siSBQJqtP6f?=
 =?us-ascii?Q?2Z71rwTHyMWrAKo4mKgWsoaKuSSCLy3k1zg+wQOaY4j8GvNHvAvjwXmDr7m8?=
 =?us-ascii?Q?mIlejrbE9MJQBEmGX0HV/ai0Zs9PBRvBHUbwi0w+kHJiwU8g1qXT6+E+Hk+k?=
 =?us-ascii?Q?+eHjRYtcLwVmuA1xCcKfC2b0bbayk6ySy+BPNobRKVifavIenQB1PWLHLBqz?=
 =?us-ascii?Q?hOePJnmDrXf1CalS/uY+8hjVKkgZaejfyuAPJ+fPp2p6g9FRowck4A/86gW6?=
 =?us-ascii?Q?9GfjhIDsxoHGlMi4pZ27XBi0KNCt85b/Vo3qzSGi0IfQX2M+tTYfVM8zsYuX?=
 =?us-ascii?Q?NkK7QFP9JidhT7g=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2025 17:28:21.5913 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8396af8a-b143-456e-1a2c-08ddddb376ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8368
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZ3pJeqikrVwd9OcRTp9Jh4YFHoy5YlY5D6FGyy42Ug=;
 b=lSXzAQPnKd9lQGf4ZMpyLqKRgXPnrH7DyX8VVO9eVODdTRsm7GItqIRejHymXNHCt7IhH4UlRHU9odj6dybAXKkPq5ez6To4DGb31qTIRy5jeJ4XKFusKjlAW1+TAxhPru2Rnd+gwzjB2ACSJreHmwJm9X4t08tEdyL5ra5cLX8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=lSXzAQPn
Subject: [Buildroot] [PATCH v1 1/1] package/gcc-bare-metal: decouple from
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
 package/gcc-bare-metal/15.2.0              |  1 -
 package/gcc-bare-metal/gcc-bare-metal.hash | 10 +++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)
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
index 0000000000..94018f1f5d
--- /dev/null
+++ b/package/gcc-bare-metal/gcc-bare-metal.hash
@@ -0,0 +1,9 @@
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-15.2.0/sha512.sum
+sha512  89047a2e07bd9da265b507b516ed3635adb17491c7f4f67cf090f0bd5b3fc7f2ee6e4cc4008beef7ca884b6b71dffe2bb652b21f01a702e17b468cca2d10b2de  gcc-15.2.0.tar.xz
+
+# Locally calculated
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
+sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING3.LIB
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
+sha256  9d6b43ce4d8de0c878bf16b54d8e7a10d9bd42b75178153e3af6a815bdc90f74  COPYING.RUNTIME
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
