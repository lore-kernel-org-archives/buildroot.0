Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3666C02187
	for <buildroot@archiver.kernel.org>; Thu, 16 Jan 2025 22:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7150B6FA92;
	Thu, 16 Jan 2025 22:16:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iX7JJn5rHctR; Thu, 16 Jan 2025 22:16:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 239256FA3F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 239256FA3F;
	Thu, 16 Jan 2025 22:16:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 34DBFB89
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 22:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1615D415F5
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 22:16:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gkmoOQH-LBfq for <buildroot@buildroot.org>;
 Thu, 16 Jan 2025 22:16:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 88490415E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88490415E4
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 88490415E4
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 22:16:40 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-84cdacbc373so49679939f.1
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 14:16:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737065799; x=1737670599;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u1SRDwiqiF7Gq3BbpeINVYtksMvsfUclemFDKUstNiU=;
 b=SfRehQRKLzrEc+WmyXf6ybmWOoUGKGC8FX0wJ/ObI8fCdLyDoB75NPU1T484UOkRf2
 UBr0JccdVSA44Nv0iQFwaLYhWbGNWPmkKARM2ga7hsZ33Z8a6YGZgq5Qvd58PGkbmxWM
 6/RlCUjoLoipYrGjfmv4QCYr5BVM2MO3Z3POfH9az7xAlTZ5TuEEHBfRVmXG0U0hr6nT
 0B14kJldQ2KKcGTej8lOZBvnlLlKIi9Q+3Fgff7YYq9K/F29ZT6R8UDNqlEDWEsph+2O
 1xAhO62sbAFQhqharbOaOnjfXe7vdwtIMIfBQV3cLaYaEDqE6NdBOQKVZ1lPR417QOMc
 SBoA==
X-Gm-Message-State: AOJu0YytMZoHI7bz3wptKBHSpg79NhRK8nsgYuDY01Aou7URfM9kUfmS
 W+IOZdP0LH9assYJRjmG6bd8G4I+ia0/cyXl6zMotm+BWHMMbc/M6/BdMN/c
X-Gm-Gg: ASbGncu5MAbLnxTe/ggs5d0Dw7MDETdsUwehzVkh5DMqZiEljQk5MLeV56OkrhVoraH
 Ooe8HCwy+Rc7EhRXwraaxIueH5lpNHFC8KiAWcOm/cXFatRvV2qdS+/85DYvOiJ1Byp1FxFTteT
 slsIrgyoUKSxbxh0mbM6ZD+Olm04+fuFKw/lMSAL4Phmid1IkzVTJYTKJFoG1kSdtKcVqnuZQ0q
 f8yAhDiKKUp3yg/QZX1d+h0wwAT6Q+lG5Hs9Ui8EiJy6jq4LT9CVAf3eDPRcyivIl0WMSpRpttz
 1mdcvn5NqQhsxj2RrajOsUqfR9E14g4=
X-Google-Smtp-Source: AGHT+IE13XGANA5gRernLe9uXJePaSExAYRoFaNORHnkHOmKvxcxJ8JUE4FsweW299a4kWrZjowpHQ==
X-Received: by 2002:a05:6602:134c:b0:847:37fe:e25b with SMTP id
 ca18e2360f4ac-851b62842eamr10937839f.11.1737065799046; 
 Thu, 16 Jan 2025 14:16:39 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea754964basm272301173.59.2025.01.16.14.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 14:16:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 16 Jan 2025 15:16:36 -0700
Message-Id: <20250116221636.2280438-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737065799; x=1737670599; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u1SRDwiqiF7Gq3BbpeINVYtksMvsfUclemFDKUstNiU=;
 b=Z1lDGqWMkbk/KQuuROBukgHgAKndONuj0UfElLVRJ6zStwG35tDuMZKpnJC0yKqV6b
 cjNt0QyvlgS536htMg4bC+xXMm2yxlqxnZ2SSi8FGStfIWhYz50gQgu5ICmcpJdJbOIp
 vqXlD30u7dB4r42Yi4Dxr+3uP8pvg5r3jKcTvMeRJOKWMRYnp4f/hnsDr22rbzhxokJ2
 Y/6dBecm00b3ey53te0hlVe6X/NcHHPtMQrxujMyffkAbBXxna62BtXYzE5X2HmEIAlP
 EOGDLdExMOXxjHJmpSkaJ+DAyeUEKEEWdhvONMXshAhHBuNnP0Nm9MEmm4tdoioYM6KG
 uaDw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Z1lDGqWM
Subject: [Buildroot] [PATCH 1/1] package/fwupd: bump to version 2.0.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop no longer required libgudev dependency.

Add new mandatory libusb dependency.

Add new optional libdrm config option.

Add new optional libblkid dependency and config option.

Add new optional valgrind dependency and config option.

Add new udev config option.

Add new vendor_metadata config option.

Add new umockdev_tests config option.

Add new systemd_syscall_filter config option.

Remove gusb config option.

Remove plugin_intel_spi config option.

Remove compat_cli config option.

Remove thinklmi_compat config option.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...devdir-when-gudev-support-is-enabled.patch |  35 ------
 package/fwupd/Config.in                       |   9 +-
 package/fwupd/fwupd.hash                      |   2 +-
 package/fwupd/fwupd.mk                        | 102 ++++++++----------
 4 files changed, 52 insertions(+), 96 deletions(-)
 delete mode 100644 package/fwupd/0001-Only-require-udevdir-when-gudev-support-is-enabled.patch

diff --git a/package/fwupd/0001-Only-require-udevdir-when-gudev-support-is-enabled.patch b/package/fwupd/0001-Only-require-udevdir-when-gudev-support-is-enabled.patch
deleted file mode 100644
index 0f14508516..0000000000
--- a/package/fwupd/0001-Only-require-udevdir-when-gudev-support-is-enabled.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From a784ef9b904778b511a6284f46d983906939de6c Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Thu, 18 Jul 2024 09:44:15 -0600
-Subject: [PATCH] Only require udevdir when gudev support is enabled
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-Upstream: https://github.com/fwupd/fwupd/commit/a784ef9b904778b511a6284f46d983906939de6c
----
- meson.build | 10 ++++++----
- 1 file changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 22282d73e..f49d08d29 100644
---- a/meson.build
-+++ b/meson.build
-@@ -273,10 +273,12 @@ if build_daemon
-   if not polkit.found()
-     warning('Polkit is disabled, the daemon will allow ALL client actions')
-   endif
--  udevdir = get_option('udevdir')
--  if udevdir == '' and host_machine.system() == 'linux'
--    udev = dependency('udev')
--    udevdir = udev.get_variable(pkgconfig: 'udevdir')
-+  if gudev.found()
-+    udevdir = get_option('udevdir')
-+    if udevdir == '' and host_machine.system() == 'linux'
-+      udev = dependency('udev')
-+      udevdir = udev.get_variable(pkgconfig: 'udevdir')
-+    endif
-   endif
- endif
- libm = cc.find_library('m', required: false)
--- 
-2.34.1
-
diff --git a/package/fwupd/Config.in b/package/fwupd/Config.in
index 6a96358e5b..778f59bbeb 100644
--- a/package/fwupd/Config.in
+++ b/package/fwupd/Config.in
@@ -2,11 +2,13 @@ config BR2_PACKAGE_FWUPD
 	bool "fwupd"
 	depends on !BR2_STATIC_LIBS # libxmlb
 	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	depends on BR2_USE_MMU # libglib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBJCAT
 	select BR2_PACKAGE_LIBXMLB
+	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_ZLIB
 	help
 	  Fwupd is a simple daemon to allow session software
@@ -14,6 +16,7 @@ config BR2_PACKAGE_FWUPD
 
 	  https://fwupd.org/
 
-comment "fwupd needs a toolchain w/ wchar, threads, dynamic library"
+comment "fwupd needs a toolchain w/ wchar, threads, dynamic library, gcc >= 4.9"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/fwupd/fwupd.hash b/package/fwupd/fwupd.hash
index 8da9dc3c66..f3a67508f2 100644
--- a/package/fwupd/fwupd.hash
+++ b/package/fwupd/fwupd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b86a2d7fe1b6cc0ac4f75f3351a78cb3c225880c9e20b932fa078ef472e9fcb2  fwupd-1.9.20.tar.xz
+sha256  73690175d0dd81849d729a0f247c69146ee9105c3c8c5d8428b64ad42d49b2f7  fwupd-2.0.3.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/fwupd/fwupd.mk b/package/fwupd/fwupd.mk
index 9283eb43aa..6846dea93f 100644
--- a/package/fwupd/fwupd.mk
+++ b/package/fwupd/fwupd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FWUPD_VERSION = 1.9.20
+FWUPD_VERSION = 2.0.3
 FWUPD_SITE = https://github.com/fwupd/fwupd/releases/download/$(FWUPD_VERSION)
 FWUPD_SOURCE = fwupd-$(FWUPD_VERSION).tar.xz
 FWUPD_LICENSE = LGPL-2.1+
@@ -14,6 +14,7 @@ FWUPD_DEPENDENCIES = \
 	host-python-jinja2 \
 	libglib2 \
 	libjcat \
+	libusb \
 	libxmlb \
 	zlib
 
@@ -24,34 +25,47 @@ FWUPD_CONF_OPTS = \
 	-Ddocs=disabled \
 	-Dlvfs=true \
 	-Dman=false \
-	-Dgusb=disabled \
 	-Dpassim=disabled \
 	-Dp2p_policy=none \
 	-Dcbor=disabled \
 	-Dplugin_acpi_phat=enabled \
+	-Dplugin_android_boot=enabled \
+	-Dplugin_bcm57xx=enabled \
 	-Dplugin_cfu=disabled \
+	-Dplugin_emmc=enabled \
 	-Dplugin_ep963x=enabled \
 	-Dplugin_fastboot=disabled \
+	-Dplugin_gpio=enabled \
+	-Dplugin_igsc=enabled \
+	-Dplugin_intel_me=enabled \
+	-Dplugin_kinetic_dp=enabled \
 	-Dplugin_logitech_bulkcontroller=disabled \
 	-Dplugin_logitech_scribe=disabled \
 	-Dplugin_logitech_tap=disabled \
+	-Dplugin_mediatek_scaler=enabled \
+	-Dplugin_mtd=enabled \
+	-Dplugin_nitrokey=enabled \
+	-Dplugin_nvme=enabled \
+	-Dplugin_parade_lspcon=enabled \
 	-Dplugin_pixart_rf=enabled \
+	-Dplugin_powerd=enabled \
+	-Dplugin_realtek_mst=enabled \
+	-Dplugin_scsi=enabled \
+	-Dplugin_synaptics_mst=enabled \
 	-Dplugin_tpm=disabled \
 	-Dplugin_uefi_capsule=enabled \
 	-Dplugin_uefi_capsule_splash=false \
-	-Dplugin_nitrokey=enabled \
-	-Dplugin_mtd=enabled \
-	-Dplugin_intel_me=enabled \
+	-Dplugin_uf2=enabled \
 	-Dplugin_upower=enabled \
-	-Dplugin_powerd=enabled \
 	-Dqubes=false \
 	-Dsupported_build=enabled \
 	-Dlaunchd=disabled \
 	-Dtests=false \
+	-Dumockdev_tests=disabled \
 	-Dmetainfo=true \
 	-Dfish_completion=false \
-	-Dcompat_cli=false \
-	-Dthinklmi_compat=false \
+	-Dudev=enabled \
+	-Dvendor_metadata=false \
 	-Dpython="$(HOST_DIR)/bin/python3"
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
@@ -68,41 +82,6 @@ else
 FWUPD_CONF_OPTS += -Dlibarchive=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
-FWUPD_DEPENDENCIES += libgudev
-FWUPD_CONF_OPTS += \
-	-Dgudev=enabled \
-	-Dplugin_android_boot=enabled \
-	-Dplugin_bcm57xx=enabled \
-	-Dplugin_emmc=enabled \
-	-Dplugin_gpio=enabled \
-	-Dplugin_igsc=enabled \
-	-Dplugin_kinetic_dp=enabled \
-	-Dplugin_parade_lspcon=enabled \
-	-Dplugin_realtek_mst=enabled \
-	-Dplugin_synaptics_mst=enabled \
-	-Dplugin_mediatek_scaler=enabled \
-	-Dplugin_scsi=enabled \
-	-Dplugin_nvme=enabled \
-	-Dplugin_uf2=enabled
-else
-FWUPD_CONF_OPTS += \
-	-Dgudev=disabled \
-	-Dplugin_android_boot=disabled \
-	-Dplugin_bcm57xx=disabled \
-	-Dplugin_emmc=disabled \
-	-Dplugin_gpio=disabled \
-	-Dplugin_igsc=disabled \
-	-Dplugin_kinetic_dp=disabled \
-	-Dplugin_parade_lspcon=disabled \
-	-Dplugin_realtek_mst=disabled \
-	-Dplugin_synaptics_mst=disabled \
-	-Dplugin_mediatek_scaler=disabled \
-	-Dplugin_scsi=disabled \
-	-Dplugin_nvme=disabled \
-	-Dplugin_uf2=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
 FWUPD_DEPENDENCIES += bluez5_utils
 FWUPD_CONF_OPTS += -Dbluez=enabled
@@ -134,20 +113,29 @@ endif
 ifeq ($(BR2_PACKAGE_XZ),y)
 FWUPD_DEPENDENCIES += xz
 FWUPD_CONF_OPTS += -Dlzma=enabled
-ifeq ($(BR2_i386)$(BR2_x86_64),y)
-FWUPD_CONF_OPTS += -Dplugin_intel_spi=true
 else
-FWUPD_CONF_OPTS += -Dplugin_intel_spi=false
+FWUPD_CONF_OPTS += -Dlzma=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBDRM_AMDGPU),y)
+FWUPD_DEPENDENCIES += libdrm
+FWUPD_CONF_OPTS += -Dlibdrm=enabled -Dplugin_amdgpu=enabled
+else
+FWUPD_CONF_OPTS += -Dlibdrm=disabled -Dplugin_amdgpu=disabled
 endif
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),y)
+FWUPD_DEPENDENCIES += util-linux
+FWUPD_CONF_OPTS += -Dblkid=enabled
 else
-FWUPD_CONF_OPTS += -Dlzma=disabled -Dplugin_intel_spi=false
+FWUPD_CONF_OPTS += -Dblkid=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_LIBDRM_AMDGPU)$(BR2_PACKAGE_LIBGUDEV),yy)
-FWUPD_DEPENDENCIES += libdrm libgudev
-FWUPD_CONF_OPTS += -Dplugin_amdgpu=enabled
+ifeq ($(BR2_PACKAGE_VALGRIND),y)
+FWUPD_DEPENDENCIES += valgrind
+FWUPD_CONF_OPTS += -Dvalgrind=enabled
 else
-FWUPD_CONF_OPTS += -Dplugin_amdgpu=disabled
+FWUPD_CONF_OPTS += -Dvalgrind=disabled
 endif
 
 ifeq ($(BR2_i386)$(BR2_x86_64),y)
@@ -156,8 +144,8 @@ else
 FWUPD_CONF_OPTS += -Dplugin_cpu=disabled -Dplugin_msr=disabled -Dhsi=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_LIBGUDEV),yy)
-FWUPD_DEPENDENCIES += gnutls libgudev
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+FWUPD_DEPENDENCIES += gnutls
 FWUPD_CONF_OPTS += -Dplugin_synaptics_rmi=enabled
 else
 FWUPD_CONF_OPTS += -Dplugin_synaptics_rmi=disabled
@@ -170,8 +158,8 @@ else
 FWUPD_CONF_OPTS += -Dplugin_redfish=disabled -Dcurl=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGUDEV)$(BR2_PACKAGE_LIBMBIM)$(BR2_PACKAGE_LIBQMI)$(BR2_PACKAGE_MODEM_MANAGER),yyyy)
-FWUPD_DEPENDENCIES += libgudev libmbim libqmi modem-manager
+ifeq ($(BR2_PACKAGE_LIBMBIM)$(BR2_PACKAGE_LIBQMI)$(BR2_PACKAGE_MODEM_MANAGER),yyyy)
+FWUPD_DEPENDENCIES += libmbim libqmi modem-manager
 FWUPD_CONF_OPTS += -Dplugin_modem_manager=enabled
 else
 FWUPD_CONF_OPTS += -Dplugin_modem_manager=disabled
@@ -186,9 +174,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 FWUPD_DEPENDENCIES += systemd
-FWUPD_CONF_OPTS += -Dsystemd=enabled -Delogind=enabled -Doffline=enabled
+FWUPD_CONF_OPTS += -Dsystemd=enabled -Dsystemd_syscall_filter=true -Delogind=enabled
 else
-FWUPD_CONF_OPTS += -Dsystemd=disabled -Delogind=disabled -Doffline=disabled
+FWUPD_CONF_OPTS += -Dsystemd=disabled -Dsystemd_syscall_filter=false -Delogind=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_FWUPD_EFI),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
