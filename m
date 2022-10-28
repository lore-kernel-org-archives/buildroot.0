Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8634DC38A02
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 06:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DD548161D;
	Fri, 28 Oct 2022 06:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DD548161D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pY-8XI6C4gSQ; Fri, 28 Oct 2022 06:45:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22E5081494;
	Fri, 28 Oct 2022 06:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22E5081494
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3019F1BF860
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14ECC40133
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:45:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14ECC40133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IZs7s1fwyLu0 for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 06:45:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05E6E400D0
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 06:45:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05E6E400D0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DED238734D; Fri, 28 Oct 2022 06:45:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 08:45:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f69217158fc4d2af3a640b25309ae7d621fe1bd
X-Git-Newrev: 400b63432ed0b0c2dee889cf4f2fed88c56a0eb5
X-Patchwork-Hint: ignore
Message-Id: <20221028064519.DED238734D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] libcurl: security bump to version 7.86.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=400b63432ed0b0c2dee889cf4f2fed88c56a0eb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 7.85.0 fixes CVE-2022-35252: When curl retrieves and parses
cookies from an HTTP(S) server, it accepts cookies using control codes
(byte values below 32). When cookies that contain such control codes are
later sent back to an HTTP(S) server, it might make the server return a
400 response. Effectively allowing a "sister site" to deny service to
siblings.

Drop upstream patches and autoreconf.

Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...include-sched-h-if-available-to-fix-build.patch | 30 ----------
 ...heck-for-the-stdatomic.h-header-in-config.patch | 70 ----------------------
 package/libcurl/libcurl.hash                       |  2 +-
 package/libcurl/libcurl.mk                         |  4 +-
 4 files changed, 2 insertions(+), 104 deletions(-)

diff --git a/package/libcurl/0001-easy_lock-h-include-sched-h-if-available-to-fix-build.patch b/package/libcurl/0001-easy_lock-h-include-sched-h-if-available-to-fix-build.patch
deleted file mode 100644
index b5f0a87218..0000000000
--- a/package/libcurl/0001-easy_lock-h-include-sched-h-if-available-to-fix-build.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From e2e7f54b7bea521fa8373095d0f43261a720cda0 Mon Sep 17 00:00:00 2001
-From: Daniel Stenberg <daniel@haxx.se>
-Date: Mon, 27 Jun 2022 08:46:21 +0200
-Subject: [PATCH] easy_lock.h: include sched.h if available to fix build
-
-Patched-by: Harry Sintonen
-
-Closes #9054
-
-[Retrieved from:
-https://github.com/curl/curl/commit/e2e7f54b7bea521fa8373095d0f43261a720cda0]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- lib/easy_lock.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/lib/easy_lock.h b/lib/easy_lock.h
-index 819f50ce815b8..1f54289ceb2d3 100644
---- a/lib/easy_lock.h
-+++ b/lib/easy_lock.h
-@@ -36,6 +36,9 @@
- 
- #elif defined (HAVE_ATOMIC)
- #include <stdatomic.h>
-+#if defined(HAVE_SCHED_YIELD)
-+#include <sched.h>
-+#endif
- 
- #define curl_simple_lock atomic_bool
- #define CURL_SIMPLE_LOCK_INIT false
diff --git a/package/libcurl/0002-configure-check-for-the-stdatomic.h-header-in-config.patch b/package/libcurl/0002-configure-check-for-the-stdatomic.h-header-in-config.patch
deleted file mode 100644
index 083238819b..0000000000
--- a/package/libcurl/0002-configure-check-for-the-stdatomic.h-header-in-config.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From a68074b5db2a1fb637853b808e5b263c2ce9cbdd Mon Sep 17 00:00:00 2001
-From: Daniel Stenberg <daniel@haxx.se>
-Date: Tue, 28 Jun 2022 08:37:22 +0200
-Subject: [PATCH] configure: check for the stdatomic.h header in configure
-
-... and only set HAVE_ATOMIC if that header exists since we use
-typedefes set in it.
-
-Reported-by: Ryan Schmidt
-Fixes #9059
-Closes #9060
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit a68074b5db2a1fb637853b808e5b263c2ce9cbdd
-
- m4/curl-functions.m4 | 36 +++++++++++++++++++-----------------
- 1 file changed, 19 insertions(+), 17 deletions(-)
-
-diff --git a/m4/curl-functions.m4 b/m4/curl-functions.m4
-index ec406f56aed8..f3e12a53a9fd 100644
---- a/m4/curl-functions.m4
-+++ b/m4/curl-functions.m4
-@@ -6570,24 +6570,26 @@ AC_DEFUN([CURL_COVERAGE],[
- ])
- 
- dnl CURL_ATOMIC
--dnl --------------------------------------------------
--dnl Check if _Atomic works
-+dnl -------------------------------------------------------------
-+dnl Check if _Atomic works. But only check if stdatomic.h exists.
- dnl
- AC_DEFUN([CURL_ATOMIC],[
--  AC_MSG_CHECKING([if _Atomic is available])
--  AC_COMPILE_IFELSE([
--    AC_LANG_PROGRAM([[
--      $curl_includes_unistd
--    ]],[[
--      _Atomic int i = 0;
--    ]])
--  ],[
--    AC_MSG_RESULT([yes])
--    AC_DEFINE_UNQUOTED(HAVE_ATOMIC, 1,
--      [Define to 1 if you have _Atomic support.])
--    tst_atomic="yes"
--  ],[
--    AC_MSG_RESULT([no])
--    tst_atomic="no"
-+  AC_CHECK_HEADERS(stdatomic.h, [
-+    AC_MSG_CHECKING([if _Atomic is available])
-+    AC_COMPILE_IFELSE([
-+      AC_LANG_PROGRAM([[
-+        $curl_includes_unistd
-+      ]],[[
-+        _Atomic int i = 0;
-+      ]])
-+    ],[
-+      AC_MSG_RESULT([yes])
-+      AC_DEFINE_UNQUOTED(HAVE_ATOMIC, 1,
-+        [Define to 1 if you have _Atomic support.])
-+      tst_atomic="yes"
-+    ],[
-+      AC_MSG_RESULT([no])
-+      tst_atomic="no"
-+    ])
-   ])
- ])
--- 
-2.35.1
-
diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 672591e470..c0e2378cac 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
 # https://curl.se/download/curl-7.84.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  2d118b43f547bfe5bae806d8d47b4e596ea5b25a6c1f080aef49fbcd817c5db8  curl-7.84.0.tar.xz
+sha256  2d61116e5f485581f6d59865377df4463f2e788677ac43222b496d4e49fb627b  curl-7.86.0.tar.xz
 sha256  321b1a09ebc30410f2e837c072e5521cf7095b757193af4a7dae1086e36ed31a  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 9614ba5143..3c3ad082fc 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.84.0
+LIBCURL_VERSION = 7.86.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
@@ -15,8 +15,6 @@ LIBCURL_LICENSE_FILES = COPYING
 LIBCURL_CPE_ID_VENDOR = haxx
 LIBCURL_CPE_ID_PRODUCT = libcurl
 LIBCURL_INSTALL_STAGING = YES
-# We are patching configure.ac
-LIBCURL_AUTORECONF = YES
 
 # We disable NTLM support because it uses fork(), which doesn't work
 # on non-MMU platforms. Moreover, this authentication method is
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
