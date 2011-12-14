From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 14 Dec 2011 16:38:36 +0100
Subject: [Buildroot] [PATCH v3 2/2] New package: python-dpkt
Message-ID: <1323877116-31436-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

python-dpkt-setup.patch removes dpkt inclusion in setup.py
and stores package metadata directly in setup.py. This avoids
unneeded host-python dependencies like zlib

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changelog:
v3: add description and SoB to setup patch
 package/Config.in                           |    1 +
 package/python-dpkt/Config.in               |   11 +++++++++++
 package/python-dpkt/python-dpkt-setup.patch |   27 +++++++++++++++++++++++++++
 package/python-dpkt/python-dpkt.mk          |   22 ++++++++++++++++++++++
 4 files changed, 61 insertions(+), 0 deletions(-)
 create mode 100644 package/python-dpkt/Config.in
 create mode 100644 package/python-dpkt/python-dpkt-setup.patch
 create mode 100644 package/python-dpkt/python-dpkt.mk

diff --git a/package/Config.in b/package/Config.in
index 6ab893f..bb5e5b0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -238,6 +238,7 @@ source "package/php/Config.in"
 source "package/python/Config.in"
 if BR2_PACKAGE_PYTHON
 menu "external python modules"
+source "package/python-dpkt/Config.in"
 source "package/python-mad/Config.in"
 source "package/python-serial/Config.in"
 endmenu
diff --git a/package/python-dpkt/Config.in b/package/python-dpkt/Config.in
new file mode 100644
index 0000000..aac9f09
--- /dev/null
+++ b/package/python-dpkt/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_DPKT
+	bool "python-dpkt"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_ZLIB
+	help
+	  Fast, simple packet creation / parsing, with definitions
+	  for the basic TCP/IP protocols.
+
+	  http://code.google.com/p/dpkt/
+
+
diff --git a/package/python-dpkt/python-dpkt-setup.patch b/package/python-dpkt/python-dpkt-setup.patch
new file mode 100644
index 0000000..a025272
--- /dev/null
+++ b/package/python-dpkt/python-dpkt-setup.patch
@@ -0,0 +1,27 @@
+remove dpkt inclusion in setup.py to avoid unneeded dependencies
+like zlib
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ setup.py |    7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+Index: b/setup.py
+===================================================================
+--- a/setup.py
++++ b/setup.py
+@@ -1,11 +1,10 @@
+ #!/usr/bin/env python
+
+ from distutils.core import setup
+-import dpkt
+
+ setup(name='dpkt',
+-      version=dpkt.__version__,
+-      author=dpkt.__author__,
+-      url=dpkt.__url__,
++      version='1.7',
++      author='Dug Song <dugsong@monkey.org>',
++      url='http://dpkt.googlecode.com/',
+       description='dumb packet module',
+       packages=[ 'dpkt' ])
diff --git a/package/python-dpkt/python-dpkt.mk b/package/python-dpkt/python-dpkt.mk
new file mode 100644
index 0000000..7ac873c
--- /dev/null
+++ b/package/python-dpkt/python-dpkt.mk
@@ -0,0 +1,22 @@
+#############################################################
+#
+# python-dpkt
+#
+#############################################################
+
+PYTHON_DPKT_VERSION = 1.7
+PYTHON_DPKT_SOURCE  = dpkt-$(PYTHON_DPKT_VERSION).tar.gz
+PYTHON_DPKT_SITE    = http://dpkt.googlecode.com/files
+
+PYTHON_DPKT_DEPENDENCIES = python
+
+define PYTHON_DPKT_BUILD_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define PYTHON_DPKT_INSTALL_TARGET_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+$(eval $(call GENTARGETS))
+
-- 
1.7.1.1
