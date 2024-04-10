Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D2DCD128A
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 21:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0DBE60EA9;
	Wed, 10 Apr 2024 21:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IxBkeuDsWuYT; Wed, 10 Apr 2024 21:06:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B1D560EB4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B1D560EB4;
	Wed, 10 Apr 2024 21:06:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C07701BF4D6
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC6A4405CA
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jydUqRBo22ud for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 21:06:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A767F40425
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A767F40425
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 21:06:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 125DC85F0C; Wed, 10 Apr 2024 21:06:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Apr 2024 22:44:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4990bccd4e24e9b01b8e1f980dda4062770dfb5c
X-Git-Newrev: 70031dd7fa09191566f2d1e895399ae578c62d1b
X-Patchwork-Hint: ignore
Message-Id: <20240410210612.125DC85F0C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php: fix build without threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=70031dd7fa09191566f2d1e895399ae578c62d1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without threads raised since bump to
version 8.3.4 in commit e50460f9f12a8c5f82f2166733afe9cca3c8cd19 and
https://github.com/php/php-src/commit/a11c8a30399e90c17c287b9656c0077bc5131c9c:

/home/buildroot/instance-0/output-1/build/php-8.3.4/Zend/zend_call_stack.c:39:11: fatal error: pthread.h: No such file or directory
   39 | # include <pthread.h>
      |           ^~~~~~~~~~~

Fixes: e50460f9f12a8c5f82f2166733afe9cca3c8cd19
 - http://autobuild.buildroot.org/results/a4ef648a9da50b26ed56d5d490e4cf5a1bfff970

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...nd_call_stack.c-fix-build-without-pthread.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/php/0006-Zend-zend_call_stack.c-fix-build-without-pthread.patch b/package/php/0006-Zend-zend_call_stack.c-fix-build-without-pthread.patch
new file mode 100644
index 0000000000..10b0083655
--- /dev/null
+++ b/package/php/0006-Zend-zend_call_stack.c-fix-build-without-pthread.patch
@@ -0,0 +1,39 @@
+From c3e37c438a11d59d858fcc7b46eac00a8074972b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 30 Mar 2024 17:51:55 +0100
+Subject: [PATCH] Zend/zend_call_stack.c: fix build without pthread
+
+Fix the following build failure without pthread raised since version
+8.3.0 and
+https://github.com/php/php-src/commit/a11c8a30399e90c17c287b9656c0077bc5131c9c:
+
+/home/buildroot/instance-0/output-1/build/php-8.3.4/Zend/zend_call_stack.c:39:11: fatal error: pthread.h: No such file or directory
+   39 | # include <pthread.h>
+      |           ^~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a4ef648a9da50b26ed56d5d490e4cf5a1bfff970
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/php/php-src/pull/13843
+---
+ Zend/zend_call_stack.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Zend/zend_call_stack.c b/Zend/zend_call_stack.c
+index 97cbed9041..97de938a0f 100644
+--- a/Zend/zend_call_stack.c
++++ b/Zend/zend_call_stack.c
+@@ -35,7 +35,8 @@
+ #  include <sys/types.h>
+ # endif
+ #endif /* ZEND_WIN32 */
+-#if defined(__linux__) || defined(__FreeBSD__) || defined(__APPLE__) || defined(__OpenBSD__)
++#if (defined(HAVE_PTHREAD_GETATTR_NP) && defined(HAVE_PTHREAD_ATTR_GETSTACK)) || \
++    defined(__FreeBSD__) || defined(__APPLE__) || defined(__OpenBSD__)
+ # include <pthread.h>
+ #endif
+ #ifdef __FreeBSD__
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
