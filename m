From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Dec 2013 22:17:46 +0100
Subject: [Buildroot] [git commit] python-dialog: add new package
Message-ID: <20131208211823.DB6729BF72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4d2cb77a529693931b7965b2b24ea0b4ab5f0a71
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: Propagate dialog dependencies, show comment if not available]
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                      |    1 +
 package/python-dialog/Config.in        |   15 +++++++++++++++
 package/python-dialog/python-dialog.mk |   23 +++++++++++++++++++++++
 3 files changed, 39 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 4e37528..aa928ec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -386,6 +386,7 @@ if BR2_PACKAGE_PYTHON
 menu "external python modules"
 source "package/python-bottle/Config.in"
 source "package/python-crc16/Config.in"
+source "package/python-dialog/Config.in"
 source "package/python-dpkt/Config.in"
 source "package/python-id3/Config.in"
 source "package/python-ipy/Config.in"
diff --git a/package/python-dialog/Config.in b/package/python-dialog/Config.in
new file mode 100644
index 0000000..8dd3fdf
--- /dev/null
+++ b/package/python-dialog/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_PYTHON_DIALOG
+	bool "python-dialog"
+	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dialog
+	depends on BR2_USE_MMU # dialog
+	select BR2_PACKAGE_DIALOG
+	help
+	  A Python interface to the UNIX dialog utility and
+	  mostly-compatible programs.
+
+	  http://pythondialog.sourceforge.net/
+
+comment "python-dialog needs a toolchain w/ threads"
+	depends on BR2_USE_MMU && BR2_PACKAGE_PYTHON
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
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
