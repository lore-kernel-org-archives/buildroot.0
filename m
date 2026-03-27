Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E4910BA432
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 07:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF23F60A3A;
	Fri, 27 Mar 2026 07:53:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q3hG0KC-NliN; Fri, 27 Mar 2026 07:53:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D16961282
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774598025;
	bh=0SyIA2MVjcNwINtoYenyECO4NOUOwTnBAVfc5j76PbY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=mgzlSzGg4bdBEZ/IW6PSy7BcYw5gxhZp6CipI13w5+zRqxq7GNHf2ZkVdXBLDtXv0
	 Vi8B6i+r+xzqxZCrBTKkV7RoIEnfNLxbBAcSznGav62BYlDoox5p7wL9GRvRsSvp9q
	 hy8U41hygrK9tz7GjGOtAJ07U6LIo+nwlh5ig/EeGx51QBe5b0/kjcc4LjRG9XSnLB
	 N8gS8QPB5kw1t7tyjC8vPRZU4K1qB48vhCdhyKjm3CFvtGg5WAxBpsI83LizU+lrKl
	 HN6omt6vzm39dfEZxO/jaicRY5Jj4xswFAmlrR+aVjJAoCFkHcDP5506w9Ozf7Xxct
	 /WutmHp9Re8rg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D16961282;
	Fri, 27 Mar 2026 07:53:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 980BE249
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 07:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CE8F61282
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 07:53:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aG3dFdwIwq9V for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 07:53:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c10d::1;
 helo=sn4pr2101cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D63C460A3A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D63C460A3A
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10d::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D63C460A3A
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 07:53:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3ToPfmuu56z/bRcvzOtZznD2BTo+ER2YWugX9ZZ5vXG2lnMLJynJ4rkgB9tP/rBxgF6i2KQt8sDRfGRPvlJ7n42VOuIBN8YpetOOusSWbAKdQTM4eXS+ZK71s4DG8eSJy4W+t8qcYiF6bLZ41Fh6H/KwB76x0Ljy/U/Xh8JdSnfBV8bbNzrHxr8w7U8zXTq10UQwgbgTeG1xLcddC3oSdQ52obK0jEhfMObABxBuRrV17GLjKs10hcCXhjwfZZ359Jsg1NPVNCDe79W00hNU8c8o33SvJVR9ztuHlrxYjGyOXo/dtUJE48ntKK4S7D20SBI6BYuXnkjNhYds4hE+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HK03jZMKKnoLrvrL0I+o0IJtoyFL4YNKZeQGas7B9oQ=;
 b=ICHF8nRfuJ097QMFGVXJRxdACaeStniS8aeLVP/ZBT2Seu21azU143kTr+ZgNu1cIvZcV5z8OHYOMY0C6qEsmR36xtvMNkpF9dR4z/IXUtO3/5uHZ0JwjF8/KOILbKj8tPRIBWh/vnmly2i81/Fjd04e1j/3k/hFbpHTPHQWSbcG9OMYMUubSvHCPeWVWeb9gNtRp9085OW7o7pshVdBjh9F1Tb200xwVYnXZUTHjPdveBwVinwBJFZPIKBR1KQ31qpvkc9QucqhO3SJVBI/VTQiwjZR9yGndoOV5J6Bot2askMotsmzsnmD2QH5/5gJx61F0KUHR3qdyceIQW1cYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BL1PR13CA0367.namprd13.prod.outlook.com (2603:10b6:208:2c0::12)
 by DS0PR12MB8019.namprd12.prod.outlook.com (2603:10b6:8:14e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.10; Fri, 27 Mar
 2026 07:53:33 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2603:10b6:208:2c0:cafe::c8) by BL1PR13CA0367.outlook.office365.com
 (2603:10b6:208:2c0::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.25 via Frontend Transport; Fri,
 27 Mar 2026 07:53:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 07:53:31 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 27 Mar
 2026 02:53:30 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 27 Mar 2026 02:53:29 -0500
To: <buildroot@buildroot.org>
Date: Fri, 27 Mar 2026 07:53:14 +0000
Message-ID: <20260327075314.1821824-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|DS0PR12MB8019:EE_
X-MS-Office365-Filtering-Correlation-Id: 96435321-a1a3-4a2c-c02b-08de8bd5f086
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700016|376014|13003099007|56012099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info: bkLR/LKixyP59FLk0kUalz4Y2MUSdDvJK6hITuBWRbsOh8bQIhpwG9vjNuqPx7CYBw5xh9CZViIQJNGkcPNkTEwuFkTiHB0l3OMwKhtgOOFkD9AHb+hGVCnx/722OafBhk5gSjvQDaSZ74N5gWT7guH2peqXR/+g6B75re9qLW+kSl9HO4Lq1jGIQwlBgfdwu76JxPnB4fvASlNd2HnQCXF/OBVrPJ61W0XRWO60r3WlQRJ5bVUENsRgIW1AbnhcW0++TnknFna3fI08cDmzxK1bKYMIIru8ekoZWAVHZkmvgdblmZ1LHhP4p2scMgrauND3ajHAHAO741H2+EUOAnBi3EPF6jkAeEnyb6DKM2Q2EJcNlLXxROLIKpGO8iwVf1C8C/MHVSuhBb+hkRh2MT2Xgmtu7a4sagVLsjhBzeLbV0GP9+775iWoBa60LFQ0rCpu5kUJbPDF+3O9FHFz8fkoAICms9m8FLV4Z9uUDsQmqhpXJLW8bfePkfSuvCs0vmVyBqIK8/JSHPSv1jDZfcBAmtKAPTZDsc6yM9HG/HpWga6RfTSzfoTcbfvOmzzRwkvmRfz++kupIBAN6+y2FE1sWoQf3+7ybeYAjZOgMPRfAhx00Q1R+wzHN5DwKhWyBO5iPTysyLgY/P5TLVTZmycBlPooKbofQwaOs4plCuEuXaac6yuL5AZzfPp1UQmw0r2PGdoW3fSNv7k24FWsdae5h7S0TxKfWN1KxZ9tRwUflmYftzkUJh85mE+ZpbijAM03kgk6Vau1m9knKi3hiSio91wTxtJK/GrX3+PjLEk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(13003099007)(56012099003)(18002099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8TEWbe/hbvZbg7iNi9QIAwaugzBkh2U+AlJh2RK53lkq1+vHwTWMlxgk0FZWis6ayODQP7igJaek/weSniY8f6cbZTpRHgm+kG+gm5FsvvzzPvuxmuuetRD1cXKju9OUHapUW12VXxbMmW0bgvxGLRBfRTt0bvIun8UhdCw6MdMPpWWL78319zyScQ/DVzSVhCqajHD+vbyi6rtJsX+kruP4MSLfP3A3hbO9c8tmlAsGEgiE4VkIZT1PYoO/I7bt8rQm9KJO6ow4aNqbABe2hgCCVCgoh2S/XndX6GeKVALdKstLoYWhrT++V5uuUPLhIBBJNabJvOOwm5WahdN4596NNYnpUbcBTJvuID0Nz6V38r5M6uVTHb6LF6qbuK8fM28s+XsSgqmad6195KW2P2CIRTDWDSmzb1UASdgDT5FP7QfqI82l8GwzszpDJQ2F
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 07:53:31.2403 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96435321-a1a3-4a2c-c02b-08de8bd5f086
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8019
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HK03jZMKKnoLrvrL0I+o0IJtoyFL4YNKZeQGas7B9oQ=;
 b=bLywITG901+D/qtMUx6LeOZyPlyqJkQlMV/BWPOnraVFNczmlzS32uaCfbpn4O1p4jg9TH6VBz5YgbiYxiAC3I0UsrZ4MeCVkNjisLpZPeeSm50qTzN9dREQtHur+6DiYg79cxXPmkC4jXeRJioEIF8l6Rs6StQas7a/9StSwUA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=bLywITG9
Subject: [Buildroot] [RFC PATCH 1/1] board/qemu/microblaze: replace gcc work
 around with Linux patch
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
Cc: Neal Frager <neal.frager@amd.com>, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The microblaze issue identified with gcc 15 is actually a Linux kernel issue
with the entry.S not allocating enough stack space for the register params.

The Linux patch included with this solution is not complete, but is being
shared to demonstrate that patching the Linux kernel fixes the issue.

Please apply this patch set and test with gcc v15.2.0 and provide feedback
regarding how to proceed.

To test:
$ make qemu_microblazeel_mmu_defconfig
+ BR2_GCC_VERSION_15_X=y
$ make
$ qemu-system-microblazeel -M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 ...allocate-stack-space-for-register-pa.patch | 105 ++++++++++++++++++
 configs/qemu_microblazebe_mmu_defconfig       |   2 +-
 configs/qemu_microblazeel_mmu_defconfig       |   2 +-
 ...-config-microblaze-fix-ira-for-GCC15.patch |  56 ----------
 4 files changed, 107 insertions(+), 58 deletions(-)
 create mode 100644 board/qemu/microblaze/patches/linux/0001-arch-microblaze-allocate-stack-space-for-register-pa.patch
 delete mode 100644 package/gcc/15.2.0/0003-gcc-config-microblaze-fix-ira-for-GCC15.patch

diff --git a/board/qemu/microblaze/patches/linux/0001-arch-microblaze-allocate-stack-space-for-register-pa.patch b/board/qemu/microblaze/patches/linux/0001-arch-microblaze-allocate-stack-space-for-register-pa.patch
new file mode 100644
index 0000000000..9ead2a0661
--- /dev/null
+++ b/board/qemu/microblaze/patches/linux/0001-arch-microblaze-allocate-stack-space-for-register-pa.patch
@@ -0,0 +1,105 @@
+From 13393e499729bd369a2ab01b86d6e0d30444e30f Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Fri, 27 Mar 2026 07:02:39 +0000
+Subject: [PATCH] arch: microblaze: allocate stack space for register params
+
+C functions are invoked with arguments without allocating stack space for
+register params (for potential register spills). As a result kernel built
+with gcc v15 boot hangs at the point of starting init -.
+
+This patch adds necessary stack space for few C function calls from entry.S
+(not all). After this patch, the kernel boots all the way to login prompt and
+root login works. Simple commands like ps work and show normal output.
+
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+---
+ arch/microblaze/kernel/entry.S | 20 ++++++++++++++------
+ 1 file changed, 14 insertions(+), 6 deletions(-)
+
+diff --git a/arch/microblaze/kernel/entry.S b/arch/microblaze/kernel/entry.S
+index 582d7256d815..2f9604640486 100644
+--- a/arch/microblaze/kernel/entry.S
++++ b/arch/microblaze/kernel/entry.S
+@@ -339,6 +339,9 @@ C_ENTRY(mb_invalidate_icache):
+  * Trap entered via brki instruction, so BIP bit is set, and interrupts
+  * are masked. This is nice, means we don't have to CLI before state save
+  */
++
++#define SYSCALL_ARGS_SIZE 36
++
+ C_ENTRY(_user_exception):
+ 	swi	r1, r0, TOPHYS(PER_CPU(ENTRY_SP)) /* save stack */
+ 	addi	r14, r14, 4	/* return address is 4 byte after call */
+@@ -422,16 +425,19 @@ C_ENTRY(_user_exception):
+ 	lwi	r12, r12, sys_call_table
+ 	/* where the trap should return need -8 to adjust for rtsd r15, 8 */
+ 	addi	r15, r0, ret_from_trap-8
++	addik 	r1, r1, -SYSCALL_ARGS_SIZE
+ 	bra	r12
+ 
+ 	/* The syscall number is invalid, return an error.  */
+ 5:
+-	braid	ret_from_trap
++	braid	ret_from_trap2
+ 	addi	r3, r0, -ENOSYS;
+ 
+ /* Entry point used to return from a syscall/trap */
+ /* We re-enable BIP bit before state restore */
+ C_ENTRY(ret_from_trap):
++	addik	r1, r1, SYSCALL_ARGS_SIZE
++C_ENTRY(ret_from_trap2):
+ 	swi	r3, r1, PT_R3
+ 	swi	r4, r1, PT_R4
+ 
+@@ -504,7 +510,7 @@ C_ENTRY(ret_from_fork):
+ 	bralid	r15, schedule_tail; /* ...which is schedule_tail's arg */
+ 	add	r5, r3, r0;	/* switch_thread returns the prev task */
+ 				/* ( in the delay slot ) */
+-	brid	ret_from_trap;	/* Do normal trap return */
++	brid	ret_from_trap2; /* Do normal trap return */
+ 	add	r3, r0, r0;	/* Child's fork call should return 0. */
+ 
+ C_ENTRY(ret_from_kernel_thread):
+@@ -513,13 +519,13 @@ C_ENTRY(ret_from_kernel_thread):
+ 				/* ( in the delay slot ) */
+ 	brald	r15, r20	/* fn was left in r20 */
+ 	addk	r5, r0, r19	/* ... and argument - in r19 */
+-	brid	ret_from_trap
++	brid	ret_from_trap2
+ 	add	r3, r0, r0
+ 
+ C_ENTRY(sys_rt_sigreturn_wrapper):
+ 	addik	r30, r0, 0		/* no restarts */
+ 	brid	sys_rt_sigreturn	/* Do real work */
+-	addik	r5, r1, 0;		/* add user context as 1st arg */
++	addik	r5, r1, SYSCALL_ARGS_SIZE;	/* add user context as 1st arg */
+ 
+ /*
+  * HW EXCEPTION rutine start
+@@ -729,11 +735,13 @@ C_ENTRY(_interrupt):
+ 	lwi	CURRENT_TASK, r0, TOPHYS(PER_CPU(CURRENT_SAVE));
+ 	tovirt(r1,r1)
+ 	addik	r15, r0, irq_call;
++	addik 	r1, r1, -8
+ irq_call:rtbd	r0, do_IRQ;
+-	addik	r5, r1, 0;
++	addik	r5, r1, 8;
+ 
+ /* MS: we are in virtual mode */
+ ret_from_irq:
++	addik 	r1, r1, 8
+ 	lwi	r11, r1, PT_MODE;
+ 	bnei	r11, 2f;
+ 
+@@ -1302,7 +1310,7 @@ type_SYSCALL_PREEMPT:
+ .global microblaze_trap_handlers
+ microblaze_trap_handlers:
+ 	/* Exact matches come first */
+-	.word ret_from_trap; .word ret_from_trap   ; .word type_SYSCALL
++	.word ret_from_trap; .word ret_from_trap2  ; .word type_SYSCALL
+ 	.word ret_from_irq ; .word ret_from_irq    ; .word type_IRQ
+ 	/* Fuzzy matches go here */
+ 	.word ret_from_irq ; .word no_intr_resched ; .word type_IRQ_PREEMPT
+-- 
+2.25.1
+
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index cc6871e212..0a7487fb37 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -1,6 +1,6 @@
 BR2_microblazebe=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
-BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
+BR2_GLOBAL_PATCH_DIR="board/qemu/patches board/qemu/microblaze/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 8945a775d0..bfb5aae405 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -1,6 +1,6 @@
 BR2_microblazeel=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
-BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
+BR2_GLOBAL_PATCH_DIR="board/qemu/patches board/qemu/microblaze/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 BR2_SYSTEM_DHCP="eth0"
diff --git a/package/gcc/15.2.0/0003-gcc-config-microblaze-fix-ira-for-GCC15.patch b/package/gcc/15.2.0/0003-gcc-config-microblaze-fix-ira-for-GCC15.patch
deleted file mode 100644
index 663aab7218..0000000000
--- a/package/gcc/15.2.0/0003-gcc-config-microblaze-fix-ira-for-GCC15.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From d2fdbd8c4abe67eea86877dfb3b3b9d8508c165f Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Wed, 6 Aug 2025 22:32:30 +0200
-Subject: [PATCH] gcc/config/microblaze: fix ira for GCC15
-
-Add new hooks for callee-save on microblaze defined by [1] and
-return 1 to restore the old behavior prior to the commit [3].
-
-Tested with qemu_microblazeel_mmu_defconfig and used to generate
-Microblaze toolchains for the Bootlin toolchains 2025.08-1 [4][5].
-
-Upstream: suggested in the bug report: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=121432#c10
-
-[1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=b191e8bdecf881d11c1544c441e38f4c18392a15
-[2] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/i386/i386.cc;h=3128973ba79cccfc6761f451dcb716b9558cc4da;hb=d3ff498c478acefce35de04402f99171b4f64a1a#l20606
-[3] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=3b9b8d6cfdf59337f4b7ce10ce92a98044b2657b
-[4] https://lore.kernel.org/buildroot/87sehzndtp.fsf@dell.be.48ers.dk/T/#mce7decd0b3f6a41008d5de577538a8525c91b374
-[5] https://toolchains.bootlin.com/
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- gcc/config/microblaze/microblaze.cc | 11 +++++++++++
- 1 file changed, 11 insertions(+)
-
-diff --git a/gcc/config/microblaze/microblaze.cc b/gcc/config/microblaze/microblaze.cc
-index 78b9428ef3b..84ea7e8d55a 100644
---- a/gcc/config/microblaze/microblaze.cc
-+++ b/gcc/config/microblaze/microblaze.cc
-@@ -3228,6 +3228,14 @@ microblaze_secondary_reload (bool in_p ATTRIBUTE_UNUSED, rtx x ATTRIBUTE_UNUSED,
-   return NO_REGS;
- }
- 
-+/* Implement TARGET_CALLEE_SAVE_COST.  */
-+static int
-+microblaze_callee_save_cost (spill_cost_type, unsigned int hard_regno, machine_mode,
-+		       unsigned int, int mem_cost, const HARD_REG_SET &, bool)
-+{
-+  return 1;
-+}
-+
- static void
- microblaze_globalize_label (FILE * stream, const char *name)
- {
-@@ -4066,6 +4074,9 @@ microblaze_starting_frame_offset (void)
- #undef TARGET_SECONDARY_RELOAD
- #define TARGET_SECONDARY_RELOAD		microblaze_secondary_reload
- 
-+#undef TARGET_CALLEE_SAVE_COST
-+#define TARGET_CALLEE_SAVE_COST microblaze_callee_save_cost
-+
- #undef  TARGET_ASM_OUTPUT_MI_THUNK
- #define TARGET_ASM_OUTPUT_MI_THUNK      microblaze_asm_output_mi_thunk
- 
--- 
-2.50.1
-
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
