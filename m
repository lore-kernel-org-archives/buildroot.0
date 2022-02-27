Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DCCC433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 19:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B8C840979;
	Sun, 27 Feb 2022 19:47:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dbE2xcCJS0mw; Sun, 27 Feb 2022 19:47:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D309340942;
	Sun, 27 Feb 2022 19:47:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E7B331BF3EC
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 19:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48AD040533
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 19:45:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mZe3cl0fUF1V for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 19:45:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A62C74042B
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 19:45:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4E7F3827CC; Sun, 27 Feb 2022 19:37:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 27 Feb 2022 20:35:00 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 307f91968d2b7e7c6f005326e23664939e1600df
X-Git-Newrev: af705b14a91b2c025d36e77f2f876abc3602835d
X-Patchwork-Hint: ignore
Message-Id: <20220227193728.4E7F3827CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/util-linux: fix
 host build failure
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

commit: https://git.buildroot.net/buildroot/commit/?id=af705b14a91b2c025d36e77f2f876abc3602835d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The UTIL_LINUX_FIX_DISK_UTILS_COMPILE workaround is needed for host
building too. So let's add it to HOST_UTIL_LINUX_POST_PATCH_HOOKS.
host-util-linux is used a lot, so this patch fixes a lot of future
builds.

Fixes:
http://autobuild.buildroot.net/results/b8c/b8cb40efc036a01802c914544cd4fc29dfd67af6//

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit d895bd973b35fde10d3dd7db530d9e4782926497)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/util-linux.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index e59ef7dadc..5a4ff64d01 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -41,6 +41,7 @@ define UTIL_LINUX_FIX_DISK_UTILS_COMPILE
 	touch $(@D)/disk-utils/raw.8
 endef
 UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
+HOST_UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
 
 HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
