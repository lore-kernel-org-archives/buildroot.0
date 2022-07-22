Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C32C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 07:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28FAF81751;
	Fri, 22 Jul 2022 07:42:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28FAF81751
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GNcp1NsZR3aS; Fri, 22 Jul 2022 07:42:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EAC88144A;
	Fri, 22 Jul 2022 07:42:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EAC88144A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 890E31BF36D
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5307660EEC
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:40:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5307660EEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7i8H3G0CqwPh for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 07:40:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E5A060EEE
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 07:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E5A060EEE
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7B2FC8414F; Fri, 22 Jul 2022 07:27:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 09:39:02 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: fcd5e110cf286fa9ebd2a38c367a7d85cd25f945
X-Git-Newrev: c4c7386d321edfb6a1c72f94bbffb6201b1b692b
X-Patchwork-Hint: ignore
Message-Id: <20220722072724.7B2FC8414F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/libcurl: fix
 build without sched_yield
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

commit: https://git.buildroot.net/buildroot/commit/?id=c4c7386d321edfb6a1c72f94bbffb6201b1b692b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fix the following build failure without sched_yield raised since bump to
version 7.84.0 in commit b034109dd60a429690acf9c5501c6658c53eae13:

In file included from easy.c:89:
easy_lock.h: In function 'curl_simple_lock_lock':
easy_lock.h:56:7: error: implicit declaration of function 'sched_yield' [-Werror=implicit-function-declaration]
   56 |       sched_yield();
      |       ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/fbc80a0002d640210c81a4c518856c02669059b7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Baruch Siach <baruch@tkos.co.il>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a5adc9b658fc137d5952f9bdea8dc9a4d007d5fc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...include-sched-h-if-available-to-fix-build.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/libcurl/0001-easy_lock-h-include-sched-h-if-available-to-fix-build.patch b/package/libcurl/0001-easy_lock-h-include-sched-h-if-available-to-fix-build.patch
new file mode 100644
index 0000000000..b5f0a87218
--- /dev/null
+++ b/package/libcurl/0001-easy_lock-h-include-sched-h-if-available-to-fix-build.patch
@@ -0,0 +1,30 @@
+From e2e7f54b7bea521fa8373095d0f43261a720cda0 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 27 Jun 2022 08:46:21 +0200
+Subject: [PATCH] easy_lock.h: include sched.h if available to fix build
+
+Patched-by: Harry Sintonen
+
+Closes #9054
+
+[Retrieved from:
+https://github.com/curl/curl/commit/e2e7f54b7bea521fa8373095d0f43261a720cda0]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/easy_lock.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/easy_lock.h b/lib/easy_lock.h
+index 819f50ce815b8..1f54289ceb2d3 100644
+--- a/lib/easy_lock.h
++++ b/lib/easy_lock.h
+@@ -36,6 +36,9 @@
+ 
+ #elif defined (HAVE_ATOMIC)
+ #include <stdatomic.h>
++#if defined(HAVE_SCHED_YIELD)
++#include <sched.h>
++#endif
+ 
+ #define curl_simple_lock atomic_bool
+ #define CURL_SIMPLE_LOCK_INIT false
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
