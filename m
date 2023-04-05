Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DB9C76188
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 20:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91D33812D7;
	Wed,  5 Apr 2023 20:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91D33812D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VF_jQzRQBen6; Wed,  5 Apr 2023 20:09:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E956813F6;
	Wed,  5 Apr 2023 20:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E956813F6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9923B1BF364
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F3CB41755
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:09:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F3CB41755
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nI8_aVwqvT-8 for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 20:09:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41CD941679
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 20:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41CD941679
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FDBF838B8; Wed,  5 Apr 2023 20:09:02 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 5 Apr 2023 22:08:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d7557d80f5c9a2f1bf9889ef03566fa84b23f85
X-Git-Newrev: a2f554c1bda5b1af6a54cff90af774fa16965fb6
X-Patchwork-Hint: ignore
Message-Id: <20230405200902.2FDBF838B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/petitboot: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a2f554c1bda5b1af6a54cff90af774fa16965fb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Although this is a "boot loader", it really is a tool that should be
part of an image that acts as the bootloader. Thus, it is not in the
bootloader menu.

A UI is required and can be provided by ncurses, X11 or fbdev. Only
ncurses is supported for now. The other two use libtwin which isn't part
of Buildroot for now.

Adapted from https://github.com/glevand/petitboot--buildroot
Updated to work with m68k architecture rather than just PlayStation3
(focused on qemu-system-m68k virt machine)

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Thomas Huth <huth@tuxfamily.org>
[Arnout:
 - Add missing arch and toolchain dependencies.
 - Remove nonexistent BR2_PACKAGE_NCURSES_TARGET_* selects.
 - Swap kexec/kexec-lite priority.
 - Add hash for license file.
 - Use version without v for VERSION.
 - Remove unnecessary --localstatedir=/var.
 - Add --disable-busybox.
 - Remove --enable-debug.
 - Remove --with-ncursesw and explicit libraries.
 - Add explicit arguments for all configure options.
 - Always select busybox tftp.
 - Add optional dependency on dtc.
 - Move dtc-specific options under a single condition.
 - Minor cleanups (whitespace, comments, ...).
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                       |  3 ++
 package/Config.in                |  1 +
 package/petitboot/Config.in      | 31 +++++++++++++++++++++
 package/petitboot/petitboot.hash |  3 ++
 package/petitboot/petitboot.mk   | 60 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 98 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7c5880c8ee..c226259aec 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1817,6 +1817,9 @@ F:	package/aircrack-ng/
 N:	Laurent Charpentier <laurent_pubs@yahoo.com>
 F:	package/open-lldp/
 
+N:	Laurent Vivier <laurent@vivier.eu>
+F:	package/petitboot/
+
 N:	Lee Jones <lee.jones@linaro.org>
 F:	boot/afboot-stm32/
 
diff --git a/package/Config.in b/package/Config.in
index 0f8dab3e71..760dda6ac1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2684,6 +2684,7 @@ menu "System tools"
 	source "package/openrc/Config.in"
 	source "package/openvmtools/Config.in"
 	source "package/pamtester/Config.in"
+	source "package/petitboot/Config.in"
 	source "package/polkit/Config.in"
 	source "package/powerpc-utils/Config.in"
 	source "package/procps-ng/Config.in"
diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
new file mode 100644
index 0000000000..0b4dc762bb
--- /dev/null
+++ b/package/petitboot/Config.in
@@ -0,0 +1,31 @@
+config BR2_PACKAGE_PETITBOOT
+	bool "petitboot"
+	# kexec-lite arch depends is a subset of kexec arch depends
+	depends on BR2_PACKAGE_KEXEC_ARCH_SUPPORTS
+	depends on BR2_USE_MMU # lvm2
+	depends on BR2_USE_WCHAR # elfutils
+	depends on !BR2_STATIC_LIBS # elfutils, lvm2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils, lvm2
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
+	depends on BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_ELFUTILS
+	select BR2_PACKAGE_LVM2 # devmapper
+	select BR2_PACKAGE_NCURSES
+	# run-time dependency only
+	select BR2_PACKAGE_KEXEC if !BR2_PACKAGE_KEXEC_LITE
+	# run-time dependency only
+	select BR2_PACKAGE_POWERPC_UTILS if ( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le )
+	# run-time dependency only
+	select BR2_PACKAGE_NVME if ( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le )
+	help
+	  Petitboot is a small kexec-based bootloader
+
+	  http://www.kernel.org/pub/linux/kernel/people/geoff/petitboot/petitboot.html
+
+comment "petitboot needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads, udev /dev management"
+	depends on BR2_PACKAGE_KEXEC_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
+		BR2_TOOLCHAIN_HAS_THREADS || \
+		!(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC) || \
+		!BR2_PACKAGE_HAS_UDEV
diff --git a/package/petitboot/petitboot.hash b/package/petitboot/petitboot.hash
new file mode 100644
index 0000000000..bf7bf56a67
--- /dev/null
+++ b/package/petitboot/petitboot.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  b42ae4fb2a81e9cf68f727c3f54c6312788c654bd97628ec9ba61b19a68990e6  petitboot-v1.13.tar.gz
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
new file mode 100644
index 0000000000..a798e7ca61
--- /dev/null
+++ b/package/petitboot/petitboot.mk
@@ -0,0 +1,60 @@
+################################################################################
+#
+# petitboot
+#
+################################################################################
+
+PETITBOOT_VERSION = 1.13
+PETITBOOT_SOURCE = petitboot-v$(PETITBOOT_VERSION).tar.gz
+PETITBOOT_SITE = https://github.com/open-power/petitboot/releases/download/v$(PETITBOOT_VERSION)
+PETITBOOT_DEPENDENCIES = elfutils ncurses udev host-bison host-flex lvm2
+PETITBOOT_LICENSE = GPL-2.0
+PETITBOOT_LICENSE_FILES = COPYING
+
+PETITBOOT_CONF_OPTS = \
+	--enable-crypt \
+	--enable-platform-auto \
+	--disable-mtd \
+	--with-ncurses \
+	--without-signed-boot \
+	--without-twin-fbdev \
+	--without-twin-x11 \
+	$(if $(BR2_PACKAGE_BUSYBOX),--enable-busybox,--disable-busybox) \
+	HOST_PROG_KEXEC=/usr/sbin/kexec \
+	HOST_PROG_SHUTDOWN=/usr/sbin/kexec-restart
+
+# HPA and Busybox tftp are supported. HPA tftp is part of Buildroot's tftpd
+# package.
+ifeq ($(BR2_PACKAGE_TFTPD),y)
+PETITBOOT_CONF_OPTS += --with-tftp=hpa
+else ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+PETITBOOT_CONF_OPTS += --with-tftp=busybox
+else
+# This actually means "autodetect", there's no way to really disable.
+PETITBOOT_CONF_OPTS += --without-tftp
+endif
+
+ifeq ($(BR2_PACKAGE_DTC),y)
+PETITBOOT_DEPENDENCIES += dtc
+PETITBOOT_CONF_OPTS += --with-fdt
+define PETITBOOT_POST_INSTALL_DTB
+	$(INSTALL) -D -m 0755 $(@D)/utils/hooks/30-dtb-updates \
+		$(TARGET_DIR)/etc/petitboot/boot.d/30-dtb-updates
+endef
+PETITBOOT_POST_INSTALL_TARGET_HOOKS += PETITBOOT_POST_INSTALL_DTB
+else
+PETITBOOT_CONF_OPTS += --without-fdt
+endif
+
+define PETITBOOT_POST_INSTALL
+	$(INSTALL) -D -m 0755 $(@D)/utils/bb-kexec-reboot \
+		$(TARGET_DIR)/usr/libexec/petitboot/bb-kexec-reboot
+	$(INSTALL) -D -m 0755 $(@D)/utils/hooks/01-create-default-dtb \
+		$(TARGET_DIR)/etc/petitboot/boot.d/01-create-default-dtb
+	$(INSTALL) -D -m 0755 $(@D)/utils/hooks/90-sort-dtb \
+		$(TARGET_DIR)/etc/petitboot/boot.d/90-sort-dtb
+endef
+
+PETITBOOT_POST_INSTALL_TARGET_HOOKS += PETITBOOT_POST_INSTALL
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
