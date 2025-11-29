Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2764DD116F3
	for <buildroot@archiver.kernel.org>; Sat, 29 Nov 2025 07:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98FB960758;
	Sat, 29 Nov 2025 07:28:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XqXWoLyQS9T5; Sat, 29 Nov 2025 07:28:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 827FD60794
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 827FD60794;
	Sat, 29 Nov 2025 07:28:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1586C273
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 07:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0411A60794
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 07:28:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vluIWpg8YFdC for <buildroot@buildroot.org>;
 Sat, 29 Nov 2025 07:28:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7B63E60758
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B63E60758
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B63E60758
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 07:28:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0558.dip0.t-ipconnect.de [91.58.5.88])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9B257A4C0935;
 Sat, 29 Nov 2025 08:28:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49976)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vPFNT-000000005J9-0qvT;
 Sat, 29 Nov 2025 07:28:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 29 Nov 2025 08:28:19 +0100
Message-ID: <20251129072819.395958-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1764401299;
 bh=p6T6B16LKsYgC68B/SRo4C8VeiQw0Fb3UcK3KnJXbCw=;
 h=From:To:Cc:Subject:Date:From;
 b=pXqkPRas449A2jdSOUG8JypKpCK1+F+9N3ZFTnUZkWrZI6XLQR9VRlSLS+j+tRLkv
 OMR1z9M88AixGy34Ql/26I2HCh03cQoYm2wqTjKo4gyOK7ulFPsX9vtfxQ93gVOdAO
 95oTYw6CZqvf8f/qo7zDTIlOOmCtTcMxxy71vVut1PA2tL0uOgmUZa5C1379zHUBnV
 ljJG5/WZdBvdpT9kxw4OMhHzuVq4doRwgAFfdvWngKELvfzlxcV5fAi2r2RC9MWnd2
 s2rBcGw01AO9osk3ZThCxOKv7q9HQ0V/MVmKDmVqVgL+73anzsVzYBUlBMGc0DsuhL
 GrfZhUsnZ2iiQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=pXqkPRas
Subject: [Buildroot] [PATCH 1/1] package/oprofile: add upstream patch to fix
 build with newer gcc
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
https://autobuild.buildroot.net/results/e12/e12de278cb7bb0ecc0d44dd9c69d3832ede946de/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ix-autoconf-detection-of-perf_events.patch | 40 +++++++++++++++++++
 package/oprofile/oprofile.mk                  |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 package/oprofile/0003-Fix-autoconf-detection-of-perf_events.patch

diff --git a/package/oprofile/0003-Fix-autoconf-detection-of-perf_events.patch b/package/oprofile/0003-Fix-autoconf-detection-of-perf_events.patch
new file mode 100644
index 0000000000..759aba5c4b
--- /dev/null
+++ b/package/oprofile/0003-Fix-autoconf-detection-of-perf_events.patch
@@ -0,0 +1,40 @@
+From b0acf9f0c0aac93bf6f3e196d7a52c9632ff4475 Mon Sep 17 00:00:00 2001
+From: Tony Jones <tonyj@suse.de>
+Date: Fri, 8 Nov 2024 13:13:30 -0800
+Subject: [PATCH] Fix autoconf detection of perf_events
+
+The autoconf check for the presence of perf_events api began failing
+on recent openSUSE builds.
+
+checking kernel supports perf_events... conftest.c: In function 'main':
+conftest.c:37:39: error: implicit declaration of function 'getpid' [-Wimplicit-function-declaration]
+   37 |                                 pid = getpid();
+      |                                       ^~~~~~
+conftest.c:38:33: error: implicit declaration of function 'syscall' [-Wimplicit-function-declaration]
+   38 |                                 syscall(__NR_perf_event_open, &attr, pid, 0, -1, 0);
+      |                                 ^~~~~~~
+no
+Error: Your kernel does not appear to have the necessary support to run oprofile.
+
+Upstream: https://sourceforge.net/p/oprofile/oprofile/ci/b0acf9f0c0aac93bf6f3e196d7a52c9632ff4475/
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index dc447f89..363bd440 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -116,6 +116,7 @@ if test "$kernel_may_have_perf_events_support" = "yes"; then
+ 		rm -f test-for-PERF_EVENT_OPEN
+ 		AC_LANG_CONFTEST(
+ 			[AC_LANG_PROGRAM([[#include <linux/perf_event.h>
++				#include <unistd.h>
+ 				#include <asm/unistd.h>
+ 				#include <sys/types.h>
+ 				#include <string.h>
+-- 
+2.47.3
+
diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index 590e63b4ac..72cdc856c3 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -13,6 +13,7 @@ OPROFILE_CONF_OPTS = \
 	--disable-account-check \
 	--with-kernel=$(STAGING_DIR)/usr
 # 0002-fix-static-build-with-binutils-2.40.patch
+# 0003-Fix-autoconf-detection-of-perf_events.patch
 OPROFILE_AUTORECONF = YES
 
 define OPROFILE_CREATE_MISSING_FILES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
