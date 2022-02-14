Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE18C433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 20:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EB9881A50;
	Mon, 14 Feb 2022 20:37:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d34u8xs532kk; Mon, 14 Feb 2022 20:37:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E99A8186B;
	Mon, 14 Feb 2022 20:37:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7443C1BF348
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70BE741484
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:36:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aGqoo8NwrrHA for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 20:36:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8339A414A1
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 20:36:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 58A8A82AD4; Mon, 14 Feb 2022 20:29:10 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 21:15:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53b790631e57b049551230b48707a82a90541942
X-Git-Newrev: 9b0d3b12438db46565824da437958e526a7c4d71
X-Patchwork-Hint: ignore
Message-Id: <20220214202910.58A8A82AD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/keepalived: fix build with gcc <
 4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b0d3b12438db46565824da437958e526a7c4d71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable track-process to avoid the following build failure with
gcc < 4.9 raised since bump to version 2.2.7 in commit
79f631000fe6846e72f44810452bb764c228ad44 as suggested by upstream in
https://github.com/acassen/keepalived/issues/2094:

In file included from ../../lib/rbtree.h:24:0,
                 from ../../lib/rbtree_ka.h:26,
                 from ../../lib/scheduler.h:40,
                 from ../../lib/notify.h:31,
                 from ../../keepalived/include/vrrp.h:41,
                 from ../../keepalived/include/track_process.h:31,
                 from track_process.c:50:
../../lib/rbtree_types.h:31:25: error: initializer element is not constant
 #define RB_ROOT (struct rb_root) { NULL, }
                         ^

Fixes:
 - http://autobuild.buildroot.org/results/2132570fb0407abc0e70146d771471e13ef10237

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/keepalived/keepalived.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index c7e8c3e2ec..5d6cf174e3 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -56,4 +56,8 @@ else
 KEEPALIVED_CONF_OPTS += --disable-nftables
 endif
 
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_9),)
+KEEPALIVED_CONF_OPTS += --disable-track-process
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
