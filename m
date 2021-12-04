Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6089BC433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 17:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE6E160A72;
	Sat,  4 Dec 2021 17:23:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lhEGb8hmoaWW; Sat,  4 Dec 2021 17:23:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CD9F60A42;
	Sat,  4 Dec 2021 17:23:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C441C1BF40B
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 17:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB3F54019E
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 17:23:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mYcbthQv465j for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 17:23:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8679E40116
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 17:23:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id BF9698A538; Sat,  4 Dec 2021 17:18:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 18:04:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6950e10d9306e4475fd63060b0b14455784f9fdb
X-Git-Newrev: 7a68960b682c06681473f396a4c6d10b77c444fa
X-Patchwork-Hint: ignore
Message-Id: <20211204171828.BF9698A538@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/grub2/Config.in: add symbols to
 represent legacy and EFI boot
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
Content-Type: multipart/mixed; boundary="===============7926494083976349730=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7926494083976349730==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7a68960b682c06681473f396a4c6d10b77c444fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are cases to want a synthetic information whether the legacy BIOS
or U-Boot boot scheme, or the EFI boot scheme, are enabled, without
resorting to testing all and each platforms.

This is already the cae in grub2 itself, for the configuration of the
BIOS/U-Boot boot partition, and builtin modules and configuration on one
hand, and the EFI builtin modules and configuraiton on the other hand.

It is also the case for mender-grubenv, which will want to know if
either or both are enabled, but without having to resort to testing all
the cases.

Add two new symbols, that each represent those conditions:
  * BR2_TARGET_GRUB2_HAS_LEGACY_BOOT
  * BR2_TARGET_GRUB2_HAS_EFI_BOOT

Each target selects the appropriate bool, which makes it much more
simple for other packages such as mender-grubenv to check if grub legacy
or EFI is selected.

And of course, we also make use of those symbols in grub2 itself, to
simplify the conditions for showing.hiding legacy and EFI options.

Additionally (but that does not merit being in its own patch), add a
comment on the closing 'endif' for the EFI part.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
[yann.morin.1998@free.fr:
  - s/BR2_TARGET_GRUB_/BR2_TARGET_GRUB2_/
  - rename variables anyway
  - use variables in grub2 itself
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Köry Maincent <kory.maincent@bootlin.com>
---
 boot/grub2/Config.in | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index 7bbe697932..92b5dd501b 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -34,12 +34,19 @@ config BR2_TARGET_GRUB2
 
 if BR2_TARGET_GRUB2
 
+config BR2_TARGET_GRUB2_HAS_LEGACY_BOOT
+	bool
+
+config BR2_TARGET_GRUB2_HAS_EFI_BOOT
+	bool
+
 config BR2_TARGET_GRUB2_HAS_PTF
 	bool
 
 config BR2_TARGET_GRUB2_I386_PC
 	bool "i386-pc"
 	depends on BR2_i386 || BR2_x86_64
+	select BR2_TARGET_GRUB2_HAS_LEGACY_BOOT
 	help
 	  Select this option if the platform you're targetting is a
 	  x86 or x86-64 legacy BIOS based platform.
@@ -48,6 +55,7 @@ config BR2_TARGET_GRUB2_I386_EFI
 	bool "i386-efi"
 	depends on BR2_i386 || BR2_x86_64
 	select BR2_TARGET_GRUB2_HAS_PTF
+	select BR2_TARGET_GRUB2_HAS_EFI_BOOT
 	help
 	  Select this option if the platform you're targetting has a
 	  32 bits EFI BIOS. Note that some x86-64 platforms use a 32
@@ -57,6 +65,7 @@ config BR2_TARGET_GRUB2_X86_64_EFI
 	bool "x86-64-efi"
 	depends on BR2_x86_64
 	select BR2_TARGET_GRUB2_HAS_PTF
+	select BR2_TARGET_GRUB2_HAS_EFI_BOOT
 	help
 	  Select this option if the platform you're targetting has a
 	  64 bits EFI BIOS.
@@ -64,6 +73,7 @@ config BR2_TARGET_GRUB2_X86_64_EFI
 config BR2_TARGET_GRUB2_ARM_UBOOT
 	bool "arm-uboot"
 	depends on BR2_arm
+	select BR2_TARGET_GRUB2_HAS_LEGACY_BOOT
 	help
 	  Select this option if the platform you're targetting is an
 	  ARM u-boot platform, and you want to boot Grub 2 as an u-boot
@@ -73,6 +83,7 @@ config BR2_TARGET_GRUB2_ARM_EFI
 	bool "arm-efi"
 	depends on BR2_arm
 	select BR2_TARGET_GRUB2_HAS_PTF
+	select BR2_TARGET_GRUB2_HAS_EFI_BOOT
 	help
 	  Select this option if the platform you're targetting is an
 	  ARM platform and you want to boot Grub 2 as an EFI
@@ -81,12 +92,13 @@ config BR2_TARGET_GRUB2_ARM_EFI
 config BR2_TARGET_GRUB2_ARM64_EFI
 	bool "arm64-efi"
 	depends on BR2_aarch64
+	select BR2_TARGET_GRUB2_HAS_EFI_BOOT
 	help
 	  Select this option if the platform you're targetting is an
 	  Aarch64 platform and you want to boot Grub 2 as an EFI
 	  application.
 
-if BR2_TARGET_GRUB2_I386_PC || BR2_TARGET_GRUB2_ARM_UBOOT
+if BR2_TARGET_GRUB2_HAS_LEGACY_BOOT
 
 comment "Options for the x86 legacy BIOS or ARM U-Boot support"
 
@@ -114,10 +126,9 @@ config BR2_TARGET_GRUB2_BUILTIN_CONFIG_PC
 	  device and other configuration parameters, but however menu
 	  entries cannot be described in this embedded configuration.
 
-endif # BR2_TARGET_GRUB2_I386_PC || BR2_TARGET_GRUB2_ARM_UBOOT
+endif # BR2_TARGET_GRUB2_HAS_LEGACY_BOOT
 
-if BR2_TARGET_GRUB2_I386_EFI || BR2_TARGET_GRUB2_X86_64_EFI || \
-	BR2_TARGET_GRUB2_ARM_EFI  || BR2_TARGET_GRUB2_ARM64_EFI
+if BR2_TARGET_GRUB2_HAS_EFI_BOOT
 
 comment "Options for the EFI BIOS or ARM EFI support"
 
@@ -135,7 +146,8 @@ config BR2_TARGET_GRUB2_BUILTIN_CONFIG_EFI
 	  device and other configuration parameters, but however menu
 	  entries cannot be described in this embedded configuration.
 
-endif
+endif # BR2_TARGET_GRUB2_HAS_EFI_BOOT
+
 config BR2_TARGET_GRUB2_INSTALL_TOOLS
 	bool "install tools"
 	help

--===============7926494083976349730==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7926494083976349730==--
