Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC01C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 22:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEA686070B;
	Sun, 12 Dec 2021 22:29:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0HaI9VcEVD19; Sun, 12 Dec 2021 22:29:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03DF660ED8;
	Sun, 12 Dec 2021 22:28:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2BAF51BF973
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC2CF4030B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:23:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DRAAtGoHGYwq for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 22:23:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14E6E40308
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 22:23:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5B7918374E; Sun, 12 Dec 2021 22:18:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 23:13:25 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: c63dcc457969c1dce18a0fd06ac358fae1883703
X-Git-Newrev: 7954aa6e60ec2bda715ecfb1b656360f0581d2e3
X-Patchwork-Hint: ignore
Message-Id: <20211212221828.5B7918374E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] core/pkg-generic: also
 list files installed in images/
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

commit: https://git.buildroot.net/buildroot/commit/?id=7954aa6e60ec2bda715ecfb1b656360f0581d2e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Some packages install nothing in target nor staging, but install images
(like the kernel vmlinux, or a bootloader boot blob...)

If we want to appropriately account for the files installed by each
package, we also need to take images/ into account.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5d00fecb7dd922ae2c003b46683173756372fd14)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 97ee204b80..9f408a47ea 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -252,6 +252,7 @@ $(BUILD_DIR)/%/.stamp_configured:
 	$(call prepare-per-package-directory,$($(PKG)_FINAL_DEPENDENCIES))
 	@$(call pkg_size_before,$(TARGET_DIR))
 	@$(call pkg_size_before,$(STAGING_DIR),-staging)
+	@$(call pkg_size_before,$(BINARIES_DIR),-images)
 	@$(call pkg_size_before,$(HOST_DIR),-host)
 	$(call fixup-libtool-files,$(NAME),$(HOST_DIR))
 	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
@@ -378,6 +379,7 @@ $(BUILD_DIR)/%/.stamp_target_installed:
 $(BUILD_DIR)/%/.stamp_installed:
 	@$(call pkg_size_after,$(TARGET_DIR))
 	@$(call pkg_size_after,$(STAGING_DIR),-staging)
+	@$(call pkg_size_after,$(BINARIES_DIR),-images)
 	@$(call pkg_size_after,$(HOST_DIR),-host)
 	@$(call check_bin_arch)
 	$(Q)touch $@
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
