From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 May 2013 22:27:06 +0200
Subject: [Buildroot] [PATCH] qt5jsbackend: only available on ARM, x86,
	x86-64 and mipsel
Message-ID: <1369772826-8019-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The v8 Javascript virtual machine that is the core of qt5jsbackend is
only available on certain architectures. At the moment, only ARM, x86,
x86-64 and mipsel are supported.

Fixes:

  http://autobuild.buildroot.org/results/a2e/a2e62e2deaa28ec9d4d957523a00ee0b7a634950/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5declarative/Config.in |    4 +++-
 package/qt5/qt5jsbackend/Config.in   |    7 +++++++
 package/qt5/qt5multimedia/Config.in  |    5 ++++-
 package/qt5/qt5quick1/Config.in      |    4 +++-
 4 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/package/qt5/qt5declarative/Config.in b/package/qt5/qt5declarative/Config.in
index f862b94..9332865 100644
--- a/package/qt5/qt5declarative/Config.in
+++ b/package/qt5/qt5declarative/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_QT5DECLARATIVE
 	select BR2_PACKAGE_QT5BASE_EGLFS
 	depends on BR2_PACKAGE_HAS_OPENGL_EGL
 	depends on BR2_PACKAGE_HAS_OPENGL_ES
+	depends on BR2_PACKAGE_QT5JSBACKEND_AVAILABLE
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
@@ -15,4 +16,5 @@ config BR2_PACKAGE_QT5DECLARATIVE
 	  http://qt-project.org
 
 comment "qt5declarative requires an OpenGL-capable backend"
-	depends on !BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES
+	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES) && \
+		BR2_PACKAGE_QT5JSBACKEND_AVAILABLE
diff --git a/package/qt5/qt5jsbackend/Config.in b/package/qt5/qt5jsbackend/Config.in
index 89d5067..2f5ac1f 100644
--- a/package/qt5/qt5jsbackend/Config.in
+++ b/package/qt5/qt5jsbackend/Config.in
@@ -1,6 +1,13 @@
+config BR2_PACKAGE_QT5JSBACKEND_AVAILABLE
+	bool
+	# v8 is only available on certain architectures
+	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
+	default y
+
 config BR2_PACKAGE_QT5JSBACKEND
 	bool "qt5jsbackend"
 	select BR2_PACKAGE_QT5BASE
+	depends on BR2_PACKAGE_QT5JSBACKEND_AVAILABLE
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/qt5/qt5multimedia/Config.in b/package/qt5/qt5multimedia/Config.in
index fd36672..080cba2 100644
--- a/package/qt5/qt5multimedia/Config.in
+++ b/package/qt5/qt5multimedia/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_QT5MULTIMEDIA
 	select BR2_PACKAGE_QT5DECLARATIVE
 	depends on BR2_PACKAGE_HAS_OPENGL_EGL
 	depends on BR2_PACKAGE_HAS_OPENGL_ES
+	# qt5declarative -> qt5jsbackend
+	depends on BR2_PACKAGE_QT5JSBACKEND_AVAILABLE
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
@@ -13,4 +15,5 @@ config BR2_PACKAGE_QT5MULTIMEDIA
 	  http://qt-project.org
 
 comment "qt5multimedia requires an OpenGL-capable backend"
-	depends on !BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES
+	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES) && \
+		BR2_PACKAGE_QT5JSBACKEND_AVAILABLE
diff --git a/package/qt5/qt5quick1/Config.in b/package/qt5/qt5quick1/Config.in
index 99fd5a4..65b1f62 100644
--- a/package/qt5/qt5quick1/Config.in
+++ b/package/qt5/qt5quick1/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_QT5QUICK1
 	depends on !BR2_PREFER_STATIC_LIB
 	depends on BR2_PACKAGE_HAS_OPENGL_EGL
 	depends on BR2_PACKAGE_HAS_OPENGL_ES
+	depends on BR2_PACKAGE_QT5JSBACKEND_AVAILABLE
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
@@ -19,4 +20,5 @@ config BR2_PACKAGE_QT5QUICK1
 	  http://qt-project.org
 
 comment "qt5quick1 requires an OpenGL-capable backend"
-	depends on !BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES
+	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES) && \
+		BR2_PACKAGE_QT5JSBACKEND_AVAILABLE
-- 
1.7.9.5
