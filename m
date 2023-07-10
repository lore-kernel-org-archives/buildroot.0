Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1255DEB64DC
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 17:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8697C82073;
	Mon, 10 Jul 2023 17:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8697C82073
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3a_5Z2DFu27x; Mon, 10 Jul 2023 17:40:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6D918206D;
	Mon, 10 Jul 2023 17:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6D918206D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D6131BF3D4
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5314B417E7
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:40:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5314B417E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YWRYfbNL1IM4 for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 17:40:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B245417C4
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 17:40:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B245417C4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2761F86C02; Mon, 10 Jul 2023 17:40:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 19:39:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5cae6ed9973db0ca84d67ab0fd3763e554550f6
X-Git-Newrev: 568dd29c2f9c3c55355469897bf29236fb2f364b
X-Patchwork-Hint: ignore
Message-Id: <20230710174003.2761F86C02@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alsa-lib: Fix symver build error
 on non-ELF platforms
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

commit: https://git.buildroot.net/buildroot/commit/?id=568dd29c2f9c3c55355469897bf29236fb2f364b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/1e9/1e965d83d75615f35308440c5db044314a349357/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...x-symver-build-error-on-non-ELF-platforms.patch | 84 ++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/package/alsa-lib/0002-Fix-symver-build-error-on-non-ELF-platforms.patch b/package/alsa-lib/0002-Fix-symver-build-error-on-non-ELF-platforms.patch
new file mode 100644
index 0000000000..499bbb2ae4
--- /dev/null
+++ b/package/alsa-lib/0002-Fix-symver-build-error-on-non-ELF-platforms.patch
@@ -0,0 +1,84 @@
+From 317aafb133ed797c4cd62599565a77ecc595daea Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Thu, 29 Jun 2023 07:57:21 +0200
+Subject: [PATCH] Fix symver build error on non-ELF platforms
+
+The following error is observed on Microblaze [1] build:
+
+    error: symver is only supported on ELF platforms
+
+due to using __attribute__((symver)) on non-ELF platform.
+
+[1] http://autobuild.buildroot.net/results/1e9/1e965d83d75615f35308440c5db044314a349357/build-end.log
+
+ac_check_attribute_symver.m4 was downloaded from
+https://github.com/smuellerDD/libkcapi/blob/master/m4/ac_check_attribute_symver.m4
+
+Upstream: https://github.com/alsa-project/alsa-lib/pull/334
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ configure.ac                    |  1 +
+ include/alsa-symbols.h          |  2 +-
+ m4/ac_check_attribute_symver.m4 | 24 ++++++++++++++++++++++++
+ 3 files changed, 26 insertions(+), 1 deletion(-)
+ create mode 100644 m4/ac_check_attribute_symver.m4
+
+diff --git a/configure.ac b/configure.ac
+index 0588eec3..71ec0b15 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -46,6 +46,7 @@ dnl Checks for typedefs, structures, and compiler characteristics.
+ AC_C_CONST
+ AC_C_INLINE
+ AC_HEADER_TIME
++AC_CHECK_ATTRIBUTE_SYMVER
+ 
+ dnl Checks for library functions.
+ AC_PROG_GCC_TRADITIONAL
+diff --git a/include/alsa-symbols.h b/include/alsa-symbols.h
+index f8c49103..521e5956 100644
+--- a/include/alsa-symbols.h
++++ b/include/alsa-symbols.h
+@@ -29,7 +29,7 @@
+ #define INTERNAL_CONCAT2_2(Pre, Post) Pre##Post
+ #define INTERNAL(Name) INTERNAL_CONCAT2_2(__, Name)
+ 
+-#if __GNUC__ > 10
++#if HAVE_ATTRIBUTE_SYMVER && __GNUC__ > 10
+ #define symbol_version(real, name, version) \
+ 	extern __typeof (real) real __attribute__((symver (#name "@" #version)))
+ #define default_symbol_version(real, name, version) \
+diff --git a/m4/ac_check_attribute_symver.m4 b/m4/ac_check_attribute_symver.m4
+new file mode 100644
+index 00000000..b484c5eb
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
+2.39.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
