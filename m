From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Dec 2013 00:09:24 +0100
Subject: [Buildroot] [git commit] qt5: use a common option for
	JavaScriptCore dependencies
Message-ID: <20131230230946.5662D9C2A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=09f204a93734951a87d7e5dd103a328df8de4f4d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will be used by other qt packages that contain a copy of
JavaScriptCore.

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/Config.in                     |    8 ++++++++
 package/qt5/qt5declarative/Config.in      |   12 ++----------
 package/qt5/qt5graphicaleffects/Config.in |    4 ++--
 package/qt5/qt5multimedia/Config.in       |    4 ++--
 package/qt5/qt5quick1/Config.in           |    4 ++--
 package/qt5/qt5quickcontrols/Config.in    |    4 ++--
 6 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 0f89019..b62a810 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -1,3 +1,11 @@
+config BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+	bool
+	# Javascript engine is only available on certain architectures
+	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
+	# ARM needs BLX, so v5t+
+	depends on !(BR2_arm7tdmi || BR2_arm720t || BR2_arm920t || BR2_arm922t || BR2_fa526)
+	default y
+
 comment "Qt5 needs a toolchain w/ wchar, IPv6, threads, C++"
 	depends on !BR2_PACKAGE_QT
 	depends on !BR2_avr32
diff --git a/package/qt5/qt5declarative/Config.in b/package/qt5/qt5declarative/Config.in
index a1fb9a3..c5753b1 100644
--- a/package/qt5/qt5declarative/Config.in
+++ b/package/qt5/qt5declarative/Config.in
@@ -1,11 +1,3 @@
-config BR2_PACKAGE_QT5DECLARATIVE_AVAILABLE
-	bool
-	# Javascript engine is only available on certain architectures
-	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
-	# ARM needs BLX, so v5t+
-	depends on !(BR2_arm7tdmi || BR2_arm720t || BR2_arm920t || BR2_arm922t || BR2_fa526)
-	default y
-
 config BR2_PACKAGE_QT5DECLARATIVE
 	bool "qt5declarative"
 	select BR2_PACKAGE_QT5XMLPATTERNS
@@ -14,7 +6,7 @@ config BR2_PACKAGE_QT5DECLARATIVE
 	select BR2_PACKAGE_QT5BASE_EGLFS
 	depends on BR2_PACKAGE_HAS_OPENGL_EGL
 	depends on BR2_PACKAGE_HAS_OPENGL_ES
-	depends on BR2_PACKAGE_QT5DECLARATIVE_AVAILABLE
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
@@ -25,4 +17,4 @@ config BR2_PACKAGE_QT5DECLARATIVE
 
 comment "qt5declarative requires an OpenGL-capable backend"
 	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES) && \
-		BR2_PACKAGE_QT5DECLARATIVE_AVAILABLE
+		BR2_PACKAGE_QT5_JSCORE_AVAILABLE
diff --git a/package/qt5/qt5graphicaleffects/Config.in b/package/qt5/qt5graphicaleffects/Config.in
index 4958586..f4029e9 100644
--- a/package/qt5/qt5graphicaleffects/Config.in
+++ b/package/qt5/qt5graphicaleffects/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_QT5GRAPHICALEFFECTS
 	bool "qt5graphicaleffects"
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5DECLARATIVE
-	depends on BR2_PACKAGE_QT5DECLARATIVE_AVAILABLE
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on BR2_PACKAGE_HAS_OPENGL_EGL
 	depends on BR2_PACKAGE_HAS_OPENGL_ES
 	help
@@ -15,4 +15,4 @@ config BR2_PACKAGE_QT5GRAPHICALEFFECTS
 
 comment "qt5graphicaleffects requires an OpenGL-capable backend"
 	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES) && \
-		BR2_PACKAGE_QT5DECLARATIVE_AVAILABLE
+		BR2_PACKAGE_QT5_JSCORE_AVAILABLE
diff --git a/package/qt5/qt5multimedia/Config.in b/package/qt5/qt5multimedia/Config.in
index 62373e4..53b7f86 100644
--- a/package/qt5/qt5multimedia/Config.in
+++ b/package/qt5/qt5multimedia/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_QT5MULTIMEDIA
 	select BR2_PACKAGE_QT5DECLARATIVE
 	depends on BR2_PACKAGE_HAS_OPENGL_EGL
 	depends on BR2_PACKAGE_HAS_OPENGL_ES
-	depends on BR2_PACKAGE_QT5DECLARATIVE_AVAILABLE
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
@@ -15,4 +15,4 @@ config BR2_PACKAGE_QT5MULTIMEDIA
 
 comment "qt5multimedia requires an OpenGL-capable backend"
 	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES) && \
-		BR2_PACKAGE_QT5DECLARATIVE_AVAILABLE
+		BR2_PACKAGE_QT5_JSCORE_AVAILABLE
diff --git a/package/qt5/qt5quick1/Config.in b/package/qt5/qt5quick1/Config.in
index d3c71e3..1a0b8bf 100644
--- a/package/qt5/qt5quick1/Config.in
+++ b/package/qt5/qt5quick1/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_QT5QUICK1
 	depends on !BR2_PREFER_STATIC_LIB
 	depends on BR2_PACKAGE_HAS_OPENGL_EGL
 	depends on BR2_PACKAGE_HAS_OPENGL_ES
-	depends on BR2_PACKAGE_QT5DECLARATIVE_AVAILABLE
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
@@ -20,6 +20,6 @@ config BR2_PACKAGE_QT5QUICK1
 	  http://qt-project.org
 
 comment "qt5quick1 needs a toolchain w/ dynamic library and an OpenGL-capable backend"
-	depends on BR2_PACKAGE_QT5DECLARATIVE_AVAILABLE
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on !BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES || \
 		BR2_PREFER_STATIC_LIB
diff --git a/package/qt5/qt5quickcontrols/Config.in b/package/qt5/qt5quickcontrols/Config.in
index 2651328..e72f2a4 100644
--- a/package/qt5/qt5quickcontrols/Config.in
+++ b/package/qt5/qt5quickcontrols/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_QT5QUICKCONTROLS
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_NETWORK
 	select BR2_PACKAGE_QT5DECLARATIVE
-	depends on BR2_PACKAGE_QT5DECLARATIVE_AVAILABLE
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on BR2_PACKAGE_HAS_OPENGL_EGL
 	depends on BR2_PACKAGE_HAS_OPENGL_ES
 	help
@@ -16,4 +16,4 @@ config BR2_PACKAGE_QT5QUICKCONTROLS
 
 comment "qt5quickcontrols requires an OpenGL-capable backend"
 	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES) && \
-		BR2_PACKAGE_QT5DECLARATIVE_AVAILABLE
+		BR2_PACKAGE_QT5_JSCORE_AVAILABLE
