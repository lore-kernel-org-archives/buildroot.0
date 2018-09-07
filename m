From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:20 -0000
Subject: [Buildroot] [git commit] package/synergy: bump version to
 2.0.12-beta
Message-ID: <20180907111527.1B7B27FD98@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ccb8d005d4d5e5a83304f471341b61f2f8e5295
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Normally we do not use beta versions but 1.x versions are incompatible
with openssl-1.1.x and openssl support was dropped in synergy with
version 2.0.4: https://github.com/symless/synergy-core/releases

Also libcurl is not needed anymore since version 2.0.12.

Added license hash, removed all patches since they fixed bugs which do
not exist anymore.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...1-allow-building-of-synergy-without-tests.patch | 86 ----------------------
 ...change-output-path-when-building-in-debug.patch | 33 ---------
 package/synergy/Config.in                          |  2 -
 package/synergy/synergy.hash                       |  3 +-
 package/synergy/synergy.mk                         |  4 +-
 5 files changed, 4 insertions(+), 124 deletions(-)

diff --git a/package/synergy/0001-allow-building-of-synergy-without-tests.patch b/package/synergy/0001-allow-building-of-synergy-without-tests.patch
deleted file mode 100644
index 0c550eec16..0000000000
--- a/package/synergy/0001-allow-building-of-synergy-without-tests.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From cb6b00947ea125c3246654bb3dd3986b64e974d4 Mon Sep 17 00:00:00 2001
-From: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
-Date: Mon, 27 Mar 2017 21:51:59 +0200
-Subject: [PATCH] allow building of synergy without tests
-
-Upstream status: https://github.com/symless/synergy/pull/5943
-
-Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
----
- CMakeLists.txt                             | 2 ++
- src/CMakeLists.txt                         | 2 +-
- src/lib/synergy/KeyMap.h                   | 4 ++++
- src/test/unittests/synergy/KeyMapTests.cpp | 2 ++
- 4 files changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 94c474e..cceac45 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -39,6 +39,8 @@ endif()
- # First, declare project (important for prerequisite checks).
- project(synergy C CXX)
- 
-+option(BUILD_TESTS "Override building of tests" ON)
-+
- # put binaries in a different dir to make them easier to find.
- set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
- set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 237ba48..96dadd2 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -50,6 +50,6 @@ add_subdirectory(lib)
- add_subdirectory(cmd)
- add_subdirectory(micro)
- 
--if (NOT ${CMAKE_SYSTEM_NAME} MATCHES "IRIX")
-+if (BUILD_TESTS AND NOT ${CMAKE_SYSTEM_NAME} MATCHES "IRIX")
- 	add_subdirectory(test)
- endif()
-diff --git a/src/lib/synergy/KeyMap.h b/src/lib/synergy/KeyMap.h
-index de869e6..51e7e07 100644
---- a/src/lib/synergy/KeyMap.h
-+++ b/src/lib/synergy/KeyMap.h
-@@ -24,7 +24,9 @@
- #include "common/stdset.h"
- #include "common/stdvector.h"
- 
-+#ifdef TEST_ENV
- #include "gtest/gtest_prod.h"
-+#endif
- 
- namespace synergy {
- 
-@@ -326,6 +328,7 @@ public:
- 
- 	//@}
- 
-+#ifdef TEST_ENV
- private:
- 	FRIEND_TEST(KeyMapTests,
- 				findBestKey_requiredDown_matchExactFirstItem);
-@@ -340,6 +343,7 @@ private:
- 	FRIEND_TEST(KeyMapTests,
- 				findBestKey_onlyOneRequiredDown_matchTwoRequiredChangesItem);
- 	FRIEND_TEST(KeyMapTests, findBestKey_noRequiredDown_cannotMatch);
-+#endif
- 
- private:
- 	//! Ways to synthesize a key
-diff --git a/src/test/unittests/synergy/KeyMapTests.cpp b/src/test/unittests/synergy/KeyMapTests.cpp
-index 1a195af..fe2a5e4 100644
---- a/src/test/unittests/synergy/KeyMapTests.cpp
-+++ b/src/test/unittests/synergy/KeyMapTests.cpp
-@@ -15,6 +15,8 @@
-  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
-  */
- 
-+#define TEST_ENV
-+
- #include "synergy/KeyMap.h"
- 
- #include "test/global/gtest.h"
--- 
-2.7.4
-
diff --git a/package/synergy/0002-do-not-change-output-path-when-building-in-debug.patch b/package/synergy/0002-do-not-change-output-path-when-building-in-debug.patch
deleted file mode 100644
index a261b6b10c..0000000000
--- a/package/synergy/0002-do-not-change-output-path-when-building-in-debug.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 2868add1b7375ef4e2427edb85e27759c5ee226b Mon Sep 17 00:00:00 2001
-From: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
-Date: Fri, 31 Mar 2017 20:05:30 +0200
-Subject: [PATCH] do not change output path when building in debug
-
-Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
----
- CMakeLists.txt | 9 ---------
- 1 file changed, 9 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 94c474e..1080e41 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -43,15 +43,6 @@ project(synergy C CXX)
- set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
- set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)
- 
--# for unix, put debug files in a separate bin "debug" dir.
--# release bin files should stay in the root of the bin dir.
--if (CMAKE_GENERATOR STREQUAL "Unix Makefiles")
--	if (CMAKE_BUILD_TYPE STREQUAL Debug)
--		set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin/debug)
--		set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib/debug)
--	endif()
--endif()
--
- # Set some easy to type variables.
- set(root_dir ${CMAKE_SOURCE_DIR})
- set(cmake_dir ${root_dir}/res)
--- 
-2.7.4
-
diff --git a/package/synergy/Config.in b/package/synergy/Config.in
index 3bb8b8e98c..6005363dcb 100644
--- a/package/synergy/Config.in
+++ b/package/synergy/Config.in
@@ -4,8 +4,6 @@ config BR2_PACKAGE_SYNERGY
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_LIBCURL
-	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXTST
 	help
diff --git a/package/synergy/synergy.hash b/package/synergy/synergy.hash
index 52f9d74d6b..664855fa33 100644
--- a/package/synergy/synergy.hash
+++ b/package/synergy/synergy.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256  85c388f93881d741981ce3c675e840a52a76883cb2cea1da306c0c453c5d7d9b  synergy-v1.8.8-stable.tar.gz
+sha256 06d1cb1d43251b0b624212652e9c0ab2657d124ac4f7e7d0c7f3e448c953c2a8  synergy-v2.0.12-beta.tar.gz
+sha256 4921009cd76e7d38a8e873c362b25dbaf032c320bbb36a40dec775ddbdcbe1d8  LICENSE
diff --git a/package/synergy/synergy.mk b/package/synergy/synergy.mk
index 76a4004f06..d357415689 100644
--- a/package/synergy/synergy.mk
+++ b/package/synergy/synergy.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-SYNERGY_VERSION = v1.8.8-stable
+SYNERGY_VERSION = v2.0.12-beta
 SYNERGY_SITE = $(call github,symless,synergy,$(SYNERGY_VERSION))
 SYNERGY_LICENSE = GPL-2.0
 SYNERGY_LICENSE_FILES = LICENSE
-SYNERGY_DEPENDENCIES = libcurl openssl xlib_libX11 xlib_libXtst
+SYNERGY_DEPENDENCIES = xlib_libX11 xlib_libXtst
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXEXT),y)
 SYNERGY_DEPENDENCIES += xlib_libXext
