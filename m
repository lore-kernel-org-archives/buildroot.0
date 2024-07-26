Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE64C3DA7F
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 11:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C027E60B06;
	Fri, 26 Jul 2024 11:56:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fkg0Px86ld5l; Fri, 26 Jul 2024 11:55:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95452608A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95452608A7;
	Fri, 26 Jul 2024 11:55:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 176151BF59C
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 11:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE99540F0C
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 11:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id elL-zk55tZHl for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 11:55:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B9330405E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9330405E7
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B9330405E7
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 11:55:51 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 2500D35211C3; Fri, 26 Jul 2024 13:55:48 +0200 (CEST)
Date: Fri, 26 Jul 2024 13:55:47 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZqOOwxlgzv49IYFn@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1721994948; bh=KrBdlxc6QEB3RXIkhKmrBLyqRXwgtWofL8bfuC8Gh7Q=;
 h=Date:From:To:Cc:Subject:From;
 b=NVxWlBhKBOZGFGJkbdLh/8s7jWrSqXF9Rq8wxkyVaZis3OtTyiyp2hk9A//LCLJ6r
 59wWnf73M9O+BIeQV7BY1vTetaN4o3lNp9ujpC9bvhjO4S0oM4W/S4IxxHbVwW2iMJ
 TZAGimDzAF89q8Y8hU/1zr3Ojxoq+eyBFH5zs0isptgrCjwAfS6tU5yuYlD+fcxKRe
 qXwc99zy8ZupFtVwiFjhSBwD3+oXWEvuL52K4EWVZfgNUNYQguVnGQaU4LLsuXQ5fq
 ZNoqfvmMy7KMobNr+Aa6PVzF0rY5iQTRtt9YSMD03sBkT5sv7o/hZnWq9XFiQzmHrb
 lli0bCHpKSUyA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=NVxWlBhK
Subject: [Buildroot] [PATCH] configs/beaglebone: update u-boot and linux
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
Cc: Lothar Felten <lothar.felten@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update u-boot to 2024.07. Update Linux to 6.6.32.
Add hash checking. Linux patches are no longer required so remove them.

Tested on Beaglebone Black.

Signed-off-by: Wademar Brodkorb <wbx@openadk.org>
---
 ...1-keep-jtag-clock-alive-for-debugger.patch |  16 -
 ...ce-Sun-Solaris-style-flag-on-section.patch | 432 ------------------
 ...EM_MAX_SLOTS-with-SATA_PMP_MAX_PORTS.patch |  80 ----
 ...a-ahci-fix-enum-constants-for-gcc-13.patch | 357 ---------------
 .../beaglebone/patches/linux/linux.hash       |   2 +-
 .../beaglebone/patches/uboot/uboot.hash       |   2 +-
 configs/beaglebone_defconfig                  |  15 +-
 7 files changed, 12 insertions(+), 892 deletions(-)
 delete mode 100644 board/beagleboard/beaglebone/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch
 delete mode 100644 board/beagleboard/beaglebone/patches/linux/0002-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch
 delete mode 100644 board/beagleboard/beaglebone/patches/linux/0003-ata-ahci-Match-EM_MAX_SLOTS-with-SATA_PMP_MAX_PORTS.patch
 delete mode 100644 board/beagleboard/beaglebone/patches/linux/0004-ata-ahci-fix-enum-constants-for-gcc-13.patch

diff --git a/board/beagleboard/beaglebone/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch b/board/beagleboard/beaglebone/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch
deleted file mode 100644
index 8e36d9abc5..0000000000
--- a/board/beagleboard/beaglebone/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-This patch keeps the debugSS clock alive, it clocks the JTAG macro and enables
-access to the SoC via JTAG after the kernel booted.
-
-Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
----
-diff -Naur linux-orig/arch/arm/mach-omap2/omap_hwmod_33xx_data.c linux-52c4aa7cdb93d61f8008f380135beaf7b8fa6593/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
---- linux-orig/arch/arm/mach-omap2/omap_hwmod_33xx_data.c	2015-10-02 17:30:56.000000000 +0200
-+++ linux-52c4aa7cdb93d61f8008f380135beaf7b8fa6593/arch/arm/mach-omap2/omap_hwmod_33xx_data.c	2016-08-15 11:28:55.017617612 +0200
-@@ -208,6 +208,7 @@
- 	.name		= "debugss",
- 	.class		= &am33xx_debugss_hwmod_class,
- 	.clkdm_name	= "l3_aon_clkdm",
-+	.flags		= (HWMOD_INIT_NO_IDLE|HWMOD_INIT_NO_RESET), /* keep debugSS clock alive for JTAG */
- 	.main_clk	= "trace_clk_div_ck",
- 	.prcm		= {
- 		.omap4	= {
diff --git a/board/beagleboard/beaglebone/patches/linux/0002-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch b/board/beagleboard/beaglebone/patches/linux/0002-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch
deleted file mode 100644
index e99363aeb6..0000000000
--- a/board/beagleboard/beaglebone/patches/linux/0002-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch
+++ /dev/null
@@ -1,432 +0,0 @@
-From 790756c7e0229dedc83bf058ac69633045b1000e Mon Sep 17 00:00:00 2001
-From: Nick Desaulniers <ndesaulniers@google.com>
-Date: Mon, 4 Nov 2019 19:31:45 +0100
-Subject: [PATCH] ARM: 8933/1: replace Sun/Solaris style flag on section
- directive
-
-It looks like a section directive was using "Solaris style" to declare
-the section flags. Replace this with the GNU style so that Clang's
-integrated assembler can assemble this directive.
-
-The modified instances were identified via:
-$ ag \.section | grep #
-
-Link: https://ftp.gnu.org/old-gnu/Manuals/gas-2.9.1/html_chapter/as_7.html#SEC119
-Link: https://github.com/ClangBuiltLinux/linux/issues/744
-Link: https://bugs.llvm.org/show_bug.cgi?id=43759
-Link: https://reviews.llvm.org/D69296
-
-Acked-by: Nicolas Pitre <nico@fluxnic.net>
-Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
-Reviewed-by: Stefan Agner <stefan@agner.ch>
-Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
-Suggested-by: Fangrui Song <maskray@google.com>
-Suggested-by: Jian Cai <jiancai@google.com>
-Suggested-by: Peter Smith <peter.smith@linaro.org>
-Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
-Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=762d2dcd9e233e3025f8627ea65f23e568045edb
----
- arch/arm/boot/bootp/init.S            | 2 +-
- arch/arm/boot/compressed/big-endian.S | 2 +-
- arch/arm/boot/compressed/head.S       | 2 +-
- arch/arm/boot/compressed/piggy.S      | 2 +-
- arch/arm/mm/proc-arm1020.S            | 2 +-
- arch/arm/mm/proc-arm1020e.S           | 2 +-
- arch/arm/mm/proc-arm1022.S            | 2 +-
- arch/arm/mm/proc-arm1026.S            | 2 +-
- arch/arm/mm/proc-arm720.S             | 2 +-
- arch/arm/mm/proc-arm740.S             | 2 +-
- arch/arm/mm/proc-arm7tdmi.S           | 2 +-
- arch/arm/mm/proc-arm920.S             | 2 +-
- arch/arm/mm/proc-arm922.S             | 2 +-
- arch/arm/mm/proc-arm925.S             | 2 +-
- arch/arm/mm/proc-arm926.S             | 2 +-
- arch/arm/mm/proc-arm940.S             | 2 +-
- arch/arm/mm/proc-arm946.S             | 2 +-
- arch/arm/mm/proc-arm9tdmi.S           | 2 +-
- arch/arm/mm/proc-fa526.S              | 2 +-
- arch/arm/mm/proc-feroceon.S           | 2 +-
- arch/arm/mm/proc-mohawk.S             | 2 +-
- arch/arm/mm/proc-sa110.S              | 2 +-
- arch/arm/mm/proc-sa1100.S             | 2 +-
- arch/arm/mm/proc-v6.S                 | 2 +-
- arch/arm/mm/proc-v7.S                 | 2 +-
- arch/arm/mm/proc-v7m.S                | 4 ++--
- arch/arm/mm/proc-xsc3.S               | 2 +-
- arch/arm/mm/proc-xscale.S             | 2 +-
- 28 files changed, 29 insertions(+), 29 deletions(-)
-
-diff --git a/arch/arm/boot/bootp/init.S b/arch/arm/boot/bootp/init.S
-index 5c476bd2b4ce..b562da2f7040 100644
---- a/arch/arm/boot/bootp/init.S
-+++ b/arch/arm/boot/bootp/init.S
-@@ -13,7 +13,7 @@
-  *  size immediately following the kernel, we could build this into
-  *  a binary blob, and concatenate the zImage using the cat command.
-  */
--		.section .start,#alloc,#execinstr
-+		.section .start, "ax"
- 		.type	_start, #function
- 		.globl	_start
- 
-diff --git a/arch/arm/boot/compressed/big-endian.S b/arch/arm/boot/compressed/big-endian.S
-index 88e2a88d324b..0e092c36da2f 100644
---- a/arch/arm/boot/compressed/big-endian.S
-+++ b/arch/arm/boot/compressed/big-endian.S
-@@ -6,7 +6,7 @@
-  *  Author: Nicolas Pitre
-  */
- 
--	.section ".start", #alloc, #execinstr
-+	.section ".start", "ax"
- 
- 	mrc	p15, 0, r0, c1, c0, 0	@ read control reg
- 	orr	r0, r0, #(1 << 7)	@ enable big endian mode
-diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/compressed/head.S
-index ae70754d003d..ead21e5f2b80 100644
---- a/arch/arm/boot/compressed/head.S
-+++ b/arch/arm/boot/compressed/head.S
-@@ -140,7 +140,7 @@
- #endif
- 		.endm
- 
--		.section ".start", #alloc, #execinstr
-+		.section ".start", "ax"
- /*
-  * sort out different calling conventions
-  */
-diff --git a/arch/arm/boot/compressed/piggy.S b/arch/arm/boot/compressed/piggy.S
-index 0284f84dcf38..27577644ee72 100644
---- a/arch/arm/boot/compressed/piggy.S
-+++ b/arch/arm/boot/compressed/piggy.S
-@@ -1,5 +1,5 @@
- /* SPDX-License-Identifier: GPL-2.0 */
--	.section .piggydata,#alloc
-+	.section .piggydata, "a"
- 	.globl	input_data
- input_data:
- 	.incbin	"arch/arm/boot/compressed/piggy_data"
-diff --git a/arch/arm/mm/proc-arm1020.S b/arch/arm/mm/proc-arm1020.S
-index 4fa5371bc662..2785da387c91 100644
---- a/arch/arm/mm/proc-arm1020.S
-+++ b/arch/arm/mm/proc-arm1020.S
-@@ -491,7 +491,7 @@ cpu_arm1020_name:
- 
- 	.align
- 
--	.section ".proc.info.init", #alloc
-+	.section ".proc.info.init", "a"
- 
- 	.type	__arm1020_proc_info,#object
- __arm1020_proc_info:
-diff --git a/arch/arm/mm/proc-arm1020e.S b/arch/arm/mm/proc-arm1020e.S
-index 5d8a8339e09a..e9ea237ed785 100644
---- a/arch/arm/mm/proc-arm1020e.S
-+++ b/arch/arm/mm/proc-arm1020e.S
-@@ -449,7 +449,7 @@ arm1020e_crval:
- 
- 	.align
- 
--	.section ".proc.info.init", #alloc
-+	.section ".proc.info.init", "a"
- 
- 	.type	__arm1020e_proc_info,#object
- __arm1020e_proc_info:
-diff --git a/arch/arm/mm/proc-arm1022.S b/arch/arm/mm/proc-arm1022.S
-index b3dd95c345e4..920c279e7879 100644
---- a/arch/arm/mm/proc-arm1022.S
-+++ b/arch/arm/mm/proc-arm1022.S
-@@ -443,7 +443,7 @@ arm1022_crval:
- 
- 	.align
- 
--	.section ".proc.info.init", #alloc
-+	.section ".proc.info.init", "a"
- 
- 	.type	__arm1022_proc_info,#object
- __arm1022_proc_info:
-diff --git a/arch/arm/mm/proc-arm1026.S b/arch/arm/mm/proc-arm1026.S
-index e927187157d7..0bdf25a95b10 100644
---- a/arch/arm/mm/proc-arm1026.S
-+++ b/arch/arm/mm/proc-arm1026.S
-@@ -437,7 +437,7 @@ arm1026_crval:
- 	string	cpu_arm1026_name, "ARM1026EJ-S"
- 	.align
- 
--	.section ".proc.info.init", #alloc
-+	.section ".proc.info.init", "a"
- 
- 	.type	__arm1026_proc_info,#object
- __arm1026_proc_info:
-diff --git a/arch/arm/mm/proc-arm720.S b/arch/arm/mm/proc-arm720.S
-index c99d24363f32..39361e196d61 100644
---- a/arch/arm/mm/proc-arm720.S
-+++ b/arch/arm/mm/proc-arm720.S
-@@ -172,7 +172,7 @@ arm720_crval:
-  * See <asm/procinfo.h> for a definition of this structure.
-  */
- 	
--		.section ".proc.info.init", #alloc
-+		.section ".proc.info.init", "a"
- 
- .macro arm720_proc_info name:req, cpu_val:req, cpu_mask:req, cpu_name:req, cpu_flush:req
- 		.type	__\name\()_proc_info,#object
-diff --git a/arch/arm/mm/proc-arm740.S b/arch/arm/mm/proc-arm740.S
-index 1b4a3838393f..1a94bbf6e53f 100644
---- a/arch/arm/mm/proc-arm740.S
-+++ b/arch/arm/mm/proc-arm740.S
-@@ -128,7 +128,7 @@ __arm740_setup:
- 
- 	.align
- 
--	.section ".proc.info.init", #alloc
-+	.section ".proc.info.init", "a"
- 	.type	__arm740_proc_info,#object
- __arm740_proc_info:
- 	.long	0x41807400
-diff --git a/arch/arm/mm/proc-arm7tdmi.S b/arch/arm/mm/proc-arm7tdmi.S
-index 17a4687065c7..52b66cf0259e 100644
---- a/arch/arm/mm/proc-arm7tdmi.S
-+++ b/arch/arm/mm/proc-arm7tdmi.S
-@@ -72,7 +72,7 @@ __arm7tdmi_setup:
- 
- 		.align
- 
--		.section ".proc.info.init", #alloc
-+		.section ".proc.info.init", "a"
- 
- .macro arm7tdmi_proc_info name:req, cpu_val:req, cpu_mask:req, cpu_name:req, \
- 	extra_hwcaps=0
-diff --git a/arch/arm/mm/proc-arm920.S b/arch/arm/mm/proc-arm920.S
-index 298c76b47749..31ac8acc34dc 100644
---- a/arch/arm/mm/proc-arm920.S
-+++ b/arch/arm/mm/proc-arm920.S
-@@ -434,7 +434,7 @@ arm920_crval:
- 
- 	.align
- 
--	.section ".proc.info.init", #alloc
-+	.section ".proc.info.init", "a"
- 
- 	.type	__arm920_proc_info,#object
- __arm920_proc_info:
-diff --git a/arch/arm/mm/proc-arm922.S b/arch/arm/mm/proc-arm922.S
-index 824be3a0bc23..ca2c7ca8af21 100644
---- a/arch/arm/mm/proc-arm922.S
-+++ b/arch/arm/mm/proc-arm922.S
-@@ -412,7 +412,7 @@ arm922_crval:
- 
- 	.align
- 
--	.section ".proc.info.init", #alloc
-+	.section ".proc.info.init", "a"
- 
- 	.type	__arm922_proc_info,#object
- __arm922_proc_info:
-diff --git a/arch/arm/mm/proc-arm925.S b/arch/arm/mm/proc-arm925.S
-index d40cff8f102c..a381a0c9f109 100644
---- a/arch/arm/mm/proc-arm925.S
-+++ b/arch/arm/mm/proc-arm925.S
-@@ -477,7 +477,7 @@ arm925_crval:
- 
- 	.align
- 
--	.section ".proc.info.init", #alloc
-+	.section ".proc.info.init", "a"
- 
- .macro arm925_proc_info name:req, cpu_val:req, cpu_mask:req, cpu_name:req, cache
- 	.type	__\name\()_proc_info,#object
-diff --git a/arch/arm/mm/proc-arm926.S b/arch/arm/mm/proc-arm926.S
-index 4ef89e1d1127..1ba253c2bce1 100644
---- a/arch/arm/mm/proc-arm926.S
-+++ b/arch/arm/mm/proc-arm926.S
-@@ -460,7 +460,7 @@ arm926_crval:
- 
- 	.align
- 
--	.section ".proc.info.init", #alloc
-+	.section ".proc.info.init", "a"
- 
- 	.type	__arm926_proc_info,#object
- __arm926_proc_info:
-diff --git a/arch/arm/mm/proc-arm940.S b/arch/arm/mm/proc-arm940.S
-index 1c26d991386d..4b8a00220cc9 100644
---- a/arch/arm/mm/proc-arm940.S
-+++ b/arch/arm/mm/proc-arm940.S
-@@ -340,7 +340,7 @@ __arm940_setup:
- 
- 	.align
- 
--	.section ".proc.info.init", #alloc
-+	.section ".proc.info.init", "a"
- 
- 	.type	__arm940_proc_info,#object
- __arm940_proc_info:
-diff --git a/arch/arm/mm/proc-arm946.S b/arch/arm/mm/proc-arm946.S
-index 2dc1c75a4fd4..555becf9c758 100644
---- a/arch/arm/mm/proc-arm946.S
-+++ b/arch/arm/mm/proc-arm946.S
-@@ -395,7 +395,7 @@ __arm946_setup:
- 
- 	.align
- 
--	.section ".proc.info.init", #alloc
-+	.section ".proc.info.init", "a"
- 	.type	__arm946_proc_info,#object
- __arm946_proc_info:
- 	.long	0x41009460
-diff --git a/arch/arm/mm/proc-arm9tdmi.S b/arch/arm/mm/proc-arm9tdmi.S
-index 913c06e590af..ef517530130b 100644
---- a/arch/arm/mm/proc-arm9tdmi.S
-+++ b/arch/arm/mm/proc-arm9tdmi.S
-@@ -66,7 +66,7 @@ __arm9tdmi_setup:
- 
- 		.align
- 
--		.section ".proc.info.init", #alloc
-+		.section ".proc.info.init", "a"
- 
- .macro arm9tdmi_proc_info name:req, cpu_val:req, cpu_mask:req, cpu_name:req
- 		.type	__\name\()_proc_info, #object
-diff --git a/arch/arm/mm/proc-fa526.S b/arch/arm/mm/proc-fa526.S
-index 8120b6f4dbb8..dddf833fe000 100644
---- a/arch/arm/mm/proc-fa526.S
-+++ b/arch/arm/mm/proc-fa526.S
-@@ -185,7 +185,7 @@ fa526_cr1_set:
- 
- 	.align
- 
--	.section ".proc.info.init", #alloc
-+	.section ".proc.info.init", "a"
- 
- 	.type	__fa526_proc_info,#object
- __fa526_proc_info:
-diff --git a/arch/arm/mm/proc-feroceon.S b/arch/arm/mm/proc-feroceon.S
-index bb6dc34d42a3..b12b76bc8d30 100644
---- a/arch/arm/mm/proc-feroceon.S
-+++ b/arch/arm/mm/proc-feroceon.S
-@@ -571,7 +571,7 @@ feroceon_crval:
- 
- 	.align
- 
--	.section ".proc.info.init", #alloc
-+	.section ".proc.info.init", "a"
- 
- .macro feroceon_proc_info name:req, cpu_val:req, cpu_mask:req, cpu_name:req, cache:req
- 	.type	__\name\()_proc_info,#object
-diff --git a/arch/arm/mm/proc-mohawk.S b/arch/arm/mm/proc-mohawk.S
-index f08308578885..d47d6c5cee63 100644
---- a/arch/arm/mm/proc-mohawk.S
-+++ b/arch/arm/mm/proc-mohawk.S
-@@ -416,7 +416,7 @@ mohawk_crval:
- 
- 	.align
- 
--	.section ".proc.info.init", #alloc
-+	.section ".proc.info.init", "a"
- 
- 	.type	__88sv331x_proc_info,#object
- __88sv331x_proc_info:
-diff --git a/arch/arm/mm/proc-sa110.S b/arch/arm/mm/proc-sa110.S
-index d5bc5d702563..baba503ba816 100644
---- a/arch/arm/mm/proc-sa110.S
-+++ b/arch/arm/mm/proc-sa110.S
-@@ -196,7 +196,7 @@ sa110_crval:
- 
- 	.align
- 
--	.section ".proc.info.init", #alloc
-+	.section ".proc.info.init", "a"
- 
- 	.type	__sa110_proc_info,#object
- __sa110_proc_info:
-diff --git a/arch/arm/mm/proc-sa1100.S b/arch/arm/mm/proc-sa1100.S
-index be7b611c76c7..75ebacc8e4e5 100644
---- a/arch/arm/mm/proc-sa1100.S
-+++ b/arch/arm/mm/proc-sa1100.S
-@@ -239,7 +239,7 @@ sa1100_crval:
- 
- 	.align
- 
--	.section ".proc.info.init", #alloc
-+	.section ".proc.info.init", "a"
- 
- .macro sa1100_proc_info name:req, cpu_val:req, cpu_mask:req, cpu_name:req
- 	.type	__\name\()_proc_info,#object
-diff --git a/arch/arm/mm/proc-v6.S b/arch/arm/mm/proc-v6.S
-index c1c85eb3484f..1dd0d5ca27da 100644
---- a/arch/arm/mm/proc-v6.S
-+++ b/arch/arm/mm/proc-v6.S
-@@ -261,7 +261,7 @@ v6_crval:
- 	string	cpu_elf_name, "v6"
- 	.align
- 
--	.section ".proc.info.init", #alloc
-+	.section ".proc.info.init", "a"
- 
- 	/*
- 	 * Match any ARMv6 processor core.
-diff --git a/arch/arm/mm/proc-v7.S b/arch/arm/mm/proc-v7.S
-index c4e8006a1a8c..48e0ef6f0dcc 100644
---- a/arch/arm/mm/proc-v7.S
-+++ b/arch/arm/mm/proc-v7.S
-@@ -644,7 +644,7 @@ __v7_setup_stack:
- 	string	cpu_elf_name, "v7"
- 	.align
- 
--	.section ".proc.info.init", #alloc
-+	.section ".proc.info.init", "a"
- 
- 	/*
- 	 * Standard v7 proc info content
-diff --git a/arch/arm/mm/proc-v7m.S b/arch/arm/mm/proc-v7m.S
-index 1a49d503eafc..84459c1d31b8 100644
---- a/arch/arm/mm/proc-v7m.S
-+++ b/arch/arm/mm/proc-v7m.S
-@@ -93,7 +93,7 @@ ENTRY(cpu_cm7_proc_fin)
- 	ret	lr
- ENDPROC(cpu_cm7_proc_fin)
- 
--	.section ".init.text", #alloc, #execinstr
-+	.section ".init.text", "ax"
- 
- __v7m_cm7_setup:
- 	mov	r8, #(V7M_SCB_CCR_DC | V7M_SCB_CCR_IC| V7M_SCB_CCR_BP)
-@@ -177,7 +177,7 @@ ENDPROC(__v7m_setup)
- 	string cpu_elf_name "v7m"
- 	string cpu_v7m_name "ARMv7-M"
- 
--	.section ".proc.info.init", #alloc
-+	.section ".proc.info.init", "a"
- 
- .macro __v7m_proc name, initfunc, cache_fns = nop_cache_fns, hwcaps = 0,  proc_fns = v7m_processor_functions
- 	.long	0			/* proc_info_list.__cpu_mm_mmu_flags */
-diff --git a/arch/arm/mm/proc-xsc3.S b/arch/arm/mm/proc-xsc3.S
-index 1ac0fbbe9f12..42eaecc43cfe 100644
---- a/arch/arm/mm/proc-xsc3.S
-+++ b/arch/arm/mm/proc-xsc3.S
-@@ -496,7 +496,7 @@ xsc3_crval:
- 
- 	.align
- 
--	.section ".proc.info.init", #alloc
-+	.section ".proc.info.init", "a"
- 
- .macro xsc3_proc_info name:req, cpu_val:req, cpu_mask:req
- 	.type	__\name\()_proc_info,#object
-diff --git a/arch/arm/mm/proc-xscale.S b/arch/arm/mm/proc-xscale.S
-index bdb2b7749b03..18ac5a1f8922 100644
---- a/arch/arm/mm/proc-xscale.S
-+++ b/arch/arm/mm/proc-xscale.S
-@@ -610,7 +610,7 @@ xscale_crval:
- 
- 	.align
- 
--	.section ".proc.info.init", #alloc
-+	.section ".proc.info.init", "a"
- 
- .macro xscale_proc_info name:req, cpu_val:req, cpu_mask:req, cpu_name:req, cache
- 	.type	__\name\()_proc_info,#object
--- 
-2.43.0
-
diff --git a/board/beagleboard/beaglebone/patches/linux/0003-ata-ahci-Match-EM_MAX_SLOTS-with-SATA_PMP_MAX_PORTS.patch b/board/beagleboard/beaglebone/patches/linux/0003-ata-ahci-Match-EM_MAX_SLOTS-with-SATA_PMP_MAX_PORTS.patch
deleted file mode 100644
index 50f5cf71a7..0000000000
--- a/board/beagleboard/beaglebone/patches/linux/0003-ata-ahci-Match-EM_MAX_SLOTS-with-SATA_PMP_MAX_PORTS.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 67a00c299c5c143817c948fbc7de1a2fa1af38fb Mon Sep 17 00:00:00 2001
-From: Kai-Heng Feng <kai.heng.feng@canonical.com>
-Date: Tue, 11 Oct 2022 10:46:17 +0800
-Subject: [PATCH] ata: ahci: Match EM_MAX_SLOTS with SATA_PMP_MAX_PORTS
-
-commit 1e41e693f458eef2d5728207dbd327cd3b16580a upstream.
-
-UBSAN complains about array-index-out-of-bounds:
-[ 1.980703] kernel: UBSAN: array-index-out-of-bounds in /build/linux-9H675w/linux-5.15.0/drivers/ata/libahci.c:968:41
-[ 1.980709] kernel: index 15 is out of range for type 'ahci_em_priv [8]'
-[ 1.980713] kernel: CPU: 0 PID: 209 Comm: scsi_eh_8 Not tainted 5.15.0-25-generic #25-Ubuntu
-[ 1.980716] kernel: Hardware name: System manufacturer System Product Name/P5Q3, BIOS 1102 06/11/2010
-[ 1.980718] kernel: Call Trace:
-[ 1.980721] kernel: <TASK>
-[ 1.980723] kernel: show_stack+0x52/0x58
-[ 1.980729] kernel: dump_stack_lvl+0x4a/0x5f
-[ 1.980734] kernel: dump_stack+0x10/0x12
-[ 1.980736] kernel: ubsan_epilogue+0x9/0x45
-[ 1.980739] kernel: __ubsan_handle_out_of_bounds.cold+0x44/0x49
-[ 1.980742] kernel: ahci_qc_issue+0x166/0x170 [libahci]
-[ 1.980748] kernel: ata_qc_issue+0x135/0x240
-[ 1.980752] kernel: ata_exec_internal_sg+0x2c4/0x580
-[ 1.980754] kernel: ? vprintk_default+0x1d/0x20
-[ 1.980759] kernel: ata_exec_internal+0x67/0xa0
-[ 1.980762] kernel: sata_pmp_read+0x8d/0xc0
-[ 1.980765] kernel: sata_pmp_read_gscr+0x3c/0x90
-[ 1.980768] kernel: sata_pmp_attach+0x8b/0x310
-[ 1.980771] kernel: ata_eh_revalidate_and_attach+0x28c/0x4b0
-[ 1.980775] kernel: ata_eh_recover+0x6b6/0xb30
-[ 1.980778] kernel: ? ahci_do_hardreset+0x180/0x180 [libahci]
-[ 1.980783] kernel: ? ahci_stop_engine+0xb0/0xb0 [libahci]
-[ 1.980787] kernel: ? ahci_do_softreset+0x290/0x290 [libahci]
-[ 1.980792] kernel: ? trace_event_raw_event_ata_eh_link_autopsy_qc+0xe0/0xe0
-[ 1.980795] kernel: sata_pmp_eh_recover.isra.0+0x214/0x560
-[ 1.980799] kernel: sata_pmp_error_handler+0x23/0x40
-[ 1.980802] kernel: ahci_error_handler+0x43/0x80 [libahci]
-[ 1.980806] kernel: ata_scsi_port_error_handler+0x2b1/0x600
-[ 1.980810] kernel: ata_scsi_error+0x9c/0xd0
-[ 1.980813] kernel: scsi_error_handler+0xa1/0x180
-[ 1.980817] kernel: ? scsi_unjam_host+0x1c0/0x1c0
-[ 1.980820] kernel: kthread+0x12a/0x150
-[ 1.980823] kernel: ? set_kthread_struct+0x50/0x50
-[ 1.980826] kernel: ret_from_fork+0x22/0x30
-[ 1.980831] kernel: </TASK>
-
-This happens because sata_pmp_init_links() initialize link->pmp up to
-SATA_PMP_MAX_PORTS while em_priv is declared as 8 elements array.
-
-I can't find the maximum Enclosure Management ports specified in AHCI
-spec v1.3.1, but "12.2.1 LED message type" states that "Port Multiplier
-Information" can utilize 4 bits, which implies it can support up to 16
-ports. Hence, use SATA_PMP_MAX_PORTS as EM_MAX_SLOTS to resolve the
-issue.
-
-BugLink: https://bugs.launchpad.net/bugs/1970074
-Cc: stable@vger.kernel.org
-Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
-Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
-Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
-Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=67a00c299c5c143817c948fbc7de1a2fa1af38fb
----
- drivers/ata/ahci.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/drivers/ata/ahci.h b/drivers/ata/ahci.h
-index 9290e787abdc..d5b9f9689877 100644
---- a/drivers/ata/ahci.h
-+++ b/drivers/ata/ahci.h
-@@ -265,7 +265,7 @@ enum {
- 	PCS_7				= 0x94, /* 7+ port PCS (Denverton) */
- 
- 	/* em constants */
--	EM_MAX_SLOTS			= 8,
-+	EM_MAX_SLOTS			= SATA_PMP_MAX_PORTS,
- 	EM_MAX_RETRY			= 5,
- 
- 	/* em_ctl bits */
--- 
-2.43.0
-
diff --git a/board/beagleboard/beaglebone/patches/linux/0004-ata-ahci-fix-enum-constants-for-gcc-13.patch b/board/beagleboard/beaglebone/patches/linux/0004-ata-ahci-fix-enum-constants-for-gcc-13.patch
deleted file mode 100644
index 6a5b3f594b..0000000000
--- a/board/beagleboard/beaglebone/patches/linux/0004-ata-ahci-fix-enum-constants-for-gcc-13.patch
+++ /dev/null
@@ -1,357 +0,0 @@
-From ba6e23d2c9e3bcabda328467ba4eeca12f37e2ae Mon Sep 17 00:00:00 2001
-From: Arnd Bergmann <arnd@arndb.de>
-Date: Sat, 3 Dec 2022 11:54:25 +0100
-Subject: [PATCH] ata: ahci: fix enum constants for gcc-13
-
-commit f07788079f515ca4a681c5f595bdad19cfbd7b1d upstream.
-
-gcc-13 slightly changes the type of constant expressions that are defined
-in an enum, which triggers a compile time sanity check in libata:
-
-linux/drivers/ata/libahci.c: In function 'ahci_led_store':
-linux/include/linux/compiler_types.h:357:45: error: call to '__compiletime_assert_302' declared with attribute error: BUILD_BUG_ON failed: sizeof(_s) > sizeof(long)
-357 | _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
-
-The new behavior is that sizeof() returns the same value for the
-constant as it does for the enum type, which is generally more sensible
-and consistent.
-
-The problem in libata is that it contains a single enum definition for
-lots of unrelated constants, some of which are large positive (unsigned)
-integers like 0xffffffff, while others like (1<<31) are interpreted as
-negative integers, and this forces the enum type to become 64 bit wide
-even though most constants would still fit into a signed 32-bit 'int'.
-
-Fix this by changing the entire enum definition to use BIT(x) in place
-of (1<<x), which results in all values being seen as 'unsigned' and
-fitting into an unsigned 32-bit type.
-
-Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107917
-Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107405
-Reported-by: Luis Machado <luis.machado@arm.com>
-Cc: linux-ide@vger.kernel.org
-Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>
-Cc: stable@vger.kernel.org
-Cc: Randy Dunlap <rdunlap@infradead.org>
-Signed-off-by: Arnd Bergmann <arnd@arndb.de>
-Tested-by: Luis Machado <luis.machado@arm.com>
-Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
-[Backport to linux-4.19.y]
-Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
-Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
-Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=4c3ddc06cedb62f2904e58fd95170bf206bee149
----
- drivers/ata/ahci.h | 232 +++++++++++++++++++++++----------------------
- 1 file changed, 117 insertions(+), 115 deletions(-)
-
-diff --git a/drivers/ata/ahci.h b/drivers/ata/ahci.h
-index d5b9f9689877..8cc6cb14767b 100644
---- a/drivers/ata/ahci.h
-+++ b/drivers/ata/ahci.h
-@@ -40,6 +40,7 @@
- #include <linux/libata.h>
- #include <linux/phy/phy.h>
- #include <linux/regulator/consumer.h>
-+#include <linux/bits.h>
- 
- /* Enclosure Management Control */
- #define EM_CTRL_MSG_TYPE              0x000f0000
-@@ -70,12 +71,12 @@ enum {
- 	AHCI_PORT_PRIV_FBS_DMA_SZ	= AHCI_CMD_SLOT_SZ +
- 					  AHCI_CMD_TBL_AR_SZ +
- 					  (AHCI_RX_FIS_SZ * 16),
--	AHCI_IRQ_ON_SG		= (1 << 31),
--	AHCI_CMD_ATAPI		= (1 << 5),
--	AHCI_CMD_WRITE		= (1 << 6),
--	AHCI_CMD_PREFETCH	= (1 << 7),
--	AHCI_CMD_RESET		= (1 << 8),
--	AHCI_CMD_CLR_BUSY	= (1 << 10),
-+	AHCI_IRQ_ON_SG		= BIT(31),
-+	AHCI_CMD_ATAPI		= BIT(5),
-+	AHCI_CMD_WRITE		= BIT(6),
-+	AHCI_CMD_PREFETCH	= BIT(7),
-+	AHCI_CMD_RESET		= BIT(8),
-+	AHCI_CMD_CLR_BUSY	= BIT(10),
- 
- 	RX_FIS_PIO_SETUP	= 0x20,	/* offset of PIO Setup FIS data */
- 	RX_FIS_D2H_REG		= 0x40,	/* offset of D2H Register FIS data */
-@@ -93,37 +94,37 @@ enum {
- 	HOST_CAP2		= 0x24, /* host capabilities, extended */
- 
- 	/* HOST_CTL bits */
--	HOST_RESET		= (1 << 0),  /* reset controller; self-clear */
--	HOST_IRQ_EN		= (1 << 1),  /* global IRQ enable */
--	HOST_MRSM		= (1 << 2),  /* MSI Revert to Single Message */
--	HOST_AHCI_EN		= (1 << 31), /* AHCI enabled */
-+	HOST_RESET		= BIT(0),  /* reset controller; self-clear */
-+	HOST_IRQ_EN		= BIT(1),  /* global IRQ enable */
-+	HOST_MRSM		= BIT(2),  /* MSI Revert to Single Message */
-+	HOST_AHCI_EN		= BIT(31), /* AHCI enabled */
- 
- 	/* HOST_CAP bits */
--	HOST_CAP_SXS		= (1 << 5),  /* Supports External SATA */
--	HOST_CAP_EMS		= (1 << 6),  /* Enclosure Management support */
--	HOST_CAP_CCC		= (1 << 7),  /* Command Completion Coalescing */
--	HOST_CAP_PART		= (1 << 13), /* Partial state capable */
--	HOST_CAP_SSC		= (1 << 14), /* Slumber state capable */
--	HOST_CAP_PIO_MULTI	= (1 << 15), /* PIO multiple DRQ support */
--	HOST_CAP_FBS		= (1 << 16), /* FIS-based switching support */
--	HOST_CAP_PMP		= (1 << 17), /* Port Multiplier support */
--	HOST_CAP_ONLY		= (1 << 18), /* Supports AHCI mode only */
--	HOST_CAP_CLO		= (1 << 24), /* Command List Override support */
--	HOST_CAP_LED		= (1 << 25), /* Supports activity LED */
--	HOST_CAP_ALPM		= (1 << 26), /* Aggressive Link PM support */
--	HOST_CAP_SSS		= (1 << 27), /* Staggered Spin-up */
--	HOST_CAP_MPS		= (1 << 28), /* Mechanical presence switch */
--	HOST_CAP_SNTF		= (1 << 29), /* SNotification register */
--	HOST_CAP_NCQ		= (1 << 30), /* Native Command Queueing */
--	HOST_CAP_64		= (1 << 31), /* PCI DAC (64-bit DMA) support */
-+	HOST_CAP_SXS		= BIT(5),  /* Supports External SATA */
-+	HOST_CAP_EMS		= BIT(6),  /* Enclosure Management support */
-+	HOST_CAP_CCC		= BIT(7),  /* Command Completion Coalescing */
-+	HOST_CAP_PART		= BIT(13), /* Partial state capable */
-+	HOST_CAP_SSC		= BIT(14), /* Slumber state capable */
-+	HOST_CAP_PIO_MULTI	= BIT(15), /* PIO multiple DRQ support */
-+	HOST_CAP_FBS		= BIT(16), /* FIS-based switching support */
-+	HOST_CAP_PMP		= BIT(17), /* Port Multiplier support */
-+	HOST_CAP_ONLY		= BIT(18), /* Supports AHCI mode only */
-+	HOST_CAP_CLO		= BIT(24), /* Command List Override support */
-+	HOST_CAP_LED		= BIT(25), /* Supports activity LED */
-+	HOST_CAP_ALPM		= BIT(26), /* Aggressive Link PM support */
-+	HOST_CAP_SSS		= BIT(27), /* Staggered Spin-up */
-+	HOST_CAP_MPS		= BIT(28), /* Mechanical presence switch */
-+	HOST_CAP_SNTF		= BIT(29), /* SNotification register */
-+	HOST_CAP_NCQ		= BIT(30), /* Native Command Queueing */
-+	HOST_CAP_64		= BIT(31), /* PCI DAC (64-bit DMA) support */
- 
- 	/* HOST_CAP2 bits */
--	HOST_CAP2_BOH		= (1 << 0),  /* BIOS/OS handoff supported */
--	HOST_CAP2_NVMHCI	= (1 << 1),  /* NVMHCI supported */
--	HOST_CAP2_APST		= (1 << 2),  /* Automatic partial to slumber */
--	HOST_CAP2_SDS		= (1 << 3),  /* Support device sleep */
--	HOST_CAP2_SADM		= (1 << 4),  /* Support aggressive DevSlp */
--	HOST_CAP2_DESO		= (1 << 5),  /* DevSlp from slumber only */
-+	HOST_CAP2_BOH		= BIT(0),  /* BIOS/OS handoff supported */
-+	HOST_CAP2_NVMHCI	= BIT(1),  /* NVMHCI supported */
-+	HOST_CAP2_APST		= BIT(2),  /* Automatic partial to slumber */
-+	HOST_CAP2_SDS		= BIT(3),  /* Support device sleep */
-+	HOST_CAP2_SADM		= BIT(4),  /* Support aggressive DevSlp */
-+	HOST_CAP2_DESO		= BIT(5),  /* DevSlp from slumber only */
- 
- 	/* registers for each SATA port */
- 	PORT_LST_ADDR		= 0x00, /* command list DMA addr */
-@@ -145,24 +146,25 @@ enum {
- 	PORT_DEVSLP		= 0x44, /* device sleep */
- 
- 	/* PORT_IRQ_{STAT,MASK} bits */
--	PORT_IRQ_COLD_PRES	= (1 << 31), /* cold presence detect */
--	PORT_IRQ_TF_ERR		= (1 << 30), /* task file error */
--	PORT_IRQ_HBUS_ERR	= (1 << 29), /* host bus fatal error */
--	PORT_IRQ_HBUS_DATA_ERR	= (1 << 28), /* host bus data error */
--	PORT_IRQ_IF_ERR		= (1 << 27), /* interface fatal error */
--	PORT_IRQ_IF_NONFATAL	= (1 << 26), /* interface non-fatal error */
--	PORT_IRQ_OVERFLOW	= (1 << 24), /* xfer exhausted available S/G */
--	PORT_IRQ_BAD_PMP	= (1 << 23), /* incorrect port multiplier */
--
--	PORT_IRQ_PHYRDY		= (1 << 22), /* PhyRdy changed */
--	PORT_IRQ_DEV_ILCK	= (1 << 7), /* device interlock */
--	PORT_IRQ_CONNECT	= (1 << 6), /* port connect change status */
--	PORT_IRQ_SG_DONE	= (1 << 5), /* descriptor processed */
--	PORT_IRQ_UNK_FIS	= (1 << 4), /* unknown FIS rx'd */
--	PORT_IRQ_SDB_FIS	= (1 << 3), /* Set Device Bits FIS rx'd */
--	PORT_IRQ_DMAS_FIS	= (1 << 2), /* DMA Setup FIS rx'd */
--	PORT_IRQ_PIOS_FIS	= (1 << 1), /* PIO Setup FIS rx'd */
--	PORT_IRQ_D2H_REG_FIS	= (1 << 0), /* D2H Register FIS rx'd */
-+	PORT_IRQ_COLD_PRES	= BIT(31), /* cold presence detect */
-+	PORT_IRQ_TF_ERR		= BIT(30), /* task file error */
-+	PORT_IRQ_HBUS_ERR	= BIT(29), /* host bus fatal error */
-+	PORT_IRQ_HBUS_DATA_ERR	= BIT(28), /* host bus data error */
-+	PORT_IRQ_IF_ERR		= BIT(27), /* interface fatal error */
-+	PORT_IRQ_IF_NONFATAL	= BIT(26), /* interface non-fatal error */
-+	PORT_IRQ_OVERFLOW	= BIT(24), /* xfer exhausted available S/G */
-+	PORT_IRQ_BAD_PMP	= BIT(23), /* incorrect port multiplier */
-+
-+	PORT_IRQ_PHYRDY		= BIT(22), /* PhyRdy changed */
-+	PORT_IRQ_DEV_ILCK	= BIT(7),  /* device interlock */
-+	PORT_IRQ_DMPS		= BIT(7),  /* mechanical presence status */
-+	PORT_IRQ_CONNECT	= BIT(6),  /* port connect change status */
-+	PORT_IRQ_SG_DONE	= BIT(5),  /* descriptor processed */
-+	PORT_IRQ_UNK_FIS	= BIT(4),  /* unknown FIS rx'd */
-+	PORT_IRQ_SDB_FIS	= BIT(3),  /* Set Device Bits FIS rx'd */
-+	PORT_IRQ_DMAS_FIS	= BIT(2),  /* DMA Setup FIS rx'd */
-+	PORT_IRQ_PIOS_FIS	= BIT(1),  /* PIO Setup FIS rx'd */
-+	PORT_IRQ_D2H_REG_FIS	= BIT(0),  /* D2H Register FIS rx'd */
- 
- 	PORT_IRQ_FREEZE		= PORT_IRQ_HBUS_ERR |
- 				  PORT_IRQ_IF_ERR |
-@@ -178,34 +180,34 @@ enum {
- 				  PORT_IRQ_PIOS_FIS | PORT_IRQ_D2H_REG_FIS,
- 
- 	/* PORT_CMD bits */
--	PORT_CMD_ASP		= (1 << 27), /* Aggressive Slumber/Partial */
--	PORT_CMD_ALPE		= (1 << 26), /* Aggressive Link PM enable */
--	PORT_CMD_ATAPI		= (1 << 24), /* Device is ATAPI */
--	PORT_CMD_FBSCP		= (1 << 22), /* FBS Capable Port */
--	PORT_CMD_ESP		= (1 << 21), /* External Sata Port */
--	PORT_CMD_HPCP		= (1 << 18), /* HotPlug Capable Port */
--	PORT_CMD_PMP		= (1 << 17), /* PMP attached */
--	PORT_CMD_LIST_ON	= (1 << 15), /* cmd list DMA engine running */
--	PORT_CMD_FIS_ON		= (1 << 14), /* FIS DMA engine running */
--	PORT_CMD_FIS_RX		= (1 << 4), /* Enable FIS receive DMA engine */
--	PORT_CMD_CLO		= (1 << 3), /* Command list override */
--	PORT_CMD_POWER_ON	= (1 << 2), /* Power up device */
--	PORT_CMD_SPIN_UP	= (1 << 1), /* Spin up device */
--	PORT_CMD_START		= (1 << 0), /* Enable port DMA engine */
--
--	PORT_CMD_ICC_MASK	= (0xf << 28), /* i/f ICC state mask */
--	PORT_CMD_ICC_ACTIVE	= (0x1 << 28), /* Put i/f in active state */
--	PORT_CMD_ICC_PARTIAL	= (0x2 << 28), /* Put i/f in partial state */
--	PORT_CMD_ICC_SLUMBER	= (0x6 << 28), /* Put i/f in slumber state */
-+	PORT_CMD_ASP		= BIT(27), /* Aggressive Slumber/Partial */
-+	PORT_CMD_ALPE		= BIT(26), /* Aggressive Link PM enable */
-+	PORT_CMD_ATAPI		= BIT(24), /* Device is ATAPI */
-+	PORT_CMD_FBSCP		= BIT(22), /* FBS Capable Port */
-+	PORT_CMD_ESP		= BIT(21), /* External Sata Port */
-+	PORT_CMD_HPCP		= BIT(18), /* HotPlug Capable Port */
-+	PORT_CMD_PMP		= BIT(17), /* PMP attached */
-+	PORT_CMD_LIST_ON	= BIT(15), /* cmd list DMA engine running */
-+	PORT_CMD_FIS_ON		= BIT(14), /* FIS DMA engine running */
-+	PORT_CMD_FIS_RX		= BIT(4),  /* Enable FIS receive DMA engine */
-+	PORT_CMD_CLO		= BIT(3),  /* Command list override */
-+	PORT_CMD_POWER_ON	= BIT(2),  /* Power up device */
-+	PORT_CMD_SPIN_UP	= BIT(1),  /* Spin up device */
-+	PORT_CMD_START		= BIT(0),  /* Enable port DMA engine */
-+
-+	PORT_CMD_ICC_MASK	= (0xfu << 28), /* i/f ICC state mask */
-+	PORT_CMD_ICC_ACTIVE	= (0x1u << 28), /* Put i/f in active state */
-+	PORT_CMD_ICC_PARTIAL	= (0x2u << 28), /* Put i/f in partial state */
-+	PORT_CMD_ICC_SLUMBER	= (0x6u << 28), /* Put i/f in slumber state */
- 
- 	/* PORT_FBS bits */
- 	PORT_FBS_DWE_OFFSET	= 16, /* FBS device with error offset */
- 	PORT_FBS_ADO_OFFSET	= 12, /* FBS active dev optimization offset */
- 	PORT_FBS_DEV_OFFSET	= 8,  /* FBS device to issue offset */
- 	PORT_FBS_DEV_MASK	= (0xf << PORT_FBS_DEV_OFFSET),  /* FBS.DEV */
--	PORT_FBS_SDE		= (1 << 2), /* FBS single device error */
--	PORT_FBS_DEC		= (1 << 1), /* FBS device error clear */
--	PORT_FBS_EN		= (1 << 0), /* Enable FBS */
-+	PORT_FBS_SDE		= BIT(2), /* FBS single device error */
-+	PORT_FBS_DEC		= BIT(1), /* FBS device error clear */
-+	PORT_FBS_EN		= BIT(0), /* Enable FBS */
- 
- 	/* PORT_DEVSLP bits */
- 	PORT_DEVSLP_DM_OFFSET	= 25,             /* DITO multiplier offset */
-@@ -213,45 +215,45 @@ enum {
- 	PORT_DEVSLP_DITO_OFFSET	= 15,             /* DITO offset */
- 	PORT_DEVSLP_MDAT_OFFSET	= 10,             /* Minimum assertion time */
- 	PORT_DEVSLP_DETO_OFFSET	= 2,              /* DevSlp exit timeout */
--	PORT_DEVSLP_DSP		= (1 << 1),       /* DevSlp present */
--	PORT_DEVSLP_ADSE	= (1 << 0),       /* Aggressive DevSlp enable */
-+	PORT_DEVSLP_DSP		= BIT(1),         /* DevSlp present */
-+	PORT_DEVSLP_ADSE	= BIT(0),         /* Aggressive DevSlp enable */
- 
- 	/* hpriv->flags bits */
- 
- #define AHCI_HFLAGS(flags)		.private_data	= (void *)(flags)
- 
--	AHCI_HFLAG_NO_NCQ		= (1 << 0),
--	AHCI_HFLAG_IGN_IRQ_IF_ERR	= (1 << 1), /* ignore IRQ_IF_ERR */
--	AHCI_HFLAG_IGN_SERR_INTERNAL	= (1 << 2), /* ignore SERR_INTERNAL */
--	AHCI_HFLAG_32BIT_ONLY		= (1 << 3), /* force 32bit */
--	AHCI_HFLAG_MV_PATA		= (1 << 4), /* PATA port */
--	AHCI_HFLAG_NO_MSI		= (1 << 5), /* no PCI MSI */
--	AHCI_HFLAG_NO_PMP		= (1 << 6), /* no PMP */
--	AHCI_HFLAG_SECT255		= (1 << 8), /* max 255 sectors */
--	AHCI_HFLAG_YES_NCQ		= (1 << 9), /* force NCQ cap on */
--	AHCI_HFLAG_NO_SUSPEND		= (1 << 10), /* don't suspend */
--	AHCI_HFLAG_SRST_TOUT_IS_OFFLINE	= (1 << 11), /* treat SRST timeout as
--							link offline */
--	AHCI_HFLAG_NO_SNTF		= (1 << 12), /* no sntf */
--	AHCI_HFLAG_NO_FPDMA_AA		= (1 << 13), /* no FPDMA AA */
--	AHCI_HFLAG_YES_FBS		= (1 << 14), /* force FBS cap on */
--	AHCI_HFLAG_DELAY_ENGINE		= (1 << 15), /* do not start engine on
--						        port start (wait until
--						        error-handling stage) */
--	AHCI_HFLAG_NO_DEVSLP		= (1 << 17), /* no device sleep */
--	AHCI_HFLAG_NO_FBS		= (1 << 18), /* no FBS */
-+	AHCI_HFLAG_NO_NCQ		= BIT(0),
-+	AHCI_HFLAG_IGN_IRQ_IF_ERR	= BIT(1), /* ignore IRQ_IF_ERR */
-+	AHCI_HFLAG_IGN_SERR_INTERNAL	= BIT(2), /* ignore SERR_INTERNAL */
-+	AHCI_HFLAG_32BIT_ONLY		= BIT(3), /* force 32bit */
-+	AHCI_HFLAG_MV_PATA		= BIT(4), /* PATA port */
-+	AHCI_HFLAG_NO_MSI		= BIT(5), /* no PCI MSI */
-+	AHCI_HFLAG_NO_PMP		= BIT(6), /* no PMP */
-+	AHCI_HFLAG_SECT255		= BIT(8), /* max 255 sectors */
-+	AHCI_HFLAG_YES_NCQ		= BIT(9), /* force NCQ cap on */
-+	AHCI_HFLAG_NO_SUSPEND		= BIT(10), /* don't suspend */
-+	AHCI_HFLAG_SRST_TOUT_IS_OFFLINE	= BIT(11), /* treat SRST timeout as
-+						      link offline */
-+	AHCI_HFLAG_NO_SNTF		= BIT(12), /* no sntf */
-+	AHCI_HFLAG_NO_FPDMA_AA		= BIT(13), /* no FPDMA AA */
-+	AHCI_HFLAG_YES_FBS		= BIT(14), /* force FBS cap on */
-+	AHCI_HFLAG_DELAY_ENGINE		= BIT(15), /* do not start engine on
-+						      port start (wait until
-+						      error-handling stage) */
-+	AHCI_HFLAG_NO_DEVSLP		= BIT(17), /* no device sleep */
-+	AHCI_HFLAG_NO_FBS		= BIT(18), /* no FBS */
- 
- #ifdef CONFIG_PCI_MSI
--	AHCI_HFLAG_MULTI_MSI		= (1 << 20), /* per-port MSI(-X) */
-+	AHCI_HFLAG_MULTI_MSI		= BIT(20), /* per-port MSI(-X) */
- #else
- 	/* compile out MSI infrastructure */
- 	AHCI_HFLAG_MULTI_MSI		= 0,
- #endif
--	AHCI_HFLAG_WAKE_BEFORE_STOP	= (1 << 22), /* wake before DMA stop */
--	AHCI_HFLAG_YES_ALPM		= (1 << 23), /* force ALPM cap on */
--	AHCI_HFLAG_NO_WRITE_TO_RO	= (1 << 24), /* don't write to read
--							only registers */
--	AHCI_HFLAG_IS_MOBILE		= (1 << 25), /* mobile chipset, use
-+	AHCI_HFLAG_WAKE_BEFORE_STOP	= BIT(22), /* wake before DMA stop */
-+	AHCI_HFLAG_YES_ALPM		= BIT(23), /* force ALPM cap on */
-+	AHCI_HFLAG_NO_WRITE_TO_RO	= BIT(24), /* don't write to read
-+						      only registers */
-+	AHCI_HFLAG_IS_MOBILE		= BIT(25), /* mobile chipset, use
- 							SATA_MOBILE_LPM_POLICY
- 							as default lpm_policy */
- 
-@@ -269,22 +271,22 @@ enum {
- 	EM_MAX_RETRY			= 5,
- 
- 	/* em_ctl bits */
--	EM_CTL_RST		= (1 << 9), /* Reset */
--	EM_CTL_TM		= (1 << 8), /* Transmit Message */
--	EM_CTL_MR		= (1 << 0), /* Message Received */
--	EM_CTL_ALHD		= (1 << 26), /* Activity LED */
--	EM_CTL_XMT		= (1 << 25), /* Transmit Only */
--	EM_CTL_SMB		= (1 << 24), /* Single Message Buffer */
--	EM_CTL_SGPIO		= (1 << 19), /* SGPIO messages supported */
--	EM_CTL_SES		= (1 << 18), /* SES-2 messages supported */
--	EM_CTL_SAFTE		= (1 << 17), /* SAF-TE messages supported */
--	EM_CTL_LED		= (1 << 16), /* LED messages supported */
-+	EM_CTL_RST		= BIT(9), /* Reset */
-+	EM_CTL_TM		= BIT(8), /* Transmit Message */
-+	EM_CTL_MR		= BIT(0), /* Message Received */
-+	EM_CTL_ALHD		= BIT(26), /* Activity LED */
-+	EM_CTL_XMT		= BIT(25), /* Transmit Only */
-+	EM_CTL_SMB		= BIT(24), /* Single Message Buffer */
-+	EM_CTL_SGPIO		= BIT(19), /* SGPIO messages supported */
-+	EM_CTL_SES		= BIT(18), /* SES-2 messages supported */
-+	EM_CTL_SAFTE		= BIT(17), /* SAF-TE messages supported */
-+	EM_CTL_LED		= BIT(16), /* LED messages supported */
- 
- 	/* em message type */
--	EM_MSG_TYPE_LED		= (1 << 0), /* LED */
--	EM_MSG_TYPE_SAFTE	= (1 << 1), /* SAF-TE */
--	EM_MSG_TYPE_SES2	= (1 << 2), /* SES-2 */
--	EM_MSG_TYPE_SGPIO	= (1 << 3), /* SGPIO */
-+	EM_MSG_TYPE_LED		= BIT(0), /* LED */
-+	EM_MSG_TYPE_SAFTE	= BIT(1), /* SAF-TE */
-+	EM_MSG_TYPE_SES2	= BIT(2), /* SES-2 */
-+	EM_MSG_TYPE_SGPIO	= BIT(3), /* SGPIO */
- };
- 
- struct ahci_cmd_hdr {
--- 
-2.43.0
-
diff --git a/board/beagleboard/beaglebone/patches/linux/linux.hash b/board/beagleboard/beaglebone/patches/linux/linux.hash
index 72d5bfff98..4a7384d036 100644
--- a/board/beagleboard/beaglebone/patches/linux/linux.hash
+++ b/board/beagleboard/beaglebone/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  394523e61eabf24bf920981ba967799ff90b6099a72dc1d1b92c918433439f61  linux-4.19.94-ti-r72.tar.gz
+sha256  f1ae7325c6c146e0f852866a3bfd3f90ae1b5f46e414bc99a38384ed677e3721  linux-6.6.32-ti-arm32-r7.tar.gz
diff --git a/board/beagleboard/beaglebone/patches/uboot/uboot.hash b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
index 4b82872f31..fe9b4f53dc 100644
--- a/board/beagleboard/beaglebone/patches/uboot/uboot.hash
+++ b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0d438b1bb5cceb57a18ea2de4a0d51f7be5b05b98717df05938636e0aadfe11a  u-boot-2021.04.tar.bz2
+sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index b1a0c7cda4..8daf8d530a 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -3,8 +3,12 @@ BR2_arm=y
 BR2_cortex_a8=y
 BR2_ARM_FPU_VFPV3=y
 
-# Linux headers same as kernel, a 6.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+# Hashes
+BR2_GLOBAL_PATCH_DIR="board/beagleboard/beaglebone/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # System
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
@@ -17,21 +21,22 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beaglebone/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.1.80-ti-r34)/linux-6.1.80-ti-r34.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.6.32-ti-arm32-r7)/linux-6.6.32-ti-arm32-r7.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bb.org"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-wireless am335x-bonegreen-wireless"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am335x-evm ti/omap/am335x-bone ti/omap/am335x-boneblack ti/omap/am335x-bonegreen ti/omap/am335x-evmsk ti/omap/am335x-boneblue ti/omap/am335x-boneblack-wireless ti/omap/am335x-bonegreen-wireless"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="96M"
 
 # Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
