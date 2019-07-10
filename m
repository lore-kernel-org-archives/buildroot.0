From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed, 10 Jul 2019 23:13:48 +0200
Subject: [Buildroot] [PATCH] package/sshguard: new package
Message-ID: <1562793228-5530-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sshguard protects hosts from brute-force attacks against SSH and other
services.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/sshguard/Config.in     | 10 ++++++++++
 package/sshguard/S39sshguard   | 27 +++++++++++++++++++++++++++
 package/sshguard/sshguard.hash |  3 +++
 package/sshguard/sshguard.mk   | 35 +++++++++++++++++++++++++++++++++++
 6 files changed, 77 insertions(+)
 create mode 100644 package/sshguard/Config.in
 create mode 100644 package/sshguard/S39sshguard
 create mode 100644 package/sshguard/sshguard.hash
 create mode 100644 package/sshguard/sshguard.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e9c521f..ce50777 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -175,6 +175,7 @@ F:	package/python-can/
 F:	package/python-pillow/
 F:	package/python-pydal/
 F:	package/python-web2py/
+F:	package/sshguard/
 F:	package/sysdig/
 
 N:	Anisse Astier <anisse@astier.eu>
diff --git a/package/Config.in b/package/Config.in
index d501b5a..fb03993 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2052,6 +2052,7 @@ endif
 	source "package/spice/Config.in"
 	source "package/spice-protocol/Config.in"
 	source "package/squid/Config.in"
+	source "package/sshguard/Config.in"
 	source "package/sshpass/Config.in"
 	source "package/sslh/Config.in"
 	source "package/strongswan/Config.in"
diff --git a/package/sshguard/Config.in b/package/sshguard/Config.in
new file mode 100644
index 0000000..6bf1800
--- /dev/null
+++ b/package/sshguard/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_SSHGUARD
+	bool "sshguard"
+	depends on BR2_PACKAGE_IPTABLES
+	help
+	  sshguard protects hosts from brute-force attacks against SSH and
+	  other services. It aggregates system logs and blocks repeat offenders
+	  using one of several firewall backends, including iptables, ipfw,
+	  and pf.
+
+	  https://www.sshguard.net
diff --git a/package/sshguard/S39sshguard b/package/sshguard/S39sshguard
new file mode 100644
index 0000000..8b46bc5
--- /dev/null
+++ b/package/sshguard/S39sshguard
@@ -0,0 +1,27 @@
+#!/bin/sh
+
+case "$1" in
+	start)
+		printf "Starting sshguard: "
+		iptables -N sshguard
+		iptables -A INPUT -j sshguard
+		start-stop-daemon -S -q -b -p /run/sshguard.pid \
+			-x /usr/sbin/sshguard -- -i /run/sshguard.pid
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
+		;;
+	stop)
+		printf "Stopping sshguard: "
+		start-stop-daemon -K -q -p /run/sshguard.pid
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
+		iptables -D INPUT -j sshguard
+		iptables -F sshguard
+		iptables -X sshguard
+		;;
+	restart)
+		"$0" stop
+		"$0" start
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		;;
+esac
diff --git a/package/sshguard/sshguard.hash b/package/sshguard/sshguard.hash
new file mode 100644
index 0000000..68f891e
--- /dev/null
+++ b/package/sshguard/sshguard.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256  d34a241ce6f3c5bcaebebd35ad292853d1aa3659f8fb9eb3ad56332259d3135a  sshguard-v2.4.0.tar.gz
+sha256  c3ae64f12153a1bc55bc234d09f40a08ab0e0149fffc972c0b7f02d5a12c1a5c  COPYING
diff --git a/package/sshguard/sshguard.mk b/package/sshguard/sshguard.mk
new file mode 100644
index 0000000..634bc17
--- /dev/null
+++ b/package/sshguard/sshguard.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# sshguard
+#
+################################################################################
+
+SSHGUARD_VERSION = v2.4.0
+SSHGUARD_SITE = https://bitbucket.org/sshguard/sshguard
+SSHGUARD_SITE_METHOD = git
+SSHGUARD_LICENSE = GPL-2.0+
+SSHGUARD_LICENSE_FILES = COPYING
+SSHGUARD_AUTORECONF = YES
+
+define SSHGUARD_INSTALL_CONFIG
+	$(INSTALL) -D -m 0644 $(@D)/examples/sshguard.conf.sample \
+		$(TARGET_DIR)/etc/sshguard.conf
+	$(SED) '/^#BACKEND/c\BACKEND="/usr/libexec/sshg-fw-iptables"' $(TARGET_DIR)/etc/sshguard.conf
+	$(SED) '/^#FILES/c\FILES="/var/log/messages"' $(TARGET_DIR)/etc/sshguard.conf
+endef
+SSHGUARD_POST_INSTALL_TARGET_HOOKS += SSHGUARD_INSTALL_CONFIG
+
+define SSHGUARD_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/sshguard/S60sshguard \
+		$(TARGET_DIR)/etc/init.d/S60sshguard
+endef
+
+define SSHGUARD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(@D)/examples/sshguard.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/sshguard.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../../../../usr/lib/systemd/system/sshguard.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/sshguard.service
+endef
+
+$(eval $(autotools-package))
-- 
2.7.4
