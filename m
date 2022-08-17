Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C688C25B08
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 08:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA3746107E;
	Wed, 17 Aug 2022 08:28:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA3746107E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ErHrHvlLL6yT; Wed, 17 Aug 2022 08:28:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F22B861078;
	Wed, 17 Aug 2022 08:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F22B861078
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8CD8F1BF873
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 08:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EED3812F3
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 08:28:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EED3812F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BX1JyAZBOyfF for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 08:28:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58BF2812C7
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 08:28:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58BF2812C7
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DC09287979; Wed, 17 Aug 2022 08:14:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Aug 2022 08:47:58 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 3d01735b5ae5444dc5c0f21c6c6ff6cf081c4991
X-Git-Newrev: f17eee169ba533a2e7b8cb4b85ec490957b09bc7
X-Patchwork-Hint: ignore
Message-Id: <20220817081402.DC09287979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/gcc: disable
 split-stack for non-thread builds
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

commit: https://git.buildroot.net/buildroot/commit/?id=f17eee169ba533a2e7b8cb4b85ec490957b09bc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Since commit [1], the autobuilder script generates fully random
configurations that can trigger configurations that were not tested
before.

Here, the toolchain build with uClibc-ng without threads support
(BR2_PTHREADS_NONE=y) fails to build due to a missing pthread.h
header:

../../../libgcc/generic-morestack-thread.c:42:10: fatal error: pthread.h: No such file or directory
   42 | #include <pthread.h>

This issue was actually fixed by this commit [2] adding a patch for
gcc 4.8, 4.9, 5.3. But it get lost when gcc 6 was added to Buildroot [3].

Since then the issue was present in Buildroot but has not been noticed.

[1] https://git.buildroot.net/buildroot-test/commit/?id=27b18dcb1686a98ce718b6a816e98f8505957a6c
[2] 2631219f648f4aa13fa36d06a483e4507cb6f3d7
[3] 519d83bfa0442439026db4e71e605a5c1347e566

Fixes:
http://autobuild.buildroot.org/results/5ec/5ec9eefacd27ef4fa73066013188796b43a30428
https://bugs.busybox.net/show_bug.cgi?id=8766

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fff68f75b3519cadb2639fde2296b26db919d79d)
[Peter: drop gcc-12.1 patch]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...disable-split-stack-for-non-thread-builds.patch | 26 ++++++++++++++++++++++
 ...disable-split-stack-for-non-thread-builds.patch | 26 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/package/gcc/10.3.0/0006-disable-split-stack-for-non-thread-builds.patch b/package/gcc/10.3.0/0006-disable-split-stack-for-non-thread-builds.patch
new file mode 100644
index 0000000000..668b1cd9d7
--- /dev/null
+++ b/package/gcc/10.3.0/0006-disable-split-stack-for-non-thread-builds.patch
@@ -0,0 +1,26 @@
+From cdb76d638e91cc53949585d98fa653d3671b92ac Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Mon, 25 Jul 2022 00:29:55 +0200
+Subject: [PATCH] disable split-stack for non-thread builds
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Romain: convert to git format]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ libgcc/config/t-stack | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libgcc/config/t-stack b/libgcc/config/t-stack
+index cc0366b4cd8..f3f97e86d60 100644
+--- a/libgcc/config/t-stack
++++ b/libgcc/config/t-stack
+@@ -1,4 +1,6 @@
+ # Makefile fragment to provide generic support for -fsplit-stack.
+ # This should be used in config.host for any host which supports
+ # -fsplit-stack.
++ifeq ($(enable_threads),yes)
+ LIB2ADD_ST += $(srcdir)/generic-morestack.c $(srcdir)/generic-morestack-thread.c
++endif
+-- 
+2.34.3
+
diff --git a/package/gcc/11.3.0/0004-disable-split-stack-for-non-thread-builds.patch b/package/gcc/11.3.0/0004-disable-split-stack-for-non-thread-builds.patch
new file mode 100644
index 0000000000..dba2d02d7f
--- /dev/null
+++ b/package/gcc/11.3.0/0004-disable-split-stack-for-non-thread-builds.patch
@@ -0,0 +1,26 @@
+From 3b9d7d397fa6dc290eb05bffca80968efb6ec2e5 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Mon, 25 Jul 2022 00:29:55 +0200
+Subject: [PATCH] disable split-stack for non-thread builds
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Romain: convert to git format]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ libgcc/config/t-stack | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libgcc/config/t-stack b/libgcc/config/t-stack
+index cc0366b4cd8..f3f97e86d60 100644
+--- a/libgcc/config/t-stack
++++ b/libgcc/config/t-stack
+@@ -1,4 +1,6 @@
+ # Makefile fragment to provide generic support for -fsplit-stack.
+ # This should be used in config.host for any host which supports
+ # -fsplit-stack.
++ifeq ($(enable_threads),yes)
+ LIB2ADD_ST += $(srcdir)/generic-morestack.c $(srcdir)/generic-morestack-thread.c
++endif
+-- 
+2.34.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
