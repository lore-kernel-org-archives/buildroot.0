Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A19C54E41
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 08:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 900BE83211;
	Sun,  3 Mar 2024 08:33:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CzrqxkSwqc1E; Sun,  3 Mar 2024 08:33:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88B6E83252
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88B6E83252;
	Sun,  3 Mar 2024 08:33:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3DD941BF8B4
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 08:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B2E360A47
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 08:33:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DTqyVIvnhvx2 for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 08:33:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6A8BE608DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A8BE608DB
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A8BE608DB
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 08:33:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 3DA51E0007;
 Sun,  3 Mar 2024 08:33:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun,  3 Mar 2024 09:33:13 +0100
Message-ID: <20240303083314.156042-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240303083314.156042-1-thomas.petazzoni@bootlin.com>
References: <20240303083314.156042-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1709454798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QnEDIfAOESOyldmxRPoVpxaa+ierwB0Yv/3i0xx+bo4=;
 b=nK+82l9o0rKnV5UQ0GLsHA8JxtvpmU3cl0yf9fW88dGU34QHrFWsbxcsbIBIi9VpPf/s8W
 751vvprFzssOvIeW3zuT2EpREBS4RiEIhqB8/h78gVnqUC2aKs1aKfs/YTBEQt6+x5F80f
 p9TKZvdc7y1fQba61EonN2TolXo9n4kZwP+tIaAtaD6zoibrNzapM1hVq36aqAr18kV6Sh
 nIAe3jOgyhxIeBfZmgJKBlFZ+9/1xXvEDbE/Y6Jyebsbave97lVNX5Pw7G4AxcfQ30IsA8
 1xn545I3D17ET/GCcK/wuAQY1Ha9V9D0HXrRtRXVKVDATDJo62yIgCViCSSKBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nK+82l9o
Subject: [Buildroot] [PATCH next 2/2] package/glibc: bump to 2.39
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The 3 patches we had have all been merged upstream as of 2.39, so they
can be dropped.

The libcrypt library is gone from glibc, and therefore the
--enable-crypt option is also gone.

The LICENSES file has changed with the addition of a copyright notice
from IBM (some files contributed by IBM have been relicensed), and the
license is MIT, which is already listed in GLIBC_LICENSES, so no
changes are needed on our side.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...d-with-mcpu-68040-or-higher-BZ-30740.patch | 57 ------------
 ...shift-and-__mpn_rshift-for-non-68020.patch | 47 ----------
 ...ALE_AVAILABLE-on-__mpn_lshift-and-__.patch | 93 -------------------
 package/glibc/glibc.hash                      |  4 +-
 package/glibc/glibc.mk                        |  5 +-
 5 files changed, 4 insertions(+), 202 deletions(-)
 delete mode 100644 package/glibc/0001-m68k-Fix-build-with-mcpu-68040-or-higher-BZ-30740.patch
 delete mode 100644 package/glibc/0002-m68k-fix-__mpn_lshift-and-__mpn_rshift-for-non-68020.patch
 delete mode 100644 package/glibc/0003-m68k-Use-M68K_SCALE_AVAILABLE-on-__mpn_lshift-and-__.patch

diff --git a/package/glibc/0001-m68k-Fix-build-with-mcpu-68040-or-higher-BZ-30740.patch b/package/glibc/0001-m68k-Fix-build-with-mcpu-68040-or-higher-BZ-30740.patch
deleted file mode 100644
index 61f48e5893..0000000000
--- a/package/glibc/0001-m68k-Fix-build-with-mcpu-68040-or-higher-BZ-30740.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From b85880633f69b737050c22eede858f8c13bb2248 Mon Sep 17 00:00:00 2001
-From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
-Date: Fri, 18 Aug 2023 14:59:51 -0300
-Subject: [PATCH] m68k: Fix build with -mcpu=68040 or higher (BZ 30740)
-
-GCC currently does not define __mc68020__ for -mcpu=68040 or higher,
-which memcpy/memmove assumptions.  Since this memory copy optimization
-seems only intended for m68020, disable for other m680X0 variants.
-
-Checked on a build for m68k-linux-gnu target mc68020 and mc68040.
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=b85880633f69b737050c22eede858f8c13bb2248
----
- sysdeps/m68k/m680x0/m68020/wordcopy.S |  1 -
- sysdeps/m68k/wordcopy.c               | 21 +++++++++++++++++++++
- 2 files changed, 21 insertions(+), 1 deletion(-)
- delete mode 100644 sysdeps/m68k/m680x0/m68020/wordcopy.S
- create mode 100644 sysdeps/m68k/wordcopy.c
-
-diff --git a/sysdeps/m68k/m680x0/m68020/wordcopy.S b/sysdeps/m68k/m680x0/m68020/wordcopy.S
-deleted file mode 100644
-index 4fb1a4518f..0000000000
---- a/sysdeps/m68k/m680x0/m68020/wordcopy.S
-+++ /dev/null
-@@ -1 +0,0 @@
--/* Empty, not needed.  */
-diff --git a/sysdeps/m68k/wordcopy.c b/sysdeps/m68k/wordcopy.c
-new file mode 100644
-index 0000000000..f12d5b7803
---- /dev/null
-+++ b/sysdeps/m68k/wordcopy.c
-@@ -0,0 +1,21 @@
-+/* Definitions for memory copy functions.  Motorola 680X0 version
-+   Copyright (C) 2023 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library.  If not, see
-+   <https://www.gnu.org/licenses/>.  */
-+
-+#ifndef __mc68020__
-+# include <string/wordcopy.c>
-+#endif
--- 
-2.39.2
-
diff --git a/package/glibc/0002-m68k-fix-__mpn_lshift-and-__mpn_rshift-for-non-68020.patch b/package/glibc/0002-m68k-fix-__mpn_lshift-and-__mpn_rshift-for-non-68020.patch
deleted file mode 100644
index 256da58d66..0000000000
--- a/package/glibc/0002-m68k-fix-__mpn_lshift-and-__mpn_rshift-for-non-68020.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 464fd8249e8b791248cab7b0e0cd91757435fa9e Mon Sep 17 00:00:00 2001
-From: Andreas Schwab <schwab@linux-m68k.org>
-Date: Thu, 17 Aug 2023 17:15:34 +0200
-Subject: [PATCH] m68k: fix __mpn_lshift and __mpn_rshift for non-68020
-
-From revision 03f3d275d0d6 in the gmp repository.
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=464fd8249e8b791248cab7b0e0cd91757435fa9e
----
- sysdeps/m68k/m680x0/lshift.S | 4 ++--
- sysdeps/m68k/m680x0/rshift.S | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/sysdeps/m68k/m680x0/lshift.S b/sysdeps/m68k/m680x0/lshift.S
-index 2aee10348e..4240738959 100644
---- a/sysdeps/m68k/m680x0/lshift.S
-+++ b/sysdeps/m68k/m680x0/lshift.S
-@@ -77,8 +77,8 @@ L(Lnormal:)
- #else /* not mc68000 */
- 	movel	R(s_size),R(d0)
- 	asll	#2,R(d0)
--	addl	R(s_size),R(s_ptr)
--	addl	R(s_size),R(res_ptr)
-+	addl	R(d0),R(s_ptr)
-+	addl	R(d0),R(res_ptr)
- #endif
- 	movel	MEM_PREDEC(s_ptr),R(d2)
- 	movel	R(d2),R(d0)
-diff --git a/sysdeps/m68k/m680x0/rshift.S b/sysdeps/m68k/m680x0/rshift.S
-index d16bca9307..d56a2b4a44 100644
---- a/sysdeps/m68k/m680x0/rshift.S
-+++ b/sysdeps/m68k/m680x0/rshift.S
-@@ -127,8 +127,8 @@ L(Lspecial:)
- #else /* not mc68000 */
- 	movel	R(s_size),R(d0)
- 	asll	#2,R(d0)
--	addl	R(s_size),R(s_ptr)
--	addl	R(s_size),R(res_ptr)
-+	addl	R(d0),R(s_ptr)
-+	addl	R(d0),R(res_ptr)
- #endif
- 
- 	clrl	R(d0)			/* initialize carry */
--- 
-2.39.2
-
diff --git a/package/glibc/0003-m68k-Use-M68K_SCALE_AVAILABLE-on-__mpn_lshift-and-__.patch b/package/glibc/0003-m68k-Use-M68K_SCALE_AVAILABLE-on-__mpn_lshift-and-__.patch
deleted file mode 100644
index 2ea190eb5a..0000000000
--- a/package/glibc/0003-m68k-Use-M68K_SCALE_AVAILABLE-on-__mpn_lshift-and-__.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From 87ced255bdf2681f5bf6c89d7121e59f6f342161 Mon Sep 17 00:00:00 2001
-From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
-Date: Fri, 18 Aug 2023 14:49:31 -0300
-Subject: [PATCH] m68k: Use M68K_SCALE_AVAILABLE on __mpn_lshift and
- __mpn_rshift
-
-This patch adds a new macro, M68K_SCALE_AVAILABLE, similar to gmp
-scale_available_p (mpn/m68k/m68k-defs.m4) that expand to 1 if a
-scale factor can be used in addressing modes.  This is used
-instead of __mc68020__ for some optimization decisions.
-
-Checked on a build for m68k-linux-gnu target mc68020 and mc68040.
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=87ced255bdf2681f5bf6c89d7121e59f6f342161
----
- sysdeps/m68k/m680x0/lshift.S | 6 +++---
- sysdeps/m68k/m680x0/rshift.S | 8 ++++----
- sysdeps/m68k/m680x0/sysdep.h | 7 +++++++
- 3 files changed, 14 insertions(+), 7 deletions(-)
-
-diff --git a/sysdeps/m68k/m680x0/lshift.S b/sysdeps/m68k/m680x0/lshift.S
-index 4240738959..74de90380b 100644
---- a/sysdeps/m68k/m680x0/lshift.S
-+++ b/sysdeps/m68k/m680x0/lshift.S
-@@ -57,9 +57,9 @@ ENTRY(__mpn_lshift)
- 	bne	L(Lnormal)
- 	cmpl	R(s_ptr),R(res_ptr)
- 	bls	L(Lspecial)		/* jump if s_ptr >= res_ptr */
--#if (defined (__mc68020__) || defined (__NeXT__) || defined(mc68020))
-+#if M68K_SCALE_AVAILABLE
- 	lea	MEM_INDX1(s_ptr,s_size,l,4),R(a2)
--#else /* not mc68020 */
-+#else
- 	movel	R(s_size),R(d0)
- 	asll	#2,R(d0)
- 	lea	MEM_INDX(s_ptr,d0,l),R(a2)
-@@ -71,7 +71,7 @@ L(Lnormal:)
- 	moveql	#32,R(d5)
- 	subl	R(cnt),R(d5)
- 
--#if (defined (__mc68020__) || defined (__NeXT__) || defined(mc68020))
-+#if M68K_SCALE_AVAILABLE
- 	lea	MEM_INDX1(s_ptr,s_size,l,4),R(s_ptr)
- 	lea	MEM_INDX1(res_ptr,s_size,l,4),R(res_ptr)
- #else /* not mc68000 */
-diff --git a/sysdeps/m68k/m680x0/rshift.S b/sysdeps/m68k/m680x0/rshift.S
-index d56a2b4a44..d398d0287e 100644
---- a/sysdeps/m68k/m680x0/rshift.S
-+++ b/sysdeps/m68k/m680x0/rshift.S
-@@ -56,9 +56,9 @@ ENTRY(__mpn_rshift)
- 	bne	L(Lnormal)
- 	cmpl	R(res_ptr),R(s_ptr)
- 	bls	L(Lspecial)		/* jump if res_ptr >= s_ptr */
--#if (defined (__mc68020__) || defined (__NeXT__) || defined(mc68020))
-+#if M68K_SCALE_AVAILABLE
- 	lea	MEM_INDX1(res_ptr,s_size,l,4),R(a2)
--#else /* not mc68020 */
-+#else
- 	movel	R(s_size),R(d0)
- 	asll	#2,R(d0)
- 	lea	MEM_INDX(res_ptr,d0,l),R(a2)
-@@ -121,10 +121,10 @@ L(Lend:)
- 
- 	cfi_restore_state
- L(Lspecial:)
--#if (defined (__mc68020__) || defined (__NeXT__) || defined(mc68020))
-+#if M68K_SCALE_AVAILABLE
- 	lea	MEM_INDX1(s_ptr,s_size,l,4),R(s_ptr)
- 	lea	MEM_INDX1(res_ptr,s_size,l,4),R(res_ptr)
--#else /* not mc68000 */
-+#else
- 	movel	R(s_size),R(d0)
- 	asll	#2,R(d0)
- 	addl	R(d0),R(s_ptr)
-diff --git a/sysdeps/m68k/m680x0/sysdep.h b/sysdeps/m68k/m680x0/sysdep.h
-index b31e101273..bee5b3391c 100644
---- a/sysdeps/m68k/m680x0/sysdep.h
-+++ b/sysdeps/m68k/m680x0/sysdep.h
-@@ -37,3 +37,10 @@
-   OP " " SRC "(" PC "), " DST
- 
- #endif	/* __ASSEMBLER__ */
-+
-+# if defined __mc68020__ || defined __mc68030__ || defined __mc68040__	      \
-+     || defined __mc68060__
-+#  define M68K_SCALE_AVAILABLE 1
-+# else
-+#  define M68K_SCALE_AVAILABLE 0
-+# endif
--- 
-2.39.2
-
diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 15ae55b9e6..94b7819a30 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,7 +1,7 @@
 # Locally calculated (fetched from Github)
-sha256  e38f4284d6909c6b5db7d79c6e450daeaf136a67e547290eec0b063a55eaaa42  glibc-2.38-44-gd37c2b20a4787463d192b32041c3406c2bd91de0.tar.gz
+sha256  2ba018b344e0e8330dcadd6130f4174f0fc2502b2e032210345e0e5a2f7ed12e  glibc-2.39-5-ge0910f1d3278f05439fb434ee528fc9be1b6bd5e.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  b33d0bd9f685b46853548814893a6135e74430d12f6d94ab3eba42fc591f83bc  LICENSES
+sha256  bba29819a3e938fae92674d6a88533e10605e389da8b51cdcba0a94f6221c5bc  LICENSES
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index d198d6f04c..96a850516f 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.38-44-gd37c2b20a4787463d192b32041c3406c2bd91de0
+GLIBC_VERSION = 2.39-5-ge0910f1d3278f05439fb434ee528fc9be1b6bd5e
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
@@ -195,7 +195,6 @@ define GLIBC_CONFIGURE_CMDS
 		--without-gd \
 		--with-headers=$(STAGING_DIR)/usr/include \
 		$(if $(BR2_aarch64)$(BR2_aarch64_be),--enable-mathvec) \
-		--enable-crypt \
 		$(GLIBC_CONF_OPTS))
 	$(GLIBC_ADD_MISSING_STUB_H)
 endef
@@ -206,7 +205,7 @@ endef
 #
 
 GLIBC_LIBS_LIB = \
-	ld*.so.* libanl.so.* libc.so.* libcrypt.so.* libdl.so.* libgcc_s.so.* \
+	ld*.so.* libanl.so.* libc.so.* libdl.so.* libgcc_s.so.* \
 	libm.so.* libpthread.so.* libresolv.so.* librt.so.* \
 	libutil.so.* libnss_files.so.* libnss_dns.so.* libmvec.so.*
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
