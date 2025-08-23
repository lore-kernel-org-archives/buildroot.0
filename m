Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00982CA0EE4
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 15:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5226F6132A;
	Sat, 23 Aug 2025 15:05:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VvHZWmVJcjOD; Sat, 23 Aug 2025 15:05:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBA1461312
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBA1461312;
	Sat, 23 Aug 2025 15:05:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 838FA71E
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 15:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 757244147F
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 15:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CYCakkrDVJ9M for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 15:05:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5614C41336
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5614C41336
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5614C41336
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 15:05:48 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3c68ac7e18aso755916f8f.2
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 08:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755961546; x=1756566346;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cbSA5kiYvicEXALwKL+4ps6KARyvQQgiag+CJYPquoY=;
 b=claeveNqKCZkVj1GDcCAbCzNL9utqh1akRnc3g7rXzA63RizcbMFnNUX7GfbDcu5m8
 bBOe6jwIzOtuhEqJsnTYKJ8NN1WybvpgPrMjeI/0Qqk87Kj2ZkBLv1Yz9AVzRa0ntno+
 u/7anUvrZF2BQUke+RymtpB6mp0gzlSV+wokXcKmQFX5csGj05K/xcR38LKQgQ1Dfuyk
 7g77uVcBob3swRfIjzEnFK2khOb7aT61MM8lObSBTve5Vu2YpjTlLmwAsT3BFAxPMVYi
 33rGnjRHLRnLy+Qno2fFFugbIarjJukXucUh+psP1yT5qoiSvCzCzUYzng8ItPFDweDp
 pjvA==
X-Gm-Message-State: AOJu0Ywnoi/xnLKJMgxIhrKdflkoAp7vd82YxWe6UzU4LEYLVPDdXhAF
 uQsRiEmmZiZ0KCgLoOPbNQzoeIbv2ILsm6p8o8HS7VNLMCg1fSbKQggDsnOve45MHDj/G52S5SY
 8WOOf
X-Gm-Gg: ASbGncvyWZTlDQO2MMywU/ucbLmyV7cCq88B9R95kyw+9MufHakGWL3omgPhJ4oS1IF
 kcOvx67uKsXM2vFqvEGV9DeTQvZ4unwzCuiW3JkGLHtfuiivxpiz7wWo6svgE1IogT2NzcBURfD
 /zVu2i13wO4wWq6pp9yALoabW8KK+Wk1qDW4LqKv9mioFqaaiKCWnQCgnFD68KJ+BWW20pc33ix
 BO5Kj8bkqkd2cVXFqDaIgPicd3zJHhh2Oqu4hRR5gokK2TPEB9PQgdPsYP1cIY7aezIhtHOLmYa
 etSj1dM/PqCNbD4RonJY7bso/bst9iJIi+GuU5pdNzRBwmA8jEDvuMbkQBDTFNHf5upmmjvXs1W
 4W/5UG0c7i3ySGDLvULlUZ4606HYeMJQ3gOz/e2SWjw9h71ww5Cbg+MPVC0J2FEyM1q3Pxsmc6a
 9inWx6SdmC2+nmjfGM2QMP4oh1LENxXpY=
X-Google-Smtp-Source: AGHT+IGGJSYD4kTxLsZmfauD//UNw8ucqjGelaEFYyFfwLPjR/65+fNp4CKiNh9QGTqI8WEY0m4NSQ==
X-Received: by 2002:a5d:64ed:0:b0:3b6:c6b:e4e6 with SMTP id
 ffacd0b85a97d-3c5da740320mr5405643f8f.11.1755961546182; 
 Sat, 23 Aug 2025 08:05:46 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c711d9f389sm3833503f8f.60.2025.08.23.08.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Aug 2025 08:05:45 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
	Julien Olivain <ju.o@free.fr>
Date: Sat, 23 Aug 2025 17:05:40 +0200
Message-ID: <20250823150543.3233205-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1755961546; x=1756566346; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cbSA5kiYvicEXALwKL+4ps6KARyvQQgiag+CJYPquoY=;
 b=IUjfaNuCBx2fHm8dxhB7BwfWEDASn4A7iSQK/0L8a885418upk2Y7cNmBOFMUs0vPq
 mNCDCy/dZvyWJM77Y2EfMV9+peFQUiETxZQc5x9eEiruajL9ahjJBDUX4Mfv+fKrLnN6
 p3IyQvvwH9t8F6JkEMyBv8S9VmQ4auVMxvg1g=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=IUjfaNuC
Subject: [Buildroot] [PATCH 1/4] package/busybox: add httpd server startup
 script
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In order to remove thttpd package from Buildroot, we have to replace it
from our testsuite (TestWget and TestLibCurl).

Busybox provide an httpd server applet but it's not enabled in our
default busybox configuration.

For the sake of those tests, add a new busybox option to build and
install the Busybox's httpd server and its init script.

Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/busybox/Config.in  |  6 +++++
 package/busybox/S90httpd   | 54 ++++++++++++++++++++++++++++++++++++++
 package/busybox/busybox.mk | 16 +++++++++++
 3 files changed, 76 insertions(+)
 create mode 100644 package/busybox/S90httpd

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 3c2aa515f8..659c6aebfc 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -69,6 +69,12 @@ config BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES
 comment "Busybox individual binaries need a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 
+config BR2_PACKAGE_BUSYBOX_HTTPD
+	bool "Install the httpd server startup script"
+	help
+	  Install the httpd server startup script,
+	  that just start at the boot the busybox httpd server
+
 config BR2_PACKAGE_BUSYBOX_WATCHDOG
 	bool "Install the watchdog daemon startup script"
 	help
diff --git a/package/busybox/S90httpd b/package/busybox/S90httpd
new file mode 100644
index 0000000000..c148d19adf
--- /dev/null
+++ b/package/busybox/S90httpd
@@ -0,0 +1,54 @@
+#!/bin/sh
+
+DAEMON="httpd"
+PIDFILE="/var/run/$DAEMON.pid"
+
+HTTPD_ARGS="-h /var/www/data"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
+		-- $HTTPD_ARGS
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+stop() {
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon -K -q -p "$PIDFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		# httpd does not remove the pid file on exit
+		rm -f "$PIDFILE"
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+restart() {
+	stop
+	sleep 1
+	start
+}
+
+case "$1" in
+	start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 532932ec8f..d7eda71db6 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -258,6 +258,19 @@ define BUSYBOX_SET_SELINUX
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_BUSYBOX_HTTPD),y)
+define BUSYBOX_SET_HTTPD
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HTTPD)
+endef
+define BUSYBOX_INSTALL_HTTPD_SCRIPT
+	if grep -q CONFIG_HTTPD=y $(@D)/.config; then \
+		mkdir -p $(TARGET_DIR)/var/www/data ;\
+		$(INSTALL) -m 0755 -D package/busybox/S90httpd \
+			$(TARGET_DIR)/etc/init.d/S90httpd ; \
+	fi
+endef
+endif
+
 # enable relevant options to allow the Busybox less applet to be used
 # as a systemd pager
 ifeq ($(BR2_PACKAGE_SYSTEMD):$(BR2_PACKAGE_LESS),y:)
@@ -418,6 +431,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_WATCHDOG)
 	$(BUSYBOX_SET_SELINUX)
 	$(BUSYBOX_SET_LESS_FLAGS)
+	$(BUSYBOX_SET_HTTPD)
 	$(BUSYBOX_SET_INDIVIDUAL_BINARIES)
 	$(BUSYBOX_DISABLE_IP_LINK_CAN)
 	$(PACKAGES_BUSYBOX_CONFIG_FIXUPS)
@@ -447,6 +461,7 @@ define BUSYBOX_INSTALL_INIT_OPENRC
 	$(BUSYBOX_INSTALL_IFPLUGD_SCRIPT)
 	$(BUSYBOX_INSTALL_CROND_SCRIPT)
 	$(BUSYBOX_INSTALL_TELNET_SCRIPT)
+	$(BUSYBOX_INSTALL_HTTPD_SCRIPT)
 endef
 
 define BUSYBOX_INSTALL_INIT_SYSTEMD
@@ -461,6 +476,7 @@ define BUSYBOX_INSTALL_INIT_SYSV
 	$(BUSYBOX_INSTALL_IFPLUGD_SCRIPT)
 	$(BUSYBOX_INSTALL_CROND_SCRIPT)
 	$(BUSYBOX_INSTALL_TELNET_SCRIPT)
+	$(BUSYBOX_INSTALL_HTTPD_SCRIPT)
 endef
 
 # Checks to give errors that the user can understand
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
