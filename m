From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  7 Apr 2020 20:23:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/flatbuffers: bump to version 1.12.0
Message-ID: <20200407182307.508881-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop patch (already in version)
- Update hash of LICENSE.txt: Fixed Apache license not using canonical
  version:
  https://github.com/google/flatbuffers/commit/9834ee97874c95eee8b27677639eeb33aed12980
- Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...Add-detection-of-strtoull_l-function.patch | 38 -------------------
 package/flatbuffers/flatbuffers.hash          |  4 +-
 package/flatbuffers/flatbuffers.mk            |  2 +-
 3 files changed, 3 insertions(+), 41 deletions(-)
 delete mode 100644 package/flatbuffers/0001-Add-detection-of-strtoull_l-function.patch

diff --git a/package/flatbuffers/0001-Add-detection-of-strtoull_l-function.patch b/package/flatbuffers/0001-Add-detection-of-strtoull_l-function.patch
deleted file mode 100644
index f3e82101bb..0000000000
--- a/package/flatbuffers/0001-Add-detection-of-strtoull_l-function.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From bff7ffbc5130cd46caf33b76b4bb0593fcd15066 Mon Sep 17 00:00:00 2001
-From: Vladimir Glavnyy <31897320+vglavnyy@users.noreply.github.com>
-Date: Fri, 10 May 2019 00:15:29 +0700
-Subject: [PATCH] Add detection of strtoull_l function (#5333) (#5337)
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/google/flatbuffers/commit/bff7ffbc5130cd46caf33b76b4bb0593fcd15066]
----
- CMakeLists.txt | 12 +++++++++---
- 1 file changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 0640c37b5..30be238fe 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -42,12 +42,18 @@ if(DEFINED FLATBUFFERS_MAX_PARSING_DEPTH)
-   message(STATUS "FLATBUFFERS_MAX_PARSING_DEPTH: ${FLATBUFFERS_MAX_PARSING_DEPTH}")
- endif()
- 
--# Auto-detect locale-narrow 'strtod_l' function.
-+# Auto-detect locale-narrow 'strtod_l' and  'strtoull_l' functions.
- if(NOT DEFINED FLATBUFFERS_LOCALE_INDEPENDENT)
-+  set(FLATBUFFERS_LOCALE_INDEPENDENT 0)
-   if(MSVC)
--    check_cxx_symbol_exists(_strtof_l stdlib.h FLATBUFFERS_LOCALE_INDEPENDENT)
-+    check_cxx_symbol_exists(_strtof_l stdlib.h FLATBUFFERS_HAS_STRTOF_L)
-+    check_cxx_symbol_exists(_strtoui64_l stdlib.h FLATBUFFERS_HAS_STRTOULL_L)
-   else()
--    check_cxx_symbol_exists(strtof_l stdlib.h FLATBUFFERS_LOCALE_INDEPENDENT)
-+    check_cxx_symbol_exists(strtof_l stdlib.h FLATBUFFERS_HAS_STRTOF_L)
-+    check_cxx_symbol_exists(strtoull_l stdlib.h FLATBUFFERS_HAS_STRTOULL_L)
-+  endif()
-+  if(FLATBUFFERS_HAS_STRTOF_L AND FLATBUFFERS_HAS_STRTOULL_L)
-+    set(FLATBUFFERS_LOCALE_INDEPENDENT 1)
-   endif()
- endif()
- add_definitions(-DFLATBUFFERS_LOCALE_INDEPENDENT=$<BOOL:${FLATBUFFERS_LOCALE_INDEPENDENT}>)
diff --git a/package/flatbuffers/flatbuffers.hash b/package/flatbuffers/flatbuffers.hash
index 0cbdb6fe5b..82ef942799 100644
--- a/package/flatbuffers/flatbuffers.hash
+++ b/package/flatbuffers/flatbuffers.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	3f4a286642094f45b1b77228656fbd7ea123964f19502f9ecfd29933fd23a50b	flatbuffers-1.11.0.tar.gz
-sha256	7ec9661a8afafab1eee3523d6f1a193eff76314a5ab10b4ce96aefd87621b0c3	LICENSE.txt
+sha256  62f2223fb9181d1d6338451375628975775f7522185266cd5296571ac152bc45  flatbuffers-1.12.0.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
index dcb5579e64..6a71ea9c79 100644
--- a/package/flatbuffers/flatbuffers.mk
+++ b/package/flatbuffers/flatbuffers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLATBUFFERS_VERSION = 1.11.0
+FLATBUFFERS_VERSION = 1.12.0
 FLATBUFFERS_SITE = $(call github,google,flatbuffers,v$(FLATBUFFERS_VERSION))
 FLATBUFFERS_LICENSE = Apache-2.0
 FLATBUFFERS_LICENSE_FILES = LICENSE.txt
-- 
2.25.1
