Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D76C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 04:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFBA981E94;
	Sun,  3 Dec 2023 04:19:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFBA981E94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X5GPu-6IzNUv; Sun,  3 Dec 2023 04:19:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96B9481EC9;
	Sun,  3 Dec 2023 04:19:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96B9481EC9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3831F1BF2B9
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 04:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EF7360F00
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 04:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EF7360F00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 28-P1eK46jEL for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 04:19:16 +0000 (UTC)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0491360EF9
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 04:19:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0491360EF9
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1d0538d9bbcso17494305ad.3
 for <buildroot@buildroot.org>; Sat, 02 Dec 2023 20:19:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701577154; x=1702181954;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B3tz5tPc5A0nkIZdd3nwzZ/JQen1DgIMIT7ex1+NHwA=;
 b=euvVjgQ4MdGAQiJT0Hj2RNnmcr6KN+kti87uGYVcHoJgilmdk0gg3g4ey1OFJzU2Jg
 adTzgx3MlDqHuIdKSAiN1UtHjtZMRfs7WSsJvaF2xUK+tyIxa0PvKlfys2egu5xBeQvj
 ZHprK+pbbgU6AzORXsGPCKdEDCy3jat7IEYVV0sfsLhZUc/hwx/ynGJGOkxhhWPuu0nX
 xJ2r81k8nHRM+v96QltIBfbQRKn3JLcuTvhGmayPPiRkBqdNfgm0trWYFN85qbzohTGE
 MdkzQNUGENMAMXioraxNYpFrR1U5BtgOratQ+dpGoe7TSsRmN8KqIb7B6Ye5S/wQ8ohr
 UwGQ==
X-Gm-Message-State: AOJu0YymtiOSV2gu0mRI5ehcZuXmpz6N9zrpbdEl2TBk7hys79qXQtEK
 LeLsmOJHLPOYzPMVoEHl4U3T8/bzFXC9xATg1+A=
X-Google-Smtp-Source: AGHT+IGEJQq5C1c74dC99KI9a9yngiJEJucV39JGXL7eGFk+sQMOzmHwvsBw/lbCPYCPdlw/Aj+vtw==
X-Received: by 2002:a17:902:be15:b0:1d0:6ffd:e2f0 with SMTP id
 r21-20020a170902be1500b001d06ffde2f0mr1994998pls.138.1701577154300; 
 Sat, 02 Dec 2023 20:19:14 -0800 (PST)
Received: from localhost.localdomain (75-174-247-100.bsmr.qwest.net.
 [75.174.247.100]) by smtp.gmail.com with ESMTPSA id
 j15-20020a170902da8f00b001cfc6388b5dsm5874084plx.260.2023.12.02.20.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 20:19:13 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat,  2 Dec 2023 21:18:38 -0700
Message-ID: <20231203041841.492885-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231203041841.492885-1-adam.duskett@amarulasolutions.com>
References: <20231203041841.492885-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701577154; x=1702181954;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B3tz5tPc5A0nkIZdd3nwzZ/JQen1DgIMIT7ex1+NHwA=;
 b=VuYRn359lmb6A8z/N4NBURlLncxWGDMc5CdaEqLTWitBBamw8paSWNMbLfHWI32klc
 IEoCKvrGy6caThlCAuoytNrYTX0w0ShLjkCbE3TuY3kXbBs0bHEt5156ct08KrwYgVpk
 EZ2TxDqeUmC88cAJAmFeGej5ZQtd+1RBtd5Oo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=VuYRn359
Subject: [Buildroot] [PATCH 5/6] package/google-breakpad: add
 0002-dont-include-stab.h.patch
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Pascal Huerst <pascal.huerst@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch is from openembedded. Unfortuantly, as it patches configure.ac,
we must add GOOGLE_BREAKPAD_AUTORECONF = YES to google-breakpad.mk.

We also add TestGoogleBreakPaduClibc.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 Config.in                                     |   2 +-
 .../0002-dont-include-stab.h.patch            | 103 ++++++++++++++++++
 package/google-breakpad/Config.in             |   6 +-
 package/google-breakpad/google-breakpad.mk    |   2 +
 .../tests/package/test_google_breakpad.py     |   7 ++
 5 files changed, 116 insertions(+), 4 deletions(-)
 create mode 100644 package/google-breakpad/0002-dont-include-stab.h.patch

diff --git a/Config.in b/Config.in
index 554b4062eb..27f5deb16a 100644
--- a/Config.in
+++ b/Config.in
@@ -589,7 +589,7 @@ config BR2_GOOGLE_BREAKPAD_ENABLE
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on (BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC)
 	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	select BR2_PACKAGE_GOOGLE_BREAKPAD
diff --git a/package/google-breakpad/0002-dont-include-stab.h.patch b/package/google-breakpad/0002-dont-include-stab.h.patch
new file mode 100644
index 0000000000..0817f1928f
--- /dev/null
+++ b/package/google-breakpad/0002-dont-include-stab.h.patch
@@ -0,0 +1,103 @@
+From 569af712da94637091080943f6a0d69ccb35864e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 14 Sep 2017 23:24:08 -0700
+Subject: [PATCH] don't include stab.h
+
+From openembeddeds patch found at the following path:
+meta-oe/recipes-devtools/breakpad/breakpad/0003-Dont-include-stab.h.patch
+
+  - Backported to c85eb4a59b618f3beaad5445ceb1f865ffa8efdf
+  - Added || defined(__UCLIBC__) in stabs_reader.h, as uClibc provides the
+    a.out.h file but does not include the N_* macros.
+
+Upstream: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+[Backported to c85eb4a59b618f3beaad5445ceb1f865ffa8efdf]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ configure.ac                        |  2 +-
+ src/common/stabs_reader.cc          |  2 ++
+ src/common/stabs_reader.h           | 24 ++++++++++++++++++++++++
+ src/common/stabs_reader_unittest.cc |  2 ++
+ 4 files changed, 29 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 20fb075..74aaf93 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -72,7 +72,7 @@ AC_ARG_ENABLE(m32,
+ AC_HEADER_STDC
+ AC_SYS_LARGEFILE
+ AX_PTHREAD
+-AC_CHECK_HEADERS([a.out.h sys/mman.h sys/random.h])
++AC_CHECK_HEADERS([a.out.h stab.h sys/mman.h sys/random.h])
+ AC_CHECK_FUNCS([arc4random getcontext getrandom memfd_create])
+ AM_CONDITIONAL([HAVE_GETCONTEXT], [test "x$ac_cv_func_getcontext" = xyes])
+ AM_CONDITIONAL([HAVE_MEMFD_CREATE], [test "x$ac_cv_func_memfd_create" = xyes])
+diff --git a/src/common/stabs_reader.cc b/src/common/stabs_reader.cc
+index 43c4040..d03c660 100644
+
+--- a/src/common/stabs_reader.cc
++++ b/src/common/stabs_reader.cc
+@@ -34,7 +34,9 @@
+ #include "common/stabs_reader.h"
+ 
+ #include <assert.h>
++#ifdef HAVE_STAB_H
+ #include <stab.h>
++#endif
+ #include <string.h>
+ 
+ #include <string>
+diff --git a/src/common/stabs_reader.h b/src/common/stabs_reader.h
+index 1e773f4..9154872 100644
+--- a/src/common/stabs_reader.h
++++ b/src/common/stabs_reader.h
+@@ -58,6 +58,30 @@
+ #elif defined(HAVE_A_OUT_H)
+ #include <a.out.h>
+ #endif
++// Definitions from <stab.h> and <a.out.h> for systems which
++// do not have them
++#if !defined(HAVE_A_OUT_H) || defined(__UCLIBC__)
++#undef N_UNDF
++#define N_UNDF 0x0
++#ifndef N_FUN
++#define N_FUN 0x24
++#endif
++#ifndef N_SLINE
++#define N_SLINE 0x44
++#endif
++#ifndef N_SO
++#define N_SO 0x64
++#endif
++#ifndef N_LSYM
++#define N_LSYM 0x80
++#endif
++#ifndef N_BINCL
++#define N_BINCL 0x82
++#endif
++#ifndef N_SOL
++#define N_SOL 0x84
++#endif
++#endif
+ 
+ #include <string>
+ #include <vector>
+diff --git a/src/common/stabs_reader_unittest.cc b/src/common/stabs_reader_unittest.cc
+index 24f3e1a..1a148bd 100644
+--- a/src/common/stabs_reader_unittest.cc
++++ b/src/common/stabs_reader_unittest.cc
+@@ -33,7 +33,9 @@
+ 
+ #include <assert.h>
+ #include <errno.h>
++#ifdef HAVE_STAB_H
+ #include <stab.h>
++#endif
+ #include <stdarg.h>
+ #include <stdlib.h>
+ #include <string.h>
+-- 
+2.43.0
diff --git a/package/google-breakpad/Config.in b/package/google-breakpad/Config.in
index 49d0bc06de..4320ad64aa 100644
--- a/package/google-breakpad/Config.in
+++ b/package/google-breakpad/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on (BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC)
 	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	select BR2_PACKAGE_LINUX_SYSCALL_SUPPORT
@@ -34,12 +34,12 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD
 
 	  https://chromium.googlesource.com/breakpad/breakpad
 
-comment "google-breakpad requires a glibc toolchain w/ wchar, thread, C++, gcc >= 4.8"
+comment "google-breakpad requires a glibc or uClibc toolchain w/ wchar, thread, C++, gcc >= 4.8"
 	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_USES_GLIBC || \
+		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC) || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 if BR2_PACKAGE_GOOGLE_BREAKPAD
diff --git a/package/google-breakpad/google-breakpad.mk b/package/google-breakpad/google-breakpad.mk
index 132323363b..154a5ed20e 100644
--- a/package/google-breakpad/google-breakpad.mk
+++ b/package/google-breakpad/google-breakpad.mk
@@ -12,6 +12,8 @@ GOOGLE_BREAKPAD_LICENSE = BSD-3-Clause, MIT
 GOOGLE_BREAKPAD_LICENSE_FILES = LICENSE
 GOOGLE_BREAKPAD_DEPENDENCIES = host-google-breakpad linux-syscall-support
 
+# Patching configure.ac
+GOOGLE_BREAKPAD_AUTORECONF = YES
 HOST_GOOGLE_BREAKPAD_DEPENDENCIES = host-linux-syscall-support
 
 ifeq ($(BR2_PACKAGE_GOOGLE_BREAKPAD_TOOLS),)
diff --git a/support/testing/tests/package/test_google_breakpad.py b/support/testing/tests/package/test_google_breakpad.py
index 646bdf6ee3..4d791bb79b 100644
--- a/support/testing/tests/package/test_google_breakpad.py
+++ b/support/testing/tests/package/test_google_breakpad.py
@@ -48,3 +48,10 @@ class TestGoogleBreakPadGlibC(GoogelBreakPadBase):
 
     def test_run(self):
         self.check_google_breakpad()
+
+
+class TestGoogleBreakPaduClibc(GoogelBreakPadBase):
+    config = GoogelBreakPadBase.config + "BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE=y"
+
+    def test_run(self):
+        self.check_google_breakpad()
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
