Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9773EC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 08:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 429CA408F3;
	Sat,  4 Jun 2022 08:23:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tksrhW99EfMj; Sat,  4 Jun 2022 08:23:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 441C040734;
	Sat,  4 Jun 2022 08:23:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 640711BF41F
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 08:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53750844B6
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 08:23:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O8mZBUXGN96y for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 08:23:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E1B6844B5
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 08:23:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 60F9684E1A; Sat,  4 Jun 2022 08:11:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 4 Jun 2022 10:22:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9118c863b3247ae5c8ba1a61d941f6f1972a4edb
X-Git-Newrev: baa55a4e26e6cdee062191792121d1ab1ed38278
X-Patchwork-Hint: ignore
Message-Id: <20220604081116.60F9684E1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: disable -Werror when building host
 tools
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

commit: https://git.buildroot.net/buildroot/commit/?id=baa55a4e26e6cdee062191792121d1ab1ed38278
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gcc-12 is starting to trickle down to some distros, like Archlinux.
gcc-12 has new warnings, and detects more cases of issues, like new
UAF cases, which is causing build issues in code that was previously
building fine, as reported in #14826:

    In file included from sigchain.c:3:
    In function 'xrealloc',
        inlined from 'sigchain_push.isra' at sigchain.c:26:2:
    subcmd-util.h:56:23: error: pointer may be used after 'realloc' [-Werror=use-after-free]
       56 |                 ret = realloc(ptr, size);
          |                       ^~~~~~~~~~~~~~~~~~
    subcmd-util.h:52:21: note: call to 'realloc' here
       52 |         void *ret = realloc(ptr, size);
          |                     ^~~~~~~~~~~~~~~~~~
    subcmd-util.h:58:31: error: pointer may be used after 'realloc' [-Werror=use-after-free]
       58 |                         ret = realloc(ptr, 1);
          |                               ^~~~~~~~~~~~~~~
    subcmd-util.h:52:21: note: call to 'realloc' here
       52 |         void *ret = realloc(ptr, size);
          |                     ^~~~~~~~~~~~~~~~~~

In that case, the kernel has already fixed their code, which is part of
5.17:
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=52a9dab6d892763b2a8334a568bd4e2c1a6fde66

However, we can't easily carry that patch, because we don't know
whether the kernel the user uses already has the fix or not.

Instead, we can just tell the kernel to disable use of -Werror when
building host tools.

As a consequence, we can drop it from the perf-specific setting.

Fixes: #14826

Reported-by: Anders Pitman <buildroot@apitman.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 linux/linux.mk                            | 3 +++
 package/linux-tools/linux-tool-perf.mk.in | 1 -
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 67832127d9..322ccabbd9 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -147,11 +147,14 @@ endif
 
 # We don't want to run depmod after installing the kernel. It's done in a
 # target-finalize hook, to encompass modules installed by packages.
+# Disable building host tools with -Werror: newer gcc versions can be
+# extra picky about some code (https://bugs.busybox.net/show_bug.cgi?id=14826)
 LINUX_MAKE_FLAGS = \
 	HOSTCC="$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)" \
 	ARCH=$(KERNEL_ARCH) \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
+	WERROR=0 \
 	DEPMOD=$(HOST_DIR)/sbin/depmod
 
 ifeq ($(BR2_REPRODUCIBLE),y)
diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 4e28129f50..d82d45973c 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -20,7 +20,6 @@ PERF_MAKE_FLAGS = \
 	ARCH=$(PERF_ARCH) \
 	DESTDIR=$(TARGET_DIR) \
 	prefix=/usr \
-	WERROR=0 \
 	NO_GTK2=1 \
 	NO_LIBPERL=1 \
 	NO_LIBPYTHON=1 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
