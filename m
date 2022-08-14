Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED5BFC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 19:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5FBB83F0E;
	Sun, 14 Aug 2022 19:22:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5FBB83F0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V8g89t2FTWo2; Sun, 14 Aug 2022 19:22:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD27383F06;
	Sun, 14 Aug 2022 19:22:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD27383F06
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 862C21BF96B
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE13683EFC
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE13683EFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q6nEkREdK3Ti for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 19:21:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3EB4883EDE
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 19:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EB4883EDE
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9325E87547; Sun, 14 Aug 2022 19:06:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 21:01:31 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 1123b04f0220eebdd8f73658c542ca014e69c4fd
X-Git-Newrev: 048c6a5adf9640bd874fc380113553ca94e4cf83
X-Patchwork-Hint: ignore
Message-Id: <20220814190648.9325E87547@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/zfs: fix pam
 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=048c6a5adf9640bd874fc380113553ca94e4cf83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The --enable option was added to CONF_ENV instead of CONF_OPTS. For this
defconfig

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
BR2_PACKAGE_ZFS=y
BR2_PACKAGE_LINUX_PAM=y

this yields

/bin/sh: line 1: --enable-pam=yes: command not found

While we're at it, also remove the =yes which we usually don't add.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 8f79ab8f1e92ff86fa00f4cbfceabde0af3c2e9f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zfs/zfs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index dbda8aceb4..c04d2ff5cf 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -52,7 +52,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 ZFS_DEPENDENCIES += linux-pam
-ZFS_CONF_ENV += --enable-pam=yes
+ZFS_CONF_OPTS += --enable-pam
 else
 ZFS_CONF_OPTS += --disable-pam
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
