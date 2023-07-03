Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48248C001DD
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 19:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB53381585;
	Mon,  3 Jul 2023 19:20:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB53381585
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id beCG3VoKG0IW; Mon,  3 Jul 2023 19:20:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C6EA81DEC;
	Mon,  3 Jul 2023 19:20:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C6EA81DEC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A1BC1BF34B
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23DC960AAD
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:20:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23DC960AAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N_myzNCgRpUg for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 19:20:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EE6D6080B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5EE6D6080B
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 19:20:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7C0A5A4C0946
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 21:20:33 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41412)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qGP68-0001QQ-1A
 for buildroot@buildroot.org; Mon, 03 Jul 2023 21:20:32 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  3 Jul 2023 21:20:32 +0200
Message-Id: <20230703192032.270675-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688412033;
 bh=ADdwxZRwNP3473QfXJYJz80a8BSYw1iVjTR2aGrD62Y=;
 h=From:To:Subject:Date:From;
 b=vWwVdB5W8oH1slLUDNEXW39z1wNtc23E/ySvBBizdRaqC+ifaE6vp/oIJgszvqe/U
 2B6rboFkdlHMSS3C8EAeEouxjyWbVYsPVuH2AQg4ZqvFgmy6PVuNnOCp2YLmCz38Fx
 sIA/plmepbog0tyINu5vKfGoxWzl5sM6OMfLBQ9MWQNfmxpgfytxk5LHLmO+FdJTRi
 wsSbMYMjxXII99siAe0I0g75wQF+3li9HbGAFuiBTUKjb6XJ0mwZCG1z4sy6HQpV54
 ej2FBbDC0/XJm2fLtd67nZ3g3lH0b3WInM7XUWq+E2lxqxTtXKEkM5H1kqnqs/b/YM
 NDzJ7dg4YlKRA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=vWwVdB5W
Subject: [Buildroot] [PATCH v2 1/1] package/alsa-lib: Fix symver build error
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/1e9/1e965d83d75615f35308440c5db044314a349357/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: fixed typo in include/alsa-symbols.h (Arnout)

 ...ver-build-error-on-non-ELF-platforms.patch | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 package/alsa-lib/0002-Fix-symver-build-error-on-non-ELF-platforms.patch

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
