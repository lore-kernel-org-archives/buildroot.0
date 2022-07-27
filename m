Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0180FC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 10:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87F8A60B59;
	Wed, 27 Jul 2022 10:58:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87F8A60B59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HIx5AXNhVieQ; Wed, 27 Jul 2022 10:58:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 819A560B00;
	Wed, 27 Jul 2022 10:58:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 819A560B00
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7BF2C1BF4E6
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 580FD40289
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:58:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 580FD40289
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OmyRe_tgrnxZ for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 10:58:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3054240484
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3054240484
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 10:58:12 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id a11so10274566wmq.3
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 03:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Rz317JKop2nqTTt/kciCRHAgjvRgvYWgFZf/Hwr4kFQ=;
 b=yWouhsbO77n7DMkLUKY/xQDso39WyNaFmfPZWU5Hfupi38Is5hfcGMEIn05Eltj2zM
 nleApwtVzVPijcgGYQxKSq4Nm2Sa3b66IHnX0YHAyTgp/VPkntL7NATTqfKCqfAdFjwk
 YT+Ufmm3cbqBMldDh7hISKsInrXuZ+cn0G5RE/6xdmoXSRaKiJSZ5si1YOjYuPt4pG26
 Lknv/Hw+cYR74IQIV+cdQrsYAMbc0La6BAscjGrZ6xFdRuqgjWoCt2l2CPcs4YksNfk5
 JHMWqA3NXh/X0KEBiQeUHeOTPUCm7Jb4qgAd9RJCXWjcOLdgXrhXcc4IKnu3oykM5iw2
 HnXQ==
X-Gm-Message-State: AJIora/AlmEm+HNfwiWpmQ6AbCOnUnvzNFt7fUssDrQmtEof0GMAZUH3
 ht7A1AZlcmcNjSRLfqkzsXb6fWdhPTM=
X-Google-Smtp-Source: AGRyM1s2T8v8QAWmMERqwlQINUBh/Xply2aCfXpgzfGlPTN3FEqvozE5pxoX4+GvMiqMwuJEgY2DWA==
X-Received: by 2002:a05:600c:3495:b0:3a3:1fab:d01e with SMTP id
 a21-20020a05600c349500b003a31fabd01emr2768166wmq.150.1658919490365; 
 Wed, 27 Jul 2022 03:58:10 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:2464:a3b6:9580:87a1])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a5d65cd000000b0021e47386eb8sm17005038wrw.2.2022.07.27.03.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 03:58:10 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 12:58:06 +0200
Message-Id: <e30808faf4915d550dc8d48c519aaba575a8f19b.1658919469.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658919469.git.yann.morin.1998@free.fr>
References: <cover.1658919469.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rz317JKop2nqTTt/kciCRHAgjvRgvYWgFZf/Hwr4kFQ=;
 b=OBro4YGRQcWBxEAHNORQ0E6NDvJGKRzza5I/Ema+/QOTwNBZLBNJp9BOKceW6EDdzv
 LnACOXUkA4QPbkZBPNxIgcTsigTXUUUsXoh/Fgxhey5trnEJHpmVA2KTFW6D0rpykr1m
 VTJJfoXt9UvG3qGJ4eOZArzr4Y8SUfXrJJbWIm/6sjki8MVWxeAKUja6rTDS3cUIsHys
 A8bUFE9BlKlHnbTaD+Rx/ifxSbzI8lMSXR+j3ZWVzuwwWs5BVaUNny7vjh+z+L2LcoMH
 n8mor6wMr4cW/KV0XF+WcAvTaZXQwqmm8b7JACWAQZ4jCglxukqAK7pwNetmonAaMt4E
 rEKw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OBro4YGR
Subject: [Buildroot] [PATCH 3/5] package: drop csky support in
 toolchain-related packages
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Guo Ren <ren_guo@c-sky.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Makefile.in                  | 9 ---------
 package/binutils/Config.in.host      | 3 +--
 package/gcc/Config.in.host           | 4 ----
 package/gdb/Config.in                | 1 -
 package/gdb/Config.in.host           | 2 --
 package/gdb/gdb.hash                 | 3 ---
 package/gdb/gdb.mk                   | 6 ------
 package/glibc/Config.in              | 1 -
 package/linux-headers/Config.in.host | 3 ---
 9 files changed, 1 insertion(+), 31 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 580e9d14ca..ff60f85092 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -75,15 +75,6 @@ ABI := $(ABI)hf
 endif
 endif
 
-# For C-SKY abiv1 & abiv2
-ifeq ($(BR2_csky),y)
-ifeq ($(BR2_ck610),y)
-ABI = abiv1
-else
-ABI = abiv2
-endif
-endif
-
 # For FSL PowerPC there's SPE
 ifeq ($(BR2_powerpc_SPE),y)
 ABI = spe
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 5bdda25faf..9fa0cc4e8d 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -7,14 +7,13 @@ config BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_37_X if !BR2_arc && !BR2_csky
+	default BR2_BINUTILS_VERSION_2_37_X if !BR2_arc
 	default BR2_BINUTILS_VERSION_ARC if BR2_arc
 	help
 	  Select the version of binutils you wish to use.
 
 config BR2_BINUTILS_VERSION_2_36_X
 	bool "binutils 2.36.1"
-	depends on !BR2_csky
 
 config BR2_BINUTILS_VERSION_2_37_X
 	bool "binutils 2.37"
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 74abad71d7..ba2a2ee072 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -27,10 +27,6 @@ config BR2_GCC_VERSION_10_X
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_powerpc_SPE
-	# C-SKY sk610 needs abiv1, which is not supported in
-	# upstream gcc. C-SKY gcc upstream support not tested
-	# with upstream binutils and glibc.
-	depends on !BR2_csky
 	# ARC HS48 rel 31 only supported by gcc arc fork.
 	depends on !BR2_archs4x_rel31
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index a39837fe71..cf5a2a892c 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -52,7 +52,6 @@ config BR2_PACKAGE_GDB_DEBUGGER
 	bool "full debugger"
 	depends on BR2_USE_WCHAR
 	depends on !BR2_sh
-	depends on !BR2_csky
 	select BR2_PACKAGE_GMP if BR2_GDB_VERSION_11
 	select BR2_PACKAGE_NCURSES
 
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 43af64a1ed..15d5f52a36 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -44,7 +44,6 @@ choice
 	prompt "GDB debugger Version"
 	default BR2_GDB_VERSION_10
 	depends on !BR2_arc
-	depends on !BR2_csky
 	help
 	  Select the version of gdb you wish to use.
 
@@ -67,7 +66,6 @@ endif
 config BR2_GDB_VERSION
 	string
 	default "arc-2020.09-release-gdb" if BR2_arc
-	default "4ecb98fbc2f94dbe01b69384afbc515107de73df" if BR2_csky
 	default "9.2"      if BR2_GDB_VERSION_9_2
 	default "10.2"	   if BR2_GDB_VERSION_10 || !BR2_PACKAGE_HOST_GDB
 	default "11.2"     if BR2_GDB_VERSION_11
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index e7933374f1..cb7f4c805d 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -5,6 +5,3 @@ sha512  07e9026423438049b11f4f784d57401ece4e940570f613bd6958b3714fe7fbc2c048470b
 
 # Locally calculated (fetched from Github)
 sha512  5a2acf2fd33ab2ff589e1037ca40abda54328997dcff26b2b49b874bd3be980be5a63342962254f3c3bda98e32ce7a33af704d37353352833dee193135600458  gdb-arc-2020.09-release-gdb.tar.gz
-
-# Locally calculated (fetched from https://github.com/c-sky/binutils-gdb)
-sha512  c421e1f3c0d6cfb3c04544573c0c4b0075c8d8e3d563c6c234fcc1e4c2167ab203d1e57aec3b58abd348dc46f8cf9b47b753d3a43dba3ea970c9c9a6bd78c07b  gdb-4ecb98fbc2f94dbe01b69384afbc515107de73df.tar.gz
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 9bde2beea1..86e57481de 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -14,12 +14,6 @@ GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
 GDB_FROM_GIT = y
 endif
 
-ifeq ($(BR2_csky),y)
-GDB_SITE = $(call github,c-sky,binutils-gdb,$(GDB_VERSION))
-GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
-GDB_FROM_GIT = y
-endif
-
 GDB_LICENSE = GPL-2.0+, LGPL-2.0+, GPL-3.0+, LGPL-3.0+
 GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
 GDB_CPE_ID_VENDOR = gnu
diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index c0526cdd9e..23cbfcd9aa 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -21,7 +21,6 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	default y if BR2_microblaze
 	default y if BR2_nios2
 	default y if BR2_arc && BR2_ARC_ATOMIC_EXT
-	default y if BR2_csky
 	depends on !BR2_powerpc_SPE
 	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
 	depends on BR2_USE_MMU
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 678c3d35f7..c2e872abfb 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -30,18 +30,15 @@ config BR2_KERNEL_HEADERS_AS_KERNEL
 config BR2_KERNEL_HEADERS_4_9
 	bool "Linux 4.9.x kernel headers"
 	depends on !BR2_riscv
-	depends on !BR2_csky
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 
 config BR2_KERNEL_HEADERS_4_14
 	bool "Linux 4.14.x kernel headers"
 	depends on !BR2_riscv
-	depends on !BR2_csky
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
 
 config BR2_KERNEL_HEADERS_4_19
 	bool "Linux 4.19.x kernel headers"
-	depends on !BR2_csky
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 
 config BR2_KERNEL_HEADERS_5_4
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
