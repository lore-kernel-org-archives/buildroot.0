From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Sun, 19 Apr 2015 10:03:52 +0200
Subject: [Buildroot] [PATCH v3 1/2] python-sip: new package
Message-ID: <1429430633-12267-1-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Based on http://lists.busybox.net/pipermail/buildroot/2013-October/080830.html

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Cc: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
---
Changes v2 -> v3:
 * bump version.
 * suppress patch, --sysroot is enough.
 * use qmake for configuration instead of sed.
 * corrects LICENSE variable
 * add depends on Qt
Changes v1 -> v2:
 * renames patch.
 * add depends on BR2_INSTALL_LIBSTDCPP.
 * add hash file.
 * add license informations.
---
 package/Config.in                  |  1 +
 package/python-sip/Config.in       | 12 ++++++++++
 package/python-sip/python-sip.hash |  4 ++++
 package/python-sip/python-sip.mk   | 45 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 62 insertions(+)
 create mode 100644 package/python-sip/Config.in
 create mode 100644 package/python-sip/python-sip.hash
 create mode 100644 package/python-sip/python-sip.mk

diff --git a/package/Config.in b/package/Config.in
index 248e18b..546a9e5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -605,6 +605,7 @@ menu "external python modules"
 	source "package/python-serial/Config.in"
 	source "package/python-setuptools/Config.in"
 	source "package/python-simplejson/Config.in"
+	source "package/python-sip/Config.in"
 	source "package/python-six/Config.in"
 	source "package/python-spidev/Config.in"
 	source "package/python-thrift/Config.in"
diff --git a/package/python-sip/Config.in b/package/python-sip/Config.in
new file mode 100644
index 0000000..3ee6c2a
--- /dev/null
+++ b/package/python-sip/Config.in
@@ -0,0 +1,12 @@
+comment "python-sip needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_PYTHON_SIP
+	bool "python-sip"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_QT
+	help
+	  SIP is a tool for C/C++ libraries binding. It was developed
+	  to create PyQt
+
+	  http://www.riverbankcomputing.com/software/sip/intro
diff --git a/package/python-sip/python-sip.hash b/package/python-sip/python-sip.hash
new file mode 100644
index 0000000..aba5470
--- /dev/null
+++ b/package/python-sip/python-sip.hash
@@ -0,0 +1,4 @@
+# From http://sourceforge.net/projects/pyqt/files/sip/sip-4.16.7/
+md5 32abc003980599d33ffd789734de4c36	sip-4.16.7.tar.gz
+# Locally calculated:
+sha256 4caa8d52e4403bae5c4c64f44de03a2cfd0bb10b6d96c5fb771133516df9abbd	sip-4.16.7.tar.gz
diff --git a/package/python-sip/python-sip.mk b/package/python-sip/python-sip.mk
new file mode 100644
index 0000000..f91b426
--- /dev/null
+++ b/package/python-sip/python-sip.mk
@@ -0,0 +1,45 @@
+################################################################################
+#
+# python-sip
+#
+################################################################################
+
+PYTHON_SIP_VERSION = 4.16.7
+PYTHON_SIP_SOURCE = sip-$(PYTHON_SIP_VERSION).tar.gz
+PYTHON_SIP_SITE = http://downloads.sourceforge.net/project/pyqt/sip/sip-$(PYTHON_SIP_VERSION)
+PYTHON_SIP_LICENSE = Riverbank license for SIP and GPLv2 and GPLv3
+PYTHON_SIP_LICENSE_FILES = LICENSE LICENSE-GPL2 LICENSE-GPL3
+
+PYTHON_SIP_DEPENDENCIES = python host-python-sip qt
+HOST_PYTHON_SIP_DEPENDENCIES = host-python
+
+define HOST_PYTHON_SIP_CONFIGURE_CMDS
+	(cd $(@D); \
+	$(HOST_CONFIGURE_OPTS) $(HOST_DIR)/usr/bin/python configure.py \
+	)
+endef
+
+define PYTHON_SIP_CONFIGURE_CMDS
+	( cd $(@D); \
+	$(TARGET_CONFIGURE_OPTS) \
+	$(HOST_DIR)/usr/bin/python configure.py \
+		--bindir $(TARGET_DIR)/usr/bin \
+		--destdir $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+		--incdir $(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)  \
+		--sipdir $(TARGET_DIR)/usr/share/sip \
+		--sysroot $(STAGING_DIR)/usr \
+		--use-qmake; \
+		$(HOST_DIR)/usr/bin/qmake \
+	)
+endef
+
+define PYTHON_SIP_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) install -C $(@D)
+endef
+
+define HOST_PYTHON_SIP_INSTALL_CMDS
+	$(HOST_CONFIGURE_OPTS) $(MAKE) install -C $(@D)
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.0.5
