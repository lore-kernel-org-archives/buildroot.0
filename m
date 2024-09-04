Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25603CD37B4
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 14:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFCB780D80;
	Wed,  4 Sep 2024 14:20:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O3QZdhJiE3ED; Wed,  4 Sep 2024 14:20:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D751E811C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D751E811C2;
	Wed,  4 Sep 2024 14:20:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 63A231BF267
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 14:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F13860896
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 14:20:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tAG4tPJMlFZK for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 14:20:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::242; helo=mail-lj1-x242.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3B5A76059D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B5A76059D
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B5A76059D
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 14:20:45 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id
 38308e7fff4ca-2f3f922ad1eso5401011fa.3
 for <buildroot@buildroot.org>; Wed, 04 Sep 2024 07:20:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725459642; x=1726064442;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p+/iwBYpcDWv456LkFaK9aDPUjCjo5AFNf4+BdZrhwQ=;
 b=pxqKd2In3OZtK83TVo46NzVxFcHAr3r4u07DPG4evdQ6tDRTV5KP5hemrM7/MtfWDe
 IimYr8A24dzX9CaytmOUy28zssqJrkg0OenjvfBlRcYpQT/8EyihH7cCLYduz1RikYbt
 wVobLh3pyTvitr6A7ecJT3Dy8vTFh1RLOHTJFtow+7e4C9nc9uBTNuEMr62k+/ynIwpa
 X5/HTgTHdjwdqzflIv8itVV2TPUi3zblb4c7TlO10PuzdiQCq+wulI5ZmyKh7NK9aLb4
 dI2IDAPDCtLwubbjWkX3Z/9OnJMzn2ZgETc8AjMSGD4D4rxLojCettZrzbAkZWH6CAB9
 M1jQ==
X-Gm-Message-State: AOJu0YzZZEUyW3fc56J+u9VXxZYhaq0p7FvdkZdMOT4oKWLx4Is9Wfaz
 i+BT3XQqll+G+qqw8UiXV4aQkRfHflgq/nPbTdGofkWmd/03uL15/ec1u5gbOidpi6XfBpbbt6i
 Ax9qhO2G2
X-Google-Smtp-Source: AGHT+IHkiqpQupIFCC401ye/XZlKRXnLaH4QkTeK2bkyRTHnq6Jhas/hpdB+oce2Or33sWULrH6MFg==
X-Received: by 2002:a05:651c:210c:b0:2f3:d032:44a9 with SMTP id
 38308e7fff4ca-2f61df97cdfmr65820671fa.0.1725459641832; 
 Wed, 04 Sep 2024 07:20:41 -0700 (PDT)
Received: from adam-laptop.ipgroup.local (212-57-59-66.xdsl.deanconnect.nl.
 [212.57.59.66]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c2502f86ebsm4680230a12.77.2024.09.04.07.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 07:20:41 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  4 Sep 2024 16:20:35 +0200
Message-ID: <20240904142038.3294224-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904142038.3294224-1-adam.duskett@amarulasolutions.com>
References: <20240904142038.3294224-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725459642; x=1726064442;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p+/iwBYpcDWv456LkFaK9aDPUjCjo5AFNf4+BdZrhwQ=;
 b=ZnYp2cgW/WpcH8IelrXbN2Dow2h+jM9JWn2tkg1DP3wc5m2jTzlnd2mXow0k64bclc
 qhO0I9h8Ho4Tq+1O+tD6fSOke7Ugjn7SiXdVkUdjieJM1bPTOLv/3LqqSIyiS+jww2x4
 koazHr5Clb9N3vL9uUg++YjjdjCx4E+pOJlng=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ZnYp2cgW
Subject: [Buildroot] [PATCH 2/5] package/mender-grubenv: Fix per-package
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
