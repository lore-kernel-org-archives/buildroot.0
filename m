Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E525ECD484A
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 14:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36E0480BFA;
	Wed,  4 Sep 2024 14:25:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kj1z__fS3TzO; Wed,  4 Sep 2024 14:25:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 990C380C60
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 990C380C60;
	Wed,  4 Sep 2024 14:25:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8EEBA1BF267
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 14:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B74740311
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 14:25:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EEMOuAm0n0pr for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 14:25:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::242; helo=mail-lj1-x242.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 516E840308
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 516E840308
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 516E840308
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 14:25:14 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id
 38308e7fff4ca-2f3fe9c63a1so5228841fa.3
 for <buildroot@buildroot.org>; Wed, 04 Sep 2024 07:25:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725459912; x=1726064712;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p+/iwBYpcDWv456LkFaK9aDPUjCjo5AFNf4+BdZrhwQ=;
 b=MZpZh2WEKMDXH0xu9ARiQMaDpeIJ1FBlpvqGqQqxIKA8oC90LJu2Y2h5GAon9kcqyX
 NzrhTDkaV8gWVBZVvJmBXnGmg3zAwWQL34Ew1ypefUihfhSCiTfkKmTVCZz1Ge2BTXnC
 3Gk5AiwU4PxzL/3MinbweLBNZLOmJ/RkodOTMVSQ6gEh4iRT7ZD12eetzWSeG32NmHM8
 q60fhCgqMWGTFUWNVitOiRhxMlRHSBDY9fCqJUlYTUfAJzGy5H4krcb+ASCw7o12fu3l
 I9ncnMAZXjuJa5g3ZCqAAw0RdtwLI9magYsoFSRspJabCeJjDwmLQeTaUHdbjVHdgJQU
 yVnA==
X-Gm-Message-State: AOJu0YwSe7PzGEL24crIKwnVk4TmJ2LgNUHZa49R4AgtqnqryS82ay5B
 8peccj2msBWC5XROyG2Doc8BK7qoXko7hm8l2yLu+252WsM5RoLZpYT6uQiR++5BTygoja1/vRx
 ubPKadM0s
X-Google-Smtp-Source: AGHT+IF8EZqK9eWKycm9D0mIP2l2ZiM8LzLXVESr9qNeTSXZOCFGyhceX6j9QGm8X0FrPDGEHiptGw==
X-Received: by 2002:a05:651c:212a:b0:2ee:d55c:255f with SMTP id
 38308e7fff4ca-2f61e0addfdmr67226191fa.7.1725459911296; 
 Wed, 04 Sep 2024 07:25:11 -0700 (PDT)
Received: from adam-laptop.ipgroup.local (212-57-59-66.xdsl.deanconnect.nl.
 [212.57.59.66]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226ce96ddsm7564644a12.94.2024.09.04.07.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 07:25:11 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  4 Sep 2024 16:25:06 +0200
Message-ID: <20240904142509.3295502-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904142509.3295502-1-adam.duskett@amarulasolutions.com>
References: <20240904142509.3295502-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725459912; x=1726064712;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p+/iwBYpcDWv456LkFaK9aDPUjCjo5AFNf4+BdZrhwQ=;
 b=bmjjejYnKYGSDwSa/3pFWtt3q91azNFGahT2REyOFU+uE1FiCh+f0uYqllw+JdDmpe
 m+51rp8r0GkbVaFVoEomcUxJNiT9SXPQv3cMKeHz1kfSDpc+GfdzfTfYhwurf7MKULGY
 F1J2a+O1CJvhS+zCePExcY+oajr9PmO56LAw0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=bmjjejYn
Subject: [Buildroot] [PATCH v2 2/5] package/mender-grubenv: Fix per-package
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 package/mender-grubenv/mender-grubenv.mk | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
index 8679ad9236..a6d8d48d43 100644
--- a/package/mender-grubenv/mender-grubenv.mk
+++ b/package/mender-grubenv/mender-grubenv.mk
@@ -11,7 +11,6 @@ MENDER_GRUBENV_LICENSE_FILES = LICENSE
 # Grub2 must be built first so this package can overwrite the config files
 # provided by grub.
 MENDER_GRUBENV_DEPENDENCIES = grub2
-MENDER_GRUBENV_INSTALL_IMAGES = YES
 
 MENDER_GRUBENV_MAKE_ENV = \
 	$(TARGET_CONFIGURE_OPTS) \
@@ -34,12 +33,13 @@ MENDER_GRUBENV_MAKE_ENV += BOOT_DIR=/boot/grub
 
 define MENDER_GRUBENV_INSTALL_I386_CFG
 	mkdir -p $(BINARIES_DIR)/boot-part/grub
-	cp -dpfr $(@D)/mender_grub.cfg \
+	cp -dpfr $(MENDER_GRUBENV_BUILDDIR)/mender_grub.cfg \
 		$(TARGET_DIR)/boot/grub/grub.cfg
 	cp -dpfr $(TARGET_DIR)/boot/grub/grub.cfg \
 		$(TARGET_DIR)/boot/grub/grub-mender-grubenv \
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
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
