Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D09CAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 18:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDC626F513;
	Thu, 11 Sep 2025 18:55:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pSHC9NkPBlAG; Thu, 11 Sep 2025 18:55:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB7766F511
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB7766F511;
	Thu, 11 Sep 2025 18:55:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 034B0E20
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B3C56F185
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:54:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zXgKI7j2B18k for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 18:54:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E20CD61C69
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E20CD61C69
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:54:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF330840F1; Thu, 11 Sep 2025 18:54:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 17:03:37 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6360671c2801531e41ea52fff05829238dd3332f
X-Git-Newrev: 3394bb0ff9ac4587bf38accfb7147a390825fd4a
X-Patchwork-Hint: ignore
Message-Id: <20250911185453.CF330840F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mbpfan: fix build
 on musl / uclibc-ng
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

commit: https://git.buildroot.net/buildroot/commit/?id=3394bb0ff9ac4587bf38accfb7147a390825fd4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixes https://autobuild.buildroot.net/results/9526503fe8e756bd4444f1fb1e9cf1391c461901/

mbpfan uses vsyslog(), which is not in POSIX so only exposed by <syslog.h>
on musl and uclibc-ng if we define _DEFAULT_SOURCE:

https://git.musl-libc.org/cgit/musl/tree/include/syslog.h#n64
https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/tree/include/sys/syslog.h#n200

Add a patch submitted upstream to do this.

[Peter: add patch rather than passing _DEFAULT_SOURCE in mbpfan.mk]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 759a08633ea80e90cb91984b5f87d82304e711b9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...kefile-util.c-fix-build-on-musl-uClibc-ng.patch | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/package/mbpfan/0001-Makefile-util.c-fix-build-on-musl-uClibc-ng.patch b/package/mbpfan/0001-Makefile-util.c-fix-build-on-musl-uClibc-ng.patch
new file mode 100644
index 0000000000..ac15143e2e
--- /dev/null
+++ b/package/mbpfan/0001-Makefile-util.c-fix-build-on-musl-uClibc-ng.patch
@@ -0,0 +1,62 @@
+From 924e38f159e4f5906f88cd8ddbe27f273c601cb0 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Mon, 1 Sep 2025 12:08:53 +0200
+Subject: [PATCH] {Makefile,util.c}: fix build on musl / uClibc-ng
+
+vsyslog() is not in POSIX, so only exposed by <syslog.h> on musl and
+uclibc-ng if we define _DEFAULT_SOURCE.
+
+https://git.musl-libc.org/cgit/musl/tree/include/syslog.h#n64
+https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/tree/include/sys/syslog.h#n200
+
+While we are at it, drop the glibc-implementation-specific __USE_MISC define
+in src/util.c to get rid of a double definition:
+
+src/util.c:3: warning: "__USE_MISC" redefined
+    3 | #define __USE_MISC
+      |
+In file included from /usr/include/x86_64-linux-gnu/bits/libc-header-start.h:33,
+                 from /usr/include/stdio.h:27,
+                 from src/util.c:2:
+/usr/include/features.h:395: note: this is the location of the previous definition
+  395 | # define __USE_MISC     1
+
+On glibc (and uClibc-ng) the internal __USE_MISC symbol gets defined if
+_DEFAULT_SOURCE is:
+
+https://github.com/bminor/glibc/blob/master/include/features.h#L417-L419
+
+Upstream: https://github.com/linux-on-mac/mbpfan/pull/271
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ Makefile   | 2 +-
+ src/util.c | 1 -
+ 2 files changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 94d72ee..ff1b7e6 100644
+--- a/Makefile
++++ b/Makefile
+@@ -19,7 +19,7 @@ BINFLAG = -o
+ INCLUDES =
+ LIBS = -lm
+ LIBPATH =
+-CFLAGS += $(COPT) -g $(INCLUDES) -Wall -Wextra -Wno-unused-function -Wno-unused-parameter -std=c99 -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=500
++CFLAGS += $(COPT) -g $(INCLUDES) -Wall -Wextra -Wno-unused-function -Wno-unused-parameter -std=c99 -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=500 -D_DEFAULT_SOURCE
+ LDFLAGS += $(LIBPATH) -g
+ 
+ OBJS := $(patsubst %.$(C),%.$(OBJ),$(wildcard $(SOURCE_PATH)*.$(C)))
+diff --git a/src/util.c b/src/util.c
+index df5b03f..25415b9 100644
+--- a/src/util.c
++++ b/src/util.c
+@@ -1,6 +1,5 @@
+ #include <stdarg.h>
+ #include <stdio.h>
+-#define __USE_MISC
+ #define _GNU_SOURCE
+ #include <syslog.h>
+ 
+-- 
+2.39.5
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
