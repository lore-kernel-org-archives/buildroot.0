From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 00:42:03 +0200
Subject: [Buildroot] [git commit] pulseview: bump version to 0.4.0
Message-ID: <20170701223914.04F8E8172C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0a679fd4aaba1497ebbbee625e115c038a7c40f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patches are now upstream and can be removed. Remove the comment
about Qt4 - it's no longer valid. Add boost-serialization to
dependencies.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pulseview/0001-musl.patch                  |  54 ----------
 ...heck-for-explicit-linking-against-libatom.patch | 117 ---------------------
 ...txt-Avoid-fext-numeric-literals-not-suppo.patch |  28 -----
 package/pulseview/Config.in                        |   1 +
 package/pulseview/pulseview.hash                   |   3 +-
 package/pulseview/pulseview.mk                     |   4 +-
 6 files changed, 3 insertions(+), 204 deletions(-)

diff --git a/package/pulseview/0001-musl.patch b/package/pulseview/0001-musl.patch
deleted file mode 100644
index 1acee73..0000000
--- a/package/pulseview/0001-musl.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From dcfe0a01f72021aab961245d0ebcc9f8d4504b40 Mon Sep 17 00:00:00 2001
-From: Soeren Apel <soeren@apelpie.net>
-Date: Sun, 31 Jan 2016 14:12:44 +0100
-Subject: [PATCH] View: Honor ENABLE_DECODE compiler switch
-
-Signed-off-by: Soeren Apel <soeren@apelpie.net>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
-Patch downloaded from upstream git:
-http://sigrok.org/gitweb/?p=pulseview.git;a=commitdiff;h=dcfe0a01f72021aab961245d0ebcc9f8d4504b40
-as suggested by upstream:
-http://article.gmane.org/gmane.comp.debugging.sigrok.devel/1954
-
- pv/view/view.cpp | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/pv/view/view.cpp b/pv/view/view.cpp
-index c9b08bf..6ad7dea 100644
---- a/pv/view/view.cpp
-+++ b/pv/view/view.cpp
-@@ -43,7 +43,6 @@
- #include <libsigrokcxx/libsigrokcxx.hpp>
- 
- #include "analogsignal.hpp"
--#include "decodetrace.hpp"
- #include "header.hpp"
- #include "logicsignal.hpp"
- #include "ruler.hpp"
-@@ -59,6 +58,10 @@
- #include "pv/data/logicsegment.hpp"
- #include "pv/util.hpp"
- 
-+#ifdef ENABLE_DECODE
-+#include "decodetrace.hpp"
-+#endif
-+
- using boost::shared_lock;
- using boost::shared_mutex;
- 
-@@ -455,9 +458,11 @@ void View::enable_coloured_bg(bool state)
- 		if (l)
- 			l->set_coloured_bg(state);
- 
-+#ifdef ENABLE_DECODE
- 		shared_ptr<DecodeTrace> d = dynamic_pointer_cast<DecodeTrace>(i);
- 		if (d)
- 			d->set_coloured_bg(state);
-+#endif
- 	}
- 
- 	viewport_->update();
--- 
-2.6.2
-
diff --git a/package/pulseview/0002-cmake-add-check-for-explicit-linking-against-libatom.patch b/package/pulseview/0002-cmake-add-check-for-explicit-linking-against-libatom.patch
deleted file mode 100644
index 70549e6..0000000
--- a/package/pulseview/0002-cmake-add-check-for-explicit-linking-against-libatom.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-From 71830c804be76cf6abe913ac2fe584947b7a91ea Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Tue, 24 May 2016 23:08:40 +0200
-Subject: [PATCH] cmake: add check for explicit linking against libatomic
-
-To use atomics functions, some toolchains requires to explicitly add
--latomic to the linker flags (because they are not provided by libc,
-but libatomic).
-
-This change adds a helper function trying to build/link a test program
-using atomics, then calls it to:
-* first check if atomics are directly available in the libc;
-* if not and libatomic has been found, then run the same test with
-  "-latomic" added to the linker flags.
-The pulseview link library list is updated according to the results of
-these tests.
-
-This issue was triggered by the Buildroot farms:
-  http://autobuild.buildroot.org/results/1e3/1e3101261252d5f30fdf842cc99604e4f4c25eef/build-end.log
-
-Notes:
-1- CMAKE_REQUIRED_* variables are only used in check functions. They
-   are not automatically forwarded to/handled by the target commands
-   (such as target_link_library), because the check functions are
-   implemented as macro in CMake code, whereas many target commands
-   are native.
-2- Because of note #1, CMAKE_REQUIRED_LIBRARIES (or its value) must be
-   explicitly passed to the target_link_library command when this is
-   needed.
-3- In this implementation, LIBATOMIC_LIBRARY is only set when it is
-   needed; so, unconditionally appending it to PULSEVIEW_LINK_LIBS
-   will produce the expected behavior.
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-
----
-changes v1->v2:
-- use std::atomic_fetch_add_explicit function instead of
-  __atomic_fetch_add_4;
-- rework code using cmake_*_check_state and find_library helpers;
-- quiet-ize checks and clean outputs
-- extend the commit log
----
- CMakeLists.txt | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 50 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 9dac69f..44f810e 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -107,6 +107,55 @@ endif()
- # This will set ${CMAKE_THREAD_LIBS_INIT} to the correct, OS-specific value.
- find_package(Threads REQUIRED)
- 
-+
-+# Check for explicit link against libatomic
-+#
-+# Depending on the toolchain, linking a program using atomic functions may need
-+# "-latomic" explicitly passed to the linker
-+#
-+# This check first tests if atomics are available in the C-library, if not and
-+# libatomic exists, then it runs the same test with -latomic added to the
-+# linker flags.
-+
-+# Helper for checking for atomics
-+function(check_working_cxx_atomics varname additional_lib)
-+  include(CheckCXXSourceCompiles)
-+  include(CMakePushCheckState)
-+  cmake_push_check_state()
-+  set(CMAKE_REQUIRED_FLAGS "-std=c++11")
-+  set(CMAKE_REQUIRED_LIBRARIES "${additional_lib}")
-+  set(CMAKE_REQUIRED_QUIET 1)
-+  CHECK_CXX_SOURCE_COMPILES("
-+#include <atomic>
-+std::atomic<int> x;
-+int main() {
-+  return std::atomic_fetch_add_explicit(&x, 1, std::memory_order_seq_cst);
-+}
-+" ${varname})
-+  cmake_pop_check_state()
-+endfunction(check_working_cxx_atomics)
-+
-+# First check if atomics work without the library.
-+# If not, check if the library exists, and atomics work with it.
-+check_working_cxx_atomics(HAVE_CXX_ATOMICS_WITHOUT_LIB "")
-+if(HAVE_CXX_ATOMICS_WITHOUT_LIB)
-+  message(STATUS "Atomics provided by the C-library - yes")
-+else()
-+  message(STATUS "Atomics provided by the C-library - no")
-+  find_library(LIBATOMIC_LIBRARY NAMES atomic PATH_SUFFIXES lib)
-+  if(LIBATOMIC_LIBRARY)
-+    check_working_cxx_atomics(HAVE_CXX_ATOMICS_WITH_LIB "${LIBATOMIC_LIBRARY}")
-+    if (HAVE_CXX_ATOMICS_WITH_LIB)
-+      message(STATUS "Atomics provided by libatomic - yes")
-+    else()
-+      message(STATUS "Atomics provided by libatomic - no")
-+      message(FATAL_ERROR "Compiler must support std::atomic!")
-+    endif()
-+  else()
-+    message(FATAL_ERROR "Compiler appears to require libatomic, but cannot find it.")
-+  endif()
-+endif()
-+
- #===============================================================================
- #= System Introspection
- #-------------------------------------------------------------------------------
-@@ -387,6 +436,7 @@ set(PULSEVIEW_LINK_LIBS
- 	${Boost_LIBRARIES}
- 	${QT_LIBRARIES}
- 	${CMAKE_THREAD_LIBS_INIT}
-+	${LIBATOMIC_LIBRARY}
- )
- 
- if(STATIC_PKGDEPS_LIBS)
--- 
-2.8.3
-
diff --git a/package/pulseview/0003-CMakeLists.txt-Avoid-fext-numeric-literals-not-suppo.patch b/package/pulseview/0003-CMakeLists.txt-Avoid-fext-numeric-literals-not-suppo.patch
deleted file mode 100644
index 89137f2..0000000
--- a/package/pulseview/0003-CMakeLists.txt-Avoid-fext-numeric-literals-not-suppo.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 6ad4d7a6f17edecc3523a7ab3d627f9a70dbacc1 Mon Sep 17 00:00:00 2001
-From: Uwe Hermann <uwe@hermann-uwe.de>
-Date: Wed, 17 May 2017 11:00:44 +0200
-Subject: [PATCH] CMakeLists.txt: Avoid -fext-numeric-literals, (not supported
- by clang).
-
-This (re-)fixes bug #863.
-
-Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
----
- CMakeLists.txt | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index e8bc79f..e7e4432 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -395,6 +395,7 @@ add_definitions(${QT_DEFINITIONS} -DQT_NO_KEYWORDS)
- add_definitions(-D__STDC_LIMIT_MACROS)
- add_definitions(-Wall -Wextra)
- add_definitions(-std=c++11)
-+add_definitions(-DBOOST_MATH_DISABLE_FLOAT128=1)
- 
- if(ENABLE_DECODE)
- 	add_definitions(-DENABLE_DECODE)
--- 
-2.9.3
-
diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
index daa0fba..81c73e3 100644
--- a/package/pulseview/Config.in
+++ b/package/pulseview/Config.in
@@ -17,6 +17,7 @@ config BR2_PACKAGE_PULSEVIEW
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
+	select BR2_PACKAGE_BOOST_SERIALIZATION
 	help
 	  PulseView is a Qt based logic analyzer, oscilloscope
 	  and MSO GUI for sigrok.
diff --git a/package/pulseview/pulseview.hash b/package/pulseview/pulseview.hash
index dc50ec6..7883eab 100644
--- a/package/pulseview/pulseview.hash
+++ b/package/pulseview/pulseview.hash
@@ -1,3 +1,2 @@
 # Locally computed
-sha256	5ffe2cb7a602fcdc60933d400c77bcd66e6ce529bc4f6e97d6a5e5a86f2f530e	pulseview-0.3.0.tar.gz
-sha256	7de425dfe3b0f76e76e266374dca8b2951510d232380901ef2abda71c7c30bb0	dcfe0a01f72021aab961245d0ebcc9f8d4504b40.patch
+sha256	78f8291045c6f65b4827b12e83c8e68cea2d5e7268b15a51aaca9726c8100eb9	pulseview-0.4.0.tar.gz
diff --git a/package/pulseview/pulseview.mk b/package/pulseview/pulseview.mk
index fbcf451..e9bbf4f 100644
--- a/package/pulseview/pulseview.mk
+++ b/package/pulseview/pulseview.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# TODO Pulseview can be built and linked against Qt4 as well.
-
-PULSEVIEW_VERSION = 0.3.0
+PULSEVIEW_VERSION = 0.4.0
 PULSEVIEW_SITE = http://sigrok.org/download/source/pulseview
 PULSEVIEW_LICENSE = GPL-3.0+
 PULSEVIEW_LICENSE_FILES = COPYING
