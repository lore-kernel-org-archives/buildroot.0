Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4597C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 19:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E4A540A7A;
	Sat,  4 Dec 2021 19:10:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PcGDN_xEdNAJ; Sat,  4 Dec 2021 19:10:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC5FB409D3;
	Sat,  4 Dec 2021 19:10:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 869C71BF3D0
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 19:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81904401DD
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 19:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m-Ppdu04OIJ5 for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 19:09:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5C514010A
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 19:09:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B7F108DAC2; Sat,  4 Dec 2021 19:04:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 20:09:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 77304e5143bf77e9fd2f8125807bbf9665cda8bc
X-Git-Newrev: 5d00fecb7dd922ae2c003b46683173756372fd14
X-Patchwork-Hint: ignore
Message-Id: <20211204190452.B7F108DAC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] core/pkg-generic: also list files
 installed in images/
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

commit: https://git.buildroot.net/buildroot/commit/?id=5d00fecb7dd922ae2c003b46683173756372fd14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages install nothing in target nor staging, but install images
(like the kernel vmlinux, or a bootloader boot blob...)

If we want to appropriately account for the files installed by each
package, we also need to take images/ into account.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index ded5176428..c8351b3027 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -276,6 +276,7 @@ $(BUILD_DIR)/%/.stamp_configured:
 	$(call prepare-per-package-directory,$($(PKG)_FINAL_DEPENDENCIES))
 	@$(call pkg_size_before,$(TARGET_DIR))
 	@$(call pkg_size_before,$(STAGING_DIR),-staging)
+	@$(call pkg_size_before,$(BINARIES_DIR),-images)
 	@$(call pkg_size_before,$(HOST_DIR),-host)
 	$(call fixup-libtool-files,$(NAME),$(HOST_DIR))
 	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
@@ -402,6 +403,7 @@ $(BUILD_DIR)/%/.stamp_target_installed:
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
