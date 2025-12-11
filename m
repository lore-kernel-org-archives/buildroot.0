Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3200D41D66
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 16:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24E6D40827;
	Thu, 11 Dec 2025 16:16:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uLh4pAZmSMMQ; Thu, 11 Dec 2025 16:16:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D80B6407C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765469797;
	bh=ObSeahd72KvvZhG0+UZTKg36Yo/xcv/TXrqQ2NH7c/8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=d4IgvAlZTmvrS2Cd7B9eerDR4rtEMLv1Bq6bAAOHMAcCzkkB8RPP5YKcvYIPwHvmm
	 Wel/4qNKJP3sEght4awDxgdTqRsrA+VFzR6UJhcv+JWCdXZCsTS4KPKjFpvvJ+m+EF
	 mKwoeNgbtlL4uWYkyNynW8SCSsHB2RDAyGO9jQcpZlbeA1IgXdz3enCpZDxC2qVrjA
	 Lyg9lpGiN8fe7rx8+3a9bqiidr2DjNTxyS9QGDHO4KHx8KzAKiMgf3QhyYlUGvXosE
	 t9HC1nULXI/kcIoCP6RlvlP2WcUCdRSZMlkynemE+fkldHXkQscUvlHwg9XmClutxh
	 CFJd47bzc12Lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D80B6407C6;
	Thu, 11 Dec 2025 16:16:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DD9D2C6
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 16:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84925407C6
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 16:16:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uea3aPKyrmfv for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 16:16:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 63916407C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63916407C5
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 63916407C5
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 16:16:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 4313EC1934B;
 Thu, 11 Dec 2025 16:16:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 259B26072F;
 Thu, 11 Dec 2025 16:16:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 19AD0103C8C1E; Thu, 11 Dec 2025 17:16:23 +0100 (CET)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 17:16:15 +0100
Message-ID: <20251211161615.503688-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765469791; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=tGQlayuX7VhSb/frEsXHZ6VoOWyhs1q7k4aJk9LAsW8=;
 b=nrN4h6fD/o9/RQnu+h9S8eSyyf5Zx2OJh4X9UVl0eNKEpG/RpevApmqki87eXEpC73ZqUg
 w7TpZ1D/z03idJnivhnl72wpyWyToCYC5ywa1zLCpJMahCcH7GwCHHPvvXOc2IE/Tn7cyr
 oScfB8QlQYCxYAmblqAin+Yd57C/uQ+96bCUzRHuBAtzDtfEm6htFgyJuBYyHFk4UhuW4r
 nXfaydkTElXQ83SBDe5yqexBd7ykTXZk3VwwLnAysedWM8FWPQ95h4fGW+SFNUIWN5Sq0b
 oMYV1zNIxJ4lLEDBKqhrBHZ0q6ZOA7uCrYa/EkTsJpkDTczq/xyPXHZ7QtjOHw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=nrN4h6fD
Subject: [Buildroot] [PATCH] arch: drop support for ARC big-endian
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: John Stile <johns@msli.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 ARC Maintainers <arc-buildroot@synopsys.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Bernd Kuhls <bernd@kuhls.net>, Alistair Francis <alistair@alistair23.me>,
 Maxim Kochetkov <fido_max@inbox.ru>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Alexey Brodkin from Synopsys says:

  I think indeed, we may remove all the big-endian support for ARC.
  Reasons are since introduction of ARC HS4x processors we no longer
  support big-endian in any new processor IP, and even for older IP
  which used to support big-endian it was rarely used... so basically
  there's no good justification to spend any cycles on big-endian
  support looking forward in this project.  I.e. BE support in uClibc
  could also be removed if it makes any difference.

Therefore, let's removed support for ARC big-endian.

Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: ARC Maintainers <arc-buildroot@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                       |  9 +++++++++
 arch/Config.in                                         | 10 +---------
 arch/Config.in.arc                                     |  8 +++-----
 linux/Config.in                                        |  2 +-
 package/dhcpcd/Config.in                               |  2 +-
 package/fluent-bit/Config.in                           |  2 +-
 package/kodi/kodi.mk                                   |  2 +-
 package/libspdm/Config.in                              |  2 +-
 package/oprofile/Config.in                             |  2 +-
 package/postgresql/postgresql.mk                       |  2 +-
 package/swipl/Config.in                                |  2 +-
 package/uclibc/Config.in                               |  3 +--
 package/z3/Config.in                                   |  2 +-
 toolchain/toolchain-external/pkg-toolchain-external.mk |  4 ----
 .../toolchain-external-synopsys-arc/Config.in.options  |  3 +--
 15 files changed, 24 insertions(+), 31 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 64151b2f44..304c9abddc 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,15 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_arceb
+	bool "ARC big endian support removed"
+	select BR2_LEGACY
+	help
+	  Synopsys' DesignWare ARC Processor Cores are a family of
+	  32-bit CPUs that can be used from deeply embedded to high
+	  performance host applications. The big endian support was
+	  not used nor maintained, so it was removed.
+
 config BR2_KERNEL_HEADERS_5_4
 	bool "kernel headers version 5.4.x are no longer supported"
 	select BR2_LEGACY
diff --git a/arch/Config.in b/arch/Config.in
index 34422c0d50..9b8ab20ffc 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -29,14 +29,6 @@ config BR2_arcle
 	  32-bit CPUs that can be used from deeply embedded to high
 	  performance host applications. Little endian.
 
-config BR2_arceb
-	bool "ARC (big endian)"
-	select BR2_USE_MMU
-	help
-	  Synopsys' DesignWare ARC Processor Cores are a family of
-	  32-bit CPUs that can be used from deeply embedded to high
-	  performance host applications. Big endian.
-
 config BR2_arm
 	bool "ARM (little endian)"
 	# MMU support is set by the subarchitecture file, arch/Config.in.arm
@@ -385,7 +377,7 @@ config BR2_BINFMT_SUPPORTS_SHARED
 config BR2_READELF_ARCH_NAME
 	string
 
-if BR2_arcle || BR2_arceb
+if BR2_arcle
 source "arch/Config.in.arc"
 endif
 
diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index f367c49131..7dd564d7f7 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -59,19 +59,17 @@ config BR2_ARC_ATOMIC_EXT
 	default y if BR2_archs4x_rel31 || BR2_archs4x
 
 config BR2_ARCH
-	default "arc"	if BR2_arcle
-	default "arceb"	if BR2_arceb
+	default "arc"
 
 config BR2_NORMALIZED_ARCH
 	default "arc"
 
 config BR2_arc
 	bool
-	default y if BR2_arcle || BR2_arceb
+	default y
 
 config BR2_ENDIAN
-	default "LITTLE" if BR2_arcle
-	default "BIG"	 if BR2_arceb
+	default "LITTLE"
 
 config BR2_GCC_TARGET_CPU
 	default "arc700" if BR2_arc750d
diff --git a/linux/Config.in b/linux/Config.in
index 10024bef38..59070efb7c 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -180,7 +180,7 @@ config BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG
 	# version. This is mainly needed to fix autobuilder testing.
 	select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL if \
 	       BR2_LINUX_KERNEL_LATEST_VERSION && \
-	       (BR2_aarch64 || BR2_aarch64_be || BR2_arcle || BR2_arceb || \
+	       (BR2_aarch64 || BR2_aarch64_be || BR2_arcle || \
 	        BR2_or1k || BR2_riscv || BR2_sparc || BR2_x86_64)
 	help
 	  This option will use the default configuration for the
diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
index dda93ba1cb..0d72340ffe 100644
--- a/package/dhcpcd/Config.in
+++ b/package/dhcpcd/Config.in
@@ -16,7 +16,7 @@ config BR2_PACKAGE_DHCPCD_ENABLE_PRIVSEP
 	default y
 	depends on BR2_USE_MMU
 	# Audit headers were only added in recent kernels for some arches
-	depends on !(BR2_arceb || BR2_arcle) || \
+	depends on !BR2_arcle || \
 		BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
 	depends on !(BR2_microblazeel || BR2_microblazebe) || \
 		BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
index aeae034b2a..2af6279744 100644
--- a/package/fluent-bit/Config.in
+++ b/package/fluent-bit/Config.in
@@ -23,7 +23,7 @@ if BR2_PACKAGE_FLUENT_BIT
 config BR2_PACKAGE_FLUENT_BIT_WASM_ARCH
 	string
 	default "AARCH64"    if BR2_aarch64 || BR2_aarch64_be
-	default "ARC"        if BR2_arcle || BR2_arceb
+	default "ARC"        if BR2_arcle
 	default "ARM"        if BR2_arm || BR2_armeb
 	default "MIPS"       if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default "RISCV32"    if BR2_riscv && BR2_RISCV_32
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 57bfcff555..c31e789503 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -146,7 +146,7 @@ KODI_DEPENDENCIES += libiconv
 KODI_EXTRA_LIBS += -liconv
 endif
 
-ifeq ($(BR2_arceb)$(BR2_arcle),y)
+ifeq ($(BR2_arcle),y)
 KODI_CONF_OPTS += -DWITH_ARCH=arc -DWITH_CPU=arc
 else ifeq ($(BR2_armeb),y)
 KODI_CONF_OPTS += -DWITH_ARCH=arm -DWITH_CPU=arm
diff --git a/package/libspdm/Config.in b/package/libspdm/Config.in
index 56c55f9c4d..e51634e896 100644
--- a/package/libspdm/Config.in
+++ b/package/libspdm/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBSPDM_CPU_FAMILY
 	string
-	# OpenSSL doesn't support "arc" (BR2_arcle || BR2_arceb), "arm"
+	# OpenSSL doesn't support "arc" (BR2_arcle), "arm"
 	# (if BR2_arm || BR2_armeb) or "riscv32"/"riscv6"
 	# (BR2_riscv && BR2_RISCV_32/BR2_RISCV_64). So we don't
 	# support those here
diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
index eca43d7ac3..df167e278a 100644
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -2,7 +2,7 @@
 config BR2_PACKAGE_OPROFILE_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_arceb || BR2_arcle || BR2_arm || BR2_armeb || \
+	depends on BR2_arcle || BR2_arm || BR2_armeb || \
 		BR2_aarch64 || BR2_aarch64_be || BR2_i386 || BR2_mips || \
 		BR2_mipsel || BR2_mips64 || BR2_mips64el || BR2_powerpc || \
 		BR2_powerpc64 || BR2_powerpc64le || BR2_s390x || BR2_sh || \
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 86761bf939..b3760f7e1f 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -38,7 +38,7 @@ POSTGRESQL_INSTALL_TARGET_OPTS += DESTDIR=$(TARGET_DIR) install-world
 POSTGRESQL_INSTALL_STAGING_OPTS += DESTDIR=$(STAGING_DIR) install-world
 endif
 
-ifeq ($(BR2_arcle)$(BR2_arceb)$(BR2_microblazeel)$(BR2_microblazebe)$(BR2_or1k)$(BR2_riscv)$(BR2_xtensa),y)
+ifeq ($(BR2_arcle)$(BR2_microblazeel)$(BR2_microblazebe)$(BR2_or1k)$(BR2_riscv)$(BR2_xtensa),y)
 POSTGRESQL_CONF_OPTS += -Dspinlocks=false
 else
 POSTGRESQL_CONF_OPTS += -Dspinlocks=true
diff --git a/package/swipl/Config.in b/package/swipl/Config.in
index 8bf58344b3..95f3e57770 100644
--- a/package/swipl/Config.in
+++ b/package/swipl/Config.in
@@ -5,7 +5,7 @@
 config BR2_PACKAGE_SWIPL_ARCH_SUPPORTS
 	bool
 	default y if BR2_aarch64 || BR2_aarch64_be
-	default y if BR2_arceb || BR2_arcle
+	default y if BR2_arcle
 	default y if BR2_arm || BR2_armeb
 	default y if BR2_i386
 	default y if BR2_m68k
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 4c360809c3..6b8b0d86f8 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_UCLIBC_ARCH_SUPPORTS
 	default y if BR2_aarch64
 	default y if BR2_aarch64_be
 	default y if BR2_arcle
-	default y if BR2_arceb
 	default y if BR2_arm
 	default y if BR2_armeb
 	default y if BR2_i386
@@ -126,7 +125,7 @@ config BR2_UCLIBC_INSTALL_UTILS
 config BR2_UCLIBC_TARGET_ARCH
 	string
 	default "aarch64"  if BR2_aarch64 || BR2_aarch64_be
-	default "arc"	   if BR2_arcle || BR2_arceb
+	default "arc"	   if BR2_arcle
 	default "arm"	   if BR2_arm	|| BR2_armeb
 	default "m68k"	   if BR2_m68k
 	default "microblaze"   if BR2_microblaze
diff --git a/package/z3/Config.in b/package/z3/Config.in
index 3afb8a6a22..2ef2e3eb89 100644
--- a/package/z3/Config.in
+++ b/package/z3/Config.in
@@ -5,7 +5,7 @@
 config BR2_PACKAGE_Z3_ARCH_SUPPORTS
 	bool
 	default y if BR2_aarch64 || BR2_aarch64_be
-	default y if BR2_arceb || BR2_arcle
+	default y if BR2_arcle
 	default y if BR2_arm || BR2_armeb
 	default y if BR2_i386
 	default y if BR2_m68k
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 2c2afa76c0..270cf814ed 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -237,10 +237,6 @@ ifeq ($(BR2_mips)$(BR2_mips64),y)
 TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_MIPS_TARGET_BIG_ENDIAN
 TOOLCHAIN_EXTERNAL_CFLAGS += -EB
 endif
-ifeq ($(BR2_arceb),y)
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_ARC_TARGET_BIG_ENDIAN
-TOOLCHAIN_EXTERNAL_CFLAGS += -EB
-endif
 
 TOOLCHAIN_EXTERNAL_CFLAGS += $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
 
diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options
index 4b4482106c..c60cf73460 100644
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options
@@ -33,8 +33,7 @@ config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARCHS_GLIBC
 endchoice
 
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
-	default "arc-linux"		 if BR2_arcle
-	default "arceb-linux"		 if BR2_arceb
+	default "arc-linux"
 
 config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
 	default "toolchain-external-synopsys-arc"
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
