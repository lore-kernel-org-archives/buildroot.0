Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 041BFC433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 15:50:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D3A060F4B
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 15:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D3A060F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB420400DE;
	Sun, 10 Oct 2021 15:50:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id az-O_BSn_280; Sun, 10 Oct 2021 15:50:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C3AE400F0;
	Sun, 10 Oct 2021 15:50:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA6E71BF2F3
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 15:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3346606B4
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 15:50:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QcKK08JRJ77k for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 15:50:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8AD2060679
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 15:50:00 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id u18so62330820lfd.12
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 08:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OUxYHbRXOD91F6hycXz6G4gelUgz6aVg+SG7S5wm/54=;
 b=ZSvtDAb9+WhPoar0C3hi3C5/33fcZhY0efIOi+9Y3hRqoUJOmqL74JEWd25poQM0sw
 Ld3VubH5WBw0SSfGB/jsNQE4JPPbsAiU28SsDWAKnuUGZct/T6dDr3xDC6mvo8kYt2e6
 xdPld/foqrNVJVUaJ2DK6J6fwkh7fxDeKfKXcFjoiJFrh6e082ZY6CqKS7qmGExLT6sS
 cl58scSfVZBKMzHsVLwRINSDSZZFJ/F22l9OW+8iBgOGRysf3t7Qo3dXee8PbENU4MbO
 6tv3he7G3wMhIFYYAZsgDdz/ixDkTW8UACvfPg4JdxqimyTSv3CWKtAb4aUKxsDbV8u4
 enwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OUxYHbRXOD91F6hycXz6G4gelUgz6aVg+SG7S5wm/54=;
 b=07ftgBms2rE67lUPhF5VohrXDrpXjpX8pP08x6bEL3fiypWV9bjEr63rPu2xFWFV9X
 gyRvDbnRhYotEYNJ2ViNCwFqLjvapceWo2gAw6kp9ZISfAeqmGPsfB88gU0ORWEXHCP8
 GJNKW0nxsBjUXTjDLB7n5ULpYOZXArWDMqMiAFQahBL5cZpMDu/HnAklvtE5O9B4wZia
 janJkw6WaQHEwlRHbgbm6zb7cOW7Ke+D4qqabVp+2fkdWbUQwThVu6xXoBnTm5DznKif
 OLzBTMxvENfdYOArG83Lsn0pnzFVHR9t5hjh4/fP9uezj+UbIrPVaqjWjkJVSrWcEbRE
 zUTA==
X-Gm-Message-State: AOAM530aSMvihoH0WsCOq39WXrwPE5WT/V6kcl2X6u0mP2PVOnUoABKj
 yr76OtakAFG7maLc1LfRu++jZda4lh/dGrQq
X-Google-Smtp-Source: ABdhPJy92+bt35wHrhCl7KdsRIXNOeVOhFLj29nRIfFz5K0DPGTL6vm8dZsYSgYVci3lHYTNAL2s/Q==
X-Received: by 2002:a2e:868e:: with SMTP id l14mr8414570lji.230.1633880998015; 
 Sun, 10 Oct 2021 08:49:58 -0700 (PDT)
Received: from localhost.localdomain ([94.254.51.197])
 by smtp.gmail.com with ESMTPSA id g7sm489170lfr.113.2021.10.10.08.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 08:49:57 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Oct 2021 17:49:41 +0200
Message-Id: <20211010154941.1093769-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/watchdogd: new package
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
Cc: Joachim Wiberg <troglobit@gmail.com>, =?UTF-8?q?Alejandro=20Gonz=C3=A1lez?=
 <alejandro.gonzalez.correo@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds support for watchdogd, a watchdog daemon with built-in
process supervisor[1] as well as support for monitoring memory & file
descriptor leaks, and CPU load average.  When a monitored resource
reaches a high watermark, a warning message is logged and when critical
level is reached, the cause is saved and the system is rebooted.  On
reboot the reset cause can be retrieved to help locate the culprit.

Support for SysV init script in this patch, and systemd unit file is
installed from the one bundled with the package.  Both files supoort
additional command line options in /etc/default/watchdogd.

The Config.in is slightly big, but allows for disabling or adjusting
the poll interval for each resource monitor.

For more information, see https://github.com/troglobit/watchdogd

[1]: processes must have their main loop instrumented for supervision.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/watchdogd/Config.in      | 69 ++++++++++++++++++++++++++++++++
 package/watchdogd/S01watchdogd   | 47 ++++++++++++++++++++++
 package/watchdogd/watchdogd.hash |  5 +++
 package/watchdogd/watchdogd.mk   | 55 +++++++++++++++++++++++++
 6 files changed, 178 insertions(+)
 create mode 100644 package/watchdogd/Config.in
 create mode 100755 package/watchdogd/S01watchdogd
 create mode 100644 package/watchdogd/watchdogd.hash
 create mode 100644 package/watchdogd/watchdogd.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7ebfc9234b..cf68b94685 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1335,6 +1335,7 @@ F:	package/mg/
 F:	package/netcalc/
 F:	package/ssdp-responder/
 F:	package/sysklogd/
+F:	package/watchdogd/
 
 N:	Joao Pinto <jpinto@synopsys.com>
 F:	board/synopsys/vdk/
diff --git a/package/Config.in b/package/Config.in
index 9fed0ab4cb..167a6339c1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2540,6 +2540,7 @@ menu "System tools"
 	source "package/unscd/Config.in"
 	source "package/util-linux/Config.in"
 	source "package/watchdog/Config.in"
+	source "package/watchdogd/Config.in"
 	source "package/xdg-dbus-proxy/Config.in"
 	source "package/xen/Config.in"
 	source "package/xvisor/Config.in"
diff --git a/package/watchdogd/Config.in b/package/watchdogd/Config.in
new file mode 100644
index 0000000000..48abbac8fa
--- /dev/null
+++ b/package/watchdogd/Config.in
@@ -0,0 +1,69 @@
+config BR2_PACKAGE_WATCHDOGD
+	bool "watchdogd"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBCONFUSE
+	select BR2_PACKAGE_LIBITE
+	select BR2_PACKAGE_LIBUEV
+	help
+	  Extended version of uClinux-dist watchdogd.  Monitors loadavg,
+	  file descriptors and memory leaks, and capable of supervising
+	  your processes main loop using an instrumentation API.
+
+	  A reset reason is saved for power loss, CPU overload, or any
+	  of the monitored conditions (above).	The full capabilities
+	  are limited by the kernel watchdog driver, but even the basic
+	  "softdog" driver is supported.  See /etc/watchdogd.conf for
+	  details, and try watchdogctl for system status and available
+	  commands.
+
+	  https://github.com/troglobit/watchdogd/
+
+if BR2_PACKAGE_WATCHDOGD
+
+config BR2_PACKAGE_WATCHDOGD_TEST_SUITE
+	bool "Enable watchdogctl test cases"
+	default y
+	help
+	  The watchdogctl program comes with a suite of tests built-in.
+	  They can be used to verify correct operation of watchdogd and
+	  the kernel watchdog driver.
+
+	  Default: enabled
+
+config BR2_PACKAGE_WATCHDOGD_GENERIC_POLL
+	int "Generic script monitor poll interval (sec)"
+	default "300"
+	help
+	  Poll interval for generic script monitor, in seconds.  A value
+	  of zero (0) disables the monitor.
+
+	  Default: 300 seconds
+
+config BR2_PACKAGE_WATCHDOGD_LOADAVG_POLL
+	int "CPU load average monitor poll interval (sec)"
+	default "300"
+	help
+	  Poll interval for CPU load average monitor, in seconds.  A
+	  value of zero (0) disables the monitor.
+
+	  Default: 300 seconds
+
+config BR2_PACKAGE_WATCHDOGD_FILENR_POLL
+	int "File descriptor leak monitor poll interval (sec)"
+	default "300"
+	help
+	  Poll interval for file descriptor leak monitor, in seconds.  A
+	  value of zero (0) disables the monitor.
+
+	  Default: 300 seconds
+
+config BR2_PACKAGE_WATCHDOGD_MEMINFO_POLL
+	int "Memory leak monitor poll interval (sec)"
+	default "300"
+	help
+	  Poll interval for memory leak monitor, in seconds.  A value of
+	  zero (0) disables the monitor.
+
+	  Default: 300 seconds
+
+endif
diff --git a/package/watchdogd/S01watchdogd b/package/watchdogd/S01watchdogd
new file mode 100755
index 0000000000..df57b8ad7a
--- /dev/null
+++ b/package/watchdogd/S01watchdogd
@@ -0,0 +1,47 @@
+#!/bin/sh
+
+DAEMON="watchdogd"
+PIDFILE="/var/run/$DAEMON.pid"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+cmd()
+{
+    start-stop-daemon -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" "$@"
+    status=$?
+    if [ $status -eq 0 ]; then
+	echo "OK"
+    else
+	echo "FAIL"
+    fi
+    return $status
+}
+
+case "$1" in
+    start)
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	cmd -S -- $SMCROUTED_ARGS
+	;;
+
+    stop)
+	printf 'Stopping %s: ' "$DAEMON"
+	cmd -K
+	;;
+
+    restart)
+	$0 stop
+	sleep 1
+	$0 start
+	;;
+
+    reload)
+	printf 'Reloading %s: ' "$DAEMON"
+	cmd -K -s HUP
+	;;
+
+    *)
+	echo "Usage: $0 {start|stop|restart|reload}"
+	exit 1
+esac
diff --git a/package/watchdogd/watchdogd.hash b/package/watchdogd/watchdogd.hash
new file mode 100644
index 0000000000..7c1acf0820
--- /dev/null
+++ b/package/watchdogd/watchdogd.hash
@@ -0,0 +1,5 @@
+# Upstream .sha256 from GitHub
+sha256 f36fdea9b323534a704c4c23d9af8050480bca4bdad89cdb50d26fcac316d172  watchdogd-3.4.tar.gz
+
+# Locally calculated
+sha256 fd685e20931174308c45a26418a7ce34d66704c4e4b92ab1d8299deb255cd676  LICENSE
diff --git a/package/watchdogd/watchdogd.mk b/package/watchdogd/watchdogd.mk
new file mode 100644
index 0000000000..3ac297ee5a
--- /dev/null
+++ b/package/watchdogd/watchdogd.mk
@@ -0,0 +1,55 @@
+################################################################################
+#
+# watchdogd
+#
+################################################################################
+
+WATCHDOGD_VERSION = 3.4
+WATCHDOGD_SITE = https://github.com/troglobit/watchdogd/releases/download/$(WATCHDOGD_VERSION)
+WATCHDOGD_LICENSE = ISC
+WATCHDOGD_LICENSE_FILES = LICENSE
+WATCHDOGD_CPE_ID_VENDOR = troglobit
+WATCHDOGD_DEPENDENCIES = host-pkgconf libconfuse libite libuev
+WATCHDOGD_CONF_OPTS = --disable-compat --disable-examples --disable-test-mode
+
+ifneq ($(BR2_PACKAGE_WATCHDOGD_TEST_SUITE),y)
+WATCHDOGD_CONF_OPTS += --disable-builtin-tests
+else
+WATCHDOGD_CONF_OPTS += --enable-builtin-tests
+endif
+
+ifeq ($(BR2_PACKAGE_WATCHDOGD_GENERIC_POLL),0)
+WATCHDOGD_CONF_OPTS += --without-generic
+else
+WATCHDOGD_CONF_OPTS += --with-generic=$(BR2_PACKAGE_WATCHDOGD_GENERIC_POLL)
+endif
+
+ifeq ($(BR2_PACKAGE_WATCHDOGD_LOADAVG_POLL),0)
+WATCHDOGD_CONF_OPTS += --without-loadavg
+else
+WATCHDOGD_CONF_OPTS += --with-loadavg=$(BR2_PACKAGE_WATCHDOGD_LOADAVG_POLL)
+endif
+
+ifeq ($(BR2_PACKAGE_WATCHDOGD_FILENR_POLL),0)
+WATCHDOGD_CONF_OPTS += --without-filenr
+else
+WATCHDOGD_CONF_OPTS += --with-filenr=$(BR2_PACKAGE_WATCHDOGD_FILENR_POLL)
+endif
+
+ifeq ($(BR2_PACKAGE_WATCHDOGD_MEMINFO_POLL),0)
+WATCHDOGD_CONF_OPTS += --without-meminfo
+else
+WATCHDOGD_CONF_OPTS += --with-meminfo=$(BR2_PACKAGE_WATCHDOGD_MEMINFO_POLL)
+endif
+
+define WATCHDOGD_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/watchdogd/S01watchdogd \
+		$(TARGET_DIR)/etc/init.d/S01watchdogd
+endef
+
+define WATCHDOGD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(WATCHDOGD_PKGDIR)/watchdogd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/watchdogd.service
+endef
+
+$(eval $(autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
