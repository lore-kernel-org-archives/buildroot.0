Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D185BCD13DD
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 17:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C5F4841BC;
	Sat, 31 Aug 2024 17:13:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pSKr_h_fWgRP; Sat, 31 Aug 2024 17:13:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DB9B842A2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DB9B842A2;
	Sat, 31 Aug 2024 17:13:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2BAB71BF5E6
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 17:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D88F5840C3
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 17:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V-RArzSTkUQS for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 17:13:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 082ED840C5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 082ED840C5
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 17:13:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E70BD867F0; Sat, 31 Aug 2024 17:13:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 19:12:43 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 7fb8297df405da4affcb68c7647a41487b7d129e
X-Git-Newrev: ae878fea3d5e50847c7a39a2ac87071bfeaf8fda
X-Patchwork-Hint: ignore
Message-Id: <20240831171343.E70BD867F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/btrfs-progs:
 don't install host udev files
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae878fea3d5e50847c7a39a2ac87071bfeaf8fda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
(cherry picked from commit 8ce17e304b02c6969e4fd51f0bde97798d49eb3b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/btrfs-progs/btrfs-progs.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 9bf50ccfda..1e4c7767f0 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -59,5 +59,7 @@ HOST_BTRFS_PROGS_CONF_OPTS = \
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
