Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D30C04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 21:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3123C82D04;
	Tue, 14 May 2024 21:57:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HtgtYQkdfDhR; Tue, 14 May 2024 21:57:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F6F9827A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F6F9827A0;
	Tue, 14 May 2024 21:57:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 189291BF42D
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 21:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05F1E827A0
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 21:57:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n0FzTmvr_-cf for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 21:57:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E69A28232C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E69A28232C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E69A28232C
 for <buildroot@buildroot.org>; Tue, 14 May 2024 21:57:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a09e6.dip0.t-ipconnect.de [91.58.9.230])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0FC97A4C43FE
 for <buildroot@buildroot.org>; Tue, 14 May 2024 23:57:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57348)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1s7092-000000000gb-3wQ9
 for buildroot@buildroot.org; Tue, 14 May 2024 21:57:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 14 May 2024 23:57:12 +0200
Message-Id: <20240514215712.2866745-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1715723833;
 bh=jjEHSnL73SCiE89gtji1lp1YfkYXiIQQBmZ9NkFVZk8=;
 h=From:To:Subject:Date:From;
 b=DmCxTWCpbU3Yg2RTIRLpOglACLCyDMmARtyga63uxNzwVNvbhQOgYS+194Un/K92+
 MCVZHtmLiEAyen5Ogye0ID59vOTU7OpB3BqDBHCXPBdAYsrZZ5H9X5Ex4MqPA+hh7F
 Y/aht/g+mSuZx9GsZJtVlHTDxVmV+yZNI7tvQ+xgr7fBGhM4xrfGKBhk2WSoJxUgS4
 rCrlcXoVBYpCnpxWeKQOCM37VDfTyfef8Xy2KZ44IjL2ZBRWqJKLkpok1u1qnR56qB
 mHGyT4YVSHu0haGBvlqZ1ldvi14Sa1XoyhoMRthTiuj/1ylPOaG+WFHR4UZ+5nDIHM
 TBm8BJMZxRLXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=DmCxTWCp
Subject: [Buildroot] [PATCH 1/1] package/php: bump version to 8.3.7
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

Changelog: https://www.php.net/ChangeLog-8.php#PHP_8_3
Release notes: https://news-web.php.net/php.announce/427

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ll_stack.c-fix-build-without-pthread.patch | 39 -------------------
 package/php/php.hash                          |  2 +-
 package/php/php.mk                            |  2 +-
 3 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 package/php/0006-Zend-zend_call_stack.c-fix-build-without-pthread.patch

diff --git a/package/php/0006-Zend-zend_call_stack.c-fix-build-without-pthread.patch b/package/php/0006-Zend-zend_call_stack.c-fix-build-without-pthread.patch
deleted file mode 100644
index 10b0083655..0000000000
--- a/package/php/0006-Zend-zend_call_stack.c-fix-build-without-pthread.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From c3e37c438a11d59d858fcc7b46eac00a8074972b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 30 Mar 2024 17:51:55 +0100
-Subject: [PATCH] Zend/zend_call_stack.c: fix build without pthread
-
-Fix the following build failure without pthread raised since version
-8.3.0 and
-https://github.com/php/php-src/commit/a11c8a30399e90c17c287b9656c0077bc5131c9c:
-
-/home/buildroot/instance-0/output-1/build/php-8.3.4/Zend/zend_call_stack.c:39:11: fatal error: pthread.h: No such file or directory
-   39 | # include <pthread.h>
-      |           ^~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/a4ef648a9da50b26ed56d5d490e4cf5a1bfff970
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/php/php-src/pull/13843
----
- Zend/zend_call_stack.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/Zend/zend_call_stack.c b/Zend/zend_call_stack.c
-index 97cbed9041..97de938a0f 100644
---- a/Zend/zend_call_stack.c
-+++ b/Zend/zend_call_stack.c
-@@ -35,7 +35,8 @@
- #  include <sys/types.h>
- # endif
- #endif /* ZEND_WIN32 */
--#if defined(__linux__) || defined(__FreeBSD__) || defined(__APPLE__) || defined(__OpenBSD__)
-+#if (defined(HAVE_PTHREAD_GETATTR_NP) && defined(HAVE_PTHREAD_ATTR_GETSTACK)) || \
-+    defined(__FreeBSD__) || defined(__APPLE__) || defined(__OpenBSD__)
- # include <pthread.h>
- #endif
- #ifdef __FreeBSD__
--- 
-2.43.0
-
diff --git a/package/php/php.hash b/package/php/php.hash
index 4378d7ed07..9b25eabd32 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  53c8386b2123af97626d3438b3e4058e0c5914cb74b048a6676c57ac647f5eae  php-8.3.6.tar.xz
+sha256  d53433c1ca6b2c8741afa7c524272e6806c1e895e5912a058494fea89988570a  php-8.3.7.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 5b26ec90e2..ad2d901dfd 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.3.6
+PHP_VERSION = 8.3.7
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
