Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B966C433EF
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 00:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAC114098D;
	Mon, 16 May 2022 00:06:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xRsBePRPbBj0; Mon, 16 May 2022 00:06:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 554F9408EA;
	Mon, 16 May 2022 00:06:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F9E31BF973
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 00:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C86B80BAB
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 00:06:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id en-BFW6M6KZh for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 00:06:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4523480BA6
 for <buildroot@buildroot.org>; Mon, 16 May 2022 00:06:32 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id e3so14346115ios.6
 for <buildroot@buildroot.org>; Sun, 15 May 2022 17:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8xrAfhdXIu8mK5Pn8NXSI4O9nvDLjzkAZxJE+pvTyJE=;
 b=bWLECkhK/aLPRmQVyLQZtveVZE1GCEJX6Qqz5O9fq0+sd0z+GblXS3IJTAFOC3B+no
 nXk5Uscp92WvidzOh8IwwPdl5FsW9jXe9w4Ohv56b4c83n3WlG4EIMbrXsMZpmIv8qWM
 PXIInctYFX/OQco/Kxh9tW95qoiGCwgKr8s2DsUOjTH7GjeEkBxnIifhS5Pzr4OoggTM
 0hWV11lNHazaKc7LvNhbETABYA3BKNznL5+gd1w+Dpk09fxefUKGxcx/cJgsHcFmEmSC
 56zhosKTzv8s3pfLfyst/6VY+YxZ2x+fIMa/UAD8rE0zBVkFNPwZElZugg4nGgUFyELO
 EkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8xrAfhdXIu8mK5Pn8NXSI4O9nvDLjzkAZxJE+pvTyJE=;
 b=BJbrVMwaesRyVuhqKjqux7RjiqKgffOUqv6a4noFt3aH7uqDRPmTKg5hHqDYXpl1Hh
 Kj4VMEjpPv60MoOB75G1Soz4i2SRohuv0NfF94G/scVu+XtiVE/2l2EovO1nRzDj0lMa
 IfP0bf1nkcNuXW2ib0F7z9iATmlLXV6pZsgkiICgTvHfHgV0UWMeb8S9WYFJ7ZyqB9U5
 N3Gu+vF7mniwGiLX9JUcP68nlUHwmWlB0tQL1GirRPKrFJtvHIlibuWtPuYPeAFon37U
 9eEFF+TSTu2fWj2TocIjeVdJwCHhyt/YCGaJ3cNnZ3Hx3BM+sB03MeVK4iktbX1DC/Wh
 IZFw==
X-Gm-Message-State: AOAM532zruazUM643l95W4Iq4gx2fknCCAHtTj/kbrVmfIkBdSMmoxRK
 I66IDnFxtHvAiNmnBRGVrnuV9e0Tc9M=
X-Google-Smtp-Source: ABdhPJxn8dnmAIZbEZMkBcs5bgxxEMJHvp8JL64VGaKgeW42OW1ztZfUsbKxgb3+MuBiXWv5sJnXng==
X-Received: by 2002:a02:6f54:0:b0:32e:3a53:9ab8 with SMTP id
 b20-20020a026f54000000b0032e3a539ab8mr480901jae.253.1652659591098; 
 Sun, 15 May 2022 17:06:31 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 1-20020a021d01000000b0032e332882e0sm392089jaj.75.2022.05.15.17.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 May 2022 17:06:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 May 2022 18:06:18 -0600
Message-Id: <20220516000619.1666731-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] toolchain-buildroot: only allow
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It is currently possible to select BR2_STATIC_LIBS while
BR2_TOOLCHAIN_BUILDROOT is selected even when there are no buildroot
toolchains that support BR2_STATIC_LIBS for the selected architecture.

Add BR2_TOOLCHAIN_BUILDROOT_STATIC_LIBS_SUPPORTS so that we can
disable the selection of BR2_STATIC_LIBS when using an unsupported
architecture.

Fixes:
 - http://autobuild.buildroot.net/results/4da/4da59af8193376ec893321c4c2aaf1d25598502d
 - http://autobuild.buildroot.net/results/195/1950348218a4f097f078d158977c13f8b0a97d6e
 - http://autobuild.buildroot.net/results/2f0/2f03f2be32ad9898a990f6f0264d8c8d51991eb1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - move supports config variables into toolchain configs
---
 Config.in                               |  2 ++
 package/glibc/Config.in                 | 38 +++++++++++++++++++++++
 package/musl/Config.in                  | 28 +++++++++++++++++
 package/uclibc/Config.in                | 28 +++++++++++++++++
 toolchain/toolchain-buildroot/Config.in | 41 +++++--------------------
 5 files changed, 104 insertions(+), 33 deletions(-)

diff --git a/Config.in b/Config.in
index f0cd6f48ed..52c3c4b4c8 100644
--- a/Config.in
+++ b/Config.in
@@ -601,6 +601,8 @@ choice
 
 config BR2_STATIC_LIBS
 	bool "static only"
+	depends on !BR2_TOOLCHAIN_BUILDROOT || \
+		BR2_TOOLCHAIN_BUILDROOT_STATIC_LIBS_SUPPORTS
 	help
 	  Build and use only static libraries. No shared libraries will
 	  be installed on the target. This potentially increases your
diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 8e9ddac7d9..6405bff6a0 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -1,3 +1,41 @@
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
+	default y if BR2_or1k
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
+	depends on !BR2_powerpc_SPE
+	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
+
+config BR2_TOOLCHAIN_BUILDROOT_GLIBC_SUPPORTS
+	bool
+	default y if BR2_TOOLCHAIN_BUILDROOT_GLIBC_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_RISCV_64
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 || !BR2_arc
+
 if BR2_TOOLCHAIN_BUILDROOT_GLIBC
 
 comment "Glibc Options"
diff --git a/package/musl/Config.in b/package/musl/Config.in
index 69da615b63..f038acfb46 100644
--- a/package/musl/Config.in
+++ b/package/musl/Config.in
@@ -1,3 +1,31 @@
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
+
+config BR2_TOOLCHAIN_BUILDROOT_MUSL_SUPPORTS
+	bool
+	default y if BR2_TOOLCHAIN_BUILDROOT_MUSL_ARCH_SUPPORTS
+	# sh2 nommu is supported by musl, but we don't have support
+	# for it in Buildroot.
+	depends on BR2_USE_MMU
+
 config BR2_PACKAGE_MUSL
 	bool
 	default y
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 310414bebc..cf682b30c7 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -1,3 +1,31 @@
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
+config BR2_TOOLCHAIN_BUILDROOT_UCLIBC_SUPPORTS
+	bool
+	default y if BR2_TOOLCHAIN_BUILDROOT_UCLIBC_ARCH_SUPPORTS
+
 if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 
 comment "uClibc Options"
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 8d9cf4cc68..f614c333e7 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -20,6 +20,11 @@ config BR2_TOOLCHAIN_BUILDROOT_VENDOR
 
 	  If you're not sure, just leave the default "buildroot" value.
 
+config BR2_TOOLCHAIN_BUILDROOT_STATIC_LIBS_SUPPORTS
+	bool
+	default y if BR2_TOOLCHAIN_BUILDROOT_UCLIBC_SUPPORTS
+	default y if BR2_TOOLCHAIN_BUILDROOT_MUSL_SUPPORTS
+
 choice
 	prompt "C library"
 	default BR2_TOOLCHAIN_BUILDROOT_UCLIBC
@@ -27,13 +32,7 @@ choice
 
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
@@ -43,23 +42,7 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 
 config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	bool "glibc"
-	depends on BR2_arm         || BR2_armeb      || BR2_aarch64 || \
-		   BR2_aarch64_be  || BR2_i386       || BR2_mips    || \
-		   BR2_mipsel      || BR2_mips64     || BR2_mips64el|| \
-		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
-		   BR2_riscv       || BR2_s390x      || BR2_sh          || \
-		   BR2_sparc64     || BR2_x86_64     || BR2_microblaze  || \
-		   BR2_nios2       || (BR2_arc && BR2_ARC_ATOMIC_EXT)   || \
-		   BR2_csky 	   || BR2_or1k
-	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_RISCV_64
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 || !BR2_arc
-	depends on !BR2_powerpc_SPE
-	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
+	depends on BR2_TOOLCHAIN_BUILDROOT_GLIBC_SUPPORTS
 	select BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  This option selects glibc as the C library for the
@@ -83,15 +66,7 @@ comment "glibc on MIPS w/ NAN2008 needs a toolchain w/ headers >= 4.5"
 
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
