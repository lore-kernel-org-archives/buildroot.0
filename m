Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2C2C3DA64
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 20:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2082381FC6;
	Thu,  1 Aug 2024 20:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N-HfbTto7DUb; Thu,  1 Aug 2024 20:56:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A246181F0F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A246181F0F;
	Thu,  1 Aug 2024 20:56:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C9E821BF408
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 20:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B878C6060A
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 20:56:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sd2rA7ezKJ9R for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 20:56:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79E05605F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79E05605F1
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 20:56:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 686C083881; Thu,  1 Aug 2024 20:56:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Aug 2024 22:54:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 51f4451094aaa56caffc4f4b4a171a64dc613826
X-Git-Newrev: 3ec6223b14f70beca551c5551d22f118db54c2aa
X-Patchwork-Hint: ignore
Message-Id: <20240801205639.686C083881@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fwupd: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3ec6223b14f70beca551c5551d22f118db54c2aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |   1 +
 package/Config.in                                  |   1 +
 ...ire-udevdir-when-gudev-support-is-enabled.patch |  35 ++++
 package/fwupd/Config.in                            |  19 ++
 package/fwupd/fwupd.hash                           |   3 +
 package/fwupd/fwupd.mk                             | 208 +++++++++++++++++++++
 6 files changed, 267 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 709f658a38..092397adcb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1491,6 +1491,7 @@ F:	package/apcupsd/
 F:	package/bpftool/
 F:	package/cloudflared/
 F:	package/exfatprogs/
+F:	package/fwupd/
 F:	package/fwupd-efi/
 F:	package/fxdiv/
 F:	package/gensio/
diff --git a/package/Config.in b/package/Config.in
index 3d638b111f..e04cdae1e5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -519,6 +519,7 @@ endmenu
 	source "package/fmtools/Config.in"
 	source "package/freeipmi/Config.in"
 	source "package/freescale-imx/Config.in"
+	source "package/fwupd/Config.in"
 	source "package/fwupd-efi/Config.in"
 	source "package/fxload/Config.in"
 	source "package/gcnano-binaries/Config.in"
diff --git a/package/fwupd/0001-Only-require-udevdir-when-gudev-support-is-enabled.patch b/package/fwupd/0001-Only-require-udevdir-when-gudev-support-is-enabled.patch
new file mode 100644
index 0000000000..0f14508516
--- /dev/null
+++ b/package/fwupd/0001-Only-require-udevdir-when-gudev-support-is-enabled.patch
@@ -0,0 +1,35 @@
+From a784ef9b904778b511a6284f46d983906939de6c Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Thu, 18 Jul 2024 09:44:15 -0600
+Subject: [PATCH] Only require udevdir when gudev support is enabled
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/fwupd/fwupd/commit/a784ef9b904778b511a6284f46d983906939de6c
+---
+ meson.build | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 22282d73e..f49d08d29 100644
+--- a/meson.build
++++ b/meson.build
+@@ -273,10 +273,12 @@ if build_daemon
+   if not polkit.found()
+     warning('Polkit is disabled, the daemon will allow ALL client actions')
+   endif
+-  udevdir = get_option('udevdir')
+-  if udevdir == '' and host_machine.system() == 'linux'
+-    udev = dependency('udev')
+-    udevdir = udev.get_variable(pkgconfig: 'udevdir')
++  if gudev.found()
++    udevdir = get_option('udevdir')
++    if udevdir == '' and host_machine.system() == 'linux'
++      udev = dependency('udev')
++      udevdir = udev.get_variable(pkgconfig: 'udevdir')
++    endif
+   endif
+ endif
+ libm = cc.find_library('m', required: false)
+-- 
+2.34.1
+
diff --git a/package/fwupd/Config.in b/package/fwupd/Config.in
new file mode 100644
index 0000000000..6a96358e5b
--- /dev/null
+++ b/package/fwupd/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_FWUPD
+	bool "fwupd"
+	depends on !BR2_STATIC_LIBS # libxmlb
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBJCAT
+	select BR2_PACKAGE_LIBXMLB
+	select BR2_PACKAGE_ZLIB
+	help
+	  Fwupd is a simple daemon to allow session software
+	  to update device firmware on your local machine.
+
+	  https://fwupd.org/
+
+comment "fwupd needs a toolchain w/ wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/fwupd/fwupd.hash b/package/fwupd/fwupd.hash
new file mode 100644
index 0000000000..8da9dc3c66
--- /dev/null
+++ b/package/fwupd/fwupd.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  b86a2d7fe1b6cc0ac4f75f3351a78cb3c225880c9e20b932fa078ef472e9fcb2  fwupd-1.9.20.tar.xz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/fwupd/fwupd.mk b/package/fwupd/fwupd.mk
new file mode 100644
index 0000000000..9283eb43aa
--- /dev/null
+++ b/package/fwupd/fwupd.mk
@@ -0,0 +1,208 @@
+################################################################################
+#
+# fwupd
+#
+################################################################################
+
+FWUPD_VERSION = 1.9.20
+FWUPD_SITE = https://github.com/fwupd/fwupd/releases/download/$(FWUPD_VERSION)
+FWUPD_SOURCE = fwupd-$(FWUPD_VERSION).tar.xz
+FWUPD_LICENSE = LGPL-2.1+
+FWUPD_LICENSE_FILES = COPYING
+FWUPD_DEPENDENCIES = \
+	host-pkgconf \
+	host-python-jinja2 \
+	libglib2 \
+	libjcat \
+	libxmlb \
+	zlib
+
+FWUPD_CONF_OPTS = \
+	-Dstatic_analysis=false \
+	-Dconsolekit=disabled \
+	-Dfirmware-packager=true \
+	-Ddocs=disabled \
+	-Dlvfs=true \
+	-Dman=false \
+	-Dgusb=disabled \
+	-Dpassim=disabled \
+	-Dp2p_policy=none \
+	-Dcbor=disabled \
+	-Dplugin_acpi_phat=enabled \
+	-Dplugin_cfu=disabled \
+	-Dplugin_ep963x=enabled \
+	-Dplugin_fastboot=disabled \
+	-Dplugin_logitech_bulkcontroller=disabled \
+	-Dplugin_logitech_scribe=disabled \
+	-Dplugin_logitech_tap=disabled \
+	-Dplugin_pixart_rf=enabled \
+	-Dplugin_tpm=disabled \
+	-Dplugin_uefi_capsule=enabled \
+	-Dplugin_uefi_capsule_splash=false \
+	-Dplugin_nitrokey=enabled \
+	-Dplugin_mtd=enabled \
+	-Dplugin_intel_me=enabled \
+	-Dplugin_upower=enabled \
+	-Dplugin_powerd=enabled \
+	-Dqubes=false \
+	-Dsupported_build=enabled \
+	-Dlaunchd=disabled \
+	-Dtests=false \
+	-Dmetainfo=true \
+	-Dfish_completion=false \
+	-Dcompat_cli=false \
+	-Dthinklmi_compat=false \
+	-Dpython="$(HOST_DIR)/bin/python3"
+
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+FWUPD_DEPENDENCIES += gobject-introspection
+FWUPD_CONF_OPTS += -Dintrospection=enabled
+else
+FWUPD_CONF_OPTS += -Dintrospection=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
+FWUPD_DEPENDENCIES += libarchive
+FWUPD_CONF_OPTS += -Dlibarchive=enabled
+else
+FWUPD_CONF_OPTS += -Dlibarchive=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
+FWUPD_DEPENDENCIES += libgudev
+FWUPD_CONF_OPTS += \
+	-Dgudev=enabled \
+	-Dplugin_android_boot=enabled \
+	-Dplugin_bcm57xx=enabled \
+	-Dplugin_emmc=enabled \
+	-Dplugin_gpio=enabled \
+	-Dplugin_igsc=enabled \
+	-Dplugin_kinetic_dp=enabled \
+	-Dplugin_parade_lspcon=enabled \
+	-Dplugin_realtek_mst=enabled \
+	-Dplugin_synaptics_mst=enabled \
+	-Dplugin_mediatek_scaler=enabled \
+	-Dplugin_scsi=enabled \
+	-Dplugin_nvme=enabled \
+	-Dplugin_uf2=enabled
+else
+FWUPD_CONF_OPTS += \
+	-Dgudev=disabled \
+	-Dplugin_android_boot=disabled \
+	-Dplugin_bcm57xx=disabled \
+	-Dplugin_emmc=disabled \
+	-Dplugin_gpio=disabled \
+	-Dplugin_igsc=disabled \
+	-Dplugin_kinetic_dp=disabled \
+	-Dplugin_parade_lspcon=disabled \
+	-Dplugin_realtek_mst=disabled \
+	-Dplugin_synaptics_mst=disabled \
+	-Dplugin_mediatek_scaler=disabled \
+	-Dplugin_scsi=disabled \
+	-Dplugin_nvme=disabled \
+	-Dplugin_uf2=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
+FWUPD_DEPENDENCIES += bluez5_utils
+FWUPD_CONF_OPTS += -Dbluez=enabled
+else
+FWUPD_CONF_OPTS += -Dbluez=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_POLKIT),y)
+FWUPD_DEPENDENCIES += polkit
+FWUPD_CONF_OPTS += -Dpolkit=enabled
+else
+FWUPD_CONF_OPTS += -Dpolkit=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+FWUPD_DEPENDENCIES += gnutls
+FWUPD_CONF_OPTS += -Dgnutls=enabled -Dplugin_uefi_pk=enabled
+else
+FWUPD_CONF_OPTS += -Dgnutls=disabled -Dplugin_uefi_pk=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_SQLITE),y)
+FWUPD_DEPENDENCIES += sqlite
+FWUPD_CONF_OPTS += -Dsqlite=enabled
+else
+FWUPD_CONF_OPTS += -Dsqlite=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_XZ),y)
+FWUPD_DEPENDENCIES += xz
+FWUPD_CONF_OPTS += -Dlzma=enabled
+ifeq ($(BR2_i386)$(BR2_x86_64),y)
+FWUPD_CONF_OPTS += -Dplugin_intel_spi=true
+else
+FWUPD_CONF_OPTS += -Dplugin_intel_spi=false
+endif
+else
+FWUPD_CONF_OPTS += -Dlzma=disabled -Dplugin_intel_spi=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBDRM_AMDGPU)$(BR2_PACKAGE_LIBGUDEV),yy)
+FWUPD_DEPENDENCIES += libdrm libgudev
+FWUPD_CONF_OPTS += -Dplugin_amdgpu=enabled
+else
+FWUPD_CONF_OPTS += -Dplugin_amdgpu=disabled
+endif
+
+ifeq ($(BR2_i386)$(BR2_x86_64),y)
+FWUPD_CONF_OPTS += -Dplugin_cpu=enabled -Dplugin_msr=enabled -Dhsi=enabled
+else
+FWUPD_CONF_OPTS += -Dplugin_cpu=disabled -Dplugin_msr=disabled -Dhsi=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_LIBGUDEV),yy)
+FWUPD_DEPENDENCIES += gnutls libgudev
+FWUPD_CONF_OPTS += -Dplugin_synaptics_rmi=enabled
+else
+FWUPD_CONF_OPTS += -Dplugin_synaptics_rmi=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+FWUPD_DEPENDENCIES += libcurl
+FWUPD_CONF_OPTS += -Dplugin_redfish=enabled -Dcurl=enabled
+else
+FWUPD_CONF_OPTS += -Dplugin_redfish=disabled -Dcurl=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGUDEV)$(BR2_PACKAGE_LIBMBIM)$(BR2_PACKAGE_LIBQMI)$(BR2_PACKAGE_MODEM_MANAGER),yyyy)
+FWUPD_DEPENDENCIES += libgudev libmbim libqmi modem-manager
+FWUPD_CONF_OPTS += -Dplugin_modem_manager=enabled
+else
+FWUPD_CONF_OPTS += -Dplugin_modem_manager=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_FLASHROM),y)
+FWUPD_DEPENDENCIES += flashrom
+FWUPD_CONF_OPTS += -Dplugin_flashrom=enabled
+else
+FWUPD_CONF_OPTS += -Dplugin_flashrom=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+FWUPD_DEPENDENCIES += systemd
+FWUPD_CONF_OPTS += -Dsystemd=enabled -Delogind=enabled -Doffline=enabled
+else
+FWUPD_CONF_OPTS += -Dsystemd=disabled -Delogind=disabled -Doffline=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_FWUPD_EFI),y)
+FWUPD_DEPENDENCIES += fwupd-efi
+FWUPD_CONF_OPTS += -Defi_binary=true
+else
+FWUPD_CONF_OPTS += -Defi_binary=false
+endif
+
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+FWUPD_DEPENDENCIES += bash-completion
+FWUPD_CONF_OPTS += -Dbash_completion=true
+else
+FWUPD_CONF_OPTS += -Dbash_completion=false
+endif
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
