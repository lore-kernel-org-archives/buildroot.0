Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FEA7C433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 22:39:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5561610FD
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 22:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A5561610FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F6FA403AC;
	Wed,  3 Nov 2021 22:39:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jaSJQW_JOgSH; Wed,  3 Nov 2021 22:39:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 443774016A;
	Wed,  3 Nov 2021 22:39:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 189421BF292
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 22:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EFA3607C0
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 22:39:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XyH2iJWuMnyW for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 22:39:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7ACC6607A5
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 22:39:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B16608A51D; Wed,  3 Nov 2021 22:35:20 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 3 Nov 2021 23:38:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c1b9c279ed5fba9e1d3284c3a484837303b042e
X-Git-Newrev: 92fb5e17653091dcb994535e01ca4ce50de0f3b9
X-Patchwork-Hint: ignore
Message-Id: <20211103223520.B16608A51D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nano: fix build with uclibc <
 1.0.35
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

commit: https://git.buildroot.net/buildroot/commit/?id=92fb5e17653091dcb994535e01ca4ce50de0f3b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build of nano with uclibc < 1.0.35 is broken since bump to version 5.9
in commit 3e62e9b14b2656f813c20ec6aaee99e3a85601c7:

In file included from ./sys/random.h:40,
                 from getrandom.c:22:
/home/giuliobenetti/autobuild/run/instance-3/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:27:35: error: unknown type name 'size_t'
   27 | extern int getrandom(void *__buf, size_t count, unsigned int flags)
      |                                   ^~~~~~
/home/giuliobenetti/autobuild/run/instance-3/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:8:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
    7 | #include <features.h>
  +++ |+#include <stddef.h>
    8 |

Fixes:
 - http://autobuild.buildroot.org/results/1932c524aa6b6a3337a0fc21b44adaac60972d30

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-getrandom.c-fix-build-with-uclibc-1.0.35.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/nano/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch b/package/nano/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
new file mode 100644
index 0000000000..f67f6d34bb
--- /dev/null
+++ b/package/nano/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
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
+/home/fabrice/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:27:35: error: unknown type name 'size_t'
+   27 | extern int getrandom(void *__buf, size_t count, unsigned int flags)
+      |                                   ^~~~~~
+/home/fabrice/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:8:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
+    7 | #include <features.h>
+  +++ |+#include <stddef.h>
+    8 |
+
+This patch is not upstreamable as it is only a workaround for
+uclibc < 1.0.35, upstream uclibc has been patched with
+https://github.com/wbx-github/uclibc-ng/commit/00972c02c2b6e0a95d5def4a71bdfb188e091782
+
+Fixes:
+ - http://autobuild.buildroot.org/results/1932c524aa6b6a3337a0fc21b44adaac60972d30
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/getrandom.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/getrandom.c b/lib/getrandom.c
+index 41212fb32..0ad3f9648 100644
+--- a/lib/getrandom.c
++++ b/lib/getrandom.c
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
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
