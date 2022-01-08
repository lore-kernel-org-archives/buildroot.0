Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF61AC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 19:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56B59400C1;
	Sat,  8 Jan 2022 19:40:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vZDJQ5jY40c5; Sat,  8 Jan 2022 19:40:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 684E840204;
	Sat,  8 Jan 2022 19:40:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CA0D41BF3C9
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 19:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8AF14046D
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 19:40:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZmWNcnZfH4dn for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 19:40:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FD654043D
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 19:40:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 304D88345B; Sat,  8 Jan 2022 19:34:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 20:40:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 329f71ed3038af9403d606ec1f1b0d2d96c6f340
X-Git-Newrev: 188f8c836d9a3224c8cc6dda429108b0938c8cc2
X-Patchwork-Hint: ignore
Message-Id: <20220108193401.304D88345B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/btrfs-progs: disable zoned on host
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

commit: https://git.buildroot.net/buildroot/commit/?id=188f8c836d9a3224c8cc6dda429108b0938c8cc2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable zoned on host variant to avoid the following build failure since
bump to version 5.15.1 in commit
20181c3f1b7191d2b6a1b78bfbe32c1f58e87359 and
https://github.com/kdave/btrfs-progs/commit/7953f4357bfc6c6526451bc889527b07f0840816:

checking linux/blkzoned.h usability... yes
checking linux/blkzoned.h presence... yes
checking for linux/blkzoned.h... yes
checking for struct blk_zone.capacity... no
checking for BLKGETZONESZ defined in linux/blkzoned.h... no
configure: error: linux/blkzoned.h does not provide blk_zone.capacity

Fixes:
 - http://autobuild.buildroot.org/results/03235edd829436d784a9b214050cc97584f372fb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/btrfs-progs/btrfs-progs.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 50c8e59e50..4c26cf0df5 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -41,6 +41,7 @@ HOST_BTRFS_PROGS_DEPENDENCIES = host-util-linux host-lzo host-zlib
 HOST_BTRFS_PROGS_CONF_OPTS = \
 	--disable-backtrace \
 	--disable-libudev \
+	--disable-zoned \
 	--disable-zstd \
 	--disable-python \
 	--disable-convert
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
