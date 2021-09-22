Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C1DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 21:06:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BD0E611C4
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 21:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BD0E611C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9928614F7;
	Wed, 22 Sep 2021 21:06:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DQ-_-F1rOR0c; Wed, 22 Sep 2021 21:06:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3225E614E7;
	Wed, 22 Sep 2021 21:06:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 019B01BF2F7
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 21:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E235740598
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 21:05:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h0G32XAVYt-8 for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 21:05:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDFD440613
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 21:05:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 96B9A8CA2B; Wed, 22 Sep 2021 21:03:48 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 22:13:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 71b83227128be62c169313e85bb8f339f977ad67
X-Git-Newrev: 44d5f1d05d9cf9dc03af22ae32d31cb3f647a339
X-Patchwork-Hint: ignore
Message-Id: <20210922210348.96B9A8CA2B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ntp: Fix building with glibc 2.34+
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=44d5f1d05d9cf9dc03af22ae32d31cb3f647a339
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On attempt to build ntp with glibc 2.34 the following error happens:
-------------------------------->8------------------------------
In file included from .../output/host/lib/gcc/i586-buildroot-linux-gnu/10.3.0/include-fixed/pthread.h:42,
                 from work_thread.c:13:
work_thread.c:45:57: error: missing binary operator before token "("
   45 | #if defined(PTHREAD_STACK_MIN) && THREAD_MINSTACKSIZE < PTHREAD_STACK_MIN
      |                                                         ^~~~~~~~~~~~~~~~~
-------------------------------->8------------------------------

That's because starting from glibc 2.34 PTHREAD_STACK_MIN gets determined
dynamically in runtime via sysconf(), see [1].

Original fix proposed by Khem Raj in OpenEmbedded, see [2].

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=5d98a7dae955bafa6740c26eaba9c86060ae0344
[2] https://github.com/openembedded/meta-openembedded/commit/7055c764c83150f9310ce04bcfb19330460582fc

Suggested-by: Artem Panfilov <artemp@synopsys.com>
Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...ntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/ntp/0004-libntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch b/package/ntp/0004-libntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch
new file mode 100644
index 0000000000..da03ad4aac
--- /dev/null
+++ b/package/ntp/0004-libntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch
@@ -0,0 +1,33 @@
+From 082a504cfcc046c3d8adaae1164268bc94e5108a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 31 Jul 2021 10:51:41 -0700
+Subject: [PATCH] libntp: Do not use PTHREAD_STACK_MIN on glibc
+
+In glibc 2.34+ PTHREAD_STACK_MIN is not a compile-time constant which
+could mean different stack sizes at runtime on different architectures
+and it also causes compile failure. Default glibc thread stack size
+or 64Kb set by ntp should be good in glibc these days.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+[Copied from https://github.com/openembedded/meta-openembedded/blob/master/meta-networking/recipes-support/ntp/ntp/0001-libntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch]
+Signed-off-by: Alexey Brodkin <abrokdin@synopsys.com>
+---
+ libntp/work_thread.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libntp/work_thread.c b/libntp/work_thread.c
+index 03a5647..3ddd751 100644
+--- a/libntp/work_thread.c
++++ b/libntp/work_thread.c
+@@ -41,7 +41,7 @@
+ #ifndef THREAD_MINSTACKSIZE
+ # define THREAD_MINSTACKSIZE	(64U * 1024)
+ #endif
+-#ifndef __sun
++#if !defined(__sun) && !defined(__GLIBC__)
+ #if defined(PTHREAD_STACK_MIN) && THREAD_MINSTACKSIZE < PTHREAD_STACK_MIN
+ # undef THREAD_MINSTACKSIZE
+ # define THREAD_MINSTACKSIZE PTHREAD_STACK_MIN
+-- 
+2.32.0
+
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
