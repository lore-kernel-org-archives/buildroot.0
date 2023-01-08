Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B802C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AB724EFAB;
	Tue, 21 Feb 2023 00:24:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AB724EFAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wgJ_DjaQuGvV; Tue, 21 Feb 2023 00:24:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDD024F18D;
	Tue, 21 Feb 2023 00:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDD024F18D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1DB5B1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B9F46100B
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B9F46100B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JBQjMuVdlo1r for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CA5E6FAD4
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CA5E6FAD4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 482678648F; Mon, 20 Feb 2023 20:52:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 8 Jan 2023 16:42:48 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a92e9e5fb87caff46fbbe8f368564eddf4ff389d
X-Git-Newrev: f37af1800c82ae255c202ea8cfc7e11a65d489f8
X-Patchwork-Hint: ignore
Message-Id: <20230220205228.482678648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/crun: fix static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=f37af1800c82ae255c202ea8cfc7e11a65d489f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following static build failure raised since bump to version
1.7.2 in commit 6987b92da510a8c8b9534a22506850c163d0f035 and
https://github.com/containers/crun/commit/5837234e9840cd067edd9f6cd2ed9cae9a0e6570:

src/crun.c:26:10: fatal error: dlfcn.h: No such file or directory
   26 | #include <dlfcn.h>
      |          ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/a5f52a7ee757c92c9571261c0ed884d05caeaf2f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: make it an actual backport now]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...0001-src-crun.c-fix-build-without-dlfcn.h.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/crun/0001-src-crun.c-fix-build-without-dlfcn.h.patch b/package/crun/0001-src-crun.c-fix-build-without-dlfcn.h.patch
new file mode 100644
index 0000000000..104c19a40f
--- /dev/null
+++ b/package/crun/0001-src-crun.c-fix-build-without-dlfcn.h.patch
@@ -0,0 +1,39 @@
+From 278b9b447bec3fb81bf252eb2fe2c856892ec802 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 30 Dec 2022 18:40:15 +0100
+Subject: [PATCH] src/crun.c: fix build without dlfcn.h
+
+Fix the following build failure without dlfcn.h raised since version 1.7
+and
+https://github.com/containers/crun/commit/5837234e9840cd067edd9f6cd2ed9cae9a0e6570:
+
+src/crun.c:26:10: fatal error: dlfcn.h: No such file or directory
+   26 | #include <dlfcn.h>
+      |          ^~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a5f52a7ee757c92c9571261c0ed884d05caeaf2f
+
+[fontaine.fabrice@gmail.com: backport upstream commit]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/crun.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/crun.c b/src/crun.c
+index cbfe900..af0cc97 100644
+--- a/src/crun.c
++++ b/src/crun.c
+@@ -23,7 +23,9 @@
+ #include <string.h>
+ #include <libgen.h>
+ 
++#ifdef HAVE_DLOPEN
+ #include <dlfcn.h>
++#endif
+ 
+ #include "crun.h"
+ #include "libcrun/utils.h"
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
