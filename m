Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2A2C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 11:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F222C40114;
	Sun,  5 Dec 2021 11:57:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xcAlv_5eVGME; Sun,  5 Dec 2021 11:57:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E491B4024C;
	Sun,  5 Dec 2021 11:57:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A5A511BF27E
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 11:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1A1B405D2
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 11:57:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cyTh35OHBBbj for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 11:57:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9451405CE
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 11:57:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 222F77F899; Sun,  5 Dec 2021 11:52:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Dec 2021 12:26:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7bd6ed208c234d0a0a065ce13e0fe9a5f438e9ba
X-Git-Newrev: 3f7e96a01abaf976016f50b5c29daf17d96f2ec6
X-Patchwork-Hint: ignore
Message-Id: <20211205115206.222F77F899@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender-grubenv: fix install for
 legacy BIOS or ARM U-Boot
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
Content-Type: multipart/mixed; boundary="===============2210440188998031431=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2210440188998031431==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3f7e96a01abaf976016f50b5c29daf17d96f2ec6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some last-minute changes were made when applying commits 7a68960b682c0
(boot/grub2/Config.in: add symbols to represent legacy and EFI boot) and
4d5b209384e0 (package/mender-grubenv: fix grub module checks), and the
renaming of the BR2_TARGET_GRUB_LEGACY was not fully propagated.

This caused the path to the boot files to always be interpreted as being
the EFI one, and never the legacy one. In practice, that was not causing
any build failure, because the path was passed at build-time to
mender-grubenv, that would use it as the location where to install its
files, and finally as the location where our image-isntall commands
would look for them.

Still this is incorrect because it would not match where grub2 would
eventually end up lookig for its files at runtime...

To avoid further issue, drop the conditional block dedicated to setting
the path to the boot files, drop the intermediate variable, and move
setting the environment variable down into the existing conditional
block.

We do drop the intermediate variable, because there is no longer any
genericity needed: the installation commands are already duplicated for
the two cases anyway.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Köry Maincent <kory.maincent@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mender-grubenv/mender-grubenv.mk | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
index 6b8800e1de..9d5be8d8f4 100644
--- a/package/mender-grubenv/mender-grubenv.mk
+++ b/package/mender-grubenv/mender-grubenv.mk
@@ -13,16 +13,9 @@ MENDER_GRUBENV_LICENSE_FILES = LICENSE
 MENDER_GRUBENV_DEPENDENCIES = grub2
 MENDER_GRUBENV_INSTALL_IMAGES = YES
 
-ifeq ($(BR2_TARGET_GRUB_LEGACY),y)
-MENDER_GRUBENV_ENV_DIR = /boot/grub
-else
-MENDER_GRUBENV_ENV_DIR = /boot/EFI/BOOT
-endif
-
 MENDER_GRUBENV_MAKE_ENV = \
 	$(TARGET_CONFIGURE_OPTS) \
-	$(TARGET_MAKE_ENV) \
-	ENV_DIR=$(MENDER_GRUBENV_ENV_DIR)
+	$(TARGET_MAKE_ENV)
 
 MENDER_GRUBENV_DEFINES = \
 	$(or $(call qstrip,$(BR2_PACKAGE_MENDER_GRUBENV_DEFINES)),\
@@ -37,10 +30,12 @@ MENDER_GRUBENV_MODULES_MISSING_PC = \
 	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_PC)),\
 		$(MENDER_GRUBENV_MANDATORY_MODULES))
 
+MENDER_GRUBENV_MAKE_ENV += ENV_DIR=/boot/grub
+
 define MENDER_GRUBENV_INSTALL_I386_CFG
 	mkdir -p $(BINARIES_DIR)/boot-part/grub
-	cp -dpfr $(TARGET_DIR)$(MENDER_GRUBENV_ENV_DIR)/grub.cfg \
-		$(TARGET_DIR)$(MENDER_GRUBENV_ENV_DIR)/mender_grubenv* \
+	cp -dpfr $(TARGET_DIR)/boot/grub/grub.cfg \
+		$(TARGET_DIR)/boot/grub/mender_grubenv* \
 		$(BINARIES_DIR)/boot-part/grub
 endef
 endif # BR2_TARGET_GRUB2_HAS_LEGACY_BOOT
@@ -50,10 +45,12 @@ MENDER_GRUBENV_MODULES_MISSING_EFI = \
 	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI)),\
 		$(MENDER_GRUBENV_MANDATORY_MODULES))
 
+MENDER_GRUBENV_MAKE_ENV += ENV_DIR=/boot/EFI/BOOT
+
 define MENDER_GRUBENV_INSTALL_EFI_CFG
 	mkdir -p $(BINARIES_DIR)/efi-part/EFI/BOOT
-	cp -dpfr $(TARGET_DIR)$(MENDER_GRUBENV_ENV_DIR)/grub.cfg \
-		$(TARGET_DIR)$(MENDER_GRUBENV_ENV_DIR)/mender_grubenv* \
+	cp -dpfr $(TARGET_DIR)/boot/EFI/BOOT/grub.cfg \
+		$(TARGET_DIR)/boot/EFI/BOOT/mender_grubenv* \
 		$(BINARIES_DIR)/efi-part/EFI/BOOT
 endef
 endif # BR2_TARGET_GRUB2_HAS_EFI_BOOT

--===============2210440188998031431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2210440188998031431==--
