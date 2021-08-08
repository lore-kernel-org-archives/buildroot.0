Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAFB0C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 20:18:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67B7D60BD3
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 20:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67B7D60BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 145E3401E2;
	Sun,  8 Aug 2021 20:18:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yj4UFyfDbeh5; Sun,  8 Aug 2021 20:18:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04A5B401BD;
	Sun,  8 Aug 2021 20:18:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6A5B91BF422
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 20:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56302401E1
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 20:18:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ChUg6Y3EJMtb for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 20:18:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B8B4401BD
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 20:18:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 07DB98D2C4; Sun,  8 Aug 2021 20:18:02 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 21:55:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c90de229584c294d9a40d95acc9ce8905231fcd4
X-Git-Newrev: 2e16ecfa990006308e638685fbea3800706c0f84
X-Patchwork-Hint: ignore
Message-Id: <20210808201802.07DB98D2C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tar: fix build with uclibc-ng <
 1.0.35
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=2e16ecfa990006308e638685fbea3800706c0f84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the folllowing build failure with uclibc-ng which is raised since
bump to version 1.34 in commit 27fffea6db7358af20f5a3a8faa174d3b782d61f:

In file included from ./sys/random.h:40,
                 from getrandom.c:22:
/tmp/instance-0/output-1/per-package/tar/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:27:35: error: unknown type name 'size_t'
   27 | extern int getrandom(void *__buf, size_t count, unsigned int flags)
      |                                   ^~~~~~
/tmp/instance-0/output-1/per-package/tar/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:8:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
    7 | #include <features.h>
  +++ |+#include <stddef.h>
    8 |

Fixes:
 - http://autobuild.buildroot.org/results/f40e09d621ab5ba66dd97138dec174acfb7fda2a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-getrandom.c-fix-build-with-uclibc-1.0.35.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/tar/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch b/package/tar/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
new file mode 100644
index 0000000000..fe55e4eb4d
--- /dev/null
+++ b/package/tar/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
@@ -0,0 +1,46 @@
+From a0594387565e1e6b4a8a8ba04ad13b135cc1f0b5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 1 Apr 2021 07:49:46 +0200
+Subject: [PATCH] lib/getrandom.c: fix build with uclibc < 1.0.35
+
+Fix the following build failure with uclibc < 1.0.35 which is raised
+since the addition of getrandom module in
+https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=682cc4e678aceff32dea2a84b6e5147bdf5a20a7:
+
+In file included from ./sys/random.h:40,
+                 from getrandom.c:22:
+/tmp/instance-0/output-1/per-package/tar/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:27:35: error: unknown type name 'size_t'
+   27 | extern int getrandom(void *__buf, size_t count, unsigned int flags)
+      |                                   ^~~~~~
+/tmp/instance-0/output-1/per-package/tar/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:8:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
+    7 | #include <features.h>
+  +++ |+#include <stddef.h>
+    8 | 
+
+This patch is not upstreamable as it is only a workaround for
+uclibc < 1.0.35, upstream uclibc has been patched with
+https://github.com/wbx-github/uclibc-ng/commit/00972c02c2b6e0a95d5def4a71bdfb188e091782
+
+Fixes:
+ - http://autobuild.buildroot.org/results/f40e09d621ab5ba66dd97138dec174acfb7fda2a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ gnu/getrandom.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gnu/getrandom.c b/gnu/getrandom.c
+index 41212fb32..0ad3f9648 100644
+--- a/gnu/getrandom.c
++++ b/gnu/getrandom.c
+@@ -19,6 +19,7 @@
+ 
+ #include <config.h>
+ 
++#include <stddef.h>
+ #include <sys/random.h>
+ 
+ #include <errno.h>
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
