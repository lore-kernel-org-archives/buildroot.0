Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48EDC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 13:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A67C40527;
	Sun,  9 Jan 2022 13:04:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7GyqxR2TZg67; Sun,  9 Jan 2022 13:04:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FC5E40543;
	Sun,  9 Jan 2022 13:04:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A4AF01BF4D7
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 13:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A10F960B51
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 13:04:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5uwSHbqWLDSI for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 13:04:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E591A60B44
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 13:04:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5984E82B94; Sun,  9 Jan 2022 12:58:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 14:04:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 85aab41ef9f818216635c9b0f64bf9c20c176135
X-Git-Newrev: 97eb7d0c131feb060a6f55fffbcda8a82c9b5bb1
X-Patchwork-Hint: ignore
Message-Id: <20220109125818.5984E82B94@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/skeleton-init-systemd: support
 /var/lock again
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

commit: https://git.buildroot.net/buildroot/commit/?id=97eb7d0c131feb060a6f55fffbcda8a82c9b5bb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

systemd's own configuration file is not installed anymore,
as side effect of disabling sysv support in commit
96f0d9969e6220154b39d9d80cda97998d41f670.

Add the legacy.conf functionality back in skeleton-init-systemd,
since this is a buildroot feature to support software expecting
these directories to exist, as well as trying to be similar to
other init systems.

Create our own legacy.conf instead of using the one from upstream,
because:

- upstream has legacy.conf.in which has to be preprocessed;
- we don't want to enable upstream's full sysv support as explained in
  commit 96f0d9969e6220154b39d9d80cda97998d41f670;
- we would probably need to post-process upstream's legacy.conf anyway
  since it doesn't fully match with buildroot expectations.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/skeleton-init-systemd/legacy.conf              | 7 +++++++
 package/skeleton-init-systemd/skeleton-init-systemd.mk | 1 +
 2 files changed, 8 insertions(+)

diff --git a/package/skeleton-init-systemd/legacy.conf b/package/skeleton-init-systemd/legacy.conf
new file mode 100644
index 0000000000..0a5393408c
--- /dev/null
+++ b/package/skeleton-init-systemd/legacy.conf
@@ -0,0 +1,7 @@
+# Create legacy directories for buildroot
+# This is a subset of systemd's legacy.conf
+
+d /run/lock 0755 root root -
+d /run/lock/subsys 0755 root root -
+
+L /var/lock - - - - ../run/lock
diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
index 5d6b716f7a..1e212cc2f7 100644
--- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
+++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
@@ -62,6 +62,7 @@ define SKELETON_INIT_SYSTEMD_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/srv
 	mkdir -p $(TARGET_DIR)/var
 	ln -s ../run $(TARGET_DIR)/var/run
+	install -D -m644 $(SKELETON_INIT_SYSTEMD_PKGDIR)/legacy.conf $(TARGET_DIR)/usr/lib/tmpfiles.d/legacy.conf
 	$(SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
