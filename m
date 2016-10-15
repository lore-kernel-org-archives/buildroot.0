From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 15 Oct 2016 22:31:23 +0200
Subject: [Buildroot] [PATCH v4 9/9] toochainfile.cmake: rework the way
	Buildroot sets flags
In-Reply-To: <20161015203123.11241-1-s.martin49@gmail.com>
References: <20161015203123.11241-1-s.martin49@gmail.com>
Message-ID: <20161015203123.11241-10-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

---
changes v3->v4:
- add a note about what the CMake code should look like (Arnout)
- fix overriding support (add missing CACHE keyword)
- update CHANGES text
---
 CHANGES                             |  5 ++++-
 support/misc/toolchainfile.cmake.in | 17 +++++++++++++----
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index c0e3e79..3657710 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,10 @@
 
     toolchainfile.cmake:
     * when used outside of Buildroot, if not specified on the command
-      line, the CMAKE_BUILD_TYPE is by toolchainfile.cmake.
+      line, the CMAKE_BUILD_TYPE is by toolchainfile.cmake;
+    * when used outside of Buildroot with custom compiler/linker
+      flags, the Buildroot flags should be set along side with the
+      custom ones.
 
 2016.08, Released September 1st, 2016
 
diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index fde141a..b70b726 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -28,9 +28,17 @@ set(CMAKE_CXX_FLAGS_RELEASE " -DNEBUG" CACHE)
 # Build type from the Buildroot configuration
 set(CMAKE_BUILD_TYPE @@BR_CMAKE_BUILD_TYPE@@ CACHE)
 
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
+set(CMAKE_C_FLAGS "@@TARGET_CFLAGS@@" CACHE)
+set(CMAKE_CXX_FLAGS "@@TARGET_CXXFLAGS@@" CACHE)
+set(CMAKE_EXE_LINKER_FLAGS "@@TARGET_LDFLAGS@@" CACHE)
+
 set(CMAKE_INSTALL_SO_NO_EXE 0)
 
 set(CMAKE_PROGRAM_PATH "${RELOCATED_HOST_DIR}/usr/bin")
@@ -46,6 +54,7 @@ set(ENV{PKG_CONFIG_SYSROOT_DIR} "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
 set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC@@")
 set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX@@")
 if(@@TOOLCHAIN_HAS_FORTRAN@@)
-  set(CMAKE_Fortran_FLAGS "@@TARGET_FCFLAGS@@ ${CMAKE_Fortran_FLAGS}" CACHE STRING "Buildroot FCFLAGS")
+  # Buildroot defaults flags.
+  set(CMAKE_Fortran_FLAGS "@@TARGET_FCFLAGS@@" CACHE)
   set(CMAKE_Fortran_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_FC@@")
 endif()
-- 
2.10.0
