Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945A1C2BB3F
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 22:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1527A60881;
	Sat, 18 Nov 2023 22:12:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1527A60881
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xamXhnzSkhjv; Sat, 18 Nov 2023 22:12:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CB0660ABD;
	Sat, 18 Nov 2023 22:12:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CB0660ABD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C1FA1BF354
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 22:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03AEF82073
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 22:12:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03AEF82073
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vLgH5MHYW1o0 for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 22:12:12 +0000 (UTC)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF1E282078
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 22:12:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF1E282078
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1ce618b7919so10927345ad.0
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 14:12:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700345530; x=1700950330;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RqpFshdnaolewCyOBf6OjwHN5zxqHHieVD4J3egVS9U=;
 b=cQwJNqf5KYOecVoCnMUjkKV2IrM9I68ZTO4h3BX0HXbgBf9SsSK4ldCOgoyUkjbhf3
 RvJPxsbki/ulY1OpVwrKJ5eFmn0S9XC3gyq8sjhBMWWqoeAE2LB7hSTFhoLG6TVGPAKe
 iO5pBiq41tViXc/dyCCygCDxbDkjfdnYD9FOAQWfpZNqnexfiwjw2AKYPRRiMp3SlBLm
 LLReQSNihMc19w8c2Ur06sjP3oJcjsb6n9huN1BZD3/ASBY6skOh2eC2EfwnAydEU7J4
 8o7WGGaK+hvFu+xPOdySwNZGAxh0oGARB5urRRPxprzHNnt714xPBFvRGggJ+LXloVjq
 lwbA==
X-Gm-Message-State: AOJu0YynexVZ6jY4tjaKpUQvLaFJXKL2sp/t75QTRlu8TApQujm+RwMS
 cha3qkaI6kBU8U/d32l/K2Uap0iKo1AU21e/it4EeA==
X-Google-Smtp-Source: AGHT+IFICZ065lIuCjDO5RQc/LtgSyUEQG93SRBPrNY5Pquuf2EXnSFGMLUxlFAbJdYyqGlX4OcAdQ==
X-Received: by 2002:a17:902:a3ce:b0:1cf:50a0:565f with SMTP id
 q14-20020a170902a3ce00b001cf50a0565fmr3246535plb.33.1700345530233; 
 Sat, 18 Nov 2023 14:12:10 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.106])
 by smtp.gmail.com with ESMTPSA id
 jw19-20020a170903279300b001b9da42cd7dsm3423699plb.279.2023.11.18.14.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Nov 2023 14:12:09 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 18 Nov 2023 15:11:57 -0700
Message-ID: <20231118221206.1369389-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700345530; x=1700950330;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RqpFshdnaolewCyOBf6OjwHN5zxqHHieVD4J3egVS9U=;
 b=H4fahqAXqx08itQAyI5D5CSHoA9rEa2IY0vj89K2tYSZqpVE9I2iZ91qfCfyxvRFGV
 C8A34LWadJvTycyoxvqFRnW4hYgbnPCvvXtML1hsIytJGvckMm6PAT7eGrDHC6yZ6rN3
 pK7/takPRYVl7u9PJc2YGu4dIgISdMKGMOdqQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=H4fahqAX
Subject: [Buildroot] [PATCH/next v2 1/9] package/xdg-user-dirs: new package
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
index 0000000000..43febe3215
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
+# We do not want nor need the desktop file.
+define XDG_USER_DIRS_REMOVE_DESKTOP_FILE
+	$(RM) -r $(TARGET_DIR)/etc/xdg/autostart/
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
