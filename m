From: Dominik Faessler <faessler@was.ch>
Date: Mon, 14 May 2012 10:33:33 +0200
Subject: [Buildroot] [PATCH] python-id3: new package
Message-ID: <4FB0C35D.2020007@was.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in                |    1 +
 package/python-id3/Config.in     |    9 +++++++++
 package/python-id3/python-id3.mk |   21 +++++++++++++++++++++
 3 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100644 package/python-id3/Config.in
 create mode 100644 package/python-id3/python-id3.mk

diff --git a/package/Config.in b/package/Config.in
index fb1b08f..a89e646 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -255,6 +255,7 @@ source "package/python/Config.in"
 if BR2_PACKAGE_PYTHON
 menu "external python modules"
 source "package/python-dpkt/Config.in"
+source "package/python-id3/Config.in"
 source "package/python-mad/Config.in"
 source "package/python-netifaces/Config.in"
 source "package/python-pygame/Config.in"
diff --git a/package/python-id3/Config.in b/package/python-id3/Config.in
new file mode 100644
index 0000000..6ddfd54
--- /dev/null
+++ b/package/python-id3/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_ID3
+    bool "python-id3"
+    depends on BR2_PACKAGE_PYTHON
+    help
+      This module allows one to read and manipulate so-called ID3
+      informational tags on MP3 files through an object-oriented
+      Python interface.
+
+      http://id3-py.sourceforge.net/
diff --git a/package/python-id3/python-id3.mk
b/package/python-id3/python-id3.mk
new file mode 100644
index 0000000..907dc63
--- /dev/null
+++ b/package/python-id3/python-id3.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# python-id3
+#
+#############################################################
+
+PYTHON_ID3_VERSION = 1.2
+PYTHON_ID3_SOURCE = id3-py_$(PYTHON_ID3_VERSION).tar.gz
+PYTHON_ID3_SITE =
http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/id3-py
+
+PYTHON_ID3_DEPENDENCIES = python
+
+define PYTHON_ID3_BUILD_CMDS
+    (cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define PYTHON_ID3_INSTALL_TARGET_CMDS
+    (cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install
--prefix=$(TARGET_DIR)/usr)
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.2.5
