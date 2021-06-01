Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74722C4320A
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:38:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42933604AC
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 42933604AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C6D7837A4;
	Tue,  3 Aug 2021 21:38:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zV5HxiKt9Mgw; Tue,  3 Aug 2021 21:38:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 754418398E;
	Tue,  3 Aug 2021 21:38:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D3241BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D9DA6087D
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bVw8hmFLGcHs for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE15660879
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2193C843F5; Tue,  3 Aug 2021 21:09:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 1 Jun 2021 22:33:16 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 34173da168f300b58957abb53c8f5fcaf8d8e605
X-Git-Newrev: 5a075b47a86e4e2b147256bd946c9cfd1d3bc15e
X-Patchwork-Hint: ignore
Message-Id: <20210803210947.2193C843F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libkcapi: fix build on
 riscv32
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

commit: https://git.buildroot.net/buildroot/commit/?id=5a075b47a86e4e2b147256bd946c9cfd1d3bc15e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following build failure on riscv32:

lib/internal.h:331:20: error: '__NR_io_getevents' undeclared (first use in this function); did you mean 'io_getevents'?
  331 |     return syscall(__NR_io_getevents, ctx, min, max, events, timeout);
      |                    ^~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/c828d4330a8888fe8db4299dc2f20759947f329f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...use-of-__NR_io_getevents-when-not-defined.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/libkcapi/0001-Disable-use-of-__NR_io_getevents-when-not-defined.patch b/package/libkcapi/0001-Disable-use-of-__NR_io_getevents-when-not-defined.patch
new file mode 100644
index 0000000000..20aa75b741
--- /dev/null
+++ b/package/libkcapi/0001-Disable-use-of-__NR_io_getevents-when-not-defined.patch
@@ -0,0 +1,42 @@
+From 455c4938f5822c017c7ff79dd2dca638b6410923 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 15 Nov 2020 18:05:48 -0800
+Subject: [PATCH] Disable use of __NR_io_getevents when not defined
+
+Architectures like riscv32 do not define this syscall, therefore return
+ENOSYS on such architectures
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Stephan Mueller <smueller@chronox.de>
+[Retrieved from:
+https://github.com/smuellerDD/libkcapi/commit/455c4938f5822c017c7ff79dd2dca638b6410923]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/internal.h | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/lib/internal.h b/lib/internal.h
+index 1237827..f765461 100644
+--- a/lib/internal.h
++++ b/lib/internal.h
+@@ -325,10 +325,17 @@ static inline int io_submit(aio_context_t ctx, long n,  struct iocb **iocb)
+     return syscall(__NR_io_submit, ctx, n, iocb);
+ }
+ 
+-static inline int io_getevents(aio_context_t ctx, long min, long max,
+-            struct io_event *events, struct timespec *timeout)
++static inline int io_getevents(__attribute__((unused)) aio_context_t ctx,
++            __attribute__((unused)) long min,
++            __attribute__((unused)) long max,
++            __attribute__((unused)) struct io_event *events,
++            __attribute__((unused)) struct timespec *timeout)
+ {
++#ifdef __NR_io_getevents
+     return syscall(__NR_io_getevents, ctx, min, max, events, timeout);
++#else
++    return -ENOSYS;
++#endif
+ }
+ 
+ /************************************************************
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
