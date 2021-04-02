From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  2 Apr 2021 18:33:41 +0200
Subject: [Buildroot] [PATCH 1/3] package/qpid-proton: fix build without
 threads
Message-ID: <20210402163343.1254491-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build of qpid-proton is broken since bump to version 0.33.0 in commit
d4c0fde91da0d79204a21ed8de1bd410efa1c4d6 because epoll proactor
unconditonally uses pthread

Fixes:
 - http://autobuild.buildroot.org/results/ec34da16a11f0600ecfbbbc4039e8210aea0498c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...N-2355-Fix-build-with-DPROACTOR-none.patch | 61 +++++++++++++++++++
 package/qpid-proton/qpid-proton.mk            |  8 +++
 2 files changed, 69 insertions(+)
 create mode 100644 package/qpid-proton/0002-PROTON-2355-Fix-build-with-DPROACTOR-none.patch

diff --git a/package/qpid-proton/0002-PROTON-2355-Fix-build-with-DPROACTOR-none.patch b/package/qpid-proton/0002-PROTON-2355-Fix-build-with-DPROACTOR-none.patch
new file mode 100644
index 0000000000..c99a65f2f3
--- /dev/null
+++ b/package/qpid-proton/0002-PROTON-2355-Fix-build-with-DPROACTOR-none.patch
@@ -0,0 +1,61 @@
+From 2e3b81296020340692139f1a0d05c3bc7383b40e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jiri=20Dan=C4=9Bk?= <jdanek@redhat.com>
+Date: Thu, 1 Apr 2021 19:24:33 +0200
+Subject: [PATCH] PROTON-2355: Fix build with -DPROACTOR=none (#302)
+
+epoll proactor unconditionally uses pthread.h which will result in the
+following build failure:
+
+[  3%] Building C object c/CMakeFiles/qpid-proton-proactor-objects.dir/src/proactor/epoll.c.o
+In file included from /nvme/rc-buildroot-test/scripts/instance-0/output-1/build/qpid-proton-0.33.0/c/src/proactor/epoll.c:60:
+/nvme/rc-buildroot-test/scripts/instance-0/output-1/build/qpid-proton-0.33.0/c/src/proactor/epoll-internal.h:37:10: fatal error: pthread.h: No such file or directory
+   37 | #include <pthread.h>
+      |          ^~~~~~~~~~~
+
+To fix this failure, the user could use -DPROACTOR=none but it also
+fails on:
+
+CMake Error at c/CMakeLists.txt:481 (add_library):
+  Error evaluating generator expression:
+
+    $<TARGET_OBJECTS:qpid-proton-proactor-objects>
+
+  Objects of target "qpid-proton-proactor-objects" referenced but no such
+  target exists.
+
+Co-authored-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/apache/qpid-proton/commit/2e3b81296020340692139f1a0d05c3bc7383b40e]
+---
+ c/CMakeLists.txt | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/c/CMakeLists.txt b/c/CMakeLists.txt
+index 2146a5c96..e1119d11d 100644
+--- a/c/CMakeLists.txt
++++ b/c/CMakeLists.txt
+@@ -464,7 +464,11 @@ set(qpid-proton-noncore-src
+   ${qpid-proton-include-extra}
+ )
+ 
+-add_library (qpid-proton SHARED $<TARGET_OBJECTS:qpid-proton-core-objects> $<TARGET_OBJECTS:qpid-proton-platform-io-objects> $<TARGET_OBJECTS:qpid-proton-proactor-objects> ${qpid-proton-noncore-src})
++add_library (qpid-proton SHARED
++  $<TARGET_OBJECTS:qpid-proton-core-objects>
++  $<TARGET_OBJECTS:qpid-proton-platform-io-objects>
++  $<$<TARGET_EXISTS:qpid-proton-proactor-objects>:$<TARGET_OBJECTS:qpid-proton-proactor-objects>>
++  ${qpid-proton-noncore-src})
+ target_link_libraries (qpid-proton LINK_PRIVATE ${SSL_LIB} ${SASL_LIB} ${TIME_LIB} ${PLATFORM_LIBS} ${PROACTOR_LIBS})
+ set_target_properties (qpid-proton
+   PROPERTIES
+@@ -480,7 +484,10 @@ if (BUILD_STATIC_LIBS)
+     C_EXTENSIONS ON)
+   add_library(qpid-proton-static STATIC $<TARGET_OBJECTS:qpid-proton-platform-io-static> ${qpid-proton-noncore-src})
+   target_compile_definitions(qpid-proton-static PUBLIC PROTON_DECLARE_STATIC)
+-  target_link_libraries (qpid-proton-static qpid-proton-core-static qpid-proton-proactor-static ${SSL_LIB} ${SASL_LIB} ${TIME_LIB} ${PLATFORM_LIBS} ${PROACTOR_LIBS})
++  target_link_libraries (qpid-proton-static
++    qpid-proton-core-static
++    $<$<TARGET_EXISTS:qpid-proton-proactor-static>:qpid-proton-proactor-static>
++    ${SSL_LIB} ${SASL_LIB} ${TIME_LIB} ${PLATFORM_LIBS} ${PROACTOR_LIBS})
+ endif(BUILD_STATIC_LIBS)
+ 
+ # Install executables and libraries
diff --git a/package/qpid-proton/qpid-proton.mk b/package/qpid-proton/qpid-proton.mk
index b73ab8d6da..bbf953c472 100644
--- a/package/qpid-proton/qpid-proton.mk
+++ b/package/qpid-proton/qpid-proton.mk
@@ -31,6 +31,14 @@ QPID_PROTON_CONF_OPTS = \
 	-DENABLE_WARNING_ERROR=OFF \
 	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python2
 
+# epoll proactor unconditionally uses pthread and cpp binding unconditionally
+# uses proactor
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
+QPID_PROTON_CONF_OPTS += \
+	-DBUILD_CPP=OFF \
+	-DPROACTOR=none
+endif
+
 ifeq ($(BR2_PACKAGE_JSONCPP),y)
 QPID_PROTON_DEPENDENCIES += jsoncpp
 QPID_PROTON_CONF_OPTS += -DENABLE_JSONCPP=ON
-- 
2.30.2
