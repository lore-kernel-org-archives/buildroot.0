From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 15:00:06 +0200
Subject: [Buildroot] [git commit] python-sip: new package
Message-ID: <20150419130056.AAB0A819CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=72578e1883c98cea00d5f0cdac8d49ee6f93f532
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Based on http://lists.busybox.net/pipermail/buildroot/2013-October/080830.html

[Thomas:
 - fix license information: it is a "or" between the SIP license,
   GPLv2 and GPLv3
 - the target version of python-sip does *not* need the host version
   of python-sip, it can build perfectly fine without it. python-qt
   will need host-python-sip, but there's no need to have this
   dependency between python-sip and host-python-sip.
 - add support for Python 3, since the package could also be enabled
   for Python 3.
 - add <pkg>_BUILD_CMDS for host and target variants, so that the
   build does not take place when doing the installation.
 - use HOST_MAKE_ENV and TARGET_MAKE_ENV where appropriate.
 - fix indentation.
 - propagate the thread and mmu dependencies from Qt.
 - extend the Config.in help text.]

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Cc: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                  |    1 +
 package/python-sip/Config.in       |   24 ++++++++++++++
 package/python-sip/python-sip.hash |    4 ++
 package/python-sip/python-sip.mk   |   59 ++++++++++++++++++++++++++++++++++++
 4 files changed, 88 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f758155..f09dca8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -631,6 +631,7 @@ menu "external python modules"
 	source "package/python-serial/Config.in"
 	source "package/python-setuptools/Config.in"
 	source "package/python-simplejson/Config.in"
+	source "package/python-sip/Config.in"
 	source "package/python-six/Config.in"
 	source "package/python-spidev/Config.in"
 	source "package/python-thrift/Config.in"
diff --git a/package/python-sip/Config.in b/package/python-sip/Config.in
new file mode 100644
index 0000000..45e48ad
--- /dev/null
+++ b/package/python-sip/Config.in
@@ -0,0 +1,24 @@
+comment "python-sip needs a toolchain w/ C++, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_PYTHON_SIP
+	bool "python-sip"
+	depends on BR2_INSTALL_LIBSTDCPP # qt
+	depends on BR2_TOOLCHAIN_HAS_THREADS # qt
+	depends on BR2_USE_MMU # qt
+	select BR2_PACKAGE_QT
+	help
+	  SIP is a tool that makes it very easy to create Python
+	  bindings for C and C++ libraries. It was originally
+	  developed to create PyQt, the Python bindings for the Qt
+	  toolkit, but can be used to create bindings for any C or C++
+	  library.
+
+	  SIP comprises a code generator and a Python module. The code
+	  generator processes a set of specification files and
+	  generates C or C++ code which is then compiled to create the
+	  bindings extension module. The SIP Python module provides
+	  support functions to the automatically generated code.
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
index 0000000..59cd1fc
--- /dev/null
+++ b/package/python-sip/python-sip.mk
@@ -0,0 +1,59 @@
+################################################################################
+#
+# python-sip
+#
+################################################################################
+
+PYTHON_SIP_VERSION = 4.16.7
+PYTHON_SIP_SOURCE = sip-$(PYTHON_SIP_VERSION).tar.gz
+PYTHON_SIP_SITE = http://downloads.sourceforge.net/project/pyqt/sip/sip-$(PYTHON_SIP_VERSION)
+PYTHON_SIP_LICENSE = SIP license or GPLv2 or GPLv3
+PYTHON_SIP_LICENSE_FILES = LICENSE LICENSE-GPL2 LICENSE-GPL3
+
+PYTHON_SIP_DEPENDENCIES = qt
+
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+PYTHON_SIP_DEPENDENCIES += python
+HOST_PYTHON_SIP_DEPENDENCIES += host-python
+PYTHON_SIP_PYTHON_DIR = python$(PYTHON_VERSION_MAJOR)
+else ifeq ($(BR2_PACKAGE_PYTHON3),y)
+PYTHON_SIP_DEPENDENCIES += python3
+HOST_PYTHON_SIP_DEPENDENCIES += host-python3
+PYTHON_SIP_PYTHON_DIR = python$(PYTHON3_VERSION_MAJOR)
+endif
+
+define HOST_PYTHON_SIP_CONFIGURE_CMDS
+	(cd $(@D); \
+		$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(HOST_DIR)/usr/bin/python configure.py)
+endef
+
+define HOST_PYTHON_SIP_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define HOST_PYTHON_SIP_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) install -C $(@D)
+endef
+
+define PYTHON_SIP_CONFIGURE_CMDS
+	(cd $(@D); \
+		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(HOST_DIR)/usr/bin/python configure.py \
+			--bindir $(TARGET_DIR)/usr/bin \
+			--destdir $(TARGET_DIR)/usr/lib/$(PYTHON_SIP_PYTHON_DIR)/site-packages \
+			--incdir $(STAGING_DIR)/usr/include/$(PYTHON_SIP_PYTHON_DIR)  \
+			--sipdir $(TARGET_DIR)/usr/share/sip \
+			--sysroot $(STAGING_DIR)/usr \
+			--use-qmake && \
+		$(HOST_DIR)/usr/bin/qmake)
+endef
+
+define PYTHON_SIP_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define PYTHON_SIP_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) install -C $(@D)
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
