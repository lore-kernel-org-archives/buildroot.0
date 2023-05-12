Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A68C77B7F
	for <buildroot@archiver.kernel.org>; Fri, 12 May 2023 17:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94A5642DC5;
	Fri, 12 May 2023 17:17:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94A5642DC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8sD0GShoQGMC; Fri, 12 May 2023 17:17:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE13D42DD7;
	Fri, 12 May 2023 17:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE13D42DD7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C1DC1BF2CE
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 17:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54F3E70212
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 17:17:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54F3E70212
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xUEgJRjO2avE for <buildroot@lists.busybox.net>;
 Fri, 12 May 2023 17:17:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44DD06165C
 for <buildroot@buildroot.org>; Fri, 12 May 2023 17:17:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44DD06165C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 313598640F; Fri, 12 May 2023 17:17:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 May 2023 19:16:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 142e574d5f57fd44a9bd5cc9fc39cfcff5b3da6a
X-Git-Newrev: 3f5a9d5cb9b519c7c1d7cc295430292a0976734c
X-Patchwork-Hint: ignore
Message-Id: <20230512171714.313598640F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] uclibc: fix static builds
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

commit: https://git.buildroot.net/buildroot/commit/?id=3f5a9d5cb9b519c7c1d7cc295430292a0976734c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-gettimeofday-fix-static-build.patch       | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/uclibc/0001-gettimeofday-fix-static-build.patch b/package/uclibc/0001-gettimeofday-fix-static-build.patch
new file mode 100644
index 0000000000..2ef5059f05
--- /dev/null
+++ b/package/uclibc/0001-gettimeofday-fix-static-build.patch
@@ -0,0 +1,29 @@
+From b19f8f360970ffd0c1a6ac41e07c66dc39790b16 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Wed, 10 May 2023 08:35:25 +0200
+Subject: [PATCH] gettimeofday: fix static build
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=b19f8f360970ffd0c1a6ac41e07c66dc39790b16
+---
+ libc/sysdeps/linux/common/gettimeofday.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libc/sysdeps/linux/common/gettimeofday.c b/libc/sysdeps/linux/common/gettimeofday.c
+index e5141088e..12473a8e6 100755
+--- a/libc/sysdeps/linux/common/gettimeofday.c
++++ b/libc/sysdeps/linux/common/gettimeofday.c
+@@ -9,8 +9,9 @@
+ #include <sys/syscall.h>
+ #include <sys/time.h>
+ 
++#ifdef SHARED
+ #include "ldso.h"
+-
++#endif
+ 
+ 
+ #ifdef __VDSO_SUPPORT__
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
