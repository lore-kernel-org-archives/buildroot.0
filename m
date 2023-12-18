Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21900C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 18:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB25D41846;
	Mon, 18 Dec 2023 18:56:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB25D41846
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kQwqsSHKI818; Mon, 18 Dec 2023 18:56:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF47E418AE;
	Mon, 18 Dec 2023 18:56:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF47E418AE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2145C1BF20B
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 18:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECC634056F
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 18:54:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECC634056F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r7tqSnH96lid for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 18:54:54 +0000 (UTC)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C2B740527
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 18:54:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C2B740527
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-5bdb0be3591so2782917a12.2
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 10:54:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702925693; x=1703530493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M1n0SafHyuG1+bnmIyL/8pyacZ2f9OIq5dzKvOeOqi8=;
 b=OUJCSz2YML70kTLvbnzqM5QH5gXCP3Kq6HYkuI6e4x2bvgeWZxGFowDRxyPlodr1Ag
 ZKI5WzZbDI+/M4EkWMq0F2mRIVARiylZof7qsb+Tqd2fR/z8xYafu6SPh6WVpTYPxZVt
 nJUDDflNBjxdqAldJv/GsVZ5fy1gv2wJRPe4EirOeum9bKwulQW2/pil3uOumhOJpJ0M
 oypfHm7Ib3KNuS7Y4WQbE2L9eH/diB8EMyzwHxpTz/3BNZGHAySxmcWtHZx0i2DUnBC7
 bh9ZObOHai0mStabrE/1Cc2T1IhXjYzpwbsEx2XzZXwC0KmBMDykvBeZbBIgpKkt56LX
 xTag==
X-Gm-Message-State: AOJu0YzRPq4TT7SQzoWv+iRzCWd6zmj5SXE1lDJ5fW2ZMjpE23v2FMBy
 KSS80JheRz4iJpQMkRuebxhBAGu9oIltPKMe5ic=
X-Google-Smtp-Source: AGHT+IG0aYuluLplVr5yqAsYKYvqtYs66gMfA/Fmq4BWuPJGWkmdt2EFKVhs7ww6jBxpFgIihSFo2g==
X-Received: by 2002:a17:90b:83:b0:28b:906f:1227 with SMTP id
 bb3-20020a17090b008300b0028b906f1227mr1178544pjb.34.1702925693403; 
 Mon, 18 Dec 2023 10:54:53 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a17090ac00500b00285cc7a867esm21890580pjt.0.2023.12.18.10.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 10:54:52 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 11:54:36 -0700
Message-ID: <20231218185440.506995-10-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218185440.506995-1-adam.duskett@amarulasolutions.com>
References: <20231218185440.506995-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702925693; x=1703530493;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M1n0SafHyuG1+bnmIyL/8pyacZ2f9OIq5dzKvOeOqi8=;
 b=EAZCU8nQUuZVD5OhFySEx9osuFPrM6lzBVISsmTxUlgKOGszGvqhT3K6y4i/tm/tVi
 uTCkqP7AwfuPkgKPzBQYxDJjuKeKBuSgdQxbzIKFLNUsvpOTT2XtJjbDsZhLFnDhhVKu
 E3WavtdeBx79kYQGy4glIg5TMLcmat6H3O7ZU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=EAZCU8nQ
Subject: [Buildroot] [PATCH v2 10/13] package/xdg-user-dirs: new package
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
 package/xdg-user-dirs/Config.in               | 14 +++++++
 package/xdg-user-dirs/S22xdg-user-dirs-update | 26 +++++++++++++
 .../xdg-user-dirs-update.service              | 10 +++++
 package/xdg-user-dirs/xdg-user-dirs.hash      |  3 ++
 package/xdg-user-dirs/xdg-user-dirs.mk        | 37 +++++++++++++++++++
 7 files changed, 92 insertions(+)
 create mode 100644 package/xdg-user-dirs/Config.in
 create mode 100644 package/xdg-user-dirs/S22xdg-user-dirs-update
 create mode 100644 package/xdg-user-dirs/xdg-user-dirs-update.service
 create mode 100644 package/xdg-user-dirs/xdg-user-dirs.hash
 create mode 100644 package/xdg-user-dirs/xdg-user-dirs.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 311dcd9504..3782d11b75 100644
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
index 09e8700ea6..a445ff64c1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2785,6 +2785,7 @@ menu "System tools"
 	source "package/watchdog/Config.in"
 	source "package/watchdogd/Config.in"
 	source "package/xdg-dbus-proxy/Config.in"
+	source "package/xdg-user-dirs/Config.in"
 	source "package/xen/Config.in"
 	source "package/xvisor/Config.in"
 endmenu
diff --git a/package/xdg-user-dirs/Config.in b/package/xdg-user-dirs/Config.in
new file mode 100644
index 0000000000..ba122606f2
--- /dev/null
+++ b/package/xdg-user-dirs/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_XDG_USER_DIRS
+	bool "xdg-user-dirs"
+	depends on BR2_ENABLE_LOCALE
+	depends on BR2_USE_WCHAR # libglib2 -> gettext
+	help
+	  xdg-user-dirs is a tool to help manage "well known" user
+	  directories like the desktop folder and the music folder.
+	  It also handles localization (i.e. translation) of the
+	  filenames.
+
+	  https://freedesktop.org/wiki/Software/xdg-user-dirs/
+
+comment "xdg-user-dirs needs a toolchain w/ wchar, locale"
+	depends on !BR2_USE_WCHAR || !BR2_ENABLE_LOCALE
diff --git a/package/xdg-user-dirs/S22xdg-user-dirs-update b/package/xdg-user-dirs/S22xdg-user-dirs-update
new file mode 100644
index 0000000000..ec8f2039b3
--- /dev/null
+++ b/package/xdg-user-dirs/S22xdg-user-dirs-update
@@ -0,0 +1,26 @@
+#!/bin/sh
+set -e
+
+DAEMON="xdg-user-dirs-update"
+XDG_USER_DIRS_UPDATE_ARGS="--force"
+
+start() {
+		printf "Starting %s: " "${DAEMON}"
+		su - root -c "${DAEMON} ${XDG_USER_DIRS_UPDATE_ARGS}"
+		status=$?
+		if [ "${status}" -eq 0 ]; then
+			echo "OK"
+		else
+			echo "FAIL"
+		fi
+		return "${status}"
+}
+
+case "$1" in
+	start)
+		"$1";;
+	*)
+		echo "Usage: xdg-user-dirs-update start"
+		exit 1
+		;;
+esac
diff --git a/package/xdg-user-dirs/xdg-user-dirs-update.service b/package/xdg-user-dirs/xdg-user-dirs-update.service
new file mode 100644
index 0000000000..438df4a8da
--- /dev/null
+++ b/package/xdg-user-dirs/xdg-user-dirs-update.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Update XDG user dir configuration
+
+[Service]
+Type=oneshot
+EnvironmentFile=-/etc/locale.conf
+ExecStart=/usr/bin/xdg-user-dirs-update --force
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
index 0000000000..95b2e0c4fc
--- /dev/null
+++ b/package/xdg-user-dirs/xdg-user-dirs.mk
@@ -0,0 +1,37 @@
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
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
