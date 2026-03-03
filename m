Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC3CEDEBEF
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 20:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D84380F69;
	Tue,  3 Mar 2026 20:03:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZ7msFH7AhVk; Tue,  3 Mar 2026 20:03:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EADC80F72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772568235;
	bh=Sz2K8aTb/F+UL9FYIRg+w+ZHWd6TI2zus+kt55bHfM0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lWapySbWjZcJ9AFR3ObLGdn6vdBT3YqbCk3L+VxHYY/LsnpUGCSPmjqWvbDnV6i43
	 iVQVk1+wsMhzzGiTvWO5QSZllutk7WyEbw/C3/OgBk+iIGUJaMLBPm5p7XcI7lfR3p
	 sdmcJKgrmp7yczKBAfRliX96EbhOpRLcTtYn5khwnh7Et2OS7/fe4dUbH7XoTk+fA+
	 EEu69+9qc9AA3OxLLs1FoZumJw36z22VTxeaEG+qhx9jRQpXMgOvmyo4yesuRGamBm
	 olqStW4WHxwdfUZ2l1kXMJMPlmh+qGIhmURyi+usYtD7DRTyheiuihI0U9CXJwsbsR
	 +fgP9JKJnn4zQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EADC80F72;
	Tue,  3 Mar 2026 20:03:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AC9EE25B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92E2880F72
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:03:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i3qc6N0ieh-h for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 20:03:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 86DFA80F69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86DFA80F69
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86DFA80F69
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:03:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04ca.dip0.t-ipconnect.de [91.58.4.202])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 367D1A4C3429;
 Tue,  3 Mar 2026 21:01:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53148)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vxVvM-000000003gI-2FlJ;
 Tue, 03 Mar 2026 20:00:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  3 Mar 2026 21:00:53 +0100
Message-ID: <20260303200054.784253-15-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260303200054.784253-1-bernd@kuhls.net>
References: <20260303200054.784253-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772568063;
 bh=BXg2T77neW2kQFdD8KXqCi4to/hAONApBAsyim4RNS4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=vV/GeipzbxKZCrF6OVxbzbhrCgShdR9BTLTFpG4wFsM+U6Nc039zWjvRueCHyI1uy
 NaVcQWDbDKJvT404RZrqum/1feJkLYJC1/iPqpmu6h6WJAX0U8Fh9LeAFRMdNv2a/j
 TCt2QSHA52Iy2dXTqKhVc7aHwRyZBZM4iJ9f/gGcis18ym5SOPmiz/+rwef+8AGdh/
 rCpFeQ+wyZJF3p/DzA84cBgL0EjjSv80ysDC5xYNgNZp0WdH0ZG/bcSPMK18Je6HCE
 G2o0GIiaxj5ITzYouPHOESef2A9pSymxRsmTdXCVyAIlD2WwY426Gu5JwmyrQWiyGz
 Prj+0X3pc03NQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=vV/Geipz
Subject: [Buildroot] [PATCH/next 14/14] package/{glibc,
 localedef}: bump version to 2.43
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
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Pieter De Gendt <pieter.degendt@gmail.com>, Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://sourceware.org/glibc/wiki/Release/2.43

Updated license files and hashes due to upstream commit:
https://sourceware.org/git/?p=glibc.git;a=commit;h=a0ce8b0779e290596e99ca6d96c301684a2d7cfe

Rebased package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch

Removed patch 0003 to fix build on hosts with glibc < 2.43.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/glibc/glibc.hash                      |  6 +--
 package/glibc/glibc.mk                        |  4 +-
 ...y-on-GCC-to-4.8-and-binutils-to-2.24.patch |  4 +-
 ...3_SOURCE-undefined-to-build-localede.patch | 37 -------------------
 package/localedef/localedef.mk                |  2 +-
 5 files changed, 9 insertions(+), 44 deletions(-)
 delete mode 100644 package/localedef/0003-HACK-keep-_ISOC23_SOURCE-undefined-to-build-localede.patch

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 0a11cfdb5e..ed6d69acc2 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,7 +1,7 @@
 # Locally calculated (fetched from git)
-sha256  737e3b2bfee2e3e209e514133f4ff7d2bef0d0dc903fd46b4e2244f6c998f7b2  glibc-2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125-git4.tar.gz
+sha256  5e21722755f466d15770574788394a4abb4fb1e02603a707beeb199706a26a46  glibc-2.43-10-gc3ceb93dc4f67253037644dc8f194831e27f3160-git4.tar.gz
 
 # Hashes for license files
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
+sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
+sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LESSERv2
 sha256  b22a69aa3f80a5201818c66cb0df0f25f9fa13cf5861b0093a058dbd12d50dce  LICENSES
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 80d21b86ed..64a2c58377 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,12 +7,12 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125
+GLIBC_VERSION = 2.43-10-gc3ceb93dc4f67253037644dc8f194831e27f3160
 GLIBC_SITE = https://sourceware.org/git/glibc.git
 GLIBC_SITE_METHOD = git
 
 GLIBC_LICENSE = GPL-2.0+ (programs), LGPL-2.1+, BSD-3-Clause, MIT (library)
-GLIBC_LICENSE_FILES = COPYING COPYING.LIB LICENSES
+GLIBC_LICENSE_FILES = COPYINGv2 COPYING.LESSERv2 LICENSES
 GLIBC_CPE_ID_VENDOR = gnu
 
 # Extract the base version (e.g. 2.38) from GLIBC_VERSION in order to
diff --git a/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch b/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
index cc11c9a08c..7b19542f7e 100644
--- a/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
+++ b/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
@@ -30,6 +30,8 @@ Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
 [yann.morin.1998@free.fr: rebase for 2.39]
 Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+[Bernd: rebase on 2.43]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  configure | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
@@ -51,7 +53,7 @@ index 180e49d95b..fdb19d1d27 100755
  main (void)
  {
  
--#if !defined __GNUC__ || __GNUC__ < 12 || (__GNUC__ == 12 && __GNUC_MINOR__ < 1)
+-#if (!defined __GNUC__ || __GNUC__ < 12 || (__GNUC__ == 12 && __GNUC_MINOR__ < 1)) && (!defined __clang__ || __clang_major__ < 18)
 +#if !defined __GNUC__ || __GNUC__ < 4 || (__GNUC__ == 4 && __GNUC_MINOR__ < 8)
  #error insufficient compiler
  #endif
diff --git a/package/localedef/0003-HACK-keep-_ISOC23_SOURCE-undefined-to-build-localede.patch b/package/localedef/0003-HACK-keep-_ISOC23_SOURCE-undefined-to-build-localede.patch
deleted file mode 100644
index 5c3803d583..0000000000
--- a/package/localedef/0003-HACK-keep-_ISOC23_SOURCE-undefined-to-build-localede.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From c01b78e37885c7c4a191f752dc346c848d73b731 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sat, 9 Sep 2023 23:58:50 +0200
-Subject: [PATCH] HACK: keep _ISOC23_SOURCE undefined to build localedef
- with old glibc
-
-Fixes:
-host-localedef-2.38-13-g92201f16cbcfd9eafe314ef6654be2ea7ba25675/build/locale/ld-ctype.o: in function `ctype_read':
-ld-ctype.c:(.text+0x6cef): undefined reference to `__isoc23_strtoul'
-
-Upstream: Not applicable
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
-[Thomas: adapted to glibc 2.40, which required the logic to be changed
-to _ISOC23_SOURCE]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- include/features.h | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/include/features.h b/include/features.h
-index 8515b06b36..9abd65af93 100644
---- a/include/features.h
-+++ b/include/features.h
-@@ -217,9 +217,7 @@
- # undef  _ISOC11_SOURCE
- # define _ISOC11_SOURCE	1
- # undef  _ISOC23_SOURCE
--# define _ISOC23_SOURCE	1
- # undef  _ISOC2Y_SOURCE
--# define _ISOC2Y_SOURCE	1
- # undef  _POSIX_SOURCE
- # define _POSIX_SOURCE	1
- # undef  _POSIX_C_SOURCE
--- 
-2.50.1
-
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 4da110417a..aa746a9d70 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125
+LOCALEDEF_VERSION = 2.43-10-gc3ceb93dc4f67253037644dc8f194831e27f3160
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://sourceware.org/git/glibc.git
 LOCALEDEF_SITE_METHOD = git
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
