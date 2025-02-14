Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FAFC02198
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 15:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68DAA84A98;
	Fri, 14 Feb 2025 15:30:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4lC7gx61qNUo; Fri, 14 Feb 2025 15:30:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F10584A96
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F10584A96;
	Fri, 14 Feb 2025 15:30:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B6281C6
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 15:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EDE64252F
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 15:30:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mbv6a2KsGvat for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 15:30:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::630;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4E0FD4252B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E0FD4252B
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E0FD4252B
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 15:30:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P/yPACdlkqwS5sy6QYy5ryyl2gbgsDh+ISS4R0CXTcLs2zUvF9ztDJPgaU1vJsAvijLlJ1mHLuXMkP527j8C9D72ao/29w4hVjI19HPR8OLfPtHno8Szzdj1pG4XA/ML/Qc3ZO3ydN5QfqTTmlawQgL2NaDGDRfNCpNO69z+3FEM4kOcdgYNhhJfm8sgqebyzkpukkFc6vMpHKEOugDP8w/sGCIPmjta1zJDMVYZMoTUZM6jfkZvesRhW0ws7iEujLqUbsjwBJzRfNJGHCvXQcjixaBq1bNzkVOmWt9wePtmfRG4zyrv/iFYtUTcf8AO4UfVJ42U8AodCbwXZZa6tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GTiGZ1KF+FDMAflV1ZjR+sXqtfap00yYrIpTszsaAD8=;
 b=Fma7J+qqM8g+e7HverO4JElVHQNYerSrbFPZSUk9O8N86bDnVpMt2S4Kb/61HG7uSeEFzKPHRaZxW6Lnjls1P7CvyVP/pLKFjV+UspcwlgpT9VM+nTX4o0Lb9xZMfceyLEJHc02DCuNe5t2LFMhqip/E7mUaGpq19f9rQnJNVXCu1/ZU9NeHA/gtzLVqjAun0tMeBpipp0H9iiP7yppJ7jjS+lofoPfYOIkf0nnFg++CoMXUyvDAixB4f4WH9eaHB1LzzLxA7CREjdTcKPxhSmIAx2Y8Z85vVh4pBItDwfCh6g3YCptVzVmIEWowVjaClr7jhHwrbN2aGanBygTU+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR05CA0180.namprd05.prod.outlook.com (2603:10b6:a03:339::35)
 by CH2PR12MB4309.namprd12.prod.outlook.com (2603:10b6:610:a4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.14; Fri, 14 Feb
 2025 15:30:33 +0000
Received: from SJ5PEPF000001F7.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::5d) by SJ0PR05CA0180.outlook.office365.com
 (2603:10b6:a03:339::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.8 via Frontend Transport; Fri,
 14 Feb 2025 15:30:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F7.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.10 via Frontend Transport; Fri, 14 Feb 2025 15:30:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Feb
 2025 09:30:28 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Feb
 2025 09:30:28 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 14 Feb 2025 09:30:27 -0600
To: <buildroot@buildroot.org>
Date: Fri, 14 Feb 2025 15:30:18 +0000
Message-ID: <20250214153018.762783-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250214153018.762783-1-neal.frager@amd.com>
References: <20250214153018.762783-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F7:EE_|CH2PR12MB4309:EE_
X-MS-Office365-Filtering-Correlation-Id: fb35af7a-34ad-4ca2-9926-08dd4d0c85a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qONpXS9S2qg8XCCd0a01Qo5piQdOVbavldwOtEXKXWHiEXROoLT++Xmesoac?=
 =?us-ascii?Q?vm/05EmgBkg166K4jFhbqz50TY0KJMhMn6+nb0Lr6ojn/t4/V2ErBSOK/jnL?=
 =?us-ascii?Q?OLxGIhMAw6xPFjtNwHDNT/5bKj4nPfeuaujkb4gxj0ruvP+GjM53tOzQDTy/?=
 =?us-ascii?Q?wywk1PjXUTiX+slE3g3mTJI15yxsod/OJ6wob+cQyOw0Apqg01kTtjz34Qbu?=
 =?us-ascii?Q?p6tu+s1ycKRle246a6XtwIAEuCV4/eQaqkhuPcmdlvzU13elrXsM7QwpeGK5?=
 =?us-ascii?Q?mE5J7oxQNtOQY/QM9ZiiQccSaRvPZDWoVOEeqXPZr66rOg01U9Zdx/yE7DHP?=
 =?us-ascii?Q?dFvFC+zItXrp0+o4HxY0Fwwx4YwGFAWlycyRXjs3qgT3V4NXp+4HmExF7mOy?=
 =?us-ascii?Q?gHOrR7exTxmXS1ERtHl+99HdZK8XrMTXJyNTqW0dOIBXRzoutIroFckXokk6?=
 =?us-ascii?Q?pHR+PkNXjmDqJYy3S+kYPjoK4jiLRCA3szqQEwJrFtndsMHT/UyfuljRMD2v?=
 =?us-ascii?Q?4ZlbV9ez950mIcV91Thk6DgPPTi55HvDZsU1bgct6jaKKlXG9wD/gYFH8vS0?=
 =?us-ascii?Q?MmYr+Rt2wNArMU4PybizIImcaxjee5qvpXMEywDyrfQSfXDpXAONjkFUTYTj?=
 =?us-ascii?Q?p0CXQljVTQXH4dU25+4hpga3YA9GXq7kipb+5rtLDu1ZdWAJ+y7aWARzv4LI?=
 =?us-ascii?Q?1uvyGSbdG4l6UOjbBz2U2tYfcScXLEXBwgcCvmPr2QkHL1Q2Yf+86MZnw6dR?=
 =?us-ascii?Q?j/WhEz9KvIgklTztr2qlviGKs81ZswW6l92lKsOYjB09yn3FROlv/Vj/oHc1?=
 =?us-ascii?Q?ShxZsSX9oJE8o+jfQZ/iRtzuBaASG74yMazLQU4G1zOpsRM5+/u5VrfjHpEX?=
 =?us-ascii?Q?KLf4Rpq7Um3lFfln8OXDcWSZIaOYIPP7CBzND+srenPI3UEejKCrhEtTke/j?=
 =?us-ascii?Q?AZS5bDJju7PJo92Gr/4J1Cwzo28BXOxXWYe+LMo9KbH1YqQySuYVvOg2wlKt?=
 =?us-ascii?Q?FYGoiKgiZ3802utf7LwZ7tylHSrf2LJV+RF7SyB5jh2ZS70+a7atcf8jbrwr?=
 =?us-ascii?Q?0vIk3yv9UrNYarfdohAsV74+EfveImf9aBC51BXZ8Yd0iTP9B8oN6RQlpyGI?=
 =?us-ascii?Q?9gn6ibuTN6cwVX6Mx63NF8fV9ZmN1Ja5sdmaJfZVDJE0F0ZNyqkDDiysLlpu?=
 =?us-ascii?Q?51FvUHmO9QN8GSihRSNosRtMAwyoumWuKSrP8DX/muHCy2XmOcHeGc1Acpua?=
 =?us-ascii?Q?8e+p385o3s2uSwQ9aSS5aeP1bwRHuYOoKDv/a86+yMz56XC57VbXSlDpw5r/?=
 =?us-ascii?Q?UX0U5HCqwEUyQgQSaqz7mAwcg8kjKKK+oZVCFtselxd6+pz5A+sA84kia1mj?=
 =?us-ascii?Q?bWFLKqFPxfarDliurRbfdHB2VWlpP0EjnBuMTjnxg2meZzg3oJjgGUc96emw?=
 =?us-ascii?Q?ilRTxDVC9RyNeTegyPWtgw2ZgRzUZ4kUrtriYEzoVYl9qjdOW0y1oFLyihv+?=
 =?us-ascii?Q?O5EP4WVoDamWpOkzT9EXCiVAPDFeXrtVIrLQ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 15:30:33.1887 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb35af7a-34ad-4ca2-9926-08dd4d0c85a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4309
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTiGZ1KF+FDMAflV1ZjR+sXqtfap00yYrIpTszsaAD8=;
 b=0Cms3CKs6sB+B7VagusXbWn6+F6BnPuTG7oUgQohFyYd7nojN+ryKWsY8qrJYM/7gxa/rAS3oMMUWOXDbx0yFv5ePxTkc3TJnX0UajG5FVR8lWr3a9CfSzgeDGyXwdppK6JSeTDDSjLAEftdZEQejQ8y5IJxoY6aANjaZsCkbG8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=0Cms3CKs
Subject: [Buildroot] [PATCH v1 4/4]
 toolchain/toolchain-bare-metal-buildroot: update help text for multiple
 tuple support
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
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that binutils-bare-metal, gcc-bare-metal and newlib-bare-metal packages
have been upgraded to support a list of architecture tuples, this patch
updates the toolchain-bare-metal-buildroot help text to describe the new
capability.

BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH is still backwards compatible with
its prior definition as defining a single tuple with this new definition
works exactly the same as before.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 toolchain/Config.in                                   |  2 +-
 toolchain/toolchain-bare-metal-buildroot/Config.in    | 11 ++++++++---
 .../toolchain-bare-metal-buildroot.mk                 |  1 -
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index d6ed25ff96..94723da141 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -941,7 +941,7 @@ config BR2_TOOLCHAIN_HAS_LIBQUADMATH
 comment "Bare metal toolchain"
 
 config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
-	bool "Build a bare metal toolchain"
+	bool "Build bare metal toolchains"
 	select BR2_PACKAGE_NEWLIB_BARE_METAL
 	help
 	  Select if you need a bare-metal toolchain for building
diff --git a/toolchain/toolchain-bare-metal-buildroot/Config.in b/toolchain/toolchain-bare-metal-buildroot/Config.in
index 6fe969357f..ca3129444f 100644
--- a/toolchain/toolchain-bare-metal-buildroot/Config.in
+++ b/toolchain/toolchain-bare-metal-buildroot/Config.in
@@ -1,10 +1,15 @@
 if BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
 
 config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH
-	string "architecture tuple"
+	string "list of architecture tuples"
 	help
-	  This option allows to define the architecture tuple for the
-	  bare-metal toolchain.
+	  This option defines a list of architecture tuples for
+	  building bare metal toolchains.
+
+	  For example, to build both a microblaze and a riscv bare
+	  metal toolchain for Xilinx platforms, use the following
+	  definition:
+	  "microblazeel-xilinx-elf riscv32-xilinx-elf"
 
 source "package/newlib-bare-metal/Config.in"
 
diff --git a/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk b/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk
index dbfe30a910..71063fcee4 100644
--- a/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk
+++ b/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk
@@ -6,7 +6,6 @@
 
 TOOLCHAIN_BARE_METAL_BUILDROOT_DEPENDENCIES = newlib-bare-metal
 TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE = $(call qstrip,$(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH))
-TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT = $(HOST_DIR)/$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE)/sysroot
 TOOLCHAIN_BARE_METAL_BUILDROOT_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 $(eval $(virtual-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
