From: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
Date: Thu, 17 Oct 2013 15:27:08 +0400
Subject: [Buildroot] [PATCH] Add packages sip and PyQt
Message-ID: <1382009228-25988-1-git-send-email-sergey.kostanbaev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for sip-4.15.3 and pyqt-4.9.6 to work with qt-4.8.x. Tested on arm platform.

Signed-off-by: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
---
 Config.in                         |    5 
 pyqt/Config.in                    |    6 
 pyqt/pyqt-4.9.6-configure.patch   |  924 ++++++++++++++++++++++++++++++++++++
 pyqt/pyqt-4.9.6-full.patch        |  949 ++++++++++++++++++++++++++++++++++++++
 pyqt/pyqt.mk                      |   63 ++
 sip/Config.in                     |    5 
 sip/sip-4.15.3-configure.py.patch |   38 +
 sip/sip.mk                        |   71 ++
 8 files changed, 2061 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index a94cb62..9c9ee19 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -157,6 +157,11 @@ source "package/qextserialport/Config.in"
 source "package/qjson/Config.in"
 source "package/qtuio/Config.in"
 source "package/qwt/Config.in"
+
+comment "PyQT libraries"
+source "package/sip/Config.in"
+source "package/pyqt/Config.in"
+
 endif
 
 source "package/qt5/Config.in"
diff --git a/package/sip/Config.in b/package/sip/Config.in
new file mode 100644
index 0000000..bbdb943
--- /dev/null
+++ b/package/sip/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_SIP
+	bool "sip"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	    SIP for PyQt4
\ No newline at end of file
diff --git a/package/sip/sip-4.15.3-configure.py.patch b/package/sip/sip-4.15.3-configure.py.patch
new file mode 100644
index 0000000..06591c0
--- /dev/null
+++ b/package/sip/sip-4.15.3-configure.py.patch
@@ -0,0 +1,38 @@
+--- a/configure.py	2013-04-24 12:41:35.382000017 +0400
++++ b/configure.py	2013-04-24 13:09:30.000000000 +0400
+@@ -273,9 +273,9 @@
+         "default_mod_dir":  plat_py_site_dir,
+         "default_sip_dir":  opts.sipsipdir,
+         "py_version":       py_version,
+-        "py_inc_dir":       plat_py_inc_dir,
+-        "py_conf_inc_dir":  plat_py_conf_inc_dir,
+-        "py_lib_dir":       plat_py_lib_dir,
++        "py_inc_dir":       opts.py_inc_dir,
++        "py_conf_inc_dir":  opts.py_conf_inc_dir,
++        "py_lib_dir":       opts.py_lib_dir,
+         "universal":        opts.universal,
+         "arch":             opts.arch,
+         "deployment_target":    opts.deployment_target
+@@ -399,6 +399,22 @@
+             "macros")
+     p.add_option_group(g)
+ 
++    # Python configuration
++    g = optparse.OptionGroup(p, title="Python include path")
++    g.add_option("-i", "--py_inc_dir", action="callback",
++	    default=plat_py_inc_dir, type="string", metavar="DIR",
++	    dest="py_inc_dir", callback=store_abspath, help="where the Python "
++	    "include directory located [default: %s]" % plat_py_inc_dir)
++    g.add_option("-c", "--py_conf_inc_dir", action="callback",
++	    default=plat_py_conf_inc_dir, type="string", metavar="DIR",
++	    dest="py_conf_inc_dir", callback=store_abspath, help="where the Python "
++	    "Configuration include directory located [default: %s]" % plat_py_conf_inc_dir)
++    g.add_option("-l", "--py_lib_dir", action="callback",
++	    default=plat_py_conf_inc_dir, type="string", metavar="DIR",
++	    dest="py_lib_dir", callback=store_abspath, help="where the Python "
++	    "library located [default: %s]" % plat_py_lib_dir)
++
++
+     # Installation.
+     g = optparse.OptionGroup(p, title="Installation")
+     g.add_option("-b", "--bindir", action="callback",
diff --git a/package/sip/sip.mk b/package/sip/sip.mk
new file mode 100644
index 0000000..2a4254c
--- /dev/null
+++ b/package/sip/sip.mk
@@ -0,0 +1,71 @@
+#############################################################
+#
+# sip
+#
+#############################################################
+SIP_VERSION = 4.15.3
+SIP_SOURCE = sip-$(SIP_VERSION).tar.gz
+SIP_SITE = http://sourceforge.net/projects/pyqt/files/sip/sip-$(SIP_VERSION)
+
+################################################
+# HOST
+
+HOST_SIP_DEPENDENCIES = host-python
+define HOST_SIP_CONFIGURE_CMDS
+    (cd $(@D); \
+	echo "Host Configuring DIR=$(PWD)"; \
+	LD_LIBRARY_PATH=$(HOST_DIR)/lib $(HOST_DIR)/usr/bin/python configure.py; \
+    )
+endef
+
+################################################
+# TARGET
+
+SIP_DEPENDENCIES = host-sip python
+
+ifeq ($(BR2_arm)$(BR2_armeb),y)
+SIP_PLATFORM = arm
+else
+SIP_PLATFORM =
+endif
+
+define SIP_SET
+  $(SED) '/$(1)[[:space:]]/c\$(1) = $(2)' $(3)/specs/linux-$(SIP_PLATFORM)-g++
+endef
+
+define SIP_CONFIGURE_CMDS
+# Fix compiler path
+    $(call SIP_SET,QMAKE_CC,$(TARGET_CC),$(@D))
+    $(call SIP_SET,QMAKE_CXX,$(TARGET_CXX),$(@D))
+    $(call SIP_SET,QMAKE_LINK,$(TARGET_CXX),$(@D))
+    $(call SIP_SET,QMAKE_LINK_SHLIB,$(TARGET_CXX),$(@D))
+    $(call SIP_SET,QMAKE_AR,$(TARGET_AR) cqs,$(@D))
+    $(call SIP_SET,QMAKE_OBJCOPY,$(TARGET_OBJCOPY),$(@D))
+    $(call SIP_SET,QMAKE_RANLIB,$(TARGET_RANLIB),$(@D))
+    $(call SIP_SET,QMAKE_STRIP,$(TARGET_STRIP),$(@D))
+    $(call SIP_SET,QMAKE_CFLAGS,$(QT_CFLAGS),$(@D))
+    $(call SIP_SET,QMAKE_CXXFLAGS,$(QT_CXXFLAGS),$(@D))
+    $(call SIP_SET,QMAKE_LFLAGS,$(TARGET_LDFLAGS),$(@D))
+
+    ( cd $(@D); \
+	echo "Target Configuring DIR=`pwd`"; \
+	cp specs/linux-$(SIP_PLATFORM)-g++ specs;  \
+	LD_LIBRARY_PATH=$(HOST_DIR)/lib $(HOST_DIR)/usr/bin/python configure.py \
+		-b $(TARGET_DIR)/usr/bin \
+		-d $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+		-e $(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)  \
+		-v $(TARGET_DIR)/usr/share/sip \
+		-i $(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR) \
+		-c $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/config \
+		-p linux-$(SIP_PLATFORM)-g++; \
+    )
+endef
+
+define SIP_INSTALL_TARGET_CMDS
+# TODO copy only needed files  DESTDIR=
+    PATH="$(PATH):$(HOST_DIR)/usr/bin"  $(SIP_MAKE) install -C $(@D)
+endef
+
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
diff --git a/package/pyqt/Config.in b/package/pyqt/Config.in
new file mode 100644
index 0000000..4e4ff07
--- /dev/null
+++ b/package/pyqt/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYQT
+	bool "pyqt"
+	depends on BR2_PACKAGE_QT
+	depends on BR2_PACKAGE_SIP
+	help
+	    PyQT4 for Qt Embedded 4
\ No newline at end of file
diff --git a/package/pyqt/pyqt-4.9.6-configure.patch b/package/pyqt/pyqt-4.9.6-configure.patch
new file mode 100644
index 0000000..44db19b
--- /dev/null
+++ b/package/pyqt/pyqt-4.9.6-configure.patch
@@ -0,0 +1,924 @@
+--- PyQt-x11-gpl-4.9.6/configure.py.orig	2012-12-08 13:51:13.000000000 +0400
++++ pyqt-4.9.6/configure.py	2013-10-16 17:13:11.066815274 +0400
+@@ -1,6 +1,7 @@
+ # This script generates the PyQt configuration and generates the Makefiles.
+ #
+ # Copyright (c) 2012 Riverbank Computing Limited <info@riverbankcomputing.com>
++# Copyright (c) 2012 David Boddie <david@boddie.org.uk>
+ # 
+ # This file is part of PyQt.
+ # 
+@@ -28,8 +29,12 @@ import os
+ import glob
+ import optparse
+ import shutil
++import imp
++
+ 
+ import sipconfig
++cross_sipconfig = sipconfig
++
+ 
+ 
+ # Initialise the globals.
+@@ -280,13 +282,14 @@ class pyrccMakefile(sipconfig.ProgramMak
+     that pyrcc is automatically run against the examples.
+     """
+ 
+-    def __init__(self):
+-        sipconfig.ProgramMakefile.__init__(self, configuration=sipcfg,
++    def __init__(self, cfg = sipcfg):
++        self.cfg = cfg
++        sipconfig.ProgramMakefile.__init__(self, configuration=cfg,
+                 build_file=os.path.join(src_dir, "pyrcc", "pyrcc.sbf"),
+                 dir="pyrcc", install_dir=opts.pyqtbindir, console=1,
+                 qt=["QtCore", "QtXml"], debug=opts.debug, warnings=1,
+-                universal=sipcfg.universal, arch=sipcfg.arch,
+-                deployment_target=sipcfg.deployment_target)
++                universal=cfg.universal, arch=cfg.arch,
++                deployment_target=cfg.deployment_target)
+ 
+     def generate_target_default(self, mfile):
+         """Generate the default target."""
+@@ -303,12 +306,12 @@ class pyrccMakefile(sipconfig.ProgramMak
+             exe = "./" + exe
+ 
+         # Find all the .qrc files in the examples.
+-        for root, _, files in os.walk("examples"):
+-            rel_root = os.path.join("..", root)
+-
+-            for fn in files:
+-                if fn.endswith(".qrc"):
+-                    mfile.write("\t%s %s -o %s %s\n" % (exe, flag, os.path.join(rel_root, fn[:-4] + "_rc.py"), os.path.join(rel_root, fn)))
++        #for root, _, files in os.walk("examples"):
++        #    rel_root = os.path.join("..", root)
++        #
++        #    for fn in files:
++        #        if fn.endswith(".qrc"):
++        #            mfile.write("\t%s %s-o %s %s\n" % (exe, flag, os.path.join(rel_root, fn[:-4] + "_rc.py"), os.path.join(rel_root, fn)))
+ 
+ 
+ class ConfigurePyQt4:
+@@ -366,10 +367,10 @@ class ConfigurePyQt4:
+         pyqt_modules.append("QtCore")
+ 
+         check_module("QtGui", "qwidget.h", "new QWidget()")
+-        check_module("QtHelp", "qhelpengine.h", "new QHelpEngine(\"foo\")")
++        if qt_version < 0x050000: check_module("QtHelp", "qhelpengine.h", "new QHelpEngine(\"foo\")")
+         if qt_version < 0x050000: check_module("QtMultimedia", "QAudioDeviceInfo",
+                 "new QAudioDeviceInfo()")
+-        check_module("QtNetwork", "qhostaddress.h", "new QHostAddress()")
++        if qt_version < 0x050000: check_module("QtNetwork", "qhostaddress.h", "new QHostAddress()")
+         if qt_version < 0x050000: check_module("QtDBus", "qdbusconnection.h",
+                 "QDBusConnection::systemBus()")
+         if qt_version < 0x050000: check_module("QtDeclarative", "qdeclarativeview.h",
+@@ -378,39 +379,36 @@ class ConfigurePyQt4:
+         if qt_version < 0x050000: check_module("QtScript", "qscriptengine.h", "new QScriptEngine()")
+         if qt_version < 0x050000: check_module("QtScriptTools", "qscriptenginedebugger.h",
+                 "new QScriptEngineDebugger()")
+-        check_module("QtSql", "qsqldatabase.h", "new QSqlDatabase()",
++        if qt_version < 0x050000: check_module("QtSql", "qsqldatabase.h", "new QSqlDatabase()",
+                 extra_libs=sql_libs)
+-        check_module("QtSvg", "qsvgwidget.h", "new QSvgWidget()")
++        if qt_version < 0x050000: check_module("QtSvg", "qsvgwidget.h", "new QSvgWidget()")
+         if qt_version < 0x050000: check_module("QtTest", "QtTest", "QTest::qSleep(0)")
+-        check_module("QtWebKit", "qwebpage.h", "new QWebPage()")
+-        check_module("QtXml", "qdom.h", "new QDomDocument()")
+-
+-        # Qt v5-beta1 causes compiler error messages.  Wait to see if it fixed
+-        # in a later release.
+-        if qt_version < 0x050000:
+-            check_module("QtXmlPatterns", "qxmlname.h", "new QXmlName()")
+-
++        if qt_version < 0x050000: check_module("QtWebKit", "qwebpage.h", "new QWebPage()")
++        if qt_version < 0x050000: check_module("QtXml", "qdom.h", "new QDomDocument()")
++        if qt_version < 0x050000: check_module("QtXmlPatterns", "qxmlname.h", "new QXmlName()")
+         if qt_version < 0x050000: check_module("phonon", "phonon/videowidget.h",
+                 "new Phonon::VideoWidget()")
+-        check_module("QtAssistant", "qassistantclient.h",
++        if qt_version < 0x050000: check_module("QtAssistant", "qassistantclient.h",
+                 "new QAssistantClient(\"foo\")", extra_lib_dirs=ass_lib_dirs,
+                 extra_libs=ass_libs)
+ 
+-        if not qt_shared:
+-            sipconfig.inform("QtDesigner module disabled with static Qt libraries.")
+-        elif sipcfg.universal:
+-            sipconfig.inform("QtDesigner module disabled with universal binaries.")
+-        else:
+-            if qt_version < 0x050000: check_module("QtDesigner", "QExtensionFactory",
+-                    "new QExtensionFactory()")
++        #if not qt_shared:
++        #    sipconfig.inform("QtDesigner module disabled with static Qt libraries.")
++        #elif sipcfg.universal:
++        #    sipconfig.inform("QtDesigner module disabled with universal binaries.")
++        #else:
++        #    if qt_version < 0x050000: check_module("QtDesigner", "QExtensionFactory",
++        #            "new QExtensionFactory()")
+ 
+-        if qt_version < 0x050000: check_module("QAxContainer", "qaxobject.h", "new QAxObject()",
+-                extra_libs=["QAxContainer"])
++        #if qt_version < 0x050000: check_module("QAxContainer", "qaxobject.h", "new QAxObject()",
++        #        extra_libs=["QAxContainer"])
+ 
+-        if os.path.isdir(os.path.join(src_dir, "dbus")):
+-            check_dbus()
++        #if os.path.isdir(os.path.join(src_dir, "dbus")):
++        #    check_dbus()
+ 
+     def code(self):
++        # Note that the order of the dependent modules is important.
++
+         cons_xtra_incdirs = []
+         cons_xtra_libdirs = []
+         cons_xtra_libs = []
+@@ -794,6 +792,7 @@ class ConfigurePyQt4:
+         qmake_args = fix_qmake_args()
+         cwd = os.getcwd()
+ 
++        cfg = cross_sipcfg or sipcfg
+         for qpy, pro in qpylibs.items():
+             sipconfig.inform("Creating QPy support library for %s Makefile..." % qpy)
+ 
+@@ -805,22 +804,19 @@ class ConfigurePyQt4:
+ 
+             f = open(wrapped_pro, 'w+')
+ 
+-            if sipcfg.arch:
+-                f.write(arch_config())
++            if cfg.arch:
++                f.write(arch_config(cfg))
+ 
+-            if sipcfg.universal:
+-                f.write("QMAKE_MAC_SDK = %s\n" % sipcfg.universal)
++            if cfg.universal:
++                f.write("QMAKE_MAC_SDK = %s\n" % cfg.universal)
+ 
+-            if sipcfg.deployment_target:
+-                f.write("QMAKE_MACOSX_DEPLOYMENT_TARGET = %s\n" % sipcfg.deployment_target)
++            if cfg.deployment_target:
++                f.write("QMAKE_MACOSX_DEPLOYMENT_TARGET = %s\n" % cfg.deployment_target)
+ 
+-            inc_path = [sipcfg.py_inc_dir]
++            inc_path = [cfg.py_inc_dir]
+             if qpy in ("QtCore", "QtDBus", "QtDeclarative", "QtOpenGL"):
+-                if sipcfg.sip_inc_dir != sipcfg.py_inc_dir:
+-                    inc_path.insert(0, sipcfg.sip_inc_dir)
+-
+-                if sipcfg.py_conf_inc_dir != sipcfg.py_inc_dir:
+-                    inc_path.insert(0, sipcfg.py_conf_inc_dir)
++                if cfg.sip_inc_dir != cfg.py_inc_dir:
++                    inc_path.insert(0, cfg.sip_inc_dir)
+ 
+                 if opts.bigqt:
+                     api_dir = "../../_qt"
+@@ -858,7 +854,7 @@ include(%s)
+         sipconfig.inform("Creating QPy support libraries Makefile...")
+ 
+         sipconfig.ParentMakefile(
+-            configuration=sipcfg,
++            configuration=cfg,
+             dir="qpy",
+             subdirs=list(qpylibs.keys())
+         ).generate()
+@@ -868,6 +864,7 @@ include(%s)
+     def tools(self):
+         tool = []
+ 
++        cfg = cross_sipcfg or sipcfg
+         if pydbusmoddir:
+             sipconfig.inform("Creating dbus support module Makefile...")
+ 
+@@ -878,9 +875,9 @@ include(%s)
+                 install_dir=pydbusmoddir,
+                 qt=["QtCore"],
+                 debug=opts.debug,
+-                universal=sipcfg.universal,
+-                arch=sipcfg.arch,
+-                deployment_target=sipcfg.deployment_target
++                universal=cfg.universal,
++                arch=cfg.arch,
++                deployment_target=cfg.deployment_target
+             )
+ 
+             add_makefile_extras(makefile, dbusincdirs, dbuslibdirs, dbuslibs)
+@@ -889,29 +886,29 @@ include(%s)
+             tool.append("dbus")
+ 
+         # Only include ElementTree for older versions of Python.
+-        if sipcfg.py_version < 0x020500:
+-            sipconfig.inform("Creating elementtree Makefile...")
++        #if sipcfg.py_version < 0x020500:
++        #    sipconfig.inform("Creating elementtree Makefile...")
+ 
+-            makefile = sipconfig.PythonModuleMakefile(
+-                configuration=sipcfg,
+-                dstdir=os.path.join(pyqt_modroot, "elementtree"),
+-                dir="elementtree"
+-            )
++        #    makefile = sipconfig.PythonModuleMakefile(
++        #        configuration=sipcfg,
++        #        dstdir=os.path.join(pyqt_modroot, "elementtree"),
++        #        dir="elementtree"
++        #    )
+ 
+-            makefile.generate()
+-            tool.append("elementtree")
++        #    makefile.generate()
++        #    tool.append("elementtree")
+ 
+         # Create the pyuic4 wrapper.  Use the GUI version on MacOS (so that
+         # previews work properly and normal console use will work anyway), but
+         # not on Windows (so that normal console use will work).
+-        sipconfig.inform("Creating pyuic4 wrapper...")
++        #sipconfig.inform("Creating pyuic4 wrapper...")
+ 
+-        if sys.platform == 'darwin':
+-            gui = True
+-            use_arch = opts.use_arch
+-        else:
+-            gui = False
+-            use_arch = ''
++        #if sys.platform == 'darwin':
++        #    gui = True
++        #    use_arch = opts.use_arch
++        #else:
++        #    gui = False
++        #    use_arch = ''
+ 
+         # The pyuic directory may not exist if we are building away from the
+         # source directory.
+@@ -921,12 +918,12 @@ include(%s)
+             pass
+ 
+         uicdir=os.path.join(pyqt_modroot, "uic")
+-        wrapper = sipconfig.create_wrapper(os.path.join(uicdir, "pyuic.py"), os.path.join("pyuic", "pyuic4"), gui, use_arch)
++        wrapper = cross_sipconfig.create_wrapper(os.path.join(uicdir, "pyuic.py"), os.path.join("pyuic", "pyuic4"), (sys.platform == "darwin"))
+ 
+         sipconfig.inform("Creating pyuic4 Makefile...")
+ 
+-        makefile = sipconfig.PythonModuleMakefile(
+-            configuration=sipcfg,
++        makefile = cross_sipconfig.PythonModuleMakefile(
++            configuration=cfg,
+             dstdir=uicdir,
+             srcdir=os.path.join(src_dir, "pyuic", "uic"),
+             dir="pyuic",
+@@ -936,55 +933,48 @@ include(%s)
+         makefile.generate()
+         tool.append("pyuic")
+ 
+-        if "QtXml" in pyqt_modules:
+-            sipconfig.inform("Creating pylupdate4 Makefile...")
++        if "QtXml" in pyqt_modules and \
++            "PyQt_Translation" not in qt_xfeatures and \
++            "PyQt_MessageBox" not in qt_xfeatures:
+ 
+-            cxxflags_app = sipcfg.build_macros().get("CXXFLAGS_APP", "")
++            sipconfig.inform("Creating pylupdate4 Makefile...")
+ 
+-            makefile = sipconfig.ProgramMakefile(
+-                configuration=sipcfg,
++            ### Note that the dependency on QtNetwork is only there on Embedded Linux.
++            makefile = cross_sipconfig.ProgramMakefile(
++                configuration=cfg,
+                 build_file=os.path.join(src_dir, "pylupdate", "pylupdate.sbf"),
+                 dir="pylupdate",
+                 install_dir=opts.pyqtbindir,
+                 console=1,
+-                qt=["QtCore", "QtXml"],
++                qt=["QtCore", "QtNetwork", "QtGui", "QtXml"],
+                 debug=opts.debug,
+                 warnings=1,
+-                universal=sipcfg.universal,
+-                arch=sipcfg.arch,
+-                deployment_target=sipcfg.deployment_target
++                universal=cfg.universal,
++                arch=cfg.arch,
++                deployment_target=cfg.deployment_target
+             )
+ 
+-            makefile.extra_include_dirs.append(
+-                    os.path.join(src_dir, "pylupdate"))
+-
+-            if cxxflags_app != "":
+-                makefile.extra_cxxflags.append(cxxflags_app)
+-
++            makefile.extra_include_dirs.append(os.path.join(src_dir, "pylupdate"))
+             makefile.generate()
+             tool.append("pylupdate")
+ 
+             sipconfig.inform("Creating pyrcc4 Makefile...")
+ 
+-            makefile = pyrccMakefile()
+-
+-            if cxxflags_app != "":
+-                makefile.extra_cxxflags.append(cxxflags_app)
+-
++            makefile = pyrccMakefile(cfg)
+             makefile.generate()
+             tool.append("pyrcc")
+         else:
+             sipconfig.inform("pylupdate4 and pyrcc4 will not be built because the Qt XML module is missing.")
+ 
+         if opts.designer_plugin and "QtDesigner" in pyqt_modules:
+-            py_major = sipcfg.py_version >> 16
+-            py_minor = (sipcfg.py_version >> 8) & 0x0ff
++            py_major = cfg.py_version >> 16
++            py_minor = (cfg.py_version >> 8) & 0x0ff
+ 
+             abi = getattr(sys, 'abiflags', '')
+ 
+             if sys.platform == 'win32':
+                 # Use abiflags in case it is supported in a future version.
+-                lib_dir_flag = quote("-L%s" % sipcfg.py_lib_dir)
++                lib_dir_flag = quote("-L%s" % cfg.py_lib_dir)
+                 link = "%s -lpython%d%d%s" % (lib_dir_flag, py_major, py_minor, abi)
+                 pysh_lib = "python%d%d%s.dll" % (py_major, py_minor, abi)
+             else:
+@@ -1035,8 +1025,8 @@ include(%s)
+                 prj = fin.read()
+                 fin.close()
+ 
+-                prj = prj.replace("@PYINCDIR@", quote(sipcfg.py_inc_dir))
+-                prj = prj.replace("@PYINCDIR@", " ".join((quote(sipcfg.py_conf_inc_dir), quote(sipcfg.py_inc_dir))))
++                prj = prj.replace("@PYINCDIR@", quote(cfg.py_inc_dir))
++                prj = prj.replace("@PYINCDIR@", " ".join((quote(cfg.py_conf_inc_dir), quote(cfg.py_inc_dir))))
+                 prj = prj.replace("@PYLINK@", link)
+                 prj = prj.replace("@PYSHLIB@", pysh_lib)
+                 prj = prj.replace("@QTPLUGINDIR@", quote(opts.plugindir + "/designer"))
+@@ -1044,13 +1034,13 @@ include(%s)
+                 fout = open("python.pro", "w+")
+ 
+                 if sipcfg.arch:
+-                    fout.write(arch_config())
++                    fout.write(arch_config(cfg))
+ 
+                 if sipcfg.universal:
+-                    fout.write("QMAKE_MAC_SDK = %s\n" % sipcfg.universal)
++                    fout.write("QMAKE_MAC_SDK = %s\n" % cfg.universal)
+ 
+                 if sipcfg.deployment_target:
+-                    fout.write("QMAKE_MACOSX_DEPLOYMENT_TARGET = %s\n" % sipcfg.deployment_target)
++                    fout.write("QMAKE_MACOSX_DEPLOYMENT_TARGET = %s\n" % cfg.deployment_target)
+ 
+                 if src_dir != os.path.curdir:
+                     fout.write("VPATH = %s\n" % os.path.join(src_dir, "designer"))
+@@ -1066,7 +1056,7 @@ include(%s)
+         return tool
+ 
+ 
+-def arch_config():
++def arch_config(cfg):
+     """Return the qmake CONFIG line for a MacOS binary."""
+ 
+     qmake_archs = []
+@@ -1110,7 +1100,8 @@ def inform_user():
+     if sys.platform == "darwin" and qt_framework:
+         sipconfig.inform("Qt is built as a framework.")
+ 
+-    sipconfig.inform("SIP %s is being used." % sipcfg.sip_version_str)
++    cfg = cross_sipcfg or sipcfg
++    sipconfig.inform("SIP %s is being used." % cfg.sip_version_str)
+     sipconfig.inform("The Qt header files are in %s." % qt_incdir)
+     sipconfig.inform("The %s Qt libraries are in %s." % (lib_type, qt_libdir))
+     sipconfig.inform("The Qt binaries are in %s." % qt_bindir)
+@@ -1118,11 +1109,6 @@ def inform_user():
+     sipconfig.inform("These PyQt modules will be built: %s." % ", ".join(pyqt_modules))
+     sipconfig.inform("The PyQt Python package will be installed in %s." % opts.pyqtmoddir)
+ 
+-    if opts.with_deprecated:
+-        sipconfig.inform("PyQt is being built with deprecated Qt v4 features")
+-    else:
+-        sipconfig.inform("PyQt is being built without deprecated Qt v4 features")
+-
+     if opts.no_docstrings:
+         sipconfig.inform("PyQt is being built without generated docstrings.")
+     else:
+@@ -1178,7 +1164,7 @@ def create_config(module, template, macr
+         "qt_lib_dir":         qt_libdir
+     }
+ 
+-    sipconfig.create_config_module(module, template, content, macros)
++    cross_sipconfig.create_config_module(module, template, content, macros)
+ 
+ 
+ def run_command(cmd, envvars=None):
+@@ -1288,7 +1274,7 @@ int main(int, char **)
+     run_command(cmd)
+ 
+ 
+-def compile_qt_program(name, mname, extra_include_dirs=None, extra_lib_dirs=None, extra_libs=None):
++def compile_qt_program(name, mname, extra_include_dirs=None, extra_lib_dirs=None, extra_libs=None, library=False):
+     """Compile a simple Qt application.
+ 
+     name is the name of the single source file.
+@@ -1303,19 +1289,23 @@ def compile_qt_program(name, mname, extr
+     opengl = (mname == "QtOpenGL")
+ 
+     qt = [mname]
+-    if mname in ("QtAssistant", "QtHelp", "QtOpenGL", "QtWebKit"):
++    if mname in ("QtOpenGL", "QtWebKit"):
+         qt.append("QtCore")
+ 
+-    makefile = sipconfig.ProgramMakefile(sipcfg, console=1, qt=qt, warnings=0,
+-            opengl=opengl, debug=opts.debug, arch=sipcfg.arch,
+-            deployment_target=sipcfg.deployment_target)
++    cfg = cross_sipcfg or sipcfg
++    makefile = cross_sipconfig.ProgramMakefile(cfg, console=1, qt=qt, warnings=0,
++            opengl=opengl, debug=opts.debug, arch=cfg.arch,
++            deployment_target=cfg.deployment_target)
+ 
+     add_makefile_extras(makefile, extra_include_dirs, extra_lib_dirs, extra_libs)
++    
++    if library:
++        makefile.extra_lflags.append(sipconfig._default_macros["LFLAGS_SHLIB"])
+ 
+     exe, build = makefile.build_command(name)
+ 
+-    if sipcfg.deployment_target:
+-        envvars = {'MACOSX_DEPLOYMENT_TARGET': '%s' % sipcfg.deployment_target}
++    if cfg.deployment_target:
++        envvars = {'MACOSX_DEPLOYMENT_TARGET': '%s' % cfg.deployment_target}
+     else:
+         envvars = None
+ 
+@@ -1512,7 +1502,8 @@ int main(int, char **)
+ 
+     return compile_qt_program(cfgtest, mname,
+             extra_include_dirs=extra_include_dirs,
+-            extra_lib_dirs=extra_lib_dirs, extra_libs=extra_libs)
++            extra_lib_dirs=extra_lib_dirs, extra_libs=extra_libs,
++            library=True)
+ 
+ 
+ def set_sip_flags(pyqt):
+@@ -1520,32 +1511,31 @@ def set_sip_flags(pyqt):
+ 
+     pyqt is the configuration instance.
+     """
++    cfg = cross_sipcfg or sipcfg
+     # If we don't check for signed interpreters, we exclude the 'VendorID'
+     # feature
+     if not opts.vendorcheck:
+         qt_sip_flags.append("-x")
+         qt_sip_flags.append("VendorID")
+ 
+-    if not opts.with_deprecated:
+-        qt_sip_flags.append("-x")
+-        qt_sip_flags.append("PyQt_Deprecated_5_0")
+-
+     # Handle the platform tag.
+     if sys.platform == 'win32':
+         plattag = "WS_WIN"
+     elif sys.platform == "darwin":
+-        if "__USE_WS_X11__" in sipcfg.build_macros()["DEFINES"]:
++        if "__USE_WS_X11__" in cfg.build_macros()["DEFINES"]:
+             plattag = "WS_X11"
+         else:
+             plattag = "WS_MACX"
++    elif cross_sipcfg:
++        plattag = "WS_QWS"
+     else:
+-        plattag = "WS_X11"
++        plattag = "WS_QWS" #X11"
+ 
+     qt_sip_flags.append("-t")
+     qt_sip_flags.append(plattag)
+ 
+     # Handle the Qt version tag.
+-    verstag = sipconfig.version_to_sip_tag(qt_version, pyqt.qt_version_tags(), "Qt")
++    verstag = cross_sipconfig.version_to_sip_tag(qt_version, pyqt.qt_version_tags(), "Qt")
+ 
+     # Handle any feature flags.
+     for xf in qt_xfeatures:
+@@ -1557,11 +1547,11 @@ def set_sip_flags(pyqt):
+         qt_sip_flags.append(verstag)
+ 
+     # Handle the version specific Python features.
+-    if sipcfg.py_version < 0x020400:
++    if cfg.py_version < 0x020400:
+         qt_sip_flags.append("-x")
+         qt_sip_flags.append("Py_DateTime")
+ 
+-    if sipcfg.py_version < 0x030000:
++    if cfg.py_version < 0x030000:
+         qt_sip_flags.append("-x")
+         qt_sip_flags.append("Py_v3")
+ 
+@@ -1581,11 +1571,12 @@ def needed_qt_libs(mname, qt_libs):
+     # The dependencies between the different Qt libraries.  The order within
+     # each list is important.  Note that this affects the include directories
+     # as well as the libraries.
++    ### Note that the dependency on QtNetwork is only there on Embedded Linux.
+     LIB_DEPS = {
+         "QtCore": [],
+         "QtDBus": ["QtCore"],
+         "QtDeclarative": ["QtNetwork", "QtGui"],
+-        "QtGui": ["QtCore"],
++        "QtGui": ["QtCore", "QtNetwork"],
+         "QtHelp": ["QtGui"],
+         "QtMultimedia": ["QtGui"],
+         "QtNetwork": ["QtCore"],
+@@ -1752,9 +1743,10 @@ def generate_code(mname, extra_include_d
+         installs.append([sipfiles, os.path.join(opts.pyqtsipdir, mname)])
+ 
+     opengl = (mname == "QtOpenGL")
++    cfg = cross_sipcfg or sipcfg
+ 
+-    makefile = sipconfig.SIPModuleMakefile(
+-        configuration=sipcfg,
++    makefile = cross_sipconfig.SIPModuleMakefile(
++        configuration=cfg,
+         build_file=mname + ".sbf",
+         dir=mname,
+         install_dir=pyqt_modroot,
+@@ -1764,18 +1756,14 @@ def generate_code(mname, extra_include_d
+         warnings=1,
+         static=opts.static,
+         debug=opts.debug,
+-        universal=sipcfg.universal,
+-        arch=sipcfg.arch,
++        universal=cfg.universal,
++        arch=cfg.arch,
+         prot_is_public=opts.prot_is_public,
+-        deployment_target=sipcfg.deployment_target
++        deployment_target=cfg.deployment_target
+     )
+ 
+     add_makefile_extras(makefile, extra_include_dirs, extra_lib_dirs, extra_libs)
+ 
+-    if qt_version >= 0x050000 and opts.with_deprecated:
+-        # The name of this macro is very confusing.
+-        makefile.extra_defines.append('QT_DISABLE_DEPRECATED_BEFORE=0x040900')
+-
+     makefile.generate()
+ 
+ 
+@@ -1928,7 +1916,8 @@ def get_build_macros(overrides):
+         sipconfig.error("Unable to find the qmake configuration file %s. Use the QMAKESPEC environment variable to specify the correct platform." % fname)
+ 
+     # Add the Qt specific macros to the default.
+-    names = list(sipcfg.build_macros().keys())
++    cfg = cross_sipcfg or sipcfg
++    names = list(cfg.build_macros().keys())
+     names.append("INCDIR_QT")
+     names.append("LIBDIR_QT")
+     names.append("MOC")
+@@ -1939,19 +1928,12 @@ def get_build_macros(overrides):
+         "QT_INSTALL_LIBS":      qt_libdir
+     }
+ 
+-    macros = sipconfig.parse_build_macros(fname, names, overrides, properties)
++    macros = cross_sipconfig.parse_build_macros(fname, names, overrides, properties)
+ 
+     if macros is None:
+         return None
+ 
+-    # Qt5 doesn't seem to support the specific macros so add them if they are
+-    # missing.
+-    if macros.get("INCDIR_QT", "") == "":
+-        macros["INCDIR_QT"] = qt_incdir
+-
+-    if macros.get("LIBDIR_QT", "") == "":
+-        macros["LIBDIR_QT"] = qt_libdir
+-
++    # Make sure we have an entry for MOC (which Qt v5 doesn't provide).
+     if macros.get("MOC", "") == "":
+         default_moc = os.path.join(qt_bindir, "moc")
+         if sys.platform == 'win32':
+@@ -1989,16 +1971,21 @@ def check_qt_installation(macros):
+     # Get the Makefile generator.
+     generator = macros["MAKEFILE_GENERATOR"]
+ 
++    if cross_sipconfig:
++        macros["CXXFLAGS"] += ' -fPIC -fpermissive '
++        macros["LFLAGS_PLUGIN"] += " -Wl,-rpath="+qt_libdir+" "
++
+     # We haven't yet factored out sipconfig's knowledge of how to build Qt
+     # binaries and it is expecting to find these in the configuration when it
+     # generates the Makefiles.
+-    sipcfg.qt_version = qt_version
+-    sipcfg.qt_edition = qt_edition
+-    sipcfg.qt_winconfig = qt_shared
+-    sipcfg.qt_framework = qt_framework
+-    sipcfg.qt_threaded = 1
+-    sipcfg.qt_dir = qt_dir
+-    sipcfg.qt_lib_dir = qt_libdir
++    cfg = cross_sipcfg or sipcfg
++    cfg.qt_version = qt_version
++    cfg.qt_edition = qt_edition
++    cfg.qt_winconfig = qt_shared
++    cfg.qt_framework = qt_framework
++    cfg.qt_threaded = 1
++    cfg.qt_dir = qt_dir
++    cfg.qt_lib_dir = qt_libdir
+ 
+     return ConfigurePyQt4(generator)
+ 
+@@ -2043,8 +2030,9 @@ def get_qt_configuration():
+     # Generate the qmake project file.
+     f = open(pro_file, "w")
+ 
+-    if sipcfg.arch:
+-        f.write(arch_config())
++    cfg = cross_sipcfg or sipcfg
++    if cfg.arch:
++        f.write(arch_config(cfg))
+ 
+     f.write(
+ """QT = core
+@@ -2060,16 +2048,16 @@ SOURCES = %s
+     # Generate the source code.
+     f = open(cpp_file, "w")
+ 
++    ### This code is never run when we make libraries for QWS, so we don't
++    ### have to keep the list of checks for Qt features up to date.
++
+     f.write(
+ """#include <QCoreApplication>
+ #include <QFile>
+ #include <QLibraryInfo>
+ #include <QTextStream>
+ 
+-// These seem to be missing from the Qt v5 beta.
+-#if !defined(QT_EDITION_DESKTOP)
+-#define QT_EDITION_DESKTOP      8
+-#endif
++// This seems to be missing from the Qt v5 alpha.
+ #if !defined(QT_EDITION_OPENSOURCE)
+ #define QT_EDITION_OPENSOURCE   8
+ #endif
+@@ -2104,6 +2092,10 @@ int main(int argc, char **argv)
+ 
+     // Determine which features should be disabled.
+ 
++#if defined(QT_NO_RAW_FONT)
++    out << "PyQt_RawFont\\n";
++#endif
++
+ #if defined(QT_NO_ACCESSIBILITY)
+     out << "PyQt_Accessibility\\n";
+ #endif
+@@ -2128,10 +2120,134 @@ int main(int argc, char **argv)
+     out << "PyQt_OpenSSL\\n";
+ #endif
+ 
++#if defined(QT_NO_PICTURE)
++    out << "PyQt_Picture\\n";
++#endif
++
++#if defined(QT_NO_PRINTDIALOG)
++    out << "PyQt_PrintDialog\\n";
++#endif
++
++#if defined(QT_NO_PRINTPREVIEWDIALOG)
++    out << "PyQt_PrintPreviewDialog\\n";
++#endif
++
++#if defined(QT_NO_PRINTPREVIEWWIDGET)
++    out << "PyQt_PrintPreviewWidget\\n";
++#endif
++
++#if defined(QT_NO_PRINTER)
++    out << "PyQt_Printer\\n";
++#endif
++
++#if defined(QT_NO_PROGRESSDIALOG)
++    out << "PyQt_ProgressDialog\\n";
++#endif
++
++#if defined(QT_NO_PROXYMODEL)
++    out << "PyQt_ProxyModel\\n";
++#endif
++
++#if defined(QT_NO_RUBBERBAND)
++    out << "PyQt_RubberBand\\n";
++#endif
++
++#if defined(QT_NO_PROCESS)
++    out << "PyQt_Process\\n";
++#endif
++
++#if defined(QT_NO_QWS_ALPHA_CURSOR)
++    out << "PyQt_QWS_Alpha_Cursor\\n";
++#endif
++
++#if defined(QT_NO_QWS_CURSOR)
++    out << "PyQt_QWS_Cursor\\n";
++#endif
++
++#if defined(QT_NO_QWS_DECORATION_WINDOWS)
++    out << "PyQt_QWS_Decoration_Windows\\n";
++#endif
++
++#if defined(QT_NO_QWS_MOUSE)
++    out << "PyQt_QWS_Mouse\\n";
++#endif
++
++#if defined(QT_NO_QWS_MOUSE_AUTO)
++    out << "PyQt_QWS_Mouse_Auto\\n";
++#endif
++
++#if defined(QT_NO_QWS_MOUSE_MANUAL)
++    out << "PyQt_QWS_Mouse_Manual\\n";
++#endif
++
++#if defined(QT_NO_RUBBERBAND)
++    out << "PyQt_RubberBand\\n";
++#endif
++
++#if defined(QT_NO_SCROLLBAR)
++    out << "PyQt_ScrollBar\\n";
++#endif
++
++#if defined(QT_NO_SESSIONMANAGER)
++    out << "PyQt_SessionManager\\n";
++#endif
++
+ #if defined(QT_NO_SIZEGRIP)
+     out << "PyQt_SizeGrip\\n";
+ #endif
+ 
++#if defined(QT_NO_SOCKS5)
++    out << "PyQt_Socks5\\n";
++#endif
++
++#if defined(QT_NO_SORTFILTERPROXYMODEL)
++    out << "PyQt_SortFilterProxyModel\\n";
++#endif
++
++#if defined(QT_NO_SPLASHSCREEN)
++    out << "PyQt_SplashScreen\\n";
++#endif
++
++#if defined(QT_NO_SPLITTER)
++    out << "PyQt_Splitter\\n";
++#endif
++
++#if defined(QT_NO_STANDARDITEMMODEL)
++    out << "PyQt_StandardItemModel\\n";
++#endif
++
++#if defined(QT_NO_STATUSBAR)
++    out << "PyQt_StatusBar\\n";
++#endif
++
++#if defined(QT_NO_STATUSTIP)
++    out << "PyQt_StatusTip\\n";
++#endif
++
++#if defined(QT_NO_STRINGLISTMODEL)
++    out << "PyQt_StringListModel\\n";
++#endif
++
++#if defined(QT_NO_STYLE_CDE)
++    out << "PyQt_Style_CDE\\n";
++#endif
++
++#if defined(QT_NO_STYLE_MOTIF)
++    out << "PyQt_Style_Motif\\n";
++#endif
++
++#if defined(QT_NO_STYLE_PLASTIQUE)
++    out << "PyQt_Style_Plastique\\n";
++#endif
++
++#if defined(QT_NO_STYLE_WINDOWSXP)
++    out << "PyQt_Style_WindowsXP\\n";
++#endif
++
++#if defined(QT_NO_SYNTAXHIGHLIGHTER)
++    out << "PyQt_SyntaxHighlighter\\n";
++#endif
++
+ #if defined(QT_NO_SYSTEMTRAYICON)
+     out << "PyQt_SystemTrayIcon\\n";
+ #endif
+@@ -2152,10 +2268,6 @@ int main(int argc, char **argv)
+     out << "PyQt_PrintPreviewWidget\\n";
+ #endif
+ 
+-#if defined(QT_NO_RAWFONT)
+-    out << "PyQt_RawFont\\n";
+-#endif
+-
+ #if !defined(QT3_SUPPORT) || QT_VERSION >= 0x040200
+     out << "PyQt_NoPrintRangeBug\\n";
+ #endif
+@@ -2164,8 +2276,9 @@ int main(int argc, char **argv)
+     out << "PyQt_NoOpenGLES\\n";
+ #endif
+ 
+-    if (sizeof (qreal) != sizeof (double))
++#if defined(QT_NO_FPU) || defined(QT_ARCH_ARM) || defined(QT_ARCH_WINDOWSCE)
+         out << "PyQt_qreal_double\\n";
++#endif
+ 
+     return 0;
+ }
+@@ -2174,35 +2287,35 @@ int main(int argc, char **argv)
+     f.close()
+ 
+     # Create the makefile, first making sure it doesn't already exist.
+-    remove_file(make_file)
+-    run_command("%s %s %s" % (opts.qmake, qmake_args, pro_file))
++    #remove_file(make_file)
++    #run_command("%s %s %s" % (opts.qmake, qmake_args, pro_file))
+ 
+-    if not os.access(make_file, os.F_OK):
+-        sipconfig.error("%s failed to create a makefile. %s" % (opts.qmake, MSG_CHECK_QMAKE))
++    #if not os.access(make_file, os.F_OK):
++    #    sipconfig.error("%s failed to create a makefile. %s" % (opts.qmake, MSG_CHECK_QMAKE))
+ 
+     # Try and work out the name of make.
+-    if sipcfg.platform.startswith("win32-msvc"):
+-        make = "nmake"
+-    elif sipcfg.platform == "win32-borland":
+-        make = "bmake"
+-    elif sipcfg.platform == "win32-g++":
+-        make = "mingw32-make"
+-    else:
+-        make = "make"
++    #if sipcfg.platform.startswith("win32-msvc"):
++    #    make = "nmake"
++    #elif sipcfg.platform == "win32-borland":
++    #    make = "bmake"
++    #elif sipcfg.platform == "win32-g++":
++    #    make = "mingw32-make"
++    #else:
++    #    make = "make"
+ 
+     # Create the executable, first making sure it doesn't exist.
+-    remove_file(exe_file)
+-    run_command("%s -f %s%s" % (make, make_file, make_target))
++    #remove_file(exe_file)
++    #run_command("%s -f %s%s" % (make, make_file, make_target))
+ 
+-    if not os.access(exe_file, os.X_OK):
+-        sipconfig.error("Failed to determine the layout of your Qt installation. Try again using the --verbose flag to see more detail about the problem.")
++    #if not os.access(exe_file, os.X_OK):
++    #    sipconfig.error("Failed to determine the layout of your Qt installation. Try again using the --verbose flag to see more detail about the problem.")
+ 
+     # Create the output file, first making sure it doesn't exist.
+-    remove_file(out_file)
+-    run_command(exe_file)
++    #remove_file(out_file)
++    #run_command(exe_file)
+ 
+     if not os.access(out_file, os.F_OK):
+-        sipconfig.error("%s failed to create %s. Make sure your Qt installation is correct." % (exe_file, out_file))
++        sipconfig.error("%s failed to create %s. Make sure your Qt v4 installation is correct." % (exe_file, out_file))
+ 
+     # Read the directories.
+     f = open(out_file, "r")
+@@ -2279,6 +2392,16 @@ def main():
+ 
+     global opts
+ 
++    cross_path = os.getenv("CROSS_SIPCONFIG")
++    global cross_sipcfg, cross_sipconfig
++    if cross_path:
++        import imp
++        c_file, c_filename, c_details = imp.find_module("sipconfig", [cross_path])
++        cross_sipconfig = imp.load_module("cross_sipconfig", c_file, c_filename, c_details)
++        cross_sipcfg = cross_sipconfig.Configuration()
++    else:
++        cross_sipcfg = None
++    
+     # Parse the command line.
+     p = create_optparser()
+     opts, args = p.parse_args()
+@@ -2324,7 +2447,11 @@ def main():
+         p.print_help()
+         sys.exit(2)
+ 
+-    sipcfg.set_build_macros(macros)
++    cfg = cross_sipcfg or sipcfg
++    if cross_sipcfg:
++        old_macros = cfg.build_macros()
++        macros.update(old_macros)
++    cfg.set_build_macros(macros)
+ 
+     # Check Qt is what we need.
+     pyqt = check_qt_installation(macros)
+@@ -2366,8 +2493,8 @@ def main():
+         if opts.mwg_qwt_dir:
+             xtra_modules.append("Qwt5")
+ 
+-    sipconfig.ParentMakefile(
+-        configuration=sipcfg,
++    cross_sipconfig.ParentMakefile(
++        configuration=cfg,
+         subdirs=pyqt.qpy_libs() + pyqt_modules + xtra_modules + pyqt.tools(),
+         installs=installs
+     ).generate()
+@@ -2382,6 +2509,9 @@ def main():
+ ###############################################################################
+ 
+ if __name__ == "__main__":
++
++    print sipconfig._pkg_config
++
+     try:
+         main()
+     except SystemExit:
diff --git a/package/pyqt/pyqt-4.9.6-full.patch b/package/pyqt/pyqt-4.9.6-full.patch
new file mode 100644
index 0000000..fff529a
--- /dev/null
+++ b/package/pyqt/pyqt-4.9.6-full.patch
@@ -0,0 +1,949 @@
+diff -ur PyQt-x11-gpl-4.9.6/qpy/QtCore/qpycore_api.h pyqt-4.9.6/qpy/QtCore/qpycore_api.h
+--- PyQt-x11-gpl-4.9.6/qpy/QtCore/qpycore_api.h	2012-12-08 13:51:39.000000000 +0400
++++ pyqt-4.9.6/qpy/QtCore/qpycore_api.h	2013-04-24 14:25:37.154000018 +0400
+@@ -28,6 +28,7 @@
+ #define _QPYCORE_API_H
+ 
+ 
++#include <qconfig.h>
+ #include <QCoreApplication>
+ #include <QString>
+ #include <QVariant>
+@@ -47,7 +48,9 @@
+ PyObject *qpycore_pyqtsignature(PyObject *args, PyObject *kwds);
+ 
+ // Support for pyqtConfigure().
++#ifndef QT_NO_PROPERTIES
+ int qpycore_pyqtconfigure(PyObject *self, QObject *qobj, PyObject *kwds);
++#endif
+ 
+ // Support for converting between PyObject and QString.
+ PyObject *qpycore_PyObject_FromQString(const QString &qstr);
+diff -ur PyQt-x11-gpl-4.9.6/qpy/QtCore/qpycore_init.cpp pyqt-4.9.6/qpy/QtCore/qpycore_init.cpp
+--- PyQt-x11-gpl-4.9.6/qpy/QtCore/qpycore_init.cpp	2012-12-08 13:51:39.000000000 +0400
++++ pyqt-4.9.6/qpy/QtCore/qpycore_init.cpp	2013-04-24 14:25:37.154000018 +0400
+@@ -25,6 +25,7 @@
+ 
+ #include <Python.h>
+ 
++#include <qconfig.h>
+ #include "qpycore_chimera.h"
+ #include "qpycore_qobject_helpers.h"
+ #include "qpycore_shared.h"
+@@ -54,7 +55,9 @@
+     sipExportSymbol("qpycore_qobject_receivers",
+             (void *)qpycore_qobject_receivers);
+ 
++#ifndef QT_NO_PROPERTIES
+     sipExportSymbol("pyqt_kw_handler", (void *)qpycore_pyqtconfigure);
++#endif
+ 
+     sipExportSymbol("qpycore_ArgvToC", (void *)qpycore_ArgvToC);
+     sipExportSymbol("qpycore_UpdatePyArgv", (void *)qpycore_UpdatePyArgv);
+diff -ur PyQt-x11-gpl-4.9.6/qpy/QtCore/qpycore_pyqtconfigure.cpp pyqt-4.9.6/qpy/QtCore/qpycore_pyqtconfigure.cpp
+--- PyQt-x11-gpl-4.9.6/qpy/QtCore/qpycore_pyqtconfigure.cpp	2012-12-08 13:51:39.000000000 +0400
++++ pyqt-4.9.6/qpy/QtCore/qpycore_pyqtconfigure.cpp	2013-04-24 14:25:37.154000018 +0400
+@@ -23,6 +23,8 @@
+ // WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
+ 
+ 
++#include <qconfig.h>
++#ifndef QT_NO_PROPERTIES
+ #include <Python.h>
+ 
+ #include <QByteArray>
+@@ -167,3 +169,4 @@
+ 
+     return 0;
+ }
++#endif // QT_NO_PROPERTIES
+diff -ur PyQt-x11-gpl-4.9.6/qpy/QtCore/qpycore_qstring.cpp pyqt-4.9.6/qpy/QtCore/qpycore_qstring.cpp
+--- PyQt-x11-gpl-4.9.6/qpy/QtCore/qpycore_qstring.cpp	2012-12-08 13:51:39.000000000 +0400
++++ pyqt-4.9.6/qpy/QtCore/qpycore_qstring.cpp	2013-04-24 14:25:37.154000018 +0400
+@@ -26,8 +26,11 @@
+ #include <Python.h>
+ #include <string.h>
+ 
++#include <qconfig.h>
+ #include <QString>
++#ifndef QT_NO_TEXTCODEC
+ #include <QTextCodec>
++#endif
+ #include <QVector>
+ 
+ #include "qpycore_sip.h"
+@@ -169,6 +172,7 @@
+         }
+         else
+         {
++#ifndef QT_NO_TEXTCODEC
+             QTextCodec *codec = QTextCodec::codecForTr();
+ 
+             if (codec)
+@@ -188,6 +192,9 @@
+             {
+                 obj = PyUnicode_AsLatin1String(obj);
+             }
++#else
++                obj = PyUnicode_AsLatin1String(obj);
++#endif
+         }
+ 
+         if (obj)
+diff -ur PyQt-x11-gpl-4.9.6/sip/phonon/phononmod.sip pyqt-4.9.6/sip/phonon/phononmod.sip
+--- PyQt-x11-gpl-4.9.6/sip/phonon/phononmod.sip	2012-12-08 13:51:38.000000000 +0400
++++ pyqt-4.9.6/sip/phonon/phononmod.sip	2013-04-24 14:14:54.168000018 +0400
+@@ -62,7 +62,9 @@
+ %Include backendcapabilities.sip
+ %Include effect.sip
+ %Include effectparameter.sip
+-%Include effectwidget.sip
++%If (PyQt_Phonon_EffectWidget)
++  %Include effectwidget.sip
++%End
+ %Include mediacontroller.sip
+ %Include medianode.sip
+ %Include mediaobject.sip
+@@ -70,7 +72,11 @@
+ %Include objectdescription.sip
+ %Include path.sip
+ %Include phononnamespace.sip
+-%Include seekslider.sip
++%If (PyQt_Phonon_SeekSlider)
++  %Include seekslider.sip
++%End
+ %Include videoplayer.sip
+ %Include videowidget.sip
+-%Include volumeslider.sip
++%If (PyQt_Phonon_VolumeSlider)
++  %Include volumeslider.sip
++%End
+diff -ur PyQt-x11-gpl-4.9.6/sip/QtCore/qnamespace.sip pyqt-4.9.6/sip/QtCore/qnamespace.sip
+--- PyQt-x11-gpl-4.9.6/sip/QtCore/qnamespace.sip	2012-12-08 13:51:38.000000000 +0400
++++ pyqt-4.9.6/sip/QtCore/qnamespace.sip	2013-04-24 17:50:22.845000018 +0400
+@@ -1670,7 +1670,7 @@
+ %End
+ %End
+ %If (- Qt_5_0_0)
+-%If (WS_X11)
++%If (WS_X11 || WS_QWS)
+     typedef unsigned long HANDLE;
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
+diff -ur PyQt-x11-gpl-4.9.6/sip/QtGui/qabstractbutton.sip pyqt-4.9.6/sip/QtGui/qabstractbutton.sip
+--- PyQt-x11-gpl-4.9.6/sip/QtGui/qabstractbutton.sip	2012-12-08 13:51:38.000000000 +0400
++++ pyqt-4.9.6/sip/QtGui/qabstractbutton.sip	2013-04-24 16:53:31.003000018 +0400
+@@ -51,8 +51,10 @@
+     void setIcon(const QIcon &icon);
+     QIcon icon() const;
+     QSize iconSize() const;
++%If (PyQt_Shortcut)
+     void setShortcut(const QKeySequence &key);
+     QKeySequence shortcut() const;
++%End
+     void setCheckable(bool);
+     bool isCheckable() const;
+     bool isChecked() const;
+@@ -62,7 +64,9 @@
+     bool autoRepeat() const;
+     void setAutoExclusive(bool);
+     bool autoExclusive() const;
++%If (PyQt_ButtonGroup)
+     QButtonGroup *group() const;
++%End
+ 
+ public slots:
+     void setIconSize(const QSize &size);
+diff -ur PyQt-x11-gpl-4.9.6/sip/QtGui/qaction.sip pyqt-4.9.6/sip/QtGui/qaction.sip
+--- PyQt-x11-gpl-4.9.6/sip/QtGui/qaction.sip	2012-12-08 13:51:38.000000000 +0400
++++ pyqt-4.9.6/sip/QtGui/qaction.sip	2013-04-24 14:14:54.272000018 +0400
+@@ -44,20 +44,30 @@
+     QString text() const;
+     void setIconText(const QString &text);
+     QString iconText() const;
+-    void setToolTip(const QString &tip);
+-    QString toolTip() const;
+-    void setStatusTip(const QString &statusTip);
+-    QString statusTip() const;
+-    void setWhatsThis(const QString &what);
+-    QString whatsThis() const;
++%If (PyQt_ToolTip)
++      void setToolTip(const QString &tip);
++      QString toolTip() const;
++%End
++%If (PyQt_StatusTip)
++      void setStatusTip(const QString &statusTip);
++      QString statusTip() const;
++%End
++%If (PyQt_WhatsThis)
++      void setWhatsThis(const QString &what);
++      QString whatsThis() const;
++%End
++%If (PyQt_Menu)
+     QMenu *menu() const;
+     void setMenu(QMenu *menu /KeepReference/);
++%End
+     void setSeparator(bool b);
+     bool isSeparator() const;
++%If (PyQt_Shortcut)
+     void setShortcut(const QKeySequence &shortcut);
+     QKeySequence shortcut() const;
+     void setShortcutContext(Qt::ShortcutContext context);
+     Qt::ShortcutContext shortcutContext() const;
++%End
+     void setFont(const QFont &font);
+     QFont font() const;
+     void setCheckable(bool);
+@@ -111,6 +121,7 @@
+     };
+ 
+ %End
++%If (PyQt_Shortcut)
+ %If (Qt_4_2_0 -)
+     void setShortcuts(const QList<QKeySequence> &shortcuts);
+ %End
+@@ -126,6 +137,7 @@
+ %If (Qt_4_2_0 -)
+     bool autoRepeat() const;
+ %End
++%End
+ %If (Qt_4_2_0 -)
+     void setMenuRole(QAction::MenuRole menuRole);
+ %End
+@@ -136,8 +148,10 @@
+     QList<QWidget*> associatedWidgets() const;
+ %End
+ %If (Qt_4_5_0 -)
++%If (PyQt_GraphicsView)
+     QList<QGraphicsWidget*> associatedGraphicsWidgets() const;
+ %End
++%End
+ %If (Qt_4_4_0 -)
+     void setIconVisibleInMenu(bool visible);
+ %End
+diff -ur PyQt-x11-gpl-4.9.6/sip/QtGui/qcolor.sip pyqt-4.9.6/sip/QtGui/qcolor.sip
+--- PyQt-x11-gpl-4.9.6/sip/QtGui/qcolor.sip	2012-12-08 13:51:38.000000000 +0400
++++ pyqt-4.9.6/sip/QtGui/qcolor.sip	2013-04-24 14:14:54.205000018 +0400
+@@ -227,5 +227,7 @@
+ %End
+ };
+ 
++%If (PyQt_DataStream)
+ QDataStream &operator<<(QDataStream &, const QColor & /Constrained/);
+ QDataStream &operator>>(QDataStream &, QColor & /Constrained/);
++%End
+diff -ur PyQt-x11-gpl-4.9.6/sip/QtGui/qcursor.sip pyqt-4.9.6/sip/QtGui/qcursor.sip
+--- PyQt-x11-gpl-4.9.6/sip/QtGui/qcursor.sip	2012-12-08 13:51:38.000000000 +0400
++++ pyqt-4.9.6/sip/QtGui/qcursor.sip	2013-04-24 14:14:54.227000018 +0400
+@@ -24,6 +24,7 @@
+ // This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
+ // WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
+ 
++%If (PyQt_Cursor)
+ 
+ %ModuleCode
+ #include <qcursor.h>
+@@ -82,5 +83,9 @@
+     static void setPos(const QPoint &p);
+ };
+ 
++%If (PyQt_DataStream)
+ QDataStream &operator<<(QDataStream &outS, const QCursor &cursor /Constrained/);
+ QDataStream &operator>>(QDataStream &inS, QCursor &cursor /Constrained/);
++%End
++
++%End
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
+@@ -264,5 +266,7 @@
+ %End
+ };
+ 
++%If (PyQt_DataStream)
+ QDataStream &operator<<(QDataStream &, const QFont & /Constrained/);
+ QDataStream &operator>>(QDataStream &, QFont & /Constrained/);
++%End
+diff -ur PyQt-x11-gpl-4.9.6/sip/QtGui/qgraphicsproxywidget.sip pyqt-4.9.6/sip/QtGui/qgraphicsproxywidget.sip
+--- PyQt-x11-gpl-4.9.6/sip/QtGui/qgraphicsproxywidget.sip	2012-12-08 13:51:38.000000000 +0400
++++ pyqt-4.9.6/sip/QtGui/qgraphicsproxywidget.sip	2013-04-24 14:14:54.256000018 +0400
+@@ -69,7 +69,9 @@
+     virtual bool eventFilter(QObject *object, QEvent *event);
+     virtual void showEvent(QShowEvent *event);
+     virtual void hideEvent(QHideEvent *event);
++%If (PyQt_ContextMenu)
+     virtual void contextMenuEvent(QGraphicsSceneContextMenuEvent *event);
++%End
+     virtual void hoverEnterEvent(QGraphicsSceneHoverEvent *event);
+     virtual void hoverLeaveEvent(QGraphicsSceneHoverEvent *event);
+     virtual void hoverMoveEvent(QGraphicsSceneHoverEvent *event);
+@@ -79,7 +81,9 @@
+     virtual void mousePressEvent(QGraphicsSceneMouseEvent *event);
+     virtual void mouseReleaseEvent(QGraphicsSceneMouseEvent *event);
+     virtual void mouseDoubleClickEvent(QGraphicsSceneMouseEvent *event);
++%If (PyQt_WheelEvent)
+     virtual void wheelEvent(QGraphicsSceneWheelEvent *event);
++%End
+     virtual void keyPressEvent(QKeyEvent *event);
+     virtual void keyReleaseEvent(QKeyEvent *event);
+     virtual void focusInEvent(QFocusEvent *event);
+@@ -87,6 +91,7 @@
+     virtual bool focusNextPrevChild(bool next);
+     virtual QSizeF sizeHint(Qt::SizeHint which, const QSizeF &constraint = QSizeF()) const;
+     virtual void resizeEvent(QGraphicsSceneResizeEvent *event);
++%If (PyQt_DragAndDrop)
+ %If (Qt_4_5_0 -)
+     virtual void dragEnterEvent(QGraphicsSceneDragDropEvent *event);
+ %End
+@@ -99,6 +104,7 @@
+ %If (Qt_4_5_0 -)
+     virtual void dropEvent(QGraphicsSceneDragDropEvent *event);
+ %End
++%End
+ %If (Qt_4_5_0 -)
+     QGraphicsProxyWidget *newProxyWidget(const QWidget *) /Factory/;
+ %End
+diff -ur PyQt-x11-gpl-4.9.6/sip/QtGui/qgraphicsview.sip pyqt-4.9.6/sip/QtGui/qgraphicsview.sip
+--- PyQt-x11-gpl-4.9.6/sip/QtGui/qgraphicsview.sip	2012-12-08 13:51:38.000000000 +0400
++++ pyqt-4.9.6/sip/QtGui/qgraphicsview.sip	2013-04-24 14:14:54.261000018 +0400
+@@ -142,11 +142,15 @@
+ protected:
+     virtual bool event(QEvent *event);
+     virtual bool viewportEvent(QEvent *event);
++%If (PyQt_ContextMenu)
+     virtual void contextMenuEvent(QContextMenuEvent *event);
++%End
++%If (PyQt_DragAndDrop)
+     virtual void dragEnterEvent(QDragEnterEvent *event);
+     virtual void dragLeaveEvent(QDragLeaveEvent *event);
+     virtual void dragMoveEvent(QDragMoveEvent *event);
+     virtual void dropEvent(QDropEvent *event);
++%End
+     virtual void focusInEvent(QFocusEvent *event);
+     virtual void focusOutEvent(QFocusEvent *event);
+ %If (Qt_4_4_0 -)
+@@ -158,7 +162,9 @@
+     virtual void mousePressEvent(QMouseEvent *event);
+     virtual void mouseMoveEvent(QMouseEvent *event);
+     virtual void mouseReleaseEvent(QMouseEvent *event);
++%If (PyQt_WheelEvent)
+     virtual void wheelEvent(QWheelEvent *event);
++%End
+     virtual void paintEvent(QPaintEvent *event);
+     virtual void resizeEvent(QResizeEvent *event);
+     virtual void scrollContentsBy(int dx, int dy);
+@@ -310,12 +316,14 @@
+ %If (Qt_4_3_0 -)
+     void setOptimizationFlags(QFlags<QGraphicsView::OptimizationFlag> flags);
+ %End
++%If (PyQt_RubberBand)
+ %If (Qt_4_3_0 -)
+     Qt::ItemSelectionMode rubberBandSelectionMode() const;
+ %End
+ %If (Qt_4_3_0 -)
+     void setRubberBandSelectionMode(Qt::ItemSelectionMode mode);
+ %End
++%End
+ %If (Qt_4_3_0 -)
+     QTransform transform() const;
+ %End
+diff -ur PyQt-x11-gpl-4.9.6/sip/QtGui/qicon.sip pyqt-4.9.6/sip/QtGui/qicon.sip
+--- PyQt-x11-gpl-4.9.6/sip/QtGui/qicon.sip	2012-12-08 13:51:38.000000000 +0400
++++ pyqt-4.9.6/sip/QtGui/qicon.sip	2013-04-24 14:14:54.288000018 +0400
+@@ -115,12 +115,14 @@
+ %End
+ };
+ 
++%If (PyQt_DataStream)
+ %If (Qt_4_2_0 -)
+ QDataStream &operator<<(QDataStream &, const QIcon & /Constrained/);
+ %End
+ %If (Qt_4_2_0 -)
+ QDataStream &operator>>(QDataStream &, QIcon & /Constrained/);
+ %End
++%End
+ %If (Qt_4_3_0 -)
+ void qSwap(QIcon &value1, QIcon &value2);
+ %End
+diff -ur PyQt-x11-gpl-4.9.6/sip/QtGui/qlistwidget.sip pyqt-4.9.6/sip/QtGui/qlistwidget.sip
+--- PyQt-x11-gpl-4.9.6/sip/QtGui/qlistwidget.sip	2012-12-08 13:51:38.000000000 +0400
++++ pyqt-4.9.6/sip/QtGui/qlistwidget.sip	2013-04-24 14:14:54.234000018 +0400
+@@ -64,7 +64,9 @@
+     Qt::ItemFlags flags() const;
+     QString text() const;
+     QIcon icon() const;
++%If (PyQt_StatusTip)
+     QString statusTip() const;
++%End
+ %If (PyQt_ToolTip)
+     QString toolTip() const;
+ %End
+@@ -85,13 +87,17 @@
+     virtual QVariant data(int role) const;
+     virtual void setData(int role, const QVariant &value);
+     virtual bool operator<(const QListWidgetItem &other /NoCopy/) const;
++%If (PyQt_DataStream)
+     virtual void read(QDataStream &in) /ReleaseGIL/;
+     virtual void write(QDataStream &out) const /ReleaseGIL/;
++%End
+     int type() const;
+     void setFlags(Qt::ItemFlags aflags);
+     void setText(const QString &atext);
+     void setIcon(const QIcon &aicon);
++%If (PyQt_StatusTip)
+     void setStatusTip(const QString &astatusTip);
++%End
+ %If (PyQt_ToolTip)
+     void setToolTip(const QString &atoolTip);
+ %End
+@@ -128,8 +134,10 @@
+     QListWidgetItem &operator=(const QListWidgetItem &);
+ };
+ 
++%If (PyQt_DataStream)
+ QDataStream &operator<<(QDataStream &out, const QListWidgetItem &item /Constrained/);
+ QDataStream &operator>>(QDataStream &in, QListWidgetItem &item /Constrained/);
++%End
+ 
+ class QListWidget : QListView
+ {
+@@ -212,8 +220,10 @@
+ protected:
+     virtual QStringList mimeTypes() const;
+     virtual QMimeData *mimeData(const QList<QListWidgetItem*> items) const /TransferBack/;
++%If (PyQt_DragAndDrop)
+     virtual bool dropMimeData(int index, const QMimeData *data, Qt::DropAction action);
+     virtual Qt::DropActions supportedDropActions() const;
++%End
+     QList<QListWidgetItem*> items(const QMimeData *data) const;
+     QModelIndex indexFromItem(QListWidgetItem *item) const;
+     QListWidgetItem *itemFromIndex(const QModelIndex &index) const;
+@@ -227,8 +237,10 @@
+     bool isSortingEnabled() const;
+ %End
+ %If (Qt_4_2_0 -)
++%If (PyQt_DragAndDrop)
+     virtual void dropEvent(QDropEvent *event);
+ %End
++%End
+ %If (Qt_4_3_0 -)
+     void removeItemWidget(QListWidgetItem *aItem);
+ %MethodCode
+diff -ur PyQt-x11-gpl-4.9.6/sip/QtGui/qmainwindow.sip pyqt-4.9.6/sip/QtGui/qmainwindow.sip
+--- PyQt-x11-gpl-4.9.6/sip/QtGui/qmainwindow.sip	2012-12-08 13:51:38.000000000 +0400
++++ pyqt-4.9.6/sip/QtGui/qmainwindow.sip	2013-04-24 14:14:54.246000018 +0400
+@@ -47,14 +47,21 @@
+     void setIconSize(const QSize &iconSize);
+     Qt::ToolButtonStyle toolButtonStyle() const;
+     void setToolButtonStyle(Qt::ToolButtonStyle toolButtonStyle);
++%If (PyQt_MenuBar)
+     QMenuBar *menuBar() const /Transfer/;
+     void setMenuBar(QMenuBar *menubar /Transfer/);
++%End
++%If (PyQt_StatusBar)
+     QStatusBar *statusBar() const /Transfer/;
+     void setStatusBar(QStatusBar *statusbar /Transfer/);
++%End
+     QWidget *centralWidget() const;
+     void setCentralWidget(QWidget *widget /Transfer/);
++%If (PyQt_DockWidget)
+     void setCorner(Qt::Corner corner, Qt::DockWidgetArea area);
+     Qt::DockWidgetArea corner(Qt::Corner corner) const;
++%End
++%If (PyQt_ToolBar)
+     void addToolBarBreak(Qt::ToolBarArea area = Qt::TopToolBarArea);
+     void insertToolBarBreak(QToolBar *before);
+     void addToolBar(Qt::ToolBarArea area, QToolBar *toolbar /Transfer/);
+@@ -63,47 +70,61 @@
+     void insertToolBar(QToolBar *before, QToolBar *toolbar /Transfer/);
+     void removeToolBar(QToolBar *toolbar);
+     Qt::ToolBarArea toolBarArea(QToolBar *toolbar) const;
++%End
++%If (PyQt_DockWidget)
+     void addDockWidget(Qt::DockWidgetArea area, QDockWidget *dockwidget /Transfer/);
+     void addDockWidget(Qt::DockWidgetArea area, QDockWidget *dockwidget /Transfer/, Qt::Orientation orientation);
+     void splitDockWidget(QDockWidget *after, QDockWidget *dockwidget /Transfer/, Qt::Orientation orientation);
+     void removeDockWidget(QDockWidget *dockwidget /TransferBack/);
+     Qt::DockWidgetArea dockWidgetArea(QDockWidget *dockwidget) const;
++%End
+     QByteArray saveState(int version = 0) const;
+     bool restoreState(const QByteArray &state, int version = 0);
++%If (PyQt_Menu)
+     virtual QMenu *createPopupMenu();
++%End
+ 
+ public slots:
++%If (PyQt_DockWidget)
+ %If (Qt_4_2_0 -)
+     void setAnimated(bool enabled);
+ %End
+ %If (Qt_4_2_0 -)
+     void setDockNestingEnabled(bool enabled);
+ %End
++%End
+ 
+ signals:
+     void iconSizeChanged(const QSize &iconSize);
+     void toolButtonStyleChanged(Qt::ToolButtonStyle toolButtonStyle);
+ 
+ protected:
++%If (PyQt_ContextMenu)
+     virtual void contextMenuEvent(QContextMenuEvent *event);
++%End
+     virtual bool event(QEvent *event);
+ 
+ public:
++%If (PyQt_DockWidget)
+ %If (Qt_4_2_0 -)
+     bool isAnimated() const;
+ %End
+ %If (Qt_4_2_0 -)
+     bool isDockNestingEnabled() const;
+ %End
++%End
+ %If (Qt_4_2_0 -)
+     bool isSeparator(const QPoint &pos) const;
+ %End
++%If (PyQt_MenuBar)
+ %If (Qt_4_2_0 -)
+     QWidget *menuWidget() const;
+ %End
+ %If (Qt_4_2_0 -)
+     void setMenuWidget(QWidget *menubar /Transfer/);
+ %End
++%End
++%If (PyQt_DockWidget)
+ %If (Qt_4_2_0 -)
+     void tabifyDockWidget(QDockWidget *first, QDockWidget *second);
+ %End
+@@ -128,12 +149,16 @@
+ %If (Qt_4_3_0 -)
+     QFlags<QMainWindow::DockOption> dockOptions() const;
+ %End
++%End
++%If (PyQt_ToolBar)
+ %If (Qt_4_3_0 -)
+     void removeToolBarBreak(QToolBar *before);
+ %End
+ %If (Qt_4_3_0 -)
+     bool toolBarBreak(QToolBar *toolbar) const;
+ %End
++%End
++%If (PyQt_DockWidget)
+ %If (Qt_4_3_0 -)
+     void setUnifiedTitleAndToolBarOnMac(bool set);
+ %End
+@@ -143,18 +168,23 @@
+ %If (Qt_4_4_0 -)
+     bool restoreDockWidget(QDockWidget *dockwidget);
+ %End
++%End
++%If (PyQt_TabBar)
+ %If (Qt_4_5_0 -)
+     bool documentMode() const;
+ %End
+ %If (Qt_4_5_0 -)
+     void setDocumentMode(bool enabled);
+ %End
++%End
++%If (PyQt_TabWidget)
+ %If (Qt_4_5_0 -)
+     QTabWidget::TabShape tabShape() const;
+ %End
+ %If (Qt_4_5_0 -)
+     void setTabShape(QTabWidget::TabShape tabShape);
+ %End
++%If (PyQt_DockWidget)
+ %If (Qt_4_5_0 -)
+     QTabWidget::TabPosition tabPosition(Qt::DockWidgetArea area) const;
+ %End
+@@ -164,11 +194,15 @@
+ %If (Qt_4_5_0 -)
+     QList<QDockWidget*> tabifiedDockWidgets(QDockWidget *dockwidget) const;
+ %End
++%End // PyQt_DockWidget
++%End // PyQt_TabWidget
+ 
+ private:
+     QMainWindow(const QMainWindow &);
+ };
+ 
++%If (PyQt_DockWidget)
+ %If (Qt_4_3_0 -)
+ QFlags<QMainWindow::DockOption> operator|(QMainWindow::DockOption f1, QFlags<QMainWindow::DockOption> f2);
+ %End
++%End
+diff -ur PyQt-x11-gpl-4.9.6/sip/QtGui/qplaintextedit.sip pyqt-4.9.6/sip/QtGui/qplaintextedit.sip
+--- PyQt-x11-gpl-4.9.6/sip/QtGui/qplaintextedit.sip	2012-12-08 13:51:38.000000000 +0400
++++ pyqt-4.9.6/sip/QtGui/qplaintextedit.sip	2013-04-24 14:14:54.219000018 +0400
+@@ -74,7 +74,9 @@
+     QString toPlainText() const;
+     void ensureCursorVisible();
+     virtual QVariant loadResource(int type, const QUrl &name);
++%If (PyQt_ContextMenu)
+     QMenu *createStandardContextMenu() /Factory/;
++%End
+     QTextCursor cursorForPosition(const QPoint &pos) const;
+     QRect cursorRect(const QTextCursor &cursor) const;
+     QRect cursorRect() const;
+@@ -110,9 +112,11 @@
+ 
+ public slots:
+     void setPlainText(const QString &text);
++%If (PyQt_Clipboard)
+     void cut();
+     void copy();
+     void paste();
++%End
+     void undo();
+     void redo();
+     void clear();
+@@ -145,16 +149,22 @@
+     virtual void mouseReleaseEvent(QMouseEvent *e);
+     virtual void mouseDoubleClickEvent(QMouseEvent *e);
+     virtual bool focusNextPrevChild(bool next);
++%If (PyQt_ContextMenu)
+     virtual void contextMenuEvent(QContextMenuEvent *e);
++%End
++%If (PyQt_DragAndDrop)
+     virtual void dragEnterEvent(QDragEnterEvent *e);
+     virtual void dragLeaveEvent(QDragLeaveEvent *e);
+     virtual void dragMoveEvent(QDragMoveEvent *e);
+     virtual void dropEvent(QDropEvent *e);
++%End
+     virtual void focusInEvent(QFocusEvent *e);
+     virtual void focusOutEvent(QFocusEvent *e);
+     virtual void showEvent(QShowEvent *);
+     virtual void changeEvent(QEvent *e);
++%If (PyQt_WheelEvent)
+     virtual void wheelEvent(QWheelEvent *e);
++%End
+     virtual void inputMethodEvent(QInputMethodEvent *);
+ 
+ public:
+diff -ur PyQt-x11-gpl-4.9.6/sip/QtGui/qpushbutton.sip pyqt-4.9.6/sip/QtGui/qpushbutton.sip
+--- PyQt-x11-gpl-4.9.6/sip/QtGui/qpushbutton.sip	2012-12-08 13:51:38.000000000 +0400
++++ pyqt-4.9.6/sip/QtGui/qpushbutton.sip	2013-04-24 14:14:54.267000018 +0400
+@@ -44,13 +44,17 @@
+     void setAutoDefault(bool);
+     bool isDefault() const;
+     void setDefault(bool);
++%If (PyQt_Menu)
+     void setMenu(QMenu *menu /KeepReference/);
+     QMenu *menu() const;
++%End
+     void setFlat(bool);
+     bool isFlat() const;
+ 
+ public slots:
++%If (PyQt_Menu)
+     void showMenu();
++%End
+ 
+ protected:
+ %If (Qt_4_3_0 -)
+diff -ur PyQt-x11-gpl-4.9.6/sip/QtGui/qregion.sip pyqt-4.9.6/sip/QtGui/qregion.sip
+--- PyQt-x11-gpl-4.9.6/sip/QtGui/qregion.sip	2012-12-08 13:51:38.000000000 +0400
++++ pyqt-4.9.6/sip/QtGui/qregion.sip	2013-04-24 14:14:54.282000018 +0400
+@@ -156,5 +156,7 @@
+ %End
+ };
+ 
++%If (PyQt_DataStream)
+ QDataStream &operator<<(QDataStream &, const QRegion & /Constrained/);
+ QDataStream &operator>>(QDataStream &, QRegion & /Constrained/);
++%End
+diff -ur PyQt-x11-gpl-4.9.6/sip/QtGui/qscrollbar.sip pyqt-4.9.6/sip/QtGui/qscrollbar.sip
+--- PyQt-x11-gpl-4.9.6/sip/QtGui/qscrollbar.sip	2012-12-08 13:51:38.000000000 +0400
++++ pyqt-4.9.6/sip/QtGui/qscrollbar.sip	2013-04-24 14:24:33.684000018 +0400
+@@ -47,7 +47,9 @@
+     virtual void mouseReleaseEvent(QMouseEvent *);
+     virtual void mouseMoveEvent(QMouseEvent *);
+     virtual void hideEvent(QHideEvent *);
++%If (PyQt_ContextMenu)
+     virtual void contextMenuEvent(QContextMenuEvent *);
++%End
+ %If (Qt_5_0_0 -)
+     virtual void wheelEvent(QWheelEvent *);
+ %End
+diff -ur PyQt-x11-gpl-4.9.6/sip/QtGui/qstandarditemmodel.sip pyqt-4.9.6/sip/QtGui/qstandarditemmodel.sip
+--- PyQt-x11-gpl-4.9.6/sip/QtGui/qstandarditemmodel.sip	2012-12-08 13:51:38.000000000 +0400
++++ pyqt-4.9.6/sip/QtGui/qstandarditemmodel.sip	2013-04-24 14:14:54.197000018 +0400
+@@ -56,8 +56,10 @@
+     virtual Qt::ItemFlags flags(const QModelIndex &index) const;
+     void clear();
+ %If (Qt_4_2_0 -)
++%If (PyQt_DragAndDrop)
+     virtual Qt::DropActions supportedDropActions() const;
+ %End
++%End
+ %If (Qt_4_2_0 -)
+     virtual QMap<int, QVariant> itemData(const QModelIndex &index) const;
+ %End
+@@ -208,9 +210,15 @@
+     virtual void setData(const QVariant &value, int role = Qt::UserRole+1);
+     QString text() const;
+     QIcon icon() const;
++%If (PyQt_ToolTip)
+     QString toolTip() const;
++%End
++%If (PyQt_StatusTip)
+     QString statusTip() const;
++%End
++%If (PyQt_WhatsThis)
+     QString whatsThis() const;
++%End
+     QSize sizeHint() const;
+     QFont font() const;
+     Qt::Alignment textAlignment() const;
+@@ -231,10 +239,12 @@
+     void setCheckable(bool checkable);
+     bool isTristate() const;
+     void setTristate(bool tristate);
++%If (PyQt_DragAndDrop)
+     bool isDragEnabled() const;
+     void setDragEnabled(bool dragEnabled);
+     bool isDropEnabled() const;
+     void setDropEnabled(bool dropEnabled);
++%End
+     QStandardItem *parent() const;
+     int row() const;
+     int column() const;
+@@ -270,14 +280,22 @@
+     };
+ 
+     virtual int type() const;
++%If (PyQt_DataStream)
+     virtual void read(QDataStream &in);
+     virtual void write(QDataStream &out) const;
++%End
+     virtual bool operator<(const QStandardItem &other /NoCopy/) const;
+     void setText(const QString &atext);
+     void setIcon(const QIcon &aicon);
++%If (PyQt_ToolTip)
+     void setToolTip(const QString &atoolTip);
++%End
++%If (PyQt_StatusTip)
+     void setStatusTip(const QString &astatusTip);
++%End
++%If (PyQt_WhatsThis)
+     void setWhatsThis(const QString &awhatsThis);
++%End
+     void setSizeHint(const QSize &asizeHint);
+     void setFont(const QFont &afont);
+     void setTextAlignment(Qt::Alignment atextAlignment);
+@@ -304,9 +322,11 @@
+ };
+ 
+ %End
++%If (PyQt_DataStream)
+ %If (Qt_4_2_0 -)
+ QDataStream &operator>>(QDataStream &in, QStandardItem &item /Constrained/);
+ %End
+ %If (Qt_4_2_0 -)
+ QDataStream &operator<<(QDataStream &out, const QStandardItem &item /Constrained/);
+ %End
++%End
+diff -ur PyQt-x11-gpl-4.9.6/sip/QtGui/qtextformat.sip pyqt-4.9.6/sip/QtGui/qtextformat.sip
+--- PyQt-x11-gpl-4.9.6/sip/QtGui/qtextformat.sip	2012-12-08 13:51:38.000000000 +0400
++++ pyqt-4.9.6/sip/QtGui/qtextformat.sip	2013-04-24 14:14:54.240000018 +0400
+@@ -60,8 +60,10 @@
+ %End
+ };
+ 
++%If (PyQt_DataStream)
+ QDataStream &operator<<(QDataStream &, const QTextLength & /Constrained/);
+ QDataStream &operator>>(QDataStream &, QTextLength & /Constrained/);
++%End
+ 
+ class QTextFormat
+ {
+@@ -327,8 +329,10 @@
+ %End
+ };
+ 
++%If (PyQt_DataStream)
+ QDataStream &operator<<(QDataStream &, const QTextFormat & /Constrained/);
+ QDataStream &operator>>(QDataStream &, QTextFormat & /Constrained/);
++%End
+ 
+ class QTextCharFormat : QTextFormat
+ {
+diff -ur PyQt-x11-gpl-4.9.6/sip/QtGui/QtGuimod.sip pyqt-4.9.6/sip/QtGui/QtGuimod.sip
+--- PyQt-x11-gpl-4.9.6/sip/QtGui/QtGuimod.sip	2012-12-08 13:51:39.000000000 +0400
++++ pyqt-4.9.6/sip/QtGui/QtGuimod.sip	2013-04-24 17:50:50.951000020 +0400
+@@ -57,6 +57,24 @@
+ 
+ %DefaultSupertype sip.simplewrapper
+ 
++%Feature PyQt_ButtonGroup
++%Feature PyQt_Clipboard
++%Feature PyQt_ContextMenu
++%Feature PyQt_Cursor
++%Feature PyQt_DataStream
++%Feature PyQt_DockWidget
++%Feature PyQt_DragAndDrop
++%Feature PyQt_GraphicsView
++%Feature PyQt_Menu
++%Feature PyQt_MenuBar
++%Feature PyQt_RubberBand
++%Feature PyQt_StatusBar
++%Feature PyQt_TabBar
++%Feature PyQt_TabWidget
++%Feature PyQt_ToolBar
++%Feature PyQt_WheelEvent
++%Feature PyQt_Shortcut
++
+ %Include qabstractbutton.sip
+ %Include qabstractitemdelegate.sip
+ %Include qabstractitemview.sip
+diff -ur PyQt-x11-gpl-4.9.6/sip/QtGui/qtransform.sip pyqt-4.9.6/sip/QtGui/qtransform.sip
+--- PyQt-x11-gpl-4.9.6/sip/QtGui/qtransform.sip	2012-12-08 13:51:38.000000000 +0400
++++ pyqt-4.9.6/sip/QtGui/qtransform.sip	2013-04-24 14:14:54.190000018 +0400
+@@ -122,12 +122,14 @@
+ };
+ 
+ %End
++%If (PyQt_DataStream)
+ %If (Qt_4_3_0 -)
+ QDataStream &operator<<(QDataStream &, const QTransform & /Constrained/);
+ %End
+ %If (Qt_4_3_0 -)
+ QDataStream &operator>>(QDataStream &, QTransform & /Constrained/);
+ %End
++%End
+ %If (Qt_4_3_0 -)
+ QPoint operator*(const QPoint &p, const QTransform &m);
+ %End
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
+diff -ur PyQt-x11-gpl-4.9.6/sip/QtGui/qworkspace.sip pyqt-4.9.6/sip/QtGui/qworkspace.sip
+--- PyQt-x11-gpl-4.9.6/sip/QtGui/qworkspace.sip	2012-12-08 13:51:38.000000000 +0400
++++ pyqt-4.9.6/sip/QtGui/qworkspace.sip	2013-04-24 14:14:54.211000018 +0400
+@@ -79,7 +79,9 @@
+     virtual bool eventFilter(QObject *, QEvent *);
+     virtual void showEvent(QShowEvent *e);
+     virtual void hideEvent(QHideEvent *e);
++%If (PyQt_WheelEvent)
+     virtual void wheelEvent(QWheelEvent *e);
++%End
+ 
+ private:
+     QWorkspace(const QWorkspace &);
+diff -ur PyQt-x11-gpl-4.9.6/sip/QtSql/qsqldriver.sip pyqt-4.9.6/sip/QtSql/qsqldriver.sip
+--- PyQt-x11-gpl-4.9.6/sip/QtSql/qsqldriver.sip	2012-12-08 13:51:38.000000000 +0400
++++ pyqt-4.9.6/sip/QtSql/qsqldriver.sip	2013-04-24 14:14:54.182000018 +0400
+@@ -37,11 +37,15 @@
+             sipTypeDef **type;
+             int yes, no;
+         } graph[] = {
++#if defined(SIP_FEATURE_PyQt_ItemViews)
+             {sipName_QSqlQueryModel,	&sipType_QSqlQueryModel,	3, 1},
+             {sipName_QSqlRelationalDelegate,	&sipType_QSqlRelationalDelegate,	-1, 2},
++#endif
+             {sipName_QSqlDriver,	&sipType_QSqlDriver,	-1, -1},
++#if defined(SIP_FEATURE_PyQt_ItemViews)
+             {sipName_QSqlTableModel,	&sipType_QSqlTableModel,	4, -1},
+             {sipName_QSqlRelationalTableModel,	&sipType_QSqlRelationalTableModel,	-1, -1},
++#endif
+         };
+     
+         int i = 0;
+diff -ur PyQt-x11-gpl-4.9.6/sip/QtSql/QtSqlmod.sip pyqt-4.9.6/sip/QtSql/QtSqlmod.sip
+--- PyQt-x11-gpl-4.9.6/sip/QtSql/QtSqlmod.sip	2012-12-08 13:51:38.000000000 +0400
++++ pyqt-4.9.6/sip/QtSql/QtSqlmod.sip	2013-04-24 18:03:22.426000018 +0400
+@@ -58,6 +58,8 @@
+ 
+ %DefaultSupertype sip.simplewrapper
+ 
++%Feature PyQt_ItemViews
++
+ %Include qsql.sip
+ %Include qsqldatabase.sip
+ %Include qsqldriver.sip
+@@ -65,9 +67,15 @@
+ %Include qsqlfield.sip
+ %Include qsqlindex.sip
+ %Include qsqlquery.sip
+-%Include qsqlquerymodel.sip
++%If (PyQt_ItemViews)
++  %Include qsqlquerymodel.sip
++%End
+ %Include qsqlrecord.sip
+-%Include qsqlrelationaldelegate.sip
+-%Include qsqlrelationaltablemodel.sip
+-%Include qsqlresult.sip
+-%Include qsqltablemodel.sip
++%If (PyQt_ItemViews)
++  %Include qsqlrelationaldelegate.sip
++  %Include qsqlrelationaltablemodel.sip
++%End
++  %Include qsqlresult.sip
++%If (PyQt_ItemViews)
++  %Include qsqltablemodel.sip
++%End
+diff -ur PyQt-x11-gpl-4.9.6/sip/QtSvg/QtSvgmod.sip pyqt-4.9.6/sip/QtSvg/QtSvgmod.sip
+--- PyQt-x11-gpl-4.9.6/sip/QtSvg/QtSvgmod.sip	2012-12-08 13:51:38.000000000 +0400
++++ pyqt-4.9.6/sip/QtSvg/QtSvgmod.sip	2013-04-24 14:14:54.160000018 +0400
+@@ -56,7 +56,15 @@
+ 
+ %DefaultSupertype sip.simplewrapper
+ 
+-%Include qgraphicssvgitem.sip
+-%Include qsvggenerator.sip
+-%Include qsvgrenderer.sip
+-%Include qsvgwidget.sip
++%If (PyQt_GraphicsSVGItem)
++  %Include qgraphicssvgitem.sip
++%End
++%If (PyQt_SVGGenerator)
++  %Include qsvggenerator.sip
++%End
++%If (PyQt_SVGRenderer)
++  %Include qsvgrenderer.sip
++%End
++%If (PyQt_SVGWidget)
++  %Include qsvgwidget.sip
++%End
diff --git a/package/pyqt/pyqt.mk b/package/pyqt/pyqt.mk
new file mode 100644
index 0000000..6c3ccfb
--- /dev/null
+++ b/package/pyqt/pyqt.mk
@@ -0,0 +1,63 @@
+#############################################################
+#
+# PyQT Open Source Edition for Qt Embedded (QWS)
+#
+#############################################################
+PYQT_VERSION = 4.9.6
+PYQT_SOURCE = PyQt-x11-gpl-$(PYQT_VERSION).tar.gz
+PYQT_SITE = http://sourceforge.net/projects/pyqt/files/PyQt4/PyQt-$(PYQT_VERSION)
+
+################################################
+# TARGET
+
+PYQT_DEPENDENCIES = sip qt
+
+define PYQT_CONFIGURE_CMDS
+    echo "Construting qtdirs"
+    echo $(STAGING_DIR)/usr             > $(@D)/qtdirs.out
+    echo $(STAGING_DIR)/usr/include    >> $(@D)/qtdirs.out
+    echo $(STAGING_DIR)/usr/lib        >> $(@D)/qtdirs.out
+    echo $(HOST_DIR)/usr/bin           >> $(@D)/qtdirs.out
+    echo $(STAGING_DIR)/usr            >> $(@D)/qtdirs.out
+    echo $(STAGING_DIR)/usr/plugins    >> $(@D)/qtdirs.out
+
+    echo 264196                >> $(@D)/qtdirs.out
+    echo 8                     >> $(@D)/qtdirs.out
+    echo Open Source           >> $(@D)/qtdirs.out
+    echo shared                >> $(@D)/qtdirs.out
+    echo PyQt_Accessibility    >> $(@D)/qtdirs.out
+    echo PyQt_SessionManager   >> $(@D)/qtdirs.out
+    echo PyQt_qreal_double     >> $(@D)/qtdirs.out
+    echo PyQt_OpenSSL          >> $(@D)/qtdirs.out
+    echo PyQt_Shortcut         >> $(@D)/qtdirs.out
+    echo PyQt_ButtonGroup      >> $(@D)/qtdirs.out
+    echo PyQt_RawFont          >> $(@D)/qtdirs.out
+    echo WS_MACX               >> $(@D)/qtdirs.out
+    echo WS_WIN                >> $(@D)/qtdirs.out
+
+    ( cd $(@D); \
+	echo "TARGET_DIR=$(TARGET_DIR)" \
+	echo "HOST_DIR=$(HOST_DIR)" \
+	echo "BUILD_DIR=$(BUILD_DIR)" \
+	echo "PyQT Configuring Target DIR=`pwd`"; \
+	PATH=$$PATH:$(HOST_DIR)/usr/bin \
+	CROSS_SIPCONFIG=$(BUILD_DIR)/sip-$(SIP_VERSION)/ \
+	QMAKESPEC=$(BUILD_DIR)/qt-$(QT_VERSION)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++ \
+	LD_LIBRARY_PATH=$(HOST_DIR)/lib $(HOST_DIR)/usr/bin/python configure.py \
+		-b $(TARGET_DIR)/usr/bin \
+		-d $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+		-l $(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)  \
+		-m $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/config \
+		-q $(HOST_DIR)/usr/bin/qmake \
+		-v $(TARGET_DIR)/usr/share/sip/PyQt4 \
+		-w --confirm-license \
+    )
+endef
+
+define PYQT_INSTALL_TARGET_CMDS
+# TODO copy only needed files  DESTDIR=
+    PATH="$(PATH):$(HOST_DIR)/usr/bin"  $(MAKE1) install -C $(@D)
+    touch $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/PyQt4/__init__.py
+endef
+
+$(eval $(autotools-package))
--
1.8.3.2
