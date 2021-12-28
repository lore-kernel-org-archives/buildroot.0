Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA18C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 09:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A8F8402FF;
	Tue, 28 Dec 2021 09:12:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hsnbLdye6_6D; Tue, 28 Dec 2021 09:12:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82400401DB;
	Tue, 28 Dec 2021 09:12:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 31EBD1BF5A2
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 09:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E9D081AD1
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 09:12:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nDQ6c1g5-xRK for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 09:12:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 171F9812CC
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 09:12:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 2177A240004;
 Tue, 28 Dec 2021 09:12:19 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 10:12:17 +0100
Message-Id: <20211228091218.1154072-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/squashfs: add upstream patch to fix
 symlinks
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since version 4.5, squashfs-tools provides two additional utilities:
sqfstar and sqfscat. But their functionality is bundled within
mksquashfs and unsquashfs respectively, so that sqfstar is a symlink
to sqfstar, and sqfscat a symlink to unsquashfs.

Unfortunately, due to how the symlinks were created, they had a bogus
target when INSTALL_DIR was not empty, leading to things like this:

 ./usr/bin/sqfscat -> /home/peko/autobuild/instance-1/output-2/target/usr/bin/unsquashfs
 ./usr/bin/sqfstar -> /home/peko/autobuild/instance-1/output-2/target/usr/bin/mksquashfs

Not only they are wrong, but they also cause reproducible build
issues (this is how they were detected).

This commit backports an upstream patch that fixes this problem.

This is also fixing the squashfs-tools part of the reproducible build
issues at:

  http://autobuild.buildroot.net/results/00af5dca8c30b243af1e8cde3b02e264f7603442/diffoscope-results.txt

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...e-of-INSTALL_DIR-for-symlink-targets.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/squashfs/0001-Avoid-use-of-INSTALL_DIR-for-symlink-targets.patch

diff --git a/package/squashfs/0001-Avoid-use-of-INSTALL_DIR-for-symlink-targets.patch b/package/squashfs/0001-Avoid-use-of-INSTALL_DIR-for-symlink-targets.patch
new file mode 100644
index 0000000000..997719e63a
--- /dev/null
+++ b/package/squashfs/0001-Avoid-use-of-INSTALL_DIR-for-symlink-targets.patch
@@ -0,0 +1,37 @@
+From f5c908e92d4c055859be2fddbda266d9e3bfd415 Mon Sep 17 00:00:00 2001
+From: Patrick McCarty <patrick.mccarty@intel.com>
+Date: Mon, 26 Jul 2021 11:38:43 -0700
+Subject: [PATCH] Avoid use of INSTALL_DIR for symlink targets
+
+In case INSTALL_DIR is overridden with a staged install location, using
+INSTALL_DIR for the symlink target path prefix will yield an incorrect location
+for the final installation.
+
+Because the symlink itself is already installed to INSTALL_DIR, simply removing
+the INSTALL_DIR prefix suffices as a fix.
+
+Note that using $DESTDIR/$INSTALL_DIR where appropriate can avoid this type of
+issue, but that can be considered a future enhancement.
+
+Signed-off-by: Patrick McCarty <patrick.mccarty@intel.com>
+Upstream: f5c908e92d4c055859be2fddbda266d9e3bfd415
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ squashfs-tools/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/squashfs-tools/Makefile b/squashfs-tools/Makefile
+index f5a55f1..7262a2e 100755
+--- a/squashfs-tools/Makefile
++++ b/squashfs-tools/Makefile
+@@ -406,5 +406,5 @@ install: mksquashfs unsquashfs
+ 	mkdir -p $(INSTALL_DIR)
+ 	cp mksquashfs $(INSTALL_DIR)
+ 	cp unsquashfs $(INSTALL_DIR)
+-	ln -fs $(INSTALL_DIR)/unsquashfs $(INSTALL_DIR)/sqfscat
+-	ln -fs $(INSTALL_DIR)/mksquashfs $(INSTALL_DIR)/sqfstar
++	ln -fs unsquashfs $(INSTALL_DIR)/sqfscat
++	ln -fs mksquashfs $(INSTALL_DIR)/sqfstar
+-- 
+2.31.1
+
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
