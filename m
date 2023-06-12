Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0072AC7EE43
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 20:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E87C40420;
	Mon, 12 Jun 2023 20:22:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E87C40420
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o3Iwy3Gz2Ksf; Mon, 12 Jun 2023 20:22:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA91240B98;
	Mon, 12 Jun 2023 20:22:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA91240B98
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5DD771BF95D
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 20:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DFB2414E4
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 20:22:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DFB2414E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kT2ofePHpT5K for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 20:22:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A485414DE
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 20:22:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A485414DE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB28982847; Mon, 12 Jun 2023 20:22:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 12 Jun 2023 22:21:50 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: de1dc331afd14766dceabdeac48119a45b572509
X-Git-Newrev: 52d5a88247817fb1a3cb2841ec6627c2876018ec
X-Patchwork-Hint: ignore
Message-Id: <20230612202222.EB28982847@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] uclibc: fix static builds
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

commit: https://git.buildroot.net/buildroot/commit/?id=52d5a88247817fb1a3cb2841ec6627c2876018ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3f5a9d5cb9b519c7c1d7cc295430292a0976734c)
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
