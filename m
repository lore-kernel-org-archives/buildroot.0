Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F43C5320E
	for <buildroot@archiver.kernel.org>; Sun, 25 Aug 2024 17:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF7C0606A5;
	Sun, 25 Aug 2024 17:03:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kPk8g8drSyAQ; Sun, 25 Aug 2024 17:03:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B63A7605ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B63A7605ED;
	Sun, 25 Aug 2024 17:03:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 817C21BF4E6
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 17:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F9F440206
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 17:03:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FvwHrcA9rRLf for <buildroot@lists.busybox.net>;
 Sun, 25 Aug 2024 17:03:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8A66F401FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A66F401FC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A66F401FC
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 17:03:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cb60.dip0.t-ipconnect.de [79.214.203.96])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E1EB5A4C1466
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 19:03:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51048)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1siGdy-000000001fg-3YiN
 for buildroot@buildroot.org; Sun, 25 Aug 2024 17:03:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 25 Aug 2024 19:03:11 +0200
Message-Id: <20240825170311.958652-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1724605391;
 bh=4kflsQEsMlfzxdM/FnVlq5EmAwcwKVckyuRBIjpaSRo=;
 h=From:To:Subject:Date:From;
 b=CWxkwgKdzAu8NLh30fkn83TPLA+mrBvAUn15qfQk+PFj8+6SiyLjn9EyId8Rmu9pO
 yTP0Ym5/csSgkWqRd4wjUiXZHQInhXGowVqfB2O4p+nf242bUg0SLC+rH1bjcMVdJm
 TwN8mlC0NbABZ6vKvQ4Tl00fjukW2+zKUWg/AOGAdqnDQFVM88itU981a5AQ4Y1XOu
 /eio9wA+AP3fXSwEUkAIhStCzpAC2FNKRZMpjYj79qCUk1D+oIWqSMewGMAxD8a4mS
 XAh3TQG1eqUDJHwiHCT8NRNdodRHK+tRe+B7a+ysVlgNJlQQV2JZtHabnhVTn8GFw3
 /k4FAKVTHbWDg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=CWxkwgKd
Subject: [Buildroot] [PATCH v3 1/1] package/php: Fix build on arm
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
http://autobuild.buildroot.org/results/5e8ef91d84018ccdf85f2156292feb3460bfe698/

Without this patch configure wrongfully detects aarch64 support:

    checking for aarch64 CRC32 API... yes

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v3: switch patch to upstream commit
v2: rewritten patch to fix configure.ac (Thomas)

 ...onfigure-check-for-aarch64-CRC32-API.patch | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/php/0006-Autotools-fix-configure-check-for-aarch64-CRC32-API.patch

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
