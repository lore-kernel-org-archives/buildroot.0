Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3808DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 19:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD8DE84BB0;
	Wed, 12 Jan 2022 19:41:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qAyxm3UvrxeK; Wed, 12 Jan 2022 19:41:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B5C584C27;
	Wed, 12 Jan 2022 19:41:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 00BD61BF2CD
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 19:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1D79400A4
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 19:41:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DU9iBuV3_AW8 for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 19:41:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 093904031C
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 19:41:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1158482A98; Wed, 12 Jan 2022 19:34:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 12 Jan 2022 20:38:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0e0118a6a7d85081529ad66aa72f74025d682c60
X-Git-Newrev: 02d35007472675c147be79b4ca06959c83ae4128
X-Patchwork-Hint: ignore
Message-Id: <20220112193444.1158482A98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] system/skeleton: provide run/lock directory
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

commit: https://git.buildroot.net/buildroot/commit/?id=02d35007472675c147be79b4ca06959c83ae4128
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We changed the skeletons in bf01e51f3c, so that var/lock
points to run/lock. This resulted in build failures as
some packages want to work with these paths.

-   Create run/lock, the run directory will be purged
    later anyway (since 5e78e7e97d).
-   for init == systemd, create the var/lock symlink early
    to prevent packages creating this path as directory.

Fixes:
http://autobuild.buildroot.net/results/3ee/3ee8f9ee55e51af38e9dbe7b9840c9589d88a30f

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/skeleton-init-systemd/skeleton-init-systemd.mk | 2 ++
 system/skeleton/run/{ => lock}/.empty                  | 0
 2 files changed, 2 insertions(+)

diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
index 1e212cc2f7..795a171809 100644
--- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
+++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
@@ -62,6 +62,8 @@ define SKELETON_INIT_SYSTEMD_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/srv
 	mkdir -p $(TARGET_DIR)/var
 	ln -s ../run $(TARGET_DIR)/var/run
+	# prevent install scripts to create var/lock as directory
+	ln -s ../run/lock $(TARGET_DIR)/var/lock
 	install -D -m644 $(SKELETON_INIT_SYSTEMD_PKGDIR)/legacy.conf $(TARGET_DIR)/usr/lib/tmpfiles.d/legacy.conf
 	$(SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW)
 endef
diff --git a/system/skeleton/run/.empty b/system/skeleton/run/lock/.empty
similarity index 100%
rename from system/skeleton/run/.empty
rename to system/skeleton/run/lock/.empty
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
