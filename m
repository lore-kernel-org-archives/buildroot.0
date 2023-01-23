Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08348C05027
	for <buildroot@archiver.kernel.org>; Mon, 23 Jan 2023 05:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F85F41685;
	Mon, 23 Jan 2023 05:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F85F41685
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2_AnpQzMbynK; Mon, 23 Jan 2023 05:53:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6728B4167B;
	Mon, 23 Jan 2023 05:53:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6728B4167B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 614301BF5AD
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 05:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49DA0404C8
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 05:53:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49DA0404C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nkn-7d_p7-jG for <buildroot@lists.busybox.net>;
 Mon, 23 Jan 2023 05:53:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1992B400BB
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1992B400BB
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 05:53:03 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id 18so13269693edw.7
 for <buildroot@buildroot.org>; Sun, 22 Jan 2023 21:53:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N2fTQtbWhL6PPpxjDNIrC/34sALFP4mwNSWDpV8AX0A=;
 b=6K+BAEc+XTtbUepkXlamVaI8ok9lb4RoUyrWNsPazIy75tV3UUDQZE1alF2BOMgysS
 psOnBQjf2gWVt3aIpGL6pwsFMPi9yg8WfaqlHoKSoZDF0p6PUEYUsfWbnFc4KvBa/0hN
 zfPfEuPhYWi55d9r2VqHU26h28bnNJnupPkKrIVuizX0Xe/1lrP5xODlaX3VCCYNR1x6
 e5v1haUskd4ZxiKRkGPMwvwYLRWvM8FaMsu9vHjSN+0wf1Y5rNZrwRx5dGYXe57D1nJa
 sTO9Tcy1gWZ+npvo9Uacpj0P8uqcb5pcmsZalJSPoXdbJVyt+tx/NvTJk1k7cciBbK8E
 TorQ==
X-Gm-Message-State: AFqh2kogCYSywYEBe/3y71HuQTMFQ/0pdWrnMciB7qveNk4b3EfKwhgr
 InzxLTtNrfDHxZ4EvXm2yBeQ3DwEJoc=
X-Google-Smtp-Source: AMrXdXvcQ/TtYy+2uw+At5Sx7cX57JPeHFq5rw/ul2OH/cal9FNTpXDvx/NdE4lwXMrTiOUFTNQWWQ==
X-Received: by 2002:a05:6402:5024:b0:49d:1c3a:b5fb with SMTP id
 p36-20020a056402502400b0049d1c3ab5fbmr26896205eda.28.1674453181977; 
 Sun, 22 Jan 2023 21:53:01 -0800 (PST)
Received: from luthien.lan ([98.128.186.71]) by smtp.gmail.com with ESMTPSA id
 q24-20020a056402249800b0046ac460da13sm21215343eda.53.2023.01.22.21.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Jan 2023 21:53:01 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Jan 2023 06:52:58 +0100
Message-Id: <20230123055259.2285749-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N2fTQtbWhL6PPpxjDNIrC/34sALFP4mwNSWDpV8AX0A=;
 b=gVqsn+UAvoDDCeYUeSWabS2XoGA9wteCmW6a+dRRhyzikRqvaKMI7W6fOevrACQbZy
 Fl/rQFbUCR3ITebFhoO5VGhKz4fn33ktAmHh82IZ1jH6+BmV7o22tIixh0sQZgL0mEnT
 /jye+QI7UCzeaisOdJ8f2n4eose1OG7kQ+WxMm5HUysdMUW6a5aQgo70A0CJxEplpjJ1
 nqN0l6a2fy1m+KR5SaQL8lwUJSTCF5scMkuEy2JTHxW8QkLUKTQRG0CTzFD1sZpB+h9o
 /Kx3QPDUJ/gf7QfqApD/pa6uKFPmJvsXuaVZqwCLujC8/urNwxl/tdGCCHTFgG9HyXJs
 JB6w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gVqsn+UA
Subject: [Buildroot] [PATCH 1/1] package/mdnsd: new package
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 DEVELOPERS                    |  1 +
 package/Config.in             |  1 +
 package/mdnsd/Config.in       | 50 +++++++++++++++++++++++
 package/mdnsd/S50mdnsd        | 51 ++++++++++++++++++++++++
 package/mdnsd/ftp.service     |  2 +
 package/mdnsd/http.service    |  2 +
 package/mdnsd/ipp.service     |  2 +
 package/mdnsd/mdnsd.hash      |  6 +++
 package/mdnsd/mdnsd.mk        | 75 +++++++++++++++++++++++++++++++++++
 package/mdnsd/printer.service |  2 +
 package/mdnsd/ssh.service     |  2 +
 11 files changed, 194 insertions(+)
 create mode 100644 package/mdnsd/Config.in
 create mode 100755 package/mdnsd/S50mdnsd
 create mode 100644 package/mdnsd/ftp.service
 create mode 100644 package/mdnsd/http.service
 create mode 100644 package/mdnsd/ipp.service
 create mode 100644 package/mdnsd/mdnsd.hash
 create mode 100644 package/mdnsd/mdnsd.mk
 create mode 100644 package/mdnsd/printer.service
 create mode 100644 package/mdnsd/ssh.service

diff --git a/DEVELOPERS b/DEVELOPERS
index e8e0dffcd3..bb12d79b11 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1491,6 +1491,7 @@ F:	package/libnet/
 F:	package/libteam/
 F:	package/libuev/
 F:	package/mg/
+F:	package/mdnsd/
 F:	package/mini-snmpd/
 F:	package/mrouted/
 F:	package/netcalc/
diff --git a/package/Config.in b/package/Config.in
index 995dae2c57..faa7e7d628 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1932,6 +1932,7 @@ menu "Networking"
 	source "package/libyang/Config.in"
 	source "package/lksctp-tools/Config.in"
 	source "package/mbuffer/Config.in"
+	source "package/mdnsd/Config.in"
 	source "package/mongoose/Config.in"
 	source "package/nanomsg/Config.in"
 	source "package/neon/Config.in"
diff --git a/package/mdnsd/Config.in b/package/mdnsd/Config.in
new file mode 100644
index 0000000000..095a924e98
--- /dev/null
+++ b/package/mdnsd/Config.in
@@ -0,0 +1,50 @@
+config BR2_PACKAGE_MDNSD
+	bool "mdnsd"
+	depends on BR2_USE_MMU # fork()
+	help
+	  Small mDNS-SD daemon for advertising services and device discovery,
+	  similar to Avahi and Bonjour.
+
+	  By default, mdnsd runs on all interfaces that support multicast.
+	  It reads services to announce from /etc/mdns.d/*.service, a few
+	  common services are included below.  To override the defaults,
+	  e.g., path to services, TTL of multicast frames, or the default
+	  interface, set MDNSD_ARGS in /etc/default/mdnsd
+
+	  Note: currently no NSS integration with GLIBC.
+
+if BR2_PACKAGE_MDNSD
+
+config BR2_PACKAGE_MDNSD_MQUERY
+	bool "mquery"
+	default n
+	help
+  	  Scan a LAN for mDNS capable devices, or query specific records,
+	  similar to the mdns-scan tool.  Useful for verifying multicast
+	  connectivity or locating neighbors with link-local address.
+
+comment "Services to advertise"
+
+config BR2_PACKAGE_MDNSD_FTP_SERVICE
+	bool "FTP service"
+	default n
+
+config BR2_PACKAGE_MDNSD_HTTP_SERVICE
+	bool "HTTP service"
+	default n
+
+config BR2_PACKAGE_MDNSD_IPP_SERVICE
+	bool "IPP service"
+	default n
+
+config BR2_PACKAGE_MDNSD_PRINTER_SERVICE
+	bool "Printer service"
+	default n
+
+config BR2_PACKAGE_MDNSD_SSH_SERVICE
+	bool "SSH service"
+	default y if BR2_PACKAGE_DROPBEAR
+	default y if BR2_PACKAGE_OPENSSH
+	default y if BR2_PACKAGE_LIBSSH_SERVER
+
+endif
diff --git a/package/mdnsd/S50mdnsd b/package/mdnsd/S50mdnsd
new file mode 100755
index 0000000000..1c2b71802c
--- /dev/null
+++ b/package/mdnsd/S50mdnsd
@@ -0,0 +1,51 @@
+#!/bin/sh
+
+DAEMON=mdnsd
+MDNSD=/usr/sbin/$DAEMON
+PIDFILE=/var/run/$DAEMON.pid
+CFGFILE=/etc/default/$DAEMON
+
+MDNSD_ARGS=""
+
+# Read configuration variable file if it is present
+# shellcheck source=/dev/null
+[ -r "$CFGFILE" ] && . "$CFGFILE"
+
+# shellcheck disable=SC2086
+start() {
+	[ -n "$1" ] || printf 'Starting %s: ' "$DAEMON"
+	start-stop-daemon -S -q -p "$PIDFILE" -x "$MDNSD" -- $MDNSD_ARGS
+}
+
+stop() {
+	[ -n "$1" ] || printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon -K -q -p "$PIDFILE" -x "$MDNSD"
+}
+
+restart() {
+	printf 'Restarting %s: ' "$DAEMON"
+	stop  silent
+	start silent
+}
+
+# SIGHUP reloads /etc/mdns.d/*.service
+reload() {
+	printf 'Reloading %s: ' "$DAEMON"
+	start-stop-daemon -K -s HUP -q -p "$PIDFILE" -x "$MDNSD"
+}
+
+case "$1" in
+	start|stop|restart|reload)
+		if "$1"; then
+			echo "OK"
+		else
+			echo "FAIL"
+		fi
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+		;;
+esac
+
+exit $?
diff --git a/package/mdnsd/ftp.service b/package/mdnsd/ftp.service
new file mode 100644
index 0000000000..200a379efd
--- /dev/null
+++ b/package/mdnsd/ftp.service
@@ -0,0 +1,2 @@
+type _ftp._tcp
+port 21
diff --git a/package/mdnsd/http.service b/package/mdnsd/http.service
new file mode 100644
index 0000000000..7a40d2405f
--- /dev/null
+++ b/package/mdnsd/http.service
@@ -0,0 +1,2 @@
+type _http._tcp
+port 80
diff --git a/package/mdnsd/ipp.service b/package/mdnsd/ipp.service
new file mode 100644
index 0000000000..0d43e780d1
--- /dev/null
+++ b/package/mdnsd/ipp.service
@@ -0,0 +1,2 @@
+type _ipp._tcp
+port 631
diff --git a/package/mdnsd/mdnsd.hash b/package/mdnsd/mdnsd.hash
new file mode 100644
index 0000000000..2fa7552d85
--- /dev/null
+++ b/package/mdnsd/mdnsd.hash
@@ -0,0 +1,6 @@
+# Upstream sha256 from GitHub
+sha256  1af8742ab82a0af88d99d0b15508358ad4305879ab039631bea889138f5c87e8  mdnsd-0.12.tar.gz
+
+# Locally computed
+sha256  2969546227b58ce1b431cc4c36c9a9b45d604e6b94fb8b787ea5d3696f3eee3b  LICENSE
+
diff --git a/package/mdnsd/mdnsd.mk b/package/mdnsd/mdnsd.mk
new file mode 100644
index 0000000000..90a4d4c051
--- /dev/null
+++ b/package/mdnsd/mdnsd.mk
@@ -0,0 +1,75 @@
+################################################################################
+#
+# mdnsd
+#
+################################################################################
+
+MDNSD_VERSION = 0.12
+MDNSD_SITE = https://github.com/troglobit/mdnsd/releases/download/v$(MDNSD_VERSION)
+MDNSD_LICENSE = BSD-3-Clause
+MDNSD_LICENSE_FILES = LICENSE
+MDNSD_DEPENDENCIES = host-pkgconf
+
+ifeq ($(BR2_PACKAGE_MDNSD_MQUERY),y)
+MDNSD_CONF_OPTS += --with-mquery
+else
+MDNSD_CONF_OPTS += --without-mquery
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+MDNSD_DEPENDENCIES += systemd
+MDNSD_CONF_OPTS += --with-systemd
+else
+MDNSD_CONF_OPTS += --without-systemd
+endif
+
+ifeq ($(BR2_PACKAGE_MDNSD_FTP_SERVICE),y)
+define MDNSD_INSTALL_FTP_SERVICE
+	$(INSTALL) -D -m 0644 package/mdnsd/ftp.service \
+		$(TARGET_DIR)/etc/mdns.d/
+endef
+MDNSD_POST_INSTALL_TARGET_HOOKS += MDNSD_INSTALL_FTP_SERVICE
+endif
+
+ifeq ($(BR2_PACKAGE_MDNSD_HTTP_SERVICE),y)
+define MDNSD_INSTALL_HTTP_SERVICE
+	$(INSTALL) -D -m 0644 package/mdnsd/http.service \
+		$(TARGET_DIR)/etc/mdns.d/
+endef
+MDNSD_POST_INSTALL_TARGET_HOOKS += MDNSD_INSTALL_HTTP_SERVICE
+endif
+
+ifeq ($(BR2_PACKAGE_MDNSD_IPP_SERVICE),y)
+define MDNSD_INSTALL_IPP_SERVICE
+	$(INSTALL) -D -m 0644 package/mdnsd/ipp.service \
+		$(TARGET_DIR)/etc/mdns.d/
+endef
+MDNSD_POST_INSTALL_TARGET_HOOKS += MDNSD_INSTALL_IPP_SERVICE
+endif
+
+ifeq ($(BR2_PACKAGE_MDNSD_PRINTER_SERVICE),y)
+define MDNSD_INSTALL_PRINTER_SERVICE
+	$(INSTALL) -D -m 0644 package/mdnsd/printer.service \
+		$(TARGET_DIR)/etc/mdns.d/
+endef
+MDNSD_POST_INSTALL_TARGET_HOOKS += MDNSD_INSTALL_PRINTER_SERVICE
+endif
+
+ifeq ($(BR2_PACKAGE_MDNSD_SSH_SERVICE),y)
+define MDNSD_INSTALL_SSH_SERVICE
+	$(INSTALL) -D -m 0644 package/mdnsd/ssh.service \
+		$(TARGET_DIR)/etc/mdns.d/
+endef
+MDNSD_POST_INSTALL_TARGET_HOOKS += MDNSD_INSTALL_SSH_SERVICE
+endif
+
+define MDNSD_INSTALL_INIT_SYSV
+	$(INSTALL) -m 755 -D package/mdnsd/S50mdnsd $(TARGET_DIR)/etc/init.d/
+endef
+
+define MDNSD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(@D)/mdnsd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/mdnsd.service
+endef
+
+$(eval $(autotools-package))
diff --git a/package/mdnsd/printer.service b/package/mdnsd/printer.service
new file mode 100644
index 0000000000..cd32295471
--- /dev/null
+++ b/package/mdnsd/printer.service
@@ -0,0 +1,2 @@
+type _printer._tcp
+port 515
diff --git a/package/mdnsd/ssh.service b/package/mdnsd/ssh.service
new file mode 100644
index 0000000000..596d20ba17
--- /dev/null
+++ b/package/mdnsd/ssh.service
@@ -0,0 +1,2 @@
+type _ssh._tcp
+port 22
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
