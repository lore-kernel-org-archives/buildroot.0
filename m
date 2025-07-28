Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6F0C87FCE
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 04:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56060608F5;
	Mon, 28 Jul 2025 04:52:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VHY2WKvjcdAc; Mon, 28 Jul 2025 04:52:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 577B96086A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 577B96086A;
	Mon, 28 Jul 2025 04:52:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 555E1DA
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 04:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43A936086A
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 04:52:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rFL0yAgVnh7f for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 04:51:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::600;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 57528608DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57528608DC
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::600])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57528608DC
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 04:51:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fK0dolR/IG/FiPpKR1L4BABd/VEmzmzVMIsB5BJVCje6AkJdsXLt5AfLeLAtJ+cXBCQYIYhWNqfAS9e7qkFI4Wl2DE7WHwb0Ks6yKU3YMJyweJQsRXILTMPO8A+U0mr0oKQsI44kNzyCxXyPTH1F5rf0LqgUr1eO91fWlEtoJzQaT9LXwfIUJaIbyITk5Xe0NcCfYV5UHoYZSTPNdSe7pQ4F8g8+UY6KDpVXS4uUm6sBGNInC5EcR6qV+Ci3WFuJHkKfqhIpTiVTzEwaWpB3SIceKemPF5ISMkdLxVN3a/B2ONT39KBMXpaVFAQhOCmbcjPy59cYs2j/e0f0UfgjGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7VmZL5wAklow45MxGVZhK9/0iDCMk2UQy11artncNI=;
 b=SXvxpjP+4oXBV8r+HS1SDUhxfJP6+7Wf9kZg/jDDG3pavFx+vAKR5r+Z53lFvT54pGv4KgshcnielnaVLuzAEARQnuIzxHcFFMr+fR5EM3SkyZVy3yxGzNVUB7bR7gMEOs51sFDN365HdBma1GC8qQXJSGQpotyUtdkdjOjZZquBVTn83/1TerdnV8YKB5CaYqPy1QoTrxdHSazomzR9p01ftpMP0Sn7+S/EGhAii/UpEJ1UD5d6v19himxtWApOVqlFzcMIqe27HczlmNS90REx2IC6gXM/viXzF7rZYPLbCE5KNluVBwPkATmSEaVmCzqYCigzBa7NmXULC36lFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BYAPR06CA0061.namprd06.prod.outlook.com (2603:10b6:a03:14b::38)
 by SA0PR12MB4448.namprd12.prod.outlook.com (2603:10b6:806:94::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Mon, 28 Jul
 2025 04:51:52 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:a03:14b:cafe::69) by BYAPR06CA0061.outlook.office365.com
 (2603:10b6:a03:14b::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.26 via Frontend Transport; Mon,
 28 Jul 2025 04:51:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Mon, 28 Jul 2025 04:51:51 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 27 Jul
 2025 23:51:50 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 27 Jul 2025 23:51:49 -0500
To: <buildroot@buildroot.org>
CC: <thomas.petazzoni@bootlin.com>, <giulio.benetti@benettiengineering.com>,
 <ju.o@free.fr>, <romain.naour@gmail.com>, Neal Frager <neal.frager@amd.com>
Date: Mon, 28 Jul 2025 05:51:45 +0100
Message-ID: <20250728045145.132333-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|SA0PR12MB4448:EE_
X-MS-Office365-Filtering-Correlation-Id: d709270b-7be2-4908-8f5b-08ddcd9277bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AQNvblGIE8kJGZq7CFhmsxxQXTC65dJoUo9H7k5Ms71HEpAz8xRm0OaaDiAv?=
 =?us-ascii?Q?3PyrXCzV/Wbaio/U9nIlbvUgzQ9BJA6i6Nlh1eEUjGK75bY/95bCJRsz6kBf?=
 =?us-ascii?Q?wW6QGF66JNYsFdSWsTzRrlxMJ9BpG68rV0BmONp2+YfYwOE3e+rqmM9Sp2rY?=
 =?us-ascii?Q?1OeW5ljnyAiH3YrNx9O045uaAokbMHZQ4jdGsbskqTqqPbmZmTKoPeNBeqyC?=
 =?us-ascii?Q?coKS3jlEJMvZkmmvXa5pN978p8JTF6zxsJQyFpKOozagmHp6F+zpllRjYAGl?=
 =?us-ascii?Q?x6lDX/5qUte4a5X90Lr0rQtQo6iPUjO6Dlb1hTt6CTBRV3weWrOuUEfuF6Rc?=
 =?us-ascii?Q?8BYyWVRm6nG82hnP47I3cWgNLSnGnnsVV4c5OI4zLBWA9b4lLXxoYQIIguE4?=
 =?us-ascii?Q?HDlsXfmXvf0ib/9yFaoyMoWK0qaO+nqMGGI0laca7oqdoyNtf62XU7IW7tNh?=
 =?us-ascii?Q?Xmzwu9SowlnZXFDi4JlRwo7uvS9/K4u69/sjZoK0DSJT2xFmaNtkRz1g1tgU?=
 =?us-ascii?Q?/5TTA7VwHA0tX3MvGD4eQeKWCC2DDIOJn1Pn+zGz3uJsDJoc5Ovf1h26UGRS?=
 =?us-ascii?Q?BYg2QKhBclBGag0miI2C/nvlDQkjleSQJU1nx9fVU+C3PD428JOt3/aFk9Hd?=
 =?us-ascii?Q?bLlF3CGJViw8W8YdJKWxM14fwGzzhliuQJ7twgcxXISTxm4sWV2hyN/wewow?=
 =?us-ascii?Q?eW9u1KxARxinL/PTu80nv7qqp+R9Vb3FVivSnKeM0QGR+iQB7/vu3mwG13CY?=
 =?us-ascii?Q?Xy2aQD7Ybiyvz/w335jSNhsYg5prm9Nco9cuF6nNst79/xWI4zGOuLGTgHY0?=
 =?us-ascii?Q?2VhMm5MJrh3rQ4Ne0ka5dfIT7c8chDYkC0tpbc7rvC5tgC0aDKlpuPBQgoPu?=
 =?us-ascii?Q?yRHSIHKxwP+shgDemGzUuamA989+tr2tPRcheHZFPO1reyx6kKSI5fPkOf0m?=
 =?us-ascii?Q?KA9Sq7tmhdooEa03YFWlkM0++YhlIFKIh4ci54/xuqOCQ7qHD0gizRpg0Tjg?=
 =?us-ascii?Q?V7qQK8kFThicykXGzdfGjfw487S/XNIcdYGu5CSIKXniX8cNOFlZDVrNwfsj?=
 =?us-ascii?Q?dJ+FJ3tshu0N97caivGT7nKeEcug+TfJA4e1l5NgEG20mJZIeMqcjXrgXmCY?=
 =?us-ascii?Q?tPreJBXxHnu+FU0Mdy4hc+XUaew9f7Rxx4bVxBqX7cLebnPk+dFNmqBJ+3gj?=
 =?us-ascii?Q?7ehQwRPQMjoQZNsdPu9JWIAOb4XmPb0Gx5zfpLenfOzNizWxWOq7Dj7yIdUL?=
 =?us-ascii?Q?v8oMr7z6qB0C5YAXv2GQjMhMIomtyi2WxU4CR85zuGBMmznHc4Ep42iGGPAL?=
 =?us-ascii?Q?X0BI+bSgX0l/4EEV2coFA60FxGlDBU3vVfWr9+/0kPpIVjujba8wNx7kXWnj?=
 =?us-ascii?Q?nGqLkxkiJKwCH7jQehJk3tWDlWSp6RM4cIAf19ugyn7fHPpKMnoPBt/lG6Ud?=
 =?us-ascii?Q?DwnN49vF89P4jvlKyeN20iKvzmzdYMIOffVDjCacXNpKV9pIZ0mQbzkkFLUT?=
 =?us-ascii?Q?XYdpDqDzarp7HJnvZD7HSnrtSwh0da+oUkGl3FAXFdyB0oMp0sywYmT8qYbA?=
 =?us-ascii?Q?p8ii0CLPTyPs/EMG/7U=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 04:51:51.3041 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d709270b-7be2-4908-8f5b-08ddcd9277bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4448
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7VmZL5wAklow45MxGVZhK9/0iDCMk2UQy11artncNI=;
 b=p0mV0CkomtG0LrRXZC1s2ugEYhkTafLykF66dZYuTACDaX7q5xu0Rz1VMa6Rq2TijM/KTX96m1fzzi3EON0vjwM5dh2axJ0TvpMQ6FZ33DFl6e+jGW8j+8vOFmXKkgKRq5L33zvgxVWhcbQGNhQdeCpJ1fhv2ndcsl9fxGBysyI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=p0mV0Cko
Subject: [Buildroot] [PATCH v1 1/1] package/gcc: add microblaze atomic
 support
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
is required to use atomic test and set with gcc 14 and 15 which has been
submitted upstream.

To test this patch with gcc 14:
$ cat > .config<<EOF
BR2_microblazeel=y
BR2_GCC_VERSION_14_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_ACPITOOL=y
EOF
$ make olddefconfig
$ make

To test this patch with gcc 15:
$ cat > .config<<EOF
BR2_microblazeel=y
BR2_GCC_VERSION_15_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_ACPITOOL=y
EOF
$ make olddefconfig
$ make

Fixes: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118280
Upstream: https://patchwork.ozlabs.org/project/gcc/list/?series=466193

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
RFC->V1:
- Updated patch, so that barrel shift instructions no longer required.
- Removed first patch from series since barrel shift not required.
- Added patch to both gcc/14.3.0 and gcc/15.1.0 directories.
- Added test instructions for both gcc 14 and 15.
---
 ...laze-add-atomic-test-and-set-support.patch | 286 ++++++++++++++++++
 ...laze-add-atomic-test-and-set-support.patch | 286 ++++++++++++++++++
 package/gcc/Config.in.host                    |   6 -
 3 files changed, 572 insertions(+), 6 deletions(-)
 create mode 100644 package/gcc/14.3.0/0003-microblaze-add-atomic-test-and-set-support.patch
 create mode 100644 package/gcc/15.1.0/0002-microblaze-add-atomic-test-and-set-support.patch

diff --git a/package/gcc/14.3.0/0003-microblaze-add-atomic-test-and-set-support.patch b/package/gcc/14.3.0/0003-microblaze-add-atomic-test-and-set-support.patch
new file mode 100644
index 0000000000..db6aefaef2
--- /dev/null
+++ b/package/gcc/14.3.0/0003-microblaze-add-atomic-test-and-set-support.patch
@@ -0,0 +1,286 @@
+From cd01b277c4a9e03c83427290228e4b289a169431 Mon Sep 17 00:00:00 2001
+From: Gopi Kumar Bulusu <gopi@sankhya.com>
+Date: Thu, 10 Jul 2025 12:44:44 +0530
+Subject: [PATCH] MicroBlaze : Enhance support for atomics. Fix PR118280
+
+Atomic support enhanced to fix existing atomic_compare_and_swapsi pattern
+to handle side effects; new patterns atomic_fetch_op and atomic_test_and_set
+added. As MicroBlaze has no QImode test/set instruction, use shift magic
+to implement atomic_test_and_set. This fixes PR118280.
+
+Files Changed
+
+* gcc/config/microblaze/iterators.md: New
+* microblaze-protos.h/microblaze.cc : Add microblaze_subword_address
+* gcc/config/microblaze/microblaze.md: constants: Add UNSPECV_CAS_BOOL,
+  UNSPECV_CAS_MEM, UNSPECV_CAS_VAL, UNSPECV_ATOMIC_FETCH_OP
+  type: add atomic
+* gcc/config/microblaze/sync.md: Add atomic_fetch_<atomic_optab>si
+  atomic_test_and_set
+
+Fixes: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118280
+Upstream: https://patchwork.ozlabs.org/project/gcc/list/?series=466193
+
+Signed-off-by: Kirk Meyer <kirk.meyer@sencore.com>
+Signed-off-by: David Holsgrove <david.holsgrove@xilinx.com>
+Signed-off-by: Gopi Kumar Bulusu <gopi@sankhya.com>
+---
+ gcc/config/microblaze/iterators.md        |  25 +++++
+ gcc/config/microblaze/microblaze-protos.h |   1 +
+ gcc/config/microblaze/microblaze.cc       |  28 ++++++
+ gcc/config/microblaze/microblaze.h        |   2 +-
+ gcc/config/microblaze/microblaze.md       |   7 +-
+ gcc/config/microblaze/sync.md             | 107 ++++++++++++++++++----
+ 6 files changed, 150 insertions(+), 20 deletions(-)
+ create mode 100644 gcc/config/microblaze/iterators.md
+
+diff --git a/gcc/config/microblaze/iterators.md b/gcc/config/microblaze/iterators.md
+new file mode 100644
+index 00000000000..2ffc2422a0a
+--- /dev/null
++++ b/gcc/config/microblaze/iterators.md
+@@ -0,0 +1,25 @@ 
++;; Iterator definitions for GCC MicroBlaze machine description files.
++;; Copyright (C) 2012-2024 Free Software Foundation, Inc.
++;;
++;; This file is part of GCC.
++;;
++;; GCC is free software; you can redistribute it and/or modify
++;; it under the terms of the GNU General Public License as published by
++;; the Free Software Foundation; either version 3, or (at your option)
++;; any later version.
++;;
++;; GCC is distributed in the hope that it will be useful,
++;; but WITHOUT ANY WARRANTY; without even the implied warranty of
++;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++;; GNU General Public License for more details.
++;;
++;; You should have received a copy of the GNU General Public License
++;; along with GCC; see the file COPYING3.  If not see
++;; <http://www.gnu.org/licenses/>.
++
++; atomics code iterator
++(define_code_iterator any_atomic [plus ior xor and])
++
++; atomics code attribute
++(define_code_attr atomic_optab
++  [(plus "add") (ior "or") (xor "xor") (and "and")])
+diff --git a/gcc/config/microblaze/microblaze-protos.h b/gcc/config/microblaze/microblaze-protos.h
+index 90b79cfe716..1cee0b3096c 100644
+--- a/gcc/config/microblaze/microblaze-protos.h
++++ b/gcc/config/microblaze/microblaze-protos.h
+@@ -62,6 +62,7 @@  extern int symbol_mentioned_p (rtx);
+ extern int label_mentioned_p (rtx);
+ extern bool microblaze_cannot_force_const_mem (machine_mode, rtx);
+ extern void microblaze_eh_return (rtx op0);
++extern void microblaze_subword_address (rtx, rtx *, rtx *);
+ #endif  /* RTX_CODE */
+ 
+ /* Declare functions in microblaze-c.cc.  */
+diff --git a/gcc/config/microblaze/microblaze.cc b/gcc/config/microblaze/microblaze.cc
+index 2ab5ada4ec9..80d10ab60e0 100644
+--- a/gcc/config/microblaze/microblaze.cc
++++ b/gcc/config/microblaze/microblaze.cc
+@@ -1299,6 +1299,34 @@  microblaze_expand_block_move (rtx dest, rtx src, rtx length, rtx align_rtx)
+   return false;
+ }
+ 
++/* Compute memory address *aligned_mem and corresponding shift value (*shift)
++   from a QImode memory reference MEM */
++void
++microblaze_subword_address (rtx mem, rtx *aligned_mem, rtx *shift)
++{
++  /* Align the memory address to a word.  */
++  rtx addr = force_reg (Pmode, XEXP (mem, 0));
++
++  rtx addr_mask = gen_int_mode (-4, Pmode);
++
++  rtx aligned_addr = gen_reg_rtx (Pmode);
++
++  emit_move_insn (aligned_addr,  gen_rtx_AND (Pmode, addr, addr_mask));
++
++  *aligned_mem = change_address (mem, SImode, aligned_addr);
++
++  /* Calculate the shift amount.  */
++  emit_move_insn (*shift, gen_rtx_AND (SImode, addr, gen_int_mode (3, SImode)));
++
++  if (TARGET_LITTLE_ENDIAN == 0) {
++    emit_move_insn (*shift,
++		    gen_rtx_MINUS (SImode, gen_int_mode (3, SImode), *shift));
++  }
++
++  emit_move_insn (*shift, gen_rtx_ASHIFT (SImode, *shift,
++					  gen_int_mode (3, SImode)));
++}
++
+ static bool
+ microblaze_rtx_costs (rtx x, machine_mode mode, int outer_code ATTRIBUTE_UNUSED,
+ 		      int opno ATTRIBUTE_UNUSED, int *total,
+diff --git a/gcc/config/microblaze/microblaze.h b/gcc/config/microblaze/microblaze.h
+index 2390542434b..b2e9ccde363 100644
+--- a/gcc/config/microblaze/microblaze.h
++++ b/gcc/config/microblaze/microblaze.h
+@@ -57,7 +57,7 @@  extern enum pipeline_type microblaze_pipe;
+ 
+ /* Default target_flags if no switches are specified  */
+ #define TARGET_DEFAULT      (MASK_SOFT_MUL | MASK_SOFT_DIV | MASK_SOFT_FLOAT \
+-                             | TARGET_ENDIAN_DEFAULT)
++			      | TARGET_ENDIAN_DEFAULT)
+ 
+ /* Do we have CLZ?  */
+ #define TARGET_HAS_CLZ      (TARGET_PATTERN_COMPARE && microblaze_has_clz)
+diff --git a/gcc/config/microblaze/microblaze.md b/gcc/config/microblaze/microblaze.md
+index 45c48a71e8d..270df8da0c5 100644
+--- a/gcc/config/microblaze/microblaze.md
++++ b/gcc/config/microblaze/microblaze.md
+@@ -21,6 +21,7 @@ 
+ 
+ (include "constraints.md")
+ (include "predicates.md")
++(include "iterators.md")
+ 
+ ;;----------------------------------------------------
+ ;; Constants
+@@ -43,6 +44,10 @@ 
+   (UNSPEC_TLS           106)    ;; jump table
+   (UNSPEC_SET_TEXT      107)    ;; set text start
+   (UNSPEC_TEXT          108)    ;; data text relative
++  (UNSPECV_CAS_BOOL     201)    ;; compare and swap (bool)
++  (UNSPECV_CAS_VAL      202)    ;; compare and swap (val)
++  (UNSPECV_CAS_MEM      203)    ;; compare and swap (mem)
++  (UNSPECV_ATOMIC_FETCH_OP     204)    ;; atomic fetch op
+ ])
+ 
+ (define_c_enum "unspec" [
+@@ -79,7 +84,7 @@ 
+ ;; bshift 	Shift operations
+ 
+ (define_attr "type"
+-  "unknown,branch,jump,call,load,store,move,arith,darith,imul,idiv,icmp,multi,nop,no_delay_arith,no_delay_load,no_delay_store,no_delay_imul,no_delay_move,bshift,fadd,frsub,fmul,fdiv,fcmp,fsl,fsqrt,fcvt,trap"
++  "unknown,branch,jump,call,load,store,move,arith,darith,imul,idiv,icmp,multi,nop,no_delay_arith,no_delay_load,no_delay_store,no_delay_imul,no_delay_move,bshift,fadd,frsub,fmul,fdiv,fcmp,fsl,fsqrt,fcvt,trap,atomic"
+   (const_string "unknown"))
+ 
+ ;; Main data type used by the insn
+diff --git a/gcc/config/microblaze/sync.md b/gcc/config/microblaze/sync.md
+index db7b11e5379..6478ab6dcac 100644
+--- a/gcc/config/microblaze/sync.md
++++ b/gcc/config/microblaze/sync.md
+@@ -18,26 +18,97 @@ 
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
++  [(set (match_operand:SI 0 "register_operand" "=&d")		;; bool output
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
+ )
++
++;;
++;;
++;;
++;;
++(define_insn "atomic_fetch_<atomic_optab>si"
++  [(set (match_operand:SI 0 "register_operand" "=&d")
++	(match_operand:SI 1 "memory_operand" "+Q"))
++   (set (match_dup 1)
++	(unspec_volatile:SI
++	  [(any_atomic:SI (match_dup 1)
++		   (match_operand:SI 2 "register_operand" "d"))
++	   (match_operand:SI 3 "const_int_operand")] ;; model
++	 UNSPECV_ATOMIC_FETCH_OP))
++   (clobber (match_scratch:SI 4 "=&d"))]	  ;; tmp_1
++  ""
++  {
++    return 
++      "lwx  \t%0,%y1,r0\n\t"
++      "addic\t%4,r0,0\n\t"
++      "bnei \t%4,.-8\n\t"
++      "<atomic_optab>\t%4,%0,%2\n\t"
++      "swx  \t%4,%y1,r0\n\t"
++      "addic\t%4,r0,0\n\t"
++      "bnei \t%4,.-24";
++  }
++  [(set_attr "type"	"atomic")
++  (set_attr "mode"	"SI")
++  (set_attr "length"	"28")])
++
++;;
++;; MicroBlaze only supports lx/sx instructions for word mode only
++;;
++;; Use shift|mask magic to implement atomic_test_and_set using lwx/swx
++;;
++(define_expand "atomic_test_and_set"
++  [(match_operand:QI 0 "register_operand" "")    ;; bool output
++   (match_operand:QI 1 "memory_operand" "m")    ;; memory
++   (match_operand:SI 2 "const_int_operand" "")]  ;; model
++  ""
++{
++  rtx old = gen_reg_rtx (SImode);
++  rtx mem = operands[1];
++  rtx model = operands[2];
++  rtx set = gen_reg_rtx (SImode);
++  rtx aligned_mem = gen_reg_rtx (SImode);
++  rtx shift = gen_reg_rtx (SImode);
++
++  microblaze_subword_address (mem, &aligned_mem, &shift);
++
++  emit_move_insn (set, GEN_INT (1));
++  rtx shifted_set = gen_reg_rtx (SImode);
++
++  emit_move_insn (shifted_set, gen_rtx_ASHIFT (SImode, set, shift));
++
++  emit_insn (gen_atomic_fetch_orsi (old, aligned_mem, shifted_set, model));
++
++  emit_move_insn (old, gen_rtx_ASHIFTRT (SImode, old, shift));
++
++  emit_move_insn (operands[0], gen_lowpart (QImode, old));
++
++  DONE;
++})
+-- 
+2.43.5
+
diff --git a/package/gcc/15.1.0/0002-microblaze-add-atomic-test-and-set-support.patch b/package/gcc/15.1.0/0002-microblaze-add-atomic-test-and-set-support.patch
new file mode 100644
index 0000000000..db6aefaef2
--- /dev/null
+++ b/package/gcc/15.1.0/0002-microblaze-add-atomic-test-and-set-support.patch
@@ -0,0 +1,286 @@
+From cd01b277c4a9e03c83427290228e4b289a169431 Mon Sep 17 00:00:00 2001
+From: Gopi Kumar Bulusu <gopi@sankhya.com>
+Date: Thu, 10 Jul 2025 12:44:44 +0530
+Subject: [PATCH] MicroBlaze : Enhance support for atomics. Fix PR118280
+
+Atomic support enhanced to fix existing atomic_compare_and_swapsi pattern
+to handle side effects; new patterns atomic_fetch_op and atomic_test_and_set
+added. As MicroBlaze has no QImode test/set instruction, use shift magic
+to implement atomic_test_and_set. This fixes PR118280.
+
+Files Changed
+
+* gcc/config/microblaze/iterators.md: New
+* microblaze-protos.h/microblaze.cc : Add microblaze_subword_address
+* gcc/config/microblaze/microblaze.md: constants: Add UNSPECV_CAS_BOOL,
+  UNSPECV_CAS_MEM, UNSPECV_CAS_VAL, UNSPECV_ATOMIC_FETCH_OP
+  type: add atomic
+* gcc/config/microblaze/sync.md: Add atomic_fetch_<atomic_optab>si
+  atomic_test_and_set
+
+Fixes: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118280
+Upstream: https://patchwork.ozlabs.org/project/gcc/list/?series=466193
+
+Signed-off-by: Kirk Meyer <kirk.meyer@sencore.com>
+Signed-off-by: David Holsgrove <david.holsgrove@xilinx.com>
+Signed-off-by: Gopi Kumar Bulusu <gopi@sankhya.com>
+---
+ gcc/config/microblaze/iterators.md        |  25 +++++
+ gcc/config/microblaze/microblaze-protos.h |   1 +
+ gcc/config/microblaze/microblaze.cc       |  28 ++++++
+ gcc/config/microblaze/microblaze.h        |   2 +-
+ gcc/config/microblaze/microblaze.md       |   7 +-
+ gcc/config/microblaze/sync.md             | 107 ++++++++++++++++++----
+ 6 files changed, 150 insertions(+), 20 deletions(-)
+ create mode 100644 gcc/config/microblaze/iterators.md
+
+diff --git a/gcc/config/microblaze/iterators.md b/gcc/config/microblaze/iterators.md
+new file mode 100644
+index 00000000000..2ffc2422a0a
+--- /dev/null
++++ b/gcc/config/microblaze/iterators.md
+@@ -0,0 +1,25 @@ 
++;; Iterator definitions for GCC MicroBlaze machine description files.
++;; Copyright (C) 2012-2024 Free Software Foundation, Inc.
++;;
++;; This file is part of GCC.
++;;
++;; GCC is free software; you can redistribute it and/or modify
++;; it under the terms of the GNU General Public License as published by
++;; the Free Software Foundation; either version 3, or (at your option)
++;; any later version.
++;;
++;; GCC is distributed in the hope that it will be useful,
++;; but WITHOUT ANY WARRANTY; without even the implied warranty of
++;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++;; GNU General Public License for more details.
++;;
++;; You should have received a copy of the GNU General Public License
++;; along with GCC; see the file COPYING3.  If not see
++;; <http://www.gnu.org/licenses/>.
++
++; atomics code iterator
++(define_code_iterator any_atomic [plus ior xor and])
++
++; atomics code attribute
++(define_code_attr atomic_optab
++  [(plus "add") (ior "or") (xor "xor") (and "and")])
+diff --git a/gcc/config/microblaze/microblaze-protos.h b/gcc/config/microblaze/microblaze-protos.h
+index 90b79cfe716..1cee0b3096c 100644
+--- a/gcc/config/microblaze/microblaze-protos.h
++++ b/gcc/config/microblaze/microblaze-protos.h
+@@ -62,6 +62,7 @@  extern int symbol_mentioned_p (rtx);
+ extern int label_mentioned_p (rtx);
+ extern bool microblaze_cannot_force_const_mem (machine_mode, rtx);
+ extern void microblaze_eh_return (rtx op0);
++extern void microblaze_subword_address (rtx, rtx *, rtx *);
+ #endif  /* RTX_CODE */
+ 
+ /* Declare functions in microblaze-c.cc.  */
+diff --git a/gcc/config/microblaze/microblaze.cc b/gcc/config/microblaze/microblaze.cc
+index 2ab5ada4ec9..80d10ab60e0 100644
+--- a/gcc/config/microblaze/microblaze.cc
++++ b/gcc/config/microblaze/microblaze.cc
+@@ -1299,6 +1299,34 @@  microblaze_expand_block_move (rtx dest, rtx src, rtx length, rtx align_rtx)
+   return false;
+ }
+ 
++/* Compute memory address *aligned_mem and corresponding shift value (*shift)
++   from a QImode memory reference MEM */
++void
++microblaze_subword_address (rtx mem, rtx *aligned_mem, rtx *shift)
++{
++  /* Align the memory address to a word.  */
++  rtx addr = force_reg (Pmode, XEXP (mem, 0));
++
++  rtx addr_mask = gen_int_mode (-4, Pmode);
++
++  rtx aligned_addr = gen_reg_rtx (Pmode);
++
++  emit_move_insn (aligned_addr,  gen_rtx_AND (Pmode, addr, addr_mask));
++
++  *aligned_mem = change_address (mem, SImode, aligned_addr);
++
++  /* Calculate the shift amount.  */
++  emit_move_insn (*shift, gen_rtx_AND (SImode, addr, gen_int_mode (3, SImode)));
++
++  if (TARGET_LITTLE_ENDIAN == 0) {
++    emit_move_insn (*shift,
++		    gen_rtx_MINUS (SImode, gen_int_mode (3, SImode), *shift));
++  }
++
++  emit_move_insn (*shift, gen_rtx_ASHIFT (SImode, *shift,
++					  gen_int_mode (3, SImode)));
++}
++
+ static bool
+ microblaze_rtx_costs (rtx x, machine_mode mode, int outer_code ATTRIBUTE_UNUSED,
+ 		      int opno ATTRIBUTE_UNUSED, int *total,
+diff --git a/gcc/config/microblaze/microblaze.h b/gcc/config/microblaze/microblaze.h
+index 2390542434b..b2e9ccde363 100644
+--- a/gcc/config/microblaze/microblaze.h
++++ b/gcc/config/microblaze/microblaze.h
+@@ -57,7 +57,7 @@  extern enum pipeline_type microblaze_pipe;
+ 
+ /* Default target_flags if no switches are specified  */
+ #define TARGET_DEFAULT      (MASK_SOFT_MUL | MASK_SOFT_DIV | MASK_SOFT_FLOAT \
+-                             | TARGET_ENDIAN_DEFAULT)
++			      | TARGET_ENDIAN_DEFAULT)
+ 
+ /* Do we have CLZ?  */
+ #define TARGET_HAS_CLZ      (TARGET_PATTERN_COMPARE && microblaze_has_clz)
+diff --git a/gcc/config/microblaze/microblaze.md b/gcc/config/microblaze/microblaze.md
+index 45c48a71e8d..270df8da0c5 100644
+--- a/gcc/config/microblaze/microblaze.md
++++ b/gcc/config/microblaze/microblaze.md
+@@ -21,6 +21,7 @@ 
+ 
+ (include "constraints.md")
+ (include "predicates.md")
++(include "iterators.md")
+ 
+ ;;----------------------------------------------------
+ ;; Constants
+@@ -43,6 +44,10 @@ 
+   (UNSPEC_TLS           106)    ;; jump table
+   (UNSPEC_SET_TEXT      107)    ;; set text start
+   (UNSPEC_TEXT          108)    ;; data text relative
++  (UNSPECV_CAS_BOOL     201)    ;; compare and swap (bool)
++  (UNSPECV_CAS_VAL      202)    ;; compare and swap (val)
++  (UNSPECV_CAS_MEM      203)    ;; compare and swap (mem)
++  (UNSPECV_ATOMIC_FETCH_OP     204)    ;; atomic fetch op
+ ])
+ 
+ (define_c_enum "unspec" [
+@@ -79,7 +84,7 @@ 
+ ;; bshift 	Shift operations
+ 
+ (define_attr "type"
+-  "unknown,branch,jump,call,load,store,move,arith,darith,imul,idiv,icmp,multi,nop,no_delay_arith,no_delay_load,no_delay_store,no_delay_imul,no_delay_move,bshift,fadd,frsub,fmul,fdiv,fcmp,fsl,fsqrt,fcvt,trap"
++  "unknown,branch,jump,call,load,store,move,arith,darith,imul,idiv,icmp,multi,nop,no_delay_arith,no_delay_load,no_delay_store,no_delay_imul,no_delay_move,bshift,fadd,frsub,fmul,fdiv,fcmp,fsl,fsqrt,fcvt,trap,atomic"
+   (const_string "unknown"))
+ 
+ ;; Main data type used by the insn
+diff --git a/gcc/config/microblaze/sync.md b/gcc/config/microblaze/sync.md
+index db7b11e5379..6478ab6dcac 100644
+--- a/gcc/config/microblaze/sync.md
++++ b/gcc/config/microblaze/sync.md
+@@ -18,26 +18,97 @@ 
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
++  [(set (match_operand:SI 0 "register_operand" "=&d")		;; bool output
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
+ )
++
++;;
++;;
++;;
++;;
++(define_insn "atomic_fetch_<atomic_optab>si"
++  [(set (match_operand:SI 0 "register_operand" "=&d")
++	(match_operand:SI 1 "memory_operand" "+Q"))
++   (set (match_dup 1)
++	(unspec_volatile:SI
++	  [(any_atomic:SI (match_dup 1)
++		   (match_operand:SI 2 "register_operand" "d"))
++	   (match_operand:SI 3 "const_int_operand")] ;; model
++	 UNSPECV_ATOMIC_FETCH_OP))
++   (clobber (match_scratch:SI 4 "=&d"))]	  ;; tmp_1
++  ""
++  {
++    return 
++      "lwx  \t%0,%y1,r0\n\t"
++      "addic\t%4,r0,0\n\t"
++      "bnei \t%4,.-8\n\t"
++      "<atomic_optab>\t%4,%0,%2\n\t"
++      "swx  \t%4,%y1,r0\n\t"
++      "addic\t%4,r0,0\n\t"
++      "bnei \t%4,.-24";
++  }
++  [(set_attr "type"	"atomic")
++  (set_attr "mode"	"SI")
++  (set_attr "length"	"28")])
++
++;;
++;; MicroBlaze only supports lx/sx instructions for word mode only
++;;
++;; Use shift|mask magic to implement atomic_test_and_set using lwx/swx
++;;
++(define_expand "atomic_test_and_set"
++  [(match_operand:QI 0 "register_operand" "")    ;; bool output
++   (match_operand:QI 1 "memory_operand" "m")    ;; memory
++   (match_operand:SI 2 "const_int_operand" "")]  ;; model
++  ""
++{
++  rtx old = gen_reg_rtx (SImode);
++  rtx mem = operands[1];
++  rtx model = operands[2];
++  rtx set = gen_reg_rtx (SImode);
++  rtx aligned_mem = gen_reg_rtx (SImode);
++  rtx shift = gen_reg_rtx (SImode);
++
++  microblaze_subword_address (mem, &aligned_mem, &shift);
++
++  emit_move_insn (set, GEN_INT (1));
++  rtx shifted_set = gen_reg_rtx (SImode);
++
++  emit_move_insn (shifted_set, gen_rtx_ASHIFT (SImode, set, shift));
++
++  emit_insn (gen_atomic_fetch_orsi (old, aligned_mem, shifted_set, model));
++
++  emit_move_insn (old, gen_rtx_ASHIFTRT (SImode, old, shift));
++
++  emit_move_insn (operands[0], gen_lowpart (QImode, old));
++
++  DONE;
++})
+-- 
+2.43.5
+
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 23fcaa9825..c093cdbdb9 100644
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
@@ -47,9 +44,6 @@ config BR2_GCC_VERSION_15_X
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
