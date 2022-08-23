Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDEEC6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D5526FB28;
	Sun, 11 Sep 2022 09:16:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D5526FB28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b_RB-Z5XOP85; Sun, 11 Sep 2022 09:16:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 334A96FB09;
	Sun, 11 Sep 2022 09:16:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 334A96FB09
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 307791BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75C2B81325
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75C2B81325
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P9iFoKTMO5IG for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0E0D83ED9
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0E0D83ED9
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 919BD83518; Sun, 11 Sep 2022 08:48:26 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 22:35:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 85f7d623d6867c3fecf182412002acedbbb1b3d9
X-Git-Newrev: 58c58466319a7864441dc6c70e880165db79ead0
X-Patchwork-Hint: ignore
Message-Id: <20220911084826.919BD83518@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager: migrate autotools
 build system to meson
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

commit: https://git.buildroot.net/buildroot/commit/?id=58c58466319a7864441dc6c70e880165db79ead0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to add dbus as a build dependency since the meson build system
uses dbus pkg-config to determine install locations.

The meson build also requires mobile-broadband-info in order to get
the database pkg-config variable.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/network-manager/Config.in          |   1 +
 package/network-manager/network-manager.mk | 106 ++++++++++++++---------------
 2 files changed, 51 insertions(+), 56 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 1a11fc4270..1f56daa187 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -43,6 +43,7 @@ config BR2_PACKAGE_NETWORK_MANAGER_CLI
 config BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER
 	bool "modem-manager support"
 	select BR2_PACKAGE_MODEM_MANAGER
+	select BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO
 	help
 	  This option enables support for ModemManager
 
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 92997d1cb6..d782370082 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -9,7 +9,7 @@ NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).4
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
-NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev gnutls libglib2 \
+NETWORK_MANAGER_DEPENDENCIES = host-pkgconf dbus udev gnutls libglib2 \
 	host-intltool libndp util-linux
 NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.1+ (libnm)
 NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.LGPL CONTRIBUTING.md
@@ -17,136 +17,130 @@ NETWORK_MANAGER_CPE_ID_VENDOR = gnome
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
+	-Dintrospection=false \
+	-Ddocs=false \
+	-Dtests=no \
+	-Dqt=false \
+	-Dcrypto=gnutls \
+	-Diptables=/usr/sbin/iptables \
+	-Difupdown=false \
+	-Dnm_cloud_setup=false \
+	-Dsession_tracking_consolekit=false
 
 ifeq ($(BR2_PACKAGE_AUDIT),y)
 NETWORK_MANAGER_DEPENDENCIES += audit
-NETWORK_MANAGER_CONF_OPTS += --with-libaudit
+NETWORK_MANAGER_CONF_OPTS += -Dlibaudit=yes
 else
-NETWORK_MANAGER_CONF_OPTS += --without-libaudit
+NETWORK_MANAGER_CONF_OPTS += -Dlibaudit=no
 endif
 
 ifeq ($(BR2_PACKAGE_DHCP_CLIENT),y)
-NETWORK_MANAGER_CONF_OPTS += --with-dhclient=/sbin/dhclient
+NETWORK_MANAGER_CONF_OPTS += -Ddhclient=/sbin/dhclient
 endif
 
 ifeq ($(BR2_PACKAGE_DHCPCD),y)
-NETWORK_MANAGER_CONF_OPTS += --with-dhcpcd=/sbin/dhcpcd
+NETWORK_MANAGER_CONF_OPTS += -Ddhcpcd=/sbin/dhcpcd
 endif
 
 ifeq ($(BR2_PACKAGE_IWD),y)
 NETWORK_MANAGER_DEPENDENCIES += iwd
-NETWORK_MANAGER_CONF_OPTS += --with-iwd
+NETWORK_MANAGER_CONF_OPTS += -Diwd=true
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT),y)
-NETWORK_MANAGER_CONF_OPTS += --with-config-wifi-backend-default=wpa_supplicant
+NETWORK_MANAGER_CONF_OPTS += -Dconfig_wifi_backend_default=wpa_supplicant
 else
-NETWORK_MANAGER_CONF_OPTS += --with-config-wifi-backend-default=iwd
+NETWORK_MANAGER_CONF_OPTS += -Dconfig_wifi_backend_default=iwd
 endif
 else
 NETWORK_MANAGER_CONF_OPTS += \
-	--without-iwd \
-	--with-config-wifi-backend-default=wpa_supplicant
+	-Diwd=false \
+	-Dconfig_wifi_backend_default=wpa_supplicant
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 NETWORK_MANAGER_DEPENDENCIES += libcurl
-NETWORK_MANAGER_CONF_OPTS += --enable-concheck
+NETWORK_MANAGER_CONF_OPTS += -Dconcheck=true
 else
-NETWORK_MANAGER_CONF_OPTS += --disable-concheck
+NETWORK_MANAGER_CONF_OPTS += -Dconcheck=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPSL),y)
 NETWORK_MANAGER_DEPENDENCIES += libpsl
-NETWORK_MANAGER_CONF_OPTS += --with-libpsl
+NETWORK_MANAGER_CONF_OPTS += -Dlibpsl=true
 else
-NETWORK_MANAGER_CONF_OPTS += --without-libpsl
+NETWORK_MANAGER_CONF_OPTS += -Dlibpsl=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 NETWORK_MANAGER_DEPENDENCIES += libselinux
-NETWORK_MANAGER_CONF_OPTS += --with-selinux
+NETWORK_MANAGER_CONF_OPTS += -Dselinux=true
 else
-NETWORK_MANAGER_CONF_OPTS += --without-selinux
+NETWORK_MANAGER_CONF_OPTS += -Dselinux=false
 endif
 
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER),y)
-NETWORK_MANAGER_DEPENDENCIES += modem-manager
-NETWORK_MANAGER_CONF_OPTS += --with-modem-manager-1
+NETWORK_MANAGER_DEPENDENCIES += modem-manager mobile-broadband-provider-info
+NETWORK_MANAGER_CONF_OPTS += -Dmodem_manager=true
 else
-NETWORK_MANAGER_CONF_OPTS += --without-modem-manager-1
+NETWORK_MANAGER_CONF_OPTS += -Dmodem_manager=false
 endif
 
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_OVS),y)
-NETWORK_MANAGER_CONF_OPTS += --enable-ovs
+NETWORK_MANAGER_CONF_OPTS += -Dovs=true
 NETWORK_MANAGER_DEPENDENCIES += jansson
 else
-NETWORK_MANAGER_CONF_OPTS += --disable-ovs
+NETWORK_MANAGER_CONF_OPTS += -Dovs=false
 endif
 
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_PPPD),y)
 NETWORK_MANAGER_DEPENDENCIES += pppd
-NETWORK_MANAGER_CONF_OPTS += --enable-ppp
+NETWORK_MANAGER_CONF_OPTS += -Dppp=true
 else
-NETWORK_MANAGER_CONF_OPTS += --disable-ppp
+NETWORK_MANAGER_CONF_OPTS += -Dppp=false
 endif
 
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_TUI),y)
 NETWORK_MANAGER_DEPENDENCIES += newt
-NETWORK_MANAGER_CONF_OPTS += --with-nmtui
+NETWORK_MANAGER_CONF_OPTS += -Dnmtui=true
 else
-NETWORK_MANAGER_CONF_OPTS += --without-nmtui
+NETWORK_MANAGER_CONF_OPTS += -Dnmtui=false
 endif
 
 ifeq ($(BR2_PACKAGE_OFONO),y)
 NETWORK_MANAGER_DEPENDENCIES += ofono
-NETWORK_MANAGER_CONF_OPTS += --with-ofono
+NETWORK_MANAGER_CONF_OPTS += -Dofono=true
 else
-NETWORK_MANAGER_CONF_OPTS += --without-ofono
+NETWORK_MANAGER_CONF_OPTS += -Dofono=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 NETWORK_MANAGER_DEPENDENCIES += systemd
 NETWORK_MANAGER_CONF_OPTS += \
-	--with-systemd-journal \
-	--with-config-logging-backend-default=journal \
-	--with-session-tracking=systemd \
-	--with-suspend-resume=systemd
+	-Dsystemd_journal=true \
+	-Dconfig_logging_backend_default=journal \
+	-Dsession_tracking=systemd \
+	-Dsuspend_resume=systemd
 else
 NETWORK_MANAGER_CONF_OPTS += \
-	--without-systemd-journal \
-	--with-config-logging-backend-default=syslog \
-	--without-session-tracking \
-	--with-suspend-resume=upower
+	-Dsystemd_journal=false \
+	-Dconfig_logging_backend_default=syslog \
+	-Dsession_tracking=no \
+	-Dsuspend_resume=upower \
+	-Dsystemdsystemunitdir=no
 endif
 
 ifeq ($(BR2_PACKAGE_POLKIT),y)
 NETWORK_MANAGER_DEPENDENCIES += polkit
-NETWORK_MANAGER_CONF_OPTS += --enable-polkit
+NETWORK_MANAGER_CONF_OPTS += -Dpolkit=true
 else
-NETWORK_MANAGER_CONF_OPTS += --disable-polkit
+NETWORK_MANAGER_CONF_OPTS += -Dpolkit=false
 endif
 
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_CLI),y)
 NETWORK_MANAGER_DEPENDENCIES += readline
-NETWORK_MANAGER_CONF_OPTS += --with-nmcli
+NETWORK_MANAGER_CONF_OPTS += -Dnmcli=true
 else
-NETWORK_MANAGER_CONF_OPTS += --without-nmcli
+NETWORK_MANAGER_CONF_OPTS += -Dnmcli=false
 endif
 
 define NETWORK_MANAGER_INSTALL_INIT_SYSV
@@ -159,4 +153,4 @@ define NETWORK_MANAGER_INSTALL_INIT_SYSTEMD
 
 endef
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
