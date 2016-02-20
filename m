From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 23:09:26 +0100
Subject: [Buildroot] [PATCH/next 21/31]
	package/kodi-screensaver-matrixtrails: new package
In-Reply-To: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456006176-21308-22-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-screensaver-matrixtrails/0001-cmake.patch | 33 ++++++++++++++++++++++
 package/kodi-screensaver-matrixtrails/Config.in    | 11 ++++++++
 .../kodi-screensaver-matrixtrails.hash             |  2 ++
 .../kodi-screensaver-matrixtrails.mk               | 14 +++++++++
 package/kodi/Config.in                             |  1 +
 5 files changed, 61 insertions(+)
 create mode 100644 package/kodi-screensaver-matrixtrails/0001-cmake.patch
 create mode 100644 package/kodi-screensaver-matrixtrails/Config.in
 create mode 100644 package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
 create mode 100644 package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk

diff --git a/package/kodi-screensaver-matrixtrails/0001-cmake.patch b/package/kodi-screensaver-matrixtrails/0001-cmake.patch
new file mode 100644
index 0000000..6307544
--- /dev/null
+++ b/package/kodi-screensaver-matrixtrails/0001-cmake.patch
@@ -0,0 +1,33 @@
+fix linking against libsoil
+
+Patch sent upstream
+https://github.com/notspiff/screensaver.matrixtrails/pull/3
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr screensaver.matrixtrails-16057e7195f930109f0a4aea999296ca315700e5.org/CMakeLists.txt screensaver.matrixtrails-16057e7195f930109f0a4aea999296ca315700e5/CMakeLists.txt
+--- screensaver.matrixtrails-16057e7195f930109f0a4aea999296ca315700e5.org/CMakeLists.txt	2015-10-29 08:05:30.000000000 +0100
++++ screensaver.matrixtrails-16057e7195f930109f0a4aea999296ca315700e5/CMakeLists.txt	2015-10-30 22:33:25.000000000 +0100
+@@ -18,7 +18,7 @@
+                          src/main.cpp
+                          src/matrixtrails.cpp)
+ 
+-set(DEPLIBS ${SOIL_LIBRARIES})
++set(DEPLIBS ${SOIL_LIBRARY})
+ 
+ build_addon(screensaver.matrixtrails MATRIXTRAILS DEPLIBS)
+ 
+diff -uNr screensaver.matrixtrails-16057e7195f930109f0a4aea999296ca315700e5.org/FindSOIL.cmake screensaver.matrixtrails-16057e7195f930109f0a4aea999296ca315700e5/FindSOIL.cmake
+--- screensaver.matrixtrails-16057e7195f930109f0a4aea999296ca315700e5.org/FindSOIL.cmake	2015-10-29 08:05:30.000000000 +0100
++++ screensaver.matrixtrails-16057e7195f930109f0a4aea999296ca315700e5/FindSOIL.cmake	2015-10-30 22:37:10.627094287 +0100
+@@ -1,7 +1,7 @@
+ find_path(SOIL_INCLUDE_DIRS SOIL/SOIL.h)
+-find_library(SOIL_LIBRARIES NAMES SOIL)
++find_library(SOIL_LIBRARY NAMES SOIL)
+ 
+ include(FindPackageHandleStandardArgs)
+-find_package_handle_standard_args(SOIL DEFAULT_MSG SOIL_INCLUDE_DIRS SOIL_LIBRARIES)
++find_package_handle_standard_args(SOIL DEFAULT_MSG SOIL_INCLUDE_DIRS SOIL_LIBRARY)
+ 
+-mark_as_advanced(SOIL_INCLUDE_DIRS SOIL_LIBRARIES)
++mark_as_advanced(SOIL_INCLUDE_DIRS SOIL_LIBRARY)
diff --git a/package/kodi-screensaver-matrixtrails/Config.in b/package/kodi-screensaver-matrixtrails/Config.in
new file mode 100644
index 0000000..72ed958
--- /dev/null
+++ b/package/kodi-screensaver-matrixtrails/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_KODI_SCREENSAVER_MATRIXTRAILS
+	bool "kodi-screensaver-matrixtrails"
+	depends on BR2_PACKAGE_KODI_GL # libsoil
+	select BR2_PACKAGE_LIBSOIL
+	help
+	  Matrix trails screensaver for Kodi
+
+	  https://github.com/notspiff/screensaver.matrixtrails
+
+comment "matrixtrails needs an OpenGL backend"
+	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
new file mode 100644
index 0000000..5b610c0
--- /dev/null
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 91990a29072cf85f4b9253a16a362d83fdfcc7595de796d982a189aa8618555c kodi-screensaver-matrixtrails-16057e7195f930109f0a4aea999296ca315700e5.tar.gz
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
new file mode 100644
index 0000000..5ecacdf
--- /dev/null
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# kodi-screensaver-matrixtrails
+#
+################################################################################
+
+KODI_SCREENSAVER_MATRIXTRAILS_VERSION = 16057e7195f930109f0a4aea999296ca315700e5
+KODI_SCREENSAVER_MATRIXTRAILS_SITE = $(call github,notspiff,screensaver.matrixtrails,$(KODI_SCREENSAVER_MATRIXTRAILS_VERSION))
+KODI_SCREENSAVER_MATRIXTRAILS_LICENSE = GPLv2+
+KODI_SCREENSAVER_MATRIXTRAILS_LICENSE_FILES = src/matrixtrails.cpp
+
+KODI_SCREENSAVER_MATRIXTRAILS_DEPENDENCIES = kodi libsoil
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 1b7c673..cb8438b 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -269,6 +269,7 @@ menu "Screensavers"
 	source "package/kodi-screensaver-cpblobs/Config.in"
 	source "package/kodi-screensaver-crystalmorph/Config.in"
 	source "package/kodi-screensaver-greynetic/Config.in"
+	source "package/kodi-screensaver-matrixtrails/Config.in"
 	source "package/kodi-screensaver-pingpong/Config.in"
 	source "package/kodi-screensaver-pyro/Config.in"
 	source "package/kodi-screensaver-rsxs/Config.in"
-- 
2.7.0
