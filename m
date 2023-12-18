Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09225C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 21:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 469E441733;
	Mon, 18 Dec 2023 21:26:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 469E441733
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qdgBEOXwHWSE; Mon, 18 Dec 2023 21:26:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C774408EA;
	Mon, 18 Dec 2023 21:26:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C774408EA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 297EB1BF344
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 21:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02496410AC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 21:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02496410AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eut8jaDXCAYV for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 21:26:19 +0000 (UTC)
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4572E40A00
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 21:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4572E40A00
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-35d77fb7d94so19875985ab.0
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 13:26:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702934777; x=1703539577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nu8aourLogfJj3/N8o8xwFWJmilNuoy+ekcIi958+m4=;
 b=DmlCDrBR+WVB278Ad0i1cZiIcnJiA0yIdILUXMvFC/JmEjq81hlMLCWq53SUzW0zB9
 x1hukLbencqsgYqEHGvl8qO1MfMnkuufWXf8OKhGZx5Q06JPDSzOA8usMHPUkXYTozwt
 8+h7kMhphN1NRgUIJgdlPWQe20w2uZ3A513Mp3OnVeOHsFOUKJQxtyIDf4/OELq2vwI2
 bBlBIs+7ZckeXdAJTCM416zgC/8GnoZzTv4lrT5RjyxOX3CqmAdAfY+XV9gHtUWLLlQr
 dB1N3TYwqIH2S6Od8oqxxzg5u3UFVXS0ygICV0VY2gj4QP7jZag0v5LsIxAHBEM4n0Ak
 IVAg==
X-Gm-Message-State: AOJu0Yx2bfAbZXYgEOTfawiv18IyoYSeJ5B8cZLK8hJORLzy5XTvJgab
 fiflrui9xO18Tyq9NNdUikMxO/Kkpj55Cvx3wiQ=
X-Google-Smtp-Source: AGHT+IG8PqszAzumWBG/pC7F6Qw4Q8+WWSxL9rsdofGE/Phzdz3DkSOqJodNMqRDazqSw2tNv5O/8Q==
X-Received: by 2002:a05:6e02:174a:b0:35d:5995:1d71 with SMTP id
 y10-20020a056e02174a00b0035d59951d71mr30222404ill.54.1702934777453; 
 Mon, 18 Dec 2023 13:26:17 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 i18-20020a63e452000000b005cd7dd8708dsm4364264pgk.52.2023.12.18.13.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 13:26:16 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 14:26:09 -0700
Message-ID: <20231218212613.1201821-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218212613.1201821-1-adam.duskett@amarulasolutions.com>
References: <20231218212613.1201821-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702934777; x=1703539577;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nu8aourLogfJj3/N8o8xwFWJmilNuoy+ekcIi958+m4=;
 b=X58fXEuA8hn+gPEDRJe+sxlRPzgbUnlce0JOcCiDAXfHiEKiEQD1zNyFmctbOcdrii
 xrLx/Xlm2dh15B7HUvv8EeEKDYdl22q7NmeVYK7YuJorNuInKNRloVRst/U4QN4OiewZ
 30AE3QXOZK2+l9IREYbcZW0Dm7XBx2WRIALJ4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=X58fXEuA
Subject: [Buildroot] [PATCH v2 2/6] package/mender-grubenv: Fix per-package
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

MENDER_GRUBENV_TARGET_FINALIZE_HOOKS

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: Remove MENDER_GRUBENV_INSTALL_IMAGES = YES [Thomas]

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
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
