Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6E6C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 12:41:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECED26187D
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 12:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECED26187D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C38B3847FB;
	Sun,  3 Oct 2021 12:41:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d79YETZ-3PoT; Sun,  3 Oct 2021 12:41:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7C0C8481E;
	Sun,  3 Oct 2021 12:41:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 366A81BF327
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 12:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 253B840269
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 12:40:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gJktvRMFeiHD for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 12:40:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B94D400F1
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 12:40:37 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id e12so4735566wra.4
 for <buildroot@buildroot.org>; Sun, 03 Oct 2021 05:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K0Y3QLMXNH0pTuUKAcC5jKt0eOohftW7stx1RcUHnqo=;
 b=Q4LwFZJy4ljYmz1GkDnGRAn9xBKgTaj51dU9vkd337qNpmpf2aLp3uxQjj9cztHm9w
 ITx9qymmmDMfoCaQFp7Q0pTFF8JPOAJZOsi6qJIxkAwz3Bc6loj9p5k862VGf7YL9vBB
 V7FDv2HKkbtcGyYwlsxXh5r1OhgHSTDYKDICTVdP4OESQlN9UTpKQAERwuFU4p1chl2s
 JCSv1V+nk/I/5IeULcdjwmIhswZy47oH3ue/rMOjNlz5s0oSos91uscw+I9P5gEllnQY
 IPbxvjPjHl9OV9eplfyDDeVkIzcUaZuvDSfN6GOeTOOify+WW2waXWRtfqF4Uz2ZqfuP
 HHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K0Y3QLMXNH0pTuUKAcC5jKt0eOohftW7stx1RcUHnqo=;
 b=7NgcIpmMBOn11zJwHXbNnnH+IUPXVJrzQoV2PDcFUnXsQMXk7VvZhc9FmQzuNh4aYE
 zKFeSdcWEggGXuGx2hZDkqm0yPqCUxzdi698qNi9x4jP7EUqoqbJCbQbJOoMVh7j6D6N
 qB+gbscSeSLgN1Ih7eV7e8ktP7jklIvmdMpweoTWzOesQKHHGL1XWa4vpFeV7kBVzo3q
 xZJc0TFTH7sD11CuNq5xKzlnoTeI7KL6lVsK3zKj15z2aIu2iW6dn/tFnTYN7dWp/eFG
 7jHfWPmt4LE/JRQE0uzn0YY4pIYblxgiVvX3unfeEylCks76o4r0dh1MUcmVGlPTLwEl
 qFaw==
X-Gm-Message-State: AOAM5315nb1bXZwchFUrM1MX8Me3Bnod2NWQk1tGeR3dPQVEc4Y9FT9z
 MME8R1v+TE7JFowfRREB8vAvmIWpDJQ=
X-Google-Smtp-Source: ABdhPJyZA7ougezcXDrR3O/6l2lR/cSFH5lGuVMWZZJYujOYWEL2MuvpW4Z8TFpE8kBRRP7F9NI+DA==
X-Received: by 2002:adf:f48d:: with SMTP id l13mr8197655wro.94.1633264835508; 
 Sun, 03 Oct 2021 05:40:35 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id 143sm1258704wma.37.2021.10.03.05.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 05:40:35 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Oct 2021 14:40:26 +0200
Message-Id: <20211003124027.343390-4-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003124027.343390-1-romain.naour@gmail.com>
References: <20211003124027.343390-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/5] package/gcc: remove csky version
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Guo Ren <ren_guo@c-sky.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove gcc csky fork since it doesn't build with the latest compilers
(gcc 8, 10, 11 tested) [1].

Removing the csky gcc fork has become unavoidable since the
Buildroot Docker image used by the gitlab CI will switch soon to
Debian bullseye soon [2].

The csky support for csky807 and csky810 has been upstreamed in
gcc 10 [3] and csky860 will be supported by gcc 12 [4]. There is
no info about the csky610. Although the csky architecture is
supported since gcc 10, the support was not enabled in Buildroot.

[1] http://lists.busybox.net/pipermail/buildroot/2021-August/621504.html
[2] 71b83227128be62c169313e85bb8f339f977ad67
[3] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=cc7232b999b8336cf4e261407ed9289c77bed1f0
[4] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=db92bd223e3957ee58b5a0c0fffd8b7766f1def3

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                              |   6 +
 arch/Config.in                                |   2 -
 ...er-Remove-cyclades-from-libsanitizer.patch | 121 ------------------
 package/gcc/Config.in.host                    |  12 --
 package/gcc/gcc.hash                          |   2 -
 package/gcc/gcc.mk                            |   3 -
 6 files changed, 6 insertions(+), 140 deletions(-)
 delete mode 100644 package/gcc/48152afb96c59733d5bc79e3399bb7b3d4b44266/0001-libsanitizer-Remove-cyclades-from-libsanitizer.patch

diff --git a/Config.in.legacy b/Config.in.legacy
index 9f1f7687fb..2ce455c633 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2021.11"
 
+config BR2_GCC_VERSION_CSKY
+	bool "gcc csky version removed"
+	select BR2_LEGACY
+	help
+	  Support for gcc csky version has been removed.
+
 config BR2_PACKAGE_STRONGSWAN_EAP
 	bool "strongswan EAP plugins now individually selectable"
 	select BR2_LEGACY
diff --git a/arch/Config.in b/arch/Config.in
index ab40294ddc..d50718e2d4 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -79,8 +79,6 @@ config BR2_csky
 	bool "csky"
 	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
 	select BR2_ARCH_HAS_MMU_MANDATORY
-	# Most variants are supported by gcc-9+, except one that is
-	# handled as a special exception in package/gcc/Config.in.host
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 	help
 	  csky is processor IP from china.
diff --git a/package/gcc/48152afb96c59733d5bc79e3399bb7b3d4b44266/0001-libsanitizer-Remove-cyclades-from-libsanitizer.patch b/package/gcc/48152afb96c59733d5bc79e3399bb7b3d4b44266/0001-libsanitizer-Remove-cyclades-from-libsanitizer.patch
deleted file mode 100644
index 9e6c4cfd03..0000000000
--- a/package/gcc/48152afb96c59733d5bc79e3399bb7b3d4b44266/0001-libsanitizer-Remove-cyclades-from-libsanitizer.patch
+++ /dev/null
@@ -1,121 +0,0 @@
-From 0d2ee4f3a8cd3516f2c5c2f06373f8a32fd77b9d Mon Sep 17 00:00:00 2001
-From: Tamar Christina <tamar.christina@arm.com>
-Date: Fri, 21 May 2021 12:16:56 +0100
-Subject: [PATCH] libsanitizer: Remove cyclades from libsanitizer
-
-The Linux kernel has removed the interface to cyclades from
-the latest kernel headers[1] due to them being orphaned for the
-past 13 years.
-
-libsanitizer uses this header when compiling against glibc, but
-glibcs itself doesn't seem to have any references to cyclades.
-
-Further more it seems that the driver is broken in the kernel and
-the firmware doesn't seem to be available anymore.
-
-As such since this is breaking the build of libsanitizer (and so the
-GCC bootstrap[2]) I propose to remove this.
-
-[1] https://lkml.org/lkml/2021/3/2/153
-[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=100379
-
-libsanitizer/ChangeLog:
-
-	PR sanitizer/100379
-	* sanitizer_common/sanitizer_common_interceptors_ioctl.inc: Cherry-pick
-	llvm-project revision f7c5351552387bd43f6ca3631016d7f0dfe0f135.
-	* sanitizer_common/sanitizer_platform_limits_posix.cc: Likewise.
-	* sanitizer_common/sanitizer_platform_limits_posix.h: Likewise.
----
- .../sanitizer_common_interceptors_ioctl.inc           |  9 ---------
- .../sanitizer_platform_limits_posix.cc                | 11 -----------
- .../sanitizer_platform_limits_posix.h                 | 10 ----------
- 3 files changed, 30 deletions(-)
-
-diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
-index 6c5fda09fbf..8f9314142b6 100755
---- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
-+++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
-@@ -358,15 +358,6 @@ static void ioctl_table_fill() {
- 
- #if SANITIZER_LINUX && !SANITIZER_ANDROID
-   // _(SIOCDEVPLIP, WRITE, struct_ifreq_sz); // the same as EQL_ENSLAVE
--  _(CYGETDEFTHRESH, WRITE, sizeof(int));
--  _(CYGETDEFTIMEOUT, WRITE, sizeof(int));
--  _(CYGETMON, WRITE, struct_cyclades_monitor_sz);
--  _(CYGETTHRESH, WRITE, sizeof(int));
--  _(CYGETTIMEOUT, WRITE, sizeof(int));
--  _(CYSETDEFTHRESH, NONE, 0);
--  _(CYSETDEFTIMEOUT, NONE, 0);
--  _(CYSETTHRESH, NONE, 0);
--  _(CYSETTIMEOUT, NONE, 0);
-   _(EQL_EMANCIPATE, WRITE, struct_ifreq_sz);
-   _(EQL_ENSLAVE, WRITE, struct_ifreq_sz);
-   _(EQL_GETMASTRCFG, WRITE, struct_ifreq_sz);
-diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc
-index 9866cc9e17a..5277407aec7 100644
---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc
-+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc
-@@ -156,7 +156,6 @@ typedef struct user_fpregs elf_fpregset_t;
- #endif
- #include <sys/user.h>
- #include <sys/ustat.h>
--#include <linux/cyclades.h>
- #include <linux/if_eql.h>
- #include <linux/if_plip.h>
- #include <linux/lp.h>
-@@ -439,7 +438,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
- 
- #if SANITIZER_LINUX && !SANITIZER_ANDROID
-   unsigned struct_ax25_parms_struct_sz = sizeof(struct ax25_parms_struct);
--  unsigned struct_cyclades_monitor_sz = sizeof(struct cyclades_monitor);
- #if EV_VERSION > (0x010000)
-   unsigned struct_input_keymap_entry_sz = sizeof(struct input_keymap_entry);
- #else
-@@ -806,15 +804,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
- #endif // SANITIZER_LINUX || SANITIZER_FREEBSD
- 
- #if SANITIZER_LINUX && !SANITIZER_ANDROID
--  unsigned IOCTL_CYGETDEFTHRESH = CYGETDEFTHRESH;
--  unsigned IOCTL_CYGETDEFTIMEOUT = CYGETDEFTIMEOUT;
--  unsigned IOCTL_CYGETMON = CYGETMON;
--  unsigned IOCTL_CYGETTHRESH = CYGETTHRESH;
--  unsigned IOCTL_CYGETTIMEOUT = CYGETTIMEOUT;
--  unsigned IOCTL_CYSETDEFTHRESH = CYSETDEFTHRESH;
--  unsigned IOCTL_CYSETDEFTIMEOUT = CYSETDEFTIMEOUT;
--  unsigned IOCTL_CYSETTHRESH = CYSETTHRESH;
--  unsigned IOCTL_CYSETTIMEOUT = CYSETTIMEOUT;
-   unsigned IOCTL_EQL_EMANCIPATE = EQL_EMANCIPATE;
-   unsigned IOCTL_EQL_ENSLAVE = EQL_ENSLAVE;
-   unsigned IOCTL_EQL_GETMASTRCFG = EQL_GETMASTRCFG;
-diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
-index b6f90eb3a74..ae3a938344d 100644
---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
-+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
-@@ -949,7 +949,6 @@ struct __sanitizer_cookie_io_functions_t {
- 
- #if SANITIZER_LINUX && !SANITIZER_ANDROID
-   extern unsigned struct_ax25_parms_struct_sz;
--  extern unsigned struct_cyclades_monitor_sz;
-   extern unsigned struct_input_keymap_entry_sz;
-   extern unsigned struct_ipx_config_data_sz;
-   extern unsigned struct_kbdiacrs_sz;
-@@ -1294,15 +1293,6 @@ struct __sanitizer_cookie_io_functions_t {
- #endif  // SANITIZER_LINUX || SANITIZER_FREEBSD
- 
- #if SANITIZER_LINUX && !SANITIZER_ANDROID
--  extern unsigned IOCTL_CYGETDEFTHRESH;
--  extern unsigned IOCTL_CYGETDEFTIMEOUT;
--  extern unsigned IOCTL_CYGETMON;
--  extern unsigned IOCTL_CYGETTHRESH;
--  extern unsigned IOCTL_CYGETTIMEOUT;
--  extern unsigned IOCTL_CYSETDEFTHRESH;
--  extern unsigned IOCTL_CYSETDEFTIMEOUT;
--  extern unsigned IOCTL_CYSETTHRESH;
--  extern unsigned IOCTL_CYSETTIMEOUT;
-   extern unsigned IOCTL_EQL_EMANCIPATE;
-   extern unsigned IOCTL_EQL_ENSLAVE;
-   extern unsigned IOCTL_EQL_GETMASTRCFG;
--- 
-2.31.1
-
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 2b7f88154e..aa2665cbee 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -3,7 +3,6 @@ comment "GCC Options"
 choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_ARC if BR2_arc
-	default BR2_GCC_VERSION_CSKY if BR2_csky
 	default BR2_GCC_VERSION_POWERPC_SPE if BR2_powerpc_SPE
 	default BR2_GCC_VERSION_10_X
 	help
@@ -15,12 +14,6 @@ config BR2_GCC_VERSION_ARC
 	depends on BR2_arc
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 
-config BR2_GCC_VERSION_CSKY
-	bool "gcc csky"
-	# Only supported architecture
-	depends on BR2_csky
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
-
 config BR2_GCC_VERSION_POWERPC_SPE
 	bool "gcc powerpc spe"
 	# powerpc spe support has been deprecated since gcc 8.x.
@@ -57,10 +50,6 @@ config BR2_GCC_VERSION_11_X
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_powerpc_SPE
-	# C-SKY sk610 needs abiv1, which is not supported in
-	# upstream gcc. C-SKY gcc upstream support not tested
-	# with upstream binutils and glibc.
-	depends on !BR2_csky
 	# uClibc-ng broken on sparc due to recent gcc changes
 	# that need to be reverted since gcc 8.4, 9.3 and 10.1.
 	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
@@ -94,7 +83,6 @@ config BR2_GCC_VERSION
 	default "10.3.0"    if BR2_GCC_VERSION_10_X
 	default "11.2.0"    if BR2_GCC_VERSION_11_X
 	default "arc-2020.09-release" if BR2_GCC_VERSION_ARC
-	default "48152afb96c59733d5bc79e3399bb7b3d4b44266" if BR2_GCC_VERSION_CSKY
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index b37307ebe3..5655c7a9d7 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -11,5 +11,3 @@ sha512  d53a0a966230895c54f01aea38696f818817b505f1e2bfa65e508753fcd01b2aedb4a614
 sha512  b0853e2b1c5998044392023fa653e399e74118c46e616504ac59e1a2cf27620f94434767ce06b6cf4ca3dfb57f81d6eda92752befaf095ea5e564a9181b4659c  gcc-arc-2020.09-release.tar.gz
 # Locally calculated (fetched from Github)
 sha512  2de7cf47333a4092b02d3bb98f4206f14966f1d139a724d09cf3b22f8a43ae0c704f33e6477d6367a03c29b265480dc900169e9d417006c5d46f0ae446b8c6f1  gcc-or1k-musl-5.4.0-20170218.tar.gz
-# Locally calculated (fetched from https://github.com/c-sky/gcc)
-sha512  1c3564fd6573dce13451a73015e7d88fecbb214dc1df96607976255b1d8b9e60318405333f4f218eea8d07e3675a802b66eff6df3921d505c4036481512792c2  gcc-48152afb96c59733d5bc79e3399bb7b3d4b44266.tar.gz
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index ed9b93e50f..fcc352aa25 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -13,9 +13,6 @@ GCC_VERSION = $(call qstrip,$(BR2_GCC_VERSION))
 ifeq ($(BR2_GCC_VERSION_ARC),y)
 GCC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,gcc,$(GCC_VERSION))
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
-else ifeq ($(BR2_GCC_VERSION_CSKY),y)
-GCC_SITE = $(call github,c-sky,gcc,$(GCC_VERSION))
-GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
 else
 GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.xz
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
