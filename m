From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 19:19:11 +0200
Subject: [Buildroot] [git commit] python-pyqt: new package
Message-ID: <20150419171955.15E33807AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ecb26b1add5b4b97e86c0fb60b56bcc44576aa6f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - Remove dependency on python (already a dependency of python-sip),
   and add a dependency on host-python-sip, since python-sip no longer
   depends on host-python-sip.
 - Make the code Python 2 / Python 3 compatible (both have been
   tested).
 - Fix indentation all over the place.
 - Remove double quotes when defining variable values, not needed.
 - Add <pkg>_BUILD_CMDS to do the build process separately from the
   installation.
 - Create a PYTHON_PYQT_CONF_OPTS variable with all the config
   options, since some of them are now conditional.
 - Use 'compileall' to byte-compile the dummy __init__.py.]

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Cc: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 .../python-pyqt/0001-configure-skip-qtdetail.patch |   29 ++++++
 package/python-pyqt/0002-configure-set-qws.patch   |   43 ++++++++
 package/python-pyqt/0003-sip-add_qws.patch         |   44 +++++++++
 ...004-sip-QtGuit-hide-qfont-cachestatistics.patch |   18 ++++
 package/python-pyqt/0005-sip-fix_qws_handle.patch  |   24 +++++
 package/python-pyqt/Config.in                      |   15 +++
 package/python-pyqt/python-pyqt.hash               |    5 +
 package/python-pyqt/python-pyqt.mk                 |  101 ++++++++++++++++++++
 9 files changed, 280 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f09dca8..319f01a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -618,6 +618,7 @@ menu "external python modules"
 	source "package/python-pyinotify/Config.in"
 	source "package/python-pyparsing/Config.in"
 	source "package/python-pypcap/Config.in"
+	source "package/python-pyqt/Config.in"
 	source "package/python-pyro/Config.in"
 	source "package/python-pysendfile/Config.in"
 	source "package/python-pysnmp/Config.in"
diff --git a/package/python-pyqt/0001-configure-skip-qtdetail.patch b/package/python-pyqt/0001-configure-skip-qtdetail.patch
new file mode 100644
index 0000000..08e99d0
--- /dev/null
+++ b/package/python-pyqt/0001-configure-skip-qtdetail.patch
@@ -0,0 +1,29 @@
+Do not run qtdetail
+
+qtdetail is a tool that generates qtdetail.out. Since this program is
+cross-compiled, it's not possible to run it on the host.
+
+Consequently, python-pyqt.mk generates the qtdetail.out file before
+calling configure-ng.py.
+
+Therefore, this patch makes sure that the pre-generated qtdetail.out
+file is kept, and that qtdetail is not executed.
+
+Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+Signed-off-by: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
+---
+Index: PyQt-x11-gpl-4.11.3/configure-ng.py
+===================================================================
+--- PyQt-x11-gpl-4.11.3.orig/configure-ng.py
++++ PyQt-x11-gpl-4.11.3/configure-ng.py
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
diff --git a/package/python-pyqt/0002-configure-set-qws.patch b/package/python-pyqt/0002-configure-set-qws.patch
new file mode 100644
index 0000000..33a5648
--- /dev/null
+++ b/package/python-pyqt/0002-configure-set-qws.patch
@@ -0,0 +1,43 @@
+Add support for several Qt flavors
+
+Qt has two flavors: X11 and embedded (QWS). QWS has some limitations
+compared to X11. This patch adds an option to select which version to
+use.
+
+Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+---
+Index: PyQt-x11-gpl-4.11.3/configure-ng.py
+===================================================================
+--- PyQt-x11-gpl-4.11.3.orig/configure-ng.py
++++ PyQt-x11-gpl-4.11.3/configure-ng.py
+@@ -960,6 +960,9 @@ int main(int argc, char **argv)
+         if opts.vendlibdir is not None:
+             self.vend_lib_dir = opts.vendlibdir
+ 
++        if opts.qtflavor is not None:
++            self.qt_flavor = opts.qtflavor
++
+         # Handle any conflicts.
+         if self.qt_shared:
+             if len(self.static_plugins) != 0:
+@@ -1177,6 +1180,11 @@ def create_optparser(target_config):
+             dest="notools",
+             help="disable the building of pyuic5, pyrcc5 and pylupdate5 "
+                     "[default: enabled]")
++    g.add_option("--qt-flavor", dest='qtflavor', type='string',
++            default="WS_X11", metavar='QTFLAVOR', action='store',
++            help="select Qt flavor beetween WS_X11 and WS_QWS "
++                    "only available on Linux)"
++                    "[default: WS_X11]")
+     p.add_option_group(g)
+ 
+     # Vendor ID.
+@@ -2088,7 +2096,7 @@ def get_sip_flags(target_config):
+     elif target_config.py_platform == 'darwin':
+         plattag = 'WS_MACX'
+     else:
+-        plattag = 'WS_X11'
++        plattag = target_config.qt_flavor
+ 
+     sip_flags.append('-t')
+     sip_flags.append(plattag)
diff --git a/package/python-pyqt/0003-sip-add_qws.patch b/package/python-pyqt/0003-sip-add_qws.patch
new file mode 100644
index 0000000..1ff706f
--- /dev/null
+++ b/package/python-pyqt/0003-sip-add_qws.patch
@@ -0,0 +1,44 @@
+Add WS_QWS in the Platforms variable and to define some types
+
+Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+Signed-off-by: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
+---
+Index: PyQt-x11-gpl-4.11.3/sip/QtCore/QtCoremod.sip
+===================================================================
+--- PyQt-x11-gpl-4.11.3.orig/sip/QtCore/QtCoremod.sip
++++ PyQt-x11-gpl-4.11.3/sip/QtCore/QtCoremod.sip
+@@ -29,7 +29,7 @@
+ 
+ %Timeline {Qt_4_1_0 Qt_4_1_1 Qt_4_1_2 Qt_4_1_3 Qt_4_2_0 Qt_4_2_1 Qt_4_2_2 Qt_4_2_3 Qt_4_3_0 Qt_4_3_1 Qt_4_3_2 Qt_4_3_3 Qt_4_3_4 Qt_4_4_0 Qt_4_4_1 Qt_4_4_2 Qt_4_5_0 Qt_4_5_1 Qt_4_5_2 Qt_4_5_3 Qt_4_6_0 Qt_4_6_1 Qt_4_6_2 Qt_4_6_3 Qt_4_7_0 Qt_4_7_1 Qt_4_7_2 Qt_4_7_3 Qt_4_7_4 Qt_4_8_0 Qt_4_8_1 Qt_4_8_2 Qt_4_8_3 Qt_4_8_4 Qt_4_8_5 Qt_4_8_6 Qt_5_0_0}
+ 
+-%Platforms {WS_X11 WS_WIN WS_MACX}
++%Platforms {WS_X11 WS_QWS WS_WIN WS_MACX}
+ 
+ %Feature PyQt_Accessibility
+ %Feature PyQt_SessionManager
+Index: PyQt-x11-gpl-4.11.3/sip/QtCore/qprocess.sip
+===================================================================
+--- PyQt-x11-gpl-4.11.3.orig/sip/QtCore/qprocess.sip
++++ PyQt-x11-gpl-4.11.3/sip/QtCore/qprocess.sip
+@@ -28,7 +28,7 @@
+ %If (WS_WIN)
+ typedef void *Q_PID;
+ %End
+-%If (WS_X11 || WS_MACX)
++%If (WS_X11 || WS_QWS || WS_MACX)
+ typedef qint64 Q_PID;
+ %End
+ 
+Index: PyQt-x11-gpl-4.11.3/sip/QtGui/qwindowdefs.sip
+===================================================================
+--- PyQt-x11-gpl-4.11.3.orig/sip/QtGui/qwindowdefs.sip
++++ PyQt-x11-gpl-4.11.3/sip/QtGui/qwindowdefs.sip
+@@ -27,7 +27,7 @@
+ 
+ typedef QList<QWidget*> QWidgetList;
+ %If (- Qt_5_0_0)
+-%If (WS_X11)
++%If (WS_X11 || WS_QWS)
+ // X11 specific definitions.
+ typedef unsigned long WId;
+ %End
diff --git a/package/python-pyqt/0004-sip-QtGuit-hide-qfont-cachestatistics.patch b/package/python-pyqt/0004-sip-QtGuit-hide-qfont-cachestatistics.patch
new file mode 100644
index 0000000..c07bea7
--- /dev/null
+++ b/package/python-pyqt/0004-sip-QtGuit-hide-qfont-cachestatistics.patch
@@ -0,0 +1,18 @@
+Hide QFont::cacheStatistics which isn't available in QWS
+
+Signed-off-by: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
+---
+
+diff -ur PyQt-x11-gpl-4.9.6/sip/QtGui/qfont.sip pyqt-4.9.6/sip/QtGui/qfont.sip
+--- PyQt-x11-gpl-4.9.6/sip/QtGui/qfont.sip	2012-12-08 13:51:38.000000000 +0400
++++ pyqt-4.9.6/sip/QtGui/qfont.sip	2013-05-22 14:06:38.335000022 +0400
+@@ -185,7 +185,9 @@
+ %End
+     static void initialize();
+     static void cleanup();
++%If (!WS_QWS)
+     static void cacheStatistics();
++%End
+     QString defaultFamily() const;
+     QString lastResortFamily() const;
+     QString lastResortFont() const;
diff --git a/package/python-pyqt/0005-sip-fix_qws_handle.patch b/package/python-pyqt/0005-sip-fix_qws_handle.patch
new file mode 100644
index 0000000..80623d1
--- /dev/null
+++ b/package/python-pyqt/0005-sip-fix_qws_handle.patch
@@ -0,0 +1,24 @@
+Fix build issue in QWS flavor
+
+Change HANDLE to void* to get rid of :
+buildroot/output/build/python-pyqt-4.11.3/QtCore/sipQtCoreQThread.cpp:318:50:
+error: invalid conversion from 'Qt::HANDLE {aka void*}' to 'long
+unsigned int' [-fpermissive] error during compilation.
+
+Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+Signed-off-by: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
+---
+Index: PyQt-x11-gpl-4.11.3/sip/QtCore/qnamespace.sip
+===================================================================
+--- PyQt-x11-gpl-4.11.3.orig/sip/QtCore/qnamespace.sip
++++ PyQt-x11-gpl-4.11.3/sip/QtCore/qnamespace.sip
+@@ -1673,6 +1673,9 @@ namespace Qt
+ %If (WS_X11)
+     typedef unsigned long HANDLE;
+ %End
++%If (WS_QWS)
++    typedef void* HANDLE;
++%End
+ %End
+ %If (PyQt_Deprecated_5_0)
+     typedef Qt::WindowFlags WFlags;
diff --git a/package/python-pyqt/Config.in b/package/python-pyqt/Config.in
new file mode 100644
index 0000000..d4544fa
--- /dev/null
+++ b/package/python-pyqt/Config.in
@@ -0,0 +1,15 @@
+comment "python-pyqt needs a toolchain w/ C++, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_PYTHON_PYQT
+	bool "python-pyqt"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS # qt
+	depends on BR2_USE_MMU # qt
+	select BR2_PACKAGE_QT
+	select BR2_PACKAGE_PYTHON_SIP
+	help
+	  PyQt4 for Qt Embedded 4 bindings.
+
+	  http://www.riverbankcomputing.com/software/pyqt/
diff --git a/package/python-pyqt/python-pyqt.hash b/package/python-pyqt/python-pyqt.hash
new file mode 100644
index 0000000..1709b66
--- /dev/null
+++ b/package/python-pyqt/python-pyqt.hash
@@ -0,0 +1,5 @@
+# From http://http://sourceforge.net/projects/pyqt/files/PyQt4/PyQt-4.11.3/
+md5 997c3e443165a89a559e0d96b061bf70 PyQt-x11-gpl-4.11.3.tar.gz
+
+# Locally calculated:
+sha256 853780dcdbe2e6ba785d703d059b096e1fc49369d3e8d41a060be874b8745686 PyQt-x11-gpl-4.11.3.tar.gz
diff --git a/package/python-pyqt/python-pyqt.mk b/package/python-pyqt/python-pyqt.mk
new file mode 100644
index 0000000..2363f7d
--- /dev/null
+++ b/package/python-pyqt/python-pyqt.mk
@@ -0,0 +1,101 @@
+################################################################################
+#
+# python-pyqt
+#
+################################################################################
+
+PYTHON_PYQT_VERSION = 4.11.3
+PYTHON_PYQT_SOURCE = PyQt-x11-gpl-$(PYTHON_PYQT_VERSION).tar.gz
+PYTHON_PYQT_SITE = http://downloads.sourceforge.net/project/pyqt/PyQt4/PyQt-$(PYTHON_PYQT_VERSION)
+PYTHON_PYQT_LICENSE = GPLv2 or GPLv3
+PYTHON_PYQT_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3
+
+PYTHON_PYQT_DEPENDENCIES = python-sip host-python-sip qt
+
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+PYTHON_PYQT_PYTHON_DIR = python$(PYTHON_VERSION_MAJOR)
+else ifeq ($(BR2_PACKAGE_PYTHON3),y)
+PYTHON_PYQT_PYTHON_DIR = python$(PYTHON3_VERSION_MAJOR)
+endif
+
+ifeq ($(BR2_PACKAGE_QT_EMBEDDED),y)
+PYTHON_PYQT_QTFLAVOR = WS_QWS
+else
+PYTHON_PYQT_QTFLAVOR = WS_X11
+endif
+
+PYTHON_PYQT_QTDETAIL_LICENSE = Open Source
+
+ifeq ($(BR2_PACKAGE_QT_SHARED),y)
+PYTHON_PYQT_QTDETAIL_TYPE = shared
+endif
+
+# Turn off features that aren't available in QWS and current qt
+# configuration.
+PYTHON_PYQT_QTDETAIL_DISABLE_FEATURES = \
+	PyQt_Accessibility PyQt_SessionManager PyQt_qreal_double \
+	PyQt_Shortcut PyQt_RawFont
+
+ifeq ($(BR2_PACKAGE_QT_OPENSSL),)
+PYTHON_PYQT_QTDETAIL_DISABLE_FEATURES += PyQt_OpenSSL
+endif
+
+define PYTHON_PYQT_QTDETAIL
+	echo $(1) >> $(2)/qtdetail.out
+endef
+
+# Since we can't run generate qtdetail.out by running qtdetail on target device
+# we must generate the configuration.
+define PYTHON_PYQT_GENERATE_QTDETAIL
+	$(RM) -f $(1)/qtdetail.out
+	$(call PYTHON_PYQT_QTDETAIL,$(PYTHON_PYQT_QTDETAIL_LICENSE),$(1))
+	$(call PYTHON_PYQT_QTDETAIL,$(PYTHON_PYQT_QTDETAIL_TYPE),$(1))
+	$(foreach f,$(PYTHON_PYQT_QTDETAIL_DISABLE_FEATURES),
+		$(call PYTHON_PYQT_QTDETAIL,$(f),$(1)) \
+	)
+endef
+
+PYTHON_PYQT_CONF_OPTS = \
+	--bindir $(TARGET_DIR)/usr/bin \
+	--destdir $(TARGET_DIR)/usr/lib/$(PYTHON_PYQT_PYTHON_DIR)/site-packages \
+	--qmake $(HOST_DIR)/usr/bin/qmake \
+	--sysroot $(STAGING_DIR)/usr \
+	-w --confirm-license \
+	--no-designer-plugin \
+	--no-docstrings \
+	--no-sip-files \
+	--qt-flavor=$(PYTHON_PYQT_QTFLAVOR)
+
+# The VendorID related information is only needed for Python 2.x, not
+# Python 3.x.
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+PYTHON_PYQT_CONF_OPTS += \
+	--vendorid-incdir $(STAGING_DIR)/usr/include/$(PYTHON_PYQT_PYTHON_DIR)  \
+	--vendorid-libdir $(STAGING_DIR)/usr/lib/$(PYTHON_PYQT_PYTHON_DIR)/config
+endif
+
+define PYTHON_PYQT_CONFIGURE_CMDS
+	$(call PYTHON_PYQT_GENERATE_QTDETAIL,$(@D))
+	(cd $(@D); \
+		$(TARGET_MAKE_ENV) \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(HOST_DIR)/usr/bin/python configure-ng.py \
+			$(PYTHON_PYQT_CONF_OPTS) \
+	)
+endef
+
+define PYTHON_PYQT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+# __init__.py is needed to import PyQt4
+# __init__.pyc is needed if BR2_PACKAGE_PYTHON_PYC_ONLY is set
+define PYTHON_PYQT_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) install
+	touch $(TARGET_DIR)/usr/lib/$(PYTHON_PYQT_PYTHON_DIR)/site-packages/PyQt4/__init__.py
+	PYTHONPATH="$(PYTHON_PATH)" \
+		$(HOST_DIR)/usr/bin/python -c "import compileall; \
+		compileall.compile_dir('$(TARGET_DIR)/usr/lib/$(PYTHON_PYQT_PYTHON_DIR)/site-packages/PyQt4')"
+endef
+
+$(eval $(generic-package))
