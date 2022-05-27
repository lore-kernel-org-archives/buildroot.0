Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF95C433F5
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 09:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD51084A1E;
	Fri, 27 May 2022 09:54:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zRvrO7SMwI0W; Fri, 27 May 2022 09:54:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D10CA848FA;
	Fri, 27 May 2022 09:54:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 50A441C116E
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40B9542780
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:53:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mUxqBo7_p2UB for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 09:53:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66A2242775
 for <buildroot@buildroot.org>; Fri, 27 May 2022 09:53:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 562718665F; Fri, 27 May 2022 09:42:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 11:41:58 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 6050acbc0f3ca58c86b055a31bd926d54ad1b2ef
X-Git-Newrev: a081ec3b1d54057e096683c3294b9dd90799b5d6
X-Patchwork-Hint: ignore
Message-Id: <20220527094200.562718665F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/udev: move render
 and sgx to package/systemd
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

commit: https://git.buildroot.net/buildroot/commit/?id=a081ec3b1d54057e096683c3294b9dd90799b5d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit 6d163e12a47845804f7f979ddc55402e54ae88b3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
