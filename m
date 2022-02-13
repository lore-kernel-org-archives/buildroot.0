Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA32C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 11:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9467740305;
	Sun, 13 Feb 2022 11:47:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZJHGfClta3mL; Sun, 13 Feb 2022 11:47:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4054740309;
	Sun, 13 Feb 2022 11:47:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB7E91BF842
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B61AD81762
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:47:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hVvzZBXc_sjD for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 11:47:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C284814BA
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 11:47:27 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout06.t-online.de (Postfix) with SMTP id 2174C1B8EE
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 12:47:25 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.189.21]) by fwd86.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nJDLe-2JRTlJ0; Sun, 13 Feb 2022 12:47:22 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:37680)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nJDLd-00029g-M0
 for buildroot@buildroot.org; Sun, 13 Feb 2022 12:47:21 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 12:47:21 +0100
Message-Id: <20220213114721.2738803-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1644752842-000116DC-41FA404F/0/0 CLEAN NORMAL
X-TOI-MSGID: 83a7da83-215b-40fd-a60c-f0d027e7ab05
Subject: [Buildroot] [PATCH v2 1/1] package/kodi: fix build with python-3.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes build error:

CMake Error at /usr/share/cmake-3.18/Modules/FindPackageHandleStandardArgs.cmake:165 (message):
  Could NOT find PythonLibs (missing: PYTHON_LIBRARIES) (found suitable
  version "3.10.2", minimum required is "3.5")

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: fixed typo in PYTHON_EXECUTABLE configure option (usr/bin/ -> bin/)

 package/kodi/0002-cmake-findpython.patch      | 135 ++++++++++++++++++
 ...-cmake-search-for-python-interpreter.patch |  48 +++++++
 ...-allow-to-override-PYTHON_EXECUTABLE.patch |  39 +++++
 package/kodi/kodi.mk                          |   4 +
 4 files changed, 226 insertions(+)
 create mode 100644 package/kodi/0002-cmake-findpython.patch
 create mode 100644 package/kodi/0003-cmake-search-for-python-interpreter.patch
 create mode 100644 package/kodi/0004-cmake-allow-to-override-PYTHON_EXECUTABLE.patch

diff --git a/package/kodi/0002-cmake-findpython.patch b/package/kodi/0002-cmake-findpython.patch
new file mode 100644
index 0000000000..60728aa465
--- /dev/null
+++ b/package/kodi/0002-cmake-findpython.patch
@@ -0,0 +1,135 @@
+From 52f44ec5c7b728a6afaca867e8d815fced2012ec Mon Sep 17 00:00:00 2001
+From: fuzzard <fuzzard@kodi.tv>
+Date: Sat, 31 Jul 2021 19:22:08 +1000
+Subject: [PATCH] [cmake] findpython
+
+use cmakes (3.12+) FindPython3 module.
+Provide cmake vars for user to overide specific version, and search path
+
+Backport of https://github.com/xbmc/xbmc/pull/20045
+
+Patch sent upstream: https://github.com/xbmc/xbmc/pull/20989
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ CMakeLists.txt                 |  4 +-
+ cmake/modules/FindPython.cmake | 71 ++++++++++++++++++++++++++--------
+ 2 files changed, 56 insertions(+), 19 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2d5369798d..9bed54ef40 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.4)
++cmake_minimum_required(VERSION 3.12)
+ if(WIN32)
+   # Version 3.15 is required to use "PREPEND" for dependencies
+   cmake_minimum_required(VERSION 3.15)
+@@ -187,8 +187,6 @@ core_require_dep(${required_deps})
+ find_package(TexturePacker REQUIRED)
+ find_package(JsonSchemaBuilder REQUIRED)
+ 
+-SET(PYTHON_VERSION 3.8)
+-
+ if(ENABLE_MARIADBCLIENT AND NOT ENABLE_MARIADBCLIENT STREQUAL AUTO AND ENABLE_MYSQLCLIENT AND NOT ENABLE_MYSQLCLIENT STREQUAL AUTO)
+   MESSAGE(FATAL_ERROR "You can not use MySql and MariaDB at the same time. Disable one by adding -DENABLE_MYSQLCLIENT=OFF or -DENABLE_MARIADBCLIENT=OFF.")
+ elseif(ENABLE_MYSQLCLIENT AND NOT ENABLE_MYSQLCLIENT STREQUAL AUTO)
+diff --git a/cmake/modules/FindPython.cmake b/cmake/modules/FindPython.cmake
+index c40e12d551..35220b5426 100644
+--- a/cmake/modules/FindPython.cmake
++++ b/cmake/modules/FindPython.cmake
+@@ -1,17 +1,56 @@
+-# - Try to find python
+-# Once done this will define
++# FindPython
++# --------
++# Finds Python3 libraries
++#
++# This module will search for the required python libraries on the system
++# If multiple versions are found, the highest version will be used.
++#
++# --------
++#
++# the following variables influence behaviour:
++#
++# PYTHON_PATH - use external python not found in system paths
++#               usage: -DPYTHON_PATH=/path/to/python/lib
++# PYTHON_VER - use exact python version, fail if not found
++#               usage: -DPYTHON_VER=3.8
++#
++# --------
++#
++# This module will define the following variables:
+ #
+ # PYTHON_FOUND - system has PYTHON
++# PYTHON_VERSION - Python version number (Major.Minor)
+ # PYTHON_INCLUDE_DIRS - the python include directory
+ # PYTHON_LIBRARIES - The python libraries
++# PYTHON_LDFLAGS - Python provided link options
++#
++# --------
++#
++
++# for Depends builds, set search root dir to depends path
++if(KODI_DEPENDSBUILD)
++  set(Python3_USE_STATIC_LIBS TRUE)
++  set(Python3_ROOT_DIR ${DEPENDS_PATH}/lib)
++endif()
++
++# Provide root dir to search for Python if provided
++if(PYTHON_PATH)
++  set(Python3_ROOT_DIR ${PYTHON_PATH})
++
++  # unset cache var so we can generate again with a different dir (or none) if desired
++  unset(PYTHON_PATH CACHE)
++endif()
++
++# Set specific version of Python to find if provided
++if(PYTHON_VER)
++  set(VERSION ${PYTHON_VER})
++  set(EXACT_VER "EXACT")
+ 
+-if(PKG_CONFIG_FOUND)
+-  pkg_check_modules(PC_PYTHON python3>=3.5 QUIET)
++  # unset cache var so we can generate again with a different ver (or none) if desired
++  unset(PYTHON_VER CACHE)
+ endif()
+ 
+-find_program(PYTHON_EXECUTABLE python3 ONLY_CMAKE_FIND_ROOT_PATH)
+-find_library(PYTHON_LIBRARY NAMES python3.9 python3.8 python3.7 python3.6 python3.5 PATHS ${PC_PYTHON_LIBDIR})
+-find_path(PYTHON_INCLUDE_DIR NAMES Python.h PATHS ${PC_PYTHON_INCLUDE_DIRS} PATH_SUFFIXES python3.9 python3.8 python3.7 python3.6 python3.5)
++find_package(Python3 ${VERSION} ${EXACT_VER} COMPONENTS Development)
+ 
+ if(KODI_DEPENDSBUILD)
+   find_library(FFI_LIBRARY ffi REQUIRED)
+@@ -27,17 +66,17 @@ if(KODI_DEPENDSBUILD)
+     endif()
+   endif()
+ 
+-  set(PYTHON_LIBRARIES ${PYTHON_LIBRARY} ${FFI_LIBRARY} ${EXPAT_LIBRARY} ${INTL_LIBRARY} ${GMP_LIBRARY} ${PYTHON_DEP_LIBRARIES})
+-else()
+-  find_package(PythonLibs 3.5 REQUIRED)
+-  list(APPEND PYTHON_LIBRARIES ${PC_PYTHON_STATIC_LIBRARIES})
++  list(APPEND Python3_LIBRARIES ${FFI_LIBRARY} ${EXPAT_LIBRARY} ${INTL_LIBRARY} ${GMP_LIBRARY} ${PYTHON_DEP_LIBRARIES})
+ endif()
+ 
+-include(FindPackageHandleStandardArgs)
+-find_package_handle_standard_args(Python REQUIRED_VARS PYTHON_INCLUDE_DIR PYTHON_LIBRARY PYTHON_LIBRARIES)
+-if(PYTHON_FOUND)
+-  set(PYTHON_INCLUDE_DIRS ${PYTHON_INCLUDE_DIR})
++if(Python3_FOUND)
+   list(APPEND PYTHON_DEFINITIONS -DHAS_PYTHON=1)
++  # These are all set for easy integration with the rest of our build system
++  set(PYTHON_FOUND ${Python3_FOUND})
++  set(PYTHON_INCLUDE_DIRS ${Python3_INCLUDE_DIRS})
++  set(PYTHON_LIBRARIES ${Python3_LIBRARIES})
++  set(PYTHON_VERSION "${Python3_VERSION_MAJOR}.${Python3_VERSION_MINOR}" CACHE INTERNAL "" FORCE)
++  set(PYTHON_LDFLAGS ${Python3_LINK_OPTIONS})
+ endif()
+ 
+-mark_as_advanced(PYTHON_EXECUTABLE PYTHON_INCLUDE_DIRS PYTHON_INCLUDE_DIR PYTHON_LIBRARY PYTHON_LIBRARIES PYTHON_LDFLAGS FFI_LIBRARY EXPAT_LIBRARY INTL_LIBRARY GMP_LIBRARY)
++mark_as_advanced(PYTHON_EXECUTABLE PYTHON_VERSION PYTHON_INCLUDE_DIRS PYTHON_LDFLAGS FFI_LIBRARY EXPAT_LIBRARY INTL_LIBRARY GMP_LIBRARY)
+-- 
+2.30.2
+
diff --git a/package/kodi/0003-cmake-search-for-python-interpreter.patch b/package/kodi/0003-cmake-search-for-python-interpreter.patch
new file mode 100644
index 0000000000..158345a212
--- /dev/null
+++ b/package/kodi/0003-cmake-search-for-python-interpreter.patch
@@ -0,0 +1,48 @@
+From 6bb112e585f2ffd10e5af70ca28159dd235d063b Mon Sep 17 00:00:00 2001
+From: wsnipex <wsnipex@a1.net>
+Date: Thu, 19 Aug 2021 08:50:05 +0200
+Subject: [PATCH] [cmake] search for python interpreter fixes installing
+ eventclients on linux
+
+Backport of https://github.com/xbmc/xbmc/pull/20058
+
+Patch sent upstream: https://github.com/xbmc/xbmc/pull/20989
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ cmake/modules/FindPython.cmake | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/cmake/modules/FindPython.cmake b/cmake/modules/FindPython.cmake
+index 35220b5426..c469ed9fb6 100644
+--- a/cmake/modules/FindPython.cmake
++++ b/cmake/modules/FindPython.cmake
+@@ -20,6 +20,7 @@
+ #
+ # PYTHON_FOUND - system has PYTHON
+ # PYTHON_VERSION - Python version number (Major.Minor)
++# PYTHON_EXECUTABLE - Python interpreter binary
+ # PYTHON_INCLUDE_DIRS - the python include directory
+ # PYTHON_LIBRARIES - The python libraries
+ # PYTHON_LDFLAGS - Python provided link options
+@@ -51,6 +52,9 @@ if(PYTHON_VER)
+ endif()
+ 
+ find_package(Python3 ${VERSION} ${EXACT_VER} COMPONENTS Development)
++if(CORE_SYSTEM_NAME STREQUAL linux)
++  find_package(Python3 ${VERSION} ${EXACT_VER} COMPONENTS Interpreter)
++endif()
+ 
+ if(KODI_DEPENDSBUILD)
+   find_library(FFI_LIBRARY ffi REQUIRED)
+@@ -73,6 +77,7 @@ if(Python3_FOUND)
+   list(APPEND PYTHON_DEFINITIONS -DHAS_PYTHON=1)
+   # These are all set for easy integration with the rest of our build system
+   set(PYTHON_FOUND ${Python3_FOUND})
++  set(PYTHON_EXECUTABLE ${Python3_EXECUTABLE} CACHE FILEPATH "Python interpreter" FORCE)
+   set(PYTHON_INCLUDE_DIRS ${Python3_INCLUDE_DIRS})
+   set(PYTHON_LIBRARIES ${Python3_LIBRARIES})
+   set(PYTHON_VERSION "${Python3_VERSION_MAJOR}.${Python3_VERSION_MINOR}" CACHE INTERNAL "" FORCE)
+-- 
+2.30.2
+
diff --git a/package/kodi/0004-cmake-allow-to-override-PYTHON_EXECUTABLE.patch b/package/kodi/0004-cmake-allow-to-override-PYTHON_EXECUTABLE.patch
new file mode 100644
index 0000000000..d1e9b3f25f
--- /dev/null
+++ b/package/kodi/0004-cmake-allow-to-override-PYTHON_EXECUTABLE.patch
@@ -0,0 +1,39 @@
+From 25681d8adde4a90d5da02051e30f6a3a27322136 Mon Sep 17 00:00:00 2001
+From: Jernej Skrabec <jernej.skrabec@gmail.com>
+Date: Sat, 25 Sep 2021 07:41:10 +0200
+Subject: [PATCH] [cmake] allow to override PYTHON_EXECUTABLE
+
+If Kodi is being build for distro which has different python version
+than host, PYTHON_EXECUTABLE must be overriden and point to distro
+version. Otherwise, eventclients will be installed in wrong location and
+be thus unusable.
+
+Use case: Cross compiling Kodi for LibreELEC
+
+Backport of https://github.com/xbmc/xbmc/pull/20171
+
+Patch sent upstream: https://github.com/xbmc/xbmc/pull/20989
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ cmake/modules/FindPython.cmake | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/cmake/modules/FindPython.cmake b/cmake/modules/FindPython.cmake
+index c469ed9fb6..87b8368705 100644
+--- a/cmake/modules/FindPython.cmake
++++ b/cmake/modules/FindPython.cmake
+@@ -77,7 +77,9 @@ if(Python3_FOUND)
+   list(APPEND PYTHON_DEFINITIONS -DHAS_PYTHON=1)
+   # These are all set for easy integration with the rest of our build system
+   set(PYTHON_FOUND ${Python3_FOUND})
+-  set(PYTHON_EXECUTABLE ${Python3_EXECUTABLE} CACHE FILEPATH "Python interpreter" FORCE)
++  if(NOT PYTHON_EXECUTABLE)
++    set(PYTHON_EXECUTABLE ${Python3_EXECUTABLE} CACHE FILEPATH "Python interpreter" FORCE)
++  endif()
+   set(PYTHON_INCLUDE_DIRS ${Python3_INCLUDE_DIRS})
+   set(PYTHON_LIBRARIES ${Python3_LIBRARIES})
+   set(PYTHON_VERSION "${Python3_VERSION_MAJOR}.${Python3_VERSION_MINOR}" CACHE INTERNAL "" FORCE)
+-- 
+2.30.2
+
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 646c6e0ab4..56e901fa17 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -76,6 +76,10 @@ KODI_CONF_OPTS += \
 	-DNATIVEPREFIX=$(HOST_DIR) \
 	-DDEPENDS_PATH=$(STAGING_DIR)/usr \
 	-DENABLE_TESTING=OFF \
+	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python \
+	-DPYTHON_INCLUDE_DIRS=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
+	-DPYTHON_PATH=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) \
+	-DPYTHON_VER=$(PYTHON3_VERSION_MAJOR) \
 	-DWITH_JSONSCHEMABUILDER=$(HOST_DIR)/bin/JsonSchemaBuilder \
 	-DWITH_TEXTUREPACKER=$(HOST_DIR)/bin/TexturePacker \
 	-DLIBDVDCSS_URL=$(KODI_DL_DIR)/kodi-libdvdcss-$(KODI_LIBDVDCSS_VERSION).tar.gz \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
