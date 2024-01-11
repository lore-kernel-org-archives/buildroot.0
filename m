Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEA4C47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 10:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC9C083E64;
	Thu, 11 Jan 2024 10:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC9C083E64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id grvS6Ensy4HI; Thu, 11 Jan 2024 10:36:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 522B083E6B;
	Thu, 11 Jan 2024 10:36:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 522B083E6B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6EB4D1BF2F5
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 10:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F74343843
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 10:36:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F74343843
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rm2v9qIvrvC6 for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 10:36:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01A40400CE
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 10:36:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01A40400CE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D4A8585E6B; Thu, 11 Jan 2024 10:36:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 11:33:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c954953b40b343d09c075114d5af57bf157f3e3
X-Git-Newrev: edfa9ea45ce3c2ddad2c52ab57a8047f4257c76f
X-Patchwork-Hint: ignore
Message-Id: <20240111103642.D4A8585E6B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/udev: move back sgx group from
 systemd
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

commit: https://git.buildroot.net/buildroot/commit/?id=edfa9ea45ce3c2ddad2c52ab57a8047f4257c76f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 6d163e12a4784580 (package/udev: move render and sgx to
package/systemd) moved the sgx group creation to the systemd package because
eudev at that time did not reference it.  This changed in eudev 3.1.12 with
commit a8ffcd1b985fb4 (rules/50-udev-default.rules: fix issue 160) so move
it back to get rid of a warning from udevd:

udevd[303]: specified group 'sgx' unknown

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/systemd/systemd.mk | 1 -
 package/udev/udev.mk       | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 4746bda904..d371233cfe 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -639,7 +639,6 @@ endef
 define SYSTEMD_USERS
 	# udev user groups
 	- - render -1 * - - - DRI rendering nodes
-	- - sgx -1 * - - - SGX device nodes
 	# systemd user groups
 	- - systemd-journal -1 * - - - Journal
 	$(SYSTEMD_REMOTE_USER)
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index d70d13ebb3..21c1a71f5a 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -8,6 +8,7 @@
 define UDEV_USERS
 	- - input -1 * - - - Input device group
 	- - kvm -1 * - - - kvm nodes
+	- - sgx -1 * - - - SGX device nodes
 endef
 
 $(eval $(virtual-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
