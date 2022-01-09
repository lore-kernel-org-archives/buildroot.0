Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986CDC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 09:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 472AA81777;
	Sun,  9 Jan 2022 09:10:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CbTMUCP89d6f; Sun,  9 Jan 2022 09:10:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2AE481775;
	Sun,  9 Jan 2022 09:10:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 76F5F1BF577
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 09:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71CC24010E
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 09:10:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IB40xTZz99eJ for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 09:10:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33573400F5
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 09:10:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 04CA982940; Sun,  9 Jan 2022 09:04:38 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 10:04:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 32ecd0242de75a1c01e295d30f78f155a8da1d17
X-Git-Newrev: 5e78e7e97d772124f0d31653aca33731abe5b4db
X-Patchwork-Hint: ignore
Message-Id: <20220109090438.04CA982940@busybox.osuosl.org>
Subject: [Buildroot] [git commit] fs: clean the volatile /run and /tmp
 directories
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

commit: https://git.buildroot.net/buildroot/commit/?id=5e78e7e97d772124f0d31653aca33731abe5b4db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

At run time, /run and /tmp get overmounted with a tmpfs, so anything
that is there becomes inaccessible.

Scripts in the fakeroot environment could call tools preparing the early
environment, leaving traces in /run or /tmp. For example, mkusers might
create home directories in /run: openssh sets the sshd home directory to
/run/sshd, so mkusers creates it. But since a tmpfs is mounted over it,
it doesn't exist at runtime, so the openssh service creates it at
startup (and deletes it when the service is stopped).

In addition, packages or rootfs overlay may leave things there as well.
Those may actually pose a runtime problem because the created file or
directory is missing - or it may not be a problem because the package
creates the missing files/directories on startup. In this situation,
it's better not to have them in the rootfs image (because they're not
functional anyway), but it's good to leave them in TARGET_DIR to make it
easier to debug the situation.

Therefore, remove the contents of /run and /tmp in the fakeroot
environment after ROOTFS_PRE_GEN_HOOKS, so they are still left in
TARGET_DIR.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 fs/common.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/common.mk b/fs/common.mk
index afab7b50fb..45beb5ae7b 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -186,6 +186,7 @@ $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)
 
 	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),\
 		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
+	echo "rm -rf $$(TARGET_DIR)/run/* $$(TARGET_DIR)/run/.[^.]* $$(TARGET_DIR)/tmp/* $$(TARGET_DIR)/tmp/.[^.]*" >> $$(FAKEROOT_SCRIPT)
 	$$(call PRINTF,$$(ROOTFS_REPRODUCIBLE)) >> $$(FAKEROOT_SCRIPT)
 	$$(call PRINTF,$$(ROOTFS_SELINUX)) >> $$(FAKEROOT_SCRIPT)
 	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
