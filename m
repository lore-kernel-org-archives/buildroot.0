Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F4AC433FE
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 16:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 457C0405D6;
	Tue, 22 Feb 2022 16:49:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B2FIwhKEgHxt; Tue, 22 Feb 2022 16:49:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 809E8402C3;
	Tue, 22 Feb 2022 16:48:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8FD5D1BF3CB
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 16:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BB5881B52
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 16:48:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hqb17dZQM-eX for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 16:48:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 832028136B
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 16:48:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 94A5F8380B; Tue, 22 Feb 2022 16:40:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 17:45:56 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 5ea5466832baee7444e36f4defc2444cadf97af3
X-Git-Newrev: 199aa46d67c069bdbc326fcd130401ee6d3c07ec
X-Patchwork-Hint: ignore
Message-Id: <20220222164020.94A5F8380B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] linux/linux.mk: correct
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

commit: https://git.buildroot.net/buildroot/commit/?id=199aa46d67c069bdbc326fcd130401ee6d3c07ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
index 7114c8d20c..adde7a2c1d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -237,6 +237,8 @@ ifeq ($(KERNEL_ARCH),i386)
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
