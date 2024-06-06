Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DE6C27C52
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 19:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 068714042F;
	Thu,  6 Jun 2024 19:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E2jHdu6dVl55; Thu,  6 Jun 2024 19:29:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B606D4046B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B606D4046B;
	Thu,  6 Jun 2024 19:29:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 194121BF57B
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 19:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1479E60751
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 19:29:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5KVgB5J6P8-3 for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 19:29:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40CD660730
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40CD660730
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 19:29:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 26BF287D71; Thu,  6 Jun 2024 19:29:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 6 Jun 2024 21:25:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4f8167b5cac41cc78e124236f41c0289fca6ee6c
X-Git-Newrev: 671b8f4c57dee15a65110c2f64873fc4fe104f05
X-Patchwork-Hint: ignore
Message-Id: <20240606192953.26BF287D71@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: fix compile issue with gcc
 14.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=671b8f4c57dee15a65110c2f64873fc4fe104f05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 http://autobuild.buildroot.net/results/d9b924bdea3fd61060fa0e961c12534c1fff80de

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../uclibc/0002-fix-kernel_stat64-definition.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/uclibc/0002-fix-kernel_stat64-definition.patch b/package/uclibc/0002-fix-kernel_stat64-definition.patch
new file mode 100644
index 0000000000..5a87586af8
--- /dev/null
+++ b/package/uclibc/0002-fix-kernel_stat64-definition.patch
@@ -0,0 +1,35 @@
+From 186878405324e96f61d896a149f623e0c792c972 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Tue, 14 May 2024 23:18:56 -0700
+Subject: [PATCH] fix kernel_stat64 definition
+
+The commit 74ca8d6f5d2e ("remove UCLIBC_HAS_LFS") removed conditional
+compilation dependent on __UCLIBC_HAS_LFS__, assuming it to be always
+defined, but removed the wrong branch in the definition of
+kernel_stat64.
+Fix kernel_stat64 definition to be stat64.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+Tested-by: Chris Packham <judge.packham@gmail.com>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=186878405324e96f61d896a149f623e0c792c972
+---
+ libc/sysdeps/linux/common-generic/bits/kernel_stat.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libc/sysdeps/linux/common-generic/bits/kernel_stat.h b/libc/sysdeps/linux/common-generic/bits/kernel_stat.h
+index 7a97bb4d7..e874a4a9f 100644
+--- a/libc/sysdeps/linux/common-generic/bits/kernel_stat.h
++++ b/libc/sysdeps/linux/common-generic/bits/kernel_stat.h
+@@ -18,7 +18,7 @@
+  * However that requires more #ifndef in relevant wrappers,
+  * further uglifying them
+  */
+-#define kernel_stat64	stat
++#define kernel_stat64	stat64
+ 
+ #endif	/*  _BITS_STAT_STRUCT_H */
+ 
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
