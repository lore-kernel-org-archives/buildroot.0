From: Denis THULIN <denis.thulin@openwide.fr>
Date: Mon, 31 Aug 2015 11:59:06 +0200
Subject: [Buildroot] [PATCH 1/6] python-robotframework: New package
In-Reply-To: <1441015151-3108-1-git-send-email-denis.thulin@openwide.fr>
References: <1441015151-3108-1-git-send-email-denis.thulin@openwide.fr>
Message-ID: <1441015151-3108-2-git-send-email-denis.thulin@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A generic test automation framework written in python.

Signed-off-by: Denis THULIN <denis.thulin@openwide.fr>
---
v0:
    - Generated using python-package-generator.py
    - Dependencies on python-zlib and python-pyexpat were added manually
    - Modification of packages/Config.in done manually.
v1:
    - fixed indentation error on dependencies (was 4 spaces instead of tab)
    - Changed hash from md5 to sha256 (modification of scanpypi)
    - Fixed typos (modification of scanpypi)
v2:
    - Added the md5 hash from pypi
    - Fixed typos
v3:
    - Changed the hash file

Signed-off-by: Denis THULIN <denis.thulin@openwide.fr>
---
 package/Config.in                                        |  1 +
 package/Config.in.host                                   |  1 +
 package/python-robotframework/Config.in                  |  9 +++++++++
 package/python-robotframework/Config.in.host             |  8 ++++++++
 package/python-robotframework/python-robotframework.hash |  4 ++++
 package/python-robotframework/python-robotframework.mk   | 16 ++++++++++++++++
 6 files changed, 39 insertions(+)
 create mode 100644 package/python-robotframework/Config.in
 create mode 100644 package/python-robotframework/Config.in.host
 create mode 100644 package/python-robotframework/python-robotframework.hash
 create mode 100644 package/python-robotframework/python-robotframework.mk

diff --git a/package/Config.in b/package/Config.in
index 783fbb4..c7fadd6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -656,6 +656,7 @@ menu "external python modules"
 	source "package/python-pyyaml/Config.in"
 	source "package/python-pyzmq/Config.in"
 	source "package/python-requests/Config.in"
+	source "package/python-robotframework/Config.in"
 	source "package/python-rtslib-fb/Config.in"
 	source "package/python-serial/Config.in"
 	source "package/python-setuptools/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index 1e047aa..4526892 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -22,6 +22,7 @@ menu "Host utilities"
 	source "package/patchelf/Config.in.host"
 	source "package/pwgen/Config.in.host"
 	source "package/qemu/Config.in.host"
+	source "package/python-robotframework/Config.in.host"
 	source "package/sam-ba/Config.in.host"
 	source "package/squashfs/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
diff --git a/package/python-robotframework/Config.in b/package/python-robotframework/Config.in
new file mode 100644
index 0000000..9523893
--- /dev/null
+++ b/package/python-robotframework/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_ROBOTFRAMEWORK
+	bool "python-robotframework"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_ZLIB
+	select BR2_PACKAGE_PYTHON_PYEXPAT
+	help
+	  A generic test automation framework
+
+	  http://robotframework.org
diff --git a/package/python-robotframework/Config.in.host b/package/python-robotframework/Config.in.host
new file mode 100644
index 0000000..c1f5883
--- /dev/null
+++ b/package/python-robotframework/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_PYTHON_ROBOTFRAMEWORK
+	bool "host python-robotframework"
+	depends on BR2_PACKAGE_HOST_PYTHON
+	help
+	  A generic test automation framework used for testing buildroot
+	  packages
+
+	  http://robotframework.org
diff --git a/package/python-robotframework/python-robotframework.hash b/package/python-robotframework/python-robotframework.hash
new file mode 100644
index 0000000..58ff12d
--- /dev/null
+++ b/package/python-robotframework/python-robotframework.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/robotframework/json
+md5	db4a3330dfaa761c1599ca1064396eee  robotframework-2.9.tar.gz
+# sha256 calculated by scanpypi
+sha256	13a0340864e8c7735302ce39f8d3f9d01bed7db7c055e55043396242a615d8f1  robotframework-2.9.tar.gz
diff --git a/package/python-robotframework/python-robotframework.mk b/package/python-robotframework/python-robotframework.mk
new file mode 100644
index 0000000..afef695
--- /dev/null
+++ b/package/python-robotframework/python-robotframework.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-robotframework
+#
+################################################################################
+
+PYTHON_ROBOTFRAMEWORK_VERSION = 2.9
+PYTHON_ROBOTFRAMEWORK_SOURCE = robotframework-$(PYTHON_ROBOTFRAMEWORK_VERSION).tar.gz
+PYTHON_ROBOTFRAMEWORK_SITE = https://pypi.python.org/packages/source/r/robotframework
+PYTHON_ROBOTFRAMEWORK_SETUP_TYPE = setuptools
+PYTHON_ROBOTFRAMEWORK_LICENSE = Apache-2.0
+PYTHON_ROBOTFRAMEWORK_LICENSE_FILES = LICENSE.txt
+
+
+$(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.5.0
