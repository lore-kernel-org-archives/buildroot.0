Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C005C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 22:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BD1360BA2;
	Sun,  9 Jan 2022 22:50:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8nke-u-5tWiE; Sun,  9 Jan 2022 22:50:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8472660B98;
	Sun,  9 Jan 2022 22:50:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2DCFA1BF96B
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8D4640201
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:49:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GbrSq5PA99Do for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 22:49:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3FC240223
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 22:49:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 772EB8324A; Sun,  9 Jan 2022 22:42:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 23:45:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7be02d67a939a42e323cd199798f215197bf5f87
X-Git-Newrev: 570ed7b8229222de70c11c2550f4694475445997
X-Patchwork-Hint: ignore
Message-Id: <20220109224247.772EB8324A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/btrfs-progs: fix build on kernel <
 5.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=570ed7b8229222de70c11c2550f4694475445997
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

zoned depends on kernel >= 5.10:
https://github.com/kdave/btrfs-progs/commit/d4b4baf312ff083fb1e85de92167ea3e968c684c

Fix the following build failure raised since bump to version 5.15.1 in
commit 20181c3f1b7191d2b6a1b78bfbe32c1f58e87359:

checking linux/blkzoned.h usability... yes
checking linux/blkzoned.h presence... yes
checking for linux/blkzoned.h... yes
checking for struct blk_zone.capacity... no
checking for BLKGETZONESZ defined in linux/blkzoned.h... yes
configure: error: linux/blkzoned.h does not provide blk_zone.capacity

Fixes:
 - http://autobuild.buildroot.org/results/381c7e8b4bfa624c3eca3ce072cfa412aba57f84

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/btrfs-progs/btrfs-progs.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index b010a0e0be..54922df839 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -44,6 +44,12 @@ else
 BTRFS_PROGS_CONF_OPTS += --disable-libudev
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10),y)
+BTRFS_PROGS_CONF_OPTS += --enable-zoned
+else
+BTRFS_PROGS_CONF_OPTS += --disable-zoned
+endif
+
 HOST_BTRFS_PROGS_DEPENDENCIES = host-util-linux host-lzo host-zlib
 HOST_BTRFS_PROGS_CONF_OPTS = \
 	--disable-backtrace \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
