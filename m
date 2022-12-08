Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA970C3A5A7
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 13:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54AA941780;
	Thu,  8 Dec 2022 13:40:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54AA941780
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iqvg8dGd3z3l; Thu,  8 Dec 2022 13:40:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01CFB417A1;
	Thu,  8 Dec 2022 13:40:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01CFB417A1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C34F1BF3EB
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 13:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC0094018D
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 13:40:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC0094018D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4WpwYpZHHt-X for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 13:40:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA757402A7
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA757402A7
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 13:40:04 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id v7so1082446wmn.0
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 05:40:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1hjHKviDnXHJmj99q7tLOaLsFLE2v7Ql4GYRGuRgiMg=;
 b=eHTEeiUcVsUXEFTiK+PAEpYGDgksL/keCLNCzBXEQHN0NFaUHf7EZidPbKSRmKncJ7
 sZsG42SUbQAC2mzGw2DR+kRnOk2vYnrummWhzNUj0XFTu3OdAmAWwbltK99LAMO0m5CD
 Gl35HQdjb5K07ZPszr4PwndtHBPDqrEV0uSkTabZLyJVarabO+2ajtPdGmFTossntDK0
 3nKErq8dUziDkfoZLwJ/w28K8UDttf2BR9UIES9xmfL26pSTD3SpEXrD+Vau+gsdt5nO
 zl8HclKY/mRV358YdB0Y1NthAc6Ttwlqur7jOU3mKjT009AEFA3SVh+eoF0mPMJpdkHp
 BJgQ==
X-Gm-Message-State: ANoB5pkqgX35drDFBZmUVUVKLLqWnhUKpVUrlip9/i4LqSD8URi0VXyV
 CRrLCFsuPnxkF0Yv80iS/J0iWS7XcpOxbw==
X-Google-Smtp-Source: AA0mqf4i/0YWWixw5Ugei940H5h48MNNGvgQMQTLd4IAWbXKUC8E72QGDFPqUQmms2YNuBihCpmDtA==
X-Received: by 2002:a05:600c:a54:b0:3cf:a41d:844b with SMTP id
 c20-20020a05600c0a5400b003cfa41d844bmr2098373wmq.5.1670506802137; 
 Thu, 08 Dec 2022 05:40:02 -0800 (PST)
Received: from hthiery.kontron.local
 ([2a02:810b:5a40:2a43:7200:ad55:a3ad:7bab])
 by smtp.gmail.com with ESMTPSA id
 f20-20020a05600c155400b003b4fe03c881sm5695682wmg.48.2022.12.08.05.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 05:40:01 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 14:39:32 +0100
Message-Id: <20221208133928.303101-3-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221208133928.303101-1-heiko.thiery@gmail.com>
References: <20221208133928.303101-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1hjHKviDnXHJmj99q7tLOaLsFLE2v7Ql4GYRGuRgiMg=;
 b=Y4JBDD5N0KNDiNDxpdX4vHFaQ2t0Pi2uLP5/OtPrIgLOC6J3lD2OLbTiOdCb59R1Xb
 trI99t45o0euETMe0Oqp5yo05PIXkyf6n5wsO0+40RawbvO81zI6zT2wyfJShw4xFIan
 DvExHfUmyGfzRlNzEYx7aQ3jZnTaUSms1wENVtWhCZQ+h8UqpX5RVlm2OPS8a1AZwhkw
 nmkL1NNUKMtpQ3C2i6JkCKg9zRv2r+bUBAiURxOgLJQrEdxmbvzSEAKLncHLJyqh+gFA
 shE2SvQ61SdSwb3j+1HGlr1WTYVZ++dKDhV27scqLQlBi1xfThtLjtpaP/A81+uu5xeh
 c0Lw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Y4JBDD5N
Subject: [Buildroot] [PATCH v2 3/3] package/modem-manager: bump version to
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

For building with libqmi support version 1.32.2 is required and for
libmbim version 1.28.2 is required.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
v2: mention version 1.32.2 of libqmi as build dependency (thanks to Aleksander)

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
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
