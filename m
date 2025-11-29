Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CF1D116F3
	for <buildroot@archiver.kernel.org>; Sat, 29 Nov 2025 10:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B53A413EC;
	Sat, 29 Nov 2025 10:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VAWTAyE7LW5J; Sat, 29 Nov 2025 10:24:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5FE041409
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5FE041409;
	Sat, 29 Nov 2025 10:24:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 256E8273
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 10:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17A2140336
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 10:24:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ovQSl9O1OQBX for <buildroot@buildroot.org>;
 Sat, 29 Nov 2025 10:24:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E83A4021D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E83A4021D
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 10:24:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D3C685FCA; Sat, 29 Nov 2025 10:24:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Nov 2025 11:18:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f536fd4a2e883309ab2fe97532fc94f608e31de1
X-Git-Newrev: cffb057b900ab8f3a9dab92f3284ad9f74eddd4f
X-Patchwork-Hint: ignore
Message-Id: <20251129102456.5D3C685FCA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/oprofile: add upstream patch to
 fix build with newer gcc
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cffb057b900ab8f3a9dab92f3284ad9f74eddd4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://autobuild.buildroot.net/results/e12/e12de278cb7bb0ecc0d44dd9c69d3832ede946de/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...003-Fix-autoconf-detection-of-perf_events.patch | 40 ++++++++++++++++++++++
 package/oprofile/oprofile.mk                       |  1 +
 2 files changed, 41 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
