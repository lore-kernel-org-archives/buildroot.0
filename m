Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 999A0C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:35:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BFDC60F58
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:35:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5BFDC60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B1C340649;
	Wed,  4 Aug 2021 00:35:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PwT1yrI6A1J5; Wed,  4 Aug 2021 00:35:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BC4540653;
	Wed,  4 Aug 2021 00:35:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0FD5E1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C81114151A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jf03W1TT61YB for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03D8B40F55
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5A6F583D7B; Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 15:20:24 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c7d71b707d96f7b9c4959951af147af6fb5dee2f
X-Git-Newrev: e6b3913cfc4ec7a9f737674a8dcb07ea4155038a
X-Patchwork-Hint: ignore
Message-Id: <20210803211017.5A6F583D7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package: use the generic
 _HELP_CMDS for kconfig-based packages
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=e6b3913cfc4ec7a9f737674a8dcb07ea4155038a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
