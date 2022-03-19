Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCFCC433EF
	for <buildroot@archiver.kernel.org>; Sat, 19 Mar 2022 19:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B73A38266D;
	Sat, 19 Mar 2022 19:14:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rVCNMdwQuuZw; Sat, 19 Mar 2022 19:14:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D048281CFE;
	Sat, 19 Mar 2022 19:14:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 14D6D1BF962
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 19:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03FE660746
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 19:14:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UIf5iVsIiNaT for <buildroot@lists.busybox.net>;
 Sat, 19 Mar 2022 19:14:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EBC7605EA
 for <buildroot@buildroot.org>; Sat, 19 Mar 2022 19:14:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 975B183CB8; Sat, 19 Mar 2022 19:05:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 19 Mar 2022 19:57:25 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 079e1510bbe534d3ef75cfe7e4f5b01c0f5af166
X-Git-Newrev: 063ee76d294cf1bdc79f9b90a75ab6f70ed32d9f
X-Patchwork-Hint: ignore
Message-Id: <20220319190531.975B183CB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] fs/common.mk: use find
 instead of shell glob patterns
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

commit: https://git.buildroot.net/buildroot/commit/?id=063ee76d294cf1bdc79f9b90a75ab6f70ed32d9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit 38c4f6b807e9b519922172089915559fb8642046)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
