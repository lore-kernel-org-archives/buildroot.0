Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEB8C54798
	for <buildroot@archiver.kernel.org>; Sun, 25 Feb 2024 08:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAD7740725;
	Sun, 25 Feb 2024 08:02:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e56YigUDXWne; Sun, 25 Feb 2024 08:02:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06D2A40734
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06D2A40734;
	Sun, 25 Feb 2024 08:02:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A1D1C1BF232
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 08:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FB5F6080F
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 08:02:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v22zJaNkGPg9 for <buildroot@lists.busybox.net>;
 Sun, 25 Feb 2024 08:02:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 938A36064A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 938A36064A
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 08:02:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8061187A90; Sun, 25 Feb 2024 08:02:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 25 Feb 2024 08:53:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 044752f5631a6fdb330ad57b8c8a5827c6b2bc86
X-Git-Newrev: bedcd1cd39c7654d1243e2cb0f4a68870f67782c
X-Patchwork-Hint: ignore
Message-Id: <20240225080241.8061187A90@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcurl: fix libpsl static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=bedcd1cd39c7654d1243e2cb0f4a68870f67782c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following static build failure with libpsl raised since bump to
version 8.6.0 in commit 5cee6b6be6524e443012d130e09b0e6983b0ff90:

configure:28830: /home/autobuild/autobuild/instance-6/output-1/host/bin/aarch64_be-buildroot-linux-musl-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O3 -g0 -static -Werror-implicit-function-declaration -Wno-system-headers -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -I/home/autobuild/autobuild/instance-6/output-1/host/aarch64_be-buildroot-linux-musl/sysroot/usr/include  -static -L/home/autobuild/autobuild/instance-6/output-1/host/bin/../aarch64_be-buildroot-linux-musl/sysroot/usr/lib  -L/home/autobuild/autobuild/instance-6/output-1/host/aarch64_be-buildroot-linux-musl/sysroot/usr/lib conftest.c -lpsl  -lmbedtls -lmbedx509 -lmbedcrypto -lz  -latomic >&5
/home/autobuild/autobuild/instance-6/output-1/host/lib/gcc/aarch64_be-buildroot-linux-musl/11.4.0/../../../../aarch64_be-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-6/output-1/host/bin/../aarch64_be-buildroot-linux-musl/sysroot/usr/lib/libpsl.a(psl.c.o): in function `is_public_suffix':
psl.c:(.text+0x2a8): undefined reference to `idn2_lookup_u8'

[...]

checking for library containing psl_builtin... no
configure: error: libpsl was not found

Fixes: 5cee6b6be6524e443012d130e09b0e6983b0ff90
 - http://autobuild.buildroot.org/results/1fb15e1a99472c403d0d3b1a688902f32e78d002

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-configure.ac-find-libpsl-with-pkg-config.patch | 109 +++++++++++++++++++++
 package/libcurl/libcurl.mk                         |   2 +
 2 files changed, 111 insertions(+)

diff --git a/package/libcurl/0001-configure.ac-find-libpsl-with-pkg-config.patch b/package/libcurl/0001-configure.ac-find-libpsl-with-pkg-config.patch
new file mode 100644
index 0000000000..46df1e36a2
--- /dev/null
+++ b/package/libcurl/0001-configure.ac-find-libpsl-with-pkg-config.patch
@@ -0,0 +1,109 @@
+From 9b3f67e267d1fa8d7867655d133bdbf8830a0ab3 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 15 Feb 2024 20:59:25 +0100
+Subject: [PATCH] configure.ac: find libpsl with pkg-config
+
+Find libpsl with pkg-config to avoid static build failures.
+
+Ref: http://autobuild.buildroot.org/results/1fb15e1a99472c403d0d3b1a688902f32e78d002
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Closes #12947
+
+Upstream: https://github.com/curl/curl/commit/9b3f67e267d1fa8d7867655d133bdbf8830a0ab3
+---
+ configure.ac | 79 ++++++++++++++++++++++++++++++++++++++++++++--------
+ docs/TODO    |  7 -----
+ 2 files changed, 67 insertions(+), 19 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index cd0e2d07d8d164..09d5364f4de575 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2075,19 +2075,74 @@ dnl **********************************************************************
+ dnl Check for libpsl
+ dnl **********************************************************************
+ 
+-AC_ARG_WITH(libpsl,
+-           AS_HELP_STRING([--without-libpsl],
+-           [disable support for libpsl]),
+-           with_libpsl=$withval,
+-           with_libpsl=yes)
+-curl_psl_msg="no      (libpsl disabled)"
+-if test $with_libpsl != "no"; then
+-  AC_SEARCH_LIBS(psl_builtin, psl,
+-    [curl_psl_msg="enabled";
+-     AC_DEFINE([USE_LIBPSL], [1], [PSL support enabled])
+-     ],
+-    [AC_MSG_ERROR([libpsl was not found]) ]
++dnl Default to compiler & linker defaults for LIBPSL files & libraries.
++OPT_LIBPSL=off
++AC_ARG_WITH(libpsl,dnl
++AS_HELP_STRING([--with-libpsl=PATH],[Where to look for libpsl, PATH points to the LIBPSL installation; when possible, set the PKG_CONFIG_PATH environment variable instead of using this option])
++AS_HELP_STRING([--without-libpsl], [disable LIBPSL]),
++  OPT_LIBPSL=$withval)
++
++if test X"$OPT_LIBPSL" != Xno; then
++  dnl backup the pre-libpsl variables
++  CLEANLDFLAGS="$LDFLAGS"
++  CLEANCPPFLAGS="$CPPFLAGS"
++  CLEANLIBS="$LIBS"
++
++  case "$OPT_LIBPSL" in
++  yes)
++    dnl --with-libpsl (without path) used
++    CURL_CHECK_PKGCONFIG(libpsl)
++
++    if test "$PKGCONFIG" != "no" ; then
++      LIB_PSL=`$PKGCONFIG --libs-only-l libpsl`
++      LD_PSL=`$PKGCONFIG --libs-only-L libpsl`
++      CPP_PSL=`$PKGCONFIG --cflags-only-I libpsl`
++    else
++      dnl no libpsl pkg-config found
++      LIB_PSL="-lpsl"
++    fi
++
++    ;;
++  off)
++    dnl no --with-libpsl option given, just check default places
++    LIB_PSL="-lpsl"
++    ;;
++  *)
++    dnl use the given --with-libpsl spot
++    LIB_PSL="-lpsl"
++    PREFIX_PSL=$OPT_LIBPSL
++    ;;
++  esac
++
++  dnl if given with a prefix, we set -L and -I based on that
++  if test -n "$PREFIX_PSL"; then
++    LD_PSL=-L${PREFIX_PSL}/lib$libsuff
++    CPP_PSL=-I${PREFIX_PSL}/include
++  fi
++
++  LDFLAGS="$LDFLAGS $LD_PSL"
++  CPPFLAGS="$CPPFLAGS $CPP_PSL"
++  LIBS="$LIB_PSL $LIBS"
++
++  AC_CHECK_LIB(psl, psl_builtin,
++    [
++     AC_CHECK_HEADERS(libpsl.h,
++        curl_psl_msg="enabled"
++        LIBPSL_ENABLED=1
++        AC_DEFINE(USE_LIBPSL, 1, [if libpsl is in use])
++        AC_SUBST(USE_LIBPSL, [1])
++     )
++    ],
++      dnl not found, revert back to clean variables
++      LDFLAGS=$CLEANLDFLAGS
++      CPPFLAGS=$CLEANCPPFLAGS
++      LIBS=$CLEANLIBS
+   )
++
++  if test X"$OPT_LIBPSL" != Xoff &&
++     test "$LIBPSL_ENABLED" != "1"; then
++    AC_MSG_ERROR([libpsl libs and/or directories were not found where specified!])
++  fi
+ fi
+ AM_CONDITIONAL([USE_LIBPSL], [test "$curl_psl_msg" = "enabled"])
+ 
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 9dafe90c82..4281cfabb1 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -14,6 +14,8 @@ LIBCURL_LICENSE = curl
 LIBCURL_LICENSE_FILES = COPYING
 LIBCURL_CPE_ID_VENDOR = haxx
 LIBCURL_INSTALL_STAGING = YES
+# 0001-configure.ac-find-libpsl-with-pkg-config.patch
+LIBCURL_AUTORECONF = YES
 
 # We disable NTLM delegation to winbinds ntlm_auth ('--disable-ntlm-wb')
 # support because it uses fork(), which doesn't work on non-MMU platforms.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
