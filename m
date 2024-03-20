Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CA6C54E58
	for <buildroot@archiver.kernel.org>; Wed, 20 Mar 2024 19:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDE288211B;
	Wed, 20 Mar 2024 19:52:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VcxbsimSReTc; Wed, 20 Mar 2024 19:52:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D16358211E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D16358211E;
	Wed, 20 Mar 2024 19:52:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 641401BF95F
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 19:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 516FA4168C
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 19:52:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oFt4psFAFbT5 for <buildroot@lists.busybox.net>;
 Wed, 20 Mar 2024 19:52:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F7F04168B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F7F04168B
 for <buildroot@buildroot.org>; Wed, 20 Mar 2024 19:52:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 367D4836A5; Wed, 20 Mar 2024 19:52:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Mar 2024 20:48:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c93d137303693cfb91b5d0d79433930cfe7d59c7
X-Git-Newrev: 455ce5fc02488983a6732087bcbbb15e04c75937
X-Patchwork-Hint: ignore
Message-Id: <20240320195203.367D4836A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/putty: fix arm uclibc build
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=455ce5fc02488983a6732087bcbbb15e04c75937
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following arm uclibc build failure raised since bump to version
0.78 in commit 5673ea3ce4d4dd721bb17fc8d5b1283f5c1080b4 which wrongly
removed patch because file was renamed. Patch was sent upstream in 2021
but rejected, even a second iteration defining AT_HWCAP2 to 26 if needed
was also rejected.

Fixes: 5673ea3ce4d4dd721bb17fc8d5b1283f5c1080b4
 - http://autobuild.buildroot.org/results/547d1c0e8a89e1e4b601aa756d26886bfc3d586f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Arnout: add Upstream: to patch comment]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...utils-arm_arch_queries.h-fix-uclibc-build.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/putty/0001-unix-utils-arm_arch_queries.h-fix-uclibc-build.patch b/package/putty/0001-unix-utils-arm_arch_queries.h-fix-uclibc-build.patch
new file mode 100644
index 0000000000..d2abcb64cf
--- /dev/null
+++ b/package/putty/0001-unix-utils-arm_arch_queries.h-fix-uclibc-build.patch
@@ -0,0 +1,41 @@
+From 2631c745f986b356fbe5e1d418cff63b46134df6 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 19 Mar 2024 20:37:33 +0100
+Subject: [PATCH] unix/utils/arm_arch_queries.h: fix uclibc build
+
+Build on uclibc is broken since version 0.75 and commit
+65383082bf0c49cec63f4b36001a40bd9b13edf6 because AT_HWCAP2 is used
+even if <sys/auxv.h> is not available:
+
+/home/buildroot/autobuild/run/instance-3/output-1/build/putty-0.80/unix/utils/arm_arch_queries.c: In function 'platform_aes_neon_available':
+/home/buildroot/autobuild/run/instance-3/output-1/build/putty-0.80/unix/utils/arm_arch_queries.c:18:22: error: 'AT_HWCAP2' undeclared (first use in this function)
+   18 |     return getauxval(AT_HWCAP2) & HWCAP2_AES;
+      |                      ^~~~~~~~~
+
+To fix this build failure, include <elf.h>
+
+Fixes:
+ - http://autobuild.buildroot.org/results/547d1c0e8a89e1e4b601aa756d26886bfc3d586f
+
+Upstream: Rejected after sending to Simon Tatham <anakin@pobox.com>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ unix/utils/arm_arch_queries.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/unix/utils/arm_arch_queries.h b/unix/utils/arm_arch_queries.h
+index fa46c622..5cce7f31 100644
+--- a/unix/utils/arm_arch_queries.h
++++ b/unix/utils/arm_arch_queries.h
+@@ -18,6 +18,8 @@
+ 
+ #if defined __arm__ || defined __aarch64__
+ 
++#include <elf.h>
++
+ #if HAVE_SYS_TYPES_H
+ #include <sys/types.h>
+ #endif
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
