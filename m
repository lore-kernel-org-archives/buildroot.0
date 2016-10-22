From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 16:23:44 +0200
Subject: [Buildroot] [git commit] toochainfile.cmake: rework the way
	Buildroot sets flags
Message-ID: <20161022144115.C2110819CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10a6756fa13fe8ffea9804e41e275a9b54b66299
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From the build configuration, Buildroot defines and set some compiler
and linker flags that should be passed to any packages build-system.

For package using the cmake-package infrastructure, this is achieved
via the toolchainfile.cmake.

This change simplifies the way the toolchainfile.cmake file handles
these flags: it now just sets them, without any attempt to extend them
with those Buildroot defined.

This change still allows overriding these flags from the configure
command line.

So, now, when a CMake-based package needs to extend them, they should
be fully set from the package *.mk file. This behavior is consistent
with what is done for others package infrastructures.

This change should not pull any regression WRT the bug #7280 [1].

However, now, when someone uses the toolchainfile.cmake file outside of
Buildroot, he/she must overload all compiler/linker flags (including the
ones Buildroot sets since they no longer get automatically added).

[1] https://bugs.busybox.net/show_bug.cgi?id=7280

Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES                             |  3 ++-
 support/misc/toolchainfile.cmake.in | 16 ++++++++++++----
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index 284a654..fd5abcb 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,7 +3,8 @@
 	CMake support:
 
 	The toolchainfile.cmake file now provides a definition of the
-	CMAKE_BUILD_TYPE variable.
+	CMAKE_BUILD_TYPE variable. The toolchainfile.cmake also no
+	longer passes the compiler/linker flags defined by Buildroot.
 
 2016.08, Released September 1st, 2016
 
diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index a8476d9..8674653 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -31,9 +31,17 @@ set(CMAKE_CXX_FLAGS_RELEASE " -DNEBUG" CACHE STRING "Release CXXFLAGS")
 # Build type from the Buildroot configuration
 set(CMAKE_BUILD_TYPE @@CMAKE_BUILD_TYPE@@ CACHE STRING "Buildroot build configuration")
 
-set(CMAKE_C_FLAGS "@@TARGET_CFLAGS@@ ${CMAKE_C_FLAGS}" CACHE STRING "Buildroot CFLAGS")
-set(CMAKE_CXX_FLAGS "@@TARGET_CXXFLAGS@@ ${CMAKE_CXX_FLAGS}" CACHE STRING "Buildroot CXXFLAGS")
-set(CMAKE_EXE_LINKER_FLAGS "@@TARGET_LDFLAGS@@ ${CMAKE_EXE_LINKER_FLAGS}" CACHE STRING "Buildroot LDFLAGS")
+# Buildroot defaults flags.
+# If you are using this toolchainfile.cmake file outside of Buildroot and
+# want to customize the compiler/linker flags, then:
+# * set them all on the cmake command line, e.g.:
+#     cmake -DCMAKE_C_FLAGS="@@TARGET_CFLAGS@@ -Dsome_custom_flag" ...
+# * and make sure the project's CMake code extendsthem like this if needed:
+#     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Dsome_definitions")
+set(CMAKE_C_FLAGS "@@TARGET_CFLAGS@@" CACHE STRING "Buildroot CFLAGS")
+set(CMAKE_CXX_FLAGS "@@TARGET_CXXFLAGS@@" CACHE STRING "Buildroot CXXFLAGS")
+set(CMAKE_EXE_LINKER_FLAGS "@@TARGET_LDFLAGS@@" CACHE STRING "Buildroot LDFLAGS for executables")
+
 set(CMAKE_INSTALL_SO_NO_EXE 0)
 
 set(CMAKE_PROGRAM_PATH "${RELOCATED_HOST_DIR}/usr/bin")
@@ -51,6 +59,6 @@ set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX@@")
 if(@@TOOLCHAIN_HAS_FORTRAN@@)
   set(CMAKE_Fortran_FLAGS_DEBUG "" CACHE STRING "Debug CFLAGS")
   set(CMAKE_Fortran_FLAGS_RELEASE " -DNEBUG" CACHE STRING "Release CFLAGS")
-  set(CMAKE_Fortran_FLAGS "@@TARGET_FCFLAGS@@ ${CMAKE_Fortran_FLAGS}" CACHE STRING "Buildroot FCFLAGS")
+  set(CMAKE_Fortran_FLAGS "@@TARGET_FCFLAGS@@" CACHE STRING "Buildroot FCFLAGS")
   set(CMAKE_Fortran_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_FC@@")
 endif()
