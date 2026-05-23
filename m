Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF084CD5BB1
	for <buildroot@archiver.kernel.org>; Sat, 23 May 2026 09:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0B6A809DD;
	Sat, 23 May 2026 09:12:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GtZ-PBya4Xvv; Sat, 23 May 2026 09:12:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D161E809E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779527571;
	bh=40LqIa7DIvLaIEKxMndprXPNvEL+cLQvMUhm2qMrVu8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HMsXUljI6x7ITurbVst75X0QDkmJ82yh1nka6ZfoDuELn0lqHqO6Pp9XEg+Zy9g2X
	 E1s76x/VPnM3BZ1spVgSvTvbY0/4KeXqFLfH49DFaE1tBrULJzipkQNO+u3JDUV5q8
	 55iXBm5z2UfJcvbdJsYrLmGBdU3kxBdICG8wj6kmE0ydhyAuCeQlMbDi9EuO7JRWJy
	 4BOvhg9s0Xf/0U8vpDFIzO86/whYvTJ3HK1Ouvb229JrCh6lbrOxuQpWIK4v7ogpCm
	 vBV7UI7ICt6knv0nHvnTrDRRCoaWLhEXENHR/hTQFyrqnIeUlqPDMq/zP8ZFB0U0YO
	 Xz+h9ge5XnaqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D161E809E7;
	Sat, 23 May 2026 09:12:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B3742282
 for <buildroot@buildroot.org>; Sat, 23 May 2026 09:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A540A60883
 for <buildroot@buildroot.org>; Sat, 23 May 2026 09:12:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oJx9D16P13Wk for <buildroot@buildroot.org>;
 Sat, 23 May 2026 09:12:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3A04960673
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A04960673
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A04960673
 for <buildroot@buildroot.org>; Sat, 23 May 2026 09:12:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b5dd.dip0.t-ipconnect.de [84.161.181.221])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 80A5AA4C027E;
 Sat, 23 May 2026 11:12:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36918)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wQiOk-000000001HG-3T0r;
 Sat, 23 May 2026 09:11:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Grzegorz Blach <grzegorz@blach.pl>
Date: Sat, 23 May 2026 11:11:56 +0200
Message-ID: <20260523091156.112718-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260523091156.112718-1-bernd@kuhls.net>
References: <20260523091156.112718-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779527521;
 bh=V81ZCmoSNnaN8eKx+sjgSifKBshswx9rk2+DcPFY+Wc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=EuYwXmVwB4d4LMP+2tAA+SOpXERL/LVERuouekwV7pGn9L0KzubDEZyXYIM/W0x0p
 YJvzqaKOjld0T3zBhrwULcuyjvLoB8d2s6lkXBccOr8F0qOfWE5IADFamdJWzZq+5u
 r4+iXZG/DTA94lXc2/EUFUmPkiRHd/NFb5Omn3lhIP1eQ7y8y/fGJi5Pr//yOJNJdB
 cxsQBylUGdfRibEKXK4uSXbM29ozy4zvjIEhBK/ovvniWCMImPsjx9o7Fd/tKwcKyn
 0P7fbZhBQ5wTxyG3GcC11qftJQlvtGSSkhr9cZcF/FqJycRS5lkW7wk/mVsWpSECSQ
 7uV5GWZd+gxNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=EuYwXmVw
Subject: [Buildroot] [PATCH 5/5] package/pigpio: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Build is broken with gcc 15.x.

Debian removed the package in 2025:
https://tracker.debian.org/news/1668850/pigpio-removed-from-testing/

Last upstream commit: March 2021
Open PR: 21
Open issues: 87

One of the open issues mentions incompatibility with Pi 5+:
https://github.com/joan2937/pigpio/issues/589

Fixes:
https://autobuild.buildroot.net/results/09e/09e2213727205674284204ce0604d34b10a5a543/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Grzegorz Blach <grzegorz@blach.pl>
---
 .checkpackageignore           |  1 -
 Config.in.legacy              |  7 +++++
 DEVELOPERS                    |  1 -
 package/Config.in             |  1 -
 package/pigpio/Config.in      | 14 ----------
 package/pigpio/S50pigpio      | 50 ----------------------------------
 package/pigpio/pigpio.hash    |  3 ---
 package/pigpio/pigpio.mk      | 51 -----------------------------------
 package/pigpio/pigpio.service | 10 -------
 9 files changed, 7 insertions(+), 131 deletions(-)
 delete mode 100644 package/pigpio/Config.in
 delete mode 100644 package/pigpio/S50pigpio
 delete mode 100644 package/pigpio/pigpio.hash
 delete mode 100644 package/pigpio/pigpio.mk
 delete mode 100644 package/pigpio/pigpio.service

diff --git a/.checkpackageignore b/.checkpackageignore
index 34f4d5bdcd..5d4cccd76e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -744,7 +744,6 @@ package/php/0004-Call-apxs-with-correct-prefix.patch lib_patch.Upstream
 package/pifmrds/0001-Makefile-cross-compile-friendly.patch lib_patch.Upstream
 package/pifmrds/0002-Makefile-use-LDFLAGS.patch lib_patch.Upstream
 package/pifmrds/0003-Makefile-fix-static-link.patch lib_patch.Upstream
-package/pigpio/S50pigpio Shellcheck lib_sysv.Variables
 package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch lib_patch.Upstream
 package/pkgconf/pkg-config.in Shellcheck
 package/poke/0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 7a9dc41d06..6a7a4ac1d5 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.05"
 
+config BR2_PACKAGE_PIGPIO
+	bool "pigpio removed"
+	select BR2_LEGACY
+	help
+	  pigpio was no longer maintained upstream, so it has been
+	  dropped.
+
 config BR2_PACKAGE_XML_SECURITY_C
 	bool "xml-security-c removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index de0d0d6f76..5ae5f4ef8c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1357,7 +1357,6 @@ F:	fs/f2fs/
 F:	package/bluez5_utils-headers/
 F:	package/f2fs-tools/
 F:	package/graphicsmagick/
-F:	package/pigpio/
 F:	package/python-aioblescan/
 F:	package/python-bluezero/
 F:	package/python-crontab/
diff --git a/package/Config.in b/package/Config.in
index 23a76bd9b0..f32fcd8723 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -573,7 +573,6 @@ endmenu
 	source "package/picocom/Config.in"
 	source "package/picotool/Config.in"
 	source "package/pifmrds/Config.in"
-	source "package/pigpio/Config.in"
 	source "package/powertop/Config.in"
 	source "package/pps-tools/Config.in"
 	source "package/pru-software-support/Config.in"
diff --git a/package/pigpio/Config.in b/package/pigpio/Config.in
deleted file mode 100644
index 2180ab0de6..0000000000
--- a/package/pigpio/Config.in
+++ /dev/null
@@ -1,14 +0,0 @@
-config BR2_PACKAGE_PIGPIO
-	bool "pigpio"
-	depends on BR2_aarch64 || BR2_arm
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_STATIC_LIBS
-	help
-	  Pigpio is a library for the Raspberry Pi which allows
-	  control of the General Purpose Input Outputs (GPIO).
-
-	  http://abyz.me.uk/rpi/pigpio/
-
-comment "pigpio needs a toolchain w/ threads, dynamic library"
-	depends on BR2_aarch64 || BR2_arm
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/pigpio/S50pigpio b/package/pigpio/S50pigpio
deleted file mode 100644
index 8b7b6815c8..0000000000
--- a/package/pigpio/S50pigpio
+++ /dev/null
@@ -1,50 +0,0 @@
-#!/bin/sh
-
-DAEMON="pigpiod"
-PIDFILE="/var/run/pigpio.pid"
-
-PIGPIOD_ARGS=""
-
-[ -r "/etc/default/pigpio" ] && . "/etc/default/pigpio"
-
-start() {
-	printf 'Starting %s: ' "$DAEMON"
-	start-stop-daemon -S -q -x "/usr/bin/$DAEMON" -- $PIGPIOD_ARGS
-	status=$?
-	if [ "$status" -eq 0 ]; then
-		echo "OK"
-	else
-		echo "FAIL"
-	fi
-	return "$status"
-}
-
-stop() {
-	printf 'Stopping %s: ' "$DAEMON"
-	start-stop-daemon -K -q -p "$PIDFILE"
-	status=$?
-	if [ "$status" -eq 0 ]; then
-		rm -f "$PIDFILE"
-		echo "OK"
-	else
-		echo "FAIL"
-	fi
-	return "$status"
-}
-
-restart() {
-	stop
-	sleep 1
-	start
-}
-
-case "$1" in
-	start|stop|restart)
-		"$1";;
-	reload)
-		# Restart, since there is no true "reload" feature.
-		restart;;
-	*)
-		echo "Usage: $0 {start|stop|restart|reload}"
-		exit 1
-esac
diff --git a/package/pigpio/pigpio.hash b/package/pigpio/pigpio.hash
deleted file mode 100644
index fecb7ccbeb..0000000000
--- a/package/pigpio/pigpio.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  c5337c0b7ae888caf0262a6f476af0e2ab67065f7650148a0b21900b8d1eaed7  pigpio-79.tar.gz
-sha256  6a90b88421a0d9b090e121daa11b3c6d55eed5eeb3281a2fcc454d6a28b5547c  UNLICENCE
diff --git a/package/pigpio/pigpio.mk b/package/pigpio/pigpio.mk
deleted file mode 100644
index e34974972a..0000000000
--- a/package/pigpio/pigpio.mk
+++ /dev/null
@@ -1,51 +0,0 @@
-################################################################################
-#
-# pigpio
-#
-################################################################################
-
-PIGPIO_VERSION = 79
-PIGPIO_SITE = $(call github,joan2937,pigpio,v$(PIGPIO_VERSION))
-PIGPIO_LICENSE = Unlicense
-PIGPIO_LICENSE_FILES = UNLICENCE
-PIGPIO_INSTALL_STAGING = YES
-
-define PIGPIO_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
-endef
-
-define PIGPIO_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/pig2vcd $(TARGET_DIR)/usr/bin/pig2vcd
-	$(INSTALL) -D -m 0755 $(@D)/pigpiod $(TARGET_DIR)/usr/bin/pigpiod
-	$(INSTALL) -D -m 0755 $(@D)/pigs $(TARGET_DIR)/usr/bin/pigs
-	$(INSTALL) -D -m 0755 $(@D)/libpigpio.so.1 $(TARGET_DIR)/usr/lib/libpigpio.so.1
-	$(INSTALL) -D -m 0755 $(@D)/libpigpiod_if.so.1 $(TARGET_DIR)/usr/lib/libpigpiod_if.so.1
-	$(INSTALL) -D -m 0755 $(@D)/libpigpiod_if2.so.1 $(TARGET_DIR)/usr/lib/libpigpiod_if2.so.1
-	ln -sf libpigpio.so.1 $(TARGET_DIR)/usr/lib/libpigpio.so
-	ln -sf libpigpiod_if.so.1 $(TARGET_DIR)/usr/lib/libpigpiod_if.so
-	ln -sf libpigpiod_if2.so.1 $(TARGET_DIR)/usr/lib/libpigpiod_if2.so
-endef
-
-define PIGPIO_INSTALL_STAGING_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/libpigpio.so.1 $(STAGING_DIR)/usr/lib/libpigpio.so.1
-	$(INSTALL) -D -m 0755 $(@D)/libpigpiod_if.so.1 $(STAGING_DIR)/usr/lib/libpigpiod_if.so.1
-	$(INSTALL) -D -m 0755 $(@D)/libpigpiod_if2.so.1 $(STAGING_DIR)/usr/lib/libpigpiod_if2.so.1
-	$(INSTALL) -D -m 0644 $(@D)/pigpio.h $(STAGING_DIR)/usr/include/pigpio.h
-	$(INSTALL) -D -m 0644 $(@D)/pigpiod_if.h $(STAGING_DIR)/usr/include/pigpiod_if.h
-	$(INSTALL) -D -m 0644 $(@D)/pigpiod_if2.h $(STAGING_DIR)/usr/include/pigpiod_if2.h
-	ln -sf libpigpio.so.1 $(STAGING_DIR)/usr/lib/libpigpio.so
-	ln -sf libpigpiod_if.so.1 $(STAGING_DIR)/usr/lib/libpigpiod_if.so
-	ln -sf libpigpiod_if2.so.1 $(STAGING_DIR)/usr/lib/libpigpiod_if2.so
-endef
-
-define PIGPIO_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 755 package/pigpio/S50pigpio \
-		$(TARGET_DIR)/etc/init.d/S50pigpio
-endef
-
-define PIGPIO_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 644 package/pigpio/pigpio.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/pigpio.service
-endef
-
-$(eval $(generic-package))
diff --git a/package/pigpio/pigpio.service b/package/pigpio/pigpio.service
deleted file mode 100644
index 135624cc43..0000000000
--- a/package/pigpio/pigpio.service
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=Pigpio daemon
-After=network.target
-
-[Service]
-EnvironmentFile=-/etc/default/pigpio
-ExecStart=/usr/bin/pigpiod -g $PIGPIOD_ARGS
-
-[Install]
-WantedBy=multi-user.target
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
