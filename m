From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu,  5 Dec 2013 10:08:01 +0100
Subject: [Buildroot] [PATCH] python-dialog: add new package
Message-ID: <1386234481-21183-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                      |    1 +
 package/python-dialog/Config.in        |    9 +++++++++
 package/python-dialog/python-dialog.mk |   23 +++++++++++++++++++++++
 3 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 package/python-dialog/Config.in
 create mode 100644 package/python-dialog/python-dialog.mk

diff --git a/package/Config.in b/package/Config.in
index cffd3fb..c84421c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -387,6 +387,7 @@ if BR2_PACKAGE_PYTHON
 menu "external python modules"
 source "package/python-bottle/Config.in"
 source "package/python-crc16/Config.in"
+source "package/python-dialog/Config.in"
 source "package/python-dpkt/Config.in"
 source "package/python-id3/Config.in"
 source "package/python-ipy/Config.in"
diff --git a/package/python-dialog/Config.in b/package/python-dialog/Config.in
new file mode 100644
index 0000000..fda2ff5
--- /dev/null
+++ b/package/python-dialog/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_DIALOG
+	bool "python-dialog"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_DIALOG
+	help
+	  A Python interface to the UNIX dialog utility and
+	  mostly-compatible programs.
+
+	  http://pythondialog.sourceforge.net/
diff --git a/package/python-dialog/python-dialog.mk b/package/python-dialog/python-dialog.mk
new file mode 100644
index 0000000..fa496de
--- /dev/null
+++ b/package/python-dialog/python-dialog.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# python-dialog
+#
+################################################################################
+
+PYTHON_DIALOG_VERSION = 3.0.1
+PYTHON_DIALOG_SOURCE  = python2-pythondialog-$(PYTHON_DIALOG_VERSION).tar.bz2
+PYTHON_DIALOG_SITE    = http://downloads.sourceforge.net/project/pythondialog/pythondialog/$(PYTHON_DIALOG_VERSION)
+PYTHON_DIALOG_LICENSE = LGPLv2.1+
+PYTHON_DIALOG_LICENSE_FILES = COPYING
+
+PYTHON_DIALOG_DEPENDENCIES = python dialog
+
+define PYTHON_DIALOG_BUILD_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define PYTHON_DIALOG_INSTALL_TARGET_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+$(eval $(generic-package))
-- 
1.7.7
