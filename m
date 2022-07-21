Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE4FC43334
	for <buildroot@archiver.kernel.org>; Thu, 21 Jul 2022 16:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73A4F847C1;
	Thu, 21 Jul 2022 16:10:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73A4F847C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XMe0cwrfrXQI; Thu, 21 Jul 2022 16:10:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7774B84750;
	Thu, 21 Jul 2022 16:10:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7774B84750
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3B4EA1BF2A5
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 16:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2408184750
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 16:10:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2408184750
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XLBlogAaGEA4 for <buildroot@lists.busybox.net>;
 Thu, 21 Jul 2022 16:10:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 827A1847C1
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 827A1847C1
 for <buildroot@busybox.net>; Thu, 21 Jul 2022 16:10:29 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 618F3440033;
 Thu, 21 Jul 2022 19:09:53 +0300 (IDT)
To: buildroot@busybox.net
Date: Thu, 21 Jul 2022 19:10:08 +0300
Message-Id: <a91e52dc20742c251ac5fdc6ada81c499dfc1705.1658419808.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1658419793;
 bh=3tSU8+jck7B3aUxcafbmI7ra1cdTS1TF4TAueZmo3qw=;
 h=From:To:Cc:Subject:Date:From;
 b=oPB3y6nsKRpSWTS1UMpKKSlf01aT+r0mOWxbh0XbdQ4j9Cw+iNQlTAIUzLcsA5T4c
 xkgjchZpDwxt5YA4f8N6+IlkhjFVkfcmMWvgDs9H5NHDTZMUNQ+h++/RNGPuHUKbYe
 uJMpWC0+DDdMu2fICPYIbz28vBk4ajH+e2CueE6tOssyKnY68ZscDIhSLRutFwrfrz
 JOzmmFodf9NtuhUtIe/OcAvhM5R7y7mMM+51uOsWz8wl4wbgoFWmrXCHBTUiQJsivU
 Q4r02CQXlRY/pDO9AEeKtYKwxCbXV/4aYgGJ+uaeRr6nSWVzuX32Y6uT7O36rwhpA6
 fKQoirCrXQwgw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=oPB3y6ns
Subject: [Buildroot] [PATCH] package/libcurl: fix build when
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 ...for-the-stdatomic.h-header-in-config.patch | 70 +++++++++++++++++++
 package/libcurl/libcurl.mk                    |  6 ++
 2 files changed, 76 insertions(+)
 create mode 100644 package/libcurl/0002-configure-check-for-the-stdatomic.h-header-in-config.patch

diff --git a/package/libcurl/0002-configure-check-for-the-stdatomic.h-header-in-config.patch b/package/libcurl/0002-configure-check-for-the-stdatomic.h-header-in-config.patch
new file mode 100644
index 000000000000..083238819b1b
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
index 5dc4eebefa49..ab2fd75276b2 100644
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
@@ -36,6 +38,10 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 LIBCURL_CONF_OPTS += LIBS=-latomic
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_1),)
+LIBCURL_CONF_ENV += ac_cv_header_stdatomic_h=no
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCURL_VERBOSE),y)
 LIBCURL_CONF_OPTS += --enable-verbose
 else
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
