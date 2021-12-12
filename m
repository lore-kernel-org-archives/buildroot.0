Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D64C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 13:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7CC040154;
	Sun, 12 Dec 2021 13:06:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hlac_0Oy4m_B; Sun, 12 Dec 2021 13:06:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC6AE401CC;
	Sun, 12 Dec 2021 13:06:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 95B6B1BF36C
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 13:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85306858FA
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 13:06:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=microchip.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id evHKMowo9MCE for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 13:05:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47F30858F7
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 13:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639314359; x=1670850359;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Rhf7MGc1N0t2PSPD7KcyZog6CTvWgF9MsrOwEZoFpj0=;
 b=DW2naIHNvvBqPeXmx795RlGXfk689AHlGGAbgYLcmwIoFCJEpXW7lZXr
 2XBTg+O2ODV6awmeksxvQ1Im7U6csocsULo3nd2k4ffsYbZgactbbASOW
 PhNT7K4KG2FxD96yjYwCsPM0rVKDz1l3WBi+x9r0tEeqi7RlMHZTexObN
 0kzACMB3J5byfufnfTGPCyx6O6XempNm1vnV+T4cRR9GY5gXEqU0aTFK+
 JWQFBfKV5d4/TeTRHkojB20PEnpakl5XI6jBiN9wMmpeGbgDtrih3qjRZ
 CM9sxKoSSLVg8JeDOuDT14Sxz2Dvr5Iuw3lyJmKzbm6Q0j4+r5/QS5ZFf g==;
IronPort-SDR: edimPql1nsP8jmZ09owddQSa/88HxsVNSGeF/k/M0658+XjdLJlYkDHzI4b1V4lLDeje+rUcQC
 gVm55kla/i6qPRy93kXJkc3wzKhXZzMTXYadvlLxUiJGEVHuNO21yVQ7oVF+19fIUyr2nlHQcB
 HxfZ9bQdJu2lCKNxcjg+iLO7B1ofGiGU+qwOPkmFHfgpZRw7ivM0WnuXDE2o5MJLXzeV85HLrC
 +wDmjmftnvYWykexkDn8FeJYr2kEVDBD2k0aGILJI357EsRae/ew3dpQppDx53PBHP/6RXFSN9
 XhsTJdHvNtXvCwzagldQGY8D
X-IronPort-AV: E=Sophos;i="5.88,200,1635231600"; d="scan'208";a="79274224"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Dec 2021 06:05:57 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sun, 12 Dec 2021 06:05:57 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Sun, 12 Dec 2021 06:05:56 -0700
To: <buildroot@buildroot.org>
Date: Sun, 12 Dec 2021 14:07:45 +0100
Message-ID: <20211212130745.2240973-1-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/cfm: new package
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
From: Horatiu Vultur via buildroot <buildroot@buildroot.org>
Reply-To: Horatiu Vultur <horatiu.vultur@microchip.com>
Cc: Samuel Martin <s.martin49@gmail.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
---
 DEVELOPERS              |  1 +
 package/Config.in       |  1 +
 package/cfm/Config.in   | 17 +++++++++++++
 package/cfm/S65cfm      | 55 +++++++++++++++++++++++++++++++++++++++++
 package/cfm/cfm.hash    |  3 +++
 package/cfm/cfm.mk      | 23 +++++++++++++++++
 package/cfm/cfm.service | 10 ++++++++
 7 files changed, 110 insertions(+)
 create mode 100644 package/cfm/Config.in
 create mode 100644 package/cfm/S65cfm
 create mode 100644 package/cfm/cfm.hash
 create mode 100644 package/cfm/cfm.mk
 create mode 100644 package/cfm/cfm.service

diff --git a/DEVELOPERS b/DEVELOPERS
index 3023526427..f77d473df4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1169,6 +1169,7 @@ F:	package/squeezelite/
 N:	Horatiu Vultur <horatiu.vultur@microchip.com>
 F:	package/easyframes/
 F:	package/mrp/
+F:	package/cfm/
 
 N:	Ian Haylock <haylocki@yahoo.co.uk>
 F:	package/python-rpi-gpio/
diff --git a/package/Config.in b/package/Config.in
index a73e1fb38f..0a5a96afc3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2140,6 +2140,7 @@ menu "Networking applications"
 	source "package/can-utils/Config.in"
 	source "package/cannelloni/Config.in"
 	source "package/casync/Config.in"
+	source "package/cfm/Config.in"
 	source "package/chrony/Config.in"
 	source "package/civetweb/Config.in"
 	source "package/connman/Config.in"
diff --git a/package/cfm/Config.in b/package/cfm/Config.in
new file mode 100644
index 0000000000..1c2e92be67
--- /dev/null
+++ b/package/cfm/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_CFM
+	bool "cfm"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
+	select BR2_PACKAGE_LIBEV
+	select BR2_PACKAGE_LIBMNL
+	select BR2_PACKAGE_LIBNL
+	help
+	  This is the userspace application that configures the kernel
+	  to run CFM protocol. The userspace application is made of 2
+	  applications, one daemon and a client.
+
+	  https://github.com/microchip-ung/cfm
+
+comment "cfm needs a toolchain w/ threads, kernel headers >= 5.0"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
diff --git a/package/cfm/S65cfm b/package/cfm/S65cfm
new file mode 100644
index 0000000000..1019268608
--- /dev/null
+++ b/package/cfm/S65cfm
@@ -0,0 +1,55 @@
+#!/bin/sh
+#
+# Start cfm
+#
+
+DAEMON="cfm_server"
+
+PIDFILE="/var/run/$DAEMON.pid"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/cfm_server" ] && . "/etc/default/cfm_server"
+
+start() {
+	printf "Starting cfm daemon: "
+	start-stop-daemon -S -b -q -m -p $PIDFILE \
+		-x /usr/bin/$DAEMON
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return $status
+}
+
+stop() {
+	printf "Stopping cfm daemon: "
+	start-stop-daemon -K -q -p $PIDFILE
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		rm -f "$PIDFILE"
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return $status
+}
+
+case "$1" in
+  start)
+	start
+	;;
+  stop)
+	stop
+	;;
+  restart|reload)
+	stop
+	start
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/cfm/cfm.hash b/package/cfm/cfm.hash
new file mode 100644
index 0000000000..a1805d81be
--- /dev/null
+++ b/package/cfm/cfm.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256  b5ce096e8c496c397d108201f1a46855f735da6c4163b7a9af345916e75a7126  cfm-0.3.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/cfm/cfm.mk b/package/cfm/cfm.mk
new file mode 100644
index 0000000000..a998bb11ca
--- /dev/null
+++ b/package/cfm/cfm.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# cfm
+#
+################################################################################
+
+CFM_VERSION = 0.3
+CFM_SITE = $(call github,microchip-ung,cfm,v$(CFM_VERSION))
+CFM_DEPENDENCIES = libev libmnl libnl
+CFM_LICENSE = GPL-2.0
+CFM_LICENSE_FILES = LICENSE
+
+define CFM_INSTALL_INIT_SYSV
+	$(INSTALL) -m 755 -D $(CFM_PKGDIR)/S65cfm \
+		$(TARGET_DIR)/etc/init.d/S65cfm
+endef
+
+define CFM_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(CFM_PKGDIR)/cfm.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/cfm.service
+endef
+
+$(eval $(cmake-package))
diff --git a/package/cfm/cfm.service b/package/cfm/cfm.service
new file mode 100644
index 0000000000..1a00c5ba08
--- /dev/null
+++ b/package/cfm/cfm.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Connectivity Fault Management
+After=network.target
+
+[Service]
+ExecStart=/usr/bin/cfm_server
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
