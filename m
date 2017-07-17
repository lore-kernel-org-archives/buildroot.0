From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon, 17 Jul 2017 14:07:50 -0700
Subject: [Buildroot] [PATCH v3] python-systemd: add new package
Message-ID: <20170717210750.9636-1-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add package for official python bindings availibe as a part of systemd
project at: https://github.com/systemd/python-systemd

Minimal config snippet for utils/test-pkg is as follows (sans
backslashes):

# BR2_INIT_BUSYBOX is not set
# BR2_INIT_SYSV is not set
BR2_INIT_SYSTEMD=y
# BR2_INIT_NONE is not set
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON_SYSTEMD=y

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-systemd/Config.in           | 10 ++++++++++
 package/python-systemd/python-systemd.hash |  3 +++
 package/python-systemd/python-systemd.mk   | 15 +++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/python-systemd/Config.in
 create mode 100644 package/python-systemd/python-systemd.hash
 create mode 100644 package/python-systemd/python-systemd.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1ec405a570..4380cbc191 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -98,6 +98,7 @@ F:	package/python-pathlib2/
 F:	package/python-pickleshare/
 F:	package/python-scandir/
 F:	package/python-simplegeneric/
+F:	package/python-systemd/
 F:	package/python-traitlets/
 
 N:	Andrey Yurovsky <yurovsky@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 3f715017ec..a88e3552a6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -865,6 +865,7 @@ menu "External python modules"
 	source "package/python-socketio/Config.in"
 	source "package/python-sortedcontainers//Config.in"
 	source "package/python-spidev/Config.in"
+	source "package/python-systemd/Config.in"
 	source "package/python-tempora/Config.in"
 	source "package/python-thrift/Config.in"
 	source "package/python-tomako/Config.in"
diff --git a/package/python-systemd/Config.in b/package/python-systemd/Config.in
new file mode 100644
index 0000000000..599b43f717
--- /dev/null
+++ b/package/python-systemd/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_SYSTEMD
+	bool "python-systemd"
+	depends on BR2_PACKAGE_SYSTEMD
+	help
+	  Python module for native access to the systemd facilities.
+
+	  https://github.com/systemd/python-systemd
+
+comment "python-systemd needs systemd"
+	depends on !BR2_PACKAGE_SYSTEMD
diff --git a/package/python-systemd/python-systemd.hash b/package/python-systemd/python-systemd.hash
new file mode 100644
index 0000000000..a645bec0f2
--- /dev/null
+++ b/package/python-systemd/python-systemd.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/systemd-python/, sha256 locally computed
+md5 8438acab31e6f1e3e963d36f3de62faa systemd-python-233.tar.gz
+sha256 06a3768b744884565d7961b44f4a51d164765bc59692f0f85ea6f11330a17da4 systemd-python-233.tar.gz
diff --git a/package/python-systemd/python-systemd.mk b/package/python-systemd/python-systemd.mk
new file mode 100644
index 0000000000..242a2ea121
--- /dev/null
+++ b/package/python-systemd/python-systemd.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-systemd
+#
+################################################################################
+
+PYTHON_SYSTEMD_VERSION = 233 # Should be kept in sync with $(SYSTEMD_VERSION)
+PYTHON_SYSTEMD_SOURCE = systemd-python-$(PYTHON_SYSTEMD_VERSION).tar.gz
+PYTHON_SYSTEMD_SITE = https://pypi.python.org/packages/10/89/d66ae73bdbc2614e4f2e90ddf9ef80d22c28f3cd70071345c3640465c14c
+PYTHON_SYSTEMD_SETUP_TYPE = distutils
+PYTHON_SYSTEMD_LICENSE = LGPL-2.1
+PYTHON_SYSTEMD_LICENSE_FILES = LICENSE.txt
+PYTHON_SYSTEMD_DEPENDENCIES = systemd # To be able to link against libsystemd
+
+$(eval $(python-package))
-- 
2.13.3
