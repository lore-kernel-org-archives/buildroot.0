From: =?UTF-8?q?Manuel=20V=C3=B6gele?= <develop@manuel-voegele.de>
Date: Fri, 19 Aug 2016 15:42:25 +0200
Subject: [Buildroot] [PATCH 2/2] python-pyqt5: new package
In-Reply-To: <20160819134225.1490-1-develop@manuel-voegele.de>
References: <20160819134225.1490-1-develop@manuel-voegele.de>
Message-ID: <20160819134225.1490-3-develop@manuel-voegele.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Manuel V?gele <develop@manuel-voegele.de>
---
 package/Config.in                                  |  1 +
 .../0001-configure-skip-qtdetail.patch             | 29 +++++++
 package/python-pyqt5/Config.in                     | 23 ++++++
 package/python-pyqt5/python-pyqt5.hash             |  3 +
 package/python-pyqt5/python-pyqt5.mk               | 88 ++++++++++++++++++++++
 5 files changed, 144 insertions(+)
 create mode 100644 package/python-pyqt5/0001-configure-skip-qtdetail.patch
 create mode 100644 package/python-pyqt5/Config.in
 create mode 100644 package/python-pyqt5/python-pyqt5.hash
 create mode 100644 package/python-pyqt5/python-pyqt5.mk

diff --git a/package/Config.in b/package/Config.in
index 1e51a45..c4b4ed1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -734,6 +734,7 @@ menu "External python modules"
 	source "package/python-pyparted/Config.in"
 	source "package/python-pypcap/Config.in"
 	source "package/python-pyqt/Config.in"
+	source "package/python-pyqt5/Config.in"
 	source "package/python-pyratemp/Config.in"
 	source "package/python-pyro/Config.in"
 	source "package/python-pyroute2/Config.in"
diff --git a/package/python-pyqt5/0001-configure-skip-qtdetail.patch b/package/python-pyqt5/0001-configure-skip-qtdetail.patch
new file mode 100644
index 0000000..2e7b331
--- /dev/null
+++ b/package/python-pyqt5/0001-configure-skip-qtdetail.patch
@@ -0,0 +1,29 @@
+Do not run qtdetail
+
+qtdetail is a tool that generates qtdetail.out. Since this program is
+cross-compiled, it's not possible to run it on the host.
+
+Consequently, python-pyqt5.mk generates the qtdetail.out file before
+calling configure.py.
+
+Therefore, this patch makes sure that the pre-generated qtdetail.out
+file is kept, and that qtdetail is not executed.
+
+Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+Signed-off-by: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
+---
+Index: PyQt5_gpl-5.7/configure.py
+===================================================================
+--- PyQt5_gpl-5.7.orig/configure.py
++++ PyQt5_gpl-5.7/configure.py
+@@ -672,10 +672,6 @@ int main(int argc, char **argv)
+         if cmd is None:
+             error("Failed to determine the detail of your Qt installation. Try again using the --verbose flag to see more detail about the problem.")
+ 
+-        # Create the output file, first making sure it doesn't exist.
+-        remove_file(out_file)
+-        run_command(cmd, verbose)
+-
+         if not os.access(out_file, os.F_OK):
+             error("%s failed to create %s. Make sure your Qt installation is correct." % (cmd, out_file))
+ 
diff --git a/package/python-pyqt5/Config.in b/package/python-pyqt5/Config.in
new file mode 100644
index 0000000..6dcdd84
--- /dev/null
+++ b/package/python-pyqt5/Config.in
@@ -0,0 +1,23 @@
+comment "python-pyqt5 needs a toolchain w/ C++, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_PYTHON_PYQT5
+	bool "python-pyqt5"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS # qt
+	depends on BR2_USE_MMU # qt
+	select BR2_PACKAGE_QT5
+	select BR2_PACKAGE_PYTHON_SIP
+	help
+	  PyQt4 for Qt Embedded 4 bindings.
+
+	  http://www.riverbankcomputing.com/software/pyqt/
+
+if BR2_PACKAGE_PYTHON_PYQT5
+
+config BR2_PACKAGE_PYTHON_PYQT5_ARCH_USES_QREAL_FLOAT
+	bool
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_sh4 || BR2_sh4eb || BR2_sh4a || BR2_sh4aeb
+endif
diff --git a/package/python-pyqt5/python-pyqt5.hash b/package/python-pyqt5/python-pyqt5.hash
new file mode 100644
index 0000000..2a7d05b
--- /dev/null
+++ b/package/python-pyqt5/python-pyqt5.hash
@@ -0,0 +1,3 @@
+# md5 from http://http://sourceforge.net/projects/pyqt/files/PyQt5/PyQt-5.7, sha256 locally computed
+md5	e3dc21f31fd714659f0688e1eb31bacf  PyQt5_gpl-5.7.tar.gz
+sha256	892693ba5f79989abb2061dad2d5c4e6f127e9dd3240f73f8220c7152cd35b05  PyQt5_gpl-5.7.tar.gz
diff --git a/package/python-pyqt5/python-pyqt5.mk b/package/python-pyqt5/python-pyqt5.mk
new file mode 100644
index 0000000..a2defa3
--- /dev/null
+++ b/package/python-pyqt5/python-pyqt5.mk
@@ -0,0 +1,88 @@
+################################################################################
+#
+# python-pyqt5
+#
+################################################################################
+
+PYTHON_PYQT5_VERSION = 5.7
+PYTHON_PYQT5_SOURCE = PyQt5_gpl-$(PYTHON_PYQT5_VERSION).tar.gz
+PYTHON_PYQT5_SITE = http://downloads.sourceforge.net/project/pyqt/PyQt5/PyQt-$(PYTHON_PYQT5_VERSION)
+PYTHON_PYQT5_LICENSE = GPLv3
+PYTHON_PYQT5_LICENSE_FILES = LICENSE
+
+PYTHON_PYQT5_DEPENDENCIES = python-sip host-python-sip qt5base
+
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+PYTHON_PYQT5_PYTHON_DIR = python$(PYTHON_VERSION_MAJOR)
+PYTHON_PYQT5_RM_PORT_BASE = port_v3
+else ifeq ($(BR2_PACKAGE_PYTHON3),y)
+PYTHON_PYQT5_PYTHON_DIR = python$(PYTHON3_VERSION_MAJOR)
+PYTHON_PYQT5_RM_PORT_BASE = port_v2
+endif
+
+PYTHON_PYQT5_QTDETAIL_LICENSE = Open Source
+
+PYTHON_PYQT5_QTDETAIL_TYPE = shared
+
+# Turn off features that aren't available in current qt configuration
+
+PYTHON_PYQT5_QTDETAIL_DISABLE_FEATURES += $(if $(BR2_PACKAGE_OPENSSL),,PyQt_SSL)
+PYTHON_PYQT5_QTDETAIL_DISABLE_FEATURES += $(if $(BR2_PACKAGE_QT5BASE_OPENGL),,PyQt_OpenGL)
+
+# PyQt_qreal_double must be disabled on a number of architectures that
+# use float for qreal.
+ifeq ($(BR2_PACKAGE_PYTHON_PYQT5_ARCH_USES_QREAL_FLOAT),y)
+PYTHON_PYQT5_QTDETAIL_DISABLE_FEATURES += PyQt_qreal_double
+endif
+
+define PYTHON_PYQT5_QTDETAIL
+	echo $(1) >> $(2)/qtdetail.out
+endef
+
+# Since we can't run generate qtdetail.out by running qtdetail on target device
+# we must generate the configuration.
+define PYTHON_PYQT5_GENERATE_QTDETAIL
+	$(RM) -f $(1)/qtdetail.out
+	$(call PYTHON_PYQT5_QTDETAIL,$(PYTHON_PYQT5_QTDETAIL_LICENSE),$(1))
+	$(call PYTHON_PYQT5_QTDETAIL,$(PYTHON_PYQT5_QTDETAIL_TYPE),$(1))
+	$(foreach f,$(PYTHON_PYQT5_QTDETAIL_DISABLE_FEATURES),
+		$(call PYTHON_PYQT5_QTDETAIL,$(f),$(1)) \
+	)
+endef
+
+PYTHON_PYQT5_CONF_OPTS = \
+	--bindir $(TARGET_DIR)/usr/bin \
+	--destdir $(TARGET_DIR)/usr/lib/$(PYTHON_PYQT5_PYTHON_DIR)/site-packages \
+	--qmake $(HOST_DIR)/usr/bin/qmake \
+	--sysroot $(STAGING_DIR)/usr \
+	-w --confirm-license \
+	--no-designer-plugin \
+	--no-docstrings \
+	--no-sip-files
+
+define PYTHON_PYQT5_CONFIGURE_CMDS
+	$(call PYTHON_PYQT5_GENERATE_QTDETAIL,$(@D))
+	(cd $(@D); \
+		$(TARGET_MAKE_ENV) \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(HOST_DIR)/usr/bin/python configure.py \
+			$(PYTHON_PYQT5_CONF_OPTS) \
+	)
+endef
+
+define PYTHON_PYQT5_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+# __init__.py is needed to import PyQt5
+# __init__.pyc is needed if BR2_PACKAGE_PYTHON_PYC_ONLY is set
+define PYTHON_PYQT5_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) install
+	touch $(TARGET_DIR)/usr/lib/$(PYTHON_PYQT5_PYTHON_DIR)/site-packages/PyQt5/__init__.py
+	$(RM) -rf $(TARGET_DIR)/usr/lib/$(PYTHON_PYQT5_PYTHON_DIR)/site-packages/PyQt5/uic/$(PYTHON_PYQT5_RM_PORT_BASE)
+	PYTHONPATH="$(PYTHON_PATH)" \
+		$(HOST_DIR)/usr/bin/python -c "import compileall; \
+		compileall.compile_dir('$(TARGET_DIR)/usr/lib/$(PYTHON_PYQT5_PYTHON_DIR)/site-packages/PyQt5')"
+endef
+
+$(eval $(generic-package))
-- 
2.1.4
