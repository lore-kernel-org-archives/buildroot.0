Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A5BC19F29
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 10:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4538140308;
	Wed, 27 Jul 2022 10:58:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4538140308
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mv0pMqGw7Qun; Wed, 27 Jul 2022 10:58:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A1B54026F;
	Wed, 27 Jul 2022 10:58:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A1B54026F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B75711BF4E6
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92506404B9
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:58:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92506404B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QQe4W7hCxhcy for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 10:58:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B40940289
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B40940289
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 10:58:11 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 f24-20020a1cc918000000b003a30178c022so983732wmb.3
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 03:58:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zClTH0u2VmTFFm4m1Qd7BhunhCjG27n4bTS2EsUcS0Y=;
 b=CImXDXVEAVDeYzlb5Wj+xdBdpxfeUP085NwrPWscIP90dnFoYnp5aXKWKcH7ty82B4
 33h0qr3CD9ttegPZ2Ds6tJottEwO2dat4PZwXSl9Uhj8Ggcue/Dx7/0ngJnCnSNHLjol
 cJiWJJJoHpAmDZfq4NubJeK7FmpxDzrh2eqstdYDMXvAcjHPmqdWX9aof51fp1BHXe1H
 JNqnpUOYiSOB3gCDoV9t2xPQ+KwOm8ON1X8xff+vMCuuCawlz6H14w67ItN6I/wQb7bP
 VYn37yIJdNIGainAvtbt6Hnods/+d6ZWPE8HCw9UW3eeb+nJ7fU6EiyOaMrghG7vEzEN
 +VMA==
X-Gm-Message-State: AJIora/Utklo74eNVH+FXfuLlWHEF83rManMww12waSFHhM2CejMc/CH
 waWPjHwoF+xdt6rXENmKYdXWTlr8KSc=
X-Google-Smtp-Source: AGRyM1t6ZYCKPz6ZYKlIL0crEwlZerCEO5rDaG2fscu+qLEOe/yHnwGHmWpX9CPQzibjwO3YAfKByg==
X-Received: by 2002:a7b:c8ce:0:b0:3a3:2cf8:edb with SMTP id
 f14-20020a7bc8ce000000b003a32cf80edbmr2660384wml.70.1658919489116; 
 Wed, 27 Jul 2022 03:58:09 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:2464:a3b6:9580:87a1])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a5d65cd000000b0021e47386eb8sm17005038wrw.2.2022.07.27.03.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 03:58:08 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 12:58:04 +0200
Message-Id: <9c2e1f0723c547650772cfc43cf2c291fdc5abab.1658919469.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658919469.git.yann.morin.1998@free.fr>
References: <cover.1658919469.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zClTH0u2VmTFFm4m1Qd7BhunhCjG27n4bTS2EsUcS0Y=;
 b=ch+KswAG0OuHRcmjwUZJWK/imKQQJNCmD1SZDkzm8UvUs+BEH1ywi+K8IzcEKVFPGD
 7ZvLi4Q6faKvQgGSYqMMnAf9aMcR/X8PtShNaoZIloyGWF/pmibaDFKzPyBB4oBNxxaQ
 r5W5FeVfGfPoU37D2yQZN3bMr+rTS9zJjBum/Tg7/GzTG/cjuGjqIRNG2fcQ+lQNws5t
 1VjiZJJPoPBIylFRCgNv6ayIoTX85XzrUnEWlNweJanrmDMBEoFFBcyM5PWVQ4S4bXt6
 uNwZP1c8KHjxpkoidbUbxDtaDXr0nY7AztplFIRl6iujWgd2w8oKxOEXNRmTD4NZJEPa
 hxsg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ch+KswAG
Subject: [Buildroot] [PATCH 1/5] arch/csky: drop architecture
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

We currently have no internal and no external toolchain for csky.
The website is down (no https:// available, and the http:// index
page is 404).

This commit removes the architecture entry; remnants will be dropped in
followup changes.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy    |  7 ++++++
 DEVELOPERS          |  1 -
 arch/Config.in      | 14 ------------
 arch/Config.in.csky | 52 ---------------------------------------------
 arch/arch.mk.csky   | 26 -----------------------
 5 files changed, 7 insertions(+), 93 deletions(-)
 delete mode 100644 arch/Config.in.csky
 delete mode 100644 arch/arch.mk.csky

diff --git a/Config.in.legacy b/Config.in.legacy
index 949bca1cd0..24b4236ade 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2022.08"
 
+config BR2_csky
+	bool "csky architecture removed"
+	select BR2_LEGACY
+	help
+	  The csky architecture was removed, by lack of toolchain
+	  support.
+
 config BR2_PACKAGE_MESA3D_DRI_DRIVER_I915
 	bool "mesa DRI i915 driver removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 270fc52de1..04c9588f34 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1182,7 +1182,6 @@ F:	support/testing/tests/package/sample_python_pybind.py
 F:	support/testing/tests/package/test_python_pybind.py
 
 N:	Guo Ren <ren_guo@c-sky.com>
-F:	arch/Config.in.csky
 F:	board/csky/
 F:	configs/csky_*
 
diff --git a/arch/Config.in b/arch/Config.in
index 1d38c7a065..1c0c400a98 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -70,16 +70,6 @@ config BR2_aarch64_be
 	  http://www.arm.com/products/processors/instruction-set-architectures/armv8-architecture.php
 	  http://en.wikipedia.org/wiki/ARM
 
-config BR2_csky
-	bool "csky"
-	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
-	select BR2_USE_MMU
-	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
-	help
-	  csky is processor IP from china.
-	  http://www.c-sky.com/
-	  http://www.github.com/c-sky
-
 config BR2_i386
 	bool "i386"
 	select BR2_USE_MMU
@@ -376,10 +366,6 @@ if BR2_arm || BR2_armeb || BR2_aarch64 || BR2_aarch64_be
 source "arch/Config.in.arm"
 endif
 
-if BR2_csky
-source "arch/Config.in.csky"
-endif
-
 if BR2_m68k
 source "arch/Config.in.m68k"
 endif
diff --git a/arch/Config.in.csky b/arch/Config.in.csky
deleted file mode 100644
index b20b39e225..0000000000
--- a/arch/Config.in.csky
+++ /dev/null
@@ -1,52 +0,0 @@
-choice
-	prompt "Target Architecture Variant"
-	default BR2_ck610
-	help
-	  Specific CPU variant to use
-
-config BR2_ck610
-	# Not supported by upstream gcc <= 9, and handled as a special
-	# exception in package/gcc/Config.in.host
-	bool "ck610"
-
-config BR2_ck807
-	bool "ck807"
-
-config BR2_ck810
-	bool "ck810"
-
-config BR2_ck860
-	bool "ck860"
-
-endchoice
-
-config BR2_CSKY_FPU
-	bool "Enable FPU coprocessor"
-	depends on BR2_ck810 || BR2_ck807 || BR2_ck860
-	help
-	  You can say N here if your C-SKY CPU doesn't have a
-	  Floating-Point Coprocessor or if you don't need FPU support
-	  for your user-space programs.
-
-config BR2_CSKY_VDSP
-	bool "Enable VDSP enhanced instructions Co-processor"
-	depends on BR2_CSKY_FPU
-
-config BR2_GCC_TARGET_FLOAT_ABI
-	default "soft"		if !BR2_CSKY_FPU
-	default "hard"		if BR2_CSKY_FPU
-
-config BR2_ARCH
-	default "csky"
-
-config BR2_NORMALIZED_ARCH
-	default "csky"
-
-config BR2_ENDIAN
-	default "LITTLE"
-
-config BR2_READELF_ARCH_NAME
-	default "CSKY"
-
-# vim: ft=kconfig
-# -*- mode:kconfig; -*-
diff --git a/arch/arch.mk.csky b/arch/arch.mk.csky
deleted file mode 100644
index fb59ae22fd..0000000000
--- a/arch/arch.mk.csky
+++ /dev/null
@@ -1,26 +0,0 @@
-#
-# Configure the GCC_TARGET_ARCH variable and append the
-# appropriate C-SKY ISA extensions.
-#
-
-ifeq ($(BR2_csky),y)
-
-ifeq ($(BR2_ck610),y)
-GCC_TARGET_CPU := ck610
-else ifeq ($(BR2_ck807),y)
-GCC_TARGET_CPU := ck807
-else ifeq ($(BR2_ck810),y)
-GCC_TARGET_CPU := ck810
-else ifeq ($(BR2_ck860),y)
-GCC_TARGET_CPU := ck860
-endif
-
-ifeq ($(BR2_CSKY_FPU),y)
-GCC_TARGET_CPU := $(GCC_TARGET_CPU)f
-endif
-
-ifeq ($(BR2_CSKY_VDSP),y)
-GCC_TARGET_CPU := $(GCC_TARGET_CPU)v
-endif
-
-endif
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
