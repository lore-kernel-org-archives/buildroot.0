From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 30 Oct 2017 17:31:21 +0100
Subject: [Buildroot] [PATCH 1/1] Fix build of lttng-libust
Message-ID: <20171030163121.939-1-norbert.lange@andritz.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The build of doc/examples/cmake-multiple-shared-libraries
does fail as a dependend library is missing.
This issue is not specific to builroot and should ideally
be fixed upstream (Issue: https://bugs.lttng.org/issues/1132)

The fix is done without any indepth knowledge of the CMake
mechanisms, but seems to work correctly

Signed-off-by: Norbert Lange <norbert.lange@andritz.com>
---
 package/lttng-libust/0005_fix_build.patch | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/lttng-libust/0005_fix_build.patch

diff --git a/package/lttng-libust/0005_fix_build.patch b/package/lttng-libust/0005_fix_build.patch
new file mode 100644
index 0000000000..96be80aaa6
--- /dev/null
+++ b/package/lttng-libust/0005_fix_build.patch
@@ -0,0 +1,28 @@
+diff -burN lttng-ust-2.9.0.org/doc/examples/cmake-multiple-shared-libraries/cmake/FindLTTngUST.cmake lttng-ust-2.9.0/doc/examples/cmake-multiple-shared-libraries/cmake/FindLTTngUST.cmake
+--- lttng-ust-2.9.0.org/doc/examples/cmake-multiple-shared-libraries/cmake/FindLTTngUST.cmake	2016-11-29 02:46:24.000000000 +0100
++++ lttng-ust-2.9.0/doc/examples/cmake-multiple-shared-libraries/cmake/FindLTTngUST.cmake	2017-10-30 17:01:42.321775178 +0100
+@@ -49,6 +49,8 @@
+ # build is a possibility (Yocto).
+ find_path(LTTNGUST_INCLUDE_DIRS_GENERATED NAMES lttng/ust-config.h)
+ find_library(LTTNGUST_LIBRARIES NAMES lttng-ust)
++find_library(LTTNGUST_LIBRARIES_DEP NAMES lttng-ust-tracepoint)
++
+ 
+ if(LTTNGUST_INCLUDE_DIRS AND LTTNGUST_INCLUDE_DIRS_GENERATED AND LTTNGUST_LIBRARIES)
+   # find tracef() and tracelog() support
+@@ -97,13 +99,14 @@
+     add_library(LTTng::UST UNKNOWN IMPORTED)
+     set_target_properties(LTTng::UST PROPERTIES
+       INTERFACE_INCLUDE_DIRECTORIES "${LTTNGUST_INCLUDE_DIRS};${LTTNGUST_INCLUDE_DIRS_GENERATED}"
+-      INTERFACE_LINK_LIBRARIES ${CMAKE_DL_LIBS}
++      INTERFACE_LINK_LIBRARIES "${LTTNGUST_LIBRARIES_DEP};${CMAKE_DL_LIBS}"
+       IMPORTED_LINK_INTERFACE_LANGUAGES "C"
+       IMPORTED_LOCATION "${LTTNGUST_LIBRARIES}")
+   endif()
+ 
+   # add libdl to required libraries
+-  set(LTTNGUST_LIBRARIES ${LTTNGUST_LIBRARIES} ${CMAKE_DL_LIBS})
++  set(LTTNGUST_LIBRARIES ${LTTNGUST_LIBRARIES} ${LTTNGUST_LIBRARIES_DEP} ${CMAKE_DL_LIBS})
+ endif()
+ 
+ # handle the QUIETLY and REQUIRED arguments and set LTTNGUST_FOUND to
-- 
2.14.2
