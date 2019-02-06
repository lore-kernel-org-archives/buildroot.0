From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 6 Feb 2019 15:13:24 +0100
Subject: [Buildroot] [git commit] package/python-pyqt: remove package
Message-ID: <20190206145216.B76BB7F952@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=90bbfe58dd0945b1c9dda9e962e0761fdffc68cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The python-pyqt package uses the obsolete qt4 package, which we are about to
remove, so remove python-pyqt as well.

CC: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy                                   |   7 ++
 DEVELOPERS                                         |   1 -
 package/Config.in                                  |   1 -
 .../python-pyqt/0001-configure-skip-qtdetail.patch |  29 ------
 package/python-pyqt/0002-configure-set-qws.patch   |  43 --------
 package/python-pyqt/0003-sip-add_qws.patch         |  44 --------
 ...004-sip-QtGuit-hide-qfont-cachestatistics.patch |  18 ----
 package/python-pyqt/0005-sip-fix_qws_handle.patch  |  24 -----
 package/python-pyqt/Config.in                      |  21 ----
 package/python-pyqt/python-pyqt.hash               |   5 -
 package/python-pyqt/python-pyqt.mk                 | 113 ---------------------
 11 files changed, 7 insertions(+), 299 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c84a9239a7..5a330cada9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2019.02"
 
+config BR2_PACKAGE_PYTHON_PYQT
+	bool "python-pyqt package removed"
+	select BR2_LEGACY
+	help
+	  The python-pyqt package was removed. Consider python-pyqt5
+	  instead.
+
 config BR2_PACKAGE_GNURADIO_QTGUI
 	bool "gnuradio gr-qtgui option removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 834b6ed62d..cc21364fb3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -940,7 +940,6 @@ F:	package/gr-osmosdr/
 F:	package/libusbgx/
 F:	package/python-cheetah/
 F:	package/python-markdown/
-F:	package/python-pyqt/
 F:	package/python-remi/
 F:	package/python-sip/
 
diff --git a/package/Config.in b/package/Config.in
index ebba7b4df2..9907221b68 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -989,7 +989,6 @@ menu "External python modules"
 	source "package/python-pyparted/Config.in"
 	source "package/python-pypcap/Config.in"
 	source "package/python-pyqrcode/Config.in"
-	source "package/python-pyqt/Config.in"
 	source "package/python-pyqt5/Config.in"
 	source "package/python-pyratemp/Config.in"
 	source "package/python-pyro/Config.in"
diff --git a/package/python-pyqt/0001-configure-skip-qtdetail.patch b/package/python-pyqt/0001-configure-skip-qtdetail.patch
deleted file mode 100644
index 08e99d026c..0000000000
--- a/package/python-pyqt/0001-configure-skip-qtdetail.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Do not run qtdetail
-
-qtdetail is a tool that generates qtdetail.out. Since this program is
-cross-compiled, it's not possible to run it on the host.
-
-Consequently, python-pyqt.mk generates the qtdetail.out file before
-calling configure-ng.py.
-
-Therefore, this patch makes sure that the pre-generated qtdetail.out
-file is kept, and that qtdetail is not executed.
-
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
-Signed-off-by: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
----
-Index: PyQt-x11-gpl-4.11.3/configure-ng.py
-===================================================================
---- PyQt-x11-gpl-4.11.3.orig/configure-ng.py
-+++ PyQt-x11-gpl-4.11.3/configure-ng.py
-@@ -672,10 +672,6 @@ int main(int argc, char **argv)
-         if cmd is None:
-             error("Failed to determine the detail of your Qt installation. Try again using the --verbose flag to see more detail about the problem.")
- 
--        # Create the output file, first making sure it doesn't exist.
--        remove_file(out_file)
--        run_command(cmd, verbose)
--
-         if not os.access(out_file, os.F_OK):
-             error("%s failed to create %s. Make sure your Qt installation is correct." % (cmd, out_file))
- 
diff --git a/package/python-pyqt/0002-configure-set-qws.patch b/package/python-pyqt/0002-configure-set-qws.patch
deleted file mode 100644
index 33a5648bee..0000000000
--- a/package/python-pyqt/0002-configure-set-qws.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Add support for several Qt flavors
-
-Qt has two flavors: X11 and embedded (QWS). QWS has some limitations
-compared to X11. This patch adds an option to select which version to
-use.
-
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
----
-Index: PyQt-x11-gpl-4.11.3/configure-ng.py
-===================================================================
---- PyQt-x11-gpl-4.11.3.orig/configure-ng.py
-+++ PyQt-x11-gpl-4.11.3/configure-ng.py
-@@ -960,6 +960,9 @@ int main(int argc, char **argv)
-         if opts.vendlibdir is not None:
-             self.vend_lib_dir = opts.vendlibdir
- 
-+        if opts.qtflavor is not None:
-+            self.qt_flavor = opts.qtflavor
-+
-         # Handle any conflicts.
-         if self.qt_shared:
-             if len(self.static_plugins) != 0:
-@@ -1177,6 +1180,11 @@ def create_optparser(target_config):
-             dest="notools",
-             help="disable the building of pyuic5, pyrcc5 and pylupdate5 "
-                     "[default: enabled]")
-+    g.add_option("--qt-flavor", dest='qtflavor', type='string',
-+            default="WS_X11", metavar='QTFLAVOR', action='store',
-+            help="select Qt flavor beetween WS_X11 and WS_QWS "
-+                    "only available on Linux)"
-+                    "[default: WS_X11]")
-     p.add_option_group(g)
- 
-     # Vendor ID.
-@@ -2088,7 +2096,7 @@ def get_sip_flags(target_config):
-     elif target_config.py_platform == 'darwin':
-         plattag = 'WS_MACX'
-     else:
--        plattag = 'WS_X11'
-+        plattag = target_config.qt_flavor
- 
-     sip_flags.append('-t')
-     sip_flags.append(plattag)
diff --git a/package/python-pyqt/0003-sip-add_qws.patch b/package/python-pyqt/0003-sip-add_qws.patch
deleted file mode 100644
index 1ff706f624..0000000000
--- a/package/python-pyqt/0003-sip-add_qws.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Add WS_QWS in the Platforms variable and to define some types
-
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
-Signed-off-by: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
----
-Index: PyQt-x11-gpl-4.11.3/sip/QtCore/QtCoremod.sip
-===================================================================
---- PyQt-x11-gpl-4.11.3.orig/sip/QtCore/QtCoremod.sip
-+++ PyQt-x11-gpl-4.11.3/sip/QtCore/QtCoremod.sip
-@@ -29,7 +29,7 @@
- 
- %Timeline {Qt_4_1_0 Qt_4_1_1 Qt_4_1_2 Qt_4_1_3 Qt_4_2_0 Qt_4_2_1 Qt_4_2_2 Qt_4_2_3 Qt_4_3_0 Qt_4_3_1 Qt_4_3_2 Qt_4_3_3 Qt_4_3_4 Qt_4_4_0 Qt_4_4_1 Qt_4_4_2 Qt_4_5_0 Qt_4_5_1 Qt_4_5_2 Qt_4_5_3 Qt_4_6_0 Qt_4_6_1 Qt_4_6_2 Qt_4_6_3 Qt_4_7_0 Qt_4_7_1 Qt_4_7_2 Qt_4_7_3 Qt_4_7_4 Qt_4_8_0 Qt_4_8_1 Qt_4_8_2 Qt_4_8_3 Qt_4_8_4 Qt_4_8_5 Qt_4_8_6 Qt_5_0_0}
- 
--%Platforms {WS_X11 WS_WIN WS_MACX}
-+%Platforms {WS_X11 WS_QWS WS_WIN WS_MACX}
- 
- %Feature PyQt_Accessibility
- %Feature PyQt_SessionManager
-Index: PyQt-x11-gpl-4.11.3/sip/QtCore/qprocess.sip
-===================================================================
---- PyQt-x11-gpl-4.11.3.orig/sip/QtCore/qprocess.sip
-+++ PyQt-x11-gpl-4.11.3/sip/QtCore/qprocess.sip
-@@ -28,7 +28,7 @@
- %If (WS_WIN)
- typedef void *Q_PID;
- %End
--%If (WS_X11 || WS_MACX)
-+%If (WS_X11 || WS_QWS || WS_MACX)
- typedef qint64 Q_PID;
- %End
- 
-Index: PyQt-x11-gpl-4.11.3/sip/QtGui/qwindowdefs.sip
-===================================================================
---- PyQt-x11-gpl-4.11.3.orig/sip/QtGui/qwindowdefs.sip
-+++ PyQt-x11-gpl-4.11.3/sip/QtGui/qwindowdefs.sip
-@@ -27,7 +27,7 @@
- 
- typedef QList<QWidget*> QWidgetList;
- %If (- Qt_5_0_0)
--%If (WS_X11)
-+%If (WS_X11 || WS_QWS)
- // X11 specific definitions.
- typedef unsigned long WId;
- %End
diff --git a/package/python-pyqt/0004-sip-QtGuit-hide-qfont-cachestatistics.patch b/package/python-pyqt/0004-sip-QtGuit-hide-qfont-cachestatistics.patch
deleted file mode 100644
index c07bea777f..0000000000
--- a/package/python-pyqt/0004-sip-QtGuit-hide-qfont-cachestatistics.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Hide QFont::cacheStatistics which isn't available in QWS
-
-Signed-off-by: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
----
-
-diff -ur PyQt-x11-gpl-4.9.6/sip/QtGui/qfont.sip pyqt-4.9.6/sip/QtGui/qfont.sip
---- PyQt-x11-gpl-4.9.6/sip/QtGui/qfont.sip	2012-12-08 13:51:38.000000000 +0400
-+++ pyqt-4.9.6/sip/QtGui/qfont.sip	2013-05-22 14:06:38.335000022 +0400
-@@ -185,7 +185,9 @@
- %End
-     static void initialize();
-     static void cleanup();
-+%If (!WS_QWS)
-     static void cacheStatistics();
-+%End
-     QString defaultFamily() const;
-     QString lastResortFamily() const;
-     QString lastResortFont() const;
diff --git a/package/python-pyqt/0005-sip-fix_qws_handle.patch b/package/python-pyqt/0005-sip-fix_qws_handle.patch
deleted file mode 100644
index 80623d112a..0000000000
--- a/package/python-pyqt/0005-sip-fix_qws_handle.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Fix build issue in QWS flavor
-
-Change HANDLE to void* to get rid of :
-buildroot/output/build/python-pyqt-4.11.3/QtCore/sipQtCoreQThread.cpp:318:50:
-error: invalid conversion from 'Qt::HANDLE {aka void*}' to 'long
-unsigned int' [-fpermissive] error during compilation.
-
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
-Signed-off-by: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
----
-Index: PyQt-x11-gpl-4.11.3/sip/QtCore/qnamespace.sip
-===================================================================
---- PyQt-x11-gpl-4.11.3.orig/sip/QtCore/qnamespace.sip
-+++ PyQt-x11-gpl-4.11.3/sip/QtCore/qnamespace.sip
-@@ -1673,6 +1673,9 @@ namespace Qt
- %If (WS_X11)
-     typedef unsigned long HANDLE;
- %End
-+%If (WS_QWS)
-+    typedef void* HANDLE;
-+%End
- %End
- %If (PyQt_Deprecated_5_0)
-     typedef Qt::WindowFlags WFlags;
diff --git a/package/python-pyqt/Config.in b/package/python-pyqt/Config.in
deleted file mode 100644
index 6934a4c4ab..0000000000
--- a/package/python-pyqt/Config.in
+++ /dev/null
@@ -1,21 +0,0 @@
-comment "python-pyqt needs Qt4"
-	depends on !BR2_PACKAGE_QT
-
-config BR2_PACKAGE_PYTHON_PYQT
-	bool "python-pyqt"
-	depends on BR2_PACKAGE_QT
-	select BR2_PACKAGE_PYTHON_SIP
-	help
-	  PyQt4 for Qt Embedded 4 bindings.
-
-	  http://www.riverbankcomputing.com/software/pyqt/
-
-if BR2_PACKAGE_PYTHON_PYQT
-
-config BR2_PACKAGE_PYTHON_PYQT_ARCH_USES_QREAL_FLOAT
-	bool
-	default y if BR2_arm || BR2_armeb
-	default y if BR2_sh4 || BR2_sh4eb || BR2_sh4a || BR2_sh4aeb
-	default y if (BR2_mipsel || BR2_mips) && BR2_PACKAGE_QT_EMBEDDED
-
-endif
diff --git a/package/python-pyqt/python-pyqt.hash b/package/python-pyqt/python-pyqt.hash
deleted file mode 100644
index 1709b66ab8..0000000000
--- a/package/python-pyqt/python-pyqt.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From http://http://sourceforge.net/projects/pyqt/files/PyQt4/PyQt-4.11.3/
-md5 997c3e443165a89a559e0d96b061bf70 PyQt-x11-gpl-4.11.3.tar.gz
-
-# Locally calculated:
-sha256 853780dcdbe2e6ba785d703d059b096e1fc49369d3e8d41a060be874b8745686 PyQt-x11-gpl-4.11.3.tar.gz
diff --git a/package/python-pyqt/python-pyqt.mk b/package/python-pyqt/python-pyqt.mk
deleted file mode 100644
index e8ae641662..0000000000
--- a/package/python-pyqt/python-pyqt.mk
+++ /dev/null
@@ -1,113 +0,0 @@
-################################################################################
-#
-# python-pyqt
-#
-################################################################################
-
-PYTHON_PYQT_VERSION = 4.11.3
-PYTHON_PYQT_SOURCE = PyQt-x11-gpl-$(PYTHON_PYQT_VERSION).tar.gz
-PYTHON_PYQT_SITE = http://downloads.sourceforge.net/project/pyqt/PyQt4/PyQt-$(PYTHON_PYQT_VERSION)
-PYTHON_PYQT_LICENSE = GPL-2.0 or GPL-3.0
-PYTHON_PYQT_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3
-
-PYTHON_PYQT_DEPENDENCIES = python-sip host-python-sip qt
-
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-PYTHON_PYQT_PYTHON_DIR = python$(PYTHON_VERSION_MAJOR)
-PYTHON_PYQT_RM_PORT_BASE = port_v3
-else ifeq ($(BR2_PACKAGE_PYTHON3),y)
-PYTHON_PYQT_PYTHON_DIR = python$(PYTHON3_VERSION_MAJOR)
-PYTHON_PYQT_RM_PORT_BASE = port_v2
-endif
-
-ifeq ($(BR2_PACKAGE_QT_EMBEDDED),y)
-PYTHON_PYQT_QTFLAVOR = WS_QWS
-else
-PYTHON_PYQT_QTFLAVOR = WS_X11
-endif
-
-PYTHON_PYQT_QTDETAIL_LICENSE = Open Source
-
-ifeq ($(BR2_PACKAGE_QT_SHARED),y)
-PYTHON_PYQT_QTDETAIL_TYPE = shared
-endif
-
-# Turn off features that aren't available in QWS and current qt
-# configuration.
-PYTHON_PYQT_QTDETAIL_DISABLE_FEATURES = \
-	PyQt_Accessibility PyQt_SessionManager \
-	PyQt_Shortcut PyQt_RawFont
-
-ifeq ($(BR2_PACKAGE_QT_OPENSSL),)
-PYTHON_PYQT_QTDETAIL_DISABLE_FEATURES += PyQt_OpenSSL
-endif
-
-# Yes, this looks a bit weird: when OpenGL ES is available, we have to
-# disable the feature that consists in not having OpenGL ES support.
-ifeq ($(BR2_PACKAGE_QT_OPENGL_ES),y)
-PYTHON_PYQT_QTDETAIL_DISABLE_FEATURES += PyQt_NoOpenGLES
-endif
-
-# PyQt_qreal_double must be disabled on a number of architectures that
-# use float for qreal.
-ifeq ($(BR2_PACKAGE_PYTHON_PYQT_ARCH_USES_QREAL_FLOAT),y)
-PYTHON_PYQT_QTDETAIL_DISABLE_FEATURES += PyQt_qreal_double
-endif
-
-define PYTHON_PYQT_QTDETAIL
-	echo $(1) >> $(2)/qtdetail.out
-endef
-
-# Since we can't run generate qtdetail.out by running qtdetail on target device
-# we must generate the configuration.
-define PYTHON_PYQT_GENERATE_QTDETAIL
-	$(RM) -f $(1)/qtdetail.out
-	$(call PYTHON_PYQT_QTDETAIL,$(PYTHON_PYQT_QTDETAIL_LICENSE),$(1))
-	$(call PYTHON_PYQT_QTDETAIL,$(PYTHON_PYQT_QTDETAIL_TYPE),$(1))
-	$(foreach f,$(PYTHON_PYQT_QTDETAIL_DISABLE_FEATURES),
-		$(call PYTHON_PYQT_QTDETAIL,$(f),$(1)) \
-	)
-endef
-
-PYTHON_PYQT_CONF_OPTS = \
-	--bindir $(TARGET_DIR)/usr/bin \
-	--destdir $(TARGET_DIR)/usr/lib/$(PYTHON_PYQT_PYTHON_DIR)/site-packages \
-	--qmake $(HOST_DIR)/bin/qmake \
-	--sysroot $(STAGING_DIR)/usr \
-	-w --confirm-license \
-	--no-designer-plugin \
-	--no-docstrings \
-	--no-sip-files \
-	--qt-flavor=$(PYTHON_PYQT_QTFLAVOR)
-
-# The VendorID related information is only needed for Python 2.x, not
-# Python 3.x.
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-PYTHON_PYQT_CONF_OPTS += \
-	--vendorid-incdir $(STAGING_DIR)/usr/include/$(PYTHON_PYQT_PYTHON_DIR) \
-	--vendorid-libdir $(STAGING_DIR)/usr/lib/$(PYTHON_PYQT_PYTHON_DIR)/config
-endif
-
-define PYTHON_PYQT_CONFIGURE_CMDS
-	$(call PYTHON_PYQT_GENERATE_QTDETAIL,$(@D))
-	(cd $(@D); \
-		$(TARGET_MAKE_ENV) \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(HOST_DIR)/bin/python configure-ng.py \
-			$(PYTHON_PYQT_CONF_OPTS) \
-	)
-endef
-
-define PYTHON_PYQT_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
-endef
-
-# __init__.py is needed to import PyQt4
-# __init__.pyc is needed if BR2_PACKAGE_PYTHON_PYC_ONLY is set
-define PYTHON_PYQT_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) install
-	touch $(TARGET_DIR)/usr/lib/$(PYTHON_PYQT_PYTHON_DIR)/site-packages/PyQt4/__init__.py
-	$(RM) -rf $(TARGET_DIR)/usr/lib/$(PYTHON_PYQT_PYTHON_DIR)/site-packages/PyQt4/uic/$(PYTHON_PYQT_RM_PORT_BASE)
-endef
-
-$(eval $(generic-package))
