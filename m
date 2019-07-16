From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 16 Jul 2019 21:56:52 +0200
Subject: [Buildroot] [PATCH v2] package/sshguard: new package
Message-ID: <1563307012-3724-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sshguard protects hosts from brute-force attacks against SSH and other
services.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
CHANGELOG:
v1->v2:
* Fixed license (suggested by Thomas)
* Fixed sysv script (suggested by Thomas)
* Moved from using git to use tarball

 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/sshguard/Config.in     | 10 +++++++++
 package/sshguard/S39sshguard   | 50 ++++++++++++++++++++++++++++++++++++++++++
 package/sshguard/sshguard.hash |  3 +++
 package/sshguard/sshguard.mk   | 34 ++++++++++++++++++++++++++++
 6 files changed, 99 insertions(+)
 create mode 100644 package/sshguard/Config.in
 create mode 100644 package/sshguard/S39sshguard
 create mode 100644 package/sshguard/sshguard.hash
 create mode 100644 package/sshguard/sshguard.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 4ab4e36..61e11b5 100644
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
index 90dddfd..03b86f6 100644
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
index 0000000..d277b9a
--- /dev/null
+++ b/package/sshguard/S39sshguard
@@ -0,0 +1,50 @@
+#!/bin/sh
+
+DAEMON="sshguard"
+PIDFILE="/var/run/$DAEMON.pid"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	iptables -L sshguard > /dev/null 2>&1 || \
+	(iptables -N sshguard && \
+	iptables -A INPUT -j sshguard)
+	start-stop-daemon -S -q -b -p /run/sshguard.pid \
+		-x /usr/sbin/sshguard -- -i /run/sshguard.pid
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
diff --git a/package/sshguard/sshguard.hash b/package/sshguard/sshguard.hash
new file mode 100644
index 0000000..5b9a0f0
--- /dev/null
+++ b/package/sshguard/sshguard.hash
@@ -0,0 +1,3 @@
+# sha256 from https://sourceforge.net/projects/sshguard/files/sshguard/2.4.0/sshguard-2.4.0.sha256
+sha256  065ca4091b3a96802714b560dbbc3d9f0e67574e99e2b6e8857aa1027d17d6c0  sshguard-2.4.0.tar.gz
+sha256  c3ae64f12153a1bc55bc234d09f40a08ab0e0149fffc972c0b7f02d5a12c1a5c  COPYING
diff --git a/package/sshguard/sshguard.mk b/package/sshguard/sshguard.mk
new file mode 100644
index 0000000..1ec137e
--- /dev/null
+++ b/package/sshguard/sshguard.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# sshguard
+#
+################################################################################
+
+SSHGUARD_VERSION = 2.4.0
+SSHGUARD_SOURCE = sshguard-$(SSHGUARD_VERSION).tar.gz
+SSHGUARD_SITE = https://sourceforge.net/projects/sshguard/files/sshguard/$(SSHGUARD_VERSION)
+SSHGUARD_LICENSE = MIT, X11, GPL-2.0+, Public Domain, ISC
+SSHGUARD_LICENSE_FILES = COPYING
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
+	$(INSTALL) -D -m 755 package/sshguard/S39sshguard \
+		$(TARGET_DIR)/etc/init.d/S39sshguard
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
