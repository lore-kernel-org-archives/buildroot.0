From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Mon, 23 Apr 2018 17:05:30 +0200
Subject: [Buildroot] [PATCH] package/fail2ban: new package
Message-ID: <1524495930-7061-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fail2ban scans log files (e.g. /var/log/apache/error_log)
and bans IPs that show malicious behaviours.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/Config.in                 |  1 +
 package/fail2ban/Config.in        | 14 ++++++++++++++
 package/fail2ban/S60fail2ban      | 23 +++++++++++++++++++++++
 package/fail2ban/fail2ban.hash    |  2 ++
 package/fail2ban/fail2ban.mk      | 28 ++++++++++++++++++++++++++++
 package/fail2ban/fail2ban.service | 17 +++++++++++++++++
 6 files changed, 85 insertions(+)
 create mode 100644 package/fail2ban/Config.in
 create mode 100644 package/fail2ban/S60fail2ban
 create mode 100644 package/fail2ban/fail2ban.hash
 create mode 100644 package/fail2ban/fail2ban.mk
 create mode 100644 package/fail2ban/fail2ban.service

diff --git a/package/Config.in b/package/Config.in
index ecd9b8f..2ff123b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1700,6 +1700,7 @@ menu "Networking applications"
 	source "package/ejabberd/Config.in"
 	source "package/ethtool/Config.in"
 	source "package/faifa/Config.in"
+	source "package/fail2ban/Config.in"
 	source "package/fastd/Config.in"
 	source "package/fcgiwrap/Config.in"
 	source "package/flannel/Config.in"
diff --git a/package/fail2ban/Config.in b/package/fail2ban/Config.in
new file mode 100644
index 0000000..cf82526
--- /dev/null
+++ b/package/fail2ban/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_FAIL2BAN
+	bool "fail2ban"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Fail2ban scans log files (e.g. /var/log/apache/error_log) and bans IPs
+	  that show the malicious signs -- too many password failures, seeking
+	  for exploits, etc. Out of the box Fail2Ban comes with filters for
+	  various services (apache, courier, ssh, etc).
+
+	  Fail2Ban is able to reduce the rate of incorrect authentications
+	  attempts however it cannot eliminate the risk that weak authentication
+	  presents.
+
+	  https://www.fail2ban.org
diff --git a/package/fail2ban/S60fail2ban b/package/fail2ban/S60fail2ban
new file mode 100644
index 0000000..92559e9
--- /dev/null
+++ b/package/fail2ban/S60fail2ban
@@ -0,0 +1,23 @@
+#!/bin/sh
+
+case "$1" in
+	start)
+		printf "Starting fail2ban: "
+		start-stop-daemon -S -q -m -p /run/fail2ban.pid \
+			-b -x fail2ban-server -- -xf start
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
+		;;
+	stop)
+		printf "Stopping fail2ban: "
+		start-stop-daemon -K -q -p /run/fail2ban.pid
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
+		;;
+	restart)
+		"$0" stop
+		sleep 1
+		"$0" start
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		;;
+esac
diff --git a/package/fail2ban/fail2ban.hash b/package/fail2ban/fail2ban.hash
new file mode 100644
index 0000000..eff6457
--- /dev/null
+++ b/package/fail2ban/fail2ban.hash
@@ -0,0 +1,2 @@
+# sha256 locally computed
+sha256  7ee3fd0e94d58c94298718b25e6bcfa96932712b7aa683580e162403f68d40c8  fail2ban-0.10.3.1.tar.gz
diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
new file mode 100644
index 0000000..7e65f1d
--- /dev/null
+++ b/package/fail2ban/fail2ban.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# fail2ban
+#
+################################################################################
+
+FAIL2BAN_VERSION = 0.10.3.1
+FAIL2BAN_SITE = $(call github,fail2ban,fail2ban,$(FAIL2BAN_VERSION))
+FAIL2BAN_LICENSE = GPL-2.0+
+FAIL2BAN_LICENSE_FILES = README.md
+FAIL2BAN_SETUP_TYPE = setuptools
+FAIL2BAN_INSTALL_TARGET_OPTS = --root=$(TARGET_DIR) --prefix=/usr
+
+define FAIL2BAN_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/fail2ban/S60fail2ban \
+		$(TARGET_DIR)/etc/init.d/S60fail2ban
+endef
+
+define FAIL2BAN_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 package/fail2ban/fail2ban.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/fail2ban.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../../../../usr/lib//systemd/system/fail2ban.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/fail2ban.service
+	$(SED) 's/@BINDIR@/\/usr\/bin/g' $(TARGET_DIR)/usr/lib/systemd/system/fail2ban.service
+endef
+
+$(eval $(python-package))
diff --git a/package/fail2ban/fail2ban.service b/package/fail2ban/fail2ban.service
new file mode 100644
index 0000000..1ec8068
--- /dev/null
+++ b/package/fail2ban/fail2ban.service
@@ -0,0 +1,17 @@
+[Unit]
+Description=Fail2Ban Service
+Documentation=man:fail2ban(1)
+After=network.target iptables.service firewalld.service ip6tables.service ipset.service
+PartOf=iptables.service firewalld.service ip6tables.service ipset.service
+
+[Service]
+Type=simple
+ExecStart=/usr/bin/fail2ban-server -xf start
+ExecStop=/usr/bin/fail2ban-client stop
+ExecReload=/usr/bin/fail2ban-client reload
+PIDFile=/run/fail2ban/fail2ban.pid
+Restart=on-failure
+RestartPreventExitStatus=0 255
+
+[Install]
+WantedBy=multi-user.target
-- 
2.7.4
