Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F15CD37B4
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 14:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80A6580CAE;
	Wed,  4 Sep 2024 14:25:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VPDpKltSrZmS; Wed,  4 Sep 2024 14:25:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EDF480D62
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EDF480D62;
	Wed,  4 Sep 2024 14:25:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A54261BF97A
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 14:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90AE480B69
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 14:25:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sdcx-j-qUbds for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 14:25:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::243; helo=mail-lj1-x243.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 992D380B62
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 992D380B62
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 992D380B62
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 14:25:14 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id
 38308e7fff4ca-2f4044f2ab9so5274961fa.1
 for <buildroot@buildroot.org>; Wed, 04 Sep 2024 07:25:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725459912; x=1726064712;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R+HGCOuKdig/Tl2BpFPS4G02esg7Y5pwDOapL7WJKCs=;
 b=Q21RfLCBmgXIW6rgbtFQbPjbaVtwd6tox2RxqbVS7S6F04feibCDYF7wnH+hxDy/Ns
 iyhoj+oLJZA3BK0Ngrt81RKELeKo9Spir4VZ8QZTh2vblx8X6AYxILVVpsVMsbDCi9jo
 NRLBkGUq91XPtYzZy8pELyovsINy2RtMOB3/SivvUQuX8X+cgO98feLIjLj8ThIdsaPm
 HbKQqRAERis5yJ+3wNX3EP31Czf006EToGZgmIqxSVcn5ow6p8cVELrps94n/5Gq+e8J
 2fNGkAMOapNcg9KZhwf9Lwy2bWa0TmyHWKhWGWD5ba+2siz/2UKxYAKV/54dzR3xAATT
 wwYA==
X-Gm-Message-State: AOJu0Yz11IhabiBoJwQtL38v93luKhXuxDiaDKx8U9jAuDIuPd7b9JNx
 FYRU8mql0NI6L392CBOJEQn9BCXoY2vc0CjXAJd5JeFy6eB+IYEpqWAmkCA24Bx/dRjm8etyeca
 Ad0+cxKNo
X-Google-Smtp-Source: AGHT+IGjD8KWUPjnB/LC+6Fel3fJid7eqfaFvKk36JxpTHXTC3dxOAtkac1jkUK6azihNAv222+YOw==
X-Received: by 2002:a2e:be9b:0:b0:2ef:315c:67e1 with SMTP id
 38308e7fff4ca-2f61e09bee8mr66106351fa.4.1725459911759; 
 Wed, 04 Sep 2024 07:25:11 -0700 (PDT)
Received: from adam-laptop.ipgroup.local (212-57-59-66.xdsl.deanconnect.nl.
 [212.57.59.66]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226ce96ddsm7564644a12.94.2024.09.04.07.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 07:25:11 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  4 Sep 2024 16:25:07 +0200
Message-ID: <20240904142509.3295502-3-adam.duskett@amarulasolutions.com>
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
 bh=R+HGCOuKdig/Tl2BpFPS4G02esg7Y5pwDOapL7WJKCs=;
 b=Ft2Cx2xF9Y+2BewhNc8p7OvXNawikfMQteh8UIRbITRr6JTu/0hwMWUdYYjKr8zIoX
 cFsg9QHL24onPpvvNn9YrOLSXjfykvuQjXiXbdcwFemoYlA9isiXh+JHJVIvUVQIX0SP
 MlfoBUjyAO5vQ3VjUJ9oHzuK6VqQGBtd4RJqg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Ft2Cx2xF
Subject: [Buildroot] [PATCH v2 3/5] package/mender-grubenv: bump version to
 38e5043a215f696d126a2d707c9db9aeb93cfb2d
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

Commit 174bf40fb520893a5ef69ef02c22aa232b56bd67 introduced the usage of
`flock -w` to prevent errors during concurrent access of the environment
(IE: When a process is editing an env and another is trying to restore it.)

As such, mender-grubenv now requires util-linux and the basic binaries
set, as the busybox flock does not provide the -w argument.

Other changes:
  - The boot directory is now expected to be /boot instead of /boot/grub
  - License hash changed for 2023 -> 2024 year date (see commit f54ecfb)

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/mender-grubenv/Config.in           | 2 ++
 package/mender-grubenv/mender-grubenv.hash | 4 ++--
 package/mender-grubenv/mender-grubenv.mk   | 8 ++++----
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/mender-grubenv/Config.in b/package/mender-grubenv/Config.in
index f27eb09e34..8505458793 100644
--- a/package/mender-grubenv/Config.in
+++ b/package/mender-grubenv/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_MENDER_GRUBENV
 	depends on BR2_PACKAGE_MENDER # runtime
 	depends on BR2_TARGET_GRUB2
 	depends on !(BR2_TARGET_GRUB2_HAS_LEGACY_BOOT && BR2_TARGET_GRUB2_HAS_EFI_BOOT)
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_BINARIES # flock -w
 	help
 	  Contains the boot scripts and tools used by Mender to
 	  integrate with the GRUB bootloader.
diff --git a/package/mender-grubenv/mender-grubenv.hash b/package/mender-grubenv/mender-grubenv.hash
index 193bff073b..d7f784493c 100644
--- a/package/mender-grubenv/mender-grubenv.hash
+++ b/package/mender-grubenv/mender-grubenv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b7a08eb3d996afb38c1a4f7c51b7eb44aec6197ff713ce75e4f39d5b448cfc82  mender-grubenv-2ac898f5924d5870f8394ad8ecd3ef1ab1422e3b.tar.gz
-sha256  1033348db7606a7e61b6484f293847cf8d7a35766efebb97e304d4bd5d7f3f6b  LICENSE
+sha256  0bac59698165a8dafdd282610246addd7bebf41612efa88c77b779f8ffb5ed9d  mender-grubenv-38e5043a215f696d126a2d707c9db9aeb93cfb2d.tar.gz
+sha256  d0f406b04e7901e6b4076bdf5fd20f9d7f04fc41681069fd8954413ac6295688  LICENSE
diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
index a6d8d48d43..a47531fe58 100644
--- a/package/mender-grubenv/mender-grubenv.mk
+++ b/package/mender-grubenv/mender-grubenv.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-MENDER_GRUBENV_VERSION = 2ac898f5924d5870f8394ad8ecd3ef1ab1422e3b
+MENDER_GRUBENV_VERSION = 38e5043a215f696d126a2d707c9db9aeb93cfb2d
 MENDER_GRUBENV_SITE = $(call github,mendersoftware,grub-mender-grubenv,$(MENDER_GRUBENV_VERSION))
 MENDER_GRUBENV_LICENSE = Apache-2.0
 MENDER_GRUBENV_LICENSE_FILES = LICENSE
 # Grub2 must be built first so this package can overwrite the config files
 # provided by grub.
-MENDER_GRUBENV_DEPENDENCIES = grub2
+MENDER_GRUBENV_DEPENDENCIES = grub2 util-linux
 
 MENDER_GRUBENV_MAKE_ENV = \
 	$(TARGET_CONFIGURE_OPTS) \
@@ -29,14 +29,14 @@ MENDER_GRUBENV_MODULES_MISSING_PC = \
 	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_PC)),\
 		$(MENDER_GRUBENV_MANDATORY_MODULES))
 
-MENDER_GRUBENV_MAKE_ENV += BOOT_DIR=/boot/grub
+MENDER_GRUBENV_MAKE_ENV += BOOT_DIR=/boot
 
 define MENDER_GRUBENV_INSTALL_I386_CFG
 	mkdir -p $(BINARIES_DIR)/boot-part/grub
 	cp -dpfr $(MENDER_GRUBENV_BUILDDIR)/mender_grub.cfg \
 		$(TARGET_DIR)/boot/grub/grub.cfg
 	cp -dpfr $(TARGET_DIR)/boot/grub/grub.cfg \
-		$(TARGET_DIR)/boot/grub/grub-mender-grubenv \
+		$(TARGET_DIR)/boot/grub-mender-grubenv \
 		$(BINARIES_DIR)/boot-part/
 endef
 MENDER_GRUBENV_TARGET_FINALIZE_HOOKS += MENDER_GRUBENV_INSTALL_I386_CFG
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
