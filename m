From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Aug 2019 11:06:44 +0200
Subject: [Buildroot] [git commit] package/sshguard: new package
Message-ID: <20190803090406.53C4C83D20@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d335e44d91a18be877f1036802f1bb9bd5bb256d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sshguard protects hosts from brute-force attacks against SSH and other
services.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
[Peter: cleanup, start init script at S49, correct license, select iptables]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/sshguard/Config.in     | 10 +++++++++
 package/sshguard/S49sshguard   | 49 ++++++++++++++++++++++++++++++++++++++++++
 package/sshguard/sshguard.hash |  4 ++++
 package/sshguard/sshguard.mk   | 33 ++++++++++++++++++++++++++++
 6 files changed, 98 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 02d0815ecf..4338d6ec84 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -177,6 +177,7 @@ F:	package/python-can/
 F:	package/python-pillow/
 F:	package/python-pydal/
 F:	package/python-web2py/
+F:	package/sshguard/
 F:	package/sysdig/
 
 N:	Anisse Astier <anisse@astier.eu>
diff --git a/package/Config.in b/package/Config.in
index 35e71e3185..a7c4c53165 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2055,6 +2055,7 @@ endif
 	source "package/spice/Config.in"
 	source "package/spice-protocol/Config.in"
 	source "package/squid/Config.in"
+	source "package/sshguard/Config.in"
 	source "package/sshpass/Config.in"
 	source "package/sslh/Config.in"
 	source "package/strongswan/Config.in"
diff --git a/package/sshguard/Config.in b/package/sshguard/Config.in
new file mode 100644
index 0000000000..e834f17f41
--- /dev/null
+++ b/package/sshguard/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_SSHGUARD
+	bool "sshguard"
+	select BR2_PACKAGE_IPTABLES # runtime
+	help
+	  sshguard protects hosts from brute-force attacks against SSH
+	  and other services. It aggregates system logs and blocks
+	  repeat offenders using one of several firewall backends,
+	  including iptables, ipfw, and pf.
+
+	  https://www.sshguard.net
diff --git a/package/sshguard/S49sshguard b/package/sshguard/S49sshguard
new file mode 100644
index 0000000000..94776415a5
--- /dev/null
+++ b/package/sshguard/S49sshguard
@@ -0,0 +1,49 @@
+#!/bin/sh
+
+DAEMON="sshguard"
+PIDFILE="/var/run/$DAEMON.pid"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	iptables -L sshguard > /dev/null 2>&1 || \
+	    (iptables -N sshguard && iptables -A INPUT -j sshguard)
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
index 0000000000..beb77a4d62
--- /dev/null
+++ b/package/sshguard/sshguard.hash
@@ -0,0 +1,4 @@
+# sha256 from https://sourceforge.net/projects/sshguard/files/sshguard/2.4.0/sshguard-2.4.0.sha256
+sha256  065ca4091b3a96802714b560dbbc3d9f0e67574e99e2b6e8857aa1027d17d6c0  sshguard-2.4.0.tar.gz
+# Locally calculated
+sha256  c3ae64f12153a1bc55bc234d09f40a08ab0e0149fffc972c0b7f02d5a12c1a5c  COPYING
diff --git a/package/sshguard/sshguard.mk b/package/sshguard/sshguard.mk
new file mode 100644
index 0000000000..0f39974d46
--- /dev/null
+++ b/package/sshguard/sshguard.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# sshguard
+#
+################################################################################
+
+SSHGUARD_VERSION = 2.4.0
+SSHGUARD_SITE = https://sourceforge.net/projects/sshguard/files/sshguard/$(SSHGUARD_VERSION)
+SSHGUARD_LICENSE = ISC, Public Domain (fnv hash), BSD-3-Clause (SimCList)
+SSHGUARD_LICENSE_FILES = COPYING
+
+define SSHGUARD_INSTALL_CONFIG
+	$(INSTALL) -D -m 0644 $(@D)/examples/sshguard.conf.sample \
+		$(TARGET_DIR)/etc/sshguard.conf
+	$(SED) '/^#BACKEND/c\BACKEND="/usr/libexec/sshg-fw-iptables"' \
+		-e '/^#FILES/c\FILES="/var/log/messages"' $(TARGET_DIR)/etc/sshguard.conf
+endef
+SSHGUARD_POST_INSTALL_TARGET_HOOKS += SSHGUARD_INSTALL_CONFIG
+
+define SSHGUARD_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/sshguard/S49sshguard \
+		$(TARGET_DIR)/etc/init.d/S49sshguard
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
