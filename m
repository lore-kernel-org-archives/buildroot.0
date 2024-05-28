Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B0CC25B78
	for <buildroot@archiver.kernel.org>; Tue, 28 May 2024 08:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55CD3401B7;
	Tue, 28 May 2024 08:10:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2-puRoqFpXLg; Tue, 28 May 2024 08:10:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 200D5401BF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 200D5401BF;
	Tue, 28 May 2024 08:10:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC7FE1BF2B7
 for <buildroot@lists.busybox.net>; Tue, 28 May 2024 08:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93BAE81A18
 for <buildroot@lists.busybox.net>; Tue, 28 May 2024 08:10:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bqMd_Xd-QPOQ for <buildroot@lists.busybox.net>;
 Tue, 28 May 2024 08:10:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8644981975
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8644981975
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8644981975
 for <buildroot@buildroot.org>; Tue, 28 May 2024 08:10:39 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4202ca70318so3818015e9.1
 for <buildroot@buildroot.org>; Tue, 28 May 2024 01:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716883837; x=1717488637;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y1TJXB1vxLYYDM2PEAVRizhryR99VaSLsrYjUWkygb4=;
 b=SKE9EMTmlRFrN82I8mObV43f/k+VqXukp5y/EwJBthO1IHlv8ert6ssX8W0wQcIVL5
 S7AzQuhCfX8KRweEGmHToTqHh68Pnc41CWBstCZW53vlRI5GB0rlex0Yc2YrT0h+YSAW
 cXbgoKF26x+XLaa02h4G4TbaD5nlNHkHZg5sOtzKTxZR1u5yp/vo2OsHd4EoYCrrMlAx
 k3n1pojSF4I9QgbXEbi4J0Wmau0N6FrfhQ7hiFaMlmmaAiBRJN/PRXXskpCq/GLdy5k2
 6BtMfGaFEmiFF5Qz+jQD0szeoJ7gObi4/kAAhZIlrabdvMoEqaY3JqslHsr1Iai2zCEr
 MnTA==
X-Gm-Message-State: AOJu0Ywu+chbEl/P/Sywxvv26XGb0b2j5LIBxDz1Jy/u1S1lTt1xUBSo
 zdp1I/AtUCZottdHpuVX/IIZV5pkDcli+izR61fK4lCv1m0i/yVDxRPXQ2LK/HzYnioxwjKqvki
 Y42s=
X-Google-Smtp-Source: AGHT+IGwK6n0fXdR4qbaTrt+BAn8Cp8MsxcZ0tCh8DAuqvok9lmt49xtI0KDz8pTTF6u7igiqByrDw==
X-Received: by 2002:a05:600c:3144:b0:41a:c592:64ff with SMTP id
 5b1f17b1804b1-421089f9787mr105844345e9.35.1716883837184; 
 Tue, 28 May 2024 01:10:37 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.42.226])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4210897bbd2sm134854995e9.21.2024.05.28.01.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 01:10:36 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 28 May 2024 10:10:25 +0200
Message-ID: <20240528081026.175912-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1716883837; x=1717488637;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y1TJXB1vxLYYDM2PEAVRizhryR99VaSLsrYjUWkygb4=;
 b=Siw7fybyjSzidiFzXR7QmIiXrdW4KOtd3oPy7iZGGgfSi8gPv4UhSya2ZXybQLLVUd
 8w0om58pQ/vLx/pBpyFsFeM0m5R5ZA2tAJGnEs0FWaaaCG8i6c8EAQxhnJmchItF8ct9
 FW9zhfpvGKajjAPzVEHDosMz1Qp2eG6w3maR4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Siw7fyby
Subject: [Buildroot] [PATCH 1/2] configs/lego_ev3_defconfig: fix Linux
 compilation error with binutils 2.41+
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, David Lechner <david@lechnology.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Linux kernel fails to build since commit e88225ed882 (package/binutils:
make 2.41 the default version).  This commit applies the backport patch of
upstream commit 790756c7e0229dedc83bf058ac69633045b1000e to the 4.19.y
stable kernel.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...ce-Sun-Solaris-style-flag-on-section.patch | 435 ++++++++++++++++++
 configs/lego_ev3_defconfig                    |   1 +
 2 files changed, 436 insertions(+)
 create mode 100644 board/lego/ev3/patches/linux/0001-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch

diff --git a/board/lego/ev3/patches/linux/0001-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch b/board/lego/ev3/patches/linux/0001-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch
new file mode 100644
index 000000000000..81c4ce2fbc16
--- /dev/null
+++ b/board/lego/ev3/patches/linux/0001-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch
@@ -0,0 +1,435 @@
+From 762d2dcd9e233e3025f8627ea65f23e568045edb Mon Sep 17 00:00:00 2001
+From: Nick Desaulniers <ndesaulniers@google.com>
+Date: Mon, 4 Nov 2019 19:31:45 +0100
+Subject: [PATCH] ARM: 8933/1: replace Sun/Solaris style flag on section
+ directive
+
+[ Upstream commit 790756c7e0229dedc83bf058ac69633045b1000e ]
+
+It looks like a section directive was using "Solaris style" to declare
+the section flags. Replace this with the GNU style so that Clang's
+integrated assembler can assemble this directive.
+
+The modified instances were identified via:
+$ ag \.section | grep #
+
+Link: https://ftp.gnu.org/old-gnu/Manuals/gas-2.9.1/html_chapter/as_7.html#SEC119
+Link: https://github.com/ClangBuiltLinux/linux/issues/744
+Link: https://bugs.llvm.org/show_bug.cgi?id=43759
+Link: https://reviews.llvm.org/D69296
+
+Acked-by: Nicolas Pitre <nico@fluxnic.net>
+Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
+Reviewed-by: Stefan Agner <stefan@agner.ch>
+Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
+Suggested-by: Fangrui Song <maskray@google.com>
+Suggested-by: Jian Cai <jiancai@google.com>
+Suggested-by: Peter Smith <peter.smith@linaro.org>
+Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
+Signed-off-by: Sasha Levin <sashal@kernel.org>
+Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=762d2dcd9e233e3025f8627ea65f23e568045edb
+---
+ arch/arm/boot/bootp/init.S            | 2 +-
+ arch/arm/boot/compressed/big-endian.S | 2 +-
+ arch/arm/boot/compressed/head.S       | 2 +-
+ arch/arm/boot/compressed/piggy.S      | 2 +-
+ arch/arm/mm/proc-arm1020.S            | 2 +-
+ arch/arm/mm/proc-arm1020e.S           | 2 +-
+ arch/arm/mm/proc-arm1022.S            | 2 +-
+ arch/arm/mm/proc-arm1026.S            | 2 +-
+ arch/arm/mm/proc-arm720.S             | 2 +-
+ arch/arm/mm/proc-arm740.S             | 2 +-
+ arch/arm/mm/proc-arm7tdmi.S           | 2 +-
+ arch/arm/mm/proc-arm920.S             | 2 +-
+ arch/arm/mm/proc-arm922.S             | 2 +-
+ arch/arm/mm/proc-arm925.S             | 2 +-
+ arch/arm/mm/proc-arm926.S             | 2 +-
+ arch/arm/mm/proc-arm940.S             | 2 +-
+ arch/arm/mm/proc-arm946.S             | 2 +-
+ arch/arm/mm/proc-arm9tdmi.S           | 2 +-
+ arch/arm/mm/proc-fa526.S              | 2 +-
+ arch/arm/mm/proc-feroceon.S           | 2 +-
+ arch/arm/mm/proc-mohawk.S             | 2 +-
+ arch/arm/mm/proc-sa110.S              | 2 +-
+ arch/arm/mm/proc-sa1100.S             | 2 +-
+ arch/arm/mm/proc-v6.S                 | 2 +-
+ arch/arm/mm/proc-v7.S                 | 2 +-
+ arch/arm/mm/proc-v7m.S                | 4 ++--
+ arch/arm/mm/proc-xsc3.S               | 2 +-
+ arch/arm/mm/proc-xscale.S             | 2 +-
+ 28 files changed, 29 insertions(+), 29 deletions(-)
+
+diff --git a/arch/arm/boot/bootp/init.S b/arch/arm/boot/bootp/init.S
+index 78b508075161..868eeeaaa46e 100644
+--- a/arch/arm/boot/bootp/init.S
++++ b/arch/arm/boot/bootp/init.S
+@@ -16,7 +16,7 @@
+  *  size immediately following the kernel, we could build this into
+  *  a binary blob, and concatenate the zImage using the cat command.
+  */
+-		.section .start,#alloc,#execinstr
++		.section .start, "ax"
+ 		.type	_start, #function
+ 		.globl	_start
+ 
+diff --git a/arch/arm/boot/compressed/big-endian.S b/arch/arm/boot/compressed/big-endian.S
+index 88e2a88d324b..0e092c36da2f 100644
+--- a/arch/arm/boot/compressed/big-endian.S
++++ b/arch/arm/boot/compressed/big-endian.S
+@@ -6,7 +6,7 @@
+  *  Author: Nicolas Pitre
+  */
+ 
+-	.section ".start", #alloc, #execinstr
++	.section ".start", "ax"
+ 
+ 	mrc	p15, 0, r0, c1, c0, 0	@ read control reg
+ 	orr	r0, r0, #(1 << 7)	@ enable big endian mode
+diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/compressed/head.S
+index 69e661f574a0..e4d1b3d0b7d9 100644
+--- a/arch/arm/boot/compressed/head.S
++++ b/arch/arm/boot/compressed/head.S
+@@ -114,7 +114,7 @@
+ #endif
+ 		.endm
+ 
+-		.section ".start", #alloc, #execinstr
++		.section ".start", "ax"
+ /*
+  * sort out different calling conventions
+  */
+diff --git a/arch/arm/boot/compressed/piggy.S b/arch/arm/boot/compressed/piggy.S
+index 0284f84dcf38..27577644ee72 100644
+--- a/arch/arm/boot/compressed/piggy.S
++++ b/arch/arm/boot/compressed/piggy.S
+@@ -1,5 +1,5 @@
+ /* SPDX-License-Identifier: GPL-2.0 */
+-	.section .piggydata,#alloc
++	.section .piggydata, "a"
+ 	.globl	input_data
+ input_data:
+ 	.incbin	"arch/arm/boot/compressed/piggy_data"
+diff --git a/arch/arm/mm/proc-arm1020.S b/arch/arm/mm/proc-arm1020.S
+index 774ef1323554..4773490177c9 100644
+--- a/arch/arm/mm/proc-arm1020.S
++++ b/arch/arm/mm/proc-arm1020.S
+@@ -505,7 +505,7 @@ cpu_arm1020_name:
+ 
+ 	.align
+ 
+-	.section ".proc.info.init", #alloc
++	.section ".proc.info.init", "a"
+ 
+ 	.type	__arm1020_proc_info,#object
+ __arm1020_proc_info:
+diff --git a/arch/arm/mm/proc-arm1020e.S b/arch/arm/mm/proc-arm1020e.S
+index ae3c27b71594..928e8ca58f40 100644
+--- a/arch/arm/mm/proc-arm1020e.S
++++ b/arch/arm/mm/proc-arm1020e.S
+@@ -463,7 +463,7 @@ arm1020e_crval:
+ 
+ 	.align
+ 
+-	.section ".proc.info.init", #alloc
++	.section ".proc.info.init", "a"
+ 
+ 	.type	__arm1020e_proc_info,#object
+ __arm1020e_proc_info:
+diff --git a/arch/arm/mm/proc-arm1022.S b/arch/arm/mm/proc-arm1022.S
+index dbb2413fe04d..385584c3d222 100644
+--- a/arch/arm/mm/proc-arm1022.S
++++ b/arch/arm/mm/proc-arm1022.S
+@@ -448,7 +448,7 @@ arm1022_crval:
+ 
+ 	.align
+ 
+-	.section ".proc.info.init", #alloc
++	.section ".proc.info.init", "a"
+ 
+ 	.type	__arm1022_proc_info,#object
+ __arm1022_proc_info:
+diff --git a/arch/arm/mm/proc-arm1026.S b/arch/arm/mm/proc-arm1026.S
+index 0b37b2cef9d3..29cc81857373 100644
+--- a/arch/arm/mm/proc-arm1026.S
++++ b/arch/arm/mm/proc-arm1026.S
+@@ -442,7 +442,7 @@ arm1026_crval:
+ 	string	cpu_arm1026_name, "ARM1026EJ-S"
+ 	.align
+ 
+-	.section ".proc.info.init", #alloc
++	.section ".proc.info.init", "a"
+ 
+ 	.type	__arm1026_proc_info,#object
+ __arm1026_proc_info:
+diff --git a/arch/arm/mm/proc-arm720.S b/arch/arm/mm/proc-arm720.S
+index 3651cd70e418..c08cd1b0a1d0 100644
+--- a/arch/arm/mm/proc-arm720.S
++++ b/arch/arm/mm/proc-arm720.S
+@@ -186,7 +186,7 @@ arm720_crval:
+  * See <asm/procinfo.h> for a definition of this structure.
+  */
+ 	
+-		.section ".proc.info.init", #alloc
++		.section ".proc.info.init", "a"
+ 
+ .macro arm720_proc_info name:req, cpu_val:req, cpu_mask:req, cpu_name:req, cpu_flush:req
+ 		.type	__\name\()_proc_info,#object
+diff --git a/arch/arm/mm/proc-arm740.S b/arch/arm/mm/proc-arm740.S
+index 024fb7732407..6eed87103b95 100644
+--- a/arch/arm/mm/proc-arm740.S
++++ b/arch/arm/mm/proc-arm740.S
+@@ -132,7 +132,7 @@ __arm740_setup:
+ 
+ 	.align
+ 
+-	.section ".proc.info.init", #alloc
++	.section ".proc.info.init", "a"
+ 	.type	__arm740_proc_info,#object
+ __arm740_proc_info:
+ 	.long	0x41807400
+diff --git a/arch/arm/mm/proc-arm7tdmi.S b/arch/arm/mm/proc-arm7tdmi.S
+index 25472d94426d..beb64a7ccb38 100644
+--- a/arch/arm/mm/proc-arm7tdmi.S
++++ b/arch/arm/mm/proc-arm7tdmi.S
+@@ -76,7 +76,7 @@ __arm7tdmi_setup:
+ 
+ 		.align
+ 
+-		.section ".proc.info.init", #alloc
++		.section ".proc.info.init", "a"
+ 
+ .macro arm7tdmi_proc_info name:req, cpu_val:req, cpu_mask:req, cpu_name:req, \
+ 	extra_hwcaps=0
+diff --git a/arch/arm/mm/proc-arm920.S b/arch/arm/mm/proc-arm920.S
+index 7a14bd4414c9..5d4319708362 100644
+--- a/arch/arm/mm/proc-arm920.S
++++ b/arch/arm/mm/proc-arm920.S
+@@ -448,7 +448,7 @@ arm920_crval:
+ 
+ 	.align
+ 
+-	.section ".proc.info.init", #alloc
++	.section ".proc.info.init", "a"
+ 
+ 	.type	__arm920_proc_info,#object
+ __arm920_proc_info:
+diff --git a/arch/arm/mm/proc-arm922.S b/arch/arm/mm/proc-arm922.S
+index edccfcdcd551..7e22ca780b36 100644
+--- a/arch/arm/mm/proc-arm922.S
++++ b/arch/arm/mm/proc-arm922.S
+@@ -426,7 +426,7 @@ arm922_crval:
+ 
+ 	.align
+ 
+-	.section ".proc.info.init", #alloc
++	.section ".proc.info.init", "a"
+ 
+ 	.type	__arm922_proc_info,#object
+ __arm922_proc_info:
+diff --git a/arch/arm/mm/proc-arm925.S b/arch/arm/mm/proc-arm925.S
+index 32a47cc19076..d343e77b8456 100644
+--- a/arch/arm/mm/proc-arm925.S
++++ b/arch/arm/mm/proc-arm925.S
+@@ -491,7 +491,7 @@ arm925_crval:
+ 
+ 	.align
+ 
+-	.section ".proc.info.init", #alloc
++	.section ".proc.info.init", "a"
+ 
+ .macro arm925_proc_info name:req, cpu_val:req, cpu_mask:req, cpu_name:req, cache
+ 	.type	__\name\()_proc_info,#object
+diff --git a/arch/arm/mm/proc-arm926.S b/arch/arm/mm/proc-arm926.S
+index fb827c633693..8cf78c608c42 100644
+--- a/arch/arm/mm/proc-arm926.S
++++ b/arch/arm/mm/proc-arm926.S
+@@ -474,7 +474,7 @@ arm926_crval:
+ 
+ 	.align
+ 
+-	.section ".proc.info.init", #alloc
++	.section ".proc.info.init", "a"
+ 
+ 	.type	__arm926_proc_info,#object
+ __arm926_proc_info:
+diff --git a/arch/arm/mm/proc-arm940.S b/arch/arm/mm/proc-arm940.S
+index ee5b66f847c4..631ae64eeccd 100644
+--- a/arch/arm/mm/proc-arm940.S
++++ b/arch/arm/mm/proc-arm940.S
+@@ -344,7 +344,7 @@ __arm940_setup:
+ 
+ 	.align
+ 
+-	.section ".proc.info.init", #alloc
++	.section ".proc.info.init", "a"
+ 
+ 	.type	__arm940_proc_info,#object
+ __arm940_proc_info:
+diff --git a/arch/arm/mm/proc-arm946.S b/arch/arm/mm/proc-arm946.S
+index 7361837edc31..033ad7402d67 100644
+--- a/arch/arm/mm/proc-arm946.S
++++ b/arch/arm/mm/proc-arm946.S
+@@ -399,7 +399,7 @@ __arm946_setup:
+ 
+ 	.align
+ 
+-	.section ".proc.info.init", #alloc
++	.section ".proc.info.init", "a"
+ 	.type	__arm946_proc_info,#object
+ __arm946_proc_info:
+ 	.long	0x41009460
+diff --git a/arch/arm/mm/proc-arm9tdmi.S b/arch/arm/mm/proc-arm9tdmi.S
+index 7fac8c612134..2195468ccd76 100644
+--- a/arch/arm/mm/proc-arm9tdmi.S
++++ b/arch/arm/mm/proc-arm9tdmi.S
+@@ -70,7 +70,7 @@ __arm9tdmi_setup:
+ 
+ 		.align
+ 
+-		.section ".proc.info.init", #alloc
++		.section ".proc.info.init", "a"
+ 
+ .macro arm9tdmi_proc_info name:req, cpu_val:req, cpu_mask:req, cpu_name:req
+ 		.type	__\name\()_proc_info, #object
+diff --git a/arch/arm/mm/proc-fa526.S b/arch/arm/mm/proc-fa526.S
+index 4001b73af4ee..fd3e5dd94e59 100644
+--- a/arch/arm/mm/proc-fa526.S
++++ b/arch/arm/mm/proc-fa526.S
+@@ -190,7 +190,7 @@ fa526_cr1_set:
+ 
+ 	.align
+ 
+-	.section ".proc.info.init", #alloc
++	.section ".proc.info.init", "a"
+ 
+ 	.type	__fa526_proc_info,#object
+ __fa526_proc_info:
+diff --git a/arch/arm/mm/proc-feroceon.S b/arch/arm/mm/proc-feroceon.S
+index 92e08bf37aad..685d324a74d3 100644
+--- a/arch/arm/mm/proc-feroceon.S
++++ b/arch/arm/mm/proc-feroceon.S
+@@ -584,7 +584,7 @@ feroceon_crval:
+ 
+ 	.align
+ 
+-	.section ".proc.info.init", #alloc
++	.section ".proc.info.init", "a"
+ 
+ .macro feroceon_proc_info name:req, cpu_val:req, cpu_mask:req, cpu_name:req, cache:req
+ 	.type	__\name\()_proc_info,#object
+diff --git a/arch/arm/mm/proc-mohawk.S b/arch/arm/mm/proc-mohawk.S
+index 6f07d2ef4ff2..9182321a586a 100644
+--- a/arch/arm/mm/proc-mohawk.S
++++ b/arch/arm/mm/proc-mohawk.S
+@@ -429,7 +429,7 @@ mohawk_crval:
+ 
+ 	.align
+ 
+-	.section ".proc.info.init", #alloc
++	.section ".proc.info.init", "a"
+ 
+ 	.type	__88sv331x_proc_info,#object
+ __88sv331x_proc_info:
+diff --git a/arch/arm/mm/proc-sa110.S b/arch/arm/mm/proc-sa110.S
+index ee2ce496239f..093ad2ceff28 100644
+--- a/arch/arm/mm/proc-sa110.S
++++ b/arch/arm/mm/proc-sa110.S
+@@ -199,7 +199,7 @@ sa110_crval:
+ 
+ 	.align
+ 
+-	.section ".proc.info.init", #alloc
++	.section ".proc.info.init", "a"
+ 
+ 	.type	__sa110_proc_info,#object
+ __sa110_proc_info:
+diff --git a/arch/arm/mm/proc-sa1100.S b/arch/arm/mm/proc-sa1100.S
+index 222d5836f666..12b8fcab4b59 100644
+--- a/arch/arm/mm/proc-sa1100.S
++++ b/arch/arm/mm/proc-sa1100.S
+@@ -242,7 +242,7 @@ sa1100_crval:
+ 
+ 	.align
+ 
+-	.section ".proc.info.init", #alloc
++	.section ".proc.info.init", "a"
+ 
+ .macro sa1100_proc_info name:req, cpu_val:req, cpu_mask:req, cpu_name:req
+ 	.type	__\name\()_proc_info,#object
+diff --git a/arch/arm/mm/proc-v6.S b/arch/arm/mm/proc-v6.S
+index 06d890a2342b..32f4df0915ef 100644
+--- a/arch/arm/mm/proc-v6.S
++++ b/arch/arm/mm/proc-v6.S
+@@ -264,7 +264,7 @@ v6_crval:
+ 	string	cpu_elf_name, "v6"
+ 	.align
+ 
+-	.section ".proc.info.init", #alloc
++	.section ".proc.info.init", "a"
+ 
+ 	/*
+ 	 * Match any ARMv6 processor core.
+diff --git a/arch/arm/mm/proc-v7.S b/arch/arm/mm/proc-v7.S
+index 339eb17c9808..e351d682c2e3 100644
+--- a/arch/arm/mm/proc-v7.S
++++ b/arch/arm/mm/proc-v7.S
+@@ -637,7 +637,7 @@ __v7_setup_stack:
+ 	string	cpu_elf_name, "v7"
+ 	.align
+ 
+-	.section ".proc.info.init", #alloc
++	.section ".proc.info.init", "a"
+ 
+ 	/*
+ 	 * Standard v7 proc info content
+diff --git a/arch/arm/mm/proc-v7m.S b/arch/arm/mm/proc-v7m.S
+index 9c2978c128d9..0be14b64879c 100644
+--- a/arch/arm/mm/proc-v7m.S
++++ b/arch/arm/mm/proc-v7m.S
+@@ -96,7 +96,7 @@ ENTRY(cpu_cm7_proc_fin)
+ 	ret	lr
+ ENDPROC(cpu_cm7_proc_fin)
+ 
+-	.section ".init.text", #alloc, #execinstr
++	.section ".init.text", "ax"
+ 
+ __v7m_cm7_setup:
+ 	mov	r8, #(V7M_SCB_CCR_DC | V7M_SCB_CCR_IC| V7M_SCB_CCR_BP)
+@@ -180,7 +180,7 @@ ENDPROC(__v7m_setup)
+ 	string cpu_elf_name "v7m"
+ 	string cpu_v7m_name "ARMv7-M"
+ 
+-	.section ".proc.info.init", #alloc
++	.section ".proc.info.init", "a"
+ 
+ .macro __v7m_proc name, initfunc, cache_fns = nop_cache_fns, hwcaps = 0,  proc_fns = v7m_processor_functions
+ 	.long	0			/* proc_info_list.__cpu_mm_mmu_flags */
+diff --git a/arch/arm/mm/proc-xsc3.S b/arch/arm/mm/proc-xsc3.S
+index 293dcc2c441f..da96e4de1353 100644
+--- a/arch/arm/mm/proc-xsc3.S
++++ b/arch/arm/mm/proc-xsc3.S
+@@ -499,7 +499,7 @@ xsc3_crval:
+ 
+ 	.align
+ 
+-	.section ".proc.info.init", #alloc
++	.section ".proc.info.init", "a"
+ 
+ .macro xsc3_proc_info name:req, cpu_val:req, cpu_mask:req
+ 	.type	__\name\()_proc_info,#object
+diff --git a/arch/arm/mm/proc-xscale.S b/arch/arm/mm/proc-xscale.S
+index 3d75b7972fd1..c7800c69921b 100644
+--- a/arch/arm/mm/proc-xscale.S
++++ b/arch/arm/mm/proc-xscale.S
+@@ -613,7 +613,7 @@ xscale_crval:
+ 
+ 	.align
+ 
+-	.section ".proc.info.init", #alloc
++	.section ".proc.info.init", "a"
+ 
+ .macro xscale_proc_info name:req, cpu_val:req, cpu_mask:req, cpu_name:req, cache
+ 	.type	__\name\()_proc_info,#object
+-- 
+2.43.0
+
diff --git a/configs/lego_ev3_defconfig b/configs/lego_ev3_defconfig
index 1ce2817d4243..656222c69f6f 100644
--- a/configs/lego_ev3_defconfig
+++ b/configs/lego_ev3_defconfig
@@ -5,6 +5,7 @@ BR2_arm926t=y
 # system
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
+BR2_GLOBAL_PATCH_DIR="board/lego/ev3/patches"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/lego/ev3/post-image.sh"
 # Linux headers same as kernel, a 4.19 series
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
