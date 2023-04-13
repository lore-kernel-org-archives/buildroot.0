Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040FAC77B6E
	for <buildroot@archiver.kernel.org>; Thu, 13 Apr 2023 18:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7821E4063E;
	Thu, 13 Apr 2023 18:35:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7821E4063E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QyBfJSIh5nho; Thu, 13 Apr 2023 18:35:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB9AB40584;
	Thu, 13 Apr 2023 18:35:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB9AB40584
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 54B451C3E12
 for <buildroot@lists.busybox.net>; Thu, 13 Apr 2023 18:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 399A240584
 for <buildroot@lists.busybox.net>; Thu, 13 Apr 2023 18:35:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 399A240584
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gZepyzY478Wz for <buildroot@lists.busybox.net>;
 Thu, 13 Apr 2023 18:35:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7097D400F2
 for <buildroot@buildroot.org>; Thu, 13 Apr 2023 18:35:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7097D400F2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60B778409E; Thu, 13 Apr 2023 18:35:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 13 Apr 2023 20:33:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 65849bd96d0de501c109c32fab01a5eb1fd3a629
X-Git-Newrev: 576d709a693aab13affdbe3d6dca5253e51a4877
X-Patchwork-Hint: ignore
Message-Id: <20230413183515.60B778409E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/skeleton: drop
 $(HOST_DIR)/usr compatibility symlink"
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

commit: https://git.buildroot.net/buildroot/commit/?id=576d709a693aab13affdbe3d6dca5253e51a4877
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In 38b798da73ba (package/skeleton: drop $(HOST_DIR)/usr compatibility
symlink), we considered that $(HOST_DIR)/usr is a legacy symlink, and so
we dropped it. During review, it was pointed out that:

 1. [if] something installs in HOST_DIR/usr it's probably going to
    break somewhere down the line,

 2. DESTDIR is empty for host builds. And PREFIX/usr would be completely
    crazy.

However, we do have a package where DESTDIR is not empty for host
packages. Indeed, for host-systemd, we do have a convoluted sequence
where we configure it for the traditional /usr prefix, rather than
$(HOST_DIR) for all other host packages, and we install it with
DESTDIR=$(HOST_DIR). This is because systemd has to interpret path on
the target, not on the host, and confusion ensues if host systemd is not
configured with the same prefix as the target systemd. See commit
35c11a027c88 (package/systemd: add host variant) for the full, in-depth
explanations.

This reverts commit 38b798da73ba69c9e1d8279805b621f80b98bc64.

This also changes the comment to note that, although legacy, the usr
symlink is still required for some weird host packages.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/skeleton/skeleton.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 186cb60189..4eaaf32ead 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -11,7 +11,12 @@
 SKELETON_ADD_TOOLCHAIN_DEPENDENCY = NO
 SKELETON_ADD_SKELETON_DEPENDENCY = NO
 
+# Although the $(HOST_DIR)/usr symlink is mostly for backward compatibility,
+# there are weird packages that still require it (see host-systemd, and
+# commit 35c11a027c88).
 define HOST_SKELETON_INSTALL_CMDS
+# check-package DoNotInstallToHostdirUsr
+	$(Q)ln -snf . $(HOST_DIR)/usr
 	$(Q)mkdir -p $(HOST_DIR)/lib
 	$(Q)mkdir -p $(HOST_DIR)/include
 	$(Q)case $(HOSTARCH) in \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
