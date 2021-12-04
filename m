Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4879C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 17:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B65541BE1;
	Sat,  4 Dec 2021 17:23:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QLUHZZWF3Fky; Sat,  4 Dec 2021 17:23:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 874C0409B7;
	Sat,  4 Dec 2021 17:23:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DAB351BF40B
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 17:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF74583F2C
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 17:23:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OWqMxg1FH2Oq for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 17:23:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A5FA83F23
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 17:23:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id D504D8A594; Sat,  4 Dec 2021 17:18:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 18:04:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8be79fbc53523b4b21ff61a51ffc86475b4b31b5
X-Git-Newrev: 4d5b209384e0fda17882fcefd99e38fd149fe82f
X-Patchwork-Hint: ignore
Message-Id: <20211204171828.D504D8A594@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender-grubenv: fix grub module
 checks
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
Content-Type: multipart/mixed; boundary="===============2775294079372750534=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2775294079372750534==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4d5b209384e0fda17882fcefd99e38fd149fe82f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit b68810e70cbd (boot/grub2: add support to build multiple Grub2
configurations in the same build) broke mender-grubenv by splititng up
BR2_TARGET_GRUB2_BUILTIN_MODULES into two separate symbols, one for
legacy boot and one for EFI boot.

This change causes a systematic build failure now, as the legacy variable
BR2_TARGET_GRUB2_BUILTIN_MODULES is now always empty (during build).

We fix that by supplicating the missing modules to check: one for EFI and
one for legacy boot.

The EFI check is tricky: Indeed, there can be more than one EFI platform
enabled simultaneously; indeed, on x86_64, we can have both the 32-bit
and 64-bit EFI platforms enabled. So the check is inverted, and we check
that no platform is not enabled (yeah, double negation). For consistency,
we do the same for the legacy boot, even though in that case, there can
only ever be only one enabled at once at most.

Furthermore, mender-grubenv does not support multiple installations of
grub concurrently; it can only be installed for either legacy or EFI,
not both at the same time: /etc/mender-grubenv.cfg, its configuration
file, can only contain settings for one or the other, not both.

So we add a new check to Config.in to support only one grub installation
type at a time.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
[yann.morin.1998@free.fr:
  - drop superfluous check on empty modules lists
  - move EFI and legacy commands under same condition as checks
  - variables were renamed
  - misc eye-candy
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Köry Maincent <kory.maincent@bootlin.com>
---
 package/mender-grubenv/Config.in         |  5 +++
 package/mender-grubenv/mender-grubenv.mk | 55 ++++++++++++++++++++------------
 2 files changed, 40 insertions(+), 20 deletions(-)

diff --git a/package/mender-grubenv/Config.in b/package/mender-grubenv/Config.in
index 38da5b84fe..f27eb09e34 100644
--- a/package/mender-grubenv/Config.in
+++ b/package/mender-grubenv/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_MENDER_GRUBENV
 	depends on BR2_TARGET_GRUB2_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_MENDER # runtime
 	depends on BR2_TARGET_GRUB2
+	depends on !(BR2_TARGET_GRUB2_HAS_LEGACY_BOOT && BR2_TARGET_GRUB2_HAS_EFI_BOOT)
 	help
 	  Contains the boot scripts and tools used by Mender to
 	  integrate with the GRUB bootloader.
@@ -34,3 +35,7 @@ comment "mender-grubenv needs a grub2 bootloader"
 	depends on BR2_TARGET_GRUB2_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_MENDER
 	depends on !BR2_TARGET_GRUB2
+
+comment "mender-grubenv does not support both legacy and EFI grub2 bootloaders at the same time"
+	depends on BR2_PACKAGE_MENDER
+	depends on BR2_TARGET_GRUB2_HAS_LEGACY_BOOT && BR2_TARGET_GRUB2_HAS_EFI_BOOT
diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
index d7bdcc99eb..6b8800e1de 100644
--- a/package/mender-grubenv/mender-grubenv.mk
+++ b/package/mender-grubenv/mender-grubenv.mk
@@ -13,7 +13,7 @@ MENDER_GRUBENV_LICENSE_FILES = LICENSE
 MENDER_GRUBENV_DEPENDENCIES = grub2
 MENDER_GRUBENV_INSTALL_IMAGES = YES
 
-ifeq ($(BR2_TARGET_GRUB2_I386_PC)$(BR2_TARGET_GRUB2_ARM_UBOOT),y)
+ifeq ($(BR2_TARGET_GRUB_LEGACY),y)
 MENDER_GRUBENV_ENV_DIR = /boot/grub
 else
 MENDER_GRUBENV_ENV_DIR = /boot/EFI/BOOT
@@ -31,14 +31,41 @@ MENDER_GRUBENV_DEFINES = \
 # These grub modules must be built in for the grub scripts to work properly.
 # Without them, the system will not boot.
 MENDER_GRUBENV_MANDATORY_MODULES = loadenv hashsum echo halt gcry_sha256 test regexp
-MENDER_GRUBENV_MODULES_MISSING = \
-	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES)),\
+
+ifeq ($(BR2_TARGET_GRUB2_HAS_LEGACY_BOOT),y)
+MENDER_GRUBENV_MODULES_MISSING_PC = \
+	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_PC)),\
+		$(MENDER_GRUBENV_MANDATORY_MODULES))
+
+define MENDER_GRUBENV_INSTALL_I386_CFG
+	mkdir -p $(BINARIES_DIR)/boot-part/grub
+	cp -dpfr $(TARGET_DIR)$(MENDER_GRUBENV_ENV_DIR)/grub.cfg \
+		$(TARGET_DIR)$(MENDER_GRUBENV_ENV_DIR)/mender_grubenv* \
+		$(BINARIES_DIR)/boot-part/grub
+endef
+endif # BR2_TARGET_GRUB2_HAS_LEGACY_BOOT
+
+ifeq ($(BR2_TARGET_GRUB2_HAS_EFI_BOOT),y)
+MENDER_GRUBENV_MODULES_MISSING_EFI = \
+	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI)),\
 		$(MENDER_GRUBENV_MANDATORY_MODULES))
 
+define MENDER_GRUBENV_INSTALL_EFI_CFG
+	mkdir -p $(BINARIES_DIR)/efi-part/EFI/BOOT
+	cp -dpfr $(TARGET_DIR)$(MENDER_GRUBENV_ENV_DIR)/grub.cfg \
+		$(TARGET_DIR)$(MENDER_GRUBENV_ENV_DIR)/mender_grubenv* \
+		$(BINARIES_DIR)/efi-part/EFI/BOOT
+endef
+endif # BR2_TARGET_GRUB2_HAS_EFI_BOOT
+
 ifeq ($(BR2_PACKAGE_MENDER_GRUBENV)$(BR_BUILDING),yy)
-ifneq ($(MENDER_GRUBENV_MODULES_MISSING),)
-$(error The following missing grub2 modules must be enabled for mender-grubenv \
-	to work: $(MENDER_GRUBENV_MODULES_MISSING))
+ifneq ($(MENDER_GRUBENV_MODULES_MISSING_EFI),)
+$(error The following missing grub2 efi modules must be enabled for mender-grubenv \
+	to work: $(MENDER_GRUBENV_MODULES_MISSING_EFI))
+endif
+ifneq ($(MENDER_GRUBENV_MODULES_MISSING_PC),)
+$(error The following missing grub2 pc modules must be enabled for mender-grubenv \
+	to work: $(MENDER_GRUBENV_MODULES_MISSING_PC))
 endif
 endif
 
@@ -54,21 +81,9 @@ define MENDER_GRUBENV_INSTALL_TARGET_CMDS
 	$(MENDER_GRUBENV_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
-# Overwrite the default grub2 config files with the ones in this package.
-ifeq ($(BR2_TARGET_GRUB2_I386_PC)$(BR2_TARGET_GRUB2_ARM_UBOOT),y)
-define MENDER_GRUBENV_INSTALL_IMAGES_CMDS
-	mkdir -p $(BINARIES_DIR)/boot-part/grub
-	cp -dpfr $(TARGET_DIR)/boot/grub/grub.cfg \
-		$(TARGET_DIR)/boot/grub/mender_grubenv* \
-		$(BINARIES_DIR)/boot-part/grub
-endef
-else
 define MENDER_GRUBENV_INSTALL_IMAGES_CMDS
-	mkdir -p $(BINARIES_DIR)/efi-part/EFI/BOOT
-	cp -dpfr $(TARGET_DIR)/boot/EFI/BOOT/grub.cfg \
-		$(TARGET_DIR)/boot/EFI/BOOT/mender_grubenv* \
-		$(BINARIES_DIR)/efi-part/EFI/BOOT
+	$(MENDER_GRUBENV_INSTALL_I386_CFG)
+	$(MENDER_GRUBENV_INSTALL_EFI_CFG)
 endef
-endif
 
 $(eval $(generic-package))

--===============2775294079372750534==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2775294079372750534==--
