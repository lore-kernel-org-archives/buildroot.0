Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1132EEE4993
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 16:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D93360A97;
	Sun, 20 Aug 2023 16:30:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D93360A97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xxktu5TnS-Be; Sun, 20 Aug 2023 16:30:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0A3F60AA4;
	Sun, 20 Aug 2023 16:30:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0A3F60AA4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3EFBE1BF373
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 16:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 189EE8146C
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 16:30:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 189EE8146C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pvda6HZQ1pEg for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 16:30:33 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD24B8146A
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 16:30:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD24B8146A
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fee87dd251so7616815e9.2
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 09:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692549031; x=1693153831;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U2L7My/sTZ6V1IGMjm9484NH2KnwHHxCo3evXqtONdc=;
 b=W4JGFiCkhHaM/QFNr7elOuAwJbuojVqkpS29YfMWmLgFJZpLng9OA4g0dz0fGz80qr
 9h6BdHqmAg6xHzyf8Fuj8y0SUEJVtTd8voeLscWHixyDSsb1yF3n6xxzy9CFzH4REU7a
 tNq7Bg90EAhpyPx3MuP+Y0nq3HtCZ2qf5cS8ol6x/6CltLV0KBl7SiUIcYXVw3wOWKGL
 6vlXhfGFo9CUFn9+zkcffgFSBgIaBXEomG92QAQhMIrbP/oRNwh4KbdgLR4smUvwHhMU
 zsHH+GwOWt8L6v4k+QjCgAgDOocRzd+x3uIs5nm1An71KpQ1SZn7QxqOOf5yM6gswmx6
 tp6w==
X-Gm-Message-State: AOJu0Yyc2fjaRYg4/p8hV6KbQvaEPBqXi878crKQ1z+7vrh/+r3NfEaP
 ISlES9JBdMTAG3I4/nz0fHt3yPPUays=
X-Google-Smtp-Source: AGHT+IG/5WT8VLI3mGi7VmqsBDWai51Bux3NjZq3jXa7RBnVg4OzQL1XeP4drtwbliGB1V+n2SNpMQ==
X-Received: by 2002:a5d:4573:0:b0:315:ad1a:5abc with SMTP id
 a19-20020a5d4573000000b00315ad1a5abcmr3267406wrc.5.1692549030737; 
 Sun, 20 Aug 2023 09:30:30 -0700 (PDT)
Received: from localhost.localdomain ([2a01:cb19:8b44:b00:73e4:5f06:f514:c64d])
 by smtp.gmail.com with ESMTPSA id
 v26-20020a05600c215a00b003fbb618f7adsm9783964wml.15.2023.08.20.09.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Aug 2023 09:30:30 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 18:30:29 +0200
Message-Id: <20230820163029.2720609-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692549031; x=1693153831;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=U2L7My/sTZ6V1IGMjm9484NH2KnwHHxCo3evXqtONdc=;
 b=WfOS39FDOkgwcttW1hL1/ORezSevt+MNX6Z4fdFLqF5qEsJROBlWl2IjFi3gc2Rs99
 RI8146xFjdI+cyr8/Mo36akdny3bsf8/WHRpyq7DlmGzw/Xf/t7Rv5IQX1OQnBqTDhnJ
 aurSvbZkxcVGW5v6r2OWSMBXwntBjICBjKgkf8TxWeA6JRxR9JdFMmBgl5hBa4S4uRAF
 isbOJT/isU3HB0jVuLk0AoApIPeqLUa8fnzZFC8uBhD4XU6U7AiL3iGh4tkgJHcWn+X+
 aIM2AsyAUsJKpxl80ZsyosusoeBIQCZe2sIV/zyzOBE+0CmTsG9NguaqtnmCe0T9NtO/
 C5Uw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=WfOS39FD
Subject: [Buildroot] [PATCH] arch/powerpc: drop ABI selection
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since it was introduced in 5a6087d62e5c (toolchain: add powerpc SPE ABI
support), the CLASSIC vs. SPE choice for the ABI was never really a
choice: CPU without SPE could only use the CLASSIC ABI, while CPUs with
SPE could only use the SPE ABI.

Commit b4c824562bb1 (powerpc: add BR2_POWERPC_CPU_HAS_SPE to replace
adhoc deps/checks) added a blind option that CPUs with SPE would select
rather than duplicate the ad-hoc dependencies in both CLASSIC and SPE
ABI options. Since then, it was even more obvious that the ABI choice
was really not a choice, as the two options have mutually exclusive
conditions.

Drop the useless choice, and directly use the blind option as selected
by the specific CPUs.

We don't need legacy handling, because the situation fixes itself.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Joel Stanley <joel@jms.id.au>
---
 arch/Config.in.powerpc     | 15 ---------------
 package/Makefile.in        |  2 +-
 package/gcc/Config.in.host | 10 +++++-----
 package/gcc/gcc.mk         |  2 +-
 package/glibc/Config.in    |  2 +-
 package/musl/Config.in     |  2 +-
 6 files changed, 9 insertions(+), 24 deletions(-)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index d4e204a463..3f4d348d5f 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -146,21 +146,6 @@ config BR2_powerpc_power9
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 endchoice
 
-choice
-	prompt "Target ABI"
-	default BR2_powerpc_SPE if BR2_POWERPC_CPU_HAS_SPE
-	default BR2_powerpc_CLASSIC
-	help
-	  Application Binary Interface to use
-
-config BR2_powerpc_CLASSIC
-	bool "Classic"
-	depends on !BR2_POWERPC_CPU_HAS_SPE
-config BR2_powerpc_SPE
-	bool "SPE"
-	depends on BR2_POWERPC_CPU_HAS_SPE
-endchoice
-
 config BR2_POWERPC_SOFT_FLOAT
 	bool "Use soft-float"
 	select BR2_SOFT_FLOAT
diff --git a/package/Makefile.in b/package/Makefile.in
index d70aded82b..4953d2d418 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -76,7 +76,7 @@ endif
 endif
 
 # For FSL PowerPC there's SPE
-ifeq ($(BR2_powerpc_SPE),y)
+ifeq ($(BR2_POWERPC_CPU_HAS_SPE),y)
 ABI = spe
 # MPC8540s are e500v1 with single precision FP
 ifeq ($(BR2_powerpc_8540),y)
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 4f2e47b9ea..fd721088ec 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -4,7 +4,7 @@ choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_ARC if BR2_GCC_VERSION_4_8_ARC # legacy
 	default BR2_GCC_VERSION_ARC if BR2_arc
-	default BR2_GCC_VERSION_POWERPC_SPE if BR2_powerpc_SPE
+	default BR2_GCC_VERSION_POWERPC_SPE if BR2_POWERPC_CPU_HAS_SPE
 	default BR2_GCC_VERSION_12_X
 	help
 	  Select the version of gcc you wish to use.
@@ -19,7 +19,7 @@ config BR2_GCC_VERSION_POWERPC_SPE
 	bool "gcc powerpc spe"
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
-	depends on BR2_powerpc_SPE
+	depends on BR2_POWERPC_CPU_HAS_SPE
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_GCC_VERSION_11_X
@@ -27,7 +27,7 @@ config BR2_GCC_VERSION_11_X
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_12
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
-	depends on !BR2_powerpc_SPE
+	depends on !BR2_POWERPC_CPU_HAS_SPE
 	# ARC HS48 rel 31 only supported by gcc arc fork.
 	depends on !BR2_archs4x_rel31
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
@@ -37,7 +37,7 @@ config BR2_GCC_VERSION_12_X
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
-	depends on !BR2_powerpc_SPE
+	depends on !BR2_POWERPC_CPU_HAS_SPE
 	# ARC HS48 rel 31 only supported by gcc arc fork.
 	depends on !BR2_archs4x_rel31
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
@@ -46,7 +46,7 @@ config BR2_GCC_VERSION_13_X
 	bool "gcc 13.x"
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
-	depends on !BR2_powerpc_SPE
+	depends on !BR2_POWERPC_CPU_HAS_SPE
 	# ARC HS48 rel 31 only supported by gcc arc fork.
 	depends on !BR2_archs4x_rel31
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 1ecbf7e9b4..4929784f96 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -242,7 +242,7 @@ HOST_GCC_COMMON_CONF_OPTS += --with-mode=$(GCC_TARGET_MODE)
 endif
 
 # Enable proper double/long double for SPE ABI
-ifeq ($(BR2_powerpc_SPE),y)
+ifeq ($(BR2_POWERPC_CPU_HAS_SPE),y)
 HOST_GCC_COMMON_CONF_OPTS += \
 	--enable-obsolete \
 	--enable-e500_double \
diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 71c50504ac..d894507b89 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -21,7 +21,7 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	default y if BR2_microblaze
 	default y if BR2_nios2
 	default y if BR2_arc && BR2_ARC_ATOMIC_EXT
-	depends on !BR2_powerpc_SPE
+	depends on !BR2_POWERPC_CPU_HAS_SPE
 	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
 	depends on BR2_USE_MMU
 
diff --git a/package/musl/Config.in b/package/musl/Config.in
index 34ffe8324a..cfe08052e1 100644
--- a/package/musl/Config.in
+++ b/package/musl/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_MUSL_ARCH_SUPPORTS
 	default y if BR2_RISCV_64
 	default y if BR2_sh
 	default y if BR2_x86_64
-	depends on !BR2_powerpc_SPE # not supported, build breaks
+	depends on !BR2_POWERPC_CPU_HAS_SPE # not supported, build breaks
 	depends on !(BR2_powerpc64 || BR2_powerpc64le) || BR2_POWERPC_CPU_HAS_ALTIVEC
 	# sh2 nommu is supported by musl, but we don't have support
 	# for it in Buildroot.
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
