From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 15 Jan 2016 09:57:41 +0100
Subject: [Buildroot] [RFC] python-pyparted: new package
Message-ID: <1452848261-26588-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---

Requires CFFI backend

 package/Config.in                            |  1 +
 package/python-pyparted/Config.in            | 12 ++++++++++++
 package/python-pyparted/python-pyparted.hash |  2 ++
 package/python-pyparted/python-pyparted.mk   | 14 ++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/python-pyparted/Config.in
 create mode 100644 package/python-pyparted/python-pyparted.hash
 create mode 100644 package/python-pyparted/python-pyparted.mk

diff --git a/package/Config.in b/package/Config.in
index 89b23db..b5c3861 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -675,6 +675,7 @@ menu "External python modules"
 	source "package/python-pygame/Config.in"
 	source "package/python-pyinotify/Config.in"
 	source "package/python-pyparsing/Config.in"
+	source "package/python-pyparted/Config.in"
 	source "package/python-pypcap/Config.in"
 	source "package/python-pyqt/Config.in"
 	source "package/python-pyratemp/Config.in"
diff --git a/package/python-pyparted/Config.in b/package/python-pyparted/Config.in
new file mode 100644
index 0000000..d524ce6
--- /dev/null
+++ b/package/python-pyparted/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_PYPARTED
+	bool "python-pyparted"
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_PYTHON_CFFI #runtime
+	select BR2_PACKAGE_PARTED
+	help
+	  Python bindings for GNU parted (libparted).
+
+	  https://github.com/rhinstaller/pyparted
+
+comment "pyparted needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/python-pyparted/python-pyparted.hash b/package/python-pyparted/python-pyparted.hash
new file mode 100644
index 0000000..a2adc41
--- /dev/null
+++ b/package/python-pyparted/python-pyparted.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  5914e3a60437fe3e3758a9e86ee4a539dfa46cfe18e3df386a5cf1f75a963431  python-pyparted-v3.10.7.tar.gz
diff --git a/package/python-pyparted/python-pyparted.mk b/package/python-pyparted/python-pyparted.mk
new file mode 100644
index 0000000..4bf58c4
--- /dev/null
+++ b/package/python-pyparted/python-pyparted.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyparted
+#
+################################################################################
+
+PYTHON_PYPARTED_VERSION = v3.10.7
+PYTHON_PYPARTED_SITE = $(call github,rhinstaller,pyparted,$(PYTHON_PYPARTED_VERSION))
+PYTHON_PYPARTED_SETUP_TYPE = distutils
+PYTHON_PYPARTED_LICENSE = GPLv2+
+PYTHON_PYPARTED_LICENSE_FILES = COPYING
+PYTHON_PYPARTED_DEPENDENCIES = host-python-cffi parted
+
+$(eval $(python-package))
-- 
2.1.4
