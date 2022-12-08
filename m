Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2328EC4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 07:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9713F4185E;
	Thu,  8 Dec 2022 07:29:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9713F4185E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lieoq2lfxUJ8; Thu,  8 Dec 2022 07:29:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60F0241863;
	Thu,  8 Dec 2022 07:29:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60F0241863
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F7681BF41D
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 07:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1781A80D18
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 07:29:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1781A80D18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wb69zcBC0Z2z for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 07:29:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C846A80BFA
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C846A80BFA
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 07:29:23 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id fc4so1787775ejc.12
 for <buildroot@buildroot.org>; Wed, 07 Dec 2022 23:29:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jRBouBqoCFRqTfrLCbDe9s/3dOdVlwbsAcKWj4jQogU=;
 b=dvuiDrJdlx4SQBHtSTyxMs2JL6PyecEidESfmDaj6YWiSoFw78zRsYwaWZUYr5YqeT
 lLGum2sZrWZ/LkuQLH2gOl8plXUmri4kcQ7fIBPBTAwxBIr2HXknTDk/58e8CKmJhawk
 vSYdL9DdNNwV3Mzj/SUVz9DMqyR/TLBrSJ0OuFzdOKdgUyriJC76f7DDO4QYr7FUjuGt
 uxKofoIMZWwrkjyZcwOhb3EUfXRSzbTQybXPn2LAgRnM7M//7tM8hm3IRnlimmrrnfWA
 Uan9NZM3NWkLJFEfBw3hi+6zJkSapGvl32rlZWt04twNa24aZwr47Pf0F5R9KJ6bUsld
 z0Xw==
X-Gm-Message-State: ANoB5pmEAKnxd/2ATOJi4UUd2IvzNuAjcLS6oicgUJGX1ZY9nGEFGile
 6YC/L4NdByjnSW98mkMC8rEX8333YCSBLw==
X-Google-Smtp-Source: AA0mqf77zcgTmL1PJw46NvFSxK9BWgyyILY/tsDew/7xe272G1dVC7nM15YPu0S6AOPpQoMpYAA++Q==
X-Received: by 2002:a17:906:2b46:b0:7c1:bb5:5704 with SMTP id
 b6-20020a1709062b4600b007c10bb55704mr1481910ejg.26.1670484561393; 
 Wed, 07 Dec 2022 23:29:21 -0800 (PST)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 vs19-20020a170907139300b007bee745759bsm9336300ejb.20.2022.12.07.23.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 23:29:20 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 08:28:46 +0100
Message-Id: <20221208072843.6806-3-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221208072843.6806-1-heiko.thiery@gmail.com>
References: <20221208072843.6806-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jRBouBqoCFRqTfrLCbDe9s/3dOdVlwbsAcKWj4jQogU=;
 b=T1kLQQmaq2AnjR88v1ZNCQwk+YXPONsAwLL2kbRmRvR3fKIs5IxfVZRySOpfEvEmRt
 pS47ONVGJH07PsSHMnN2qmG5Jw2TYKLm9K8W0r6alxZkb9mk66pk3tKLAARS6N+TwSOa
 TgI8yctP95nazGKMaUIq9r7DkZKh2cI80O1XPJrVdjfJQ/123uJo+fivRWkqRnn2wyCp
 nYETXal6Y+oZQVaZlhfdeKxW3VbdvzC9bJ2uDZ+GRicwKl2wGuPACDjhzys3fkvTUDpk
 C7RiiFAfxiQebyz1hSUhpI40gW5PGUZmPTcdI/hZomPKTJdqp1pWGHxCJRNlv3xMgnaF
 OuNQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=T1kLQQma
Subject: [Buildroot] [PATCH 3/3] package/modem-manager: bump version to
 1.20.2
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
 Heiko Thiery <heiko.thiery@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch package type to meson as the primary supported build system from now
on is meson and the autotools support as despricated.

The package tarball is no longer support, thus the MODEM_MANAGER_SOURCE
is changed to the gitlab archive URL.

All previously supported options are converted to the meson configuraiton
options and support for new ones is added.
The new options are: bash_completion, polkit, systemd, qrtr.

For building with libqmi support version 1.33.2 is required and for
libmbim version 1.28.2 is required.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/modem-manager/modem-manager.hash |  2 +-
 package/modem-manager/modem-manager.mk   | 72 ++++++++++++++++++------
 2 files changed, 55 insertions(+), 19 deletions(-)

diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index 40c8ad703f..e6967f8d62 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,4 +1,4 @@
 #Locally calculated after checking https://www.freedesktop.org/software/ModemManager/ModemManager-1.18.12.tar.xz.asc
-sha256  b464e4925d955a6ca86dd08616e763b26ae46d7fd37dbe281678e34065b1e430  ModemManager-1.18.12.tar.xz
+sha256  ba56aa764edc148f58348a589743cf1c1e27c55dcd7ebd820dcedd52fb8d7179  ModemManager-1.20.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index d0c9b7377b..8a0dbba3a4 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,42 +4,78 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.18.12
-MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
-MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
+MODEM_MANAGER_VERSION = 1.20.2
+MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.gz
+MODEM_MANAGER_SITE = https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/archive/$(MODEM_MANAGER_VERSION)
 MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
 MODEM_MANAGER_LICENSE_FILES = COPYING COPYING.LIB
 MODEM_MANAGER_SELINUX_MODULES = modemmanager
-MODEM_MANAGER_DEPENDENCIES = host-pkgconf libglib2 $(TARGET_NLS_DEPENDENCIES)
+MODEM_MANAGER_DEPENDENCIES = host-pkgconf dbus libglib2 $(TARGET_NLS_DEPENDENCIES) host-libxslt
 MODEM_MANAGER_INSTALL_STAGING = YES
-MODEM_MANAGER_CONF_OPTS = --disable-more-warnings
+MODEM_MANAGER_CONF_OPTS = \
+	-Dpowerd_suspend_resume=false \
+	-Dudevdir=/usr/lib/udev
 
-ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQMI),y)
-MODEM_MANAGER_DEPENDENCIES += libqmi
-MODEM_MANAGER_CONF_OPTS += --with-qmi
+ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
+MODEM_MANAGER_DEPENDENCIES += libgudev
+MODEM_MANAGER_CONF_OPTS += -Dudev=true
 else
-MODEM_MANAGER_CONF_OPTS += --without-qmi
+MODEM_MANAGER_CONF_OPTS += -Dudev=false
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
-MODEM_MANAGER_DEPENDENCIES += libgudev
-MODEM_MANAGER_CONF_OPTS += --with-udev
+ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQMI),y)
+MODEM_MANAGER_DEPENDENCIES += libqmi
+MODEM_MANAGER_CONF_OPTS += -Dqmi=true
 else
-MODEM_MANAGER_CONF_OPTS += --without-udev
+MODEM_MANAGER_CONF_OPTS += -Dqmi=false
 endif
 
 ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBMBIM),y)
 MODEM_MANAGER_DEPENDENCIES += libmbim
-MODEM_MANAGER_CONF_OPTS += --with-mbim
+MODEM_MANAGER_CONF_OPTS += -Dmbim=true
+else
+MODEM_MANAGER_CONF_OPTS += -Dmbim=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBQRTR_GLIB),y)
+MODEM_MANAGER_DEPENDENCIES += libqrtr-glib
+MODEM_MANAGER_CONF_OPTS += -Dqrtr=true
+else
+MODEM_MANAGER_CONF_OPTS += -Dqrtr=false
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+MODEM_MANAGER_DEPENDENCIES += systemd
+MODEM_MANAGER_CONF_OPTS += \
+	-Dsystemd_journal=true \
+	-Dsystemd_suspend_resume=true \
+	-Dsystemdsystemunitdir=/usr/lib/systemd/system
+else
+MODEM_MANAGER_CONF_OPTS += \
+	-Dsystemd_journal=false \
+	-Dsystemd_suspend_resume=false \
+	-Dsystemdsystemunitdir=no
+endif
+
+ifeq ($(BR2_PACKAGE_POLKIT),y)
+MODEM_MANAGER_DEPENDENCIES += polkit
+MODEM_MANAGER_CONF_OPTS += -Dpolkit=strict
 else
-MODEM_MANAGER_CONF_OPTS += --without-mbim
+MODEM_MANAGER_CONF_OPTS += -Dpolkit=no
 endif
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 MODEM_MANAGER_DEPENDENCIES += gobject-introspection
-MODEM_MANAGER_CONF_OPTS += --enable-introspection
+MODEM_MANAGER_CONF_OPTS += -Dintrospection=true
+else
+MODEM_MANAGER_CONF_OPTS += -Dintrospection=false
+endif
+
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+MODEM_MANAGER_DEPENDENCIES += bash-completion
+MODEM_MANAGER_CONF_OPTS += -Dbash_completion=true
 else
-MODEM_MANAGER_CONF_OPTS += --disable-introspection
+MODEM_MANAGER_CONF_OPTS += -Dbash_completion=false
 endif
 
 define MODEM_MANAGER_INSTALL_INIT_SYSV
@@ -47,4 +83,4 @@ define MODEM_MANAGER_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S44modem-manager
 endef
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
