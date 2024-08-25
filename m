Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A86C5321E
	for <buildroot@archiver.kernel.org>; Sun, 25 Aug 2024 14:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CB2560087;
	Sun, 25 Aug 2024 14:23:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nhPB4FRsbkb6; Sun, 25 Aug 2024 14:23:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FADB605A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FADB605A8;
	Sun, 25 Aug 2024 14:23:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9672B1BF2BF
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 14:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8314080F4D
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 14:23:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rb_DpStvC9s3 for <buildroot@lists.busybox.net>;
 Sun, 25 Aug 2024 14:23:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2583E80F4C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2583E80F4C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2583E80F4C
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 14:23:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cce6.dip0.t-ipconnect.de [79.214.204.230])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E1E14A4C11E2
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 16:23:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57698)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1siE9L-000000001tc-1A0U
 for buildroot@buildroot.org; Sun, 25 Aug 2024 14:23:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 25 Aug 2024 16:23:23 +0200
Message-Id: <20240825142323.1780341-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1724595803;
 bh=fYtCissUcdCeMn2g0EytAvs1O3nrb9TlBbi3jP53FzY=;
 h=From:To:Subject:Date:From;
 b=GV8FAmmXq8oeQXrzkOUK2Fg+rI25O7Xn863Y0pI8fwdgePUa5Jbtmf1wQxTd7uCRi
 IZn4jmWp59e/0ttQCJA7sZI+efL9jj4VdIWp5PRWbWL6biAzapzmoIAWNDvA4bfz85
 U6Y/SFmmXSTxc8P3ozRh1V2CRD87qKSphT/9faaiX2iN0465ciXTkLBzpOdSuUHg7t
 zqySToeRQEQpaR5BI+D337a9EauFyQ19Au7JzZL0qC9GfpImAJTk3Z2rLXy3/uXVOo
 IOWtTzXmBLXX7OgIf/32lmnvsR/Q7blg1AHKQWKOQwptdbT6N9ZPb3xIxym1TKSip7
 c8UypyIE1gOVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=GV8FAmmX
Subject: [Buildroot] [PATCH v2 1/1] package/php: Fix build on arm
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
v2: rewritten patch to fix configure.ac (Thomas)

 ...onfigure-check-for-aarch64-CRC32-API.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/php/0006-Autotools-fix-configure-check-for-aarch64-CRC32-API.patch

diff --git a/package/php/0006-Autotools-fix-configure-check-for-aarch64-CRC32-API.patch b/package/php/0006-Autotools-fix-configure-check-for-aarch64-CRC32-API.patch
new file mode 100644
index 0000000000..f2cef640be
--- /dev/null
+++ b/package/php/0006-Autotools-fix-configure-check-for-aarch64-CRC32-API.patch
@@ -0,0 +1,48 @@
+From fc8136dc90e4c42a72666ab74f37e2fdc8794fee Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 25 Aug 2024 15:56:37 +0200
+Subject: [PATCH] Autotools: fix configure check for aarch64 CRC32 API
+
+On arm32 bit the check succeeds leading to a build error later on:
+
+/home/autobuild/autobuild/instance-3/output-1/build/php-8.3.10/ext/standard/crc32.c:70:12:
+ error: 'armv8-a' does not support feature 'nothing'
+   70 | #   pragma GCC target ("+nothing+crc")
+
+Upstream: https://github.com/php/php-src/pull/15587
+
+Co-authored-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+[http://lists.busybox.net/pipermail/buildroot/2024-August/761151.html]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Bernd: rebased for 8.3.10]
+---
+ configure.ac | 14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 491963daae..2693ba09f4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -754,7 +754,19 @@
+ PHP_CHECK_IN_ADDR_T
+ 
+ AC_CACHE_CHECK([for aarch64 CRC32 API], ac_cv_func___crc32d,
+-[AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <arm_acle.h>]],[[__crc32d(0, 0);]])],[ac_cv_func___crc32d=yes],[ac_cv_func___crc32d="no"])])
++[AC_LINK_IFELSE([AC_LANG_PROGRAM([[
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
++]], [[__crc32d(0, 0);]])],[ac_cv_func___crc32d=yes],[ac_cv_func___crc32d="no"])])
+ if test "$ac_cv_func___crc32d" = "yes"; then
+   AC_DEFINE([HAVE_AARCH64_CRC32], [1], [Define when aarch64 CRC32 API is available.])
+ fi
+-- 
+2.39.2
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
