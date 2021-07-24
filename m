Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF227C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:20:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74D5860E95
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 74D5860E95
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D853401CE;
	Sat, 24 Jul 2021 21:20:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ORVXfVToaAbz; Sat, 24 Jul 2021 21:20:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3413B40184;
	Sat, 24 Jul 2021 21:20:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1DADD1BF2AA
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19EEE401E5
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:19:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NW2EBLln-P0D for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 21:19:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0767340130
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 21:19:27 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id h15so2899574wmq.0
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 14:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ic/xQiG/e2ag8ng6UB/KIMBieQYusTlO93xYpyBUlD4=;
 b=jR5j4aiLa9uUcn14aYuI+0m+6+FOGpYPy91Qy1E+MpbNJXK7fXoYNHgrNJsuN9lUC0
 uY4T1AA5DwT5K2wJs0ebS4TZCK7bkTGE/hWQd33eHTaTQxLeXhVf8IJ+QP7p21ueN+n7
 MXnoPgu4amcqxcUuxFTycMZgC53LWUuoVtul4NELVNTHCavYSVCrjCnKXo7zCHsYPSlH
 Jtm4rMRZKPO8OozUqN+0EbRgoWtoDg5DLe31OlZ0kSJHIdQ928sEvFD03wbkyH+Oqd3Q
 QxuDQDEHoa/XlA4mbSDQ/Qqfe0pfhro2WLGDTdGBzfY9eAv7GsyHUHM4bXfy9Cro9iFJ
 W4YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ic/xQiG/e2ag8ng6UB/KIMBieQYusTlO93xYpyBUlD4=;
 b=WEQKWIyHEqB39FN+NGsRfaEvxKDkxaOexBbNV5rZKT9rrOWPGyG5bmywWQhFoDTMY6
 qze3jEB6RzHWg7mmKtPzZluIW7koR7iz56+R/V6jMXkQowtWa+2wC3B2LRBYrXgaODus
 rUCvAJLpSvoMdX5kge4lB2AXD43u1kJhU8jj2eZFipvFV+N2H/ut6huNLbamXd9W0ba7
 0Nxc1coUaaSFpAyAViCWesGnAwXpmgmw9As+AUJ0SDY5u1AVXECGeZmemP09QyocIreT
 Txt8hHTI5gJxIHOoixp7xWH1XpvsyRXAw5RhZjBWlBqTqICrx0LTWAEtQ/4mvcLItcUu
 Q6XA==
X-Gm-Message-State: AOAM533rRi+yaRoPLfAxkQ4q5c96/HCFkDolQ46m9eYVg3Te6Kfd/Dtf
 KkwI+H0K6m6PKkKtecWY8hxiL4Sueks=
X-Google-Smtp-Source: ABdhPJwuxT5dBQuiLfXjl9izMoLK0xEMljwsBih51ONPmeRCKFCn/qyUDzoBukN3ng8vx9sHmTflOQ==
X-Received: by 2002:a05:600c:2104:: with SMTP id
 u4mr10369377wml.45.1627161566255; 
 Sat, 24 Jul 2021 14:19:26 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:4802:7ee4:40b0:1519])
 by smtp.gmail.com with ESMTPSA id o5sm8469908wms.43.2021.07.24.14.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 14:19:25 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 23:19:22 +0200
Message-Id: <247d1a0d3a1bda3189f56c7dc21618383c49d8f8.1627161553.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627161553.git.yann.morin.1998@free.fr>
References: <cover.1627161553.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/4] package: use the generic _HELP_CMDS for
 kconfig-based packages
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

As Thomas put it:

    The <pkg>_HELP_CMDS variable allows packages using the
    kconfig-package infrastructure to display their specific
    targets related to the handling of their configuration.

    However, it was not consistently used and handled by the
    different packages.

So, this commit switches all the kconfig-based package to use the
generic help helper.

As a consequence:

  - all kconfig packages now advetise their kconfig-related actions,
    where some were previously missing: at91bootstrap3, linux-backports,
    swupdate, xvisor;

  - busybox advertises it does not support defconfig files;

  - the 'foo-savedfconfig' action is no longer advertised: it is to be
    considered an internal implementation detail.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/barebox/barebox/barebox.mk | 5 -----
 boot/uboot/uboot.mk             | 6 ------
 linux/linux.mk                  | 7 -------
 package/busybox/busybox.mk      | 5 +----
 package/uclibc/uclibc.mk        | 4 ----
 5 files changed, 1 insertion(+), 26 deletions(-)

diff --git a/boot/barebox/barebox/barebox.mk b/boot/barebox/barebox/barebox.mk
index 39afb0fccb..6a5a80de34 100644
--- a/boot/barebox/barebox/barebox.mk
+++ b/boot/barebox/barebox/barebox.mk
@@ -4,10 +4,5 @@
 #
 ################################################################################
 
-define BAREBOX_HELP_CMDS
-	@echo '  barebox-menuconfig     - Run barebox menuconfig'
-	@echo '  barebox-savedefconfig  - Run barebox savedefconfig'
-endef
-
 # Instantiate the barebox package
 $(eval $(barebox-package))
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 9c2261963d..4f3c9b7c3a 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -296,12 +296,6 @@ UBOOT_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 # override again. In addition, host-ccache is not ready at kconfig
 # time, so use HOSTCC_NOCCACHE.
 UBOOT_KCONFIG_OPTS = $(UBOOT_MAKE_OPTS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTLDFLAGS=""
-define UBOOT_HELP_CMDS
-	@echo '  uboot-menuconfig       - Run U-Boot menuconfig'
-	@echo '  uboot-savedefconfig    - Run U-Boot savedefconfig'
-	@echo '  uboot-update-defconfig - Save the U-Boot configuration to the path specified'
-	@echo '                             by BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE'
-endef
 endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
 
 UBOOT_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_DTS_PATH))
diff --git a/linux/linux.mk b/linux/linux.mk
index 1457228eb9..61fdc0c76c 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -16,13 +16,6 @@ LINUX_CPE_ID_VENDOR = linux
 LINUX_CPE_ID_PRODUCT = linux_kernel
 LINUX_CPE_ID_PREFIX = cpe:2.3:o
 
-define LINUX_HELP_CMDS
-	@echo '  linux-menuconfig       - Run Linux kernel menuconfig'
-	@echo '  linux-savedefconfig    - Run Linux kernel savedefconfig'
-	@echo '  linux-update-defconfig - Save the Linux configuration to the path specified'
-	@echo '                             by BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE'
-endef
-
 # Compute LINUX_SOURCE and LINUX_SITE from the configuration
 ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TARBALL),y)
 LINUX_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 413939e28d..68e0b8a72c 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -11,10 +11,6 @@ BUSYBOX_LICENSE = GPL-2.0, bzip2-1.0.4
 BUSYBOX_LICENSE_FILES = LICENSE archival/libarchive/bz/LICENSE
 BUSYBOX_CPE_ID_VENDOR = busybox
 
-define BUSYBOX_HELP_CMDS
-	@echo '  busybox-menuconfig     - Run BusyBox menuconfig'
-endef
-
 BUSYBOX_CFLAGS = \
 	$(TARGET_CFLAGS)
 
@@ -107,6 +103,7 @@ ifndef BUSYBOX_CONFIG_FILE
 BUSYBOX_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG))
 endif
 
+BUSYBOX_KCONFIG_HAS_DEFCONFIG = NO
 BUSYBOX_KCONFIG_FILE = $(BUSYBOX_CONFIG_FILE)
 BUSYBOX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES))
 BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index a7c96684d0..5c17eea8dd 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -13,10 +13,6 @@ UCLIBC_INSTALL_STAGING = YES
 UCLIBC_CPE_ID_VENDOR = uclibc-ng_project
 UCLIBC_CPE_ID_PRODUCT = uclibc-ng
 
-define UCLIBC_HELP_CMDS
-	@echo '  uclibc-menuconfig      - Run uClibc menuconfig'
-endef
-
 # uclibc is part of the toolchain so disable the toolchain dependency
 UCLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
