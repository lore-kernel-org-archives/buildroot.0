From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Apr 2016 17:20:50 +0200
Subject: [Buildroot] [git commit] package/jsoncpp: bump version to 1.7.2
Message-ID: <20160424152055.8FF998198B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0bfec0c95bb26975048660437f18e7172909c85b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patches applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jsoncpp/0001-Remove-Werror.patch           | 39 -------------
 .../0002-Add-option-JSONCPP_WITH_STRICT_ISO.patch  | 68 ----------------------
 package/jsoncpp/jsoncpp.mk                         |  2 +-
 3 files changed, 1 insertion(+), 108 deletions(-)

diff --git a/package/jsoncpp/0001-Remove-Werror.patch b/package/jsoncpp/0001-Remove-Werror.patch
deleted file mode 100644
index 178cbbf..0000000
--- a/package/jsoncpp/0001-Remove-Werror.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From d7b84f69c5e92178e110552cce27f900744e1779 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Thu, 30 Jul 2015 23:47:05 +0200
-Subject: [PATCH 1/1] Remove Werror
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
--Werror shouldn't be used in released code since it can cause random build
-failures on moderate warnings. It also depends on the used toolchain since
-different toolchains may or may not print the same warnings.
-
-Backported from: d7b84f69c5e92178e110552cce27f900744e1779
-
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
----
- CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index cab0de8..62bf203 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -97,10 +97,10 @@ endif( MSVC )
- 
- if (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
-   # using regular Clang or AppleClang
--  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Werror -Wall -Wconversion -Wshadow -Wno-sign-conversion")
-+  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall -Wconversion -Wshadow -Wno-sign-conversion")
- elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
-   # using GCC
--  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Werror -Wall -Wconversion -Wshadow -Wextra -pedantic")
-+  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall -Wconversion -Wshadow -Wextra -pedantic")
-   # not yet ready for -Wsign-conversion
- endif()
- 
--- 
-2.5.0
-
diff --git a/package/jsoncpp/0002-Add-option-JSONCPP_WITH_STRICT_ISO.patch b/package/jsoncpp/0002-Add-option-JSONCPP_WITH_STRICT_ISO.patch
deleted file mode 100644
index f6172e9..0000000
--- a/package/jsoncpp/0002-Add-option-JSONCPP_WITH_STRICT_ISO.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 9c5478562eba4bed32577a1dd7ce02b3bb7f6b4e Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Thu, 29 Oct 2015 09:19:41 +0100
-Subject: [PATCH 1/1] Add option JSONCPP_WITH_STRICT_ISO
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-'-pedantic' issues all warnings demanded by strict ISO C/C++; rejecting
-extensions that do not follow ISO C/C++. Without this option, certain GNU
-extensions and traditional C/C++ features are supported as well.
-
-With this option enabled building jsoncpp fails with the musl toolchain on
-x86 because of an incompatible posix_memalign declaration [1]. Without
-'-pedantic' there is no error anymore and jsoncpp builds fine.
-
-Add an option JSONCPP_WITH_STRICT_ISO to disable compilation with '-pedantic'
-with GCC. If jsoncpp is build with the JSONCPP_WITH_WARNING_AS_ERROR option
-'-pedantic-errors' is used instead.
-
-[1] https://gcc.gnu.org/ml/gcc-patches/2015-05/msg01425.html
-
-Backported from: 48bfe910622d79507983fc36254ca9f3ca63acb6
-
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
----
- CMakeLists.txt | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 62bf203..60ecb6f 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -7,6 +7,7 @@ ENABLE_TESTING()
- OPTION(JSONCPP_WITH_TESTS "Compile and (for jsoncpp_check) run JsonCpp test executables" ON)
- OPTION(JSONCPP_WITH_POST_BUILD_UNITTEST "Automatically run unit-tests as a post build step" ON)
- OPTION(JSONCPP_WITH_WARNING_AS_ERROR "Force compilation to fail if a warning occurs" OFF)
-+OPTION(JSONCPP_WITH_STRICT_ISO "Issue all the warnings demanded by strict ISO C and ISO C++" ON)
- OPTION(JSONCPP_WITH_PKGCONFIG_SUPPORT "Generate and install .pc files" ON)
- OPTION(JSONCPP_WITH_CMAKE_PACKAGE "Generate and install cmake package files" OFF)
- OPTION(BUILD_SHARED_LIBS "Build jsoncpp_lib as a shared library." OFF)
-@@ -83,6 +84,9 @@ macro(UseCompilationWarningAsError)
-         # Only enabled in debug because some old versions of VS STL generate
-         # warnings when compiled in release configuration.
- 		set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /WX ")
-+  elseif (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
-+    if (JSONCPP_WITH_STRICT_ISO)
-+      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pedantic-errors")
- 	endif( MSVC )
- endmacro()
- 
-@@ -100,8 +104,12 @@ if (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
-   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall -Wconversion -Wshadow -Wno-sign-conversion")
- elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
-   # using GCC
--  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall -Wconversion -Wshadow -Wextra -pedantic")
-+  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall -Wconversion -Wshadow -Wextra")
-   # not yet ready for -Wsign-conversion
-+
-+  if (JSONCPP_WITH_STRICT_ISO AND NOT JSONCPP_WITH_WARNING_AS_ERROR)
-+    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pedantic")
-+  endif ()
- endif()
- 
- IF(JSONCPP_WITH_WARNING_AS_ERROR)
--- 
-2.6.2
-
diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index 52db2cd..34da14c 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSONCPP_VERSION = 1.6.5
+JSONCPP_VERSION = 1.7.2
 JSONCPP_SITE = $(call github,open-source-parsers,jsoncpp,$(JSONCPP_VERSION))
 JSONCPP_LICENSE = Public Domain or MIT
 JSONCPP_LICENSE_FILES = LICENSE
