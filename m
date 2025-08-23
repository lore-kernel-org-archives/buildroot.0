Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D3ACA0EFA
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 19:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B053783DCF;
	Sat, 23 Aug 2025 19:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iQnYpzTe4JxX; Sat, 23 Aug 2025 19:50:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B29B783DC5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B29B783DC5;
	Sat, 23 Aug 2025 19:50:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 39283E4
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 19:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F8EB41673
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 19:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jeY6vvCK4PzP for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 19:49:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1D34841625
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D34841625
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D34841625
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 19:49:59 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-45a1b00e4a1so26034385e9.0
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 12:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755978597; x=1756583397;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/EQqi12XEE/FcU5iFh5reUVVex1t4/+3M+Wdxpa2wd4=;
 b=i0KT7fBgYe0Q8IpexRIevxI/4qUqhjRaGGM7Mum864RTIbf4KAELXmLxeO9U0K2mhw
 wCG9qUrOL+XXNqkXJWr8fUJqUz9F/Cfc4ToASZqsBNtiL/dmgPjdiJ1FHdSCD7N5m5ES
 qb9xuMchelP6KnO9BM3mewo1FxbaYHiSrKHjmwUPV+T7GMCkx7es2+RJ1MvSHV8Zhvws
 UbAF7cgas/ORU6keOxaLCKkii2FV0G1Xw7WUV9+PWDAicGH8ikHbHEZuDaFYOfirtdZ9
 MciEtWHzBTpHJNGklbFYdHHZ4ZMneIYBJV59hZssGJHAX7W9oa71FjX3y+hRVyBaEuCA
 GYMw==
X-Gm-Message-State: AOJu0Yw+juaB3pyLRsMGp2nTF03hI6rn4cu5+l52+5u9vSp0GJn3lFu9
 mY6cwD1MeiPJJiTUDLtcYo3d815pyZPY5kQJAxtIoxHiS8OIIjk9w9wUgqiWXTgQKk/fOw5fGa9
 Iwc59
X-Gm-Gg: ASbGncs/h+j3ueNO9lmJjetbEDecbXyax7MIDtkuPN31cYCEBTug9lbL8Na/EL+xhWa
 ZyZ16nvAlNg2o4ofFxWQKZ6hNykQ/nFEkWfiVu9vkBGuCBMJpKnBkntZzN5jJSJ8uDrAR1MtjrZ
 pXxWZLKUn2V5UnstpQVKIrNj+sbYY/aFEfpgb+RbaTjKTpAIMjANzlQ1FhF5ghMLO+BHk9LCuZo
 dqDZtiQxg28wzFIsLD5jzGQix5HVl800SI9DAemDmxGkGCvX3FXVvVJ/6gnboLHQapbgkYyvz9p
 B3lmTqX2Dw+cEH6e5tG7nTk41c4w8mI+eMsyDJxq/QSihB8xF0X46Z2kXpuAq7Be+PwCvT2EyZb
 XH9mAwZBOPQt0TY30RPrlTLAEYS4bnk5fwzoaUgF3tiS25OgEQHDLYRgv/8NwDkWq3TqjP/G81P
 C92xRg4jv6ok06fTZXccTz
X-Google-Smtp-Source: AGHT+IFkoOIhnicx1/FF8b8kdc2y5nyh/q0NzuS18djgzB+qpOKl/9828k1SPJm4HGPqAI2TCYD7Fg==
X-Received: by 2002:a05:600c:3212:b0:459:df48:3b19 with SMTP id
 5b1f17b1804b1-45b517c5df0mr44765805e9.18.1755978596882; 
 Sat, 23 Aug 2025 12:49:56 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b57444958sm45881125e9.2.2025.08.23.12.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Aug 2025 12:49:56 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>, Julien Olivain <ju.o@free.fr>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Sat, 23 Aug 2025 21:49:50 +0200
Message-ID: <20250823194953.3458533-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1755978597; x=1756583397; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/EQqi12XEE/FcU5iFh5reUVVex1t4/+3M+Wdxpa2wd4=;
 b=BAATYbhNJpbv+xp9H7Ij00vncmqgPky0hYpDOrBM7XrWxjVBV+nArgcy3NuwcZPgr7
 98YCphZkAfUEQhxCnysi4b5x8+wly881bp5M8R+foCq7UWgEdjHt6zyphfvIdBK4xHtD
 OoswQBbJlztwPPgnsJRX7rhY7I4WPzVul2KP4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=BAATYbhN
Subject: [Buildroot] [PATCH v2 1/4] package/busybox: add httpd server
 startup script
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

Import S90thttpd from thttpd package to S90httpd but with some changes
following S01syslogd init script as a reference [1].

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/3dc80614442cc3942a372a8c31abd22c1bc96241

Cc: Julien Olivain <ju.o@free.fr>
Cc: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
V2: update S90httpd following S01syslogd init script as a reference (Fiona Klute)
    See: https://gitlab.com/buildroot.org/buildroot/-/commit/3dc80614442cc3942a372a8c31abd22c1bc96241
---
 package/busybox/Config.in  |  6 ++++
 package/busybox/S90httpd   | 59 ++++++++++++++++++++++++++++++++++++++
 package/busybox/busybox.mk | 16 +++++++++++
 3 files changed, 81 insertions(+)
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
index 0000000000..0d43ea3e74
--- /dev/null
+++ b/package/busybox/S90httpd
@@ -0,0 +1,59 @@
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
+# BusyBox' httpd does not create a pidfile, so pass "-f" in the command line
+# and use "--make-pidfile" to instruct start-stop-daemon to create one.
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon --start --background --quiet --make-pidfile \
+		--pidfile "$PIDFILE" --exec "/usr/sbin/$DAEMON" \
+		-- -f $HTTPD_ARGS
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
+	start-stop-daemon --stop --quiet --pidfile "$PIDFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"; do
+		sleep 0.1
+	done
+	rm -f "$PIDFILE"
+	return "$status"
+}
+
+restart() {
+	stop
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
