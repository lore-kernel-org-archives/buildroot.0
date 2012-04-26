From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 26 Apr 2012 09:41:47 +0200
Subject: [Buildroot] [PATCH] Add Netatalk
Message-ID: <1335426107-4727-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch add the Netatalk package to Buildroot.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/Config.in            |    1 +
 package/netatalk/Config.in   |   10 ++++++++++
 package/netatalk/S50netatalk |   43 ++++++++++++++++++++++++++++++++++++++++++
 package/netatalk/netatalk.mk |   35 ++++++++++++++++++++++++++++++++++
 4 files changed, 89 insertions(+)
 create mode 100644 package/netatalk/Config.in
 create mode 100755 package/netatalk/S50netatalk
 create mode 100644 package/netatalk/netatalk.mk

diff --git a/package/Config.in b/package/Config.in
index 5ae1c81..7c19ed9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -487,6 +487,7 @@ source "package/netcat/Config.in"
 source "package/netkitbase/Config.in"
 source "package/netkittelnet/Config.in"
 endif
+source "package/netatalk/Config.in"
 source "package/netplug/Config.in"
 source "package/netsnmp/Config.in"
 source "package/netstat-nat/Config.in"
diff --git a/package/netatalk/Config.in b/package/netatalk/Config.in
new file mode 100644
index 0000000..1459246
--- /dev/null
+++ b/package/netatalk/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_NETATALK
+	bool "netatalk"
+	select BR2_PACKAGE_BERKELEYDB
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBGCRYPT
+	select BR2_PACKAGE_LIBGPG_ERROR
+	help
+	  Netatalk can be used to turn a *NIX machine into an extremely 
+	  high-performance and reliable file server for Macintosh computers.
+	  http://netatalk.sourceforge.net/
diff --git a/package/netatalk/S50netatalk b/package/netatalk/S50netatalk
new file mode 100755
index 0000000..94bb161
--- /dev/null
+++ b/package/netatalk/S50netatalk
@@ -0,0 +1,43 @@
+#!/bin/sh 
+# 
+# Start netatalk daemon  (aftpd && cnid_metad)
+#
+
+AFPD_UAMLIST="-U uams_dhx2.so,uams_clrtxt.so"
+
+start() {
+    echo -n "Starting Netatalk services (this will take a while): "
+    echo "Starting afpd"
+    echo -n " afpd"
+    start-stop-daemon -S -q -p /var/run/afpd.pid --exec /usr/sbin/afpd -- $AFPD_UAMLIST -g nobody -c 50
+    echo -n " cnid_metad"
+    start-stop-daemon -S -q -p /var/run/cnid_metad.pid --exec /usr/sbin/cnid_metad -- -l log_note
+    echo "."
+}
+
+stop(){
+    echo -n "Stopping Netatalk Daemons:"
+    echo -n " afpd"
+    start-stop-daemon -K -q -p /var/run/afpd.pid
+    echo -n " cnid_metad"
+    start-stop-daemon -K -q -p /var/run/cnid_metad.pid
+}
+
+case "$1" in
+    start)
+        start
+    ;; 
+    stop)
+        stop
+    ;; 
+    restart)
+        start
+        stop
+    ;; 
+    *) 
+        echo $"Usage: $0 {start|stop|restart}"
+        exit 1
+esac
+
+exit $?
+
diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
new file mode 100644
index 0000000..534265d
--- /dev/null
+++ b/package/netatalk/netatalk.mk
@@ -0,0 +1,35 @@
+#############################################################
+#
+# netatalk
+#
+#############################################################
+NETATALK_VERSION = 2.2.2
+NETATALK_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/netatalk/netatalk/$(NETATALK_VERSION)/
+NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2
+
+NETATALK_DEPENDENCIES = openssl berkeleydb libgcrypt libgpg-error
+NETATALK_CONF_OPT += --with-cnid-cdb-backend \
+	--with-bdb=$(STAGING_DIR)/usr \
+	--disable-zeroconf \
+	--with-ssl-dir=$(STAGING_DIR)/usr \
+	--with-libgcrypt-dir=$(STAGING_DIR)/usr \
+	--with-shadow \
+	--disable-shell-check \
+	--without-pam
+
+ifeq ($(BR2_PACKAGE_CUPS),y)
+	NETATALK_DEPENDENCIES += cups
+	NETATALK_CONF_OPT += --enable-cups
+else
+	NETATALK_CONF_OPT += --disable-cups
+endif
+
+define NETATALK_INSTALL_EXTRA_FILES
+	[ -f $(TARGET_DIR)/etc/init.d/S50netatalk ] || \
+		$(INSTALL) -m 0755 -D package/netatalk/S50netatalk \
+			$(TARGET_DIR)/etc/init.d/S50netatalk
+endef
+
+NETATALK_POST_INSTALL_TARGET_HOOKS += NETATALK_INSTALL_EXTRA_FILES
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.10
