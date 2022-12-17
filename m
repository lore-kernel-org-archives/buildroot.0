Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C601C4332F
	for <buildroot@archiver.kernel.org>; Sat, 17 Dec 2022 05:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2841340575;
	Sat, 17 Dec 2022 05:14:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2841340575
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fem7lpZQiDXf; Sat, 17 Dec 2022 05:14:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E7944057A;
	Sat, 17 Dec 2022 05:14:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E7944057A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 228341BF844
 for <buildroot@lists.busybox.net>; Sat, 17 Dec 2022 05:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC9D260C08
 for <buildroot@lists.busybox.net>; Sat, 17 Dec 2022 05:13:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC9D260C08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UZDKpg0adfdP for <buildroot@lists.busybox.net>;
 Sat, 17 Dec 2022 05:13:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E273560C06
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E273560C06
 for <buildroot@buildroot.org>; Sat, 17 Dec 2022 05:13:42 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id ay32so4357265qtb.11
 for <buildroot@buildroot.org>; Fri, 16 Dec 2022 21:13:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BWutHGL40/hOKUw4jCXoKhfpYChNBkuEESsv6JP6BZo=;
 b=RHM1j53ef7KLlcIZ+3l5k5OVPfWFUggXli0w9MQG9RpRdu8e+tPUFjKe5LNaT4e9PK
 VILDa493DVZQLTu7AOavMtEug8qTcWPOEe0xQY0zC7Cl/tl8a2CuPYKrZlCcLU8YeXRU
 NvsXoy1pCvkBmgEnB/TnoPaqId3oykZcdgd4iVfUuN8IAbuNx5RTtg5mj5V89Y3bY6BJ
 vMfDR/m6Gs9g0Ffe2vm4ATMVGy2b23UxrX7M+Ml72m6fy1uGambCusapFjrTBNEWTroZ
 p3HdXWGdUGj0t1qiZG4J6VKQbEI4D9wijdbcTFjehLmqrGqhor2yU9p2rYHSy1tMtLxq
 neKA==
X-Gm-Message-State: AFqh2koy1xV0Sy9J7hkMggnf3O92FplFVPuIrHG1KdDfZUpRL7xJqJ1Y
 s24nfd8+MBYivU36bmOy/ujj3lHp7T8=
X-Google-Smtp-Source: AMrXdXtV4BjVf3prJuN7/j/KIxUALMv06c3BS6mV2jv1PS4B6R4cjvYPMcJJUNZYX3DqDhtQ/sZ4xw==
X-Received: by 2002:ac8:7188:0:b0:3a8:30f8:bc13 with SMTP id
 w8-20020ac87188000000b003a830f8bc13mr2589525qto.44.1671254021445; 
 Fri, 16 Dec 2022 21:13:41 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab
 (pool-108-26-182-112.bstnma.fios.verizon.net. [108.26.182.112])
 by smtp.gmail.com with ESMTPSA id
 q17-20020ac87351000000b003a7fef41526sm2448854qtp.77.2022.12.16.21.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 21:13:41 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 17 Dec 2022 00:13:35 -0500
Message-Id: <20221217051337.3778405-3-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221217051337.3778405-1-Mr.Bossman075@gmail.com>
References: <20221217051337.3778405-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BWutHGL40/hOKUw4jCXoKhfpYChNBkuEESsv6JP6BZo=;
 b=Zspin0jaiDntTxl6clwt0RfxUdxHMz/81pQ9b5Ma6z9nCROzf3hDOWmyJEavYSq+D3
 ydhvBcokf5TQNKtM+UHcm+0ZCpEc4wQjAYWCf+hDNAp72m1Ve+XS4RvIii4An+Oeyw52
 rS0MGFtrBARwffcUi1z0m2gENbF7E0Ln1xWXpU3JaJqvX+37BgV5qJ/W1LYDzNAU02vZ
 B+1AZwt5nOIR6v8YR/8NTUDcftdNGWMYPvBqnUEjSWtq0uQMEeA4Y9udNX5JmVfD0/aO
 rQFtauW6h175NBlTZuC8JYd2jmxByHpdmfQib+mXRL9tsrrUuaiNe8ZYVnGd2+XtEuu8
 AfpA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Zspin0ja
Subject: [Buildroot] [PATCH v2 2/4] package/uclibc: Add RISC-V 32-bit support
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
Cc: Mark Corbin <mark@dibsco.co.uk>, Jesse Taube <Mr.Bossman075@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Charles Lohr <lohr85@gmail.com>,
 Yimin Gu <ustcymgu@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yimin Gu <ustcymgu@gmail.com>

riscv32 can be built with or without MMU. This patch adds support for
building uClibc for riscv32. The patch is based on the
existing riscv64 support.

Signed-off-by: Yimin Gu <ustcymgu@gmail.com>
Cc: Jesse Taube <Mr.Bossman075@gmail.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 .../uclibc/0001-RISC-V-32-bit-support.patch   | 145 ++++++++++++++++++
 package/uclibc/Config.in                      |   2 +
 2 files changed, 147 insertions(+)
 create mode 100644 package/uclibc/0001-RISC-V-32-bit-support.patch

diff --git a/package/uclibc/0001-RISC-V-32-bit-support.patch b/package/uclibc/0001-RISC-V-32-bit-support.patch
new file mode 100644
index 0000000000..71fb401519
--- /dev/null
+++ b/package/uclibc/0001-RISC-V-32-bit-support.patch
@@ -0,0 +1,145 @@
+From 537b2ef6350fdf7604d59bc2a50388cb98045d7f Mon Sep 17 00:00:00 2001
+From: Yimin Gu <ustcymgu at gmail.com>
+Date: Mon, 1 Aug 2022 15:22:40 +0900
+Subject: [PATCH] uclibc: RISC-V 32-bit support
+
+Added 32-bit RISC-V support. With these changes, elf2flt patch
+6055525082d1, and kernel patch 700b2f0ce371, no MMU rv32 buildroot
+system can work without any noticable problem. 
+
+There's no substantial code change except definations and config
+options. 
+
+Signed-off-by: Yimin Gu <ustcymgu at gmail.com>
+---
+ Rules.mak                                  |  2 ++
+ extra/Configs/Config.in                    |  9 +++++++++
+ extra/Configs/Config.riscv32               | 14 ++++++++++++++
+ libc/sysdeps/linux/riscv32                 |  1 +
+ libc/sysdeps/linux/riscv64/bits/wordsize.h |  3 ++-
+ libc/sysdeps/linux/riscv64/sys/asm.h       |  6 +++++-
+ 6 files changed, 33 insertions(+), 2 deletions(-)
+ create mode 100644 extra/Configs/Config.riscv32
+ create mode 120000 libc/sysdeps/linux/riscv32
+
+diff --git a/Rules.mak b/Rules.mak
+index 3fb64c728..71a14fc38 100644
+--- a/Rules.mak
++++ b/Rules.mak
+@@ -305,6 +305,7 @@ ifneq ($(TARGET_ARCH),c6x)
+ ifneq ($(TARGET_ARCH),h8300)
+ ifneq ($(TARGET_ARCH),arc)
+ ifneq ($(TARGET_ARCH),aarch64)
++ifneq ($(TARGET_ARCH),riscv32)
+ CPU_CFLAGS-y += -msoft-float
+ endif
+ endif
+@@ -316,6 +317,7 @@ endif
+ endif
+ endif
+ endif
++endif
+ 
+ ifeq ($(TARGET_ARCH),aarch64)
+ CPU_CFLAGS-y += -ftls-model=initial-exec
+diff --git a/extra/Configs/Config.in b/extra/Configs/Config.in
+index a58ceb265..5e6af800d 100644
+--- a/extra/Configs/Config.in
++++ b/extra/Configs/Config.in
+@@ -39,6 +39,7 @@ choice
+ 	default TARGET_or1k if DESIRED_TARGET_ARCH = "or1k"
+ 	default TARGET_powerpc if DESIRED_TARGET_ARCH = "powerpc"
+ 	default TARGET_riscv64 if DESIRED_TARGET_ARCH = "riscv64"
++	default TARGET_riscv32 if DESIRED_TARGET_ARCH = "riscv32"
+ 	default TARGET_sh if DESIRED_TARGET_ARCH = "sh"
+ 	default TARGET_sparc if DESIRED_TARGET_ARCH = "sparc"
+ 	default TARGET_sparc64 if DESIRED_TARGET_ARCH = "sparc64"
+@@ -125,6 +126,9 @@ config TARGET_powerpc
+ config TARGET_riscv64
+ 	bool "riscv64"
+ 
++config TARGET_riscv32
++	bool "riscv32"
++
+ config TARGET_sh
+ 	bool "superh"
+ 
+@@ -240,6 +244,10 @@ if TARGET_riscv64
+ source "extra/Configs/Config.riscv64"
+ endif
+ 
++if TARGET_riscv32
++source "extra/Configs/Config.riscv32"
++endif
++
+ if TARGET_sh
+ source "extra/Configs/Config.sh"
+ endif
+@@ -538,6 +546,7 @@ config UCLIBC_HAS_LINUXTHREADS
+ 	select UCLIBC_HAS_REALTIME
+ 	depends on !TARGET_aarch64 && \
+ 		   !TARGET_riscv64 && \
++		   !TARGET_riscv32 && \
+ 		   !TARGET_metag
+ 	help
+ 	  If you want to compile uClibc with Linuxthreads support, then answer Y.
+diff --git a/extra/Configs/Config.riscv32 b/extra/Configs/Config.riscv32
+new file mode 100644
+index 000000000..304d30f70
+--- /dev/null
++++ b/extra/Configs/Config.riscv32
+@@ -0,0 +1,14 @@
++#
++# For a description of the syntax of this configuration file,
++# see extra/config/Kconfig-language.txt
++#
++
++config TARGET_ARCH
++	string
++	default "riscv32"
++
++config FORCE_OPTIONS_FOR_ARCH
++	bool
++	default y
++	select ARCH_LITTLE_ENDIAN
++	select ARCH_HAS_MMU
+diff --git a/libc/sysdeps/linux/riscv32 b/libc/sysdeps/linux/riscv32
+new file mode 120000
+index 000000000..11677ef05
+--- /dev/null
++++ b/libc/sysdeps/linux/riscv32
+@@ -0,0 +1 @@
++riscv64
+\ No newline at end of file
+diff --git a/libc/sysdeps/linux/riscv64/bits/wordsize.h b/libc/sysdeps/linux/riscv64/bits/wordsize.h
+index 67a16ba62..1fc649aad 100644
+--- a/libc/sysdeps/linux/riscv64/bits/wordsize.h
++++ b/libc/sysdeps/linux/riscv64/bits/wordsize.h
+@@ -25,5 +25,6 @@
+ #if __riscv_xlen == 64
+ # define __WORDSIZE_TIME64_COMPAT32 1
+ #else
+-# error "rv32i-based targets are not supported"
++# define __WORDSIZE_TIME64_COMPAT32 1
++// # warning "rv32i-based targets are experimental"
+ #endif
+diff --git a/libc/sysdeps/linux/riscv64/sys/asm.h b/libc/sysdeps/linux/riscv64/sys/asm.h
+index ddb84b683..3c94c9a70 100644
+--- a/libc/sysdeps/linux/riscv64/sys/asm.h
++++ b/libc/sysdeps/linux/riscv64/sys/asm.h
+@@ -26,7 +26,11 @@
+ # define REG_S sd
+ # define REG_L ld
+ #elif __riscv_xlen == 32
+-# error "rv32i-based targets are not supported"
++# define PTRLOG 2
++# define SZREG    4
++# define REG_S sw
++# define REG_L lw
++// # warning "rv32i-based targets are experimental"
+ #else
+ # error __riscv_xlen must equal 32 or 64
+ #endif
+-- 
+2.37.1
+
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 2555487f06..a1e9305ca0 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -17,6 +17,7 @@ config BR2_PACKAGE_UCLIBC_ARCH_SUPPORTS
 	default y if BR2_powerpc
 	# see libc/sysdeps/linux/riscv64/sys/asm.h
 	default y if BR2_RISCV_64 && (BR2_RISCV_ABI_LP64 || BR2_RISCV_ABI_LP64D)
+	default y if BR2_RISCV_32
 	default y if BR2_sh4
 	default y if BR2_sh4eb
 	default y if BR2_sparc
@@ -138,6 +139,7 @@ config BR2_UCLIBC_TARGET_ARCH
 	default "i386"	   if BR2_i386
 	default "x86_64"   if BR2_x86_64
 	default "riscv64"  if BR2_RISCV_64
+	default "riscv32"  if BR2_RISCV_32
 
 config BR2_UCLIBC_MIPS_ABI
 	string
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
