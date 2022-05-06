Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426ADC433EF
	for <buildroot@archiver.kernel.org>; Fri,  6 May 2022 05:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9B4483FAF;
	Fri,  6 May 2022 05:47:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NNc2HjmzW2rM; Fri,  6 May 2022 05:47:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DF21840C5;
	Fri,  6 May 2022 05:47:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 74D751BF867
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 05:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6331F840B6
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 05:47:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T7GRfxIQZnL4 for <buildroot@lists.busybox.net>;
 Fri,  6 May 2022 05:46:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A62D840CC
 for <buildroot@buildroot.org>; Fri,  6 May 2022 05:46:59 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 q73-20020a4a334c000000b0035eb110dd0dso1084416ooq.10
 for <buildroot@buildroot.org>; Thu, 05 May 2022 22:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oCwoGFLlgGWoINOA8ZmthHKOGFSazc6WuCGDJdzecbA=;
 b=GYKSKeEl8fl5/KT01bhOww0+BHQ7/OK9LYSWPEtQXlbwjS2Ul7h+Iz+HWJT86V62Mu
 ByfTcjJ9Y5Cp7pveBd1fVGIeQ61/IhMrumqC+oANsRVvQqJe0GpsvAZtVfLaPJIBw34v
 sDImyM+zLIW6MbLKsw72LPT0nMK0ltylJ8A/v93QU4IjfirF+wQvFRbj+YvWnRlEuxOD
 IVV6V5bOhhDP6umgzTE+dQWL9vIXXT7TRfV7vO2i4DjvYrT3vfSfsxULsHEnNgOjmphW
 xVwED25AQpkagNQOtSOBOcSfH9PEGyNkxDRStghb64obHT9fCTG3LlEPTOQkVkqe7yCd
 roXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oCwoGFLlgGWoINOA8ZmthHKOGFSazc6WuCGDJdzecbA=;
 b=pXEDKKdLAm5D9FAbJntHE8xSqj/ztE41XLqTl/5Xi0LDPsCNAYY50KcpBhkvxnapHS
 lXcnBXpX/wgIUTLaPqsZ6UYk9h/7pCLtk+NK677A4CmO+RHmf3TZwIEQZWJqtCsyY+7O
 khE0BdFnd+dGA6u6cXmmu1RjoqfU/hoXipJ9uDP7BsZMRbuaqX/TGy9OCPuRT4n3J6q0
 2Lhp7VN3aVV9SIf8o95rC2O56GIWlZdtBLeXy3nMV+jZEHHBGWkHsCL9qG3lcH9UhIIm
 pQfuQ6ePkaqT2kmeIvbvutvWaoo9RkJGQZT3hp2tZXYqEV7+c4/WhW5qjOnhVVjVha9x
 DguQ==
X-Gm-Message-State: AOAM533FfvcbJb3kUeOa8EkP1+ra+rNhwAFjceHvjWWJvXSUpxP7fBgS
 XUcx+j0OJwa6Ng7nlH/IC/aM0UuwoB4=
X-Google-Smtp-Source: ABdhPJz9wSUsq1ENDgbBlQUY/UFDGZTfqad09xAwxGakgyamm/ALvtCsoA33wK9ldzRV53RFdBbBYQ==
X-Received: by 2002:a4a:8783:0:b0:324:b9a2:d605 with SMTP id
 b3-20020a4a8783000000b00324b9a2d605mr556664ooi.38.1651816017994; 
 Thu, 05 May 2022 22:46:57 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 n20-20020a056870e41400b000e686d1388esm1206254oag.40.2022.05.05.22.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 22:46:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  5 May 2022 23:46:51 -0600
Message-Id: <20220506054651.2853406-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] toolchain-buildroot: only allow
 BR2_STATIC_LIBS on supported archs
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It is currently possible to select BR2_STATIC_LIBS while
BR2_TOOLCHAIN_BUILDROOT is selected even when there are no buildroot
toolchains that support BR2_STATIC_LIBS for the selected architecture.

Add BR2_TOOLCHAIN_BUILDROOT_STATIC_LIBS_ARCH_SUPPORTS so that we can
disable the selection of BR2_STATIC_LIBS when using an unsupported
architecture.

Fixes:
 - http://autobuild.buildroot.net/results/4da/4da59af8193376ec893321c4c2aaf1d25598502d
 - http://autobuild.buildroot.net/results/195/1950348218a4f097f078d158977c13f8b0a97d6e
 - http://autobuild.buildroot.net/results/2f0/2f03f2be32ad9898a990f6f0264d8c8d51991eb1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Config.in                               |   2 +
 toolchain/toolchain-buildroot/Config.in | 119 ++++++++++++++++++------
 2 files changed, 90 insertions(+), 31 deletions(-)

diff --git a/Config.in b/Config.in
index f0cd6f48ed..5daca3adce 100644
--- a/Config.in
+++ b/Config.in
@@ -601,6 +601,8 @@ choice
 
 config BR2_STATIC_LIBS
 	bool "static only"
+	depends on !BR2_TOOLCHAIN_BUILDROOT || \
+		BR2_TOOLCHAIN_BUILDROOT_STATIC_LIBS_ARCH_SUPPORTS
 	help
 	  Build and use only static libraries. No shared libraries will
 	  be installed on the target. This potentially increases your
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index be89f68ab5..287253b11f 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -20,6 +20,91 @@ config BR2_TOOLCHAIN_BUILDROOT_VENDOR
 
 	  If you're not sure, just leave the default "buildroot" value.
 
+config BR2_TOOLCHAIN_BUILDROOT_UCLIBC_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	default y if BR2_aarch64_be
+	default y if BR2_arcle
+	default y if BR2_arceb
+	default y if BR2_arm
+	default y if BR2_armeb
+	default y if BR2_i386
+	default y if BR2_m68k
+	default y if BR2_microblaze
+	default y if BR2_mips
+	default y if BR2_mipsel
+	default y if BR2_mips64
+	default y if BR2_mips64el
+	default y if BR2_or1k
+	default y if BR2_powerpc
+	default y if BR2_RISCV_64
+	default y if BR2_sh4
+	default y if BR2_sh4eb
+	default y if BR2_sparc
+	default y if BR2_xtensa
+	default y if BR2_x86_64
+
+config BR2_TOOLCHAIN_BUILDROOT_GLIBC_ARCH_SUPPORTS
+	bool
+	default y if BR2_arm
+	default y if BR2_armeb
+	default y if BR2_aarch64
+	default y if BR2_aarch64_be
+	default y if BR2_i386
+	default y if BR2_mips
+	default y if BR2_mipsel
+	default y if BR2_mips64
+	default y if BR2_mips64el
+	default y if BR2_powerpc
+	default y if BR2_powerpc64
+	default y if BR2_powerpc64le
+	default y if BR2_riscv
+	default y if BR2_s390x
+	default y if BR2_sh
+	default y if BR2_sparc64
+	default y if BR2_x86_64
+	default y if BR2_microblaze
+	default y if BR2_nios2
+	default y if BR2_arc && BR2_ARC_ATOMIC_EXT
+	default y if BR2_csky
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_RISCV_64
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 || !BR2_arc
+	depends on !BR2_powerpc_SPE
+	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
+
+config BR2_TOOLCHAIN_BUILDROOT_MUSL_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	default y if BR2_arm
+	default y if BR2_armeb
+	default y if BR2_i386
+	default y if BR2_microblaze
+	default y if BR2_mips
+	default y if BR2_mipsel
+	default y if BR2_mips64
+	default y if BR2_mips64el
+	default y if BR2_or1k
+	default y if BR2_powerpc
+	default y if BR2_powerpc64
+	default y if BR2_powerpc64le
+	default y if BR2_RISCV_64
+	default y if BR2_sh
+	default y if BR2_x86_64
+	depends on !BR2_powerpc_SPE # not supported, build breaks
+	depends on !(BR2_powerpc64 || BR2_powerpc64le) || BR2_POWERPC_CPU_HAS_ALTIVEC
+	# sh2 nommu is supported by musl, but we don't have support
+	# for it in Buildroot.
+	depends on BR2_USE_MMU
+
+config BR2_TOOLCHAIN_BUILDROOT_STATIC_LIBS_ARCH_SUPPORTS
+	bool
+	default y if BR2_TOOLCHAIN_BUILDROOT_UCLIBC_ARCH_SUPPORTS
+	default y if BR2_TOOLCHAIN_BUILDROOT_MUSL_ARCH_SUPPORTS
+
 choice
 	prompt "C library"
 	default BR2_TOOLCHAIN_BUILDROOT_UCLIBC
@@ -27,13 +112,7 @@ choice
 
 config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	bool "uClibc-ng"
-	depends on BR2_aarch64 || BR2_aarch64_be || BR2_arcle   || BR2_arceb  || \
-		   BR2_arm     || BR2_armeb    || \
-		   BR2_i386    || BR2_m68k   || BR2_microblaze || \
-		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
-		   BR2_or1k    || BR2_powerpc || BR2_RISCV_64 || \
-		   BR2_sh4     || BR2_sh4eb   || BR2_sparc || BR2_xtensa || \
-		   BR2_x86_64
+	depends on BR2_TOOLCHAIN_BUILDROOT_UCLIBC_ARCH_SUPPORTS
 	select BR2_TOOLCHAIN_USES_UCLIBC
 	help
 	  This option selects uClibc-ng as the C library for the
@@ -43,22 +122,8 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 
 config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	bool "glibc"
-	depends on BR2_arm         || BR2_armeb      || BR2_aarch64 || \
-		   BR2_aarch64_be  || BR2_i386       || BR2_mips    || \
-		   BR2_mipsel      || BR2_mips64     || BR2_mips64el|| \
-		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
-		   BR2_riscv       || BR2_s390x      || BR2_sh          || \
-		   BR2_sparc64     || BR2_x86_64     || BR2_microblaze  || \
-		   BR2_nios2       || (BR2_arc && BR2_ARC_ATOMIC_EXT)   || BR2_csky
-	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_BUILDROOT_GLIBC_ARCH_SUPPORTS
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_RISCV_64
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 || !BR2_arc
-	depends on !BR2_powerpc_SPE
-	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
 	select BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  This option selects glibc as the C library for the
@@ -82,15 +147,7 @@ comment "glibc on MIPS w/ NAN2008 needs a toolchain w/ headers >= 4.5"
 
 config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	bool "musl"
-	depends on BR2_aarch64	   || BR2_arm   || BR2_armeb   || BR2_i386 || \
-		   BR2_microblaze  || BR2_mips  || BR2_mipsel  || BR2_mips64 || \
-		   BR2_mips64el    || BR2_or1k  || BR2_powerpc || BR2_powerpc64 || \
-		   BR2_powerpc64le || BR2_RISCV_64 || BR2_sh   || BR2_x86_64
-	depends on !BR2_powerpc_SPE # not supported, build breaks
-	depends on !(BR2_powerpc64 || BR2_powerpc64le) || BR2_POWERPC_CPU_HAS_ALTIVEC
-	# sh2 nommu is supported by musl, but we don't have support
-	# for it in Buildroot.
-	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_BUILDROOT_MUSL_ARCH_SUPPORTS
 	select BR2_TOOLCHAIN_USES_MUSL
 	help
 	  This option selects musl as the C library for the
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
