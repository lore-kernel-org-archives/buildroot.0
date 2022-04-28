Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663FDC433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 15:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 009CD40499;
	Thu, 28 Apr 2022 15:34:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rpPcmcM4dOB8; Thu, 28 Apr 2022 15:34:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B25940374;
	Thu, 28 Apr 2022 15:34:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 75F031BF39D
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 15:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 642BA83487
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 15:34:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id umdFy9r93rKi for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 15:34:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C9CD83366
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 15:34:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id F076284619; Thu, 28 Apr 2022 15:24:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 17:34:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1a424e9a4b968bb799ac166ec2e14fb6d89c8b35
X-Git-Newrev: 6d163e12a47845804f7f979ddc55402e54ae88b3
X-Patchwork-Hint: ignore
Message-Id: <20220428152425.F076284619@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/udev: move render and sgx to
 package/systemd
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

commit: https://git.buildroot.net/buildroot/commit/?id=6d163e12a47845804f7f979ddc55402e54ae88b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Moved groups render and sgx from UDEV_USERS to SYSTEMD_USERS as they
currently only appear in systemd's udev rules.

In systemd, group render was introduced since commit 4e15a73, and group
sgx was introduced since commit c9c4899.

In eudev, group render was introduced since commit bb070c1, but was
removed since commit a8ffcd1 [1].

[1]: https://github.com/eudev-project/eudev/issues/160

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Carlos Santos <unixmania@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/systemd/systemd.mk | 2 ++
 package/udev/udev.mk       | 4 +---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 58a1376b51..7a711319cf 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -603,6 +603,8 @@ endef
 
 define SYSTEMD_USERS
 	# udev user groups
+	- - render -1 * - - - DRI rendering nodes
+	- - sgx -1 * - - - SGX device nodes
 	# systemd user groups
 	- - systemd-journal -1 * - - - Journal
 	$(SYSTEMD_REMOTE_USER)
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index ce93d98431..d70d13ebb3 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-# Required by default rules for input devices
+# Required by default rules
 define UDEV_USERS
 	- - input -1 * - - - Input device group
-	- - render -1 * - - - DRI rendering nodes
 	- - kvm -1 * - - - kvm nodes
-	- - sgx -1 * - - - SGX device nodes
 endef
 
 $(eval $(virtual-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
