From: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
Date: Sat, 19 Oct 2013 17:46:56 +0400
Subject: [Buildroot] [PATCH] python-pyqt: new package
Message-ID: <1382190416-9928-1-git-send-email-sergey.kostanbaev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Although new generation configure-ng was developed taking in mind cross-
compilation, it seems it doesn't fully supported yet. We need to override path
to python configuration for target. Moreover we can't run qtdetail to
determine available fatures of current Qt configuration, instean I generate
qtdetail.out file by buildroot qt configuration taking into account specific
QWS features. Only QWS (Qt Embedded) is supported now.
For unknown reason using $(generic-package) instead of $(autotools-package)
breaks compilation.

Signed-off-by: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
---
 Config.in                                                                |    1 
 python-pyqt/Config.in                                                    |    7 
 python-pyqt/python-pyqt-0001-configure-skip-qtdetail.patch               |   16 ++
 python-pyqt/python-pyqt-0002-configure-set-qws.patch                     |   14 +
 python-pyqt/python-pyqt-0003-configure-fixbug.patch                      |   14 +
 python-pyqt/python-pyqt-0004-configure-set-python-pathes.patch           |   19 ++
 python-pyqt/python-pyqt-0005-sip-QtCore-add-qws.patch                    |   41 +++++
 python-pyqt/python-pyqt-0006-sip-QtGuit-add-wid.patch                    |   13 +
 python-pyqt/python-pyqt-0007-sip-QtGuit-hide-qfont-cachestatistics.patch |   16 ++
 python-pyqt/python-pyqt.mk                                               |   74 ++++++++++
 10 files changed, 217 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index e1ecca0..2ce7e9b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -159,6 +159,7 @@ source "package/qtuio/Config.in"
 source "package/qwt/Config.in"
 
 source "package/python-sip/Config.in"
+source "package/python-pyqt/Config.in"
 
 endif
 
diff --git a/package/python-pyqt/Config.in b/package/python-pyqt/Config.in
new file mode 100644
index 0000000..9821f35
--- /dev/null
+++ b/package/python-pyqt/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PYQT
+	bool "python-pyqt"
+	depends on BR2_PACKAGE_PYTHON_SIP
+	help
+	  PyQT4 for Qt Embedded 4 bindings
+
+	  http://www.riverbankcomputing.com/software/pyqt/intro
diff --git a/package/python-pyqt/python-pyqt-0001-configure-skip-qtdetail.patch b/package/python-pyqt/python-pyqt-0001-configure-skip-qtdetail.patch
new file mode 100644
index 0000000..159e76a
--- /dev/null
+++ b/package/python-pyqt/python-pyqt-0001-configure-skip-qtdetail.patch
@@ -0,0 +1,16 @@
+Do not run ./qtdetail as it's cross-compiled and can't be run to generate config
+
+Signed-off-by: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
+--- a/configure-ng.py	2013-08-21 09:50:47.000000000 +0400
++++ b/configure-ng.py	2013-10-18 18:02:18.000000000 +0400
+@@ -517,8 +517,8 @@ int main(int argc, char **argv)
+             error("Failed to determine the detail of your Qt installation. Try again using the --verbose flag to see more detail about the problem.")
+ 
+         # Create the output file, first making sure it doesn't exist.
+-        remove_file(out_file)
+-        run_command(cmd, verbose)
++        # remove_file(out_file)
++        # run_command(cmd, verbose)
+ 
+         if not os.access(out_file, os.F_OK):
+             error("%s failed to create %s. Make sure your Qt installation is correct." % (cmd, out_file))
diff --git a/package/python-pyqt/python-pyqt-0002-configure-set-qws.patch b/package/python-pyqt/python-pyqt-0002-configure-set-qws.patch
new file mode 100644
index 0000000..8f784fc
--- /dev/null
+++ b/package/python-pyqt/python-pyqt-0002-configure-set-qws.patch
@@ -0,0 +1,14 @@
+Change configuration to WS_QWS to work without X11
+
+Signed-off-by: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
+--- a/configure-ng.py	2013-08-21 09:50:47.000000000 +0400
++++ b/configure-ng.py	2013-10-18 18:02:18.000000000 +0400
+@@ -1952,7 +1952,7 @@ def get_sip_flags(target_config):
+     elif target_config.py_platform == 'darwin':
+         plattag = 'WS_MACX'
+     else:
+-        plattag = 'WS_X11'
++        plattag = 'WS_QWS'
+ 
+     sip_flags.append('-t')
+     sip_flags.append(plattag)
diff --git a/package/python-pyqt/python-pyqt-0003-configure-fixbug.patch b/package/python-pyqt/python-pyqt-0003-configure-fixbug.patch
new file mode 100644
index 0000000..c11c5f3
--- /dev/null
+++ b/package/python-pyqt/python-pyqt-0003-configure-fixbug.patch
@@ -0,0 +1,14 @@
+There's a bug in pyqt-4.10.3. Incorrect place of ')' produces incorrect filename
+
+Signed-off-by: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
+--- a/configure-ng.py	2013-08-21 09:50:47.000000000 +0400
++++ b/configure-ng.py	2013-10-18 18:02:18.000000000 +0400
+@@ -2210,7 +2210,7 @@ win32 {
+         else:
+             entry_point = 'init%s' % mname
+ 
+-        exp = open(os.path.join(mname, target_name + '.exp', 'w'))
++        exp = open(os.path.join(mname, target_name + '.exp'), 'w')
+         exp.write('{ global: %s; local: *; };' % entry_point)
+         exp.close()
+ 
diff --git a/package/python-pyqt/python-pyqt-0004-configure-set-python-pathes.patch b/package/python-pyqt/python-pyqt-0004-configure-set-python-pathes.patch
new file mode 100644
index 0000000..eb7d989
--- /dev/null
+++ b/package/python-pyqt/python-pyqt-0004-configure-set-python-pathes.patch
@@ -0,0 +1,19 @@
+We need to set py_inc_dir and py_lib_dir to staged python. Threre's no such
+configuration option, so use vend_inc_dir and vend_lib_dir for this purpose
+as it's not used here
+
+Signed-off-by: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
+--- a/configure-ng.py	2013-10-18 19:36:57.969234500 +0400
++++ b/configure-ng.py	2013-10-18 19:10:58.000000000 +0400
+@@ -682,9 +682,11 @@ int main(int argc, char **argv)
+ 
+         if opts.vendincdir is not None:
+             self.vend_inc_dir = opts.vendincdir
++            self.py_inc_dir = opts.vendincdir
+ 
+         if opts.vendlibdir is not None:
+             self.vend_lib_dir = opts.vendlibdir
++            self.py_lib_dir = opts.vendlibdir
+ 
+         # Handle any conflicts.
+         if self.qt_shared:
diff --git a/package/python-pyqt/python-pyqt-0005-sip-QtCore-add-qws.patch b/package/python-pyqt/python-pyqt-0005-sip-QtCore-add-qws.patch
new file mode 100644
index 0000000..579aaeb
--- /dev/null
+++ b/package/python-pyqt/python-pyqt-0005-sip-QtCore-add-qws.patch
@@ -0,0 +1,41 @@
+Add WS_QWS platform configuration in QtCore. Change HANDLE to void* to get rid
+of error during compilation
+
+Signed-off-by: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
+diff -ur PyQt-x11-gpl-4.9.6/sip/QtCore/qnamespace.sip pyqt-4.9.6/sip/QtCore/qnamespace.sip
+--- PyQt-x11-gpl-4.9.6/sip/QtCore/qnamespace.sip	2012-12-08 13:51:38.000000000 +0400
++++ pyqt-4.9.6/sip/QtCore/qnamespace.sip	2013-04-24 17:50:22.845000018 +0400
+@@ -1670,7 +1670,7 @@
+ %End
+ %End
+ %If (- Qt_5_0_0)
+-%If (WS_X11)
+-    typedef unsigned long HANDLE;
++%If (WS_X11 || WS_QWS)
++    typedef void* HANDLE;
+ %End
+ %End
+diff -ur PyQt-x11-gpl-4.9.6/sip/QtCore/qprocess.sip pyqt-4.9.6/sip/QtCore/qprocess.sip
+--- PyQt-x11-gpl-4.9.6/sip/QtCore/qprocess.sip	2012-12-08 13:51:38.000000000 +0400
++++ pyqt-4.9.6/sip/QtCore/qprocess.sip	2013-04-24 17:47:46.808000017 +0400
+@@ -28,7 +28,7 @@
+ %If (WS_WIN)
+ typedef void *Q_PID;
+ %End
+-%If (WS_X11 || WS_MACX)
++%If (WS_X11 || WS_MACX || WS_QWS)
+ typedef qint64 Q_PID;
+ %End
+ 
+diff -ur PyQt-x11-gpl-4.9.6/sip/QtCore/QtCoremod.sip pyqt-4.9.6/sip/QtCore/QtCoremod.sip
+--- PyQt-x11-gpl-4.9.6/sip/QtCore/QtCoremod.sip	2012-12-08 13:51:39.000000000 +0400
++++ pyqt-4.9.6/sip/QtCore/QtCoremod.sip	2013-04-24 17:48:37.599000018 +0400
+@@ -29,7 +29,7 @@
+ 
+ %Timeline {Qt_4_1_1 Qt_4_1_2 Qt_4_1_3 Qt_4_2_0 Qt_4_2_2 Qt_4_2_3 Qt_4_3_0 Qt_4_3_1 Qt_4_3_2 Qt_4_3_3 Qt_4_3_4 Qt_4_4_0 Qt_4_4_1 Qt_4_4_2 Qt_4_5_0 Qt_4_5_1 Qt_4_5_2 Qt_4_5_3 Qt_4_6_0 Qt_4_6_1 Qt_4_6_2 Qt_4_6_3 Qt_4_7_0 Qt_4_7_1 Qt_4_7_2 Qt_4_7_3 Qt_4_7_4 Qt_4_8_0 Qt_4_8_1 Qt_4_8_2 Qt_4_8_3 Qt_4_8_4 Qt_5_0_0}
+ 
+-%Platforms {WS_X11 WS_WIN WS_MACX}
++%Platforms {WS_X11 WS_WIN WS_MACX WS_QWS}
+ 
+ %Feature PyQt_Accessibility
+ %Feature PyQt_SessionManager
diff --git a/package/python-pyqt/python-pyqt-0006-sip-QtGuit-add-wid.patch b/package/python-pyqt/python-pyqt-0006-sip-QtGuit-add-wid.patch
new file mode 100644
index 0000000..92388c9
--- /dev/null
+++ b/package/python-pyqt/python-pyqt-0006-sip-QtGuit-add-wid.patch
@@ -0,0 +1,13 @@
+Add definition for WId in QWS configuration
+
+Signed-off-by: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
+diff -ur PyQt-x11-gpl-4.9.6/sip/QtGui/qwindowdefs.sip pyqt-4.9.6/sip/QtGui/qwindowdefs.sip
+--- PyQt-x11-gpl-4.9.6/sip/QtGui/qwindowdefs.sip	2012-12-08 13:51:38.000000000 +0400
++++ pyqt-4.9.6/sip/QtGui/qwindowdefs.sip	2013-04-24 14:14:54.251000018 +0400
+@@ -41,3 +41,6 @@
+ // MacOS/X specific definitions.
+ typedef long WId;
+ %End
++%If (WS_QWS)
++typedef unsigned long  WId;
++%End
diff --git a/package/python-pyqt/python-pyqt-0007-sip-QtGuit-hide-qfont-cachestatistics.patch b/package/python-pyqt/python-pyqt-0007-sip-QtGuit-hide-qfont-cachestatistics.patch
new file mode 100644
index 0000000..677f56d
--- /dev/null
+++ b/package/python-pyqt/python-pyqt-0007-sip-QtGuit-hide-qfont-cachestatistics.patch
@@ -0,0 +1,16 @@
+Hide QFont::cacheStatistics which itn't available in QWS
+
+Signed-off-by: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
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
diff --git a/package/python-pyqt/python-pyqt.mk b/package/python-pyqt/python-pyqt.mk
new file mode 100644
index 0000000..a22222b
--- /dev/null
+++ b/package/python-pyqt/python-pyqt.mk
@@ -0,0 +1,72 @@
+################################################################################
+#
+# python-pyqt
+#
+################################################################################
+PYTHON_PYQT_VERSION = 4.10.3
+PYTHON_PYQT_SOURCE = PyQt-x11-gpl-$(PYTHON_PYQT_VERSION).tar.gz
+PYTHON_PYQT_SITE = http://downloads.sourceforge.net/project/pyqt/PyQt4/PyQt-$(PYTHON_PYQT_VERSION)
+PYTHON_PYQT_DEPENDENCIES = python-sip qt
+
+define PYTHON_PYQT_QTDETAIL
+    echo $(1) >> $(2)/qtdetail.out
+endef
+
+ifeq ($(BR2_PACKAGE_QT_LICENSE_APPROVED),y)
+    PYTHON_PYQT_QTDETAIL_LIC = "Open Source"
+else
+    PYTHON_PYQT_QTDETAIL_LIC = ""
+endif
+
+ifeq ($(BR2_PACKAGE_QT_SHARED),y)
+    PYTHON_PYQT_QTDETAIL_TYPE = "shared"
+else
+    PYTHON_PYQT_QTDETAIL_TYPE = ""
+endif
+
+# Turn off features that isn't availabe in QWS and current qt configuration.
+PYTHON_PYQT_QTDETAIL_DISABLE_FEATURES = PyQt_Accessibility PyQt_SessionManager \
+    PyQt_qreal_double PyQt_Shortcut PyQt_RawFont WS_MACX WS_WIN
+
+ifneq ($(BR2_PACKAGE_QT_OPENSSL),y)
+    PYTHON_PYQT_QTDETAIL_DISABLE_FEATURES += PyQt_OpenSSL
+endif
+
+# Since we can't run generate qtdetail.out by running qtdetail on target device
+# we must generate the configuration.
+define PYTHON_PYQT_GENERATE_QTDETAIL
+    rm -f $(1)/qtdetail.out
+
+    $(call PYTHON_PYQT_QTDETAIL, $(PYTHON_PYQT_QTDETAIL_LIC), $(1))
+    $(call PYTHON_PYQT_QTDETAIL, $(PYTHON_PYQT_QTDETAIL_TYPE), $(1))
+
+    for i in $(PYTHON_PYQT_QTDETAIL_DISABLE_FEATURES); do \
+        $(call PYTHON_PYQT_QTDETAIL, $$i, $(1)); \
+    done
+endef
+
+define PYTHON_PYQT_CONFIGURE_CMDS
+    $(call PYTHON_PYQT_GENERATE_QTDETAIL, $(@D))
+
+    ( cd $(@D); \
+	$(TARGET_CONFIGURE_OPTS) \
+	$(HOST_DIR)/usr/bin/python configure-ng.py \
+		--bindir $(TARGET_DIR)/usr/bin \
+		--destdir $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+		--vendorid-incdir $(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)  \
+		--vendorid-libdir $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/config \
+		--qmake $(HOST_DIR)/usr/bin/qmake \
+		--spec $(BUILD_DIR)/qt-$(QT_VERSION)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++ \
+		-w --confirm-license \
+		--no-designer-plugin \
+		--no-docstrings \
+		--no-sip-files \
+    )
+endef
+
+define PYTHON_PYQT_INSTALL_TARGET_CMDS
+    $(TARGET_CONFIGURE_OPTS)  $(MAKE) install -C $(@D)
+    touch $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/PyQt4/__init__.py
+endef
+
+$(eval $(autotools-package))
