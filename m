From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 18 Dec 2012 22:12:54 +0100
Subject: [Buildroot] [git commit] python-bottle: new package
Message-ID: <20121218211445.525699A397@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a3b19cdc92429ce4552be108283441ef4334a05
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                      |    1 +
 package/python-bottle/Config.in        |    8 ++++++++
 package/python-bottle/python-bottle.mk |   22 ++++++++++++++++++++++
 3 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index d6af55d..66445ff 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -302,6 +302,7 @@ source "package/python/Config.in"
 source "package/python3/Config.in"
 if BR2_PACKAGE_PYTHON
 menu "external python modules"
+source "package/python-bottle/Config.in"
 source "package/python-dpkt/Config.in"
 source "package/python-id3/Config.in"
 source "package/python-mad/Config.in"
diff --git a/package/python-bottle/Config.in b/package/python-bottle/Config.in
new file mode 100644
index 0000000..f9b60ca
--- /dev/null
+++ b/package/python-bottle/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_BOTTLE
+	bool "python-bottle"
+	help
+	  Bottle is a fast, simple and lightweight WSGI micro web-framework
+	  for Python. It is distributed as a single file module and has no
+	  dependencies other than the Python Standard Library.
+
+	  http://bottlepy.org
diff --git a/package/python-bottle/python-bottle.mk b/package/python-bottle/python-bottle.mk
new file mode 100644
index 0000000..370b31b
--- /dev/null
+++ b/package/python-bottle/python-bottle.mk
@@ -0,0 +1,22 @@
+#############################################################
+#
+# python-bottle
+#
+#############################################################
+
+PYTHON_BOTTLE_VERSION = 0.11.4
+PYTHON_BOTTLE_SOURCE = bottle-$(PYTHON_BOTTLE_VERSION).tar.gz
+PYTHON_BOTTLE_SITE = http://pypi.python.org/packages/source/b/bottle
+PYTHON_BOTTLE_DEPENDENCIES = python
+PYTHON_BOTTLE_LICENSE = MIT
+# README.rst refers to the file "LICENSE" but it's not included
+
+define PYTHON_BOTTLE_BUILD_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define PYTHON_BOTTLE_INSTALL_TARGET_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+$(eval $(generic-package))
