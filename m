Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FCFCEFC56
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 20:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 443C06063A;
	Tue,  8 Oct 2024 20:42:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oTpmo7Emd43j; Tue,  8 Oct 2024 20:42:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48BDF60658
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48BDF60658;
	Tue,  8 Oct 2024 20:42:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 81E321BF31C
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 20:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 713F880F4A
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 20:42:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Za3_2AhN45Ta for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 20:42:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6151D80F3F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6151D80F3F
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 20:42:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 57E0985BE2; Tue,  8 Oct 2024 20:42:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 8 Oct 2024 22:10:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 699b3c38fd5cd4de88b1df8d10c1ab45edcf2468
X-Git-Newrev: aa3ba9755417eda35a68a6fdb4752a57fe5620a8
X-Patchwork-Hint: ignore
Message-Id: <20241008204223.57E0985BE2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender-grubenv: Fix per-package
 building
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=aa3ba9755417eda35a68a6fdb4752a57fe5620a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Normally, two packages should never touch the same file. However, the
mender-grubenv package is a special case, as its sole purpose is to overwrite
the grub.cfg file.

As per-package directory building has no guarantee that the grub package is
rsynced to the target directory before the mender-grubenv package, this leads
to the possiblity that mender-grubenvs grub.conf file is overwritten with the
stock grub2 packages grub.conf file.

Instead of a MENDER_GRUBENV_INSTALL_I386_CFG and MENDER_GRUBENV_INSTALL_EFI_CFG
being part if MENDER_GRUBENV_INSTALL_IMAGES_CMDS, move them to
TARGET_FINALIZE_HOOKS. This guarantees that the grub.cfg provided by the
mender-grubenv package is installed after grub.conf provided by the grub2
package.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/mender-grubenv/mender-grubenv.mk | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
index cdda26bfbb..a47531fe58 100644
--- a/package/mender-grubenv/mender-grubenv.mk
+++ b/package/mender-grubenv/mender-grubenv.mk
@@ -11,7 +11,6 @@ MENDER_GRUBENV_LICENSE_FILES = LICENSE
 # Grub2 must be built first so this package can overwrite the config files
 # provided by grub.
 MENDER_GRUBENV_DEPENDENCIES = grub2 util-linux
-MENDER_GRUBENV_INSTALL_IMAGES = YES
 
 MENDER_GRUBENV_MAKE_ENV = \
 	$(TARGET_CONFIGURE_OPTS) \
@@ -34,12 +33,13 @@ MENDER_GRUBENV_MAKE_ENV += BOOT_DIR=/boot
 
 define MENDER_GRUBENV_INSTALL_I386_CFG
 	mkdir -p $(BINARIES_DIR)/boot-part/grub
-	cp -dpfr $(@D)/mender_grub.cfg \
+	cp -dpfr $(MENDER_GRUBENV_BUILDDIR)/mender_grub.cfg \
 		$(TARGET_DIR)/boot/grub/grub.cfg
 	cp -dpfr $(TARGET_DIR)/boot/grub/grub.cfg \
 		$(TARGET_DIR)/boot/grub-mender-grubenv \
 		$(BINARIES_DIR)/boot-part/
 endef
+MENDER_GRUBENV_TARGET_FINALIZE_HOOKS += MENDER_GRUBENV_INSTALL_I386_CFG
 endif # BR2_TARGET_GRUB2_HAS_LEGACY_BOOT
 
 ifeq ($(BR2_TARGET_GRUB2_HAS_EFI_BOOT),y)
@@ -51,13 +51,14 @@ MENDER_GRUBENV_MAKE_ENV += BOOT_DIR=/boot/EFI/BOOT
 
 define MENDER_GRUBENV_INSTALL_EFI_CFG
 	mkdir -p $(BINARIES_DIR)/efi-part/EFI/BOOT
-	cp -dpfr $(@D)/mender_grub.cfg \
+	cp -dpfr $(MENDER_GRUBENV_BUILDDIR)/mender_grub.cfg \
 		$(TARGET_DIR)/boot/EFI/BOOT/grub.cfg
 	cp -dpfr $(TARGET_DIR)/boot/EFI/BOOT/grub.cfg \
 		$(BINARIES_DIR)/efi-part/EFI/BOOT
 	cp -dpfr $(TARGET_DIR)/boot/EFI/BOOT/grub-mender-grubenv \
 		$(BINARIES_DIR)/efi-part/
 endef
+MENDER_GRUBENV_TARGET_FINALIZE_HOOKS += MENDER_GRUBENV_INSTALL_EFI_CFG
 endif # BR2_TARGET_GRUB2_HAS_EFI_BOOT
 
 ifeq ($(BR2_PACKAGE_MENDER_GRUBENV)$(BR_BUILDING),yy)
@@ -86,9 +87,4 @@ define MENDER_GRUBENV_INSTALL_TARGET_CMDS
 	echo 'ENV_DIR=/boot/grub-mender-grubenv' > $(TARGET_DIR)/etc/mender_grubenv.config
 endef
 
-define MENDER_GRUBENV_INSTALL_IMAGES_CMDS
-	$(MENDER_GRUBENV_INSTALL_I386_CFG)
-	$(MENDER_GRUBENV_INSTALL_EFI_CFG)
-endef
-
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
