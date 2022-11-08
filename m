Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DDEC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3040342B54;
	Mon, 20 Feb 2023 21:15:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3040342B54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vEYVX4AbdX1V; Mon, 20 Feb 2023 21:15:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D704A42B50;
	Mon, 20 Feb 2023 21:15:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D704A42B50
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 120701BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA7E061075
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA7E061075
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qkN_XPuj9smo for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E8E1610A0
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E8E1610A0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6780E86496; Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 8 Nov 2022 08:40:46 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2d3c06435b24bac849bb31fcd24f56d45b191f47
X-Git-Newrev: 9f6c257638cf2598cad123afa8cdbf84437de072
X-Patchwork-Hint: ignore
Message-Id: <20230220205149.6780E86496@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libkcapi: disable
 -Werror
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f6c257638cf2598cad123afa8cdbf84437de072
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following musl build failure (disabling -Werror seems to be the
only "solution": https://github.com/smuellerDD/libkcapi/issues/136):

lib/kcapi-kernel-if.c: In function '_kcapi_common_send_meta':
lib/kcapi-kernel-if.c:212:12: error: unsigned conversion from 'long int' to 'long unsigned int' changes value from '-4' to '4294967292' [-Werror=sign-conversion]
  212 |   header = CMSG_NXTHDR(&msg, header);
      |            ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/c789d43e71e6075e297bef58d888228a89055bbc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libkcapi/0002-Add-disable-werror.patch | 46 ++++++++++++++++++++++++++
 package/libkcapi/libkcapi.mk                   |  1 +
 2 files changed, 47 insertions(+)

diff --git a/package/libkcapi/0002-Add-disable-werror.patch b/package/libkcapi/0002-Add-disable-werror.patch
new file mode 100644
index 0000000000..4f2f55f145
--- /dev/null
+++ b/package/libkcapi/0002-Add-disable-werror.patch
@@ -0,0 +1,46 @@
+From c27b154f03ad7e94447c7114d73aee60f0098093 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 7 Nov 2022 13:38:06 +0100
+Subject: [PATCH] Add --disable-werror
+
+Allow the user to disable -Werror through --disable-werror
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Stephan Mueller <smueller@chronox.de>
+[Retrieved from:
+https://github.com/smuellerDD/libkcapi/commit/c27b154f03ad7e94447c7114d73aee60f0098093]
+---
+ Makefile.am  | 5 ++++-
+ configure.ac | 3 +++
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 1c95d3d..cddedac 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -2,7 +2,10 @@ ACLOCAL_AMFLAGS = -I m4
+ AUTOMAKE_OPTIONS = subdir-objects
+ lib_LTLIBRARIES = libkcapi.la
+ 
+-COMMON_CPPFLAGS = -Wextra -Wall -pedantic -fwrapv --param ssp-buffer-size=4 -O2 -Werror -std=gnu99 -Wconversion
++COMMON_CPPFLAGS = -Wextra -Wall -pedantic -fwrapv --param ssp-buffer-size=4 -O2 -std=gnu99 -Wconversion
++if ENABLE_WERROR
++COMMON_CPPFLAGS += -Werror
++endif
+ COMMON_LDFLAGS =  -Wl,-z,relro,-z,now
+ 
+ libtool: $(LIBTOOL_DEPS)
+diff --git a/configure.ac b/configure.ac
+index cb910e2..e230577 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -76,6 +76,9 @@ AX_ADD_FORTIFY_SOURCE
+ 
+ AC_CHECK_API_VERSION
+ 
++AC_ARG_ENABLE([werror], [AS_HELP_STRING([--disable-werror], [Disable -Werror])], [with_werror=$enableval], [with_werror=yes])
++AM_CONDITIONAL([ENABLE_WERROR], [test "x$with_werror" = "xyes"])
++
+ AC_ARG_ENABLE([kcapi-test], [AS_HELP_STRING([--enable-kcapi-test], [Compile kcapi test program])], [with_kcapi_test=$enableval])
+ AM_CONDITIONAL([ENABLE_KCAPI_TEST], [test "x$with_kcapi_test" = "xyes"])
+ 
diff --git a/package/libkcapi/libkcapi.mk b/package/libkcapi/libkcapi.mk
index e88928a74d..c6251c286c 100644
--- a/package/libkcapi/libkcapi.mk
+++ b/package/libkcapi/libkcapi.mk
@@ -15,6 +15,7 @@ LIBKCAPI_CONF_ENV = \
 	ac_cv_path_DB2PDF="" \
 	ac_cv_path_DB2PS="" \
 	ac_cv_path_XMLTO=""
+LIBKCAPI_CONF_OPTS = --disable-werror
 LIBKCAPI_MAKE_OPTS = CPPFLAGS="$(TARGET_CPPFLAGS)"
 
 ifeq ($(BR2_PACKAGE_LIBKCAPI_ASYM),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
