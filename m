Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A60C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 19:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DA8E4030A;
	Mon, 12 Dec 2022 19:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DA8E4030A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3o4ai9zTGrnM; Mon, 12 Dec 2022 19:36:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A755C408FD;
	Mon, 12 Dec 2022 19:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A755C408FD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5544C1BF35E
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 19:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 303078142A
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 19:36:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 303078142A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xLKMbhHciwIz for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 19:36:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03E59813F1
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03E59813F1
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 19:36:01 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id qk9so30926188ejc.3
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 11:36:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zNJ3fwq1j/ChqdHiOPOPscg6m2S04dkxM0eTFERyWwM=;
 b=EnND8qOCwkXS6kJOtJ4aglQriCayqAzF64DvCdf/T47bdIvmw8tfg70keqZ0ajywBF
 zeGfVVgPeGbulN9B+V8bI2R7dcQjc5IMz9jgAhVzOWIIXtrrQ6XMi/oA3m1JfhTXr2dq
 xr9IJfSGobdkNGDKEPzLZ65HttCQiw6FB5SNPKnikc2FJV616jgib+E8LWxG7RXW5mKh
 H2/aG9CqVXfhxaQVPKAj8DnYdzbAfQBs7BqS+SRe6zr2EU0HGvkse1TVj1vruDcpO1gO
 14H+UVCEsl8KORdNzuL1H+G6IoMwcdkiuINa/b2lFUQzgDP86+FARgd7xcGQpulNyKLm
 SwVw==
X-Gm-Message-State: ANoB5pkwExgwAMjKv2UU3F3EscIdqaHqPeqnjI/wLm/wu2a6ViKy9HrJ
 IWm3s+/AjcJX2BywCztbWxotqg1rjmI=
X-Google-Smtp-Source: AA0mqf6oY1Mw3mwN8cef1vW9tn/97noGHlLDot00v1iho7776F03cI7KjiMMWchm7uVJTJ505QpylA==
X-Received: by 2002:a17:906:58a:b0:78d:f455:c3a7 with SMTP id
 10-20020a170906058a00b0078df455c3a7mr13738392ejn.77.1670873759317; 
 Mon, 12 Dec 2022 11:35:59 -0800 (PST)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 10-20020a170906210a00b0077d6f628e14sm3593587ejt.83.2022.12.12.11.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 11:35:58 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 20:35:28 +0100
Message-Id: <20221212193528.23168-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zNJ3fwq1j/ChqdHiOPOPscg6m2S04dkxM0eTFERyWwM=;
 b=gqyeGNCkX3JhAfgF+UBBL+K/sMbEsDwhNHq3dQgDn3jKCZn1nClDPtAguXXTpaYbNR
 VFZzJG70kUTGUKP0yTOi8zLXL1DdP/I52qSYr0XATSPtK5SYqlTYlxx1ITFx4x5QDAJY
 EC9cDkf17XxPdKFZEfEdXR7gqnl+PrLuhU5M4G8s/bJUI1pqZqyWMLi95TnkDiOGC9dg
 etRFDr0CWTYsILchrw1ynEjyfrvMQiRVkaDVlyr1btBK5IskLwyfdTrp6Lmoz5+OThGH
 HYIMYYFXcz7eyGbGIu4I4bJrOHxCXLMrR2JE6djL0yVRdT4f2IHolZAmgPuitopGZUaJ
 kP+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gqyeGNCk
Subject: [Buildroot] [PATCH v3] package/modem-manager: bump version to 1.20.2
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
 Aleksander Morgado <aleksander@aleksander.es>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch package type to meson as the primary supported build system from now
on is meson and the autotools support as despricated. The package tarball
is no longer support, thus the MODEM_MANAGER_SOURCE is changed to the
gitlab archive URL.

All previously supported options are converted to the meson configuraiton
options and support for new ones is added. The new options are:
bash_completion, polkit, systemd, qrtr.

The dbus build dependency is needed since the meson build system
uses dbus pkg-config to determine install locations. The 'udevdir' has
to be specified also in case dbus is not installed. Modem-manager will
use its own built-in udev rule parser to determine modem specific values.

For building with libqmi support version 1.32.2 is required and for
libmbim version 1.28.2 is required.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/modem-manager/Config.in          |  2 +-
 package/modem-manager/modem-manager.hash |  2 +-
 package/modem-manager/modem-manager.mk   | 72 ++++++++++++++++++------
 3 files changed, 56 insertions(+), 20 deletions(-)

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
