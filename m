Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627C0C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 12:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0182F400E9;
	Sun,  9 Jan 2022 12:50:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dr2CpiCCe7Hy; Sun,  9 Jan 2022 12:50:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B8E9404A8;
	Sun,  9 Jan 2022 12:50:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF19D1BF96B
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 12:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA12040354
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 12:50:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KFiB_sE9ebLc for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 12:50:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E20F40351
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 12:50:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B1CC082C0A; Sun,  9 Jan 2022 12:44:15 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 13:48:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f7a928f883b7f4c783b966fd6832332976517885
X-Git-Newrev: 83319384fdb5d6666cb21ad915576385f232efb7
X-Patchwork-Hint: ignore
Message-Id: <20220109124415.B1CC082C0A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: remove
 BR2_PACKAGE_SYSTEMD_TMPFILES completely
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

commit: https://git.buildroot.net/buildroot/commit/?id=83319384fdb5d6666cb21ad915576385f232efb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since tmpfiles is no longer optional, the Config.in symbol serves no
purpose. It was only used in cryptsetup.mk, where we replace it with
BR2_PACKAGE_SYSTEMD.

Advise to do the same in Config.in.legacy.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy                 | 9 +++++++++
 package/cryptsetup/cryptsetup.mk | 4 +---
 package/systemd/Config.in        | 4 ----
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 75873ff74b..a9e95d6f58 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,15 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_SYSTEMD_TMPFILES
+	bool "systemd tmpfiles support always enabled"
+	select BR2_LEGACY
+	help
+	  The systemd tmpfiles support is always enabled, so the symbol
+	  to make it optional has been removed. You need to update any
+	  external packages that use this symbol to use
+	  BR2_PACKAGE_SYSTEMD instead.
+
 config BR2_PACKAGE_CIVETWEB_WITH_LUA
 	bool "civetweb lua support option removed"
 	select BR2_LEGACY
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 676cd25be4..9cfd647ac6 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -42,10 +42,8 @@ else
 CRYPTSETUP_CONF_OPTS += --disable-ssh-token
 endif
 
-ifeq ($(BR2_PACKAGE_SYSTEMD_TMPFILES),y)
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 CRYPTSETUP_CONF_OPTS += --with-tmpfilesdir=/usr/lib/tmpfiles.d
-else
-CRYPTSETUP_CONF_OPTS += --without-tmpfilesdir
 endif
 
 HOST_CRYPTSETUP_DEPENDENCIES = \
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 833c89eaa2..cc0736561e 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -500,10 +500,6 @@ config BR2_PACKAGE_SYSTEMD_TIMESYNCD
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-timesyncd.html
 
-config BR2_PACKAGE_SYSTEMD_TMPFILES
-	bool
-	default y
-
 config BR2_PACKAGE_SYSTEMD_USERDB
 	bool "enable userdb daemon"
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
