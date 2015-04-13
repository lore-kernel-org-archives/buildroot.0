From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 13 Apr 2015 15:43:20 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-web2py: new package
In-Reply-To: <1428932600-21996-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1428932600-21996-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1428932600-21996-3-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds web2py package. web2py is a free open source
full-stack framework for rapid development of fast, scalable,
secure and portable database-driven web-based applications.
This patch is a big rework using the new introduced feature of recursive
permission to run web2py application server as non root user.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/Config.in                      |  1 +
 package/python-web2py/Config.in        | 25 ++++++++++++++++++
 package/python-web2py/S51web2py        | 25 ++++++++++++++++++
 package/python-web2py/python-web2py.mk | 46 ++++++++++++++++++++++++++++++++++
 package/python-web2py/web2py.service   | 11 ++++++++
 5 files changed, 108 insertions(+)
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
index 0000000..e3144d4
--- /dev/null
+++ b/package/python-web2py/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_PYTHON_WEB2PY
+	bool "python-web2py"
+	select BR2_PACKAGE_PYTHON_PYDAL
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_PYTHON_ZLIB
+	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_PYTHON_PYEXPAT
+	select BR2_PACKAGE_SQLITE
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
index 0000000..55a2ad8
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
+			-b -x /usr/share/web2py/web2py.py \
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
index 0000000..828b662
--- /dev/null
+++ b/package/python-web2py/python-web2py.mk
@@ -0,0 +1,46 @@
+################################################################################
+#
+# python-web2py
+#
+################################################################################
+
+PYTHON_WEB2PY_VERSION = R-2.10.3
+PYTHON_WEB2PY_SITE = https://github.com/web2py/web2py.git
+PYTHON_WEB2PY_SITE_METHOD = git
+PYTHON_WEB2PY_LICENSE = LGPLv3
+PYTHON_WEB2PY_LICENSE_FILES = LICENSE
+PYTHON_WEB2PY_DEPENDENCIES = python sqlite
+
+define PYTHON_WEB2PY_PYDAL_COPY
+	cp -rf $(PYTHON_PYDAL_SRCDIR)/*  $(@D)/gluon/packages/dal/
+endef
+
+PYTHON_WEB2PY_POST_EXTRACT_HOOKS += PYTHON_WEB2PY_PYDAL_COPY
+
+define PYTHON_WEB2PY_INSTALL_TARGET_CMDS
+	$(HOST_DIR)/usr/bin/python2 -c 'import os; \
+		os.chdir("$(@D)"); \
+		from gluon.main import save_password; \
+		save_password($(BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD),8000)'
+	mkdir -p $(TARGET_DIR)/usr/share/web2py
+	cp -dpfr $(@D)/* $(TARGET_DIR)/usr/share/web2py
+endef
+
+define PYTHON_WEB2PY_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/python-web2py/S51web2py \
+		$(TARGET_DIR)/etc/init.d/S51web2py
+endef
+
+define PYTHON_WEB2PY_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 package/python-web2py/web2py.service \
+		$(TARGET_DIR)/etc/systemd/system/web2py.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../web2py.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/web2py.service
+endef
+
+define PYTHON_WEB2PY_PERMISSIONS
+	/usr/share/web2py  r  750  www-data  www-data  -  -  -  -  -
+endef
+
+$(eval $(generic-package))
diff --git a/package/python-web2py/web2py.service b/package/python-web2py/web2py.service
new file mode 100644
index 0000000..87d0416
--- /dev/null
+++ b/package/python-web2py/web2py.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Web2py daemon
+After=network.target
+
+[Service]
+Type=simple
+ExecStart=/usr/share/web2py/web2py.py --nogui -a '<recycle>' -i 0.0.0.0 -p 8000
+User=www-data
+
+[Install]
+WantedBy=multi-user.target
-- 
1.9.1
