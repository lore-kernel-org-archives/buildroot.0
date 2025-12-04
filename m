Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6F4D2A532
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 20:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEC15407CA;
	Thu,  4 Dec 2025 20:40:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbh8t5k5MhBd; Thu,  4 Dec 2025 20:40:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0835A407C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764880848;
	bh=5ABQ0tWh0HzBU1NdFb0lQzhaM0B/UIw8wCv1m7V3+8Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=P3gSuZKVeseLGNdYQzOux6T/GChtGQsBlNa2ncRj3S12WGG55CPdm9R5YuI+Epe8J
	 lLxnvm3xySwGMsRECIebT2nRz0QRNast5s1s2oECUM9vs68m5p4FakWYuzdBIQM9ZR
	 yjox4mRZvcWuH1of7aHNSnOOOYdZckB01W/wSY07HBmGpdTa43oj6NblqrWUTL/A5I
	 pIxp/RQIj2muF1F4qgaU6HBXMs6gepek49cqmKIv7e7Bv5JKjBdfKz8slZMR/Y+QYd
	 3arGCzHrXYArOfydedaXFZGa1ODcR8J0JQjrW6lPjNB0gU3HLHZmFRjrd68Ed2crIh
	 nHWgcmbGZR0dA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0835A407C8;
	Thu,  4 Dec 2025 20:40:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6175E1A9
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B803540A02
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:40:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nREKmYHMisoF for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 20:40:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 781F8409FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 781F8409FF
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:40:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7408D86511; Thu,  4 Dec 2025 20:40:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Dec 2025 13:20:59 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 15ac852c823fe8f17a1e95f17d55995d23cc14df
X-Git-Newrev: c5e54e26ddcb33b6432942d6d1062da26363ad42
X-Patchwork-Hint: ignore
Message-Id: <20251204204038.7408D86511@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/oprofile: add
 upstream patch to fix build with newer gcc
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c5e54e26ddcb33b6432942d6d1062da26363ad42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Fixes:
https://autobuild.buildroot.net/results/e12/e12de278cb7bb0ecc0d44dd9c69d3832ede946de/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit cffb057b900ab8f3a9dab92f3284ad9f74eddd4f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
