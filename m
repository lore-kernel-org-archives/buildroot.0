Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6371DCD11DF
	for <buildroot@archiver.kernel.org>; Thu, 28 Mar 2024 20:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08F13417FC;
	Thu, 28 Mar 2024 20:48:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6xtmZcZXAAra; Thu, 28 Mar 2024 20:48:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 140B8417EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 140B8417EE;
	Thu, 28 Mar 2024 20:48:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E199E1BF2F6
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 20:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEC6760D5E
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 20:48:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FHOcrXKC9VN5 for <buildroot@lists.busybox.net>;
 Thu, 28 Mar 2024 20:48:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2201A60E27
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2201A60E27
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 20:48:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 081C084454; Thu, 28 Mar 2024 20:48:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 28 Mar 2024 21:35:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 409b76aea4e3e6c4795447d1e46cc377bd2a062f
X-Git-Newrev: 96b3295ca1fc00973fa2754dafb80fe6db23f48f
X-Patchwork-Hint: ignore
Message-Id: <20240328204830.081C084454@busybox.osuosl.org>
Subject: [Buildroot] [git commit] system: expose BR2_ROOTFS_POST_SCRIPT_ARGS
 for PRE_BUILD scripts
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

commit: https://git.buildroot.net/buildroot/commit/?id=96b3295ca1fc00973fa2754dafb80fe6db23f48f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we pass BR2_ROOTFS_POST_SCRIPT_ARGS to each of the scripts in
BR2_ROOTFS_PRE_BUILD_SCRIPT, but the option is not exposed in menuconfig
when only pre-build scripts are used.

Add the pre-build scripts to the condition exposing the extra args
option.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 system/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 33ca69b933..e590a8a3ff 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -695,12 +695,13 @@ config BR2_ROOTFS_POST_IMAGE_SCRIPT
 
 config BR2_ROOTFS_POST_SCRIPT_ARGS
 	string "Extra arguments passed to custom scripts"
-	depends on BR2_ROOTFS_POST_BUILD_SCRIPT != "" \
+	depends on BR2_ROOTFS_PRE_BUILD_SCRIPT != "" \
+	        || BR2_ROOTFS_POST_BUILD_SCRIPT != "" \
 		|| BR2_ROOTFS_POST_FAKEROOT_SCRIPT != "" \
 		|| BR2_ROOTFS_POST_IMAGE_SCRIPT != ""
 	help
-	  Pass these additional arguments to each post-build or
-	  post-image scripts.
+	  Pass these additional arguments to each pre-build, post-build,
+	  post-fakeroot and post-image scripts.
 
 	  Note that all the post-build and post-image scripts will be
 	  passed the same set of arguments, you can not pass different
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
