Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A179CC432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:03:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FC4F60FD9
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3FC4F60FD9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16B9B82C33;
	Thu, 26 Aug 2021 22:03:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 61YgfYZXsP4I; Thu, 26 Aug 2021 22:03:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4F4082BD6;
	Thu, 26 Aug 2021 22:03:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 095FC1BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01D6F614B1
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YwZYtZ9atcUT for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A791C6149F
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0856E8DC50; Thu, 26 Aug 2021 22:01:28 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 22:30:15 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 23bead3e3aa68d96be0b485e7b91c96eaab56b67
X-Git-Newrev: a364ebd7f0b87a02971cefb68c0fc98939dceef2
X-Patchwork-Hint: ignore
Message-Id: <20210826220128.0856E8DC50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/poke: fix build with
 uclibc-ng < 1.0.35
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

commit: https://git.buildroot.net/buildroot/commit/?id=a364ebd7f0b87a02971cefb68c0fc98939dceef2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the folllowing build failure with uclibc-ng which is raised since
activation of uclibc-ng in commit
a4dc754178b7c24ed129e7e6f8effd555249c941:

In file included from ./sys/random.h:40,
                 from getrandom.c:22:
/tmp/instance-0/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:27:35: error: unknown type name 'size_t'
   27 | extern int getrandom(void *__buf, size_t count, unsigned int flags)
      |                                   ^~~~~~
/tmp/instance-0/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:8:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
    7 | #include <features.h>
  +++ |+#include <stddef.h>
    8 |

Fixes:
 - http://autobuild.buildroot.org/results/30105094e39374ec6d4e47e2fb5e99696f7f7981

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-getrandom.c-fix-build-with-uclibc-1.0.35.patch | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/package/poke/0004-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch b/package/poke/0004-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
new file mode 100644
index 0000000000..757dc3f760
--- /dev/null
+++ b/package/poke/0004-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
@@ -0,0 +1,72 @@
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
+/tmp/instance-0/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:27:35: error: unknown type name 'size_t'
+   27 | extern int getrandom(void *__buf, size_t count, unsigned int flags)
+      |                                   ^~~~~~
+/tmp/instance-0/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:8:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
+    7 | #include <features.h>
+  +++ |+#include <stddef.h>
+    8 | 
+
+This patch is not upstreamable as it is only a workaround for
+uclibc < 1.0.35, upstream uclibc has been patched with
+https://github.com/wbx-github/uclibc-ng/commit/00972c02c2b6e0a95d5def4a71bdfb188e091782
+
+Fixes:
+ - http://autobuild.buildroot.org/results/30105094e39374ec6d4e47e2fb5e99696f7f7981
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ jitter/gnulib-local/getrandom.c | 1 +
+ gl/getrandom.c                  | 1 +
+ gl-libpoke/getrandom.c          | 1 +
+ 3 files changed, 3 insertions(+)
+
+diff --git a/jitter/gnulib-local/getrandom.c b/jitter/gnulib-local/getrandom.c
+index 41212fb32..0ad3f9648 100644
+--- a/jitter/gnulib-local/getrandom.c
++++ b/jitter/gnulib-local/getrandom.c
+@@ -19,6 +19,7 @@
+ 
+ #include <config.h>
+ 
++#include <stddef.h>
+ #include <sys/random.h>
+ 
+ #include <errno.h>
+diff --git a/gl/getrandom.c b/gl/getrandom.c
+index 41212fb32..0ad3f9648 100644
+--- a/gl/getrandom.c
++++ b/gl/getrandom.c
+@@ -19,6 +19,7 @@
+ 
+ #include <config.h>
+ 
++#include <stddef.h>
+ #include <sys/random.h>
+ 
+ #include <errno.h>
+diff --git a/gl-libpoke/getrandom.c b/gl-libpoke/getrandom.c
+index 41212fb32..0ad3f9648 100644
+--- a/gl-libpoke/getrandom.c
++++ b/gl-libpoke/getrandom.c
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
