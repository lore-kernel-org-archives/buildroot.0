From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Thu, 12 Mar 2015 11:53:51 +0100
Subject: [Buildroot] [PATCH 1/1] iotop: new package
Message-ID: <1426157631-5598-1-git-send-email-cvubrugier@fastmail.fm>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

iotop does for I/O usage what top does for CPU usage.

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
---
 package/Config.in                                  |  1 +
 .../iotop/0001-Fix-build-error-with-Python-3.patch | 37 ++++++++++++++++++++++
 package/iotop/Config.in                            | 12 +++++++
 package/iotop/iotop.mk                             | 13 ++++++++
 4 files changed, 63 insertions(+)
 create mode 100644 package/iotop/0001-Fix-build-error-with-Python-3.patch
 create mode 100644 package/iotop/Config.in
 create mode 100644 package/iotop/iotop.mk

diff --git a/package/Config.in b/package/Config.in
index a37e519..8a297b9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1310,6 +1310,7 @@ endif
 	source "package/ftop/Config.in"
 	source "package/getent/Config.in"
 	source "package/htop/Config.in"
+	source "package/iotop/Config.in"
 	source "package/iprutils/Config.in"
 	source "package/irqbalance/Config.in"
 	source "package/keyutils/Config.in"
diff --git a/package/iotop/0001-Fix-build-error-with-Python-3.patch b/package/iotop/0001-Fix-build-error-with-Python-3.patch
new file mode 100644
index 0000000..bf656f8
--- /dev/null
+++ b/package/iotop/0001-Fix-build-error-with-Python-3.patch
@@ -0,0 +1,37 @@
+Status: upstream
+http://repo.or.cz/w/iotop.git/commit/99c8d7cedce81f17b851954d94bfa73787300599
+
+Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
+
+From 99c8d7cedce81f17b851954d94bfa73787300599 Mon Sep 17 00:00:00 2001
+From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
+Date: Fri, 17 Oct 2014 13:49:31 +0200
+Subject: [PATCH] Fix build error with Python 3 caused by itervalues() in
+ setup.py
+
+The itervalues() method is not available in Python 3. As a
+consequence, this patch replaces the call to itervalues() in setup.py
+with a call to values() which works on both Python 2 and Python 3.
+
+Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
+Signed-off-by: Paul Wise <pabs3@bonedaddy.net>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 7150102..9de6068 100755
+--- a/setup.py
++++ b/setup.py
+@@ -7,7 +7,7 @@ from iotop.version import VERSION
+ # Dirty hack to make setup.py install the iotop script to sbin/ instead of bin/
+ # while still honoring the choice of installing into local/ or not.
+ if hasattr(distutils_install, 'INSTALL_SCHEMES'):
+-    for d in distutils_install.INSTALL_SCHEMES.itervalues():
++    for d in distutils_install.INSTALL_SCHEMES.values():
+         if d.get('scripts', '').endswith('/bin'):
+             d['scripts'] = d['scripts'][:-len('/bin')] + '/sbin'
+ 
+-- 
+2.1.4
+
diff --git a/package/iotop/Config.in b/package/iotop/Config.in
new file mode 100644
index 0000000..ada6131
--- /dev/null
+++ b/package/iotop/Config.in
@@ -0,0 +1,12 @@
+comment "iotop depends on python or python3"
+	depends on !BR2_PACKAGE_PYTHON && !BR2_PACKAGE_PYTHON3
+
+config BR2_PACKAGE_IOTOP
+	bool "iotop"
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_CURSES if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_CURSES if BR2_PACKAGE_PYTHON3
+	help
+	  iotop does for I/O usage what top does for CPU usage.
+
+	  http://guichaz.free.fr/iotop/
diff --git a/package/iotop/iotop.mk b/package/iotop/iotop.mk
new file mode 100644
index 0000000..31787c5
--- /dev/null
+++ b/package/iotop/iotop.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# iotop
+#
+################################################################################
+
+IOTOP_VERSION = 0.6
+IOTOP_SITE = http://guichaz.free.fr/iotop/files
+IOTOP_LICENSE = GPLv2+
+IOTOP_LICENSE_FILES = COPYING
+IOTOP_SETUP_TYPE = distutils
+
+$(eval $(python-package))
-- 
2.1.4
