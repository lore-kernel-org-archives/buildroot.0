Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47AB9C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:28:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAC1F600EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:28:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BAC1F600EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E19040410;
	Mon, 27 Sep 2021 19:28:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yKqTVbhIEyb7; Mon, 27 Sep 2021 19:28:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CB6D4040A;
	Mon, 27 Sep 2021 19:28:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 141CB1BF379
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02BE940173
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:27:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ZGOqdMKmp-6 for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 19:27:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E28A540150
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 19:27:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2BBC08D383; Mon, 27 Sep 2021 19:25:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 21:27:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5141cee10939c56da3741967c128c58eac190222
X-Git-Newrev: 3efb5e31fc05705ce3c46b1f0ec031978a5cfab6
X-Patchwork-Hint: ignore
Message-Id: <20210927192538.2BBC08D383@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board, boot,
 package: remove usage of startup.nsh in EFI partition
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

commit: https://git.buildroot.net/buildroot/commit/?id=3efb5e31fc05705ce3c46b1f0ec031978a5cfab6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The startup.nsh file is useless to boot EFI payloads. We just need to
follow the naming detection specified in the UEFI spec.
The EFI payload need to be placed in the boot/efi folder in the EFI partition
and follow the architecture naming as described below:
32bit : bootia32.efi
x64 : bootx64.efi
aarch32 : bootarm.efi
aarch64 : bootaa64.efi

This naming is already right in the packages involved (systemd, grub2,
gummiboot), therefore we just need to drop the generation of the
startup.nsh file.

The usage of the startup.nsh in genimage is also dropped to avoid errors in
the image generation.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Tested-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/aarch64-efi/genimage-efi.cfg   | 3 ---
 board/intel/galileo/genimage.cfg     | 3 ---
 board/minnowboard/genimage.cfg       | 3 ---
 board/pc/genimage-efi.cfg            | 3 ---
 board/pc/post-build.sh               | 2 +-
 board/qemu/aarch64-sbsa/genimage.cfg | 3 ---
 boot/grub2/grub2.mk                  | 8 --------
 boot/gummiboot/gummiboot.mk          | 2 --
 package/systemd/systemd.mk           | 2 --
 9 files changed, 1 insertion(+), 28 deletions(-)

diff --git a/board/aarch64-efi/genimage-efi.cfg b/board/aarch64-efi/genimage-efi.cfg
index 34cca1d64e..2daa70c361 100644
--- a/board/aarch64-efi/genimage-efi.cfg
+++ b/board/aarch64-efi/genimage-efi.cfg
@@ -1,8 +1,5 @@
 image efi-part.vfat {
   vfat {
-    file startup.nsh {
-      image = "efi-part/startup.nsh"
-    }
     file EFI {
       image = "efi-part/EFI"
     }
diff --git a/board/intel/galileo/genimage.cfg b/board/intel/galileo/genimage.cfg
index 31add21e67..b930c0deb9 100644
--- a/board/intel/galileo/genimage.cfg
+++ b/board/intel/galileo/genimage.cfg
@@ -1,9 +1,6 @@
 # Create an image of the efi partition
 image efi-part.vfat {
 	vfat {
-		file startup.nsh {
-			image = "efi-part/startup.nsh"
-		}
 		file EFI {
 			image = "efi-part/EFI"
 		}
diff --git a/board/minnowboard/genimage.cfg b/board/minnowboard/genimage.cfg
index c5b07179b4..521385aadd 100644
--- a/board/minnowboard/genimage.cfg
+++ b/board/minnowboard/genimage.cfg
@@ -1,9 +1,6 @@
 # Create an image of the efi partition
 image efi-part.vfat {
 	vfat {
-		file startup.nsh {
-			image = "efi-part/startup.nsh"
-		}
 		file EFI {
 			image = "efi-part/EFI"
 		}
diff --git a/board/pc/genimage-efi.cfg b/board/pc/genimage-efi.cfg
index ec7e85b06c..34befb7d69 100644
--- a/board/pc/genimage-efi.cfg
+++ b/board/pc/genimage-efi.cfg
@@ -1,8 +1,5 @@
 image efi-part.vfat {
   vfat {
-    file startup.nsh {
-      image = "efi-part/startup.nsh"
-    }
     file EFI {
       image = "efi-part/EFI"
     }
diff --git a/board/pc/post-build.sh b/board/pc/post-build.sh
index ed37b3b87e..db23795e27 100755
--- a/board/pc/post-build.sh
+++ b/board/pc/post-build.sh
@@ -5,7 +5,7 @@ set -e
 BOARD_DIR=$(dirname "$0")
 
 # Detect boot strategy, EFI or BIOS
-if [ -f "$BINARIES_DIR/efi-part/startup.nsh" ]; then
+if [ -d "$BINARIES_DIR/efi-part/" ]; then
     cp -f "$BOARD_DIR/grub-efi.cfg" "$BINARIES_DIR/efi-part/EFI/BOOT/grub.cfg"
 else
     cp -f "$BOARD_DIR/grub-bios.cfg" "$TARGET_DIR/boot/grub/grub.cfg"
diff --git a/board/qemu/aarch64-sbsa/genimage.cfg b/board/qemu/aarch64-sbsa/genimage.cfg
index 285b308d90..c75d9fcca1 100644
--- a/board/qemu/aarch64-sbsa/genimage.cfg
+++ b/board/qemu/aarch64-sbsa/genimage.cfg
@@ -1,8 +1,5 @@
 image efi-part.vfat {
   vfat {
-    file startup.nsh {
-      image = "efi-part/startup.nsh"
-    }
     file EFI {
       image = "efi-part/EFI"
     }
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 52e9199ae9..ad2edf17aa 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -168,13 +168,5 @@ define GRUB2_INSTALL_IMAGES_CMDS
 	$(GRUB2_IMAGE_INSTALL_ELTORITO)
 endef
 
-ifeq ($(GRUB2_PLATFORM),efi)
-define GRUB2_EFI_STARTUP_NSH
-	echo $(notdir $(GRUB2_IMAGE)) > \
-		$(BINARIES_DIR)/efi-part/startup.nsh
-endef
-GRUB2_POST_INSTALL_IMAGES_HOOKS += GRUB2_EFI_STARTUP_NSH
-endif
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/boot/gummiboot/gummiboot.mk b/boot/gummiboot/gummiboot.mk
index 748e87030e..eb1f3da78c 100644
--- a/boot/gummiboot/gummiboot.mk
+++ b/boot/gummiboot/gummiboot.mk
@@ -32,8 +32,6 @@ GUMMIBOOT_CONF_OPTS = \
 define GUMMIBOOT_INSTALL_IMAGES_CMDS
 	$(INSTALL) -D -m 0644 $(@D)/gummiboot$(GUMMIBOOT_IMGARCH).efi \
 		$(BINARIES_DIR)/efi-part/EFI/BOOT/boot$(GUMMIBOOT_IMGARCH).efi
-	echo "boot$(GUMMIBOOT_IMGARCH).efi" > \
-		$(BINARIES_DIR)/efi-part/startup.nsh
 	$(INSTALL) -D -m 0644 boot/gummiboot/loader.conf \
 		$(BINARIES_DIR)/efi-part/loader/loader.conf
 	$(INSTALL) -D -m 0644 boot/gummiboot/buildroot.conf \
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 5a76f2f246..c403896759 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -514,8 +514,6 @@ SYSTEMD_BOOT_EFI_ARCH = $(call qstrip,$(BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH))
 define SYSTEMD_INSTALL_BOOT_FILES
 	$(INSTALL) -D -m 0644 $(@D)/build/src/boot/efi/systemd-boot$(SYSTEMD_BOOT_EFI_ARCH).efi \
 		$(BINARIES_DIR)/efi-part/EFI/BOOT/boot$(SYSTEMD_BOOT_EFI_ARCH).efi
-	echo "boot$(SYSTEMD_BOOT_EFI_ARCH).efi" > \
-		$(BINARIES_DIR)/efi-part/startup.nsh
 	$(INSTALL) -D -m 0644 $(SYSTEMD_PKGDIR)/boot-files/loader.conf \
 		$(BINARIES_DIR)/efi-part/loader/loader.conf
 	$(INSTALL) -D -m 0644 $(SYSTEMD_PKGDIR)/boot-files/buildroot.conf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
