From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Sun, 3 Jul 2011 22:41:20 +0200
Subject: [Buildroot] [git commit] package: add stunnel
Message-ID: <20110703204137.A8CD889038@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=266c5cdaeb1c27fec4b72b43200162b30bf356da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Stunnel is an SSL tunnelling proxy.

[Peter: misc fixes, Config.in, allow skeleton override of stunnel.conf]
Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/stunnel/Config.in  |    8 ++++++++
 package/stunnel/S50stunnel |   36 ++++++++++++++++++++++++++++++++++++
 package/stunnel/stunnel.mk |   25 +++++++++++++++++++++++++
 4 files changed, 70 insertions(+), 0 deletions(-)
 create mode 100644 package/stunnel/Config.in
 create mode 100644 package/stunnel/S50stunnel
 create mode 100644 package/stunnel/stunnel.mk

diff --git a/package/Config.in b/package/Config.in
index 8f1f030..1a4815a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -441,6 +441,7 @@ source "package/ser2net/Config.in"
 source "package/socat/Config.in"
 source "package/spawn-fcgi/Config.in"
 source "package/squid/Config.in"
+source "package/stunnel/Config.in"
 source "package/tcpdump/Config.in"
 source "package/tcpreplay/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/stunnel/Config.in b/package/stunnel/Config.in
new file mode 100644
index 0000000..b1977ed
--- /dev/null
+++ b/package/stunnel/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_STUNNEL
+	bool "stunnel"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Stunnel is a program that wraps any TCP connection with an SSL
+	  connection.
+
+	  http://www.stunnel.org/
diff --git a/package/stunnel/S50stunnel b/package/stunnel/S50stunnel
new file mode 100644
index 0000000..5033e96
--- /dev/null
+++ b/package/stunnel/S50stunnel
@@ -0,0 +1,36 @@
+#!/bin/sh
+#
+# Starts stunnel
+#
+
+start() {
+	echo -n "Starting stunnel: "
+	start-stop-daemon -S -q -p /var/run/stunnel.pid --exec /usr/bin/stunnel
+	echo "OK"
+}
+stop() {
+	echo -n "Stopping stunnel: "
+	start-stop-daemon -K -q -p /var/run/stunnel.pid
+	echo "OK"
+}
+restart() {
+	stop
+	start
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
+	restart
+	;;
+  *)
+	echo $"Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
new file mode 100644
index 0000000..9b31fd2
--- /dev/null
+++ b/package/stunnel/stunnel.mk
@@ -0,0 +1,25 @@
+#############################################################
+#
+# stunnel
+#
+#############################################################
+
+STUNNEL_VERSION = 4.36
+STUNNEL_SITE = http://ftp.nluug.nl/pub/networking/stunnel/obsolete/4.x/
+STUNNEL_DEPENDENCIES = openssl
+
+STUNNEL_CONF_OPT += \
+	--with-ssl=$(STAGING_DIR)/usr \
+	--with-threads=fork
+
+define STUNNEL_INSTALL_CONF_SCRIPT
+	$(INSTALL) -m 0755 -D package/stunnel/S50stunnel $(TARGET_DIR)/etc/init.d/S50stunnel
+	[ -f $(TARGET_DIR)/etc/stunnel/stunnel.conf ] || \
+		$(INSTALL) -m 0644 -D $(@D)/tools/stunnel.conf \
+			$(TARGET_DIR)/etc/stunnel/stunnel.conf
+	rm -f $(TARGET_DIR)/etc/stunnel/stunnel.conf-sample
+endef
+
+STUNNEL_POST_INSTALL_TARGET_HOOKS += STUNNEL_INSTALL_CONF_SCRIPT
+
+$(eval $(call AUTOTARGETS,package,stunnel))
-- 
1.7.3.4
