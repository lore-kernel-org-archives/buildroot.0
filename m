Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616E9C41535
	for <buildroot@archiver.kernel.org>; Tue, 19 Dec 2023 17:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 156BE831F1;
	Tue, 19 Dec 2023 17:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 156BE831F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x2DchUE3cn_O; Tue, 19 Dec 2023 17:25:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2ABDD831A7;
	Tue, 19 Dec 2023 17:25:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2ABDD831A7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3871F1BF390
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 17:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1109441B85
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 17:24:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1109441B85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VMrBRavxTklC for <buildroot@lists.busybox.net>;
 Tue, 19 Dec 2023 17:24:52 +0000 (UTC)
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33C204169B
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 17:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33C204169B
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-593ea4c2baaso468557eaf.3
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 09:24:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703006690; x=1703611490;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yErnj/B4m9jfnJXYaNwTT7buHXR5aHl+qJKX4dMniDo=;
 b=ox8kGe9d9LJ0YkzhTCGhawsnloInHkzkxVaIcda3/zt5Pv2QtUdeAwIu3qUJSWvG/+
 eheSI4firfhjxO6XUguB1wDsjI+xBl5KZKcsuCsmA1e3Zhq+qPe8UedIt1U1w03Ykua5
 HBkxqWoWFRGAjZdMI6xYU4qrPIEmPapnZjcyF4Xi9VVBWYC0kec/CxYX465MRO7Gnspo
 mUiOzJ6Cjvc618Aa09TIw3wovGIA1gOCVze+PzqYZN9Dd0Lrb8OYio2WPd1oIhw+H4i/
 DkNY47+TJxU1ZMTNAphY+Env4V6d428XpW/IvEgK8XmAohEebMT06UlcewzCYhMOVmWr
 h+lQ==
X-Gm-Message-State: AOJu0Yx38WmQtFoTM+QT2gsY6NMQmLIs6+wb1qKG8kNsk7oe2FV+Gqn1
 OuEhj5x6TwbFKmcRbwWbkkdL9/FLP4IayOWhaCU=
X-Google-Smtp-Source: AGHT+IHqErHXxZoG9dgkC76ioMjQLA5PXpd0Ew6rA7Y5PScZ0Rv4INWtUHv+s7llfFWomOlq42MpNg==
X-Received: by 2002:a05:6358:9497:b0:170:ce56:3797 with SMTP id
 i23-20020a056358949700b00170ce563797mr12013503rwb.35.1703006690331; 
 Tue, 19 Dec 2023 09:24:50 -0800 (PST)
Received: from fedora.. ([75.174.143.7]) by smtp.gmail.com with ESMTPSA id
 g192-20020a636bc9000000b0058901200bbbsm19910829pgc.40.2023.12.19.09.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 09:24:49 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 19 Dec 2023 10:24:42 -0700
Message-ID: <20231219172446.498409-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231219172446.498409-1-adam.duskett@amarulasolutions.com>
References: <20231219172446.498409-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703006690; x=1703611490;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yErnj/B4m9jfnJXYaNwTT7buHXR5aHl+qJKX4dMniDo=;
 b=npOVr8BqXTc4Wq5w/X1L8zOvp9fIP6xP9YO1BWYaO8hlhD4AEBf8M2GgqYtCtn7Xuw
 6H7ppMqIGKHZCYyXHHFmzzFUAd9zq4lDYRUwtdImREYLkY97DmM10jahzOVQUkbzuNSe
 o5nplrwFFAWjfg7WtRncAxcZmdWXN7KllP42k=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=npOVr8Bq
Subject: [Buildroot] [PATCH v3 2/6] package/mender-grubenv: Fix per-package
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
