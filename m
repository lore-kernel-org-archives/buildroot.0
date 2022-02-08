Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA87C433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 20:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25237405C1;
	Tue,  8 Feb 2022 20:29:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eNma6uvGLr6a; Tue,  8 Feb 2022 20:29:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 166854018A;
	Tue,  8 Feb 2022 20:29:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ABC571BF390
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 20:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A814E60EE0
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 20:29:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wyFTvNz3G2KY for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 20:29:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D90CC6059C
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 20:29:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3CF6A82B8F; Tue,  8 Feb 2022 20:21:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 8 Feb 2022 21:24:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd8a410eafaceb30fd06e17edbb2d01283f99494
X-Git-Newrev: 0ecfdc093227c37ed1083e43404b748e8ee8a323
X-Patchwork-Hint: ignore
Message-Id: <20220208202150.3CF6A82B8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux/linux.mk: correct LINUX_ARCH_PATH
 for sparc64
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ecfdc093227c37ed1083e43404b748e8ee8a323
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot uses variable LINUX_ARCH_PATH to refer to the arch-specific
directory in the Linux tree, which may not necessarily be arch/$(KERNEL_ARCH).

Buildroot already accounts for the case of KERNEL_ARCH=i386 and
KERNEL_ARCH=x86_64, but does not for KERNEL_ARCH=sparc64, in which case the
correct directory is arch/sparc.

Reported-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 linux/linux.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index dd2eebd446..35e2484588 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -242,6 +242,8 @@ ifeq ($(KERNEL_ARCH),i386)
 LINUX_ARCH_PATH = $(LINUX_DIR)/arch/x86
 else ifeq ($(KERNEL_ARCH),x86_64)
 LINUX_ARCH_PATH = $(LINUX_DIR)/arch/x86
+else ifeq ($(KERNEL_ARCH),sparc64)
+LINUX_ARCH_PATH = $(LINUX_DIR)/arch/sparc
 else
 LINUX_ARCH_PATH = $(LINUX_DIR)/arch/$(KERNEL_ARCH)
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
