From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 30 Oct 2015 08:06:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/jsoncpp: add patch to fix musl
	build issue on x86
Message-ID: <1446188767-14602-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is replaces two previous sumbissions, the first by Bernd Kuhls [1],
the second by me [2].

The posix_memalign declaration is incompatible with musl for C++ on x86, because
of the exception specification [2]. Note, the referenced patch is part of a
patch series to "Add musl support to GCC".

However, this build issue only happens if compilation is done with the GCC
compiler option '-pedantic' [3] which is done so in jsoncpp.

Fortunately, upstream accepted a patch to opt-out '-pedantic' [4]. We backport
this patch to fix autobuild errors.

Fixes:
http://autobuild.buildroot.net/results/588/5885d33b8d9f17878f565f3ae5371017dc89aede/
http://autobuild.buildroot.net/results/0d9/0d90c7c13ae1640b07709c4c686e0237ada1324d/
http://autobuild.buildroot.net/results/30b/30b98ac7362c27254218a6e521d29971070f8c3c/
http://autobuild.buildroot.net/results/292/29289c125166630aeaf884ccc006bcf12c8aa0f6/

and many more.

[1] https://patchwork.ozlabs.org/patch/505425/
[2] https://patchwork.ozlabs.org/patch/533169/
[3] https://gcc.gnu.org/ml/gcc-patches/2015-05/msg01425.html
[4] https://github.com/open-source-parsers/jsoncpp/commit/48bfe910622d79507983fc36254ca9f3ca63acb6

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 .../0002-Add-option-JSONCPP_WITH_STRICT_ISO.patch  | 68 ++++++++++++++++++++++
 package/jsoncpp/jsoncpp.mk                         |  3 +-
 2 files changed, 70 insertions(+), 1 deletion(-)
 create mode 100644 package/jsoncpp/0002-Add-option-JSONCPP_WITH_STRICT_ISO.patch

diff --git a/package/jsoncpp/0002-Add-option-JSONCPP_WITH_STRICT_ISO.patch b/package/jsoncpp/0002-Add-option-JSONCPP_WITH_STRICT_ISO.patch
new file mode 100644
index 0000000..f6172e9
--- /dev/null
+++ b/package/jsoncpp/0002-Add-option-JSONCPP_WITH_STRICT_ISO.patch
@@ -0,0 +1,68 @@
+From 9c5478562eba4bed32577a1dd7ce02b3bb7f6b4e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Thu, 29 Oct 2015 09:19:41 +0100
+Subject: [PATCH 1/1] Add option JSONCPP_WITH_STRICT_ISO
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+'-pedantic' issues all warnings demanded by strict ISO C/C++; rejecting
+extensions that do not follow ISO C/C++. Without this option, certain GNU
+extensions and traditional C/C++ features are supported as well.
+
+With this option enabled building jsoncpp fails with the musl toolchain on
+x86 because of an incompatible posix_memalign declaration [1]. Without
+'-pedantic' there is no error anymore and jsoncpp builds fine.
+
+Add an option JSONCPP_WITH_STRICT_ISO to disable compilation with '-pedantic'
+with GCC. If jsoncpp is build with the JSONCPP_WITH_WARNING_AS_ERROR option
+'-pedantic-errors' is used instead.
+
+[1] https://gcc.gnu.org/ml/gcc-patches/2015-05/msg01425.html
+
+Backported from: 48bfe910622d79507983fc36254ca9f3ca63acb6
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ CMakeLists.txt | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 62bf203..60ecb6f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -7,6 +7,7 @@ ENABLE_TESTING()
+ OPTION(JSONCPP_WITH_TESTS "Compile and (for jsoncpp_check) run JsonCpp test executables" ON)
+ OPTION(JSONCPP_WITH_POST_BUILD_UNITTEST "Automatically run unit-tests as a post build step" ON)
+ OPTION(JSONCPP_WITH_WARNING_AS_ERROR "Force compilation to fail if a warning occurs" OFF)
++OPTION(JSONCPP_WITH_STRICT_ISO "Issue all the warnings demanded by strict ISO C and ISO C++" ON)
+ OPTION(JSONCPP_WITH_PKGCONFIG_SUPPORT "Generate and install .pc files" ON)
+ OPTION(JSONCPP_WITH_CMAKE_PACKAGE "Generate and install cmake package files" OFF)
+ OPTION(BUILD_SHARED_LIBS "Build jsoncpp_lib as a shared library." OFF)
+@@ -83,6 +84,9 @@ macro(UseCompilationWarningAsError)
+         # Only enabled in debug because some old versions of VS STL generate
+         # warnings when compiled in release configuration.
+ 		set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /WX ")
++  elseif (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
++    if (JSONCPP_WITH_STRICT_ISO)
++      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pedantic-errors")
+ 	endif( MSVC )
+ endmacro()
+ 
+@@ -100,8 +104,12 @@ if (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
+   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall -Wconversion -Wshadow -Wno-sign-conversion")
+ elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
+   # using GCC
+-  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall -Wconversion -Wshadow -Wextra -pedantic")
++  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall -Wconversion -Wshadow -Wextra")
+   # not yet ready for -Wsign-conversion
++
++  if (JSONCPP_WITH_STRICT_ISO AND NOT JSONCPP_WITH_WARNING_AS_ERROR)
++    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pedantic")
++  endif ()
+ endif()
+ 
+ IF(JSONCPP_WITH_WARNING_AS_ERROR)
+-- 
+2.6.2
+
diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index 132e264..52db2cd 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -12,6 +12,7 @@ JSONCPP_INSTALL_STAGING = YES
 
 JSONCPP_CONF_OPTS += \
 	-DJSONCPP_WITH_POST_BUILD_UNITTEST=OFF \
-	-DJSONCPP_WITH_TESTS=OFF
+	-DJSONCPP_WITH_TESTS=OFF \
+	-DJSONCPP_WITH_STRICT_ISO=OFF
 
 $(eval $(cmake-package))
-- 
2.6.2
