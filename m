From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 14 Apr 2015 17:05:04 +0200
Subject: [Buildroot] [PATCH v3 2/2] package/python-web2py: new package
In-Reply-To: <1429023904-20194-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1429023904-20194-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1429023904-20194-3-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds web2py package. web2py is a free open source
full-stack framework for rapid development of fast, scalable,
secure and portable database-driven web-based applications.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changelog:
  
v2 -> v3:
 * Fixed systemd service file installation path.
 * Fixed dependencies in Config.mk
 * Moved to the systemwide installed pydal.
 * Moved installation path to /var/www/.
  
v1 -> v2:
 * Adding python2 dependency only (suggested by Yegor)


 package/Config.in                      |  1 +
 package/python-web2py/Config.in        | 23 ++++++++++++++++++++
 package/python-web2py/S51web2py        | 25 ++++++++++++++++++++++
 package/python-web2py/python-web2py.mk | 39 ++++++++++++++++++++++++++++++++++
 package/python-web2py/web2py.service   | 11 ++++++++++
 5 files changed, 99 insertions(+)
 create mode 100644 package/python-web2py/Config.in
 create mode 100644 package/python-web2py/S51web2py
 create mode 100644 package/python-web2py/python-web2py.mk
 create mode 100644 package/python-web2py/web2py.service

diff --git a/package/Config.in b/package/Config.in
index 839b80a..fd4296c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -618,6 +618,7 @@ menu "external python modules"
 	source "package/python-twisted/Config.in"
 	source "package/python-urwid/Config.in"
 	source "package/python-versiontools/Config.in"
+	source "package/python-web2py/Config.in"
 	source "package/python-webpy/Config.in"
 	source "package/python-werkzeug/Config.in"
 	source "package/python-ws4py/Config.in"
diff --git a/package/python-web2py/Config.in b/package/python-web2py/Config.in
new file mode 100644
index 0000000..b10d3a4
--- /dev/null
+++ b/package/python-web2py/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_PYTHON_WEB2PY
+	bool "python-web2py"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_PYDAL
+	select BR2_PACKAGE_PYTHON_ZLIB
+	select BR2_PACKAGE_PYTHON_PYEXPAT
+	select BR2_PACKAGE_PYTHON_SQLITE
+	help
+	  web2py is a free open source full-stack framework for rapid
+	  development of fast, scalable, secure and portable
+	  database-driven web-based applications.
+
+	  http://web2py.com
+
+if BR2_PACKAGE_PYTHON_WEB2PY
+
+config BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD
+	string "admin panel password"
+	default web2py
+	help
+	  Set the admin panel password.
+
+endif
diff --git a/package/python-web2py/S51web2py b/package/python-web2py/S51web2py
new file mode 100644
index 0000000..1da9ef4
--- /dev/null
+++ b/package/python-web2py/S51web2py
@@ -0,0 +1,25 @@
+#!/bin/sh
+
+case "$1" in
+	start)
+		echo -n "Starting web2py: "
+		start-stop-daemon -S -q -m -p /run/web2py.pid \
+			-c www-data \
+			-b -x /var/www/web2py/web2py.py \
+			-- --nogui -a '"<recycle>"' -i 0.0.0.0 -p 8000
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
+		;;
+	stop)
+		echo -n "Stopping web2py: "
+		start-stop-daemon -K -q -p /run/web2py.pid
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
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
new file mode 100644
index 0000000..01e332e
--- /dev/null
+++ b/package/python-web2py/python-web2py.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# python-web2py
+#
+################################################################################
+
+PYTHON_WEB2PY_VERSION = R-2.10.3
+PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,$(PYTHON_WEB2PY_VERSION))
+PYTHON_WEB2PY_LICENSE = LGPLv3
+PYTHON_WEB2PY_LICENSE_FILES = LICENSE
+PYTHON_WEB2PY_DEPENDENCIES = python python-pydal host-python-pydal
+
+define PYTHON_WEB2PY_INSTALL_TARGET_CMDS
+	$(HOST_DIR)/usr/bin/python2 -c 'import os; \
+		os.chdir("$(@D)"); \
+		from gluon.main import save_password; \
+		save_password($(BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD),8000)'
+	mkdir -p $(TARGET_DIR)/var/www/web2py
+	cp -dpfr $(@D)/* $(TARGET_DIR)/var/www/web2py
+endef
+
+define PYTHON_WEB2PY_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/python-web2py/S51web2py \
+		$(TARGET_DIR)/etc/init.d/S51web2py
+endef
+
+define PYTHON_WEB2PY_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 package/python-web2py/web2py.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/web2py.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../web2py.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/web2py.service
+endef
+
+define PYTHON_WEB2PY_PERMISSIONS
+	/var/www/web2py  r  750  www-data  www-data  -  -  -  -  -
+endef
+
+$(eval $(generic-package))
diff --git a/package/python-web2py/web2py.service b/package/python-web2py/web2py.service
new file mode 100644
index 0000000..0274bd8
--- /dev/null
+++ b/package/python-web2py/web2py.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Web2py daemon
+After=network.target
+
+[Service]
+Type=simple
+ExecStart=/var/www/web2py/web2py.py --nogui -a '<recycle>' -i 0.0.0.0 -p 8000
+User=www-data
+
+[Install]
+WantedBy=multi-user.target
-- 
1.9.1
