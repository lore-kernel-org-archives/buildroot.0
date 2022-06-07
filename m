Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152DBC433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 15:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B79308408D;
	Tue,  7 Jun 2022 15:05:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BMgDUMK9VK-M; Tue,  7 Jun 2022 15:05:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C321083E5D;
	Tue,  7 Jun 2022 15:05:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C4AA81BF39F
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 15:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C28974157B
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 15:04:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zlX2y2vY60-n for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 15:04:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF5AD41578
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 15:04:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 08DD186C45; Tue,  7 Jun 2022 14:53:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Jun 2022 17:03:04 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: c647ad5937c78e78c0a20f55e72298bc7a2f0627
X-Git-Newrev: 2079d5996b21e838414b2e1db20a9044eb48068f
X-Patchwork-Hint: ignore
Message-Id: <20220607145306.08DD186C45@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] linux: disable -Werror
 when building host tools
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

commit: https://git.buildroot.net/buildroot/commit/?id=2079d5996b21e838414b2e1db20a9044eb48068f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit baa55a4e26e6cdee062191792121d1ab1ed38278)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
