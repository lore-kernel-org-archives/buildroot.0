Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B18C433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 19:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D9F640590;
	Fri, 28 Jan 2022 19:20:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oYRD2OESfdpn; Fri, 28 Jan 2022 19:20:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E14C8405B4;
	Fri, 28 Jan 2022 19:19:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D5FFF1BF345
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 19:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D199360C24
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 19:19:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pHJ_q7I4k4nk for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 19:19:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA64860C17
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 19:19:56 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id s1so6280716ilj.7
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 11:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CE02jhS7+VCt1ryB8vYj2egtbWXbrvrQJwKSG5hl1pQ=;
 b=n1mTTcLSgvDVvrtPF6dowF4YuBJ/QixgtKE/VDtL7dAqYaMsf6mJE4ZvpVlGMMFLV4
 9ndC3e0oV7ELvpXhQNNQilNN6pd0cAVo/Sp/EXrDME0gXP+De6N8OppCe8cDj2zPmyyd
 LauzBFC9qXY8GDQrFBV/DNJc/T7SuOD92DATPWxgR7a0zTjW8XuktCS1yUwa38fAeDcn
 IKKx1jskJXXWeoXfySxY4qI4jXuhjZQvvkUQiwP/Mz2G6mGWk2ZFZYTHSy54ovtt7UnY
 JH3fgrIIzAGDyV6PO7Zdu2kuxDr3JbjtnM+zaSFphDjkYUrJETdsDL9XvQ8CoZAoAaFx
 I9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CE02jhS7+VCt1ryB8vYj2egtbWXbrvrQJwKSG5hl1pQ=;
 b=xAw9iXkeBpa0q9jc/uMBfkXUHOOg9+wdhla4LYEYUL2G/ZYqj1kYQzOH7rscALcwLV
 iC0u7ccMVVIRfcNVzQ8QHomTu5LILbJoUCucW5OVR56lAg1UDY/H2dV5o9Qd5hF3M/d8
 doFPdZuc/FMVihPvV5GVfUvJtzxbkAsOdqt6AsJT/5/js26m3tLd+1RihJQ270Yl743h
 RQaDYI0XTWtYqd0ctkQUkNvE6fUcp97Rk1OSxjR9FzECc8RNAZLTYTKz/DSaev+yzRpJ
 lmFXANAOC6Rq0tAooZ5XlgsKWtS/jEXSItpXmee7uLOzvFKaRvIINQKofoQkQL2q54c0
 b7mg==
X-Gm-Message-State: AOAM532eml5H/a95R8x1DaXTguuAVyj7rVjrvMs5odrykkjVwy3X0HF4
 FW/NC5ZpVNpfIqP1QVKDa+jgLchacVI=
X-Google-Smtp-Source: ABdhPJwfF4EaPqy3QxJndEsxV00OHBO2YgIQykfn50CXuW8ZdGYfuyNSqAMQXRvy8htaCtl+obROQA==
X-Received: by 2002:a05:6e02:1687:: with SMTP id
 f7mr7008388ila.182.1643397595502; 
 Fri, 28 Jan 2022 11:19:55 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id k5sm4000081ilr.7.2022.01.28.11.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 11:19:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 12:19:52 -0700
Message-Id: <20220128191952.2776015-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/network-manager: migrate
 autotools build system to meson
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

We need to add dbus as a build dependency since the meson build system
uses dbus pkg-config to determine install locations.

The meson build also requires mobile-broadband-info in order to get
the database pkg-config variable.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - add comments on new dependencies
---
 package/network-manager/Config.in          |   1 +
 package/network-manager/network-manager.mk | 100 ++++++++++-----------
 2 files changed, 48 insertions(+), 53 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index a48cb37b15..da1a7d79b3 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -40,6 +40,7 @@ config BR2_PACKAGE_NETWORK_MANAGER_TUI
 config BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER
 	bool "modem-manager support"
 	select BR2_PACKAGE_MODEM_MANAGER
+	select BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO
 	help
 	  This option enables support for ModemManager
 
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 974320fce0..290333e16c 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -9,7 +9,7 @@ NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).12
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
-NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev gnutls libglib2 \
+NETWORK_MANAGER_DEPENDENCIES = host-pkgconf dbus udev gnutls libglib2 \
 	libgcrypt wireless_tools util-linux host-intltool libndp
 NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.1+ (libnm)
 NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.LGPL CONTRIBUTING.md
@@ -17,129 +17,123 @@ NETWORK_MANAGER_CPE_ID_VENDOR = gnome
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
 else
-NETWORK_MANAGER_CONF_OPTS += --without-iwd
+NETWORK_MANAGER_CONF_OPTS += -Diwd=false
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
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 NETWORK_MANAGER_DEPENDENCIES += readline
-NETWORK_MANAGER_CONF_OPTS += --with-nmcli
+NETWORK_MANAGER_CONF_OPTS += -Dnmcli=true
 else
-NETWORK_MANAGER_CONF_OPTS += --without-nmcli
+NETWORK_MANAGER_CONF_OPTS += -Dnmcli=false
 endif
 
 define NETWORK_MANAGER_INSTALL_INIT_SYSV
@@ -152,4 +146,4 @@ define NETWORK_MANAGER_INSTALL_INIT_SYSTEMD
 
 endef
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
