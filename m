From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Jul 2017 00:07:22 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] webkitgtk: Remove patch
	uneeded for the current version
Message-ID: <20170725222141.C619981E9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b74ed70e46b178eba4a4e174653fcf4c4d2455fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Version 2.16.5 of WebKitGTK+ already includes the fix added by the
removed patch, which is now unneeded.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 6b2804f396ad27e1d99079a8d1fbe1f51cb4cf5d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/0001-fix-gcc6-builds.patch | 53 ----------------------------
 1 file changed, 53 deletions(-)

diff --git a/package/webkitgtk/0001-fix-gcc6-builds.patch b/package/webkitgtk/0001-fix-gcc6-builds.patch
deleted file mode 100644
index 35487ad..0000000
--- a/package/webkitgtk/0001-fix-gcc6-builds.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-[CMake] Build failure with GCC 6 (fatal error: stdlib.h: No such file or directory)
-
-https://bugs.webkit.org/show_bug.cgi?id=161697
-
-Reviewed by Michael Catanzaro.
-
-Get the list of system includes from GCC and add it to the CMake
-list of implicit includes. This way, CMake will filter any of this
-directories from the list of includes when calling the compiler.
-
-This avoids an issue with GCC 6 that causes build failures when
-including the default include path as a system include (-isystem).
-
-Upstream, from: https://trac.webkit.org/changeset/205672
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-Index: trunk/Source/cmake/OptionsCommon.cmake
-===================================================================
---- trunk/Source/cmake/OptionsCommon.cmake	(revision 204084)
-+++ trunk/Source/cmake/OptionsCommon.cmake	(revision 205672)
-@@ -36,4 +36,31 @@
-     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fcolor-diagnostics")
-     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fcolor-diagnostics")
-+endif ()
-+
-+# Ensure that the default include system directories are added to the list of CMake implicit includes.
-+# This workarounds an issue that happens when using GCC 6 and using system includes (-isystem).
-+# For more details check: https://bugs.webkit.org/show_bug.cgi?id=161697
-+macro(DETERMINE_GCC_SYSTEM_INCLUDE_DIRS _lang _compiler _flags _result)
-+    file(WRITE "${CMAKE_BINARY_DIR}/CMakeFiles/dummy" "\n")
-+    separate_arguments(_buildFlags UNIX_COMMAND "${_flags}")
-+    execute_process(COMMAND ${_compiler} ${_buildFlags} -v -E -x ${_lang} -dD dummy
-+                    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/CMakeFiles OUTPUT_QUIET
-+                    ERROR_VARIABLE _gccOutput)
-+    file(REMOVE "${CMAKE_BINARY_DIR}/CMakeFiles/dummy")
-+    if ("${_gccOutput}" MATCHES "> search starts here[^\n]+\n *(.+) *\n *End of (search) list")
-+        set(${_result} ${CMAKE_MATCH_1})
-+        string(REPLACE "\n" " " ${_result} "${${_result}}")
-+        separate_arguments(${_result})
-+    endif ()
-+endmacro()
-+
-+if (CMAKE_COMPILER_IS_GNUCC)
-+   DETERMINE_GCC_SYSTEM_INCLUDE_DIRS("c" "${CMAKE_C_COMPILER}" "${CMAKE_C_FLAGS}" SYSTEM_INCLUDE_DIRS)
-+   set(CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES ${CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES} ${SYSTEM_INCLUDE_DIRS})
-+endif ()
-+
-+if (CMAKE_COMPILER_IS_GNUCXX)
-+   DETERMINE_GCC_SYSTEM_INCLUDE_DIRS("c++" "${CMAKE_CXX_COMPILER}" "${CMAKE_CXX_FLAGS}" SYSTEM_INCLUDE_DIRS)
-+   set(CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES ${CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES} ${SYSTEM_INCLUDE_DIRS})
- endif ()
- 
