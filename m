Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E527BC433EF
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 12:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FAA460FBE;
	Wed,  2 Feb 2022 12:54:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dHW0VZcxd_ee; Wed,  2 Feb 2022 12:54:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87E6B60FC0;
	Wed,  2 Feb 2022 12:54:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7445D1BF576
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 12:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7112581C56
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 12:54:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kERGQ4qSgqbs for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 12:54:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF84881BB0
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 12:54:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 810F982156; Wed,  2 Feb 2022 12:46:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 2 Feb 2022 13:53:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3558a98df611ec7c9b4735326e97e17bfde2b9b9
X-Git-Newrev: d895bd973b35fde10d3dd7db530d9e4782926497
X-Patchwork-Hint: ignore
Message-Id: <20220202124656.810F982156@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux: fix host build failure
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

commit: https://git.buildroot.net/buildroot/commit/?id=d895bd973b35fde10d3dd7db530d9e4782926497
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The UTIL_LINUX_FIX_DISK_UTILS_COMPILE workaround is needed for host
building too. So let's add it to HOST_UTIL_LINUX_POST_PATCH_HOOKS.
host-util-linux is used a lot, so this patch fixes a lot of future
builds.

Fixes:
http://autobuild.buildroot.net/results/b8c/b8cb40efc036a01802c914544cd4fc29dfd67af6//

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
