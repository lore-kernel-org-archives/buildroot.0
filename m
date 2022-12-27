Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A09C6379F
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43F7C83E11;
	Mon, 20 Feb 2023 23:29:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43F7C83E11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fcfi771KMA8E; Mon, 20 Feb 2023 23:29:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74B6883E14;
	Mon, 20 Feb 2023 23:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74B6883E14
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8983D1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CDDE61780
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CDDE61780
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b0X66M0h3XLy for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53B2C612BA
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53B2C612BA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 433138648F; Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Dec 2022 21:46:35 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 44161560dd52ebe9a41ee6e5ec8cacb2a9fe48ec
X-Git-Newrev: 216e201cd0f14aacac2e9727e8da8f64d734a064
X-Patchwork-Hint: ignore
Message-Id: <20230220205216.433138648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libkcapi: Fix symver
 build error on non-ELF platforms
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

commit: https://git.buildroot.net/buildroot/commit/?id=216e201cd0f14aacac2e9727e8da8f64d734a064
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The following error is observed on Microblaze [1] build:
```
error: symver is only supported on ELF platforms
```
due to using __attribute__((symver)) on non-ELF platform.
So, revert to using .symver in such case.

Fixes:

  http://autobuild.buildroot.net/results/4470efb5a078c0e368f6bd4f5ec455eea5eeebb5/

Upstream status: commit f630ed1f807e26de04b3a5dfd7f1b39d1c5cb642
https://github.com/smuellerDD/libkcapi/pull/147

Signed-off-by: Tan En De <ende.tan@starfivetech.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...x-symver-build-error-on-non-ELF-platforms.patch | 84 ++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/package/libkcapi/0003-Fix-symver-build-error-on-non-ELF-platforms.patch b/package/libkcapi/0003-Fix-symver-build-error-on-non-ELF-platforms.patch
new file mode 100644
index 0000000000..206ac7ec4a
--- /dev/null
+++ b/package/libkcapi/0003-Fix-symver-build-error-on-non-ELF-platforms.patch
@@ -0,0 +1,84 @@
+From f630ed1f807e26de04b3a5dfd7f1b39d1c5cb642 Mon Sep 17 00:00:00 2001
+From: Tan En De <ende.tan@starfivetech.com>
+Date: Sat, 26 Nov 2022 07:47:39 +0800
+Subject: [PATCH] Fix symver build error on non-ELF platforms
+
+The following error is observed on Microblaze [1] build:
+```
+error: symver is only supported on ELF platforms
+```
+due to using __attribute__((symver)) on non-ELF platform.
+So, revert to using .symver in such case.
+
+[1]: http://autobuild.buildroot.net/results/447/4470efb5a078c0e368f6bd4f5ec455eea5eeebb5/build-end.log
+
+Signed-off-by: Tan En De <ende.tan@starfivetech.com>
+Signed-off-by: Stephan Mueller <smueller@chronox.de>
+---
+Upstream status: commit f630ed1f807e26de04b3a5dfd7f1b39d1c5cb642
+
+ configure.ac                    |  2 ++
+ lib/internal.h                  |  2 +-
+ m4/ac_check_attribute_symver.m4 | 24 ++++++++++++++++++++++++
+ 3 files changed, 27 insertions(+), 1 deletion(-)
+ create mode 100644 m4/ac_check_attribute_symver.m4
+
+diff --git a/configure.ac b/configure.ac
+index e230577..ba17404 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -76,6 +76,8 @@ AX_ADD_FORTIFY_SOURCE
+ 
+ AC_CHECK_API_VERSION
+ 
++AC_CHECK_ATTRIBUTE_SYMVER
++
+ AC_ARG_ENABLE([werror], [AS_HELP_STRING([--disable-werror], [Disable -Werror])], [with_werror=$enableval], [with_werror=yes])
+ AM_CONDITIONAL([ENABLE_WERROR], [test "x$with_werror" = "xyes"])
+ 
+diff --git a/lib/internal.h b/lib/internal.h
+index 14844a9..7977b04 100644
+--- a/lib/internal.h
++++ b/lib/internal.h
+@@ -352,7 +352,7 @@ static inline int io_getevents(__attribute__((unused)) aio_context_t ctx,
+  * Auxiliary macros
+  ************************************************************/
+ 
+-#if __GNUC__ >= 10
++#if HAVE_ATTRIBUTE_SYMVER && __GNUC__ >= 10
+ # define IMPL_SYMVER(name, version) \
+     __attribute__((__symver__("kcapi_" #name "@@LIBKCAPI_" version)))
+ 
+diff --git a/m4/ac_check_attribute_symver.m4 b/m4/ac_check_attribute_symver.m4
+new file mode 100644
+index 0000000..b484c5e
+--- /dev/null
++++ b/m4/ac_check_attribute_symver.m4
+@@ -0,0 +1,24 @@
++dnl Check compiler support for symver function attribute
++AC_DEFUN([AC_CHECK_ATTRIBUTE_SYMVER], [
++	saved_CFLAGS=$CFLAGS
++	CFLAGS="-O0 -Werror"
++	AC_COMPILE_IFELSE(
++		[AC_LANG_PROGRAM(
++			[[
++				void _test_attribute_symver(void);
++				__attribute__((__symver__("sym@VER_1.2.3"))) void _test_attribute_symver(void) {}
++			]],
++			[[ 
++				_test_attribute_symver()
++			]]
++		)],
++		[
++			AC_DEFINE([HAVE_ATTRIBUTE_SYMVER], 1, [Define to 1 if __attribute__((symver)) is supported])
++		],
++		[
++			AC_DEFINE([HAVE_ATTRIBUTE_SYMVER], 0, [Define to 0 if __attribute__((symver)) is not supported])
++		]
++	)
++	CFLAGS=$saved_CFLAGS
++])
++
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
