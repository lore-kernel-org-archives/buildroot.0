Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BDFCA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 11:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B331600B3;
	Fri, 29 Aug 2025 11:28:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RmIohvDs50Eb; Fri, 29 Aug 2025 11:28:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07B8B61580
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07B8B61580;
	Fri, 29 Aug 2025 11:28:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F64DD2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11046418F1
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:28:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yxlXVIA4LF78 for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 11:28:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::442; helo=mail-wr1-x442.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A593B418EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A593B418EB
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A593B418EB
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:28:43 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-3ceb830dd58so702827f8f.0
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 04:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756466921; x=1757071721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lREexEJ7NlRZtkDGIr+af6eY21brrK0PpUVrEsYa7Fo=;
 b=AjtV99+vOwoQCmNTPV0sDYwys7MW4c1dSISlUzSrsnV0T+1wf2q5vJFv7TEBW3cm6R
 JFzOInluzfAXjEVBLxxjv9pSbsb12oXA11WZcygO9o/mlptz0GTmEdAe/ldxDDZ+TM0S
 wMIM/j63jtZS5ZiCwV6meZCpIUTxnL+WLG4nHQr+9U9dzrcbNzPj75LnI0qQjEfx2zrs
 Ge5TL23obckHuNfXpSxvV0ANv5sk/9uSoeuNf+SPQVcAovEQ3Xnvr8uHXtjepjPIuXua
 Gbiuogiiryh/nT7oynh2NMM8DjpIhkyY+uIjZ0tpEey6U0z3tu0IwJGQQ2ZS3d9pI0yS
 AXtA==
X-Gm-Message-State: AOJu0YylmCQP3yTJ/QhyiSM1U9zXfmgMw+FMIQMbi0JImcTT1D0hrmwy
 S4XelgYYOEu+q//wUBBoU3MEMtJkC3LeluZWVND2pcdfS93+905mpYLY1lbWhTt2nbztPlrBDTw
 CY4TZI4wHQiVt8vw=
X-Gm-Gg: ASbGncu3BXtxM8DH9Gbl8ik4Xc/rupO/n0FYuj61fl1Ev0coekIjCgDQd39s5LCc2ke
 PCR73f2mVsfvsspZXCHCUJjzK7QSOblbIwE7p3PcyMENgZagIyY4nlD2kfhJtnH6MEVLySG4tnf
 l0y5MFAgTUexXKyGFdShWIScltM6PgMevQf3tK4Qsw5q1B45xVY23tSAcGzcY8QQeyfnbnHyo8l
 /5DgVouPpJRB47q62ekvV8pZcPXyUaL41MVUZVQa2r1gq2PNp/At23EBWGupIU5xvgLiknUvAp5
 cshIm/bKOfJ84plmwZwdm5nPok4JnwpV7CkjLnV0BmEiKrLKemOIADXzM1+bxxiNw30P6mTUUlb
 xGB0STsPyiJUVa34LoPuaIIywnHWAVlyNB9Dg7dj+VlgXDmSGbZ3CNKLn7L02Al4z+gb01YXCGs
 6FZMCsITzegkXsNqQT
X-Google-Smtp-Source: AGHT+IEgDDKoHFGwXkt/vBVv3xcMDS+WWBNGb8sfBvblTJB8dIa/dGbrlHzgrHMHZYaU9XSvXTxlHQ==
X-Received: by 2002:a05:6000:4313:b0:3c8:6a4e:bfdb with SMTP id
 ffacd0b85a97d-3cbb15cc237mr8691101f8f.20.1756466921426; 
 Fri, 29 Aug 2025 04:28:41 -0700 (PDT)
Received: from dragon.local.ess-mail.com (31-207-9-44.static.ef-service.nl.
 [31.207.9.44]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7e887fdcsm34794685e9.13.2025.08.29.04.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 04:28:41 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 13:28:14 +0200
Message-ID: <20250829112818.129101-2-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829112818.129101-1-titouan.christophe@mind.be>
References: <20250829112818.129101-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756466921; x=1757071721; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lREexEJ7NlRZtkDGIr+af6eY21brrK0PpUVrEsYa7Fo=;
 b=dp31aV+HfLF6YxtaZwZsVnOhRYlTxsaAuBk8jaYfUNU/z8O/5PMWx7bUT+p8JAvs95
 de2LnV9EKJj+IiRl9UeS/h0SJL9bcfCTftRjGbWzc1mrnIXacFZM3m5jkj66/xFC7JqE
 V5MlxpWgEL9Iwf8Eb7OWXpZjoyVs7SjSknoycldxSFJTmNhteyeW5+Mt/OoMC2HYsm9X
 3RL8q++m4e1a+yQq0oJ3PdiDXiHByK5zzFn3uhpKJ546qGY0AkeuJ9Uk89PNC7i2d3ll
 BvwmZ3hn3EA3zsyMS3sZFtSZ7+5Jl0fy5/nkK0ZcH+SGdTrDMjhSDVfdM0mBCQIcfOoG
 d4fw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dp31aV+H
Subject: [Buildroot] [PATCH 1/5] toolchain/external: remove Sourcery
 Codebench MIPS toolchain
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This toollchain is almost 10 years old now, and not maintained anymore.
Let's therefore remove it from Buildroot. Newer maintained external
toolchains for MIPS are still available from Bootlin

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 Config.in.legacy                              |  7 ++
 package/efibootmgr/Config.in                  |  2 -
 package/efivar/Config.in                      |  2 -
 package/fluidsynth/Config.in                  |  4 -
 package/mokutil/Config.in                     |  1 -
 package/sedutil/Config.in                     |  2 -
 .../autobuild/sourcery-mips.config            |  4 -
 .../autobuild/sourcery-mips64.config          |  5 -
 .../autobuild/toolchain-configs.csv           |  2 -
 toolchain/toolchain-external/Config.in        |  6 --
 .../Config.in                                 | 94 -------------------
 .../Config.in.options                         |  9 --
 .../toolchain-external-codesourcery-mips.hash |  3 -
 .../toolchain-external-codesourcery-mips.mk   | 13 ---
 14 files changed, 7 insertions(+), 147 deletions(-)
 delete mode 100644 support/config-fragments/autobuild/sourcery-mips.config
 delete mode 100644 support/config-fragments/autobuild/sourcery-mips64.config
 delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in
 delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in.options
 delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.hash
 delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index f761c9063a..b356c71fbe 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
+	bool "Sourcery CodeBench MIPS external toolchain is deprecated"
+	select BR2_LEGACY
+	help
+	  Sourcery CodeBench MIPS 2016.05 is no longer maintained
+	  and has been removed from Buildroot.
+
 config BR2_PACKAGE_THTTPD
 	bool "thttpd has been removed"
 	select BR2_LEGACY
diff --git a/package/efibootmgr/Config.in b/package/efibootmgr/Config.in
index 5800e6c143..d07c9345d1 100644
--- a/package/efibootmgr/Config.in
+++ b/package/efibootmgr/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_EFIBOOTMGR
 	depends on BR2_TOOLCHAIN_HAS_THREADS # efivar
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # efivar
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # efivar
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	select BR2_PACKAGE_EFIVAR
 	select BR2_PACKAGE_POPT
 	help
@@ -21,4 +20,3 @@ comment "efibootmgr needs a toolchain w/ dynamic library, threads, headers >= 3.
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
diff --git a/package/efivar/Config.in b/package/efivar/Config.in
index 0a36335c0a..7764592b65 100644
--- a/package/efivar/Config.in
+++ b/package/efivar/Config.in
@@ -17,7 +17,6 @@ config BR2_PACKAGE_EFIVAR
 	# don't have that header file renamed, and that is causing build
 	# failures. So, prevent this package to be built using those
 	# toolchains.
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	help
 	  Tools and libraries to manipulate EFI variables
@@ -29,4 +28,3 @@ comment "efivar needs a toolchain w/ dynamic library, threads, headers >= 3.12,
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
diff --git a/package/fluidsynth/Config.in b/package/fluidsynth/Config.in
index 376419ce8f..7c33991314 100644
--- a/package/fluidsynth/Config.in
+++ b/package/fluidsynth/Config.in
@@ -38,7 +38,6 @@ comment "alsa support needs a toolchain w/ threads"
 config BR2_PACKAGE_FLUIDSYNTH_JACK2
 	bool "jack2"
 	# See: https://sourceware.org/bugzilla/show_bug.cgi?id=19908
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # jack2
 	depends on BR2_USE_MMU # jack2
 	depends on BR2_INSTALL_LIBSTDCPP # jack2
@@ -51,7 +50,6 @@ config BR2_PACKAGE_FLUIDSYNTH_JACK2
 comment "jack support needs a toolchain w/ dynamic library, threads, C++"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS
 
@@ -74,7 +72,6 @@ comment "portaudio support needs a toolchain w/ threads"
 config BR2_PACKAGE_FLUIDSYNTH_PULSEAUDIO
 	bool "pulseaudio"
 	# See: https://sourceware.org/bugzilla/show_bug.cgi?id=19908
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	depends on BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC # pulseaudio
 	depends on BR2_USE_WCHAR # pulseaudio
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
@@ -86,7 +83,6 @@ config BR2_PACKAGE_FLUIDSYNTH_PULSEAUDIO
 
 comment "pulseaudio support needs a toolchain w/ dynamic library, wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	depends on BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC
 	depends on BR2_STATIC_LIBS || !BR2_USE_MMU || !BR2_TOOLCHAIN_HAS_THREADS
 
diff --git a/package/mokutil/Config.in b/package/mokutil/Config.in
index 33208ac583..3412b2d29e 100644
--- a/package/mokutil/Config.in
+++ b/package/mokutil/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_MOKUTIL
 	depends on BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # keyutils
 	depends on !BR2_STATIC_LIBS # efivar, keyutils
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS # efivar
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # efivar
 	depends on BR2_TOOLCHAIN_HAS_THREADS # efivar
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # efivar
diff --git a/package/sedutil/Config.in b/package/sedutil/Config.in
index 1fbb870c05..95cdd26e84 100644
--- a/package/sedutil/Config.in
+++ b/package/sedutil/Config.in
@@ -12,7 +12,6 @@ config BR2_PACKAGE_SEDUTIL
 	depends on BR2_PACKAGE_SEDUTIL_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # linux/nvme.h
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS # 4.4.1 headers
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  The Drive Trust Alliance Self Encrypting Drive Utility,
@@ -23,7 +22,6 @@ config BR2_PACKAGE_SEDUTIL
 
 comment "sedutil needs a toolchain w/ C++, gcc >= 4.8, headers >= 3.12"
 	depends on BR2_PACKAGE_SEDUTIL_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
diff --git a/support/config-fragments/autobuild/sourcery-mips.config b/support/config-fragments/autobuild/sourcery-mips.config
deleted file mode 100644
index 103e20bfc2..0000000000
--- a/support/config-fragments/autobuild/sourcery-mips.config
+++ /dev/null
@@ -1,4 +0,0 @@
-BR2_mips=y
-BR2_mips_32r2=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS=y
diff --git a/support/config-fragments/autobuild/sourcery-mips64.config b/support/config-fragments/autobuild/sourcery-mips64.config
deleted file mode 100644
index 77e3a853e1..0000000000
--- a/support/config-fragments/autobuild/sourcery-mips64.config
+++ /dev/null
@@ -1,5 +0,0 @@
-BR2_mips64el=y
-BR2_mips_64r2=y
-BR2_MIPS_NABI64=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index d0002375d6..a2fba3a2cc 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -64,5 +64,3 @@ support/config-fragments/autobuild/br-xtensa-full-internal.config,any
 support/config-fragments/autobuild/linaro-aarch64.config,x86
 support/config-fragments/autobuild/linaro-aarch64-be.config,x86
 support/config-fragments/autobuild/linaro-arm.config,x86
-support/config-fragments/autobuild/sourcery-mips64.config,x86
-support/config-fragments/autobuild/sourcery-mips.config,x86
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index e91aa16326..6e66fb63f1 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -26,9 +26,6 @@ source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in"
 # ARM big-endian
 source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in"
 
-# MIPS
-source "toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in"
-
 # Bootlin toolchains, available for virtually all architectures
 source "toolchain/toolchain-external/toolchain-external-bootlin/Config.in"
 
@@ -123,9 +120,6 @@ source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.opt
 # ARM big-endian
 source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.options"
 
-# MIPS
-source "toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in.options"
-
 # Bootlin toolchains
 source "toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options"
 
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in
deleted file mode 100644
index 8e067c8ffb..0000000000
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in
+++ /dev/null
@@ -1,94 +0,0 @@
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
-	bool "Sourcery CodeBench MIPS 2016.05"
-	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
-	depends on BR2_MIPS_CPU_MIPS32R2 || BR2_MIPS_CPU_MIPS64R2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_6
-	# Unsupported MIPS cores
-	depends on !BR2_mips_interaptiv
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_MIPS_NABI32
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_TOOLCHAIN_HAS_OPENMP
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
-	help
-	  Sourcery CodeBench toolchain for the MIPS architecture, from
-	  Mentor Graphics. It uses gcc 5.3, binutils 2.25.51, glibc
-	  2.23, uClibc 0.9.30 and gdb 7.10.50, kernel headers 4.4.1. It
-	  has support for the following variants:
-	    - MIPS32r2 - Big-Endian, 2008 NaN, O32
-	      Select MIPS (big endian) core
-	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mnan=2008
-	    - MIPS32r2 - Big-Endian, O32
-	      Select MIPS (big endian) core
-	      Disable BR2_SOFT_FLOAT
-	    - MIPS32r2 - Big-Endian, O32, MIPS16
-	      Select MIPS (big endian) core
-	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32r2 - Big-Endian, Soft-Float, O32
-	      Select MIPS (big endian) core
-	      Select BR2_SOFT_FLOAT
-	    - MIPS32r2 - Big-Endian, Soft-Float, O32, MIPS16
-	      Select MIPS (big endian) core
-	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32r2 - Little-Endian, 2008 NaN, O32
-	      Select MIPS (little endian) core
-	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mnan=2008
-	    - MIPS32r2 - Little-Endian, O32
-	      Select MIPS (little endian) core
-	      Disable BR2_SOFT_FLOAT
-	    - MIPS32r2 - Little-Endian, O32, MIPS16
-	      Select MIPS (little endian) core
-	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32r2 - Little-Endian, Soft-Float, O32
-	      Select MIPS (little endian) core
-	      Select BR2_SOFT_FLOAT
-	    - MIPS32r2 - Little-Endian, Soft-Float, O32, MIPS16
-	      Select MIPS (little endian) core
-	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32r2 - Little-Endian, Soft-Float, O32, microMIPS
-	      Select MIPS (little endian) core
-	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mmicromips
-	    - MIPS32r2 - uClibc, Big-Endian, 2008 NaN, O32
-	      Not usable in Buildroot yet.
-	    - MIPS32r2 - uClibc, Big-Endian, O32
-	      Not usable in Buildroot yet.
-	    - MIPS32r2 - uClibc, Big-Endian, Soft-Float, O32
-	      Not usable in Buildroot yet.
-	    - MIPS32r2 - uClibc, Little-Endian, 2008 NaN, O32
-	      Not usable in Buildroot yet.
-	    - MIPS32r2 - uClibc, Little-Endian, O32
-	      Not usable in Buildroot yet.
-	    - MIPS32r2 - uClibc, Little-Endian, Soft-Float, O32
-	      Not usable in Buildroot yet.
-	    - MIPS64r2 - Big-Endian, N64
-	      Select MIPS64 (big endian) core
-	      Select the n64 ABI
-	      Disable BR2_SOFT_FLOAT
-	    - MIPS64r2 - Big-Endian, Soft-Float, N64
-	      Select MIPS64 (big endian) core
-	      Select the n64 ABI
-	      Select BR2_SOFT_FLOAT
-	    - MIPS64r2 - Little-Endian, N64
-	      Select MIPS64 (little endian) core
-	      Select the n64 ABI
-	      Disable BR2_SOFT_FLOAT
-	    - MIPS64r2 - Little-Endian, Soft-Float, N64
-	      Select MIPS64 (little endian) core
-	      Select the n64 ABI
-	      Select BR2_SOFT_FLOAT
-
-comment "Sourcery CodeBench toolchains are only available for MIPS/MIPS64 o32 and n64"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_6
-	depends on BR2_MIPS_NABI32
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in.options b/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in.options
deleted file mode 100644
index 677cc67d67..0000000000
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in.options
+++ /dev/null
@@ -1,9 +0,0 @@
-if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
-
-config BR2_TOOLCHAIN_EXTERNAL_PREFIX
-	default "mips-linux-gnu"
-
-config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
-	default "toolchain-external-codesourcery-mips"
-
-endif
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.hash b/toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.hash
deleted file mode 100644
index c2429d85de..0000000000
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  d354447c4c5160439dafd5464fa3a0266dd41e79f973477238e4f0215a6b5397  mips-2016.05-8-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
-sha256  2658e55d5b71bba25d6f77e868e18b200ea5f75c8add7ed3a9266e716d9adfff  mips-2016.05-8-mips-linux-gnu.src.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.mk b/toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.mk
deleted file mode 100644
index 94fbbff591..0000000000
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# toolchain-external-codesourcery-mips
-#
-################################################################################
-
-TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS_VERSION = 2016.05-8
-
-TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS_SITE = https://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_PREFIX)
-TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS_SOURCE = mips-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX)-i686-pc-linux-gnu.tar.bz2
-TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS_ACTUAL_SOURCE_TARBALL = mips-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX).src.tar.bz2
-
-$(eval $(toolchain-external-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
