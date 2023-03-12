Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E206AC6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 14:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79F0940484;
	Sun, 12 Mar 2023 14:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79F0940484
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zxzR_YsIBMX4; Sun, 12 Mar 2023 14:53:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4E7140283;
	Sun, 12 Mar 2023 14:53:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4E7140283
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 57D321BF31F
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 14:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 320D3607F0
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 14:53:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 320D3607F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sZd3StbmYywz for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 14:53:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BEC5607E1
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 14:53:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BEC5607E1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 36A1386F34; Sun, 12 Mar 2023 14:53:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 15:52:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3bac7eb69d8a9141e11076628df78ddffae349ba
X-Git-Newrev: b857680ea903feffa4497f4b916e6505e3982378
X-Patchwork-Hint: ignore
Message-Id: <20230312145317.36A1386F34@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl_433: fix build without threads
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b857680ea903feffa4497f4b916e6505e3982378
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without threads raised since bump to
version 22.11 in commit 6f848c068f8ab0cc67fb48582e00221158ddc8cb:

In file included from /home/buildroot/autobuild/instance-3/output-1/build/rtl_433-22.11/src/data_tag.c:17:
/home/buildroot/autobuild/instance-3/output-1/build/rtl_433-22.11/include/mongoose.h:407:10: fatal error: pthread.h: No such file or directory
  407 | #include <pthread.h>
      |          ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/9f1677fc5a4568be0b9c121060c5d821ac2ae21b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-minor-Fix-mongoose-build-without-threads.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/rtl_433/0002-minor-Fix-mongoose-build-without-threads.patch b/package/rtl_433/0002-minor-Fix-mongoose-build-without-threads.patch
new file mode 100644
index 0000000000..85bc45147a
--- /dev/null
+++ b/package/rtl_433/0002-minor-Fix-mongoose-build-without-threads.patch
@@ -0,0 +1,42 @@
+From 707b51ecbc5598eed2fb67962232bf3fe0e96f81 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 27 Dec 2022 21:30:54 +0100
+Subject: [PATCH] minor: Fix mongoose build without threads (#2291)
+
+Fix the following build failure without threads:
+
+In file included from /home/buildroot/autobuild/instance-3/output-1/build/rtl_433-22.11/src/data_tag.c:17:
+/home/buildroot/autobuild/instance-3/output-1/build/rtl_433-22.11/include/mongoose.h:407:10: fatal error: pthread.h: No such file or directory
+  407 | #include <pthread.h>
+      |          ^~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/9f1677fc5a4568be0b9c121060c5d821ac2ae21b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/merbanan/rtl_433/commit/707b51ecbc5598eed2fb67962232bf3fe0e96f81]
+---
+ include/mongoose.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/mongoose.h b/include/mongoose.h
+index 1173b3fc7..b111ea34e 100644
+--- a/include/mongoose.h
++++ b/include/mongoose.h
+@@ -404,7 +404,6 @@ unsigned int sleep(unsigned int seconds);
+ #include <math.h>
+ #include <netdb.h>
+ #include <netinet/in.h>
+-#include <pthread.h>
+ #include <signal.h>
+ #include <stdarg.h>
+ #include <stdbool.h>
+@@ -4658,6 +4657,7 @@ size_t mg_fwrite(const void *ptr, size_t size, size_t count, FILE *f);
+ #endif /* MG_ENABLE_FILESYSTEM */
+ 
+ #if MG_ENABLE_THREADS
++#include <pthread.h>
+ /*
+  * Starts a new detached thread.
+  * Arguments and semantics are the same as pthead's `pthread_create()`.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
