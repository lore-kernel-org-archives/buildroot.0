Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797C2C0502C
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 09:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14836404D0;
	Sun, 28 Aug 2022 09:32:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14836404D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nRxXYbMcxkG0; Sun, 28 Aug 2022 09:32:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B3F7404CA;
	Sun, 28 Aug 2022 09:32:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B3F7404CA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 667471BF5AE
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 09:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4124160AF7
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 09:32:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4124160AF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RB0FerbOVqEv for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 09:32:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC335600CB
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 09:32:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC335600CB
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3F19287E74; Sun, 28 Aug 2022 09:17:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 28 Aug 2022 11:31:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 782a1526f829a02e163eee609d6f38f1347dc9eb
X-Git-Newrev: 6b16ffabb5eff2fe9601f6cc01bfdb5fe431d846
X-Patchwork-Hint: ignore
Message-Id: <20220828091717.3F19287E74@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/memcached: disable -Werror
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6b16ffabb5eff2fe9601f6cc01bfdb5fe431d846
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable -Werror to avoid the following build failure:

In file included from hash.c:7:
xxhash.h:2667:5: error: #warning is a GCC extension [-Werror]
 2667 | #   warning "XXH3 is highly inefficient without ARM or Thumb-2."
      |     ^~~~~~~
xxhash.h:2667:5: error: #warning "XXH3 is highly inefficient without ARM or Thumb-2." [-Werror=cpp]

Fixes:
 - http://autobuild.buildroot.org/results/3124bae73c207f1a118e57e41e222ef464ccb297

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0003-configure.ac-add-disable-werror.patch     | 65 ++++++++++++++++++++++
 package/memcached/memcached.mk                     |  2 +-
 2 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/package/memcached/0003-configure.ac-add-disable-werror.patch b/package/memcached/0003-configure.ac-add-disable-werror.patch
new file mode 100644
index 0000000000..dab9b8835d
--- /dev/null
+++ b/package/memcached/0003-configure.ac-add-disable-werror.patch
@@ -0,0 +1,65 @@
+From 8497f7ed38146378a988bc22800b3a5eba38b0fd Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 13 Jun 2022 16:29:38 +0200
+Subject: [PATCH] configure.ac: add --disable-werror
+
+Allow the user to disable -Werror to avoid the following build failure:
+
+In file included from hash.c:7:
+xxhash.h:2667:5: error: #warning is a GCC extension [-Werror]
+ 2667 | #   warning "XXH3 is highly inefficient without ARM or Thumb-2."
+      |     ^~~~~~~
+xxhash.h:2667:5: error: #warning "XXH3 is highly inefficient without ARM or Thumb-2." [-Werror=cpp]
+
+Fixes:
+ - http://autobuild.buildroot.org/results/3124bae73c207f1a118e57e41e222ef464ccb297
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/memcached/memcached/pull/926]
+---
+ configure.ac | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3337fe7..7683b8f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -114,6 +114,9 @@ AC_ARG_ENABLE(static,
+ AC_ARG_ENABLE(unix_socket,
+   [AS_HELP_STRING([--disable-unix-socket], [Disable unix domain socket])])
+ 
++AC_ARG_ENABLE(werror,
++  [AS_HELP_STRING([--disable-werror], [Disable -Werror])])
++
+ dnl **********************************************************************
+ dnl DETECT_SASL_CB_GETCONF
+ dnl
+@@ -783,6 +786,10 @@ AM_CONDITIONAL([BUILD_SPECIFICATIONS],
+                [test "x$enable_docs" != "xno" -a "x$XML2RFC" != "xno" -a "x$XSLTPROC" != "xno"])
+ 
+ 
++if test "x$enable_werror" != "xno"; then
++   CFLAGS="$CFLAGS -Werror"
++fi
++
+ dnl Let the compiler be a bit more picky. Please note that you cannot
+ dnl specify these flags to the compiler before AC_CHECK_FUNCS, because
+ dnl the test program will generate a compilation warning and hence fail
+@@ -790,12 +797,12 @@ dnl to detect the function ;-)
+ if test "$ICC" = "yes"
+ then
+    dnl ICC trying to be gcc.
+-   CFLAGS="$CFLAGS -diag-disable 187 -Wall -Werror"
++   CFLAGS="$CFLAGS -diag-disable 187 -Wall"
+    AC_DEFINE([_GNU_SOURCE],[1],[make sure IOV_MAX is defined])
+ elif test "$GCC" = "yes"
+ then
+   GCC_VERSION=`$CC -dumpversion`
+-  CFLAGS="$CFLAGS -Wall -Werror -pedantic -Wmissing-prototypes -Wmissing-declarations -Wredundant-decls"
++  CFLAGS="$CFLAGS -Wall -pedantic -Wmissing-prototypes -Wmissing-declarations -Wredundant-decls"
+   if test "x$enable_asan" = "xyes"; then
+     CFLAGS="$CFLAGS -fsanitize=address"
+   fi
+-- 
+2.35.1
+
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index 5249195c2e..bddb713458 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -8,7 +8,7 @@ MEMCACHED_VERSION = 1.6.16
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-MEMCACHED_CONF_OPTS = --disable-coverage
+MEMCACHED_CONF_OPTS = --disable-coverage --disable-werror
 MEMCACHED_LICENSE = BSD-3-Clause
 MEMCACHED_LICENSE_FILES = COPYING
 MEMCACHED_CPE_ID_VENDOR = memcached
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
