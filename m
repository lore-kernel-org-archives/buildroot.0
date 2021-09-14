Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C672C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 09:36:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF67960F26
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 09:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF67960F26
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B4D24032F;
	Tue, 14 Sep 2021 09:36:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OKIhTJzCGCFu; Tue, 14 Sep 2021 09:36:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B0C44033D;
	Tue, 14 Sep 2021 09:36:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B1D91BF3EB
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 09:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 093F580D76
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 09:35:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ubi33OHBoSPC for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 09:35:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 724B280D71
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 09:35:01 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 9DA52FF809;
 Tue, 14 Sep 2021 09:34:58 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 11:34:50 +0200
Message-Id: <20210914093457.1389174-2-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914093457.1389174-1-kory.maincent@bootlin.com>
References: <20210914093457.1389174-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/8] boot/grub2: add support to build multiple
 Grub2 configurations in the same build
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

When Grub2 is build it is configured only for one boot set-up, BIOS Legacy,
EFI 32 bit or EFI 64 bit. It can not deal with several boot set-up on the
same image.

This patch allows to build Grub2 for different configurations simultaneously.
We use a GRUB2_TUPLES list to describe all the configurations selected.
For each boot case described in the GRUB2_TUPLES list, it configures and
builds Grub2 in a separate folder named build-$(tuple).
We use a foreach loop to make actions on each tuple selected.

We have to separate the BR2_TARGET_GRUB2_BUILTIN_MODULES and the
BR2_TARGET_GRUB2_BUILTIN_CONFIG for each BIOS or EFI boot cases.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 Config.in.legacy                         |  16 +++
 boot/grub2/Config.in                     |  40 ++++--
 boot/grub2/grub2.mk                      | 165 +++++++++++++----------
 support/testing/tests/fs/test_iso9660.py |   9 +-
 4 files changed, 146 insertions(+), 84 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a0c1a6898f..519cb830b6 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,22 @@ endif
 
 ###############################################################################
 
+config BR2_TARGET_GRUB2_BUILTIN_MODULES
+	bool "the grub2 builtin modules has been renamed"
+	select BR2_LEGACY
+	help
+	  This option has been split to separate the builtin modules
+	  between BR2_TARGET_GRUB2_BUILTIN_MODULES_PC and
+	  BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI.
+
+config BR2_TARGET_GRUB2_BUILTIN_CONFIG
+	bool "the grub2 builtin configuration has been renamed"
+	select BR2_LEGACY
+	help
+	  This option has been split to separate the builtin configuration
+	  between BR2_TARGET_GRUB2_BUILTIN_CONFIG_PC and
+	  BR2_TARGET_GRUB2_BUILTIN_CONFIG_EFI.
+
 comment "Legacy options removed in 2021.05"
 
 config BR2_PACKAGE_UDISKS_LVM2
diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index e45133999e..79046b9c7f 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -27,9 +27,6 @@ config BR2_TARGET_GRUB2
 
 if BR2_TARGET_GRUB2
 
-choice
-	prompt "Platform"
-
 config BR2_TARGET_GRUB2_I386_PC
 	bool "i386-pc"
 	depends on BR2_i386 || BR2_x86_64
@@ -76,10 +73,10 @@ config BR2_TARGET_GRUB2_ARM64_EFI
 	  Aarch64 platform and you want to boot Grub 2 as an EFI
 	  application.
 
-endchoice
-
 if BR2_TARGET_GRUB2_I386_PC || BR2_TARGET_GRUB2_ARM_UBOOT
 
+comment "Options for the x86 legacy BIOS or ARM U-Boot support"
+
 config BR2_TARGET_GRUB2_BOOT_PARTITION
 	string "boot partition"
 	default "hd0,msdos1"
@@ -89,24 +86,43 @@ config BR2_TARGET_GRUB2_BOOT_PARTITION
 	  first disk if using a legacy partition table, or 'hd0,gpt1'
 	  if using GPT partition table.
 
-endif # BR2_TARGET_GRUB2_I386_PC || BR2_TARGET_GRUB2_ARM_UBOOT
-
-config BR2_TARGET_GRUB2_BUILTIN_MODULES
+config BR2_TARGET_GRUB2_BUILTIN_MODULES_PC
 	string "builtin modules"
 	default "boot linux ext2 fat squash4 part_msdos part_gpt normal biosdisk" if BR2_TARGET_GRUB2_I386_PC
-	default "boot linux ext2 fat squash4 part_msdos part_gpt normal efi_gop" \
-		if BR2_TARGET_GRUB2_I386_EFI || BR2_TARGET_GRUB2_X86_64_EFI || \
-		   BR2_TARGET_GRUB2_ARM_EFI  || BR2_TARGET_GRUB2_ARM64_EFI
 	default "linux ext2 fat part_msdos normal" if BR2_TARGET_GRUB2_ARM_UBOOT
+	default BR2_TARGET_GRUB2_BUILTIN_MODULES if BR2_TARGET_GRUB2_BUILTIN_MODULES != "" # legacy
+
+config BR2_TARGET_GRUB2_BUILTIN_CONFIG_PC
+	string "builtin config"
+	default BR2_TARGET_GRUB2_BUILTIN_CONFIG if BR2_TARGET_GRUB2_BUILTIN_CONFIG != "" # legacy
+	help
+	  Path to a Grub 2 configuration file that will be embedded
+	  into the Grub image itself. This allows to set the root
+	  device and other configuration parameters, but however menu
+	  entries cannot be described in this embedded configuration.
+
+endif # BR2_TARGET_GRUB2_I386_PC || BR2_TARGET_GRUB2_ARM_UBOOT
+
+if BR2_TARGET_GRUB2_I386_EFI || BR2_TARGET_GRUB2_X86_64_EFI || \
+	BR2_TARGET_GRUB2_ARM_EFI  || BR2_TARGET_GRUB2_ARM64_EFI
+
+comment "Options for the EFI BIOS or ARM EFI support"
+
+config BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI
+	string "builtin modules"
+	default "boot linux ext2 fat squash4 part_msdos part_gpt normal efi_gop"
+	default BR2_TARGET_GRUB2_BUILTIN_MODULES if BR2_TARGET_GRUB2_BUILTIN_MODULES != "" # legacy
 
-config BR2_TARGET_GRUB2_BUILTIN_CONFIG
+config BR2_TARGET_GRUB2_BUILTIN_CONFIG_EFI
 	string "builtin config"
+	default BR2_TARGET_GRUB2_BUILTIN_CONFIG if BR2_TARGET_GRUB2_BUILTIN_CONFIG != "" # legacy
 	help
 	  Path to a Grub 2 configuration file that will be embedded
 	  into the Grub image itself. This allows to set the root
 	  device and other configuration parameters, but however menu
 	  entries cannot be described in this embedded configuration.
 
+endif
 config BR2_TARGET_GRUB2_INSTALL_TOOLS
 	bool "install tools"
 	help
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 52e9199ae9..04eadd5dc3 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -57,52 +57,65 @@ GRUB2_INSTALL_TARGET = NO
 endif
 GRUB2_CPE_ID_VENDOR = gnu
 
-GRUB2_BUILTIN_MODULES = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES))
-GRUB2_BUILTIN_CONFIG = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_CONFIG))
+GRUB2_BUILTIN_MODULES_PC = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_PC))
+GRUB2_BUILTIN_MODULES_EFI = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI))
+GRUB2_BUILTIN_CONFIG_PC = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_CONFIG_PC))
+GRUB2_BUILTIN_CONFIG_EFI = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_CONFIG_EFI))
 GRUB2_BOOT_PARTITION = $(call qstrip,$(BR2_TARGET_GRUB2_BOOT_PARTITION))
 
 ifeq ($(BR2_TARGET_GRUB2_I386_PC),y)
-GRUB2_IMAGE = $(BINARIES_DIR)/grub.img
-GRUB2_CFG = $(TARGET_DIR)/boot/grub/grub.cfg
-GRUB2_PREFIX = ($(GRUB2_BOOT_PARTITION))/boot/grub
-GRUB2_TUPLE = i386-pc
-GRUB2_TARGET = i386
-GRUB2_PLATFORM = pc
-else ifeq ($(BR2_TARGET_GRUB2_I386_EFI),y)
-GRUB2_IMAGE = $(BINARIES_DIR)/efi-part/EFI/BOOT/bootia32.efi
-GRUB2_CFG = $(BINARIES_DIR)/efi-part/EFI/BOOT/grub.cfg
-GRUB2_PREFIX = /EFI/BOOT
-GRUB2_TUPLE = i386-efi
-GRUB2_TARGET = i386
-GRUB2_PLATFORM = efi
-else ifeq ($(BR2_TARGET_GRUB2_X86_64_EFI),y)
-GRUB2_IMAGE = $(BINARIES_DIR)/efi-part/EFI/BOOT/bootx64.efi
-GRUB2_CFG = $(BINARIES_DIR)/efi-part/EFI/BOOT/grub.cfg
-GRUB2_PREFIX = /EFI/BOOT
-GRUB2_TUPLE = x86_64-efi
-GRUB2_TARGET = x86_64
-GRUB2_PLATFORM = efi
-else ifeq ($(BR2_TARGET_GRUB2_ARM_UBOOT),y)
-GRUB2_IMAGE = $(BINARIES_DIR)/boot-part/grub/grub.img
-GRUB2_CFG = $(BINARIES_DIR)/boot-part/grub/grub.cfg
-GRUB2_PREFIX = ($(GRUB2_BOOT_PARTITION))/boot/grub
-GRUB2_TUPLE = arm-uboot
-GRUB2_TARGET = arm
-GRUB2_PLATFORM = uboot
-else ifeq ($(BR2_TARGET_GRUB2_ARM_EFI),y)
-GRUB2_IMAGE = $(BINARIES_DIR)/efi-part/EFI/BOOT/bootarm.efi
-GRUB2_CFG = $(BINARIES_DIR)/efi-part/EFI/BOOT/grub.cfg
-GRUB2_PREFIX = /EFI/BOOT
-GRUB2_TUPLE = arm-efi
-GRUB2_TARGET = arm
-GRUB2_PLATFORM = efi
-else ifeq ($(BR2_TARGET_GRUB2_ARM64_EFI),y)
-GRUB2_IMAGE = $(BINARIES_DIR)/efi-part/EFI/BOOT/bootaa64.efi
-GRUB2_CFG = $(BINARIES_DIR)/efi-part/EFI/BOOT/grub.cfg
-GRUB2_PREFIX = /EFI/BOOT
-GRUB2_TUPLE = arm64-efi
-GRUB2_TARGET = aarch64
-GRUB2_PLATFORM = efi
+GRUB2_I386_PC_IMAGE = $(BINARIES_DIR)/grub.img
+GRUB2_I386_PC_CFG = $(TARGET_DIR)/boot/grub/grub.cfg
+GRUB2_I386_PC_PREFIX = ($(GRUB2_BOOT_PARTITION))/boot/grub
+GRUB2_I386_PC_TARGET = i386
+GRUB2_I386_PC_PLATFORM = pc
+GRUB2_I386_PC_BUILTIN = PC
+GRUB2_TUPLES += i386-pc
+endif
+ifeq ($(BR2_TARGET_GRUB2_I386_EFI),y)
+GRUB2_I386_EFI_IMAGE = $(BINARIES_DIR)/efi-part/EFI/BOOT/bootia32.efi
+GRUB2_I386_EFI_CFG = $(BINARIES_DIR)/efi-part/EFI/BOOT/grub.cfg
+GRUB2_I386_EFI_PREFIX = /EFI/BOOT
+GRUB2_I386_EFI_TARGET = i386
+GRUB2_I386_EFI_PLATFORM = efi
+GRUB2_I386_EFI_BUILTIN = EFI
+GRUB2_TUPLES += i386-efi
+endif
+ifeq ($(BR2_TARGET_GRUB2_X86_64_EFI),y)
+GRUB2_X86_64_EFI_IMAGE = $(BINARIES_DIR)/efi-part/EFI/BOOT/bootx64.efi
+GRUB2_X86_64_EFI_CFG = $(BINARIES_DIR)/efi-part/EFI/BOOT/grub.cfg
+GRUB2_X86_64_EFI_PREFIX = /EFI/BOOT
+GRUB2_X86_64_EFI_TARGET = x86_64
+GRUB2_X86_64_EFI_PLATFORM = efi
+GRUB2_X86_64_EFI_BUILTIN = EFI
+GRUB2_TUPLES += x86_64-efi
+endif
+ifeq ($(BR2_TARGET_GRUB2_ARM_UBOOT),y)
+GRUB2_ARM_UBOOT_IMAGE = $(BINARIES_DIR)/boot-part/grub/grub.img
+GRUB2_ARM_UBOOT_CFG = $(BINARIES_DIR)/boot-part/grub/grub.cfg
+GRUB2_ARM_UBOOT_PREFIX = ($(GRUB2_BOOT_PARTITION))/boot/grub
+GRUB2_ARM_UBOOT_TARGET = arm
+GRUB2_ARM_UBOOT_PLATFORM = uboot
+GRUB2_ARM_UBOOT_BUILTIN = PC
+GRUB2_TUPLES += arm-uboot
+endif
+ifeq ($(BR2_TARGET_GRUB2_ARM_EFI),y)
+GRUB2_ARM_EFI_IMAGE = $(BINARIES_DIR)/efi-part/EFI/BOOT/bootarm.efi
+GRUB2_ARM_EFI_CFG = $(BINARIES_DIR)/efi-part/EFI/BOOT/grub.cfg
+GRUB2_ARM_EFI_PREFIX = /EFI/BOOT
+GRUB2_ARM_EFI_TARGET = arm
+GRUB2_ARM_EFI_PLATFORM = efi
+GRUB2_ARM_EFI_BUILTIN = EFI
+GRUB2_TUPLES += arm-efi
+endif
+ifeq ($(BR2_TARGET_GRUB2_ARM64_EFI),y)
+GRUB2_ARM64_EFI_IMAGE = $(BINARIES_DIR)/efi-part/EFI/BOOT/bootaa64.efi
+GRUB2_ARM64_EFI_CFG = $(BINARIES_DIR)/efi-part/EFI/BOOT/grub.cfg
+GRUB2_ARM64_EFI_PREFIX = /EFI/BOOT
+GRUB2_ARM64_EFI_TARGET = aarch64
+GRUB2_ARM64_EFI_PLATFORM = efi
+GRUB2_ARM64_EFI_BUILTIN = EFI
+GRUB2_TUPLES += arm64-efi
 endif
 
 # Grub2 is kind of special: it considers CC, LD and so on to be the
@@ -128,8 +141,10 @@ GRUB2_CONF_ENV = \
 	TARGET_STRIP="$(TARGET_CROSS)strip"
 
 GRUB2_CONF_OPTS = \
-	--target=$(GRUB2_TARGET) \
-	--with-platform=$(GRUB2_PLATFORM) \
+	--host=$(GNU_TARGET_NAME) \
+	--build=$(GNU_HOST_NAME) \
+	--target=$(GRUB2_$(call UPPERCASE,$(tuple))_TARGET) \
+	--with-platform=$(GRUB2_$(call UPPERCASE,$(tuple))_PLATFORM) \
 	--prefix=/ \
 	--exec-prefix=/ \
 	--disable-grub-mkfont \
@@ -147,34 +162,46 @@ HOST_GRUB2_CONF_OPTS = \
 	--enable-libzfs=no \
 	--disable-werror
 
-ifeq ($(BR2_TARGET_GRUB2_I386_PC),y)
-define GRUB2_IMAGE_INSTALL_ELTORITO
-	cat $(HOST_DIR)/lib/grub/$(GRUB2_TUPLE)/cdboot.img $(GRUB2_IMAGE) > \
-		$(BINARIES_DIR)/grub-eltorito.img
+define GRUB2_CONFIGURE_CMDS
+	$(foreach tuple, $(GRUB2_TUPLES), \
+		mkdir -p $(@D)/build-$(tuple) ; \
+		cd $(@D)/build-$(tuple) ; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		$(GRUB2_CONF_ENV) \
+		../configure \
+			$(GRUB2_CONF_OPTS)
+	)
 endef
-endif
 
-define GRUB2_INSTALL_IMAGES_CMDS
-	mkdir -p $(dir $(GRUB2_IMAGE))
-	$(HOST_DIR)/usr/bin/grub-mkimage \
-		-d $(@D)/grub-core/ \
-		-O $(GRUB2_TUPLE) \
-		-o $(GRUB2_IMAGE) \
-		-p "$(GRUB2_PREFIX)" \
-		$(if $(GRUB2_BUILTIN_CONFIG),-c $(GRUB2_BUILTIN_CONFIG)) \
-		$(GRUB2_BUILTIN_MODULES)
-	mkdir -p $(dir $(GRUB2_CFG))
-	$(INSTALL) -D -m 0644 boot/grub2/grub.cfg $(GRUB2_CFG)
-	$(GRUB2_IMAGE_INSTALL_ELTORITO)
+define GRUB2_BUILD_CMDS
+	$(foreach tuple, $(GRUB2_TUPLES), \
+		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/build-$(tuple)
+	)
 endef
 
-ifeq ($(GRUB2_PLATFORM),efi)
-define GRUB2_EFI_STARTUP_NSH
-	echo $(notdir $(GRUB2_IMAGE)) > \
-		$(BINARIES_DIR)/efi-part/startup.nsh
+define GRUB2_INSTALL_IMAGES_CMDS
+	$(foreach tuple, $(GRUB2_TUPLES), \
+		mkdir -p $(dir $(GRUB2_$(call UPPERCASE,$(tuple))_IMAGE)) ; \
+		$(HOST_DIR)/usr/bin/grub-mkimage \
+			-d $(@D)/build-$(tuple)/grub-core/ \
+			-O $(tuple) \
+			-o $(GRUB2_$(call UPPERCASE,$(tuple))_IMAGE) \
+			-p "$(GRUB2_$(call UPPERCASE,$(tuple))_PREFIX)" \
+			$(if $(GRUB2_BUILTIN_CONFIG_$(GRUB2_$(call UPPERCASE,$(tuple))_BUILTIN)), \
+				-c $(GRUB2_BUILTIN_CONFIG_$(GRUB2_$(call UPPERCASE,$(tuple))_BUILTIN))) \
+			$(GRUB2_BUILTIN_MODULES_$(GRUB2_$(call UPPERCASE,$(tuple))_BUILTIN)) ; \
+		$(INSTALL) -D -m 0644 boot/grub2/grub.cfg $(GRUB2_$(call UPPERCASE,$(tuple))_CFG) ; \
+		$(if $(findstring $(GRUB2_$(call UPPERCASE,$(tuple))_PLATFORM), pc), \
+			cat $(HOST_DIR)/lib/grub/$(tuple)/cdboot.img $(GRUB2_$(call UPPERCASE,$(tuple))_IMAGE) > \
+				$(BINARIES_DIR)/grub-eltorito.img, \
+		) \
+		$(if $(findstring $(GRUB2_$(call UPPERCASE,$(tuple))_PLATFORM), efi), \
+			echo $(notdir $(GRUB2_$(call UPPERCASE,$(tuple))_IMAGE)) > \
+				$(BINARIES_DIR)/efi-part/startup.nsh \
+		)
+	)
 endef
-GRUB2_POST_INSTALL_IMAGES_HOOKS += GRUB2_EFI_STARTUP_NSH
-endif
 
-$(eval $(autotools-package))
+$(eval $(generic-package))
 $(eval $(host-autotools-package))
diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
index 68f4840852..fffa49caf3 100644
--- a/support/testing/tests/fs/test_iso9660.py
+++ b/support/testing/tests/fs/test_iso9660.py
@@ -54,7 +54,8 @@ class TestIso9660Grub2External(infra.basetest.BRTest):
         # BR2_TARGET_ROOTFS_ISO9660_INITRD is not set
         BR2_TARGET_GRUB2=y
         BR2_TARGET_GRUB2_BOOT_PARTITION="cd"
-        BR2_TARGET_GRUB2_BUILTIN_MODULES="boot linux ext2 fat part_msdos part_gpt normal biosdisk iso9660"
+        BR2_TARGET_GRUB2_BUILTIN_MODULES_PC="boot linux ext2 fat part_msdos part_gpt normal biosdisk iso9660"
+        BR2_TARGET_GRUB2_BUILTIN_CONFIG_PC=""
         BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
         """.format(infra.filepath("conf/grub2.cfg"))
 
@@ -75,7 +76,8 @@ class TestIso9660Grub2ExternalCompress(infra.basetest.BRTest):
         BR2_TARGET_ROOTFS_ISO9660_TRANSPARENT_COMPRESSION=y
         BR2_TARGET_GRUB2=y
         BR2_TARGET_GRUB2_BOOT_PARTITION="cd"
-        BR2_TARGET_GRUB2_BUILTIN_MODULES="boot linux ext2 fat part_msdos part_gpt normal biosdisk iso9660"
+        BR2_TARGET_GRUB2_BUILTIN_MODULES_PC="boot linux ext2 fat part_msdos part_gpt normal biosdisk iso9660"
+        BR2_TARGET_GRUB2_BUILTIN_CONFIG_PC=""
         BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
         """.format(infra.filepath("conf/grub2.cfg"))
 
@@ -95,7 +97,8 @@ class TestIso9660Grub2Internal(infra.basetest.BRTest):
         BR2_TARGET_ROOTFS_ISO9660_INITRD=y
         BR2_TARGET_GRUB2=y
         BR2_TARGET_GRUB2_BOOT_PARTITION="cd"
-        BR2_TARGET_GRUB2_BUILTIN_MODULES="boot linux ext2 fat part_msdos part_gpt normal biosdisk iso9660"
+        BR2_TARGET_GRUB2_BUILTIN_MODULES_PC="boot linux ext2 fat part_msdos part_gpt normal biosdisk iso9660"
+        BR2_TARGET_GRUB2_BUILTIN_CONFIG_PC=""
         BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
         """.format(infra.filepath("conf/grub2.cfg"))
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
