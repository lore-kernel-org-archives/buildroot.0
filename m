Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B802C5321D
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 16:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F81160786;
	Mon, 26 Aug 2024 16:34:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YUA9HDDDZ5_o; Mon, 26 Aug 2024 16:34:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 085316077C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 085316077C;
	Mon, 26 Aug 2024 16:34:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11F261BF33F
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 16:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B7AE80A06
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 16:34:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PCo1Ou8Z-d8n for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 16:34:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29CAA80580
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29CAA80580
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 16:34:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 259B6863F6; Mon, 26 Aug 2024 16:34:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Aug 2024 18:34:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2965632a312008f10ce608b6d1ef67837ff6dc69
X-Git-Newrev: 4f0243567d74323082e53c46e777b326476f5c2d
X-Patchwork-Hint: ignore
Message-Id: <20240826163445.259B6863F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php: fix build on arm
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f0243567d74323082e53c46e777b326476f5c2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/5e8ef91d84018ccdf85f2156292feb3460bfe698/

Without this patch configure wrongfully detects aarch64 support:

    checking for aarch64 CRC32 API... yes

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...fix-configure-check-for-aarch64-CRC32-API.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/php/0006-Autotools-fix-configure-check-for-aarch64-CRC32-API.patch b/package/php/0006-Autotools-fix-configure-check-for-aarch64-CRC32-API.patch
new file mode 100644
index 0000000000..46e6558dcd
--- /dev/null
+++ b/package/php/0006-Autotools-fix-configure-check-for-aarch64-CRC32-API.patch
@@ -0,0 +1,56 @@
+From 5947db6bb8e336252337fb0194c3b8e834d100b6 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 25 Aug 2024 18:00:29 +0200
+Subject: [PATCH] Fix GH-15587: Autotools: fix configure check for aarch64
+ CRC32 API
+
+On arm32 bit the check succeeds leading to a build error later on:
+
+/home/autobuild/autobuild/instance-3/output-1/build/php-8.3.10/ext/standard/crc32.c:70:12:
+ error: 'armv8-a' does not support feature 'nothing'
+   70 | #   pragma GCC target ("+nothing+crc")
+
+Upstream: https://github.com/php/php-src/commit/5947db6bb8e336252337fb0194c3b8e834d100b6
+
+Co-authored-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+[http://lists.busybox.net/pipermail/buildroot/2024-August/761151.html]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ configure.ac | 24 +++++++++++++++++++-----
+ 1 file changed, 19 insertions(+), 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1142c9459d71..fb59a81700f4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -738,11 +738,25 @@ AC_FUNC_ALLOCA
+ PHP_TIME_R_TYPE
+ PHP_CHECK_IN_ADDR_T
+ 
+-AC_CACHE_CHECK([for aarch64 CRC32 API], ac_cv_func___crc32d,
+-[AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <arm_acle.h>]],[[__crc32d(0, 0);]])],[ac_cv_func___crc32d=yes],[ac_cv_func___crc32d="no"])])
+-if test "$ac_cv_func___crc32d" = "yes"; then
+-  AC_DEFINE([HAVE_AARCH64_CRC32], [1], [Define when aarch64 CRC32 API is available.])
+-fi
++AC_CACHE_CHECK([for aarch64 CRC32 API], [ac_cv_func___crc32d],
++[AC_LINK_IFELSE([AC_LANG_PROGRAM([
++#include <arm_acle.h>
++# if defined(__GNUC__)
++#  if!defined(__clang__)
++#   pragma GCC push_options
++#   pragma GCC target ("+nothing+crc")
++#  elif defined(__APPLE__)
++#   pragma clang attribute push(__attribute__((target("crc"))), apply_to=function)
++#  else
++#   pragma clang attribute push(__attribute__((target("+nothing+crc"))), apply_to=function)
++#  endif
++# endif
++], [__crc32d(0, 0);])],
++[ac_cv_func___crc32d=yes],
++[ac_cv_func___crc32d=no])])
++AS_VAR_IF([ac_cv_func___crc32d], [yes],
++  [AC_DEFINE([HAVE_AARCH64_CRC32], [1],
++    [Define to 1 when aarch64 CRC32 API is available.])])
+ 
+ dnl Check for asm goto support.
+ AC_CACHE_CHECK([for asm goto], ac_cv__asm_goto,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
