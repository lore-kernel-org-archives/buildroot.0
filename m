Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1573C433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 16:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9DD41405F1;
	Tue, 22 Feb 2022 16:51:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3K1zjH921CV0; Tue, 22 Feb 2022 16:51:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BEAE405E6;
	Tue, 22 Feb 2022 16:51:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A0811BF3CB
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 16:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B58D560C2C
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 16:51:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IzKsuxu3DgcJ for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 16:51:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D46460EC4
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 16:51:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1AFF883828; Tue, 22 Feb 2022 16:43:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 17:46:03 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 2e2990954a6d90115eedc34e892c269f0bd6e6c8
X-Git-Newrev: d0b10e44733bae48dcb35c388ea324750c5df8a3
X-Patchwork-Hint: ignore
Message-Id: <20220222164312.1AFF883828@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] linux/linux.mk: correct
 LINUX_ARCH_PATH for sparc64
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

commit: https://git.buildroot.net/buildroot/commit/?id=d0b10e44733bae48dcb35c388ea324750c5df8a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Buildroot uses variable LINUX_ARCH_PATH to refer to the arch-specific
directory in the Linux tree, which may not necessarily be arch/$(KERNEL_ARCH).

Buildroot already accounts for the case of KERNEL_ARCH=i386 and
KERNEL_ARCH=x86_64, but does not for KERNEL_ARCH=sparc64, in which case the
correct directory is arch/sparc.

Reported-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 0ecfdc093227c37ed1083e43404b748e8ee8a323)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 61fdc0c76c..b047061c3d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -231,6 +231,8 @@ ifeq ($(KERNEL_ARCH),i386)
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
