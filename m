Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F1CC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 15:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ADE584931;
	Sat, 23 Jul 2022 15:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8ADE584931
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qf4Fr4S6CMV1; Sat, 23 Jul 2022 15:04:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACA0E8403F;
	Sat, 23 Jul 2022 15:04:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACA0E8403F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 247FE1BF859
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C299416B5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:03:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C299416B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7H_2M4smhMWS for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 15:03:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34D8341507
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 15:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34D8341507
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2217C8462D; Sat, 23 Jul 2022 14:50:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 17:03:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cbbd2dae9e8cbe839352730fd407269863dd3d18
X-Git-Newrev: 8f79ab8f1e92ff86fa00f4cbfceabde0af3c2e9f
X-Patchwork-Hint: ignore
Message-Id: <20220723145014.2217C8462D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zfs: fix pam support
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

commit: https://git.buildroot.net/buildroot/commit/?id=8f79ab8f1e92ff86fa00f4cbfceabde0af3c2e9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/zfs/zfs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index 07ce3295ec..0a6e4a3cfa 100644
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
