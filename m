Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4274C4345F
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 18:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57CFF404A9;
	Thu, 11 Apr 2024 18:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iZxCdlAAciQz; Thu, 11 Apr 2024 18:31:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CF5D41EFC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CF5D41EFC;
	Thu, 11 Apr 2024 18:31:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D40521BF3EC
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 18:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BECD0822DA
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 18:31:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LvwLjnHuyZDC for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 18:31:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA63E822D9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA63E822D9
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 18:31:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0FDA86031; Thu, 11 Apr 2024 18:31:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 11 Apr 2024 20:30:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15381b57559182693f6d5530544937f8fcf3b471
X-Git-Newrev: 0b2967e15800421efbdfe3a7a6061cf6bd84134d
X-Patchwork-Hint: ignore
Message-Id: <20240411183107.D0FDA86031@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/skeleton-init-sysv: Set sticky bit
 on /dev/shm
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

commit: https://git.buildroot.net/buildroot/commit/?id=0b2967e15800421efbdfe3a7a6061cf6bd84134d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

/dev/shm is a world-writable directory, like /tmp, and should also
have the sticky bit set.  Without this, any user can delete and
replace another user's files in /dev/shm.

This bug has been present since /dev/shm was added to the skeleton
/etc/fstab, but appears to have been fixed for systems using systemd
by commit 76fc9275f14e "system: separate sysv and systemd parts of the
skeleton" which went into Buildroot 2017.08.

Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
Fixes: 22fde22e35f98f7830c2f8955465532328348cd1
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/skeleton-init-sysv/skeleton/etc/fstab | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/skeleton-init-sysv/skeleton/etc/fstab b/package/skeleton-init-sysv/skeleton/etc/fstab
index 169054b74f..06c20fe9d5 100644
--- a/package/skeleton-init-sysv/skeleton/etc/fstab
+++ b/package/skeleton-init-sysv/skeleton/etc/fstab
@@ -2,7 +2,7 @@
 /dev/root	/		ext2	rw,noauto	0	1
 proc		/proc		proc	defaults	0	0
 devpts		/dev/pts	devpts	defaults,gid=5,mode=620,ptmxmode=0666	0	0
-tmpfs		/dev/shm	tmpfs	mode=0777	0	0
+tmpfs		/dev/shm	tmpfs	mode=1777	0	0
 tmpfs		/tmp		tmpfs	mode=1777	0	0
 tmpfs		/run		tmpfs	mode=0755,nosuid,nodev	0	0
 sysfs		/sys		sysfs	defaults	0	0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
