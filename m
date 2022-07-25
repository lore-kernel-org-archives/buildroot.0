Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFC1C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 12:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 162F6419A5;
	Mon, 25 Jul 2022 12:29:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 162F6419A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Iru_ZDNlIrc; Mon, 25 Jul 2022 12:29:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D40A341992;
	Mon, 25 Jul 2022 12:29:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D40A341992
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AE3991BF215
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 12:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 889C040E43
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 12:29:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 889C040E43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E79_lDk-RknW for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 12:29:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8490540C0E
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 12:29:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8490540C0E
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 21E7185D50; Mon, 25 Jul 2022 12:15:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 14:29:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 286d8cc8510c5879392801f6c49ec3278908766f
X-Git-Newrev: fff68f75b3519cadb2639fde2296b26db919d79d
X-Patchwork-Hint: ignore
Message-Id: <20220725121551.21E7185D50@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: disable split-stack for
 non-thread builds
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fff68f75b3519cadb2639fde2296b26db919d79d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 ...disable-split-stack-for-non-thread-builds.patch | 26 ++++++++++++++++++++++
 ...disable-split-stack-for-non-thread-builds.patch | 26 ++++++++++++++++++++++
 ...disable-split-stack-for-non-thread-builds.patch | 26 ++++++++++++++++++++++
 3 files changed, 78 insertions(+)

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
diff --git a/package/gcc/12.1.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc/12.1.0/0001-disable-split-stack-for-non-thread-builds.patch
new file mode 100644
index 0000000000..e801085dad
--- /dev/null
+++ b/package/gcc/12.1.0/0001-disable-split-stack-for-non-thread-builds.patch
@@ -0,0 +1,26 @@
+From 4f67134e0b1404fef4ea72342be8fab4c37ca8c8 Mon Sep 17 00:00:00 2001
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
