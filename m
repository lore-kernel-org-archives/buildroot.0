Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBD6C433F5
	for <buildroot@archiver.kernel.org>; Wed,  1 Dec 2021 09:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0A9B60719;
	Wed,  1 Dec 2021 09:37:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QGghdMoWkhpD; Wed,  1 Dec 2021 09:37:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E05CA60705;
	Wed,  1 Dec 2021 09:37:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 219931BF59F
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 09:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10F53408F1
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 09:37:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PRCvbqfX4KgO for <buildroot@lists.busybox.net>;
 Wed,  1 Dec 2021 09:37:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00CE9408E9
 for <buildroot@buildroot.org>; Wed,  1 Dec 2021 09:37:29 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id h16so23643779ila.4
 for <buildroot@buildroot.org>; Wed, 01 Dec 2021 01:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oHWLBTEJKW4zn4KoA0jPuGWCZ0HpK/vD4eEQyz1XDAM=;
 b=BiNvuE8iFn9fzNWSnQWRDdh/iC+ADFeOQIPNhiNGfGoeVP3qcPQHT//NlE2Ap0q9pP
 wYn30fMqnNRy85fmXkTYJyXriL6tLG3in7eezBv12Km8NuUz7jZdvfO1gShBqfQyyK03
 Yc5mL6usyxS2x2AsjUFAf+SRXFpNRbg18+B7XS/zjES2FYKFJ59x/cXtmNnRvTPnhbbN
 NBdz+JmpFoQD+VbXKCAiNDinUYhGFCli7LaYdptqt6tXcpf6giAG3mJZ16FQ173BRQ4G
 HIP+o+9SK3/cKD2XA87E/R4v4rBTF40goTLX9/wKtVsur1sbJvg9iV1YwOiz8qyIYcrN
 cSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oHWLBTEJKW4zn4KoA0jPuGWCZ0HpK/vD4eEQyz1XDAM=;
 b=E0nNIii3D+Pv132RaYg8whwQhfruRCpEbukRXgK/pGPiQUe/w+d8NIMFv2ihUhvUqc
 nbLNGV3FFS1KPSZH1ej5ABEyeHqAyxo5Z4JEeamOteWAqdhjEGm/wHRjHtchlxlwFzA4
 HzhI6dA//OhIMw7FVPvKJP5H2hIPep5ZGrVJ5icnuwwZRfxm1fvChFjmWhl1BiHVZQrL
 1/Ja+uQvIUEvQ9h0bEb5wAorgJqNXoj/X38Pru2Meyq5O/lFy93QbOfaQRq7k5MS+NV0
 lxLWwKwKaCVLk9FMF2KeX3w4Q2IANkXW4ii841KVNpy3JGq/amQjOCS6FnuPm0zfZDyc
 PBJg==
X-Gm-Message-State: AOAM5327gWZxHcgc+MHhTIRPtIx1fJh9pem1AQGMrAUKB/PSf/Z5DU91
 BGU3H0Hh2FKVCdiSV7bo5ALqpF/9caU=
X-Google-Smtp-Source: ABdhPJyjZvhrwOnOh7f/02kqOVEdpSERyX3jvwLWfWx+LObDqTjhmSJW32fTXjGiuXPq6TE69T7l3g==
X-Received: by 2002:a05:6e02:b45:: with SMTP id
 f5mr7047646ilu.118.1638351448895; 
 Wed, 01 Dec 2021 01:37:28 -0800 (PST)
Received: from james-x399.localdomain (71-33-128-47.hlrn.qwest.net.
 [71.33.128.47])
 by smtp.gmail.com with ESMTPSA id g1sm4663660ild.52.2021.12.01.01.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 01:37:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 Dec 2021 02:37:27 -0700
Message-Id: <20211201093727.67883-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/network-manager: bump to version
 1.32.12
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
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate autotools build system to meson.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/network-manager/Config.in            |   1 +
 package/network-manager/network-manager.hash |   4 +-
 package/network-manager/network-manager.mk   | 117 +++++++++++++------
 3 files changed, 86 insertions(+), 36 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 43987451b6..2392d26d7f 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -41,6 +41,7 @@ config BR2_PACKAGE_NETWORK_MANAGER_TUI
 config BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER
 	bool "modem-manager support"
 	select BR2_PACKAGE_MODEM_MANAGER
+	select BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO
 	help
 	  This option enables support for ModemManager
 
diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index c9d4826a0b..b007a6e88e 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/NetworkManager/1.32/NetworkManager-1.32.2.sha256sum
-sha256  701d511067f757d0f92f412c98cdb49a74a6ba69448aabb1beadacbc171e3873  NetworkManager-1.32.2.tar.xz
+# From https://download.gnome.org/sources/NetworkManager/1.32/NetworkManager-1.32.12.sha256sum
+sha256  a8ab36a0a502fe73cd8e3bacb6585f97fbb94ebef79e276cdbaf11c33ff8f54b  NetworkManager-1.32.12.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index fbd5b1c85c..ac21257671 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -5,11 +5,11 @@
 ################################################################################
 
 NETWORK_MANAGER_VERSION_MAJOR = 1.32
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).12
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
-NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev gnutls libglib2 \
+NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev dbus gnutls libglib2 \
 	libgcrypt wireless_tools util-linux host-intltool readline libndp
 NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.1+ (libnm)
 NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.LGPL CONTRIBUTING.md
@@ -17,72 +17,121 @@ NETWORK_MANAGER_CPE_ID_VENDOR = gnome
 NETWORK_MANAGER_CPE_ID_PRODUCT = networkmanager
 NETWORK_MANAGER_SELINUX_MODULES = networkmanager
 
-NETWORK_MANAGER_CONF_ENV = \
-	ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
-	ac_cv_file__etc_fedora_release=no \
-	ac_cv_file__etc_mandriva_release=no \
-	ac_cv_file__etc_debian_version=no \
-	ac_cv_file__etc_redhat_release=no \
-	ac_cv_file__etc_SuSE_release=no
-
 NETWORK_MANAGER_CONF_OPTS = \
-	--disable-introspection \
-	--disable-tests \
-	--disable-qt \
-	--disable-more-warnings \
-	--with-crypto=gnutls \
-	--with-iptables=/usr/sbin/iptables \
-	--disable-ifupdown \
-	--without-nm-cloud-setup
+	-Ddocs=false \
+	-Dtests=no \
+	-Dqt=false \
+	-Dcrypto=gnutls \
+	-Diptables=/usr/sbin/iptables \
+	-Difupdown=false \
+	-Dnm_cloud_setup=false \
+	-Dsession_tracking_consolekit=false
+
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+NETWORK_MANAGER_DEPENDENCIES += gobject-introspection
+NETWORK_MANAGER_CONF_OPTS += -Dintrospection=true
+else
+NETWORK_MANAGER_CONF_OPTS += -Dintrospection=false
+endif
 
 ifeq ($(BR2_PACKAGE_OFONO),y)
 NETWORK_MANAGER_DEPENDENCIES += ofono
-NETWORK_MANAGER_CONF_OPTS += --with-ofono
+NETWORK_MANAGER_CONF_OPTS += -Dofono=true
 else
-NETWORK_MANAGER_CONF_OPTS += --without-ofono
+NETWORK_MANAGER_CONF_OPTS += -Dofono=false
+endif
+
+ifeq ($(BR2_PACKAGE_IWD),y)
+NETWORK_MANAGER_DEPENDENCIES += iwd
+NETWORK_MANAGER_CONF_OPTS += -Diwd=true
+else
+NETWORK_MANAGER_CONF_OPTS += -Diwd=false
+endif
+
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+NETWORK_MANAGER_DEPENDENCIES += audit
+NETWORK_MANAGER_CONF_OPTS += -Dlibaudit=yes
+else
+NETWORK_MANAGER_CONF_OPTS += -Dlibaudit=no
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 NETWORK_MANAGER_DEPENDENCIES += libcurl
-NETWORK_MANAGER_CONF_OPTS += --enable-concheck
+NETWORK_MANAGER_CONF_OPTS += -Dconcheck=true
+else
+NETWORK_MANAGER_CONF_OPTS += -Dconcheck=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPSL),y)
+NETWORK_MANAGER_DEPENDENCIES += libpsl
+NETWORK_MANAGER_CONF_OPTS += -Dlibpsl=true
+else
+NETWORK_MANAGER_CONF_OPTS += -Dlibpsl=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+NETWORK_MANAGER_DEPENDENCIES += libselinux
+NETWORK_MANAGER_CONF_OPTS += -Dselinux=true
 else
-NETWORK_MANAGER_CONF_OPTS += --disable-concheck
+NETWORK_MANAGER_CONF_OPTS += -Dselinux=false
 endif
 
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_TUI),y)
 NETWORK_MANAGER_DEPENDENCIES += newt
-NETWORK_MANAGER_CONF_OPTS += --with-nmtui=yes
+NETWORK_MANAGER_CONF_OPTS += -Dnmtui=true
 else
-NETWORK_MANAGER_CONF_OPTS += --with-nmtui=no
+NETWORK_MANAGER_CONF_OPTS += -Dnmtui=false
 endif
 
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_PPPD),y)
 NETWORK_MANAGER_DEPENDENCIES += pppd
-NETWORK_MANAGER_CONF_OPTS += --enable-ppp
+NETWORK_MANAGER_CONF_OPTS += -Dppp=true
 else
-NETWORK_MANAGER_CONF_OPTS += --disable-ppp
+NETWORK_MANAGER_CONF_OPTS += -Dppp=false
 endif
 
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER),y)
-NETWORK_MANAGER_DEPENDENCIES += modem-manager
-NETWORK_MANAGER_CONF_OPTS += --with-modem-manager-1
+NETWORK_MANAGER_DEPENDENCIES += modem-manager mobile-broadband-provider-info
+NETWORK_MANAGER_CONF_OPTS += -Dmodem_manager=true
+else
+NETWORK_MANAGER_CONF_OPTS += -Dmodem_manager=false
+endif
+
+ifeq ($(BR2_PACKAGE_POLKIT),y)
+NETWORK_MANAGER_DEPENDENCIES += polkit
+NETWORK_MANAGER_CONF_OPTS += -Dpolkit=true
+else
+NETWORK_MANAGER_CONF_OPTS += -Dpolkit=false
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+NETWORK_MANAGER_DEPENDENCIES += systemd
+NETWORK_MANAGER_CONF_OPTS += \
+	-Dsystemd_journal=true \
+	-Dconfig_logging_backend_default=journal \
+	-Dsession_tracking=systemd \
+	-Dsuspend_resume=systemd
 else
-NETWORK_MANAGER_CONF_OPTS += --without-modem-manager-1
+NETWORK_MANAGER_CONF_OPTS += \
+	-Dsystemd_journal=false \
+	-Dconfig_logging_backend_default=syslog \
+	-Dsession_tracking=no \
+	-Dsuspend_resume=upower
 endif
 
 ifeq ($(BR2_PACKAGE_DHCP_CLIENT),y)
-NETWORK_MANAGER_CONF_OPTS += --with-dhclient=/sbin/dhclient
+NETWORK_MANAGER_CONF_OPTS += -Ddhclient=/sbin/dhclient
 endif
 
 ifeq ($(BR2_PACKAGE_DHCPCD),y)
-NETWORK_MANAGER_CONF_OPTS += --with-dhcpcd=/sbin/dhcpcd
+NETWORK_MANAGER_CONF_OPTS += -Ddhcpcd=/sbin/dhcpcd
 endif
 
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_OVS),y)
-NETWORK_MANAGER_CONF_OPTS += --enable-ovs
+NETWORK_MANAGER_CONF_OPTS += -Dovs=true
 NETWORK_MANAGER_DEPENDENCIES += jansson
 else
-NETWORK_MANAGER_CONF_OPTS += --disable-ovs
+NETWORK_MANAGER_CONF_OPTS += -Dovs=false
 endif
 
 define NETWORK_MANAGER_INSTALL_INIT_SYSV
@@ -95,4 +144,4 @@ define NETWORK_MANAGER_INSTALL_INIT_SYSTEMD
 
 endef
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
