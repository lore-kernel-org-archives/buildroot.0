From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Dec 2016 23:59:08 +0100
Subject: [Buildroot] [git commit] package/qjson: upgrade to upstream 0.9.0,
	update CMakeLists.txt patch to properly apply
Message-ID: <20161202225934.9380881E49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=320baabb5587c018cc213ae1f856b3a2b4a80de8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...1-fix-Qt4-package-error-in-CMakeLists.txt.patch | 25 ++++++++++------------
 package/qjson/qjson.hash                           |  2 +-
 package/qjson/qjson.mk                             |  2 +-
 3 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/package/qjson/0001-fix-Qt4-package-error-in-CMakeLists.txt.patch b/package/qjson/0001-fix-Qt4-package-error-in-CMakeLists.txt.patch
index 6f7a9ba..a9e34e4 100644
--- a/package/qjson/0001-fix-Qt4-package-error-in-CMakeLists.txt.patch
+++ b/package/qjson/0001-fix-Qt4-package-error-in-CMakeLists.txt.patch
@@ -1,10 +1,7 @@
-From 45ec86156819c0872d023b05001682a8d2d2dc25 Mon Sep 17 00:00:00 2001
+From 254858bbf443bded2e80480e9f9032ce166b923e Mon Sep 17 00:00:00 2001
 From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
-Date: Sat, 6 Apr 2013 16:54:25 +0200
-Subject: [PATCH] fix Qt4 package error in CMakeLists.txt
-
-Avoid checking for uic executable by cmake as it results configure
-time error if QtGui isn't installed.
+Date: Fri, 2 Dec 2016 23:00:58 +0100
+Subject: [PATCH] CMake, Qt4: check specifically for QtCore, fixes #96
 
 Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
 ---
@@ -12,18 +9,18 @@ Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index adb65e9..81854b1 100644
+index 31d9987..2fde79f 100755
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -52,7 +52,7 @@ IF (Qt5Core_FOUND)
+@@ -62,7 +62,7 @@ IF (Qt5Core_FOUND)
  ELSE()
    MESSAGE ("Qt5 not found, searching for Qt4")
    # Find Qt4
--  FIND_PACKAGE( Qt4 REQUIRED )
-+  FIND_PACKAGE( Qt4 COMPONENTS QtCore REQUIRED )
- 
-   # Include the cmake file needed to use qt4
-   INCLUDE( ${QT_USE_FILE} )
+-  FIND_PACKAGE( Qt4 4.5 REQUIRED )
++  FIND_PACKAGE( Qt4 4.5 REQUIRED QtCore)
+   # QStringBuilder is supported since Qt 4.8 for both QString and QByteArray
+   IF (NOT (${QT_VERSION_MINOR} STRLESS "8"))
+     MESSAGE ("Enable QStringBuilder")
 -- 
-2.1.1
+2.7.4
 
diff --git a/package/qjson/qjson.hash b/package/qjson/qjson.hash
index 6282227..d794b48 100644
--- a/package/qjson/qjson.hash
+++ b/package/qjson/qjson.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256  863f0dd6b7199f84acf1e2487735830fab316a9a3a5e1651130ad153a231f2ed  qjson-ba273682a9d33a7b3090e74f4742b5f3bf6c9b02.tar.gz
+sha256 e812617477f3c2bb990561767a4cd8b1d3803a52018d4878da302529552610d4 qjson-0.9.0.tar.gz
diff --git a/package/qjson/qjson.mk b/package/qjson/qjson.mk
index 6a16617..dab2381 100644
--- a/package/qjson/qjson.mk
+++ b/package/qjson/qjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QJSON_VERSION = ba273682a9d33a7b3090e74f4742b5f3bf6c9b02
+QJSON_VERSION = 0.9.0
 QJSON_SITE = $(call github,flavio,qjson,$(QJSON_VERSION))
 QJSON_INSTALL_STAGING = YES
 QJSON_DEPENDENCIES = \
