From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 27 May 2016 00:00:44 +0200
Subject: [Buildroot] [PATCH v2] package/pulseview: fix build when linking
	against libatomic is needed
Message-ID: <20160526220044.13808-1-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With some toolchains, using atomics requires to explicitly add -latomic
to the linker flags.

This change adds a patch to pulseview adding this detection and updating
the LDFLAGS when appropriate.

This patch has be sent upstream:
  http://article.gmane.org/gmane.comp.debugging.sigrok.devel/2097

Fixes:
  http://autobuild.buildroot.org/results/1e3/1e3101261252d5f30fdf842cc99604e4f4c25eef/build-end.log

Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1->v2:
- update/rework pulseview patch
---
 ...heck-for-explicit-linking-against-libatom.patch | 117 +++++++++++++++++++++
 1 file changed, 117 insertions(+)
 create mode 100644 package/pulseview/0002-cmake-add-check-for-explicit-linking-against-libatom.patch

diff --git a/package/pulseview/0002-cmake-add-check-for-explicit-linking-against-libatom.patch b/package/pulseview/0002-cmake-add-check-for-explicit-linking-against-libatom.patch
new file mode 100644
index 0000000..70549e6
--- /dev/null
+++ b/package/pulseview/0002-cmake-add-check-for-explicit-linking-against-libatom.patch
@@ -0,0 +1,117 @@
+From 71830c804be76cf6abe913ac2fe584947b7a91ea Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Tue, 24 May 2016 23:08:40 +0200
+Subject: [PATCH] cmake: add check for explicit linking against libatomic
+
+To use atomics functions, some toolchains requires to explicitly add
+-latomic to the linker flags (because they are not provided by libc,
+but libatomic).
+
+This change adds a helper function trying to build/link a test program
+using atomics, then calls it to:
+* first check if atomics are directly available in the libc;
+* if not and libatomic has been found, then run the same test with
+  "-latomic" added to the linker flags.
+The pulseview link library list is updated according to the results of
+these tests.
+
+This issue was triggered by the Buildroot farms:
+  http://autobuild.buildroot.org/results/1e3/1e3101261252d5f30fdf842cc99604e4f4c25eef/build-end.log
+
+Notes:
+1- CMAKE_REQUIRED_* variables are only used in check functions. They
+   are not automatically forwarded to/handled by the target commands
+   (such as target_link_library), because the check functions are
+   implemented as macro in CMake code, whereas many target commands
+   are native.
+2- Because of note #1, CMAKE_REQUIRED_LIBRARIES (or its value) must be
+   explicitly passed to the target_link_library command when this is
+   needed.
+3- In this implementation, LIBATOMIC_LIBRARY is only set when it is
+   needed; so, unconditionally appending it to PULSEVIEW_LINK_LIBS
+   will produce the expected behavior.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+
+---
+changes v1->v2:
+- use std::atomic_fetch_add_explicit function instead of
+  __atomic_fetch_add_4;
+- rework code using cmake_*_check_state and find_library helpers;
+- quiet-ize checks and clean outputs
+- extend the commit log
+---
+ CMakeLists.txt | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 50 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9dac69f..44f810e 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -107,6 +107,55 @@ endif()
+ # This will set ${CMAKE_THREAD_LIBS_INIT} to the correct, OS-specific value.
+ find_package(Threads REQUIRED)
+ 
++
++# Check for explicit link against libatomic
++#
++# Depending on the toolchain, linking a program using atomic functions may need
++# "-latomic" explicitly passed to the linker
++#
++# This check first tests if atomics are available in the C-library, if not and
++# libatomic exists, then it runs the same test with -latomic added to the
++# linker flags.
++
++# Helper for checking for atomics
++function(check_working_cxx_atomics varname additional_lib)
++  include(CheckCXXSourceCompiles)
++  include(CMakePushCheckState)
++  cmake_push_check_state()
++  set(CMAKE_REQUIRED_FLAGS "-std=c++11")
++  set(CMAKE_REQUIRED_LIBRARIES "${additional_lib}")
++  set(CMAKE_REQUIRED_QUIET 1)
++  CHECK_CXX_SOURCE_COMPILES("
++#include <atomic>
++std::atomic<int> x;
++int main() {
++  return std::atomic_fetch_add_explicit(&x, 1, std::memory_order_seq_cst);
++}
++" ${varname})
++  cmake_pop_check_state()
++endfunction(check_working_cxx_atomics)
++
++# First check if atomics work without the library.
++# If not, check if the library exists, and atomics work with it.
++check_working_cxx_atomics(HAVE_CXX_ATOMICS_WITHOUT_LIB "")
++if(HAVE_CXX_ATOMICS_WITHOUT_LIB)
++  message(STATUS "Atomics provided by the C-library - yes")
++else()
++  message(STATUS "Atomics provided by the C-library - no")
++  find_library(LIBATOMIC_LIBRARY NAMES atomic PATH_SUFFIXES lib)
++  if(LIBATOMIC_LIBRARY)
++    check_working_cxx_atomics(HAVE_CXX_ATOMICS_WITH_LIB "${LIBATOMIC_LIBRARY}")
++    if (HAVE_CXX_ATOMICS_WITH_LIB)
++      message(STATUS "Atomics provided by libatomic - yes")
++    else()
++      message(STATUS "Atomics provided by libatomic - no")
++      message(FATAL_ERROR "Compiler must support std::atomic!")
++    endif()
++  else()
++    message(FATAL_ERROR "Compiler appears to require libatomic, but cannot find it.")
++  endif()
++endif()
++
+ #===============================================================================
+ #= System Introspection
+ #-------------------------------------------------------------------------------
+@@ -387,6 +436,7 @@ set(PULSEVIEW_LINK_LIBS
+ 	${Boost_LIBRARIES}
+ 	${QT_LIBRARIES}
+ 	${CMAKE_THREAD_LIBS_INIT}
++	${LIBATOMIC_LIBRARY}
+ )
+ 
+ if(STATIC_PKGDEPS_LIBS)
+-- 
+2.8.3
+
-- 
2.8.3
