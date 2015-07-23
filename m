From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Jul 2015 22:21:52 +0200
Subject: [Buildroot] [git commit] package/python-web2py: new package
Message-ID: <20150723202718.D02D481D26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7c0fab65aae632fc820edbe570c40f93c765dd64
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds web2py package. web2py is a free open source
full-stack framework for rapid development of fast, scalable, secure
and portable database-driven web-based applications.

[Thomas: fixup symbolic link to the systemd service file.]

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                      |    1 +
 package/python-web2py/Config.in        |   23 ++++++++++++++++++
 package/python-web2py/S51web2py        |   25 ++++++++++++++++++++
 package/python-web2py/python-web2py.mk |   39 ++++++++++++++++++++++++++++++++
 package/python-web2py/web2py.service   |   11 +++++++++
 5 files changed, 99 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index a04a250..cfa7512 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -663,6 +663,7 @@ menu "external python modules"
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
index 0000000..641d7ef
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
+	ln -fs ../../../../usr/lib//systemd/system/web2py.service \
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
