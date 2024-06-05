Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB6EC25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 23:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD870849DB;
	Wed,  5 Jun 2024 23:41:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WHGHNnqHXQ-z; Wed,  5 Jun 2024 23:41:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E68AD849EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E68AD849EE;
	Wed,  5 Jun 2024 23:41:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 194FB1BF5A5
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 23:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 039954174D
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 23:41:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VKy0I6jX4d3P for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 23:41:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4E38A402F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E38A402F5
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E38A402F5
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 23:41:39 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-7e1fcd2662cso18842839f.2
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 16:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717630898; x=1718235698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lWxnywAIrIyIaA/oSlnKAUNCF93YzGpX2zPu+djuCvg=;
 b=XnKR+RCK9MmEaKg8eKSj785HPVQ1b85ixwB+TdmHnRw32dtXw6cfRzfXaR5hIZyTtg
 DkHjyj9E5dOBG24Ndq4baS2LZmcO3gJRiazS3HTdTiBifrv6bSdB+VJ+W0lKtdPVErHB
 WwS2XoPb3hH7Qb08qKHZ/3kZemrAjiq+2RpxuLDcfvEm9h3bwzhy4qtKHfP9KPUs50z6
 9S61tCu/Hy1LyyOGRMd9tmuj98ymRcjY30j5toFFQ2Z+yce7WQHS+pZaQ0j7GxsoOKF6
 xjcVqHGyIthvqrZb5S6y9XzoOkON2YsMIwlZt1qjjQFTpN+N0m5nE0XHMyJ5tODlUODC
 3z6w==
X-Gm-Message-State: AOJu0YzcGcQs1WnTOtjJkFE6l+E6MddaW6hS13F1yULth6+iPPx7dmgh
 ve8ps5yGPAtNpGiuwkyYwVJDPsC56s+gjT8VBcF+Oh7LnHFehI9llTgoukhY
X-Google-Smtp-Source: AGHT+IGNqNB5eW1DFldV25gcoC5mBs4QK/VD0lsaUQ7aXy0Yzwuhv6iJn1R/803Ez1gRqz4IcaIW2A==
X-Received: by 2002:a05:6602:2c91:b0:7e1:973b:fbfc with SMTP id
 ca18e2360f4ac-7eb3c8ff4b0mr452052639f.15.1717630897822; 
 Wed, 05 Jun 2024 16:41:37 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-7eb4c47d534sm4871139f.34.2024.06.05.16.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 16:41:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 17:41:31 -0600
Message-Id: <20240605234131.3370484-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240605234131.3370484-1-james.hilliard1@gmail.com>
References: <20240605234131.3370484-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717630898; x=1718235698; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lWxnywAIrIyIaA/oSlnKAUNCF93YzGpX2zPu+djuCvg=;
 b=OvhDFcuXB/gYGxcGW2Yg+7BzKWI9NpJtodI4mzKoeMT/5SAqpfP2Wjqqd0rAueldvr
 3MPTFhleSyhfkJuY80OmIRQee6D2TtHLrS5M0YnUqBUH2joFTnx9itiuuSOKURdgMI4I
 9PujEzNm8HYVSzG1g0k3HmAxFyVSOTdFZ1Hsw6F3Ai8lcwOF4Iyac8fZJfGMEggvwxNa
 h4qnqM+30mnwAPYYHiEIIu0UKkEimoel+rV+/OxW980nVL5CVypcQjb5v7Z0ge+oYr/Z
 4ugNAR9r3BHFtoF7o7Xo/Vf912f7FpGN/1OF/RtfXHob3J9Lktwtm+wH0LjVIE/6Aj2e
 T9pg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OvhDFcuX
Subject: [Buildroot] [PATCH 4/4] package/fwupd: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in        |   1 +
 package/fwupd/Config.in  |  19 ++++
 package/fwupd/fwupd.hash |   3 +
 package/fwupd/fwupd.mk   | 208 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 231 insertions(+)
 create mode 100644 package/fwupd/Config.in
 create mode 100644 package/fwupd/fwupd.hash
 create mode 100644 package/fwupd/fwupd.mk

diff --git a/package/Config.in b/package/Config.in
index 2be39f98c7..02ca6472d2 100644
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
index 0000000000..b7497707f5
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
+	-Doffline=enabled \
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
+FWUPD_CONF_OPTS += -Dsystemd=enabled -Delogind=enabled
+else
+FWUPD_CONF_OPTS += -Dsystemd=disabled -Delogind=disabled
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
