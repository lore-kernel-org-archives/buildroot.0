Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FE2C61DFD
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 04:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD922807EB;
	Wed,  2 Sep 2026 04:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BXtfRuGGZ0mz; Wed,  2 Sep 2026 04:06:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788322010;
	bh=vZqN2FoJHTdu1WtlAhZYWLXxXyBkaLBh9AICcmbR99A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=FPMmzspCVLk90nAumYV2S4gEjCFh4jDDcS6M9awukbKt8wbZrU7Rklp0dkBFi34B/
	 G14Y9Aw2LSAo0CUfg+g3XaBS/PSmg7tu/7oWLDrSxUwK2xf3nU7AKDPetNS2aLX42q
	 GRoaQSyp6U0st8Y7QiFwOgsJ61CmdBDb4w8701gTX6feDmXPwW99dEnvS8sQCmiDZI
	 ozUY7C1w/wd64EHB8/BlxO7QoflKLTAdwhkeV2UCxWJhCuNoZQAPpk/RiZa/1OjG5h
	 lKFIzr7SsA0OvWId23bIfxI4VFqh1Nnyhy6DyBTLZTOLymzhI1XuzLzbVrXzVZtIaD
	 ZyQELXnsdopfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEDDB80E29;
	Wed,  2 Sep 2026 04:06:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6024F230
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 04:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 448AE80E27
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 04:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id crwiScIS3vi1 for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 04:06:25 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c112::7])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D1D980B03
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 04:02:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ek97W+5PZwuVllmS8MXDP72AyYOiLcBksRsBgaBzfZw6dqQlwgWxHuMRuVXRdJbk5LoGf0APqWWp0CuRnsPgj8TWZr/O1LEQlScyztHGNfLKu8hcvsskwF8m8AUaOHYwP0yH1a86UmIuTFtM3ZnsApFvAgK7YsWrftPAtEeBoImTAXBOacvWEyhVYxfJzVJWQcln5pRh3eftcwXLe01UEa08uAfUJpuUz15iGZgmg6bdxo0IWnAYx0i+GiMt6XPmwXSq/8HTy6+gXbmKlYpa0LPypqd+FJOL7NmCfEdQIfqNS0CJwo5nIZRN4nvLPN4NppZD9/sHd0p/EbTtAwpMJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efk/MO/fXoA2yIFUNT6+bJhqT3cF6B518iRt73f8DRI=;
 b=IJjxF4VQocYdaefipZu4GWBqqF1OTouij6kqdEXmdqHLT9dTd03b0dWi6mF75wXnP/QBxit4JozGO8S9hfiGpQwqkrc5mvlCBWeniCq5Iy94cXPqQ8uBq0OVdH/t9W/NTIj0vLQtrJGw2W8iiHHj35EFyTwTBUwqUTh6fK3IujM4iX/MDGLXN7DTYy4t84toRbwjI63kOgUVupTP5IqXLpNZi7e2jxPXIxfyz/3WIgr/7Ni1IpkPyxym7tx2RRHyNg6xzTIlwsLc8qOUcNVfJcTpcEpK2442D+cVmSgCVS8IVweVbthTUWe6z/6rQKlcdt1yeiASFsXAg8xB2CF0YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH3P221CA0011.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::7)
 by CYYPR12MB8962.namprd12.prod.outlook.com (2603:10b6:930:c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 04:01:39 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:610:1e7:cafe::5a) by CH3P221CA0011.outlook.office365.com
 (2603:10b6:610:1e7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 04:01:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 04:01:37 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 1 Sep
 2026 23:01:36 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 1 Sep
 2026 23:01:30 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Tue, 1 Sep 2026 23:01:29 -0500
To: <buildroot@buildroot.org>
Date: Wed, 2 Sep 2026 05:01:21 +0100
Message-ID: <20260902040121.1583600-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|CYYPR12MB8962:EE_
X-MS-Office365-Filtering-Correlation-Id: 65dfdac2-8e28-470e-dfde-08df08a6e319
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|23010399003|36860700016|82310400026|3023799007|10067099003|56012099006|11063799006|5023799004|18002099003|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: vyeeq2fiJX0L6wxeK/S7axZfdFmiwJ0XSoPbrhGFlMi0TWG7WuafYd52M3eQZoq3FCzwoe6O1YSaFlM/Ci4HeQfnD/IWJeiBmny1+ckCkbB36U1611e8OjGzLlhcVOv7ilBVYdpo2pQYdw4j46D3ssRc/l6FuN0jS4lT5LLJcAQvn+bGbaCvw0e1pHONI/sKzq2cKYRc6rjeHGxTXPs00yA6nPnguooHHmEEKXjkL6W/Qb89V65LqVLSIrtHkx7MWewh1zQPBtr2qQtZ5+mfWhNeHVFm49beym4QIjkmgIVzzRAKO2W9+tk3ppvC+OcXEQuiNlJsqsn8HaHLtjId2jfadH8qUBG2u/hVeujWbA0RLAtApo7pwXKNr2P3p6O/r1aWaR5XSy7eCFqsolJSSaFz2Bf0v4G1LrJ89VVg36xaxxjMVZLQP/tXMdDFpZ2d5PrlbRrfjfUUlZVZnBjVwUZzCDhGxgv/RIk6SU/DUiRbQpFesnBwrA7dxw1wnb4nUQKGdnemavSjTu/67c29H7GJs0Q+QfLfru+2z77sgY0GuiC5PiQCtbxc6QZFmHQ37Rshe6BTu04C0djTw60cR5Dve37lXLTIxSBqRPrH0oLNdJPdlGLuc3vOCtl12P+6q7ZzC5Dt8xq2bcpOk9KFzDiGs9QwszqggQ1OmJm82D7ZWx6QPiFJzhj9g6r8YGU8Fexm0PcsbKcs7FaJVJgfU+WMBQiHPxBH4ESszj+1qd1vLGtWLEfGhWes0fYGC+BbVkWRzfkhPlLZZTA57GjS2w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(36860700016)(82310400026)(3023799007)(10067099003)(56012099006)(11063799006)(5023799004)(18002099003)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oHQURznhBHqhz7WjVKMCdHWQohvHoSPTNEIiGrf3Dqpw02THmvMKNcy2rLxU8zzrmsdtbGmTLmIFizWr5XgWddqAbxRC/t4Q5BlsCrA5BOY/YLxxbrONP4dqC1TmmlgTWD80tqMeXGlirrO6jeALsZTMTaqSYlNiqaUW4NaggXfAe7oflOiBoq6QCazC6RVgDyFkSLW0f6rYvp3ZYCYDAQ9qqfp+e7wggq1qK1P2iIeWvv8LaC7y+xKyakFgIjjeUOmxxFnilK6WlmXO2sJ+fwLsr+virZHT+PNbvo+GfNbPfjWC1TJDtO2l3Vw3fITXVUCYoifgRorZVFNqKDar8LkjtTkU1uYw9A90N0B1x4MrTtiiYR3WT1qCEQ6K4excBXrk+S+ClspLRy9nX9q5jobJi5qNn1gqIi27f9c6eIr9D2cFAorTe0/QUsKNn5aJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 04:01:37.7067 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65dfdac2-8e28-470e-dfde-08df08a6e319
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8962
Subject: [Buildroot] [PATCH v2 1/1] package/gcc: add microblaze frame
 unwinding fix to v15 and v16
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
Cc: Neal
 Frager <neal.frager@amd.com>, joseph@anodize.com, ramin.moussavi@yacoub.de,
 thesamprice@gmail.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 arnout@rnout.be, lordrasmus@gmail.com, romain.naour@smile.fr,
 michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add microblaze signal-frame unwinding fix back port to gcc 15.3.0 and 16.2.0.

Upstream: https://gcc.gnu.org/cgit/gcc/commit/?id=4ef64ad1aa9bbbe9471610e2de6ef0c8afed8b1f

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- Added upstream link and sob message to patches
---
 ...Linux-signal-frame-unwinding-support.patch | 196 ++++++++++++++++++
 ...Linux-signal-frame-unwinding-support.patch | 196 ++++++++++++++++++
 2 files changed, 392 insertions(+)
 create mode 100644 package/gcc/15.3.0/0004-microblaze-add-Linux-signal-frame-unwinding-support.patch
 create mode 100644 package/gcc/16.2.0/0003-microblaze-add-Linux-signal-frame-unwinding-support.patch

diff --git a/package/gcc/15.3.0/0004-microblaze-add-Linux-signal-frame-unwinding-support.patch b/package/gcc/15.3.0/0004-microblaze-add-Linux-signal-frame-unwinding-support.patch
new file mode 100644
index 0000000000..f7618d6727
--- /dev/null
+++ b/package/gcc/15.3.0/0004-microblaze-add-Linux-signal-frame-unwinding-support.patch
@@ -0,0 +1,196 @@
+From 4ef64ad1aa9bbbe9471610e2de6ef0c8afed8b1f Mon Sep 17 00:00:00 2001
+From: Ramin Moussavi <lordrasmus@gmail.com>
+Date: Wed, 3 Jun 2026 00:00:00 +0200
+Subject: [PATCH] microblaze: add Linux signal frame unwinding support
+
+libgcc has no MD_FALLBACK_FRAME_STATE_FOR for microblaze*-linux*, so the
+DWARF unwinder cannot step through signal frames at all.  Anything that
+unwinds out of a signal handler -- most prominently NPTL asynchronous
+pthread cancellation (SIGCANCEL) -- either stops early with
+_URC_END_OF_STACK (cleanup handlers below the signal frame never run) or
+misinterprets the on-stack signal trampoline and crashes with SIGSEGV.
+
+Add the standard fallback: recognize the two-instruction trampoline the
+kernel writes into struct rt_sigframe on the stack
+
+	addik r12, r0, __NR_rt_sigreturn
+	brki  r14, 0x8
+
+and rebuild the frame state from the sigcontext's pt_regs.  The ucontext
+is anchored relative to the trampoline (its last member) rather than to
+the CFA, so the layout of the frame head does not matter.
+
+The interrupted PC is recorded in DWARF column 36, one past the hard
+registers, because column 15 must keep the interrupted r15 (unrelated to
+the resume address of a signal frame).  Declaring it as
+DWARF_ALT_FRAME_RETURN_COLUMN makes init_dwarf_reg_size_table size the
+column; without that _Unwind_GetGR reads a zero size and aborts.
+
+Tested with a microblazeel-linux-uclibc cross compiler against uClibc-ng
+git, running its NPTL test suite under qemu-system-microblazeel -M
+petalogix-s3adsp1800.  Without the fix 17 tests fail (tst-cancel{1..5,7,
+9,16,20,x4,x7}, tst-cleanup{1..3}, tst-cond{16,17}) by SIGSEGV or by
+hanging in the unwinder; with it all 17 pass and the rest of the suite
+is unchanged.  The implementation follows the mips/aarch64
+linux-unwind.h pattern.
+
+gcc/ChangeLog:
+
+	* config/microblaze/microblaze.h (DWARF_ALT_FRAME_RETURN_COLUMN):
+	Define.
+
+libgcc/ChangeLog:
+
+	* config.host (microblaze*-linux*): Set md_unwind_header.
+	* config/microblaze/linux-unwind.h: New file.
+
+Upstream: https://gcc.gnu.org/cgit/gcc/commit/?id=4ef64ad1aa9bbbe9471610e2de6ef0c8afed8b1f
+
+Signed-off-by: Ramin Moussavi <ramin.moussavi@yacoub.de>
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+---
+ gcc/config/microblaze/microblaze.h      |   8 ++
+ libgcc/config.host                      |   1 +
+ libgcc/config/microblaze/linux-unwind.h | 102 ++++++++++++++++++++++++
+ 3 files changed, 111 insertions(+)
+ create mode 100644 libgcc/config/microblaze/linux-unwind.h
+
+diff --git a/gcc/config/microblaze/microblaze.h b/gcc/config/microblaze/microblaze.h
+index 2b5bd52040f7f..fc8c4b8717545 100644
+--- a/gcc/config/microblaze/microblaze.h
++++ b/gcc/config/microblaze/microblaze.h
+@@ -176,6 +176,14 @@ extern enum pipeline_type microblaze_pipe;
+ #define DWARF_FRAME_RETURN_COLUMN \
+ 	(GP_REG_FIRST + MB_ABI_SUB_RETURN_ADDR_REGNUM)
+ 
++/* Signal frames (config/microblaze/linux-unwind.h) record the
++   interrupted PC in DWARF column 36, one past the hard registers,
++   because column 15 must keep the interrupted r15.  Declaring it as
++   the alternate return column makes init_dwarf_reg_size_table size
++   it; otherwise _Unwind_GetGR aborts when unwinding through a signal
++   frame, such as during pthread cancellation.  */
++#define DWARF_ALT_FRAME_RETURN_COLUMN 36
++
+ /* Initial state of return address on entry to func = R15.
+    Actually, the RA is at R15+8, but gcc doesn't know how
+    to generate this.
+diff --git a/libgcc/config.host b/libgcc/config.host
+index 046156fa5e786..a685d5da7a107 100644
+--- a/libgcc/config.host
++++ b/libgcc/config.host
+@@ -1050,6 +1050,7 @@ mcore-*-elf)
+ 	;;
+ microblaze*-linux*)
+ 	tmake_file="${tmake_file} microblaze/t-microblaze t-fdpbit t-slibgcc-libgcc"
++	md_unwind_header=microblaze/linux-unwind.h
+ 	;;
+ microblaze*-*-elf)
+ 	tmake_file="${tmake_file} microblaze/t-microblaze t-fdpbit"
+diff --git a/libgcc/config/microblaze/linux-unwind.h b/libgcc/config/microblaze/linux-unwind.h
+new file mode 100644
+index 0000000000000..b54704a065198
+--- /dev/null
++++ b/libgcc/config/microblaze/linux-unwind.h
+@@ -0,0 +1,102 @@
++/* DWARF2 EH unwinding support for MicroBlaze Linux.
++   Copyright (C) 2026 Free Software Foundation, Inc.
++
++   This file is part of GCC.
++
++   GCC is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by
++   the Free Software Foundation; either version 3, or (at your option)
++   any later version.
++
++   GCC is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++   GNU General Public License for more details.
++
++   Under Section 7 of GPL version 3, you are granted additional
++   permissions described in the GCC Runtime Library Exception, version
++   3.1, as published by the Free Software Foundation.
++
++   You should have received a copy of the GNU General Public License and
++   a copy of the GCC Runtime Library Exception along with this program;
++   see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#ifndef inhibit_libc
++
++/* Do code reading to identify a signal frame, and set the frame state
++   data appropriately.  See unwind-dw2.c for the structs.  */
++
++#include <signal.h>
++#include <sys/ucontext.h>
++#include <asm/unistd.h>
++
++#define MD_FALLBACK_FRAME_STATE_FOR microblaze_fallback_frame_state
++
++static _Unwind_Reason_Code
++microblaze_fallback_frame_state (struct _Unwind_Context *context,
++				 _Unwind_FrameState *fs)
++{
++  const unsigned int *pc = (const unsigned int *) context->ra;
++  struct sigcontext *sc;
++  _Unwind_Ptr new_cfa;
++  int i;
++
++  /* The outermost frame of a thread may leave a null or near-null
++     return address; do not dereference it looking for the
++     trampoline.  */
++  if ((unsigned long) pc < 4096)
++    return _URC_END_OF_STACK;
++
++  /* The kernel writes the signal trampoline onto the stack
++     (struct rt_sigframe.tramp):
++
++	addik r12, r0, __NR_rt_sigreturn
++	brki  r14, 0x8
++
++     and sets the saved r15 to the trampoline address minus 8 (the
++     handler returns with "rtsd r15, 8"), so the unwound return
++     address points 8 bytes before the trampoline.  */
++  if (pc[0] == (0x31800000 | __NR_rt_sigreturn) && pc[1] == 0xb9cc0008)
++    ;
++  else if (pc[2] == (0x31800000 | __NR_rt_sigreturn) && pc[3] == 0xb9cc0008)
++    pc += 2;
++  else
++    return _URC_END_OF_STACK;
++
++  /* The trampoline is the last member of the kernel's rt_sigframe and
++     the ucontext sits directly in front of it.  Anchor there rather
++     than at the CFA so the layout of the frame head does not matter
++     (the kernel may insert an ABI argument-home gap at the front).
++     uClibc's ucontext_t matches the kernel's struct ucontext.  */
++  ucontext_t *uc = (ucontext_t *) ((_Unwind_Ptr) pc - sizeof (ucontext_t));
++
++  sc = (struct sigcontext *) &uc->uc_mcontext;
++
++  new_cfa = sc->regs.r1;
++  fs->regs.cfa_how = CFA_REG_OFFSET;
++  fs->regs.cfa_reg = 1;		/* r1, the stack pointer.  */
++  fs->regs.cfa_offset = new_cfa - (_Unwind_Ptr) context->cfa;
++
++  /* pt_regs holds r0..r31 consecutively.  */
++  for (i = 0; i < 32; i++)
++    {
++      fs->regs.how[i] = REG_SAVED_OFFSET;
++      fs->regs.reg[i].loc.offset
++	= (_Unwind_Ptr) &sc->regs.r0 + i * sizeof (unsigned long) - new_cfa;
++    }
++
++  /* The interrupted PC goes into the alternate return column
++     (DWARF_ALT_FRAME_RETURN_COLUMN, defined as 36 in
++     gcc/config/microblaze/microblaze.h), one past the hard registers;
++     column 15 above keeps the interrupted r15.  */
++  fs->regs.how[__LIBGCC_DWARF_ALT_FRAME_RETURN_COLUMN__] = REG_SAVED_OFFSET;
++  fs->regs.reg[__LIBGCC_DWARF_ALT_FRAME_RETURN_COLUMN__].loc.offset
++    = (_Unwind_Ptr) &sc->regs.pc - new_cfa;
++  fs->retaddr_column = __LIBGCC_DWARF_ALT_FRAME_RETURN_COLUMN__;
++  fs->signal_frame = 1;
++
++  return _URC_NO_REASON;
++}
++
++#endif
diff --git a/package/gcc/16.2.0/0003-microblaze-add-Linux-signal-frame-unwinding-support.patch b/package/gcc/16.2.0/0003-microblaze-add-Linux-signal-frame-unwinding-support.patch
new file mode 100644
index 0000000000..f7618d6727
--- /dev/null
+++ b/package/gcc/16.2.0/0003-microblaze-add-Linux-signal-frame-unwinding-support.patch
@@ -0,0 +1,196 @@
+From 4ef64ad1aa9bbbe9471610e2de6ef0c8afed8b1f Mon Sep 17 00:00:00 2001
+From: Ramin Moussavi <lordrasmus@gmail.com>
+Date: Wed, 3 Jun 2026 00:00:00 +0200
+Subject: [PATCH] microblaze: add Linux signal frame unwinding support
+
+libgcc has no MD_FALLBACK_FRAME_STATE_FOR for microblaze*-linux*, so the
+DWARF unwinder cannot step through signal frames at all.  Anything that
+unwinds out of a signal handler -- most prominently NPTL asynchronous
+pthread cancellation (SIGCANCEL) -- either stops early with
+_URC_END_OF_STACK (cleanup handlers below the signal frame never run) or
+misinterprets the on-stack signal trampoline and crashes with SIGSEGV.
+
+Add the standard fallback: recognize the two-instruction trampoline the
+kernel writes into struct rt_sigframe on the stack
+
+	addik r12, r0, __NR_rt_sigreturn
+	brki  r14, 0x8
+
+and rebuild the frame state from the sigcontext's pt_regs.  The ucontext
+is anchored relative to the trampoline (its last member) rather than to
+the CFA, so the layout of the frame head does not matter.
+
+The interrupted PC is recorded in DWARF column 36, one past the hard
+registers, because column 15 must keep the interrupted r15 (unrelated to
+the resume address of a signal frame).  Declaring it as
+DWARF_ALT_FRAME_RETURN_COLUMN makes init_dwarf_reg_size_table size the
+column; without that _Unwind_GetGR reads a zero size and aborts.
+
+Tested with a microblazeel-linux-uclibc cross compiler against uClibc-ng
+git, running its NPTL test suite under qemu-system-microblazeel -M
+petalogix-s3adsp1800.  Without the fix 17 tests fail (tst-cancel{1..5,7,
+9,16,20,x4,x7}, tst-cleanup{1..3}, tst-cond{16,17}) by SIGSEGV or by
+hanging in the unwinder; with it all 17 pass and the rest of the suite
+is unchanged.  The implementation follows the mips/aarch64
+linux-unwind.h pattern.
+
+gcc/ChangeLog:
+
+	* config/microblaze/microblaze.h (DWARF_ALT_FRAME_RETURN_COLUMN):
+	Define.
+
+libgcc/ChangeLog:
+
+	* config.host (microblaze*-linux*): Set md_unwind_header.
+	* config/microblaze/linux-unwind.h: New file.
+
+Upstream: https://gcc.gnu.org/cgit/gcc/commit/?id=4ef64ad1aa9bbbe9471610e2de6ef0c8afed8b1f
+
+Signed-off-by: Ramin Moussavi <ramin.moussavi@yacoub.de>
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+---
+ gcc/config/microblaze/microblaze.h      |   8 ++
+ libgcc/config.host                      |   1 +
+ libgcc/config/microblaze/linux-unwind.h | 102 ++++++++++++++++++++++++
+ 3 files changed, 111 insertions(+)
+ create mode 100644 libgcc/config/microblaze/linux-unwind.h
+
+diff --git a/gcc/config/microblaze/microblaze.h b/gcc/config/microblaze/microblaze.h
+index 2b5bd52040f7f..fc8c4b8717545 100644
+--- a/gcc/config/microblaze/microblaze.h
++++ b/gcc/config/microblaze/microblaze.h
+@@ -176,6 +176,14 @@ extern enum pipeline_type microblaze_pipe;
+ #define DWARF_FRAME_RETURN_COLUMN \
+ 	(GP_REG_FIRST + MB_ABI_SUB_RETURN_ADDR_REGNUM)
+ 
++/* Signal frames (config/microblaze/linux-unwind.h) record the
++   interrupted PC in DWARF column 36, one past the hard registers,
++   because column 15 must keep the interrupted r15.  Declaring it as
++   the alternate return column makes init_dwarf_reg_size_table size
++   it; otherwise _Unwind_GetGR aborts when unwinding through a signal
++   frame, such as during pthread cancellation.  */
++#define DWARF_ALT_FRAME_RETURN_COLUMN 36
++
+ /* Initial state of return address on entry to func = R15.
+    Actually, the RA is at R15+8, but gcc doesn't know how
+    to generate this.
+diff --git a/libgcc/config.host b/libgcc/config.host
+index 046156fa5e786..a685d5da7a107 100644
+--- a/libgcc/config.host
++++ b/libgcc/config.host
+@@ -1050,6 +1050,7 @@ mcore-*-elf)
+ 	;;
+ microblaze*-linux*)
+ 	tmake_file="${tmake_file} microblaze/t-microblaze t-fdpbit t-slibgcc-libgcc"
++	md_unwind_header=microblaze/linux-unwind.h
+ 	;;
+ microblaze*-*-elf)
+ 	tmake_file="${tmake_file} microblaze/t-microblaze t-fdpbit"
+diff --git a/libgcc/config/microblaze/linux-unwind.h b/libgcc/config/microblaze/linux-unwind.h
+new file mode 100644
+index 0000000000000..b54704a065198
+--- /dev/null
++++ b/libgcc/config/microblaze/linux-unwind.h
+@@ -0,0 +1,102 @@
++/* DWARF2 EH unwinding support for MicroBlaze Linux.
++   Copyright (C) 2026 Free Software Foundation, Inc.
++
++   This file is part of GCC.
++
++   GCC is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by
++   the Free Software Foundation; either version 3, or (at your option)
++   any later version.
++
++   GCC is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++   GNU General Public License for more details.
++
++   Under Section 7 of GPL version 3, you are granted additional
++   permissions described in the GCC Runtime Library Exception, version
++   3.1, as published by the Free Software Foundation.
++
++   You should have received a copy of the GNU General Public License and
++   a copy of the GCC Runtime Library Exception along with this program;
++   see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#ifndef inhibit_libc
++
++/* Do code reading to identify a signal frame, and set the frame state
++   data appropriately.  See unwind-dw2.c for the structs.  */
++
++#include <signal.h>
++#include <sys/ucontext.h>
++#include <asm/unistd.h>
++
++#define MD_FALLBACK_FRAME_STATE_FOR microblaze_fallback_frame_state
++
++static _Unwind_Reason_Code
++microblaze_fallback_frame_state (struct _Unwind_Context *context,
++				 _Unwind_FrameState *fs)
++{
++  const unsigned int *pc = (const unsigned int *) context->ra;
++  struct sigcontext *sc;
++  _Unwind_Ptr new_cfa;
++  int i;
++
++  /* The outermost frame of a thread may leave a null or near-null
++     return address; do not dereference it looking for the
++     trampoline.  */
++  if ((unsigned long) pc < 4096)
++    return _URC_END_OF_STACK;
++
++  /* The kernel writes the signal trampoline onto the stack
++     (struct rt_sigframe.tramp):
++
++	addik r12, r0, __NR_rt_sigreturn
++	brki  r14, 0x8
++
++     and sets the saved r15 to the trampoline address minus 8 (the
++     handler returns with "rtsd r15, 8"), so the unwound return
++     address points 8 bytes before the trampoline.  */
++  if (pc[0] == (0x31800000 | __NR_rt_sigreturn) && pc[1] == 0xb9cc0008)
++    ;
++  else if (pc[2] == (0x31800000 | __NR_rt_sigreturn) && pc[3] == 0xb9cc0008)
++    pc += 2;
++  else
++    return _URC_END_OF_STACK;
++
++  /* The trampoline is the last member of the kernel's rt_sigframe and
++     the ucontext sits directly in front of it.  Anchor there rather
++     than at the CFA so the layout of the frame head does not matter
++     (the kernel may insert an ABI argument-home gap at the front).
++     uClibc's ucontext_t matches the kernel's struct ucontext.  */
++  ucontext_t *uc = (ucontext_t *) ((_Unwind_Ptr) pc - sizeof (ucontext_t));
++
++  sc = (struct sigcontext *) &uc->uc_mcontext;
++
++  new_cfa = sc->regs.r1;
++  fs->regs.cfa_how = CFA_REG_OFFSET;
++  fs->regs.cfa_reg = 1;		/* r1, the stack pointer.  */
++  fs->regs.cfa_offset = new_cfa - (_Unwind_Ptr) context->cfa;
++
++  /* pt_regs holds r0..r31 consecutively.  */
++  for (i = 0; i < 32; i++)
++    {
++      fs->regs.how[i] = REG_SAVED_OFFSET;
++      fs->regs.reg[i].loc.offset
++	= (_Unwind_Ptr) &sc->regs.r0 + i * sizeof (unsigned long) - new_cfa;
++    }
++
++  /* The interrupted PC goes into the alternate return column
++     (DWARF_ALT_FRAME_RETURN_COLUMN, defined as 36 in
++     gcc/config/microblaze/microblaze.h), one past the hard registers;
++     column 15 above keeps the interrupted r15.  */
++  fs->regs.how[__LIBGCC_DWARF_ALT_FRAME_RETURN_COLUMN__] = REG_SAVED_OFFSET;
++  fs->regs.reg[__LIBGCC_DWARF_ALT_FRAME_RETURN_COLUMN__].loc.offset
++    = (_Unwind_Ptr) &sc->regs.pc - new_cfa;
++  fs->retaddr_column = __LIBGCC_DWARF_ALT_FRAME_RETURN_COLUMN__;
++  fs->signal_frame = 1;
++
++  return _URC_NO_REASON;
++}
++
++#endif
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
