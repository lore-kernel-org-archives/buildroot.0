From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 25 Apr 2016 21:54:43 +0200
Subject: [Buildroot] [PATCH] yajl: remove obsolete patch
Message-ID: <1461614083-29745-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 302563539dacb284576a443401cdfd061eb2e1e8 fixes link with libm for all
targets linking against libyajl{,_s}. This makes patch "0001-cmake-uClibc-Fix
-missing-libm-for-tests" obsolete so it is safe to remove it.

Instead of renumbering all remaining patches the patch defined in YAJL_PATCH
is fetched and put intto the packages directory. Having all the patches in one
places makes the number and order of the patches applied to the package more
clear.

Align patch "0003-Link-with-shared-libyajl-in-a-shared-build" with commit
302563539dacb284576a443401cdfd061eb2e1e8 and remove linking with libm from
test/api/CMakeLists.txt.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 ...red-and-the-static-library-have-the-same-.patch | 34 ++++++++++++++++++++++
 ...1-cmake-uClibc-Fix-missing-libm-for-tests.patch | 30 -------------------
 ...ink-with-shared-libyajl-in-a-shared-build.patch | 12 ++++----
 package/yajl/yajl.hash                             |  1 -
 package/yajl/yajl.mk                               |  1 -
 5 files changed, 41 insertions(+), 37 deletions(-)
 create mode 100644 package/yajl/0001-Let-the-shared-and-the-static-library-have-the-same-.patch
 delete mode 100644 package/yajl/0001-cmake-uClibc-Fix-missing-libm-for-tests.patch

diff --git a/package/yajl/0001-Let-the-shared-and-the-static-library-have-the-same-.patch b/package/yajl/0001-Let-the-shared-and-the-static-library-have-the-same-.patch
new file mode 100644
index 0000000..2ae4f3a
--- /dev/null
+++ b/package/yajl/0001-Let-the-shared-and-the-static-library-have-the-same-.patch
@@ -0,0 +1,34 @@
+From b08fe001e3d3f3564ef298e62342f07080807f7a Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Wed, 28 Oct 2015 15:45:10 +0000
+Subject: [PATCH] Let the shared and the static library have the same name
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The will be differentiated by the extension (.so or .a).
+
+Fetched from:
+https://github.com/vriera/yajl/commit/6d09f11b8fd358cab0e31b965327e64a599f9ce9
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ src/CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 99cf9e9..1a900d3 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -36,6 +36,7 @@ SET (shareDir ${CMAKE_CURRENT_BINARY_DIR}/../${YAJL_DIST_NAME}/share/pkgconfig)
+ SET(LIBRARY_OUTPUT_PATH ${libDir})
+ 
+ ADD_LIBRARY(yajl_s STATIC ${SRCS} ${HDRS} ${PUB_HDRS})
++SET_TARGET_PROPERTIES(yajl_s PROPERTIES OUTPUT_NAME yajl)
+ 
+ ADD_LIBRARY(yajl SHARED ${SRCS} ${HDRS} ${PUB_HDRS})
+ 
+-- 
+2.8.0
+
diff --git a/package/yajl/0001-cmake-uClibc-Fix-missing-libm-for-tests.patch b/package/yajl/0001-cmake-uClibc-Fix-missing-libm-for-tests.patch
deleted file mode 100644
index 08553f9..0000000
--- a/package/yajl/0001-cmake-uClibc-Fix-missing-libm-for-tests.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From a36814a6f9fbb62f49897f9fb1e68d204602e199 Mon Sep 17 00:00:00 2001
-From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
-Date: Tue, 2 Feb 2016 17:28:31 +0100
-Subject: [PATCH] cmake: uClibc: Fix missing libm for tests
-
-At the link time, the tests are not linked against libm which cause an
-error with uClibc based toolchain:
-
-../../yajl-2.1.0/lib/libyajl.so.2.1.0: undefined reference to `__isnan'
-../../yajl-2.1.0/lib/libyajl.so.2.1.0: undefined reference to `__isinf'
-
-Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
----
- test/api/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/test/api/CMakeLists.txt b/test/api/CMakeLists.txt
-index cd65a54..e0ce2f6 100644
---- a/test/api/CMakeLists.txt
-+++ b/test/api/CMakeLists.txt
-@@ -21,5 +21,5 @@ LINK_DIRECTORIES(${CMAKE_CURRENT_BINARY_DIR}/../../${YAJL_DIST_NAME}/lib)
- FOREACH (test ${TESTS})
-   GET_FILENAME_COMPONENT(testProg ${test} NAME_WE)
-   ADD_EXECUTABLE(${testProg} ${test})
--  TARGET_LINK_LIBRARIES(${testProg} yajl)
-+  TARGET_LINK_LIBRARIES(${testProg} yajl m)
- ENDFOREACH()
--- 
-2.7.0
-
diff --git a/package/yajl/0003-Link-with-shared-libyajl-in-a-shared-build.patch b/package/yajl/0003-Link-with-shared-libyajl-in-a-shared-build.patch
index 6a6e5e3..d3c91f2 100644
--- a/package/yajl/0003-Link-with-shared-libyajl-in-a-shared-build.patch
+++ b/package/yajl/0003-Link-with-shared-libyajl-in-a-shared-build.patch
@@ -1,4 +1,4 @@
-From 3e4c0ce8c2b4c9dad6b7ce11f017f3f639fdab27 Mon Sep 17 00:00:00 2001
+From 425b25993ef58d07aa18c5d4938876a90e22c47a Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
 Date: Sat, 9 Apr 2016 23:24:27 +0200
 Subject: [PATCH] Link with shared libyajl in a shared build
@@ -18,6 +18,8 @@ this fix also to all other build targets who are linking against the library.
 Upstream status: Pending
 https://github.com/lloyd/yajl/pull/187
 
+[Update: align with commit 302563539dacb284576a443401cdfd061eb2e1e8 and remove
+ linking with libm from test/api/CMakeLists.txt]
 Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
 ---
  example/CMakeLists.txt      | 7 ++++++-
@@ -75,18 +77,18 @@ index 52a9bee..7629094 100644
  # In some environments, we must explicitly link libm (like qnx,
  # thanks @shahbag)
 diff --git a/test/api/CMakeLists.txt b/test/api/CMakeLists.txt
-index e0ce2f6..9adebdc 100644
+index cd65a54..0c9debf 100644
 --- a/test/api/CMakeLists.txt
 +++ b/test/api/CMakeLists.txt
 @@ -21,5 +21,9 @@ LINK_DIRECTORIES(${CMAKE_CURRENT_BINARY_DIR}/../../${YAJL_DIST_NAME}/lib)
  FOREACH (test ${TESTS})
    GET_FILENAME_COMPONENT(testProg ${test} NAME_WE)
    ADD_EXECUTABLE(${testProg} ${test})
--  TARGET_LINK_LIBRARIES(${testProg} yajl m)
+-  TARGET_LINK_LIBRARIES(${testProg} yajl)
 +  IF(BUILD_SHARED_LIBS)
-+    TARGET_LINK_LIBRARIES(${testProg} yajl m)
++    TARGET_LINK_LIBRARIES(${testProg} yajl)
 +  ELSE()
-+    TARGET_LINK_LIBRARIES(${testProg} yajl_s m)
++    TARGET_LINK_LIBRARIES(${testProg} yajl_s)
 +  ENDIF()
  ENDFOREACH()
 diff --git a/test/parsing/CMakeLists.txt b/test/parsing/CMakeLists.txt
diff --git a/package/yajl/yajl.hash b/package/yajl/yajl.hash
index 7b3abec..ed4a050 100644
--- a/package/yajl/yajl.hash
+++ b/package/yajl/yajl.hash
@@ -1,3 +1,2 @@
 # Locally calculated
 sha256	3fb73364a5a30efe615046d07e6db9d09fd2b41c763c5f7d3bfb121cd5c5ac5a  yajl-2.1.0.tar.gz
-sha256	0f075b5f9a38bc02077370d4d57d12e615cfaaf7f634e3f2fc746b6582854e53  6d09f11b8fd358cab0e31b965327e64a599f9ce9.patch
diff --git a/package/yajl/yajl.mk b/package/yajl/yajl.mk
index 7770e86..1fb16f5 100644
--- a/package/yajl/yajl.mk
+++ b/package/yajl/yajl.mk
@@ -9,6 +9,5 @@ YAJL_SITE = $(call github,lloyd,yajl,$(YAJL_VERSION))
 YAJL_INSTALL_STAGING = YES
 YAJL_LICENSE = ISC
 YAJL_LICENSE_FILES = COPYING
-YAJL_PATCH = https://github.com/vriera/yajl/commit/6d09f11b8fd358cab0e31b965327e64a599f9ce9.patch
 
 $(eval $(cmake-package))
-- 
2.8.0
