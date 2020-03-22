From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Mar 2020 22:14:57 +0100
Subject: [Buildroot] [git commit] package/domoticz: bump to version 2020.1
Message-ID: <20200322210209.E3329851FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15bb7a586a6cbed3f8786ad2d998801cd132b901
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove first patch (not needed anymore)
- Update second patch
- Remove third to fifth patches (already in version)
- Add a mandatory jsoncpp dependency instead of using builtin jsoncpp:
  https://github.com/domoticz/domoticz/commit/301fcfbd80e254282bbb4664c53f5f70467ae827
- Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...01-History.txt-use-10717-instead-of-xxxxx.patch | 33 ----------
 ...ing-CMake-configuration-file-to-use-vers.patch} | 10 ++-
 ...txt-add-c-argument-to-build-precompiled-h.patch | 34 ----------
 ...4-DelayedLink.h-fix-build-with-python-3-8.patch | 66 -------------------
 ...not-confuse-local-files-with-system-files.patch | 76 ----------------------
 package/domoticz/Config.in                         |  1 +
 package/domoticz/domoticz.hash                     |  4 +-
 package/domoticz/domoticz.mk                       |  6 +-
 8 files changed, 16 insertions(+), 214 deletions(-)

diff --git a/package/domoticz/0001-History.txt-use-10717-instead-of-xxxxx.patch b/package/domoticz/0001-History.txt-use-10717-instead-of-xxxxx.patch
deleted file mode 100644
index c2b9cb0d25..0000000000
--- a/package/domoticz/0001-History.txt-use-10717-instead-of-xxxxx.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From bc34ba549d4366092a39a4d7bc4414f8cbd8bc6c Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 3 Aug 2019 09:13:54 +0200
-Subject: [PATCH] History.txt: use 10717 instead of xxxxx
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Set current development version to 4.10717 instead of 4.xxxxx to avoid
-the following build failure when git is unavailable:
-
-/home/fabrice/buildroot/output/build/domoticz-0f411f781ae4fb4a82f592d38a3f40578c149533/main/domoticz.cpp: In function ???void GetAppVersion()???:
-/home/fabrice/buildroot/output/build/domoticz-0f411f781ae4fb4a82f592d38a3f40578c149533/main/../appversion.h:1:20: error: ???xxxxx??? was not declared in this scope
- #define APPVERSION xxxxx
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- History.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/History.txt b/History.txt
-index 4dc45e6b5..ad67976f3 100644
---- a/History.txt
-+++ b/History.txt
-@@ -1,4 +1,4 @@
--Version 4.xxxxx (xxx 2019)
-+Version 4.10717 (xxx 2019)
- - Implemented: DarkSky CloudCover sensor
- - Implemented: EventSystem, option in Settings to enable/disable URL call logging containing full URL path
- - Implemented: GUI, OpenZWave added Refresh Node Information button, styling
--- 
-2.20.1
-
diff --git a/package/domoticz/0002-Revert-Updating-CMake-configuration-file-to-use-vers.patch b/package/domoticz/0001-Revert-Updating-CMake-configuration-file-to-use-vers.patch
similarity index 81%
rename from package/domoticz/0002-Revert-Updating-CMake-configuration-file-to-use-vers.patch
rename to package/domoticz/0001-Revert-Updating-CMake-configuration-file-to-use-vers.patch
index 8640b83544..5393b0caf0 100644
--- a/package/domoticz/0002-Revert-Updating-CMake-configuration-file-to-use-vers.patch
+++ b/package/domoticz/0001-Revert-Updating-CMake-configuration-file-to-use-vers.patch
@@ -7,6 +7,7 @@ Subject: [PATCH] Revert "Updating CMake configuration file to use
 This reverts commit 4e4ee999c4b323514c0ba81ab1ff3afb10d2f1cd to avoid
 bumping host-cmake requirement version from 3.8 to 3.14 in buildroot.
 
+[Fabrice: Updated for 2020.1]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  CMakeLists.txt | 8 +++-----
@@ -32,11 +33,18 @@ index c5b7832ff..a21f5b87b 100644
  
  if(USE_STATIC_BOOST)
     message(STATUS "Linking against boost static libraries")
-@@ -590,9 +591,6 @@ else(USE_STATIC_BOOST)
+@@ -590,16 +591,6 @@ else(USE_STATIC_BOOST)
     message(STATUS "Linking against boost dynamic libraries")
  endif(USE_STATIC_BOOST)
  
 -find_package(Boost REQUIRED COMPONENTS thread system)
+-if(Boost_FOUND)
+-    MESSAGE(STATUS "BOOST libraries found at: ${Boost_LIBRARY_DIRS}")
+-    MESSAGE(STATUS "Boost includes found at: ${Boost_INCLUDE_DIR}")
+-else(Boost_FOUND)
+-    MESSAGE(FATAL_ERROR "Boost thread/system library not found on your system, try to get this installed.")
+-endif(Boost_FOUND)
+-
 -target_link_libraries(domoticz Boost::thread Boost::system)
 -
  # compare found vs required libBoost version
diff --git a/package/domoticz/0003-CMakeLists.txt-add-c-argument-to-build-precompiled-h.patch b/package/domoticz/0003-CMakeLists.txt-add-c-argument-to-build-precompiled-h.patch
deleted file mode 100644
index b14f4c56c3..0000000000
--- a/package/domoticz/0003-CMakeLists.txt-add-c-argument-to-build-precompiled-h.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 17107b876fb308e3ef3e759ab90f3d8e4755cdc4 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 8 Nov 2019 14:17:58 +0100
-Subject: [PATCH] CMakeLists.txt: add -c argument to build precompiled headers
-
-Add "-c" argument when building precompiler headers as suggested
-by Arnout in https://patchwork.ozlabs.org/patch/1187328.
-
-This will fix the build with RELRO
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/domoticz/domoticz/commit/17107b876fb308e3ef3e759ab90f3d8e4755cdc4]
----
- CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 32a0dd2a8c..010cdf2db8 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -277,10 +277,10 @@ MACRO(ADD_PRECOMPILED_HEADER _targetName _input)
-     ENDFOREACH(item)
- 
-     SEPARATE_ARGUMENTS(_compiler_FLAGS)
--    MESSAGE("${CMAKE_CXX_COMPILER} ${CMAKE_CXX_COMPILER_ARG1} ${_compiler_FLAGS} -x c++-header -o ${_output} ${_source}")
-+    MESSAGE("${CMAKE_CXX_COMPILER} ${CMAKE_CXX_COMPILER_ARG1} ${_compiler_FLAGS} -x c++-header -c -o ${_output} ${_source}")
-     ADD_CUSTOM_COMMAND(
-       OUTPUT ${_output}
--      COMMAND ${CMAKE_CXX_COMPILER} ${CMAKE_CXX_COMPILER_ARG1} ${_compiler_FLAGS} -x c++-header -o ${_output} ${_source}
-+      COMMAND ${CMAKE_CXX_COMPILER} ${CMAKE_CXX_COMPILER_ARG1} ${_compiler_FLAGS} -x c++-header -c -o ${_output} ${_source}
-       DEPENDS ${_source} )
-     ADD_CUSTOM_TARGET(${_targetName}_gch DEPENDS ${_output})
-     ADD_DEPENDENCIES(${_targetName} ${_targetName}_gch)
diff --git a/package/domoticz/0004-DelayedLink.h-fix-build-with-python-3-8.patch b/package/domoticz/0004-DelayedLink.h-fix-build-with-python-3-8.patch
deleted file mode 100644
index 5b9abffabd..0000000000
--- a/package/domoticz/0004-DelayedLink.h-fix-build-with-python-3-8.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From e9bd383ceb63db7cfe8a284014f0cdf8c2bfe4f0 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 1 Nov 2019 10:54:11 +0100
-Subject: [PATCH] DelayedLink.h: fix build with python 3.8
-
-Fix build with python 3.8 by copy/pasting the vim workaround from
-https://github.com/vim/vim/commit/13a1f3fb0c9d08bba6109fe2131c9524e6ba7e15
-
-Fix 3703
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/domoticz/domoticz/commit/e9bd383ceb63db7cfe8a284014f0cdf8c2bfe4f0]
----
- hardware/plugins/DelayedLink.h | 38 ++++++++++++++++++++++++++++++++++
- 1 file changed, 38 insertions(+)
-
-diff --git a/hardware/plugins/DelayedLink.h b/hardware/plugins/DelayedLink.h
-index 4bf1973281..c90a7d8e69 100644
---- a/hardware/plugins/DelayedLink.h
-+++ b/hardware/plugins/DelayedLink.h
-@@ -14,6 +14,44 @@
- #include <frameobject.h>
- #include "../../main/Helper.h"
- 
-+#if PY_VERSION_HEX >= 0x030800f0
-+static inline void
-+py3__Py_DECREF(const char *filename, int lineno, PyObject *op)
-+{
-+	(void)filename; /* may be unused, shut up -Wunused-parameter */
-+	(void)lineno; /* may be unused, shut up -Wunused-parameter */
-+	_Py_DEC_REFTOTAL;
-+	if (--op->ob_refcnt != 0)
-+	{
-+#ifdef Py_REF_DEBUG
-+	if (op->ob_refcnt < 0)
-+	{
-+		_Py_NegativeRefcount(filename, lineno, op);
-+	}
-+#endif
-+	}
-+	else
-+	{
-+		_Py_Dealloc(op);
-+	}
-+}
-+
-+#undef Py_DECREF
-+#define Py_DECREF(op) py3__Py_DECREF(__FILE__, __LINE__, _PyObject_CAST(op))
-+
-+static inline void
-+py3__Py_XDECREF(PyObject *op)
-+{
-+	if (op != NULL)
-+	{
-+		Py_DECREF(op);
-+	}
-+}
-+
-+#undef Py_XDECREF
-+#define Py_XDECREF(op) py3__Py_XDECREF(_PyObject_CAST(op))
-+#endif
-+
- namespace Plugins {
- 
- #ifdef WIN32
diff --git a/package/domoticz/0005-Fix-include-paths-to-not-confuse-local-files-with-system-files.patch b/package/domoticz/0005-Fix-include-paths-to-not-confuse-local-files-with-system-files.patch
deleted file mode 100644
index 63da572b65..0000000000
--- a/package/domoticz/0005-Fix-include-paths-to-not-confuse-local-files-with-system-files.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 23f69284cb1ce1a98885b29a6126ebdbee735e7d Mon Sep 17 00:00:00 2001
-From: Daniel Wallner <14888585+danielwallner@users.noreply.github.com>
-Date: Thu, 17 Oct 2019 07:31:43 +0200
-Subject: [PATCH] Fix include paths to not confuse local files with system
- files (json/json.h) (#3669)
-
-[Retrieved from:
-https://github.com/domoticz/domoticz/commit/23f69284cb1ce1a98885b29a6126ebdbee735e7d]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- hardware/1Wire/1WireForWindows.cpp   |  2 +-
- hardware/plugins/PluginManager.cpp   | 16 ++++++++--------
- hardware/plugins/PluginProtocols.cpp |  8 ++++----
- 3 files changed, 13 insertions(+), 13 deletions(-)
-
-diff --git a/hardware/1Wire/1WireForWindows.cpp b/hardware/1Wire/1WireForWindows.cpp
-index cf0b42795d..2044882fb9 100644
---- a/hardware/1Wire/1WireForWindows.cpp
-+++ b/hardware/1Wire/1WireForWindows.cpp
-@@ -4,7 +4,7 @@
- #include "1WireForWindows.h"
- #include "../../main/Logger.h"
- #include <boost/optional.hpp>
--#include "../json/json.h"
-+#include "../../json/json.h"
- #include <WS2tcpip.h>
- 
- #define _1WIRE_SERVICE_PORT "1664"
-diff --git a/hardware/plugins/PluginManager.cpp b/hardware/plugins/PluginManager.cpp
-index 793934121e..4276fe2fbc 100644
---- a/hardware/plugins/PluginManager.cpp
-+++ b/hardware/plugins/PluginManager.cpp
-@@ -14,14 +14,14 @@
- #include "PluginMessages.h"
- #include "PluginTransports.h"
- 
--#include "../main/Helper.h"
--#include "../main/Logger.h"
--#include "../main/SQLHelper.h"
--#include "../main/WebServer.h"
--#include "../main/mainworker.h"
--#include "../main/EventSystem.h"
--#include "../json/json.h"
--#include "../main/localtime_r.h"
-+#include "../../main/Helper.h"
-+#include "../../main/Logger.h"
-+#include "../../main/SQLHelper.h"
-+#include "../../main/WebServer.h"
-+#include "../../main/mainworker.h"
-+#include "../../main/EventSystem.h"
-+#include "../../json/json.h"
-+#include "../../main/localtime_r.h"
- #ifdef WIN32
- #	include <direct.h>
- #else
-diff --git a/hardware/plugins/PluginProtocols.cpp b/hardware/plugins/PluginProtocols.cpp
-index f19731e1a4..8b1ae4c3e7 100644
---- a/hardware/plugins/PluginProtocols.cpp
-+++ b/hardware/plugins/PluginProtocols.cpp
-@@ -7,12 +7,12 @@
- 
- #include "PluginMessages.h"
- #include "PluginProtocols.h"
--#include "../main/Helper.h"
--#include "../main/Logger.h"
--#include "../webserver/Base64.h"
-+#include "../../main/Helper.h"
-+#include "../../main/Logger.h"
-+#include "../../webserver/Base64.h"
- #include "icmp_header.hpp"
- #include "ipv4_header.hpp"
--#include "../json/json.h"
-+#include "../../json/json.h"
- 
- namespace Plugins {
- 
diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index b99e548012..c713ac58b1 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_DOMOTICZ
 	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
+	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_MOSQUITTO
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/domoticz/domoticz.hash b/package/domoticz/domoticz.hash
index 320028ac53..4f095c33a7 100644
--- a/package/domoticz/domoticz.hash
+++ b/package/domoticz/domoticz.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	1903b830ed53aada66ae261d4f29a73d10c03cb5f117e4c6e7e1275620b11f4e	domoticz-0f411f781ae4fb4a82f592d38a3f40578c149533.tar.gz
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	License.txt
+sha256  d0c17b2082dad8a8caeed888b7d4c191975e74a2808b5d078305f5327b82442d  domoticz-2020.1.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  License.txt
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index ab560ba05f..6df292764b 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-DOMOTICZ_VERSION = 0f411f781ae4fb4a82f592d38a3f40578c149533
+DOMOTICZ_VERSION = 2020.1
 DOMOTICZ_SITE = $(call github,domoticz,domoticz,$(DOMOTICZ_VERSION))
 DOMOTICZ_LICENSE = GPL-3.0
 DOMOTICZ_LICENSE_FILES = License.txt
 DOMOTICZ_DEPENDENCIES = \
 	boost \
 	host-pkgconf \
+	jsoncpp \
 	libcurl \
 	lua \
 	mosquitto \
@@ -25,8 +26,9 @@ DOMOTICZ_CONF_OPTS += \
 	-DUSE_OPENSSL_STATIC=OFF
 
 # Do not use any built-in libraries which are enabled by default for
-# lua, sqlite and mqtt
+# jsoncpp, lua, sqlite and mqtt
 DOMOTICZ_CONF_OPTS += \
+	-DUSE_BUILTIN_JSONCPP=OFF \
 	-DUSE_BUILTIN_LUA=OFF \
 	-DUSE_BUILTIN_SQLITE=OFF \
 	-DUSE_BUILTIN_MQTT=OFF
