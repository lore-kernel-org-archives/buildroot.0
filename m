Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E278FC3DA63
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 16:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4B5B401C2;
	Wed, 24 Jul 2024 16:29:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q8ZM8zqVaVi6; Wed, 24 Jul 2024 16:29:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38FDB40DD9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38FDB40DD9;
	Wed, 24 Jul 2024 16:29:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A0F561BF29C
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 16:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EB7E6063A
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 16:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EYYnJd82ls3g for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 16:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9BAF6059D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9BAF6059D
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 16:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B29BF87429; Wed, 24 Jul 2024 16:29:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 24 Jul 2024 18:29:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 00c10e5fcef2ea98fd492e9c5a371ec960039d7a
X-Git-Newrev: 8ce17e304b02c6969e4fd51f0bde97798d49eb3b
X-Patchwork-Hint: ignore
Message-Id: <20240724162954.B29BF87429@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/btrfs-progs: don't install host
 udev files
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8ce17e304b02c6969e4fd51f0bde97798d49eb3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pass an empty value for udevdir to avoid the following host build
failure on one of the autobuilders:

/usr/bin/install -c -m755 -d /usr/lib/udev/rules.d
/usr/bin/install -c -m644 64-btrfs-dm.rules 64-btrfs-zoned.rules /usr/lib/udev/rules.d
/usr/bin/install: cannot create regular file '/usr/lib/udev/rules.d/64-btrfs-dm.rules': Permission denied
/usr/bin/install: cannot create regular file '/usr/lib/udev/rules.d/64-btrfs-zoned.rules': Permission denied

This build failure can be raised since the addition of the host variant
in commit ed69859a7261ee86e71aa666d30a28e374769e15. udev rules were
added by upstream in 2016 by
https://github.com/kdave/btrfs-progs/commit/62c0666378eb70285b6a3052bf4144d2132a5891

Fixes: ed69859a7261ee86e71aa666d30a28e374769e15
 - http://autobuild.buildroot.org/results/c46238afe8d23cf4bff4e7290a5eaebd0640eb6e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/btrfs-progs/btrfs-progs.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 800c0e3082..69424a2d72 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -62,5 +62,7 @@ HOST_BTRFS_PROGS_CONF_OPTS = \
 	--disable-python \
 	--disable-convert
 
+HOST_BTRFS_PROGS_INSTALL_OPTS = udevdir= install
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
