Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4F3C5B572
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 21:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5362180CC2;
	Sat, 22 Aug 2026 21:13:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rbVl3PmvrnJ8; Sat, 22 Aug 2026 21:13:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787433209;
	bh=osei5HP6bl7tnLJ1DcCmZZN1ql5KR78i+CPjnjoBDWo=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=gvhBt3V7jLi23+oU4UKZGiJT5iaV8PNhDjLfVwS5NMGbQ8WkEniXUKhkotjbqhVEP
	 Zd/csMWPhVQVfjtcZKrqUwWDPUl/PIJgJX1MAdM7cWF5bNUTgcHpiQZ3rP8QwkaWoj
	 NS7vJxKIi17kYsZP8bRMe5P4RMbb6GekvDuyn5nLUpAF3QseolwwHF00WjNftOlHpP
	 y+G/tSTZpgIZnalVJaSLAZFq50BXNXXmGeg9m9JR9cjCPn9fHVWRshqsG5/lJGHckH
	 Fn9KPuAmuiiZ79q5tJIdUF78kFHKNaUeE/cl2PZcr21SrSxxaOnjGP9/+18xRMLlR3
	 3S+y+Ma9fJpNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DC5680DBC;
	Sat, 22 Aug 2026 21:13:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A09C29B
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 21:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8045B80C92
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 21:13:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 57WQDDCo5Ph7 for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 21:13:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 16E0D809D3
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 21:13:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 435C74E41349
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 21:13:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 094AE604C4
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 21:13:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1866F11C77C4D; 
 Sat, 22 Aug 2026 23:13:15 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Aug 2026 23:13:10 +0200
Message-ID: <20260822211311.2128659-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/enscript: fix build issue with musl and
 gcc >= 15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

enscript currently fails to build with musl with gcc >= 15. In order
to fix this, we need to bring a number of patches from upstream, and
add 2 others that were submitted upstream.

From upstream, we bring
0002-Add-CFLAG-std-c89-so-it-compiles-with-the-old-standa.patch, which
switches to -std=c89 to get the compiler back to "old" behavior.

However, as this commit patches configure.ac, we need to autoreconf,
but autoreconf is broken, so we also take
0003-Automake-1.12-and-up-no-longer-supports-pre-ANSI.patch from
upstream, which drops a problematic autoconf macro.

However, once you drop this problematic autoconf macro, the PROTOTYPES
define is never set by anything, causing the __P macro to no longer be
defined properly. This is fixed by
0004-Fix-prototype-detection-when-__STDC__-is-defined-but.patch that
we have submitted upstream.

Once you're there, you realize that switching to -std=c89 has the side
effect that musl's <limits.h> no longer defines PATH_MAX, because it
needs one of:

  #if defined(_POSIX_SOURCE) || defined(_POSIX_C_SOURCE) \
   || defined(_XOPEN_SOURCE) || defined(_GNU_SOURCE) || defined(_BSD_SOURCE)

and a side effect of -std=c89 is that none of these is defined
anymore. So we introduce 0005-Use-std-gnu89-instead-of-std-c89.patch,
which switches to -std=gnu89. This patch has also been submitted
upstream.

With all of these efforts, we get a successful build on musl with gcc
>= 15.

This commit needs to be backported to Buildroot versions that support
gcc 15.x, so that means the currently maintained 2026.x branches, but
not 2025.02 as only up to gcc 14.x was supported then.

Fixes:

  https://autobuild.buildroot.org/results/d39d14bbbb3a51d67fe962b877c7f66ff1204ecf/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Note: when there's something as atrocious as
https://cgit.git.savannah.gnu.org/cgit/enscript.git/tree/update-install.sh
in the project's official upstream repo, it's a sign the project is
quite badly maintained...
---
 ...9-so-it-compiles-with-the-old-standa.patch |  29 +++++
 package/enscript/0002-enscript-c23.patch      |  19 ----
 ...2-and-up-no-longer-supports-pre-ANSI.patch |  28 +++++
 ...tection-when-__STDC__-is-defined-but.patch | 107 ++++++++++++++++++
 ...005-Use-std-gnu89-instead-of-std-c89.patch |  35 ++++++
 package/enscript/enscript.mk                  |   4 +
 6 files changed, 203 insertions(+), 19 deletions(-)
 create mode 100644 package/enscript/0002-Add-CFLAG-std-c89-so-it-compiles-with-the-old-standa.patch
 delete mode 100644 package/enscript/0002-enscript-c23.patch
 create mode 100644 package/enscript/0003-Automake-1.12-and-up-no-longer-supports-pre-ANSI.patch
 create mode 100644 package/enscript/0004-Fix-prototype-detection-when-__STDC__-is-defined-but.patch
 create mode 100644 package/enscript/0005-Use-std-gnu89-instead-of-std-c89.patch

diff --git a/package/enscript/0002-Add-CFLAG-std-c89-so-it-compiles-with-the-old-standa.patch b/package/enscript/0002-Add-CFLAG-std-c89-so-it-compiles-with-the-old-standa.patch
new file mode 100644
index 0000000000..a75454af7b
--- /dev/null
+++ b/package/enscript/0002-Add-CFLAG-std-c89-so-it-compiles-with-the-old-standa.patch
@@ -0,0 +1,29 @@
+From c0c7e9ad51b2e9aebea46f0179446fcf896f8d63 Mon Sep 17 00:00:00 2001
+From: Wim Stockman <wimstockman@gmail.com>
+Date: Fri, 20 Feb 2026 10:51:37 +0100
+Subject: [PATCH] Add CFLAG=-std=c89 so it compiles with the old standard,
+ modern standard gives problems
+
+Upstream: https://git.savannah.gnu.org/cgit/enscript.git/commit/?id=111ad375a6e598c896441e10f4cf1e2fc1496c42
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ configure.ac | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 465100a..b867912 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -10,6 +10,9 @@ AC_PROG_INSTALL
+ 
+ AC_PROG_CC
+ 
++# Force C89 standard and fix modern GCC global variable handling
++CFLAGS="$CFLAGS -std=c89"
++
+ AC_USE_SYSTEM_EXTENSIONS
+ AM_C_PROTOTYPES
+ 
+-- 
+2.55.0
+
diff --git a/package/enscript/0002-enscript-c23.patch b/package/enscript/0002-enscript-c23.patch
deleted file mode 100644
index 707674935d..0000000000
--- a/package/enscript/0002-enscript-c23.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Fix build with gcc 15.x
-
-Upstream: https://savannah.gnu.org/bugs/?66845
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-
-diff --git a/compat/regex.c b/compat/regex.c
-index c6907f3..87f2840 100644
---- a/compat/regex.c
-+++ b/compat/regex.c
-@@ -336,7 +336,7 @@ typedef char boolean;
- #define false 0
- #define true 1
- 
--static int re_match_2_internal ();
-+static int re_match_2_internal (struct re_pattern_buffer*, const char*, int, const char*, int, int, struct re_registers*, int);
- 
- /* These are the command codes that appear in compiled regular
-    expressions.  Some opcodes are followed by argument bytes.  A
diff --git a/package/enscript/0003-Automake-1.12-and-up-no-longer-supports-pre-ANSI.patch b/package/enscript/0003-Automake-1.12-and-up-no-longer-supports-pre-ANSI.patch
new file mode 100644
index 0000000000..241c87493f
--- /dev/null
+++ b/package/enscript/0003-Automake-1.12-and-up-no-longer-supports-pre-ANSI.patch
@@ -0,0 +1,28 @@
+From d74ef70aec3fe9e5e27468f31532eb41188707cf Mon Sep 17 00:00:00 2001
+From: Werner Fink <werner@suse.de>
+Date: Tue, 23 Jan 2018 15:26:45 +0100
+Subject: [PATCH] Automake 1.12 and up no longer supports pre-ANSI
+
+Signed-off-by: Werner Fink <werner@suse.de>
+Signed-off-by: James Cloos <cloos@jhcloos.com>
+Upstream: https://git.savannah.gnu.org/cgit/enscript.git/commit/?id=a356d343aa9db52b75432cde927b6f9bad6a7c44
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ configure.ac | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index b867912..4431cb1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -14,7 +14,6 @@ AC_PROG_CC
+ CFLAGS="$CFLAGS -std=c89"
+ 
+ AC_USE_SYSTEM_EXTENSIONS
+-AM_C_PROTOTYPES
+ 
+ AC_C_CONST
+ AC_FUNC_ALLOCA
+-- 
+2.55.0
+
diff --git a/package/enscript/0004-Fix-prototype-detection-when-__STDC__-is-defined-but.patch b/package/enscript/0004-Fix-prototype-detection-when-__STDC__-is-defined-but.patch
new file mode 100644
index 0000000000..e7eff1c180
--- /dev/null
+++ b/package/enscript/0004-Fix-prototype-detection-when-__STDC__-is-defined-but.patch
@@ -0,0 +1,107 @@
+From 83238ba35f966bb35a065e6d141f3ccf714f4324 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sat, 22 Aug 2026 14:50:56 +0200
+Subject: [PATCH] Fix prototype detection when __STDC__ is defined but
+ PROTOTYPES is not
+
+Commit a356d343aa9db52b75432cde927b6f9bad6a7c44 ("Automake 1.12 and up
+no longer supports pre-ANSI") dropped the AM_C_PROTOTYPES call from
+configure.ac, so PROTOTYPES is no longer defined by configure. The
+headers' fallback to K&R-style prototypes breaks compilation with
+modern compilers.
+
+Check for __STDC__ directly as a fallback, which is defined by all
+conforming C89/C99 compilers.
+
+Upstream: https://savannah.gnu.org/bugs/index.php?68633
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ afmlib/afm.h     | 2 +-
+ afmlib/afmint.h  | 2 +-
+ afmlib/strhash.h | 2 +-
+ compat/xalloc.h  | 2 +-
+ src/gsint.h      | 2 +-
+ states/defs.h    | 2 +-
+ 6 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/afmlib/afm.h b/afmlib/afm.h
+index 19855ce..a79648d 100644
+--- a/afmlib/afm.h
++++ b/afmlib/afm.h
+@@ -24,7 +24,7 @@
+ #define AFM_H
+ 
+ #ifndef ___P
+-#if PROTOTYPES
++#if defined(__STDC__) || defined(PROTOTYPES)
+ #define ___P(protos) protos
+ #else /* no PROTOTYPES */
+ #define ___P(protos) ()
+diff --git a/afmlib/afmint.h b/afmlib/afmint.h
+index 7995ae5..aee449a 100644
+--- a/afmlib/afmint.h
++++ b/afmlib/afmint.h
+@@ -34,7 +34,7 @@
+ #include <stdio.h>
+ 
+ #ifndef ___P
+-#if PROTOTYPES
++#if defined(__STDC__) || defined(PROTOTYPES)
+ #define ___P(protos) protos
+ #else /* no PROTOTYPES */
+ #define ___P(protos) ()
+diff --git a/afmlib/strhash.h b/afmlib/strhash.h
+index 938b2de..a91c0a9 100644
+--- a/afmlib/strhash.h
++++ b/afmlib/strhash.h
+@@ -24,7 +24,7 @@
+ #define STRHASH_H
+ 
+ #ifndef ___P
+-#if PROTOTYPES
++#if defined(__STDC__) || defined(PROTOTYPES)
+ #define ___P(protos) protos
+ #else /* no PROTOTYPES */
+ #define ___P(protos) ()
+diff --git a/compat/xalloc.h b/compat/xalloc.h
+index 203bcb8..fd50b68 100644
+--- a/compat/xalloc.h
++++ b/compat/xalloc.h
+@@ -28,7 +28,7 @@
+ #define XALLOC_H
+ 
+ #ifndef ___P
+-#if PROTOTYPES
++#if defined(__STDC__) || defined(PROTOTYPES)
+ #define ___P(protos) protos
+ #else /* no PROTOTYPES */
+ #define ___P(protos) ()
+diff --git a/src/gsint.h b/src/gsint.h
+index 3c2527a..001961c 100644
+--- a/src/gsint.h
++++ b/src/gsint.h
+@@ -39,7 +39,7 @@
+ #include <sys/stat.h>
+ 
+ #ifndef ___P
+-#if PROTOTYPES
++#if defined(__STDC__) || defined(PROTOTYPES)
+ #define ___P(protos) protos
+ #else /* no PROTOTYPES */
+ #define ___P(protos) ()
+diff --git a/states/defs.h b/states/defs.h
+index 2808900..63155a9 100644
+--- a/states/defs.h
++++ b/states/defs.h
+@@ -37,7 +37,7 @@
+ #include <ctype.h>
+ 
+ #ifndef ___P
+-#if PROTOTYPES
++#if defined(__STDC__) || defined(PROTOTYPES)
+ #define ___P(protos) protos
+ #else /* no PROTOTYPES */
+ #define ___P(protos) ()
+-- 
+2.55.0
+
diff --git a/package/enscript/0005-Use-std-gnu89-instead-of-std-c89.patch b/package/enscript/0005-Use-std-gnu89-instead-of-std-c89.patch
new file mode 100644
index 0000000000..4e42d75aa5
--- /dev/null
+++ b/package/enscript/0005-Use-std-gnu89-instead-of-std-c89.patch
@@ -0,0 +1,35 @@
+From be920933dbe1fb73c27fecb280200f6f06abfdc2 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sat, 22 Aug 2026 15:19:17 +0200
+Subject: [PATCH] Use -std=gnu89 instead of -std=c89
+
+-std=c89 suppresses feature test macros, which causes <limits.h> to
+not define PATH_MAX on certain C libraries (e.g. musl). Using
+-std=gnu89 enables _GNU_SOURCE and other extensions, ensuring
+PATH_MAX and other POSIX constants are available.
+
+This most notably fixes the build with the musl C library.
+
+Upstream: https://savannah.gnu.org/bugs/index.php?68634
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ configure.ac | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4431cb1..46ea59d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -11,7 +11,8 @@ AC_PROG_INSTALL
+ AC_PROG_CC
+ 
+ # Force C89 standard and fix modern GCC global variable handling
+-CFLAGS="$CFLAGS -std=c89"
++# Use GNU89 to access PATH_MAX in <limits.h>
++CFLAGS="$CFLAGS -std=gnu89"
+ 
+ AC_USE_SYSTEM_EXTENSIONS
+ 
+-- 
+2.55.0
+
diff --git a/package/enscript/enscript.mk b/package/enscript/enscript.mk
index 441ae3dad4..1eb5d6d854 100644
--- a/package/enscript/enscript.mk
+++ b/package/enscript/enscript.mk
@@ -9,6 +9,10 @@ ENSCRIPT_SITE = $(BR2_GNU_MIRROR)/enscript
 ENSCRIPT_LICENSE = GPL-3.0+
 ENSCRIPT_LICENSE_FILES = COPYING
 ENSCRIPT_CPE_ID_VENDOR = gnu
+# 0002-Add-CFLAG-std-c89-so-it-compiles-with-the-old-standa.patch
+# 0003-Automake-1.12-and-up-no-longer-supports-pre-ANSI.patch
+# 0005-Use-std-gnu89-instead-of-std-c89.patch
+ENSCRIPT_AUTORECONF = YES
 
 # Enable pthread threads if toolchain supports threads
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
