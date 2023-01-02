Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5DCC4167B
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 07:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54B1440258;
	Mon,  2 Jan 2023 07:26:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54B1440258
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gDjDdO7QIwV4; Mon,  2 Jan 2023 07:26:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A922408F7;
	Mon,  2 Jan 2023 07:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A922408F7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 789AD1BF3E0
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 07:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60064408F7
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 07:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60064408F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vEgyt_a-TUTw for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 07:26:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 188BC40258
 for <buildroot@buildroot.org>; Mon,  2 Jan 2023 07:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 188BC40258
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 02DFB870A8; Mon,  2 Jan 2023 07:26:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Jan 2023 08:22:08 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: d475cb6056adb7607bcc7768b41ff3c81f92ce93
X-Git-Newrev: 1427f9c63fde7fda7edb9c5d841110718d391d5f
X-Patchwork-Hint: ignore
Message-Id: <20230102072611.02DFB870A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/libkcapi: Fix
 symver build error on non-ELF platforms
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

commit: https://git.buildroot.net/buildroot/commit/?id=1427f9c63fde7fda7edb9c5d841110718d391d5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

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
(cherry picked from commit 216e201cd0f14aacac2e9727e8da8f64d734a064)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
