Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F162C072A2
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 01:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B78574151F;
	Sat, 18 Nov 2023 01:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B78574151F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qV59NlSfLadH; Sat, 18 Nov 2023 01:55:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D012B415C8;
	Sat, 18 Nov 2023 01:55:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D012B415C8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 149F01BF329
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 01:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF7BB41696
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 01:55:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF7BB41696
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XEMhD3zX8TZ6 for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 01:55:05 +0000 (UTC)
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6FA5B40168
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 01:55:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FA5B40168
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-5872b8323faso1322231eaf.1
 for <buildroot@buildroot.org>; Fri, 17 Nov 2023 17:55:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700272504; x=1700877304;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3KO+MdB4qXQSE4Tcj4eclB1IskDe8dEgJ0T/p9UXBxA=;
 b=OxhVfzdhqh91/UYV8GPrnnCM1vjYcBz/z9Y9XjgBNan3jnFx76sdtaXEZgmbCUiptO
 eO7/jry/PaaeBEAtEPbopi8VuGuI8u67N3QZdY4x7tKWK1wua4hCmEkcd012oR3y+Zyd
 FORLuQIdlO/gDJWWoQuClXOQf7+/G9djXfI8HwQ62Waovj/R2IY32WFTVsoxRWmypIB1
 eAWGYTkx/CTx+4xSRfl7k4PN3BaQv/nUjoYg2ogkurlRHDMOknHa5g/ePZBrBjM1qMct
 UTh9/I5TgnZTtKabWW/7bfxcJduRRPFl1FlBKWrarxKXYUoYOJ3QBE2bCG7C6qrGmrKC
 7YKg==
X-Gm-Message-State: AOJu0YzxXJMOhyh3E+6Xjo6xrNX9EMaLJ3R3maapwx3CbIl6mama7Z6q
 L3O1SWwfhTzrHUmW83slLdCEcuiVThnUqp81e9kpYw==
X-Google-Smtp-Source: AGHT+IHTrTeLBvVOHpt1BqHegvA6X9+Qy/YXWwTffVouU0PNhg0mjVbK1GD1kR4I4UnnDsr5pRQ3XQ==
X-Received: by 2002:a05:6359:428c:b0:16d:bbf1:febb with SMTP id
 kp12-20020a056359428c00b0016dbbf1febbmr823110rwb.17.1700272503750; 
 Fri, 17 Nov 2023 17:55:03 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.106])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a63e64e000000b005bd3d6e270dsm2025704pgj.68.2023.11.17.17.55.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 17:55:03 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 17 Nov 2023 18:54:49 -0700
Message-ID: <20231118015456.2629144-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700272504; x=1700877304;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3KO+MdB4qXQSE4Tcj4eclB1IskDe8dEgJ0T/p9UXBxA=;
 b=NrSrNuYICsQVFMC4Hhf91dBfNsq+Z4BIxnUZGABlmrqcswzAx0/EMtid0CRmLscrwm
 1FC9XDctV8uoYLorMR0TDUK5Wi0BYVOBzUutqUNKpIKdRaNz38Z1ZqZW0u209C+JSjM6
 Wk5DkrH6LaDoLo/APBiTzUN4mSEed6rOLGttg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=NrSrNuYI
Subject: [Buildroot] [PATCH/next 1/7] package/xdg-user-dirs: new package
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is needed to fix flutter-gallery

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/xdg-user-dirs/Config.in               | 22 ++++++++++
 package/xdg-user-dirs/S22xdg-user-dirs-update | 22 ++++++++++
 .../xdg-user-dirs-update.service              | 10 +++++
 package/xdg-user-dirs/xdg-user-dirs.hash      |  3 ++
 package/xdg-user-dirs/xdg-user-dirs.mk        | 41 +++++++++++++++++++
 7 files changed, 100 insertions(+)
 create mode 100644 package/xdg-user-dirs/Config.in
 create mode 100644 package/xdg-user-dirs/S22xdg-user-dirs-update
 create mode 100644 package/xdg-user-dirs/xdg-user-dirs-update.service
 create mode 100644 package/xdg-user-dirs/xdg-user-dirs.hash
 create mode 100644 package/xdg-user-dirs/xdg-user-dirs.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1f26e9bc81..ab0ef81639 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -39,6 +39,7 @@ F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
 F:	package/python-kmod/
 F:	package/python-versioneer/
+F:	package/xdg-user-dirs/
 F:	support/testing/tests/package/test_firewalld.py
 F:	support/testing/tests/package/test_flutter.py
 
diff --git a/package/Config.in b/package/Config.in
index 5a3410d758..3bdf5e92b1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2783,6 +2783,7 @@ menu "System tools"
 	source "package/watchdog/Config.in"
 	source "package/watchdogd/Config.in"
 	source "package/xdg-dbus-proxy/Config.in"
+	source "package/xdg-user-dirs/Config.in"
 	source "package/xen/Config.in"
 	source "package/xvisor/Config.in"
 endmenu
diff --git a/package/xdg-user-dirs/Config.in b/package/xdg-user-dirs/Config.in
new file mode 100644
index 0000000000..5e580ccfd8
--- /dev/null
+++ b/package/xdg-user-dirs/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_XDG_USER_DIRS
+	bool "xdg-user-dirs"
+	depends on BR2_USE_WCHAR # libglib2 -> gettext
+	help
+	  xdg-user-dirs is a tool to help manage "well known" user
+	  directories like the desktop folder and the music folder.
+	  It also handles localization (i.e. translation) of the
+	  filenames.
+
+	  The way it works is that xdg-user-dirs-update is run very
+	  early in the login phase. This program reads a configuration
+	  file, and a set of default directories. It then creates
+	  localized versions of these directories in the users home
+	  directory and sets up a config file in
+	  $(XDG_CONFIG_HOME)/user-dirs.dirs
+	  (XDG_CONFIG_HOME defaults to ~/.config) that applications can
+	  read to find these directories.
+
+	  https://freedesktop.org/wiki/Software/xdg-user-dirs/
+
+comment "xdg-user-dirs needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/xdg-user-dirs/S22xdg-user-dirs-update b/package/xdg-user-dirs/S22xdg-user-dirs-update
new file mode 100644
index 0000000000..09ad803bc7
--- /dev/null
+++ b/package/xdg-user-dirs/S22xdg-user-dirs-update
@@ -0,0 +1,22 @@
+#!/bin/sh
+set -e
+
+DAEMON=xdg-user-dirs-update
+
+case "$1" in
+	start|"")
+		printf "Starting xdg-user-dirs-update: "
+		start-stop-daemon -S -q --exec $DAEMON
+		status=$?
+		if [ "$status" -eq 0 ]; then
+			echo "OK"
+		else
+			echo "FAIL"
+		fi
+		;;
+
+	*)
+		echo "Usage: xdg-user-dirs-update start"
+		exit 1
+		;;
+esac
diff --git a/package/xdg-user-dirs/xdg-user-dirs-update.service b/package/xdg-user-dirs/xdg-user-dirs-update.service
new file mode 100644
index 0000000000..12cb89f5de
--- /dev/null
+++ b/package/xdg-user-dirs/xdg-user-dirs-update.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Update XDG user dir configuration
+
+[Service]
+Type=oneshot
+EnvironmentFile=-/etc/locale.conf
+ExecStart=/usr/bin/xdg-user-dirs-update
+
+[Install]
+WantedBy=default.target
diff --git a/package/xdg-user-dirs/xdg-user-dirs.hash b/package/xdg-user-dirs/xdg-user-dirs.hash
new file mode 100644
index 0000000000..a4d911ee7d
--- /dev/null
+++ b/package/xdg-user-dirs/xdg-user-dirs.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  ec6f06d7495cdba37a732039f9b5e1578bcb296576fde0da40edb2f52220df3c  xdg-user-dirs-0.18.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/xdg-user-dirs/xdg-user-dirs.mk b/package/xdg-user-dirs/xdg-user-dirs.mk
new file mode 100644
index 0000000000..f43d6ef823
--- /dev/null
+++ b/package/xdg-user-dirs/xdg-user-dirs.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# xdg-user-dirs
+#
+################################################################################
+
+XDG_USER_DIRS_VERSION = 0.18
+XDG_USER_DIRS_SITE = http://user-dirs.freedesktop.org/releases
+XDG_USER_DIRS_LICENSE = GPL-2.0
+XDG_USER_DIRS_LICENSE_FILES = COPYING
+XDG_USER_DIRS_CONF_OPTS = \
+	--disable-rpath \
+	--with-gnu-ld
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+XDG_USER_DIRS_DEPENDENCIES += libiconv
+endif
+
+ifeq ($(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y)
+XDG_USER_DIRS_CONF_OPTS += --with-libintl-prefix=$(STAGING_DIR)/usr
+else
+XDG_USER_DIRS_CONF_OPTS += --without-libintl-prefix
+endif
+
+# We do not need nor want  the desktop file.
+define XDG_USER_DIRS_REMOVE_DESKTOP_FILE
+	$(RM) -rf $(TARGET_DIR)/etc/xdg/autostart/
+endef
+XDG_USER_DIRS_POST_INSTALL_TARGET_HOOKS += XDG_USER_DIRS_REMOVE_DESKTOP_FILE
+
+define XDG_USER_DIRS_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(XDG_USER_DIRS_PKGDIR)/xdg-user-dirs-update.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/xdg-user-dirs-update.service
+endef
+
+define XDG_USER_DIRS_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 $(XDG_USER_DIRS_PKGDIR)/S22xdg-user-dirs-update \
+		$(TARGET_DIR)/etc/init.d/S22xdg-user-dirs-update
+endef
+
+$(eval $(autotools-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
