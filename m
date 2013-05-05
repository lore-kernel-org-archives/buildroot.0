From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Sun,  5 May 2013 14:43:05 +0200
Subject: [Buildroot] [PATCH 1/1] ser2net: add default init script
Message-ID: <1367757785-5850-1-git-send-email-plagnioj@jcrosoft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

add option to specify the configuration file

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
---
 package/ser2net/Config.in  |    9 +++++++++
 package/ser2net/S50ser2net |   48 ++++++++++++++++++++++++++++++++++++++++++++
 package/ser2net/ser2net.mk |   27 +++++++++++++++++++++++++
 3 files changed, 84 insertions(+)
 create mode 100644 package/ser2net/S50ser2net

diff --git a/package/ser2net/Config.in b/package/ser2net/Config.in
index e3b8870..3480d85 100644
--- a/package/ser2net/Config.in
+++ b/package/ser2net/Config.in
@@ -8,5 +8,14 @@ config BR2_PACKAGE_SER2NET
 
 	  http://ser2net.sourceforge.net
 
+if BR2_PACKAGE_SER2NET
+
+config BR2_PACKAGE_SER2NET_CONF
+	string "Configuration file"
+	help
+	  Configuration file.
+
+endif
+
 comment "ser2net requires a toolchain with IPV6 support"
 	depends on !BR2_INET_IPV6
diff --git a/package/ser2net/S50ser2net b/package/ser2net/S50ser2net
new file mode 100644
index 0000000..90b6af1
--- /dev/null
+++ b/package/ser2net/S50ser2net
@@ -0,0 +1,48 @@
+#!/bin/sh 
+
+NAME=ser2net
+DAEMON=/usr/sbin/${NAME}
+CONFIG_FILE=/etc/${NAME}.conf
+PIDFILE=/var/run/$NAME.pid
+trap "" 1
+trap "" 15
+test -f $DAEMON || exit 0
+
+start() {
+	echo -n "Starting Ser2Net: "
+	$DAEMON -c $CONFIG_FILE -P ${PIDFILE}
+	if [ $? != 0 ]; then
+		echo "FAILED"
+		exit 1
+	else
+		echo "done"
+	fi
+}
+
+stop() {
+	echo -n "Stopping Ser2Net: "
+	kill -9 `cat ${PIDFILE}`
+	echo "done"
+}
+
+case "$1" in
+    start)
+	start
+	;;
+
+    stop)
+	stop
+	;;
+
+    restart)
+	stop
+	start
+	;;
+
+    *)
+	echo "Usage: /etc/init.d/S50ser2net {start|stop|restart}"
+	exit 1
+	;;
+esac
+
+exit 0
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 378dc06..5a2539e 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -9,4 +9,31 @@ SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPLv2+
 SER2NET_LICENSE_FILES = COPYING
 
+define SER2NET_INIT_SCRIPT_INSTALL
+	$(INSTALL) -m 0755 package/ser2net/S50ser2net $(TARGET_DIR)/etc/init.d
+endef
+
+SER2NET_POST_INSTALL_TARGET_HOOKS += SER2NET_INIT_SCRIPT_INSTALL
+
+define SER2NET_INIT_SCRIPT_UNINSTALL
+	rm -f $(TARGET_DIR)/etc/init.d/S50ser2net
+endef
+
+SER2NET_POST_UNINSTALL_TARGET_HOOKS += SER2NET_INIT_SCRIPT_UNINSTALL
+
+define SER2NET_CONF_INSTALL
+	if [ "$(BR2_PACKAGE_SER2NET_CONF)" != "" ] ; then \
+		$(INSTALL) -m 0644 $(BR2_PACKAGE_SER2NET_CONF) \
+			$(TARGET_DIR)/etc/ser2net.conf ; \
+	fi
+endef
+
+SER2NET_POST_INSTALL_TARGET_HOOKS += SER2NET_CONF_INSTALL
+
+define SER2NET_CONFIG_UNINSTALL
+	rm -f $(TARGET_DIR)/etc/ser2net.conf
+endef
+
+SER2NET_POST_UNINSTALL_TARGET_HOOKS += SER2NET_CONFIG_UNINSTALL
+
 $(eval $(autotools-package))
-- 
1.7.10.4
