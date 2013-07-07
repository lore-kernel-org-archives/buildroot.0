From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  7 Jul 2013 20:44:53 +0200
Subject: [Buildroot] [PATCH 1/3] qt{4,
	5}: add an explicit choice to express Buildroot does not support
	their coexistence
Message-ID: <1373222695-9148-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt4 and Qt5 does not provide the same APIs; they can usually coexist on the
same system.
However, Buildroot does not alllow this coexistence because of some host-tools
(qmake, etc) troubles when building qmake-based packages or projects (inside
or outside Buildroot).

So, since it is not possible to consider making a virtual package because of
the APIs' differences, add an explicit choice.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/Config.in     |  7 ++++++-
 package/Config.in.qt  | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 package/qt/Config.in  | 18 +++---------------
 package/qt5/Config.in | 21 ++++-----------------
 4 files changed, 59 insertions(+), 33 deletions(-)
 create mode 100644 package/Config.in.qt

diff --git a/package/Config.in b/package/Config.in
index 7c24dab..415f7f8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -142,10 +142,12 @@ source "package/sdl_gfx/Config.in"
 
 comment "other GUIs"
 source "package/efl/Config.in"
-source "package/qt/Config.in"
+
+source "package/Config.in.qt"
 
 if BR2_PACKAGE_QT
 comment "QT libraries and helper libraries"
+source "package/qt/Config.in"
 source "package/grantlee/Config.in"
 source "package/qextserialport/Config.in"
 source "package/qjson/Config.in"
@@ -153,7 +155,10 @@ source "package/qtuio/Config.in"
 source "package/qwt/Config.in"
 endif
 
+if BR2_PACKAGE_QT5
 source "package/qt5/Config.in"
+endif
+
 source "package/x11r7/Config.in"
 source "package/weston/Config.in"
 
diff --git a/package/Config.in.qt b/package/Config.in.qt
new file mode 100644
index 0000000..a61bd81
--- /dev/null
+++ b/package/Config.in.qt
@@ -0,0 +1,46 @@
+choice
+	prompt "Qt library"
+	default BR2_PACKAGE_QT_NONE
+	help
+	  Qt4 and Qt5 provide different set of APIs, so they are not equivalent.
+	  They usually may coexist on the same system, but not in Buildroot because
+	  host-tools like qmake are not properly handled between those two
+	  versions.
+
+	  This host-tools issue cause troubles when building project using qmake.
+
+	  So, there is an explicit choice for what version of Qt should be build by
+	  Buildroot.
+
+config BR2_PACKAGE_QTNONE
+	bool "none"
+
+comment "Qt4 requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_QT
+	bool "Qt4"
+	depends on !BR2_avr32 # lacks TLS
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  http://qt-project.org
+
+comment "Qt5 needs a toolchain with WCHAR, IPv6, thread and C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_QT5
+	bool "Qt5"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
+	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  This option enables the Qt5 framework. Sub-options allow to
+	  select which modules should be built.
+
+	  http://qt-project.org
+
+endchoice
diff --git a/package/qt/Config.in b/package/qt/Config.in
index 9f6e54d..fe92838 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -1,17 +1,5 @@
-comment "qt requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
-
-menuconfig BR2_PACKAGE_QT
-	bool "Qt"
-	depends on !BR2_avr32 # lacks TLS
-	depends on BR2_INSTALL_LIBSTDCPP
-	help
-	  Qt is a cross-platform application and UI framework for
-	  developers using C++.
-
-	  http://qt-project.org
-
-if BR2_PACKAGE_QT
+menu "Qt4"
+	depends on BR2_PACKAGE_QT
 
 config BR2_PACKAGE_QT_DEBUG
 	bool "Compile with debug support"
@@ -392,4 +380,4 @@ config BR2_PACKAGE_QT_DECLARATIVE
 	  Build the Qt Declarative Module for qml support
 	  if unsure, say n.
 
-endif # BR2_PACKAGE_QT
+endmenu
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 2945d96..fef988c 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -1,20 +1,6 @@
-comment "Qt5 needs a toolchain with WCHAR, IPv6, thread and C++ support"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
+menu "Qt5"
+	depends on BR2_PACKAGE_QT5
 
-menuconfig BR2_PACKAGE_QT5
-	bool "Qt5"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR
-	depends on BR2_INET_IPV6
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_PACKAGE_QT
-	help
-	  This option enables the Qt5 framework. Sub-options allow to
-	  select which modules should be built.
-
-	  http://qt-project.org
-
-if BR2_PACKAGE_QT5
 source "package/qt5/qt5base/Config.in"
 source "package/qt5/qt5declarative/Config.in"
 source "package/qt5/qt5graphicaleffects/Config.in"
@@ -26,4 +12,5 @@ source "package/qt5/qt5script/Config.in"
 source "package/qt5/qt5svg/Config.in"
 source "package/qt5/qt5webkit/Config.in"
 source "package/qt5/qt5xmlpatterns/Config.in"
-endif
+
+endmenu
-- 
1.8.3.2
