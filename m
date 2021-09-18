Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2417C433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:30:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37B81610E9
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:30:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 37B81610E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.buildroot.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13B7E4066F;
	Sat, 18 Sep 2021 20:30:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L_ZyRAp3-WZT; Sat, 18 Sep 2021 20:30:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B37F41633;
	Sat, 18 Sep 2021 20:30:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A246C1BF27C
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E6A560643
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:30:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F-1ZViua95Nb for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 20:30:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DFA66059C
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 20:30:30 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id j13so43854593edv.13
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 13:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=XW7+cPFjW+V2vtFmNFqC01UvqY66QjYiVGtt8VHrCQE=;
 b=kkKdS9P5Ug9ChBrIOM430l501ZjH/8PKD0xKjPRrgGa5AT59DyCC4S3DIMOAUaIqRy
 9jprcwSRH0wG2eqfu5PkcNp4LN7i3Th2mhglsIip14BgBkASB+mkkjYVMvV51Bx12gqH
 1+u918NejM3+l7NF2YkU1iOY09436ZpE/yYAENcNHZWvGZDfXdu2B5jAcJRTcXw8LZl8
 zTNRgtzLywEizDF0yiwFLG54J14IFBOQwO9K6R42NlmIMQggtJVXcflPELIuaMD0UyTi
 q+WIQddejzloBxfwyItPlIRfPipeaOer6n7qtaCg/7NoUtFHD2vi/V3pCBSLAQFkuMAT
 SP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=XW7+cPFjW+V2vtFmNFqC01UvqY66QjYiVGtt8VHrCQE=;
 b=Rwsrr3XxZWzNtT/R3OZt9RW4GT+ZD7bVOacr3zmfY6bcaqjbP0ReTU63w55bqWWiLb
 Yd5wrHunJH+EfC+WD7WTwFX6Nt6p9sPkLgFDWTLZ8b6kzu2rkJGC+iozQkbX4oKrBoVc
 E2IUAd5U79oDAcdDKUVr4MX9tUZHy702abgblqsvKM1bfJawDC9I8EW0n5uOwzCwtQV8
 YUUUASYAVU4C+YK7crRD/FjQbMFjk+b1zJU10dBAP1C6uLuT9i/vlhrpGXvTcJ0/+HQe
 e3Js7/pC3x4hyA+bKBJzLRUndFBXBYpUy1IeNsbDUMGEq+hRMwPtI8fnYBFuNzu7rC31
 fxsQ==
X-Gm-Message-State: AOAM532yhwwXao7SCqMvBC35iovZMhbAU8YYYAwuEUP1eNM21ceSnuhQ
 9duGqTzIhz7a/GJxg81xcMZJSM+ANXA=
X-Google-Smtp-Source: ABdhPJzKLt43J8GvJxywbz3KAvXuEIneWo5eQbPi2Bxy3AkN1FJHOWoKkCZqtajxVrmCo0hT7eX8Mg==
X-Received: by 2002:a50:bb09:: with SMTP id y9mr20052712ede.89.1631997028441; 
 Sat, 18 Sep 2021 13:30:28 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202])
 by smtp.gmail.com with ESMTPSA id bj10sm4085237ejb.17.2021.09.18.13.30.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 18 Sep 2021 13:30:27 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 18 Sep 2021 22:30:23 +0200
Message-Id: <20210918203023.24093-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
Subject: [Buildroot] [PATCH] package/modem-manager: bump to version 1.18.2
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
From: yegorslists--- via buildroot <buildroot@lists.buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Aleksander Morgado <aleksander@aleksander.es>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

This release introduces meson build system support.

As meson files are only available in git, switch the location to
https://gitlab.freedesktop.org.

Add support for bash-completion.

dbus is now a build-time dependency.

Also add support for systemd and polkit and disable the manpage
generation.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/modem-manager/Config.in          |  2 +-
 package/modem-manager/modem-manager.hash |  2 +-
 package/modem-manager/modem-manager.mk   | 50 +++++++++++++++++-------
 3 files changed, 38 insertions(+), 16 deletions(-)

diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
index c4c723776d..d211d68ee1 100644
--- a/package/modem-manager/Config.in
+++ b/package/modem-manager/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_MODEM_MANAGER
 	depends on BR2_USE_WCHAR # libglib2 and gnutls
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus
-	select BR2_PACKAGE_DBUS # runtime dependency
+	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBGUDEV if BR2_PACKAGE_HAS_UDEV
 	help
diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index 14597215df..fb0ddec4a5 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  2ccf1f716c2d121e8e6709bcf8af29ee86971a90adacca2e8d6288b30278862e  ModemManager-1.16.10.tar.xz
+sha256  79e83f7082d02e72a5c5e7fdf9b67bd3dd71da0da3d02607dee76ae06b9d4aa9  ModemManager-1.18.2.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index a881edc272..7a7bd3bb4c 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,42 +4,64 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.16.10
-MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
-MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
+MODEM_MANAGER_VERSION = 1.18.2
+MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.bz2
+MODEM_MANAGER_SITE = https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/archive/$(MODEM_MANAGER_VERSION)
 MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
 MODEM_MANAGER_LICENSE_FILES = COPYING COPYING.LIB
 MODEM_MANAGER_SELINUX_MODULES = modemmanager
-MODEM_MANAGER_DEPENDENCIES = host-pkgconf libglib2 $(TARGET_NLS_DEPENDENCIES)
+MODEM_MANAGER_DEPENDENCIES = host-pkgconf libglib2 dbus $(TARGET_NLS_DEPENDENCIES)
 MODEM_MANAGER_INSTALL_STAGING = YES
-MODEM_MANAGER_CONF_OPTS = --disable-more-warnings
+
+MODEM_MANAGER_CONF_OPTS = -Dman=false
 
 ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQMI),y)
 MODEM_MANAGER_DEPENDENCIES += libqmi
-MODEM_MANAGER_CONF_OPTS += --with-qmi
+MODEM_MANAGER_CONF_OPTS += -Dqmi=enabled
+else
+MODEM_MANAGER_CONF_OPTS += -Dqmi=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+MODEM_MANAGER_DEPENDENCIES += systemd
+MODEM_MANAGER_CONF_OPTS += -Dsystemd_suspend_resume=true -Dsystemd_journal=true
+else
+MODEM_MANAGER_CONF_OPTS += -Dsystemdsystemunitdir=no -Dsystemd_suspend_resume=false -Dsystemd_journal=false
+endif
+
+ifeq ($(BR2_PACKAGE_POLKIT),y)
+MODEM_MANAGER_DEPENDENCIES += polkit
+MODEM_MANAGER_CONF_OPTS += -Dpolkit=strict
 else
-MODEM_MANAGER_CONF_OPTS += --without-qmi
+MODEM_MANAGER_CONF_OPTS += -Dpolkit=no
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
 MODEM_MANAGER_DEPENDENCIES += libgudev
-MODEM_MANAGER_CONF_OPTS += --with-udev
+MODEM_MANAGER_CONF_OPTS += -Dudev=enabled
 else
-MODEM_MANAGER_CONF_OPTS += --without-udev
+MODEM_MANAGER_CONF_OPTS += -Dudev=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBMBIM),y)
 MODEM_MANAGER_DEPENDENCIES += libmbim
-MODEM_MANAGER_CONF_OPTS += --with-mbim
+MODEM_MANAGER_CONF_OPTS += -Dmbim=enabled
 else
-MODEM_MANAGER_CONF_OPTS += --without-mbim
+MODEM_MANAGER_CONF_OPTS += -Dmbim=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 MODEM_MANAGER_DEPENDENCIES += gobject-introspection
-MODEM_MANAGER_CONF_OPTS += --enable-introspection
+MODEM_MANAGER_CONF_OPTS += -Dintrospection=enabled
+else
+MODEM_MANAGER_CONF_OPTS += -Dintrospection=disabled
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
@@ -47,4 +69,4 @@ define MODEM_MANAGER_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S44modem-manager
 endef
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
