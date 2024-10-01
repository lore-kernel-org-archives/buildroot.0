Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA7BCEACFB
	for <buildroot@archiver.kernel.org>; Tue,  1 Oct 2024 19:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6BAF40AE3;
	Tue,  1 Oct 2024 19:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id crEx9RwhM2dQ; Tue,  1 Oct 2024 19:33:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2699140AEE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2699140AEE;
	Tue,  1 Oct 2024 19:33:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 73BCE1BF28C
 for <buildroot@lists.busybox.net>; Tue,  1 Oct 2024 19:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61F52400E2
 for <buildroot@lists.busybox.net>; Tue,  1 Oct 2024 19:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uLuWTO12_F7W for <buildroot@lists.busybox.net>;
 Tue,  1 Oct 2024 19:33:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 798E4400E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 798E4400E0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 798E4400E0
 for <buildroot@buildroot.org>; Tue,  1 Oct 2024 19:33:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0480.dip0.t-ipconnect.de [91.58.4.128])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 34E0BA4C2E84
 for <buildroot@buildroot.org>; Tue,  1 Oct 2024 21:33:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57196)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1svice-0000000024C-2QDz
 for buildroot@buildroot.org; Tue, 01 Oct 2024 19:33:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  1 Oct 2024 21:33:24 +0200
Message-Id: <20241001193324.5288-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1727811205;
 bh=ztD4VKBTkM4G+48kuJZE0W7VSRYlrXulSsu5Kfajgz4=;
 h=From:To:Subject:Date:From;
 b=BHjUdb6BMzNPki7D77a7xv4FfFNiknn9CKsfwl6SdtvElxzGFwwQEB7DfbbyMuG1y
 tIHljJRieDsAC4K9TvuUV9mysUdm7VZd6Qnwcivv7fHQCi4xwyi0bDa3TqU4xtJ3tl
 q65YXnhOULLceHbi5F/mi0S6PSDIMnysB1uBfGKhibLr+uuYf8rQThVuI6YRO01nd9
 iRNwUK2XhBdFlU5JCs39NxNIs0TRZw0zbeDwAYk2mBFXVWLV9SihFrfzO7KbKsQ+fE
 l6LmStCPAPh7iLZ/tHaaeLEWaSuriUaIugdC8j1yemXpzYtM7rRjkRdqZTvaUCgM/F
 z/aV5UpqxNNJA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=BHjUdb6B
Subject: [Buildroot] [PATCH 1/1] package/php: security bump version to 8.3.12
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

Removed patch which is included in this release.

Fixes CVE-2024-8926, CVE-2024-8927, CVE-2024-9026, and CVE-2024-8925.

Changelog: https://www.php.net/ChangeLog-8.php#PHP_8_3
Release notes: https://news-web.php.net/php.announce/438

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...onfigure-check-for-aarch64-CRC32-API.patch | 56 -------------------
 package/php/php.hash                          |  2 +-
 package/php/php.mk                            |  2 +-
 3 files changed, 2 insertions(+), 58 deletions(-)
 delete mode 100644 package/php/0006-Autotools-fix-configure-check-for-aarch64-CRC32-API.patch

diff --git a/package/php/0006-Autotools-fix-configure-check-for-aarch64-CRC32-API.patch b/package/php/0006-Autotools-fix-configure-check-for-aarch64-CRC32-API.patch
deleted file mode 100644
index 46e6558dcd..0000000000
--- a/package/php/0006-Autotools-fix-configure-check-for-aarch64-CRC32-API.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 5947db6bb8e336252337fb0194c3b8e834d100b6 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Sun, 25 Aug 2024 18:00:29 +0200
-Subject: [PATCH] Fix GH-15587: Autotools: fix configure check for aarch64
- CRC32 API
-
-On arm32 bit the check succeeds leading to a build error later on:
-
-/home/autobuild/autobuild/instance-3/output-1/build/php-8.3.10/ext/standard/crc32.c:70:12:
- error: 'armv8-a' does not support feature 'nothing'
-   70 | #   pragma GCC target ("+nothing+crc")
-
-Upstream: https://github.com/php/php-src/commit/5947db6bb8e336252337fb0194c3b8e834d100b6
-
-Co-authored-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-[http://lists.busybox.net/pipermail/buildroot/2024-August/761151.html]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- configure.ac | 24 +++++++++++++++++++-----
- 1 file changed, 19 insertions(+), 5 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 1142c9459d71..fb59a81700f4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -738,11 +738,25 @@ AC_FUNC_ALLOCA
- PHP_TIME_R_TYPE
- PHP_CHECK_IN_ADDR_T
- 
--AC_CACHE_CHECK([for aarch64 CRC32 API], ac_cv_func___crc32d,
--[AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <arm_acle.h>]],[[__crc32d(0, 0);]])],[ac_cv_func___crc32d=yes],[ac_cv_func___crc32d="no"])])
--if test "$ac_cv_func___crc32d" = "yes"; then
--  AC_DEFINE([HAVE_AARCH64_CRC32], [1], [Define when aarch64 CRC32 API is available.])
--fi
-+AC_CACHE_CHECK([for aarch64 CRC32 API], [ac_cv_func___crc32d],
-+[AC_LINK_IFELSE([AC_LANG_PROGRAM([
-+#include <arm_acle.h>
-+# if defined(__GNUC__)
-+#  if!defined(__clang__)
-+#   pragma GCC push_options
-+#   pragma GCC target ("+nothing+crc")
-+#  elif defined(__APPLE__)
-+#   pragma clang attribute push(__attribute__((target("crc"))), apply_to=function)
-+#  else
-+#   pragma clang attribute push(__attribute__((target("+nothing+crc"))), apply_to=function)
-+#  endif
-+# endif
-+], [__crc32d(0, 0);])],
-+[ac_cv_func___crc32d=yes],
-+[ac_cv_func___crc32d=no])])
-+AS_VAR_IF([ac_cv_func___crc32d], [yes],
-+  [AC_DEFINE([HAVE_AARCH64_CRC32], [1],
-+    [Define to 1 when aarch64 CRC32 API is available.])])
- 
- dnl Check for asm goto support.
- AC_CACHE_CHECK([for asm goto], ac_cv__asm_goto,
diff --git a/package/php/php.hash b/package/php/php.hash
index 7df051df4e..3110e205ef 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  b862b098a08ab9bf4b36ed12c7d0d9f65353656b36fb0e3c5344093aceb35802  php-8.3.11.tar.xz
+sha256  f774e28633e26fc8c5197f4dae58ec9e3ff87d1b4311cbc61ab05a7ad24bd131  php-8.3.12.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index d7788107c1..3202902322 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.3.11
+PHP_VERSION = 8.3.12
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
