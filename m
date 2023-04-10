Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C689C77B61
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 19:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 271A861379;
	Mon, 10 Apr 2023 19:24:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 271A861379
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W4xLesLCQ6jP; Mon, 10 Apr 2023 19:24:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B4C660E92;
	Mon, 10 Apr 2023 19:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B4C660E92
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EECB31BF316
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C808E607F0
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:24:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C808E607F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y0SjHjUTWJOn for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 19:24:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DD6E60E92
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 19:24:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DD6E60E92
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0CFD383CB1; Mon, 10 Apr 2023 19:24:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 21:21:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a379499f7334c2a68d375b1cf9dc35cd59884181
X-Git-Newrev: 38b798da73ba69c9e1d8279805b621f80b98bc64
X-Patchwork-Hint: ignore
Message-Id: <20230410192425.0CFD383CB1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/skeleton: drop $(HOST_DIR)/usr
 compatibility symlink
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

commit: https://git.buildroot.net/buildroot/commit/?id=38b798da73ba69c9e1d8279805b621f80b98bc64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It has been years that we removed $(HOST_DIR)/usr. Because of this
symlink, however, there are still packages that install things in
$(HOST_DIR)/usr. Remove the symlink so those packages will start to
fail.

Note that there's now a check-package check to detect such incorrectly
instaled things, so this should only affect external packages.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/skeleton/skeleton.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 634c76e437..186cb60189 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -11,11 +11,7 @@
 SKELETON_ADD_TOOLCHAIN_DEPENDENCY = NO
 SKELETON_ADD_SKELETON_DEPENDENCY = NO
 
-# We create a compatibility symlink in case a post-build script still
-# uses $(HOST_DIR)/usr
 define HOST_SKELETON_INSTALL_CMDS
-# check-package DoNotInstallToHostdirUsr
-	$(Q)ln -snf . $(HOST_DIR)/usr
 	$(Q)mkdir -p $(HOST_DIR)/lib
 	$(Q)mkdir -p $(HOST_DIR)/include
 	$(Q)case $(HOSTARCH) in \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
