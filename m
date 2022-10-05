Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E476C433FE
	for <buildroot@archiver.kernel.org>; Wed,  5 Oct 2022 21:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCB6D409E2;
	Wed,  5 Oct 2022 21:22:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCB6D409E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kw9OyaOmOO0p; Wed,  5 Oct 2022 21:22:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C3DE4098E;
	Wed,  5 Oct 2022 21:22:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C3DE4098E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 29BE11BF301
 for <buildroot@lists.busybox.net>; Wed,  5 Oct 2022 21:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0598083145
 for <buildroot@lists.busybox.net>; Wed,  5 Oct 2022 21:22:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0598083145
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iKerQeU969bo for <buildroot@lists.busybox.net>;
 Wed,  5 Oct 2022 21:22:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55B2882B1B
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55B2882B1B
 for <buildroot@buildroot.org>; Wed,  5 Oct 2022 21:22:03 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 p3-20020a17090a284300b0020a85fa3ffcso2479977pjf.2
 for <buildroot@buildroot.org>; Wed, 05 Oct 2022 14:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KqGv6Rf5kUuA0GKfG59qxF7JB7yf0ZI/0h3Rd8Avmtg=;
 b=DwTjak4iuEzHCurSrdAtziOS5LceCWg9wj2x/UN9WbUYdQDWhAM+owiUY/bdpZOS+x
 xagXiCwNhIplIpkkgoYl9xwDekMYHuUbpYWm3hYhjKI5FJggrhC6uAzoHe2Cs1xjmlWe
 6nM6Lcx+72AW+rVdYIwflhNld9ILdc11F+BucfA+SztqmzsiqtUcnRTftIt1r2VQqYDU
 3ibFYrGd0hEmwfgVMXVHrPaup8/SYUub+pbv2Nm0UEol/3lFfpFlV3RzLdQ45F+CFuBH
 2DmS1Vq+tl10kuLMv1FNOKJ4CAfKdJMXgYrlGsDWURSIVx1af/Dl+elpdBF2+stWdkBm
 G4Gw==
X-Gm-Message-State: ACrzQf1kpchOkulrvnGIC4NXuanEYUQLpiQOk5TnEjfq1BD5CFABJ+sP
 LVGqV4w7M+F8ghAmRM67NEyT7P3mqHFYQg==
X-Google-Smtp-Source: AMsMyM7HWqzn7uaq0/8GXTryHvSXVIaBWd+p6w1utY0UOWdSOqcE/MkXBXCgCOPHZMj4nElbguPw6Q==
X-Received: by 2002:a17:902:82ca:b0:17b:6eaa:5da3 with SMTP id
 u10-20020a17090282ca00b0017b6eaa5da3mr1542365plz.33.1665004922276; 
 Wed, 05 Oct 2022 14:22:02 -0700 (PDT)
Received: from adam-workstation.. ([47.153.94.144])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a170903018c00b00172e19c2fa9sm11003033plg.9.2022.10.05.14.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 14:22:01 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  5 Oct 2022 14:21:50 -0700
Message-Id: <20221005212150.1384370-4-aduskett@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221005212150.1384370-1-aduskett@gmail.com>
References: <20221005212150.1384370-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KqGv6Rf5kUuA0GKfG59qxF7JB7yf0ZI/0h3Rd8Avmtg=;
 b=SaaZFktf02TtetI3jb7tlUsg93pECjKdCvXtZpEOqXZYiSL5KIRWi9zbeqvceCu/43
 d6JZCsw2q/AQhKQ+HlLslzMgrKNviExeKpopEL9Kt3k4lJzAcw1zzlwDBOspUhEEjeuP
 NSs+XCR3UDZcWJqmvGCmreW2lluiIJcNHvhoSLzrNpfm8wAWrYkwPWergw7mcRUhETx8
 R17W+zS2muYLsr3YbQJAXi/+bjcBZ+46eqiOCeiMfV1GDj/YSyWw/UgqtvbrkB/FL+P0
 O7+n5kHsOA7BmvqxnlTAxSwekmzJAIaIMlHGYNOsbDYtXJIbb+R+l7p1tak1gmjLEhAX
 ytew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SaaZFktf
Subject: [Buildroot] [PATCH 4/4] package/mender-grubenv: bump version to
 2ac898f5924d5870f8394ad8ecd3ef1ab1422e3b
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

mender-grubenv no longer uses the mender_grubenv* directories, instead opting
to put the mender_grubenv directories in a grub-mender-grubenv top-level
directory. While there is a legacy install mode which keeps the two separate
directories, it is better to move forward and rip the bandaid off before it
becomes too painful to update in the future if the legacy option is removed
entirely.

- Update the license file sha256 sum due to a year change.

- mender-grubenv no longer installs grub.cfg, so mender_grub.cfg must be copied
  manually to grub.cfg.

- BOOT_DIR replaces ENV_DIR in the Makefile.

- The sleep grub2 module is now a requirement.

- /etc/mender_grubenv.config file must be present on the system for the
  grub-mender-grubenv-{print,set} scripts to work properly.

In addition to the above changes, update the mender example board file to work
with the updated mender-grubenv version.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 board/mender/x86_64/genimage-efi.cfg       |  3 +++
 configs/mender_x86_64_efi_defconfig        |  2 +-
 package/mender-grubenv/mender-grubenv.hash |  4 ++--
 package/mender-grubenv/mender-grubenv.mk   | 22 +++++++++++++++-------
 4 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/board/mender/x86_64/genimage-efi.cfg b/board/mender/x86_64/genimage-efi.cfg
index 10cefe2380..4ed064c498 100644
--- a/board/mender/x86_64/genimage-efi.cfg
+++ b/board/mender/x86_64/genimage-efi.cfg
@@ -3,6 +3,9 @@ image efi-part.vfat {
 		file EFI {
 			image = "efi-part/EFI"
 		}
+		file grub-mender-grubenv {
+		  image = "efi-part/grub-mender-grubenv"
+		}
 		file bzImage {
 			image = "bzImage"
 		}
diff --git a/configs/mender_x86_64_efi_defconfig b/configs/mender_x86_64_efi_defconfig
index 6919a60c90..02081035ff 100644
--- a/configs/mender_x86_64_efi_defconfig
+++ b/configs/mender_x86_64_efi_defconfig
@@ -19,7 +19,7 @@ BR2_PACKAGE_HOST_MTOOLS=y
 BR2_TARGET_GRUB2=y
 BR2_TARGET_GRUB2_X86_64_EFI=y
 # Add mandatory modules from MENDER_GRUBENV_MANDATORY_MODULES
-BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI="boot linux ext2 fat squash4 part_msdos part_gpt normal efi_gop loadenv hashsum echo halt gcry_sha256 test regexp"
+BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI="boot linux ext2 fat squash4 part_msdos part_gpt normal efi_gop loadenv hashsum echo halt gcry_sha256 test regexp sleep"
 BR2_TARGET_GRUB2_INSTALL_TOOLS=y
 
 # Required tools to create a mender image
diff --git a/package/mender-grubenv/mender-grubenv.hash b/package/mender-grubenv/mender-grubenv.hash
index 3be5f51a9e..193bff073b 100644
--- a/package/mender-grubenv/mender-grubenv.hash
+++ b/package/mender-grubenv/mender-grubenv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  00a574d2bed8d54ba6739700da789a420a02de900df56dd2cfbe0df460a98dca  mender-grubenv-1a7db967495bbe8be53b7a69dcb42822f39d9a74.tar.gz
-sha256  b4acfcfa2a0ba1a8c82ec3965fbcee886cff8394ca4214e0ddac0a36beb1e05a  LICENSE
+sha256  b7a08eb3d996afb38c1a4f7c51b7eb44aec6197ff713ce75e4f39d5b448cfc82  mender-grubenv-2ac898f5924d5870f8394ad8ecd3ef1ab1422e3b.tar.gz
+sha256  1033348db7606a7e61b6484f293847cf8d7a35766efebb97e304d4bd5d7f3f6b  LICENSE
diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
index 9d5be8d8f4..8679ad9236 100644
--- a/package/mender-grubenv/mender-grubenv.mk
+++ b/package/mender-grubenv/mender-grubenv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_GRUBENV_VERSION = 1a7db967495bbe8be53b7a69dcb42822f39d9a74
+MENDER_GRUBENV_VERSION = 2ac898f5924d5870f8394ad8ecd3ef1ab1422e3b
 MENDER_GRUBENV_SITE = $(call github,mendersoftware,grub-mender-grubenv,$(MENDER_GRUBENV_VERSION))
 MENDER_GRUBENV_LICENSE = Apache-2.0
 MENDER_GRUBENV_LICENSE_FILES = LICENSE
@@ -30,13 +30,15 @@ MENDER_GRUBENV_MODULES_MISSING_PC = \
 	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_PC)),\
 		$(MENDER_GRUBENV_MANDATORY_MODULES))
 
-MENDER_GRUBENV_MAKE_ENV += ENV_DIR=/boot/grub
+MENDER_GRUBENV_MAKE_ENV += BOOT_DIR=/boot/grub
 
 define MENDER_GRUBENV_INSTALL_I386_CFG
 	mkdir -p $(BINARIES_DIR)/boot-part/grub
+	cp -dpfr $(@D)/mender_grub.cfg \
+		$(TARGET_DIR)/boot/grub/grub.cfg
 	cp -dpfr $(TARGET_DIR)/boot/grub/grub.cfg \
-		$(TARGET_DIR)/boot/grub/mender_grubenv* \
-		$(BINARIES_DIR)/boot-part/grub
+		$(TARGET_DIR)/boot/grub/grub-mender-grubenv \
+		$(BINARIES_DIR)/boot-part/
 endef
 endif # BR2_TARGET_GRUB2_HAS_LEGACY_BOOT
 
@@ -45,13 +47,16 @@ MENDER_GRUBENV_MODULES_MISSING_EFI = \
 	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI)),\
 		$(MENDER_GRUBENV_MANDATORY_MODULES))
 
-MENDER_GRUBENV_MAKE_ENV += ENV_DIR=/boot/EFI/BOOT
+MENDER_GRUBENV_MAKE_ENV += BOOT_DIR=/boot/EFI/BOOT
 
 define MENDER_GRUBENV_INSTALL_EFI_CFG
 	mkdir -p $(BINARIES_DIR)/efi-part/EFI/BOOT
+	cp -dpfr $(@D)/mender_grub.cfg \
+		$(TARGET_DIR)/boot/EFI/BOOT/grub.cfg
 	cp -dpfr $(TARGET_DIR)/boot/EFI/BOOT/grub.cfg \
-		$(TARGET_DIR)/boot/EFI/BOOT/mender_grubenv* \
 		$(BINARIES_DIR)/efi-part/EFI/BOOT
+	cp -dpfr $(TARGET_DIR)/boot/EFI/BOOT/grub-mender-grubenv \
+		$(BINARIES_DIR)/efi-part/
 endef
 endif # BR2_TARGET_GRUB2_HAS_EFI_BOOT
 
@@ -75,7 +80,10 @@ define MENDER_GRUBENV_BUILD_CMDS
 endef
 
 define MENDER_GRUBENV_INSTALL_TARGET_CMDS
-	$(MENDER_GRUBENV_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
+	$(MENDER_GRUBENV_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) \
+		install install-boot-env
+	# The grub-mender-grubenv-* utilities use this file to function.
+	echo 'ENV_DIR=/boot/grub-mender-grubenv' > $(TARGET_DIR)/etc/mender_grubenv.config
 endef
 
 define MENDER_GRUBENV_INSTALL_IMAGES_CMDS
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
