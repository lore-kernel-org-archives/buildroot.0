Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8756FC7EE30
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 09:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F16B40785;
	Tue,  1 Jul 2025 09:30:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xb4BeeY3eSrW; Tue,  1 Jul 2025 09:30:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E9F141862
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E9F141862;
	Tue,  1 Jul 2025 09:30:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 76E07DF
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 09:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 687C5814DE
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 09:30:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id drLZ5nifCmHI for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 09:30:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::61a;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0C911829DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C911829DB
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::61a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C911829DB
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 09:30:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MKmz+RQWzUV/exnae3T2N2KEjx2WrbnnD4nX1Ex5XIEr7XX9Yo9brEI77qftaCaFYu4xwf9vLEVeBClaVvasX3xN39rZpfwxiTp4TKQsSlzw+EWYrPiTjKssag0OR5P8HE+0zHRL+wK5GkJ4FZclwfXgzKNkS7FaV/K94TAXPz5aBGG35jiUyTyo2SxHBFwveuyWE367tPwRC6tbxvnJ6kBKadGA6FbSP9IR6ccLyBDrPix2Uqyszd3TLGnuSpPsbASyTgMFZE5y7RwhCOLFVueYTMLqAGXucqxRIJafStk4nClRqok3UJi22bnSWPM7tVlNr7SQdwQJCw20PfspJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1iFDQt96ta9rF9K9LYa9jRypMm5eVia7LMbZ5SwYGPs=;
 b=bt1CuW54bIPit3aawKb7r/S9Y0z7xnlxJBVylzVMqpOzNeV2sBIeD/H3KmUVXsfROMCypERGO38BUxdnH3MLw/os3vMYxNJ7eia3+7XLnjZWuuOG0JzgtxgMl2d2tYvLbdI2Jx2OyyY48du9LTosPQaHQ52J9pDdTgmyJGlP3V2BUzSbJreUg1slqfqfPWUU8m6Xq+chnzGWbKFcTAn+drV7KSe1HswAbJGOQNSptgIkNmXGY8vzvWBYXIib3uBH+T9KyBy8QYw92y2YorRJY62QrAKSkp7dEPRhAOI9NM/GvaZIlgfEqXxOFPeIzw6kBaz6S9eeGbQvvE/iCmhH1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MN0PR02CA0003.namprd02.prod.outlook.com (2603:10b6:208:530::6)
 by CH3PR12MB7617.namprd12.prod.outlook.com (2603:10b6:610:140::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Tue, 1 Jul
 2025 09:30:28 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:530:cafe::e1) by MN0PR02CA0003.outlook.office365.com
 (2603:10b6:208:530::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Tue,
 1 Jul 2025 09:30:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 1 Jul 2025 09:30:27 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Jul
 2025 04:30:26 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Jul
 2025 04:30:26 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 1 Jul 2025 04:30:25 -0500
To: <buildroot@buildroot.org>
CC: Giulio Benetti <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Neal Frager <neal.frager@amd.com>
Date: Tue, 1 Jul 2025 10:30:20 +0100
Message-ID: <20250701093020.371352-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250701093020.371352-1-neal.frager@amd.com>
References: <20250701093020.371352-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|CH3PR12MB7617:EE_
X-MS-Office365-Filtering-Correlation-Id: 96936c65-8b25-4f1b-7cc8-08ddb881e9f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1VbLzesPEa7aN8+vFFVzNs8KHsIFCc9agGJCpXYMJlS5zF25qQHghe1/qf9a?=
 =?us-ascii?Q?D5zuB/It0jWJkmpLuaKA5+iOqOxehsDNmO01IzPe+9JcGPSh6Ca4XadbiyCy?=
 =?us-ascii?Q?pZ7b68P/ZfIfl2uITNxhfGLxseBvpSS9jizetFvYrw9M7bAIYrHQQGf0n9lj?=
 =?us-ascii?Q?7/h7aNVE5kLjCYWbCVoeUSiKl2rl2k3VKmO1x3POQAwC06Gh8J7/26Y6XpLA?=
 =?us-ascii?Q?DBL6Zk4UBwxVzj9avNAzHjnX1z/gQf0R0tU+uF8PsO+1+SfFguCfjTfpkJkY?=
 =?us-ascii?Q?8j+nuimWBq/RIS7hjx+Y8QMoJySukLdW6RqcACuiT0KCME9wYGs0SVRkBoKq?=
 =?us-ascii?Q?2d2zySZZWs0XDcZpWkf7fYLWJby9TmJHSGObSEmjT21fFl4COeNV62Tsipbv?=
 =?us-ascii?Q?DnBCchtru2fjTOvBBQzXXlbsnhUjVdH5iPSMdCuxneD7Rx0DSiC8QhGCKc8+?=
 =?us-ascii?Q?+//cgGFwD0mndWrDW43ra3VPj/Yq84nPRBIU2lJr/Jqzij2V+ZanrY/qR9gS?=
 =?us-ascii?Q?9AddZWX3csp5+ocWWWmTEkYA3KhGr+p4yNNKWAr5CSHic0JgYH0cXA9GV+lh?=
 =?us-ascii?Q?hXBKLjtY66zyJyntHL0vSxJsUZ+NbxQLOgCulTH3tKLhZ34RezXhlBaQRLqO?=
 =?us-ascii?Q?NjWrv4Zx821lWw1STK72ObDLfbZ7ctHNj5SbIKTj2lxjqoTtX6z/34LLcYKD?=
 =?us-ascii?Q?kOUygM5Ael4UWXDqRR2c+QcNKv2K9xhCv+MFt6bjxDUGUoaOrLPwhLrT2HWG?=
 =?us-ascii?Q?h+Z+hMoYC+pZHMDrUXqgBpY1bj2Lx+k3AssYgKElxfUWsO5tukuaXhVleLMe?=
 =?us-ascii?Q?9PG78otPcB4e2dlDe9QmL9lCc1FFO7wqJ0yhF/wvxRYqoxNoQeV7S3Rebht6?=
 =?us-ascii?Q?P0Haob24E8ywWznqY6Z6v0mVWReFBkm22Bxl6z4fCvjN2rte8PXtRGEdeI8y?=
 =?us-ascii?Q?BkQQKSqyZtyKu6KLjVCfLiqxuZIg0kfUXvhQcbIrdHwioo5ti8IrsKkdfXOq?=
 =?us-ascii?Q?aIuB9MQ2QCOSiXUlcKxhHg/enADiHKPJpmNNxAEFhdWx7b+EkFJGNIVi9g7q?=
 =?us-ascii?Q?nbKDjiQGZmPsofbf3HgIFzyrG7568LW5+NBasDzKG2RaWDVnb1l3kVu6xW4M?=
 =?us-ascii?Q?i3lN6DNiOBs9XhK/jP+tVEVzLnnR/C1TIpsiW3B+WJb1n1abQ6F0ngYp8rwW?=
 =?us-ascii?Q?6Y1e92w6LJc0zC03DdSClnIaKx4o9vjF965k3S7vIQBr1rYXxyBbHlwLC2mv?=
 =?us-ascii?Q?eNh+ZsOwyY4zizt06Wz3Dmta/1JldapbFnFNp9JU45nF+fetr+dXooQKPvAd?=
 =?us-ascii?Q?wm4qkZh5Au+Op/s0OmzGC7MIa5OqEAQu/0ZblFhNJWd7hGphkCMQ2VooQsGe?=
 =?us-ascii?Q?wYIrVkZwP2GBKZscYFoSrrZjXQWKbHHHPANOLHDrUTRz+5jn8s9OiSvWwHR8?=
 =?us-ascii?Q?9mYG8yzkS126AKYkan3pzjozBEURG6bL3IPMoINEYbKswHbKTaLeV/A2wtY9?=
 =?us-ascii?Q?rLW8vKyYqj7to2wZlBh8iOaLPZP93m7299IrNr2l2SVmJZRpz0Pyfs6A8A?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 09:30:27.1573 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96936c65-8b25-4f1b-7cc8-08ddb881e9f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7617
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1iFDQt96ta9rF9K9LYa9jRypMm5eVia7LMbZ5SwYGPs=;
 b=Tf0/ovLbsNOc3bSkX/2r1r/F2hH9sp9FgPahV+URcpPTOn41MJtus+KzdG1WToc0jkJeyl73bu3Gu8G2Ca6wz9YrwJcfTBd6mxIqyucJUvSsBqAbmlgcy7a4U5b7uegwBQ5vBufIMSGztM7XCdxvm0oK8nHJ8KTcIXthWFq6Rxc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Tf0/ovLb
Subject: [Buildroot] [RFC PATCH 2/2] package/gcc: microblaze atomic support
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

This patch adds atomic test and set support for the microblaze arch.  A patch
is required to use atomic test and set with gcc 14 and 15 which will soon be
submitted upstream.

In order to atomic instructions to work, the microblaze CFLAG
-mxl-barrel-shift must be enabled.

As I have only tested this with gcc 14 so far, I am not sure if I have handled
all potential cases.  For this reason, I am requesting comment on this patch
before submitting a final version.

To test this patch:
$ cat > .config<<EOF
BR2_microblazeel=y
BR2_GCC_VERSION_14_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_ACPITOOL=y
EOF
$ make olddefconfig
$ make

Fixes: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118280
Upstream: to be done with final version

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 ...laze-add-atomic-test-and-set-support.patch | 158 ++++++++++++++++++
 package/gcc/Config.in.host                    |   6 -
 2 files changed, 158 insertions(+), 6 deletions(-)
 create mode 100644 package/gcc/14.3.0/0003-microblaze-add-atomic-test-and-set-support.patch

diff --git a/package/gcc/14.3.0/0003-microblaze-add-atomic-test-and-set-support.patch b/package/gcc/14.3.0/0003-microblaze-add-atomic-test-and-set-support.patch
new file mode 100644
index 0000000000..a79659301d
--- /dev/null
+++ b/package/gcc/14.3.0/0003-microblaze-add-atomic-test-and-set-support.patch
@@ -0,0 +1,158 @@
+From fe1a0a590c4ed079db36c34b0907f0e99c6dd31f Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Mon, 30 Jun 2025 10:26:49 +0100
+Subject: [PATCH] microblaze: add atomic test and set support
+
+This patch adds atomic test and set support for the microblaze arch.
+
+Upstream: to be done soon
+
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+---
+ gcc/config/microblaze/microblaze.md |   6 +-
+ gcc/config/microblaze/sync.md       | 103 +++++++++++++++++++++++-----
+ 2 files changed, 90 insertions(+), 19 deletions(-)
+
+diff --git a/gcc/config/microblaze/microblaze.md b/gcc/config/microblaze/microblaze.md
+index f1f57e6d702..36d786b1d10 100644
+--- a/gcc/config/microblaze/microblaze.md
++++ b/gcc/config/microblaze/microblaze.md
+@@ -43,6 +43,10 @@
+   (UNSPEC_TLS           106)    ;; jump table
+   (UNSPEC_SET_TEXT      107)    ;; set text start
+   (UNSPEC_TEXT          108)    ;; data text relative
++  (UNSPECV_CAS_BOOL     201)    ;; compare and swap (bool)
++  (UNSPECV_CAS_VAL      202)    ;; compare and swap (val)
++  (UNSPECV_CAS_MEM      203)    ;; compare and swap (mem)
++  (UNSPECV_ATS          204)    ;; atomic test and set
+ ])
+ 
+ (define_c_enum "unspec" [
+@@ -79,7 +83,7 @@
+ ;; bshift 	Shift operations
+ 
+ (define_attr "type"
+-  "unknown,branch,jump,call,load,store,move,arith,darith,imul,idiv,icmp,multi,nop,no_delay_arith,no_delay_load,no_delay_store,no_delay_imul,no_delay_move,bshift,fadd,frsub,fmul,fdiv,fcmp,fsl,fsqrt,fcvt,trap"
++"unknown,branch,jump,call,load,store,move,arith,darith,imul,idiv,icmp,multi,nop,no_delay_arith,no_delay_load,no_delay_store,no_delay_imul,no_delay_move,bshift,fadd,frsub,fmul,fdiv,fcmp,fsl,fsqrt,fcvt,trap,atomic"
+   (const_string "unknown"))
+ 
+ ;; Main data type used by the insn
+diff --git a/gcc/config/microblaze/sync.md b/gcc/config/microblaze/sync.md
+index 939168a2d0e..b5fbe1431cc 100644
+--- a/gcc/config/microblaze/sync.md
++++ b/gcc/config/microblaze/sync.md
+@@ -18,26 +18,93 @@
+ ;; <http://www.gnu.org/licenses/>.
+ 
+ (define_insn "atomic_compare_and_swapsi"
+-  [(match_operand:SI 0 "register_operand" "=&d")	;; bool output
+-   (match_operand:SI 1 "register_operand" "=&d")	;; val output
+-   (match_operand:SI 2 "nonimmediate_operand" "+Q")	;; memory
+-   (match_operand:SI 3 "register_operand" "d")		;; expected value
+-   (match_operand:SI 4 "register_operand" "d")		;; desired value
+-   (match_operand:SI 5 "const_int_operand" "")		;; is_weak
+-   (match_operand:SI 6 "const_int_operand" "")		;; mod_s
+-   (match_operand:SI 7 "const_int_operand" "")		;; mod_f
++[(set (match_operand:SI 0 "register_operand" "=&d")		;; bool output
++        (unspec_volatile:SI
++          [(match_operand:SI 2 "nonimmediate_operand" "+Q")	;; memory
++           (match_operand:SI 3 "register_operand" "d")		;; expected value
++           (match_operand:SI 4 "register_operand" "d")]		;; desired value
++          UNSPECV_CAS_BOOL))
++   (set (match_operand:SI 1 "register_operand" "=&d")		;; val output
++        (unspec_volatile:SI [(const_int 0)] UNSPECV_CAS_VAL))
++   (set (match_dup 2)
++        (unspec_volatile:SI [(const_int 0)] UNSPECV_CAS_MEM))
++   (match_operand:SI 5 "const_int_operand" "")			;; is_weak
++   (match_operand:SI 6 "const_int_operand" "")			;; mod_s
++   (match_operand:SI 7 "const_int_operand" "")			;; mod_f
+    (clobber (match_scratch:SI 8 "=&d"))]
+   ""
+   {
+-    output_asm_insn ("addc \tr0,r0,r0", operands);
+-    output_asm_insn ("lwx  \t%1,%y2,r0", operands);
+-    output_asm_insn ("addic\t%8,r0,0", operands);
+-    output_asm_insn ("bnei \t%8,.-8", operands);
+-    output_asm_insn ("cmp  \t%0,%1,%3", operands);
+-    output_asm_insn ("bnei \t%0,.+16", operands);
+-    output_asm_insn ("swx  \t%4,%y2,r0", operands);
+-    output_asm_insn ("addic\t%8,r0,0", operands);
+-    output_asm_insn ("bnei \t%8,.-28", operands);
+-    return "";
++    return "add  \t%0,r0,r0\n\t"
++      "lwx  \t%1,%y2,r0\n\t"
++      "addic\t%8,r0,0\n\t"
++      "bnei \t%8,.-8\n\t"
++      "cmp  \t%8,%1,%3\n\t"
++      "bnei \t%8,.+20\n\t"
++      "swx  \t%4,%y2,r0\n\t"
++      "addic\t%8,r0,0\n\t"
++      "bnei \t%8,.-28\n\t"
++      "addi \t%0,r0,1";
+   }
++  [(set_attr "type"	"atomic")
++  (set_attr "mode"	"SI")
++  (set_attr "length"	"40")]
++)
++
++;;
++;; MicroBlaze has no atomic load/store instruction pair for QImode
++;;
++;; Use load/store reserved word with necessary mem align,shift,mask magic
++;;
++(define_insn "atomic_test_and_set"
++  [(set (match_operand:QI 0 "register_operand" "=&d")		;; bool output
++        (unspec_volatile:QI
++          [(match_operand:QI 1 "nonimmediate_operand" "+Q") ;; memory
++           (match_operand:SI 2 "const_int_operand" "")   ;; model
++	  ]
++	UNSPECV_ATS))
++   (clobber (match_scratch:SI 3 "=&d")) ; old word
++   (clobber (match_scratch:SI 4 "=&d")) ; tmp
++   (clobber (match_scratch:SI 5 "=&d")) ; aligned address
++   (clobber (match_scratch:SI 6 "=&d")) ; shift
++   (clobber (match_scratch:SI 7 "=&d")) ; mask
++   (clobber (match_scratch:SI 8 "=&d")) ; old value
++  ]
++  "TARGET_BARREL_SHIFT"
++  {
++    return
++      /* word align memory address, compute shift  */
++      "andi \t%5,%y1,-4\n\t"
++      "andi \t%6,%y1,3\n\t"
++      "bslli \t%6,%6,3\n\t"
++
++      /* compute set value and mask */
++      "addik \t%7,r0,1\n\t"
++      "bsll \t%7,%7,%6\n\t"
++
++      /* Load and reserve word */
++      "lwx  \t%3,%5,r0\n\t"
++      "addic\t%4,r0,0\n\t"
++      "bnei \t%4,.-8\n\t"
++
++      /* Compute old value */
++      "and \t%8,%3,%7\n\t"
++
++      /* Test Old Value */
++      "cmp \t%4,%8,r0\n\t"
++      "bnei \t%4,.+20\n\t"
++
++      /* Compute Set Word */
++      "or \t%4,%3,%7\n\t"
++
++      /* Try Reserved store */
++      "swx  \t%4,%5,r0\n\t"
++      "addic\t%4,r0,0\n\t"
++      "bnei \t%4,.-36\n\t"
++
++      /* Set result */
++      "bsrl \t%0,%8,%6\n\t";
++  }
++  [(set_attr "type"	"atomic")
++  (set_attr "mode"	"QI")
++  (set_attr "length"	"64")]
+ )
+-- 
+2.25.1
+
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 8640280fdf..e6c10d3e20 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -36,9 +36,6 @@ config BR2_GCC_VERSION_14_X
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_POWERPC_CPU_HAS_SPE
-	# Severely broken on Microblaze
-	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118280
-	depends on !BR2_microblaze
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 
 config BR2_GCC_VERSION_15_X
@@ -46,9 +43,6 @@ config BR2_GCC_VERSION_15_X
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_POWERPC_CPU_HAS_SPE
-	# Severely broken on Microblaze
-	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118280
-	depends on !BR2_microblaze
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 
 endchoice
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
