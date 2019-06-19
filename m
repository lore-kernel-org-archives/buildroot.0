From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 07:30:34 +0200
Subject: [Buildroot] [git commit] package/flatbuffers: fix musl build
Message-ID: <20190619052958.1407A7FA13@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af21dacbd1be1c09e15115421e7926d25d6c2e78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Retrieve upstream patch that check availability of strtoull_l before
using it

Fixes:
 - http://autobuild.buildroot.org/results/18f9eecae551c2db6544c7432f23e541bae0d8b9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0001-Add-detection-of-strtoull_l-function.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/flatbuffers/0001-Add-detection-of-strtoull_l-function.patch b/package/flatbuffers/0001-Add-detection-of-strtoull_l-function.patch
new file mode 100644
index 0000000000..f3e82101bb
--- /dev/null
+++ b/package/flatbuffers/0001-Add-detection-of-strtoull_l-function.patch
@@ -0,0 +1,38 @@
+From bff7ffbc5130cd46caf33b76b4bb0593fcd15066 Mon Sep 17 00:00:00 2001
+From: Vladimir Glavnyy <31897320+vglavnyy@users.noreply.github.com>
+Date: Fri, 10 May 2019 00:15:29 +0700
+Subject: [PATCH] Add detection of strtoull_l function (#5333) (#5337)
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/google/flatbuffers/commit/bff7ffbc5130cd46caf33b76b4bb0593fcd15066]
+---
+ CMakeLists.txt | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 0640c37b5..30be238fe 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -42,12 +42,18 @@ if(DEFINED FLATBUFFERS_MAX_PARSING_DEPTH)
+   message(STATUS "FLATBUFFERS_MAX_PARSING_DEPTH: ${FLATBUFFERS_MAX_PARSING_DEPTH}")
+ endif()
+ 
+-# Auto-detect locale-narrow 'strtod_l' function.
++# Auto-detect locale-narrow 'strtod_l' and  'strtoull_l' functions.
+ if(NOT DEFINED FLATBUFFERS_LOCALE_INDEPENDENT)
++  set(FLATBUFFERS_LOCALE_INDEPENDENT 0)
+   if(MSVC)
+-    check_cxx_symbol_exists(_strtof_l stdlib.h FLATBUFFERS_LOCALE_INDEPENDENT)
++    check_cxx_symbol_exists(_strtof_l stdlib.h FLATBUFFERS_HAS_STRTOF_L)
++    check_cxx_symbol_exists(_strtoui64_l stdlib.h FLATBUFFERS_HAS_STRTOULL_L)
+   else()
+-    check_cxx_symbol_exists(strtof_l stdlib.h FLATBUFFERS_LOCALE_INDEPENDENT)
++    check_cxx_symbol_exists(strtof_l stdlib.h FLATBUFFERS_HAS_STRTOF_L)
++    check_cxx_symbol_exists(strtoull_l stdlib.h FLATBUFFERS_HAS_STRTOULL_L)
++  endif()
++  if(FLATBUFFERS_HAS_STRTOF_L AND FLATBUFFERS_HAS_STRTOULL_L)
++    set(FLATBUFFERS_LOCALE_INDEPENDENT 1)
+   endif()
+ endif()
+ add_definitions(-DFLATBUFFERS_LOCALE_INDEPENDENT=$<BOOL:${FLATBUFFERS_LOCALE_INDEPENDENT}>)
