From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 25 May 2016 23:45:54 +0200
Subject: [Buildroot] [PATCH] package/pulseview: fix build when linking
	against libatomic is needed
Message-ID: <20160525214554.26606-1-s.martin49@gmail.com>
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
  http://article.gmane.org/gmane.comp.debugging.sigrok.devel/2096

Fixes:
  http://autobuild.buildroot.org/results/1e3/1e3101261252d5f30fdf842cc99604e4f4c25eef/build-end.log

Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 ...heck-for-explicit-linking-against-libatom.patch | 102 +++++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 package/pulseview/0002-cmake-add-check-for-explicit-linking-against-libatom.patch

diff --git a/package/pulseview/0002-cmake-add-check-for-explicit-linking-against-libatom.patch b/package/pulseview/0002-cmake-add-check-for-explicit-linking-against-libatom.patch
new file mode 100644
index 0000000..1c3b216
--- /dev/null
+++ b/package/pulseview/0002-cmake-add-check-for-explicit-linking-against-libatom.patch
@@ -0,0 +1,102 @@
+From d8718bfb367460a9ac52ab2fc591502185187876 Mon Sep 17 00:00:00 2001
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
+* if not and libatomic exists, then run the same test with "-latomic"
+  added to the linker flags.
+The pulseview link library list is updated according to the results of
+these tests.
+
+This issue was triggered by the Buildroot farms:
+  http://autobuild.buildroot.org/results/1e3/1e3101261252d5f30fdf842cc99604e4f4c25eef/build-end.log
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ CMakeLists.txt | 49 ++++++++++++++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 48 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9dac69f..385acc6 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -63,7 +63,6 @@ endif()
+ #===============================================================================
+ #= Dependencies
+ #-------------------------------------------------------------------------------
+-
+ list(APPEND PKGDEPS libsigrokcxx>=0.4.0)
+ 
+ if(ENABLE_DECODE)
+@@ -107,6 +106,53 @@ endif()
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
++include(CheckCXXSourceCompiles)
++include(CheckLibraryExists)
++
++# Helper for checking for atomics
++function(check_working_cxx_atomics varname)
++  set(OLD_CMAKE_REQUIRED_FLAGS ${CMAKE_REQUIRED_FLAGS})
++  set(CMAKE_REQUIRED_FLAGS "-std=c++11")
++  CHECK_CXX_SOURCE_COMPILES("
++#include <atomic>
++std::atomic<int> x;
++int main() {
++  return (int)__atomic_fetch_add_4(&x, 1, __ATOMIC_SEQ_CST);
++}
++" ${varname})
++  set(CMAKE_REQUIRED_FLAGS ${OLD_CMAKE_REQUIRED_FLAGS})
++endfunction(check_working_cxx_atomics)
++
++# First check if atomics work without the library.
++check_working_cxx_atomics(HAVE_CXX_ATOMICS_WITHOUT_LIB)
++# If not, check if the library exists, and atomics work with it.
++if(NOT HAVE_CXX_ATOMICS_WITHOUT_LIB)
++  CHECK_LIBRARY_EXISTS(atomic __atomic_fetch_add_4 "" HAVE_LIBATOMIC)
++  if( HAVE_LIBATOMIC )
++    list(APPEND CMAKE_REQUIRED_LIBRARIES "atomic")
++    check_working_cxx_atomics(HAVE_CXX_ATOMICS_WITH_LIB)
++    if (NOT HAVE_CXX_ATOMICS_WITH_LIB)
++      message(FATAL_ERROR "Host compiler must support std::atomic!")
++    endif()
++  else()
++    message(FATAL_ERROR "Host compiler appears to require libatomic, but cannot find it.")
++  endif()
++endif()
++
++if(HAVE_CXX_ATOMICS_WITH_LIB)
++  set(ATOMIC_LIBRARIES "-latomic")
++endif()
++
+ #===============================================================================
+ #= System Introspection
+ #-------------------------------------------------------------------------------
+@@ -387,6 +433,7 @@ set(PULSEVIEW_LINK_LIBS
+ 	${Boost_LIBRARIES}
+ 	${QT_LIBRARIES}
+ 	${CMAKE_THREAD_LIBS_INIT}
++	${ATOMIC_LIBRARIES}
+ )
+ 
+ if(STATIC_PKGDEPS_LIBS)
+-- 
+2.8.3
+
-- 
2.8.3
