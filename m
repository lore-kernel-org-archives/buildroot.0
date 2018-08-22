From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed, 22 Aug 2018 15:41:52 +0200
Subject: [Buildroot] [PATCH v2] package/fail2ban: new package
Message-ID: <1534945312-25275-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fail2ban scans log files (e.g. /var/log/apache/error_log)
and bans IPs that show malicious behaviours.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
Changes:
v1->v2: 
* Adding sha256 for license file
* getting service file for systemd from source directory

 package/Config.in              |  1 +
 package/fail2ban/Config.in     | 14 ++++++++++++++
 package/fail2ban/S60fail2ban   | 23 +++++++++++++++++++++++
 package/fail2ban/fail2ban.hash |  3 +++
 package/fail2ban/fail2ban.mk   | 28 ++++++++++++++++++++++++++++
 5 files changed, 69 insertions(+)
 create mode 100644 package/fail2ban/Config.in
 create mode 100644 package/fail2ban/S60fail2ban
 create mode 100644 package/fail2ban/fail2ban.hash
 create mode 100644 package/fail2ban/fail2ban.mk

diff --git a/package/Config.in b/package/Config.in
index f5a1749..1783ab9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1740,6 +1740,7 @@ menu "Networking applications"
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
index 0000000..4b59091
--- /dev/null
+++ b/package/fail2ban/fail2ban.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256  7ee3fd0e94d58c94298718b25e6bcfa96932712b7aa683580e162403f68d40c8  fail2ban-0.10.3.1.tar.gz
+sha256  a75fec0260742fe6275d63ff6a5d97b924b28766558306b3fa4069763096929b  COPYING
diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
new file mode 100644
index 0000000..cc6961f
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
+FAIL2BAN_LICENSE_FILES = COPYING
+FAIL2BAN_SETUP_TYPE = setuptools
+FAIL2BAN_INSTALL_TARGET_OPTS = --root=$(TARGET_DIR) --prefix=/usr
+
+define FAIL2BAN_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/fail2ban/S60fail2ban \
+		$(TARGET_DIR)/etc/init.d/S60fail2ban
+endef
+
+define FAIL2BAN_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(@D)/files/fail2ban.service.in \
+		$(TARGET_DIR)/usr/lib/systemd/system/fail2ban.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../../../../usr/lib//systemd/system/fail2ban.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/fail2ban.service
+	$(SED) 's/@BINDIR@/\/usr\/bin/g' $(TARGET_DIR)/usr/lib/systemd/system/fail2ban.service
+endef
+
+$(eval $(python-package))
-- 
2.7.4
