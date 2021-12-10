Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F88C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 11:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B69AA42310;
	Fri, 10 Dec 2021 11:56:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NKbezBG_UBdS; Fri, 10 Dec 2021 11:56:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A51FC42313;
	Fri, 10 Dec 2021 11:56:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E925B1BF59E
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 11:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D82D8852E9
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 11:56:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LAXkVLP9KEXG for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 11:56:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C124852E8
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 11:56:07 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id q3so14503220wru.5
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 03:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vs9suUvB6xYWgWPUb21xLxsMTCdK7IHw/ZCHJoBbJ+Y=;
 b=O2wddNgrA4bjcmG6ytJuMyDfufk8yoUxqrb6JvsdSnEU2JqYBmhNTjmE7WY28BI+uT
 P7kRDkQpypKf4vy1GZ9QXUKnI+RHDB6dNVLME2BtpXCdHWEZvU0mSOwnK9Z8Zt4eKCc3
 SafqP2PxEr1t+Vc1FE1PEzl/BqpCggpSU0K5LfGN3zuLv0dKnKLhhhsA8R+IS2XLvCCj
 GVyE9YQl+AJn0fY3vFVY+hr6hGiq568ToMB1Birf1RDHrGr0Ta1tGicZg6S1+IyA80YP
 RKRT3AnR0OOewudmilEZnLa3zm8jfpXZgXoJ/bXFAHeqyDhYr7dTL6RD0bx7aeBlujlX
 zFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vs9suUvB6xYWgWPUb21xLxsMTCdK7IHw/ZCHJoBbJ+Y=;
 b=54h+eRcUvDrQz5/t4vG+Iu3OjEI5ngNskDDQLVkjM1x47iqwvw5Z6GkISiTfR7TJi5
 ws1R/U0g3wiu5U3DvqGtUOR5WcY8oRKHd/twnBjQoJXH5PFA1Pz3eVMW9ROVz0X8rE4M
 hU8Y8t5qNUB3bI3DQ4UAD3Nx7plmdn36TJJsoR/OEEdKLJbtP7WWbhgPwWpTS9pTF5+o
 D8+fHyMTdvMxZqtE4fPgh4+ZOvG5s0EOKoLGwrNQZFz3Ueh4kymMNDVURqU7xZEJK4ed
 eR56L8oRQe0M6TnCmB1S2tfH0oUvYyILvvDX1ZcfNLk3YrYRTm2dY+Zzuiz0ywsN7XCE
 Xg0Q==
X-Gm-Message-State: AOAM530AehbZwjq+MeqBq1ZMXNo9TNMUPsNdETeljPNszbNDTGJ12n0/
 X+S2BwSmf/LY1LAw+1OzQkcPgP10NMfJYA==
X-Google-Smtp-Source: ABdhPJxHe19YU0xVwoSPQovvlW2mhmCijM2b0XIESMVblQt9dIYViRe63xHVz0b4mccjkB9Z9aJzeA==
X-Received: by 2002:a5d:4704:: with SMTP id y4mr13239060wrq.85.1639137365460; 
 Fri, 10 Dec 2021 03:56:05 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id d1sm2235163wrz.92.2021.12.10.03.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 03:56:05 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Fri, 10 Dec 2021 12:56:02 +0100
Message-Id: <20211210115602.1332880-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/poke: bump to version 1.4
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove upstream patches:
0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch
0002-tentatively-change-cppflags-to-omit-I-prefix-on-cros.patch

See:
http://www.jemarch.net/poke-1.4-relnotes.html

Tested:
https://gitlab.com/kubu93/buildroot/-/pipelines/426866708

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
test-pkg config:
BR2_PACKAGE_POKE=y
---
 ...ck-for-Tcl-Tk-if-disable-gui-is-spec.patch | 43 ------------
 ...2MAN-replace-by-true-when-cross-com.patch} |  6 +-
 ...ndom.c-fix-build-with-uclibc-1.0.35.patch} |  0
 ...ge-cppflags-to-omit-I-prefix-on-cros.patch | 67 -------------------
 package/poke/poke.hash                        |  2 +-
 package/poke/poke.mk                          |  5 +-
 6 files changed, 6 insertions(+), 117 deletions(-)
 delete mode 100644 package/poke/0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch
 rename package/poke/{0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch => 0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch} (88%)
 rename package/poke/{0004-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch => 0002-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch} (100%)
 delete mode 100644 package/poke/0002-tentatively-change-cppflags-to-omit-I-prefix-on-cros.patch

diff --git a/package/poke/0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch b/package/poke/0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch
deleted file mode 100644
index 3bd041a0e7..0000000000
--- a/package/poke/0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From cef3fc90f02ef4fc49515745194bac3d81a2265b Mon Sep 17 00:00:00 2001
-From: "Jose E. Marchesi" <jose.marchesi@oracle.com>
-Date: Fri, 30 Apr 2021 13:17:05 +0200
-Subject: [PATCH] build: do not check for Tcl/Tk if --disable-gui is specified
-
-2021-04-30  Jose E. Marchesi  <jemarch@gnu.org>
-
-	* configure.ac: Do not check for tcl/tk if --disable-gui is
-	specified at configure time.
-
-(cherry picked from commit 280a5e154287e43c0a40d9530a9cc658a7367a9c)
-[Romain: remove Changelog entry]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- configure.ac | 9 ++++++---
- 1 file changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index c7205513..c2f0760a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -214,12 +214,15 @@ fi
- dnl The GUI is optional, and depends on the availability of Tcl and
- dnl Tk.
- 
--POKE_TCLTK
--
- AC_ARG_ENABLE([gui],
-               AS_HELP_STRING([--enable-gui],
-                              [Enable the GUI (default is YES)]),
--              [gui_enabled=$enableval], [gui_enabled=$has_tcltk])
-+              [gui_enabled=$enableval], [gui_enabled=yes])
-+
-+if test "x$gui_enabled" = "xyes"; then
-+ POKE_TCLTK
-+ gui_enabled=$has_tcltk
-+fi
- 
- AM_CONDITIONAL([GUI], [test "x$gui_enabled" = "xyes"])
- 
--- 
-2.30.2
-
diff --git a/package/poke/0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch b/package/poke/0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
similarity index 88%
rename from package/poke/0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
rename to package/poke/0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
index f217c917f1..c169516153 100644
--- a/package/poke/0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
+++ b/package/poke/0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
@@ -1,4 +1,4 @@
-From 8ba76a5a7ce311f67890199c5595bc1f626495ad Mon Sep 17 00:00:00 2001
+From b35dadae6371c3727cac46ae5bd348b66aa411fc Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Fri, 30 Apr 2021 15:43:59 +0200
 Subject: [PATCH] configure.ac: HELP2MAN replace ':' by 'true' when
@@ -17,7 +17,7 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index c2f0760a..93769ef9 100644
+index 2c6f1aef..9c4c9be2 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -74,7 +74,7 @@ gl_LIBTEXTSTYLE_OPTIONAL([0.20.5])
@@ -30,5 +30,5 @@ index c2f0760a..93769ef9 100644
  
  dnl recfix is part of the GNU recutils suite, and is used in cfg.mk to
 -- 
-2.30.2
+2.31.1
 
diff --git a/package/poke/0004-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch b/package/poke/0002-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
similarity index 100%
rename from package/poke/0004-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
rename to package/poke/0002-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
diff --git a/package/poke/0002-tentatively-change-cppflags-to-omit-I-prefix-on-cros.patch b/package/poke/0002-tentatively-change-cppflags-to-omit-I-prefix-on-cros.patch
deleted file mode 100644
index 8fae85eb20..0000000000
--- a/package/poke/0002-tentatively-change-cppflags-to-omit-I-prefix-on-cros.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From ac9d057895f1e61f63cbecafcc3e3820fdb10f84 Mon Sep 17 00:00:00 2001
-From: Luca Saiu <positron@gnu.org>
-Date: Fri, 30 Apr 2021 22:42:57 +0200
-Subject: [PATCH] tentatively change --cppflags to omit -I prefix on
- cross-compilation
-
-The autoconf macros defined from jitter --cppflags get automatically changed, of
-course.
-
-* configure.ac (JITTER_CROSS_COMPILING): New substitution.
-
-* bin/jitter-config.in.m4sh (main loop) <--cppflags>: Introduce conditional on
-the new substitution.
-
-Suggested by Romain Naour, after his difficulties with building GNU poke with
-buildroot.
-
-(cherry picked from commit 428406c7b8d4c20f3472d41ed57c12c1a88ad37e)
-[Romain:
-  patch jitter-config.in instead of jitter-config.in.m4sh since
-  there is an issue while converting the M4sh m4sh script ( .in.m4sh )
-  into a portable shell script ( .in ) ready to be processed by aclocal
-  for @-substitutions.]
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- jitter/bin/jitter-config.in | 10 +++++++---
- jitter/configure.ac         |  1 +
- 2 files changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/jitter/bin/jitter-config.in b/jitter/bin/jitter-config.in
-index 5e124f0..4bc508d 100644
---- a/jitter/bin/jitter-config.in
-+++ b/jitter/bin/jitter-config.in
-@@ -999,10 +999,14 @@ while test "$#" != "0"; do
-         --cppflags)
-             no_option_argument
-             append_to_output cppflags
--            # Append a -I argument.  This is defined separately from the rest,
--            # as the installation prefix can be decided very late, at Jitter
-+            # Unless cross-compiling, append a -I argument referring the
-+            # installation path.  This is defined separately from the rest, as
-+            # the installation prefix can be decided very late, at Jitter
-             # installation time.
--            output="$output -I $includedir";;
-+            # (When cross-compiling this would be difficult to do correctly.)
-+            if test "x@JITTER_CROSS_COMPILING@" != 'xyes'; then
-+              output="$output -I $includedir"
-+            fi;;
-         --ldadd)
-             no_option_argument
-             append_to_output ldadd;;
-diff --git a/jitter/configure.ac b/jitter/configure.ac
-index 21d6937..fb12349 100644
---- a/jitter/configure.ac
-+++ b/jitter/configure.ac
-@@ -308,6 +308,7 @@ else
-    AC_MSG_RESULT([yes, cross-compiling from $build to $host .])
-    jitter_cross_compiling=yes
- fi
-+AC_SUBST([JITTER_CROSS_COMPILING], [$jitter_cross_compiling])
- 
- # I never test on weird systems not supporting shebangs.
- AC_SYS_INTERPRETER
--- 
-2.31.1
-
diff --git a/package/poke/poke.hash b/package/poke/poke.hash
index b3a79d90dc..1367262f54 100644
--- a/package/poke/poke.hash
+++ b/package/poke/poke.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  f61cf8da5b64c01a1359373725aad1ca257f35c1c9269e4d50dd0664183ddf62  poke-1.2.tar.gz
+sha256  ce054df29560c921230132703ee449fe130b6e25ab03aa6cc796bb401506aa24  poke-1.4.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  jitter/COPYING
diff --git a/package/poke/poke.mk b/package/poke/poke.mk
index 406acf15e0..fed023e954 100644
--- a/package/poke/poke.mk
+++ b/package/poke/poke.mk
@@ -4,14 +4,13 @@
 #
 ################################################################################
 
-POKE_VERSION = 1.2
+POKE_VERSION = 1.4
 POKE_SITE = $(BR2_GNU_MIRROR)/poke
 # gnulib license is a mix/mess of public-domain and various GPL and LGPL versions.
 POKE_LICENSE = GPL-3.0+, GPL-3.0+ (jitter), gnulib license (gnulib)
 POKE_LICENSE_FILES = COPYING jitter/COPYING
 
-# 0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch
-# 0003-configure.ac-HELP2MAN-replace-by-false-when-cross-co.patch
+# 0001-configure.ac-HELP2MAN-replace-by-false-when-cross-co.patch
 POKE_AUTORECONF = YES
 
 POKE_DEPENDENCIES = host-flex host-bison host-pkgconf bdwgc readline
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
