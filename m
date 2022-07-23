Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76A2C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 11:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18890416F5;
	Sat, 23 Jul 2022 11:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18890416F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DiD1yOB9T_E3; Sat, 23 Jul 2022 11:49:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE7B2416E2;
	Sat, 23 Jul 2022 11:49:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE7B2416E2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF63D1BF2F2
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 11:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9E6D837AC
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 11:49:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9E6D837AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QyxNpcoRIZWT for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 11:49:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 885A483490
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 11:49:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 885A483490
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BCE6F84340; Sat, 23 Jul 2022 11:35:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 13:48:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 96a6b3bf3931704c8c93fcfbaa1b47011e7a876a
X-Git-Newrev: f81454db59a19a276ae458acd78610c9ac6c2586
X-Patchwork-Hint: ignore
Message-Id: <20220723113544.BCE6F84340@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcurl: fix build when
 !BR2_TOOLCHAIN_HAS_SYNC_1
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

commit: https://git.buildroot.net/buildroot/commit/?id=f81454db59a19a276ae458acd78610c9ac6c2586
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
