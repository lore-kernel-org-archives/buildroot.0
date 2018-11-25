From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Nov 2018 09:32:06 +0100
Subject: [Buildroot] [git commit] package/fail2ban: new package
Message-ID: <20181202071559.38786815BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3311064278320fd822c0946777801f8b35ce9a93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fail2ban scans log files (e.g. /var/log/apache/error_log)
and bans IPs that show malicious behaviours.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
[Thomas: simplify $(SED) expression by using comma as a separator
instead of slash.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/fail2ban/Config.in     | 15 +++++++++++++++
 package/fail2ban/S60fail2ban   | 23 +++++++++++++++++++++++
 package/fail2ban/fail2ban.hash |  3 +++
 package/fail2ban/fail2ban.mk   | 27 +++++++++++++++++++++++++++
 6 files changed, 70 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1cfa9969bf..1ed266eafc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -146,6 +146,7 @@ F:	package/libunwind/
 
 N:	Angelo Compagnucci <angelo.compagnucci@gmail.com>
 F:	package/corkscrew/
+F:	package/fail2ban/
 F:	package/i2c-tools/
 F:	package/mender/
 F:	package/mono/
diff --git a/package/Config.in b/package/Config.in
index ce8d70c458..6e0f3c9a92 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1832,6 +1832,7 @@ menu "Networking applications"
 	source "package/ejabberd/Config.in"
 	source "package/ethtool/Config.in"
 	source "package/faifa/Config.in"
+	source "package/fail2ban/Config.in"
 	source "package/fastd/Config.in"
 	source "package/fcgiwrap/Config.in"
 	source "package/flannel/Config.in"
diff --git a/package/fail2ban/Config.in b/package/fail2ban/Config.in
new file mode 100644
index 0000000000..8fa63bfdcb
--- /dev/null
+++ b/package/fail2ban/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_FAIL2BAN
+	bool "fail2ban"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Fail2ban scans log files (e.g. /var/log/apache/error_log) and
+	  bans IPs that show the malicious signs -- too many password
+	  failures, seeking for exploits, etc. Out of the box Fail2Ban
+	  comes with filters for various services (apache, courier,
+	  ssh, etc).
+
+	  Fail2Ban is able to reduce the rate of incorrect
+	  authentications attempts however it cannot eliminate the risk
+	  that weak authentication presents.
+
+	  https://www.fail2ban.org
diff --git a/package/fail2ban/S60fail2ban b/package/fail2ban/S60fail2ban
new file mode 100644
index 0000000000..b181ecde2c
--- /dev/null
+++ b/package/fail2ban/S60fail2ban
@@ -0,0 +1,23 @@
+#!/bin/sh
+
+case "$1" in
+	start)
+		printf "Starting fail2ban: "
+		start-stop-daemon -S -q -m -p /var/run/fail2ban.pid \
+			-b -x fail2ban-server -- -xf start
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
+		;;
+	stop)
+		printf "Stopping fail2ban: "
+		start-stop-daemon -K -q -p /var/run/fail2ban.pid
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
index 0000000000..25d120c115
--- /dev/null
+++ b/package/fail2ban/fail2ban.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256  d6ca1bbc7e7944f7acb2ba7c1065953cd9837680bc4d175f30ed155c6a372449  fail2ban-0.10.4.tar.gz
+sha256  a75fec0260742fe6275d63ff6a5d97b924b28766558306b3fa4069763096929b  COPYING
diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
new file mode 100644
index 0000000000..b7e6bdc1a6
--- /dev/null
+++ b/package/fail2ban/fail2ban.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# fail2ban
+#
+################################################################################
+
+FAIL2BAN_VERSION = 0.10.4
+FAIL2BAN_SITE = $(call github,fail2ban,fail2ban,$(FAIL2BAN_VERSION))
+FAIL2BAN_LICENSE = GPL-2.0+
+FAIL2BAN_LICENSE_FILES = COPYING
+FAIL2BAN_SETUP_TYPE = distutils
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
+	$(SED) 's, at BINDIR@,/usr/bin,g' $(TARGET_DIR)/usr/lib/systemd/system/fail2ban.service
+endef
+
+$(eval $(python-package))
