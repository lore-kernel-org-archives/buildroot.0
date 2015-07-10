From: Julien Corjon <corjon.j@ecagroup.com>
Date: Fri, 10 Jul 2015 16:20:21 +0200
Subject: [Buildroot] [PATCH v3 4/5] qt5webengine: new package
In-Reply-To: <1436538022-18924-1-git-send-email-corjon.j@ecagroup.com>
References: <1436380555-13657-3-git-send-email-corjon.j@ecagroup.com>
 <1436538022-18924-1-git-send-email-corjon.j@ecagroup.com>
Message-ID: <1436538022-18924-4-git-send-email-corjon.j@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
---
 package/qt5/Config.in                              |  1 +
 .../qt5webengine/0001-allow_all_linux_gxx.patch    | 16 +++++
 .../0002-switch_float_abi_for_arm_to_hard.patch    | 39 ++++++++++++
 package/qt5/qt5webengine/Config.in                 | 19 ++++++
 package/qt5/qt5webengine/qt5webengine.hash         |  4 ++
 package/qt5/qt5webengine/qt5webengine.mk           | 69 ++++++++++++++++++++++
 6 files changed, 148 insertions(+)
 create mode 100644 package/qt5/qt5webengine/0001-allow_all_linux_gxx.patch
 create mode 100644 package/qt5/qt5webengine/0002-switch_float_abi_for_arm_to_hard.patch
 create mode 100644 package/qt5/qt5webengine/Config.in
 create mode 100644 package/qt5/qt5webengine/qt5webengine.hash
 create mode 100644 package/qt5/qt5webengine/qt5webengine.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 737a789..4cce323 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -40,6 +40,7 @@ source "package/qt5/qt5quickcontrols/Config.in"
 source "package/qt5/qt5sensors/Config.in"
 source "package/qt5/qt5serialport/Config.in"
 source "package/qt5/qt5svg/Config.in"
+source "package/qt5/qt5webengine/Config.in"
 source "package/qt5/qt5websockets/Config.in"
 source "package/qt5/qt5x11extras/Config.in"
 source "package/qt5/qt5xmlpatterns/Config.in"
diff --git a/package/qt5/qt5webengine/0001-allow_all_linux_gxx.patch b/package/qt5/qt5webengine/0001-allow_all_linux_gxx.patch
new file mode 100644
index 0000000..62c5a34
--- /dev/null
+++ b/package/qt5/qt5webengine/0001-allow_all_linux_gxx.patch
@@ -0,0 +1,16 @@
+Index: qt5webengine-5.5.0/tools/qmake/mkspecs/features/functions.prf
+===================================================================
+--- qt5webengine-5.5.0.orig/tools/qmake/mkspecs/features/functions.prf
++++ qt5webengine-5.5.0/tools/qmake/mkspecs/features/functions.prf
+@@ -12,9 +12,9 @@ defineTest(isPlatformSupported) {
+     return(false)
+   }
+ 
+-  linux-g++*:!isGCCVersionSupported(): return(false)
++  linux*g++*:!isGCCVersionSupported(): return(false)
+   !isPythonVersionSupported(): return(false)
+-  linux-g++*|win32-msvc2013|macx-clang: return(true)
++  linux*g++*|win32-msvc2013|macx-clang: return(true)
+   boot2qt: return(true)
+ 
+   skipBuild("Qt WebEngine can currently only be built for Linux (GCC), Windows (MSVC 2013), OS X (XCode 5.1+) or Qt for Device Creation.")
diff --git a/package/qt5/qt5webengine/0002-switch_float_abi_for_arm_to_hard.patch b/package/qt5/qt5webengine/0002-switch_float_abi_for_arm_to_hard.patch
new file mode 100644
index 0000000..6210a13
--- /dev/null
+++ b/package/qt5/qt5webengine/0002-switch_float_abi_for_arm_to_hard.patch
@@ -0,0 +1,39 @@
+commit 779d02564f64654487db059f71c7e8257a851397
+Author: sbc <sbc@chromium.org>
+Date:   Sun May 17 16:52:45 2015 -0700
+
+    Switch default float-abi for ARM linux from softfp to hard
+    
+    All the ARM linux builders already specify this, and
+    armhf is the now the default for both Ubuntu and Debian.
+    
+    Followup cleanup cl for the bots:
+    https://codereview.chromium.org/1141643004/
+    
+    BUG=308256
+    
+    Review URL: https://codereview.chromium.org/1140503004
+    
+    Cr-Original-Commit-Position: refs/heads/master@{#330316}
+    Cr-Mirrored-From: https://chromium.googlesource.com/chromium/src
+    Cr-Mirrored-Commit: ff8ec298fd273181647ec4d94c032343382dbe57
+
+diff --git a/common.gypi b/common.gypi
+index cd9f5b7..2f5ea2d 100644
+--- a/common.gypi
++++ b/common.gypi
+@@ -2311,9 +2311,12 @@
+           }, {
+             'arm_fpu%': 'vfpv3-d16',
+           }],
++          ['OS=="android"', {
++            'arm_float_abi%': 'softfp',
++          }, {
++            'arm_float_abi%': 'hard',
++          }],
+         ],
+-        # Change the default to hard once the armhf transition is complete.
+-        'arm_float_abi%': 'softfp',
+         'arm_thumb%': 1,
+       }],
+ 
diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
new file mode 100644
index 0000000..39c087a
--- /dev/null
+++ b/package/qt5/qt5webengine/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_QT5WEBENGINE
+	bool "qt5webengine"
+	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_GUI
+	select BR2_PACKAGE_QT5BASE_FONTCONFIG
+	select BR2_PACKAGE_QT5BASE_DBUS
+	select BR2_PACKAGE_QT5BASE_ICU
+	select BR2_PACKAGE_QT5WEBCHANNEL
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_QT5DECLARATIVE
+	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5webengine module.
+
+	  http://qt.io
diff --git a/package/qt5/qt5webengine/qt5webengine.hash b/package/qt5/qt5webengine/qt5webengine.hash
new file mode 100644
index 0000000..b8c7e1d
--- /dev/null
+++ b/package/qt5/qt5webengine/qt5webengine.hash
@@ -0,0 +1,4 @@
+# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtwebengine-opensource-src-5.5.0.tar.xz.mirrorlist
+sha256 d703e60838744283f9a3419bdd8708f2e01d3ed81f18aaadd713342033cbd65a qtwebengine-opensource-src-5.5.0.tar.xz
+sha1   e080d91b707af6ad096e356189488ffd65115553                         qtwebengine-opensource-src-5.5.0.tar.xz
+md5    1405a87ce84ba58478f98e89ec1e737e                                 qtwebengine-opensource-src-5.5.0.tar.xz
diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
new file mode 100644
index 0000000..d091c50
--- /dev/null
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -0,0 +1,69 @@
+################################################################################
+#
+# qt5webengine
+#
+################################################################################
+
+QT5WEBENGINE_VERSION = $(QT5_VERSION)
+QT5WEBENGINE_SITE = $(QT5_SITE)
+QT5WEBENGINE_SOURCE = qtwebengine-opensource-src-$(QT5WEBENGINE_VERSION).tar.xz
+QT5WEBENGINE_DEPENDENCIES = qt5base qt5declarative qt5webchannel libcap openssl host-gperf
+QT5WEBENGINE_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5WEBENGINE_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
+# Source files contain references to LGPL_EXCEPTION.txt but it is not included
+# in the archive.
+QT5WEBENGINE_LICENSE_FILES = LICENSE.LGPLv21 LICENSE.LGPLv3 LICENSE.GPLv2
+else
+QT5WEBENGINE_LICENSE = Commercial license
+QT5WEBENGINE_REDISTRIBUTE = NO
+endif
+
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
+QT5WEBENGINE_DEPENDENCIES += qt5declarative
+endif
+
+define QT5WEBENGINE_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5WEBENGINE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5WEBENGINE_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(QT5_LA_PRL_FILES_FIXUP)
+endef
+
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
+define QT5WEBENGINE_INSTALL_TARGET_QMLS
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtWebEngine $(TARGET_DIR)/usr/qml/
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+define QT5WEBENGINE_INSTALL_TARGET_EXAMPLES
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/webengine* $(TARGET_DIR)/usr/lib/qt/examples/
+endef
+endif
+
+ifneq ($(BR2_STATIC_LIBS),y)
+define QT5WEBENGINE_INSTALL_TARGET_LIBS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebEngine*.so.* $(TARGET_DIR)/usr/lib
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/qtwebengine $(TARGET_DIR)/usr/lib/qt/plugins/
+	cp -dpf $(STAGING_DIR)/usr/libexec/QtWebEngineProcess $(TARGET_DIR)/usr/libexec/
+	cp -dpfr $(STAGING_DIR)/usr/translations/qtwebengine_locales $(TARGET_DIR)/usr/translations/
+	cp -dpf $(STAGING_DIR)/usr/qtwebengine_resources.pak $(TARGET_DIR)/usr/
+	# cp -dpf $(STAGING_DIR)/usr/icudtl.dat $(TARGET_DIR)/usr/
+endef
+endif
+
+define QT5WEBENGINE_INSTALL_TARGET_CMDS
+	$(QT5WEBENGINE_INSTALL_TARGET_LIBS)
+	$(QT5WEBENGINE_INSTALL_TARGET_QMLS)
+	$(QT5WEBENGINE_INSTALL_TARGET_EXAMPLES)
+endef
+
+$(eval $(generic-package))
-- 
2.1.0
