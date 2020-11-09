From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Nov 2020 10:37:40 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/jsoncpp: bump
 version to 1.9.3
Message-ID: <20201109092714.7B17088044@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1383a8c6b11e02bfc827ddc3e03afa61b7b7a06a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Removed patch which was committed upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bab0d6ef43db42d542723d63ac291b09731b326d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jsoncpp/0001-Meson-updates.patch | 147 -------------------------------
 package/jsoncpp/jsoncpp.hash             |   2 +-
 package/jsoncpp/jsoncpp.mk               |   2 +-
 3 files changed, 2 insertions(+), 149 deletions(-)

diff --git a/package/jsoncpp/0001-Meson-updates.patch b/package/jsoncpp/0001-Meson-updates.patch
deleted file mode 100644
index 8a44c5b032..0000000000
--- a/package/jsoncpp/0001-Meson-updates.patch
+++ /dev/null
@@ -1,147 +0,0 @@
-From 6bc55ec35d02931960ec1f5768fc9c56ab62ef66 Mon Sep 17 00:00:00 2001
-From: David Seifert <16636962+SoapGentoo@users.noreply.github.com>
-Date: Tue, 7 Jan 2020 02:23:50 +0100
-Subject: [PATCH] Meson updates (#1124)
-
-* Modernize meson.build
-
-* Make tests optional
-* Use `files()` for quick sanity checks
-
-* Bump version to 1.9.3
-
-* Bump SOVERSION, as some functions were removed
-  and structs were changed, as determined by
-  libabigail.
-
-[Retrieved from:
-https://github.com/open-source-parsers/jsoncpp/commit/6bc55ec35d02931960ec1f5768fc9c56ab62ef66]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- CMakeLists.txt         |  2 +-
- include/json/version.h |  4 ++--
- meson.build            | 33 ++++++++++++++++++---------------
- meson_options.txt      |  5 +++++
- 4 files changed, 26 insertions(+), 18 deletions(-)
- create mode 100644 meson_options.txt
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 4e063317..c05ddccb 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -70,7 +70,7 @@ project(JSONCPP
-         # 2. /include/json/version.h
-         # 3. /CMakeLists.txt
-         # IMPORTANT: also update the SOVERSION!!
--        VERSION 1.9.2 # <major>[.<minor>[.<patch>[.<tweak>]]]
-+        VERSION 1.9.3 # <major>[.<minor>[.<patch>[.<tweak>]]]
-         LANGUAGES CXX)
- 
- message(STATUS "JsonCpp Version: ${JSONCPP_VERSION_MAJOR}.${JSONCPP_VERSION_MINOR}.${JSONCPP_VERSION_PATCH}")
-diff --git a/include/json/version.h b/include/json/version.h
-index ff94372b..0f298341 100644
---- a/include/json/version.h
-+++ b/include/json/version.h
-@@ -9,10 +9,10 @@
- // 3. /CMakeLists.txt
- // IMPORTANT: also update the SOVERSION!!
- 
--#define JSONCPP_VERSION_STRING "1.9.2"
-+#define JSONCPP_VERSION_STRING "1.9.3"
- #define JSONCPP_VERSION_MAJOR 1
- #define JSONCPP_VERSION_MINOR 9
--#define JSONCPP_VERSION_PATCH 2
-+#define JSONCPP_VERSION_PATCH 3
- #define JSONCPP_VERSION_QUALIFIER
- #define JSONCPP_VERSION_HEXA                                                   \
-   ((JSONCPP_VERSION_MAJOR << 24) | (JSONCPP_VERSION_MINOR << 16) |             \
-diff --git a/meson.build b/meson.build
-index 1bc94a8a..c2932030 100644
---- a/meson.build
-+++ b/meson.build
-@@ -9,7 +9,7 @@ project(
-   # 2. /include/json/version.h
-   # 3. /CMakeLists.txt
-   # IMPORTANT: also update the SOVERSION!!
--  version : '1.9.2',
-+  version : '1.9.3',
-   default_options : [
-     'buildtype=release',
-     'cpp_std=c++11',
-@@ -18,7 +18,7 @@ project(
-   meson_version : '>= 0.49.0')
- 
- 
--jsoncpp_headers = [
-+jsoncpp_headers = files([
-   'include/json/allocator.h',
-   'include/json/assertions.h',
-   'include/json/config.h',
-@@ -28,7 +28,8 @@ jsoncpp_headers = [
-   'include/json/reader.h',
-   'include/json/value.h',
-   'include/json/version.h',
--  'include/json/writer.h']
-+  'include/json/writer.h',
-+])
- jsoncpp_include_directories = include_directories('include')
- 
- install_headers(
-@@ -44,13 +45,12 @@ else
- endif
- 
- jsoncpp_lib = library(
--  'jsoncpp',
--  [ jsoncpp_headers,
--    'src/lib_json/json_tool.h',
-+  'jsoncpp', files([
-     'src/lib_json/json_reader.cpp',
-     'src/lib_json/json_value.cpp',
--    'src/lib_json/json_writer.cpp'],
--  soversion : 22,
-+    'src/lib_json/json_writer.cpp',
-+  ]),
-+  soversion : 23,
-   install : true,
-   include_directories : jsoncpp_include_directories,
-   cpp_args: dll_export_flag)
-@@ -66,18 +66,21 @@ import('pkgconfig').generate(
- jsoncpp_dep = declare_dependency(
-   include_directories : jsoncpp_include_directories,
-   link_with : jsoncpp_lib,
--  version : meson.project_version(),
--  )
-+  version : meson.project_version())
- 
- # tests
--python = import('python').find_installation()
-+if meson.is_subproject() or not get_option('tests')
-+  subdir_done()
-+endif
-+
-+python = import('python').find_installation('python3')
- 
- jsoncpp_test = executable(
--  'jsoncpp_test',
--  [ 'src/test_lib_json/jsontest.cpp',
--    'src/test_lib_json/jsontest.h',
-+  'jsoncpp_test', files([
-+    'src/test_lib_json/jsontest.cpp',
-     'src/test_lib_json/main.cpp',
--    'src/test_lib_json/fuzz.cpp'],
-+    'src/test_lib_json/fuzz.cpp',
-+  ]),
-   include_directories : jsoncpp_include_directories,
-   link_with : jsoncpp_lib,
-   install : false,
-diff --git a/meson_options.txt b/meson_options.txt
-new file mode 100644
-index 00000000..9c215ae6
---- /dev/null
-+++ b/meson_options.txt
-@@ -0,0 +1,5 @@
-+option(
-+  'tests',
-+  type : 'boolean',
-+  value : true,
-+  description : 'Enable building tests')
diff --git a/package/jsoncpp/jsoncpp.hash b/package/jsoncpp/jsoncpp.hash
index 1000167611..45f0b161ff 100644
--- a/package/jsoncpp/jsoncpp.hash
+++ b/package/jsoncpp/jsoncpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  77a402fb577b2e0e5d0bdc1cf9c65278915cdb25171e3452c68b6da8a561f8f0  jsoncpp-1.9.2.tar.gz
+sha256  8593c1d69e703563d94d8c12244e2e18893eeb9a8a9f8aa3d09a327aa45c8f7d  jsoncpp-1.9.3.tar.gz
 sha256  95039d77a20e75b428207740d9a8f97b2dce3c89da4b21f1ad862b5997160e0a  LICENSE
diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index f9761d4a6e..2766716947 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSONCPP_VERSION = 1.9.2
+JSONCPP_VERSION = 1.9.3
 JSONCPP_SITE = $(call github,open-source-parsers,jsoncpp,$(JSONCPP_VERSION))
 JSONCPP_LICENSE = Public Domain or MIT
 JSONCPP_LICENSE_FILES = LICENSE
