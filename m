Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38288C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 16:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C799F410E9;
	Sat, 12 Mar 2022 16:50:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id chcCV1DBVLMx; Sat, 12 Mar 2022 16:50:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D20C3410E5;
	Sat, 12 Mar 2022 16:49:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 650261BF3FF
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 16:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52ECC60804
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 16:49:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x-OKEySuGEzF for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 16:49:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAF5F607E3
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 16:49:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 04C5782A6F; Sat, 12 Mar 2022 16:41:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Mar 2022 17:45:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4dc0576b49bc67922b5c136b78ae4072726eeb71
X-Git-Newrev: 38c4f6b807e9b519922172089915559fb8642046
X-Patchwork-Hint: ignore
Message-Id: <20220312164122.04C5782A6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] fs/common.mk: use find instead of shell
 glob patterns
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

commit: https://git.buildroot.net/buildroot/commit/?id=38c4f6b807e9b519922172089915559fb8642046
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Different shells can have different behaviours when it comes to globbing
patterns. The dash shell (/bin/sh) on Debian testing switched to a
different fnmatch/glob implementation that results in this new behaviour:

Using bash:
    $ mkdir /tmp/foo
    $ echo /tmp/foo/.[^.]*
    /tmp/foo/.[^.]*

Using dash:
    $ mkdir /tmp/foo
    $ echo /tmp/foo/.[^.]*
    /tmp/foo/..

The current FAKEROOT script uses this shell glob pattern which now fails
on recent Debian testing systems:

    rm: refusing to remove '.' or '..' directory: skipping '/build/buildroot-fs/cpio/target/run/..'
    rm: refusing to remove '.' or '..' directory: skipping '/build/buildroot-fs/cpio/target/tmp/..'

Additionally, the glob will miss files which have at least two leading
dots, like ..foo ...bar or ......buz  (highly improbable, but still).

It seems safer to use `find | xargs rm` here instead of relying on shell
globbing patterns.

Signed-off-by: Mathieu Mirmont <mat@parad0x.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 fs/common.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index 45beb5ae7b..37eafac4f7 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -186,7 +186,8 @@ $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)
 
 	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),\
 		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
-	echo "rm -rf $$(TARGET_DIR)/run/* $$(TARGET_DIR)/run/.[^.]* $$(TARGET_DIR)/tmp/* $$(TARGET_DIR)/tmp/.[^.]*" >> $$(FAKEROOT_SCRIPT)
+	echo "find $$(TARGET_DIR)/run/ -mindepth 1 -prune -print0 | xargs -0r rm -rf --" >> $$(FAKEROOT_SCRIPT)
+	echo "find $$(TARGET_DIR)/tmp/ -mindepth 1 -prune -print0 | xargs -0r rm -rf --" >> $$(FAKEROOT_SCRIPT)
 	$$(call PRINTF,$$(ROOTFS_REPRODUCIBLE)) >> $$(FAKEROOT_SCRIPT)
 	$$(call PRINTF,$$(ROOTFS_SELINUX)) >> $$(FAKEROOT_SCRIPT)
 	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
