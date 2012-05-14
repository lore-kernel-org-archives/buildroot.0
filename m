From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 May 2012 22:46:05 +0200
Subject: [Buildroot] [git commit branch/next] python-id3: new package
Message-ID: <20120514204734.99DB296CE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b3e10d197dbd643b0722c918ac5cd4adadfc3310
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                |    1 +
 package/python-id3/Config.in     |    9 +++++++++
 package/python-id3/python-id3.mk |   21 +++++++++++++++++++++
 3 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f91a907..ff03178 100644
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
index 0000000..829a657
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
diff --git a/package/python-id3/python-id3.mk b/package/python-id3/python-id3.mk
new file mode 100644
index 0000000..e1ed1b6
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
+PYTHON_ID3_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/id3-py
+
+PYTHON_ID3_DEPENDENCIES = python
+
+define PYTHON_ID3_BUILD_CMDS
+    (cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define PYTHON_ID3_INSTALL_TARGET_CMDS
+    (cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+$(eval $(call GENTARGETS))
