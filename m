Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC62C00140
	for <buildroot@archiver.kernel.org>; Fri, 12 Aug 2022 15:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B73160B0B;
	Fri, 12 Aug 2022 15:14:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B73160B0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XN_9mx-gQIeD; Fri, 12 Aug 2022 15:14:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7730660773;
	Fri, 12 Aug 2022 15:14:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7730660773
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 96D011BF40A
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 15:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80416404C9
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 15:13:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80416404C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id siX52O37nc5j for <buildroot@lists.busybox.net>;
 Fri, 12 Aug 2022 15:13:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F01AB404AE
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 15:13:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F01AB404AE
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 375F9873AC; Fri, 12 Aug 2022 14:59:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 Aug 2022 17:10:21 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 51a837b719c71b191909e033f9dcea2a293cb2d2
X-Git-Newrev: 659310bc8f30427c62ca0ec8ff51414f0a371365
X-Patchwork-Hint: ignore
Message-Id: <20220812145932.375F9873AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libcurl: fix
 build when !BR2_TOOLCHAIN_HAS_SYNC_1
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

commit: https://git.buildroot.net/buildroot/commit/?id=659310bc8f30427c62ca0ec8ff51414f0a371365
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

On platform that do not provide __atomic_exchange_1(), and when
libatomic is not available (e.g., threads support disabled) link of
libcurl.so fails. To solve this use an indirect way to make HAVE_ATOMIC
undefined. Add an upstream patch for checking the stdatomic.h header,
and seed the 'no' answer.

Fixes:
http://autobuild.buildroot.net/results/8f695d4dbb91cfde8e93ab38e837b0a0042b986b/
http://autobuild.buildroot.net/results/3b4712b0ace52da1650e88cdaafb6a20be135464/

Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit f81454db59a19a276ae458acd78610c9ac6c2586)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...heck-for-the-stdatomic.h-header-in-config.patch | 70 ++++++++++++++++++++++
 package/libcurl/libcurl.mk                         |  8 +++
 2 files changed, 78 insertions(+)

diff --git a/package/libcurl/0002-configure-check-for-the-stdatomic.h-header-in-config.patch b/package/libcurl/0002-configure-check-for-the-stdatomic.h-header-in-config.patch
new file mode 100644
index 0000000000..083238819b
--- /dev/null
+++ b/package/libcurl/0002-configure-check-for-the-stdatomic.h-header-in-config.patch
@@ -0,0 +1,70 @@
+From a68074b5db2a1fb637853b808e5b263c2ce9cbdd Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 28 Jun 2022 08:37:22 +0200
+Subject: [PATCH] configure: check for the stdatomic.h header in configure
+
+... and only set HAVE_ATOMIC if that header exists since we use
+typedefes set in it.
+
+Reported-by: Ryan Schmidt
+Fixes #9059
+Closes #9060
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit a68074b5db2a1fb637853b808e5b263c2ce9cbdd
+
+ m4/curl-functions.m4 | 36 +++++++++++++++++++-----------------
+ 1 file changed, 19 insertions(+), 17 deletions(-)
+
+diff --git a/m4/curl-functions.m4 b/m4/curl-functions.m4
+index ec406f56aed8..f3e12a53a9fd 100644
+--- a/m4/curl-functions.m4
++++ b/m4/curl-functions.m4
+@@ -6570,24 +6570,26 @@ AC_DEFUN([CURL_COVERAGE],[
+ ])
+ 
+ dnl CURL_ATOMIC
+-dnl --------------------------------------------------
+-dnl Check if _Atomic works
++dnl -------------------------------------------------------------
++dnl Check if _Atomic works. But only check if stdatomic.h exists.
+ dnl
+ AC_DEFUN([CURL_ATOMIC],[
+-  AC_MSG_CHECKING([if _Atomic is available])
+-  AC_COMPILE_IFELSE([
+-    AC_LANG_PROGRAM([[
+-      $curl_includes_unistd
+-    ]],[[
+-      _Atomic int i = 0;
+-    ]])
+-  ],[
+-    AC_MSG_RESULT([yes])
+-    AC_DEFINE_UNQUOTED(HAVE_ATOMIC, 1,
+-      [Define to 1 if you have _Atomic support.])
+-    tst_atomic="yes"
+-  ],[
+-    AC_MSG_RESULT([no])
+-    tst_atomic="no"
++  AC_CHECK_HEADERS(stdatomic.h, [
++    AC_MSG_CHECKING([if _Atomic is available])
++    AC_COMPILE_IFELSE([
++      AC_LANG_PROGRAM([[
++        $curl_includes_unistd
++      ]],[[
++        _Atomic int i = 0;
++      ]])
++    ],[
++      AC_MSG_RESULT([yes])
++      AC_DEFINE_UNQUOTED(HAVE_ATOMIC, 1,
++        [Define to 1 if you have _Atomic support.])
++      tst_atomic="yes"
++    ],[
++      AC_MSG_RESULT([no])
++      tst_atomic="no"
++    ])
+   ])
+ ])
+-- 
+2.35.1
+
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 5dc4eebefa..dc0f1230f1 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -15,6 +15,8 @@ LIBCURL_LICENSE_FILES = COPYING
 LIBCURL_CPE_ID_VENDOR = haxx
 LIBCURL_CPE_ID_PRODUCT = libcurl
 LIBCURL_INSTALL_STAGING = YES
+# We are patching configure.ac
+LIBCURL_AUTORECONF = YES
 
 # We disable NTLM support because it uses fork(), which doesn't work
 # on non-MMU platforms. Moreover, this authentication method is
@@ -36,6 +38,12 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 LIBCURL_CONF_OPTS += LIBS=-latomic
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_1),)
+# Even though stdatomic.h does exist, link fails for __atomic_exchange_1
+# Work around this by pretending atomics aren't available.
+LIBCURL_CONF_ENV += ac_cv_header_stdatomic_h=no
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCURL_VERBOSE),y)
 LIBCURL_CONF_OPTS += --enable-verbose
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
