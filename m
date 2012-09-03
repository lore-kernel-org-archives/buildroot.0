From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 03 Sep 2012 20:05:36 -0000
Subject: [Buildroot] [git commit] supervisor: new package
Message-ID: <20120903200534.2205999543@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=380ff787d95f9fa36a73503fd3ac6d5c40a5e6bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[thomas.petazzoni at free-electrons.com:
 Fixup indentation of Config.in file.
 Add 'depends on BR2_PACKAGE_PYTHON' so that the package does not
 appear when the Python interpreter is not enabled.
 Add license files information, but not the license tag: the package
 includes software under multiple licenses.]

Signed-off-by: Jonathan Liu <net147@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                   |    1 +
 package/supervisor/Config.in        |   13 +++++++++++++
 package/supervisor/S99supervisord   |   29 +++++++++++++++++++++++++++++
 package/supervisor/supervisor.mk    |   26 ++++++++++++++++++++++++++
 package/supervisor/supervisord.conf |   18 ++++++++++++++++++
 5 files changed, 87 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index a9101b2..3a05917 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -683,6 +683,7 @@ source "package/rsyslog/Config.in"
 source "package/sysklogd/Config.in"
 source "package/sysvinit/Config.in"
 endif
+source "package/supervisor/Config.in"
 source "package/systemd/Config.in"
 source "package/util-linux/Config.in"
 source "package/dsp-tools/Config.in"
diff --git a/package/supervisor/Config.in b/package/supervisor/Config.in
new file mode 100644
index 0000000..5340181
--- /dev/null
+++ b/package/supervisor/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_SUPERVISOR
+	bool "supervisor"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS
+	select BR2_PACKAGE_PYTHON_MELD3
+	help
+	  A client/server system that allows its users to control a
+	  number of processes on UNIX-like operating systems.
+
+	  http://supervisord.org/
+
+comment "supervisor needs the python interpreter"
+	depends on !BR2_PACKAGE_PYTHON
diff --git a/package/supervisor/S99supervisord b/package/supervisor/S99supervisord
new file mode 100755
index 0000000..0856d65
--- /dev/null
+++ b/package/supervisor/S99supervisord
@@ -0,0 +1,29 @@
+#!/bin/sh
+
+mkdir -p /var/log/supervisor
+
+case "$1" in
+	start)
+		echo -n "Starting supervisord: "
+		start-stop-daemon -S -q -p /var/run/supervisord.pid --exec /usr/bin/supervisord
+		echo "done"
+		;;
+	stop)
+		echo -n "Stopping supervisord: "
+		start-stop-daemon -K -q -p /var/run/supervisord.pid
+		echo "done"
+		;;
+	restart)
+		"$0" stop
+		sleep 5
+		"$0" start
+		;;
+	reload)
+		start-stop-daemon -K -q -p /var/run/supervisord.pid -s HUP
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
+
+exit $?
diff --git a/package/supervisor/supervisor.mk b/package/supervisor/supervisor.mk
new file mode 100644
index 0000000..26afff3
--- /dev/null
+++ b/package/supervisor/supervisor.mk
@@ -0,0 +1,26 @@
+#############################################################
+#
+# python-supervisor
+#
+#############################################################
+
+SUPERVISOR_VERSION = 3.0a12
+SUPERVISOR_SOURCE = supervisor-$(SUPERVISOR_VERSION).tar.gz
+SUPERVISOR_SITE = http://pypi.python.org/packages/source/s/supervisor/
+SUPERVISOR_LICENSE_FILES = LICENSES.txt
+
+SUPERVISOR_DEPENDENCIES = python host-python-setuptools
+
+define SUPERVISOR_BUILD_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define SUPERVISOR_INSTALL_TARGET_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=/usr --root=$(TARGET_DIR))
+	sed -i '1s|#!.*python.*|#!/usr/bin/env python|' $(TARGET_DIR)/usr/bin/{echo_supervisord_conf,pidproxy,supervisorctl,supervisord}
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/supervisor.d
+	$(INSTALL) -D -m 644 package/supervisor/supervisord.conf $(TARGET_DIR)/etc/supervisord.conf
+	$(INSTALL) -m 755 package/supervisor/S99supervisord $(TARGET_DIR)/etc/init.d/S99supervisord
+endef
+
+$(eval $(generic-package))
diff --git a/package/supervisor/supervisord.conf b/package/supervisor/supervisord.conf
new file mode 100644
index 0000000..1372a68
--- /dev/null
+++ b/package/supervisor/supervisord.conf
@@ -0,0 +1,18 @@
+[unix_http_server]
+file = /var/run/supervisor.sock
+
+[supervisord]
+logfile = /var/log/supervisor/supervisord.log
+logfile_maxbytes = 200KB
+logfile_backups = 1
+pidfile = /var/run/supervisord.pid
+childlogdir = /var/log/supervisor
+
+[rpcinterface:supervisor]
+supervisor.rpcinterface_factory = supervisor.rpcinterface:make_main_rpcinterface
+
+[supervisorctl]
+serverurl = unix:///var/run/supervisor.sock
+
+[include]
+files = /etc/supervisor.d/*.conf
