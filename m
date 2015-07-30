From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 31 Jul 2015 00:15:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/jsoncpp: bump to version 1.6.5
Message-ID: <1438294547-8240-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch 0001-Revert-Use-std-namespace-for-snprintf.patch:
This patch was initially intented to remove upstream commit
1c58876185d2a4ed87dac4a54b82f607e74f55fd to disable std::snprintf() for all
compilers. However, the patch actually reverts upstream commit
240ddb6a1b7aae7c6528e328995812ee695a73af which only uses std namespace if the
compiler defines __cplusplus >= 201103L, thus is a recent C++11 compiler.
Furthermore, upstream commit fac87108a49fb1b2640eff5d8e4cc7a12723a510 adds
the `-std=c++11` compiler flag to gcc, so jsoncpp now requires a C++11 compiler
either way.

With jsoncpp requiring a recent C++11 compiler we have to disable some old
toolchains which do not understand `-std=c++11`.

Add a patch to remove `-Werror` from the compiler flags to allow building with
CS ARM toolchains. Patch is pending upstream [1].

[1]
https://github.com/open-source-parsers/jsoncpp/pull/323

Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/jsoncpp/0001-Remove-Werror.patch           | 37 ++++++++++++++++++++
 ...001-Revert-Use-std-namespace-for-snprintf.patch | 39 ----------------------
 package/jsoncpp/Config.in                          | 12 +++++++
 package/jsoncpp/jsoncpp.mk                         |  2 +-
 4 files changed, 50 insertions(+), 40 deletions(-)
 create mode 100644 package/jsoncpp/0001-Remove-Werror.patch
 delete mode 100644 package/jsoncpp/0001-Revert-Use-std-namespace-for-snprintf.patch

diff --git a/package/jsoncpp/0001-Remove-Werror.patch b/package/jsoncpp/0001-Remove-Werror.patch
new file mode 100644
index 0000000..5c28ba7
--- /dev/null
+++ b/package/jsoncpp/0001-Remove-Werror.patch
@@ -0,0 +1,37 @@
+From d7b84f69c5e92178e110552cce27f900744e1779 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Thu, 30 Jul 2015 23:47:05 +0200
+Subject: [PATCH 1/1] Remove Werror
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+-Werror shouldn't be used in released code since it can cause random build
+failures on moderate warnings. It also depends on the used toolchain since
+different toolchains may or may not print the same warnings.
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index cab0de8..62bf203 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -97,10 +97,10 @@ endif( MSVC )
+ 
+ if (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
+   # using regular Clang or AppleClang
+-  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Werror -Wall -Wconversion -Wshadow -Wno-sign-conversion")
++  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall -Wconversion -Wshadow -Wno-sign-conversion")
+ elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
+   # using GCC
+-  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Werror -Wall -Wconversion -Wshadow -Wextra -pedantic")
++  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall -Wconversion -Wshadow -Wextra -pedantic")
+   # not yet ready for -Wsign-conversion
+ endif()
+ 
+-- 
+2.5.0
+
diff --git a/package/jsoncpp/0001-Revert-Use-std-namespace-for-snprintf.patch b/package/jsoncpp/0001-Revert-Use-std-namespace-for-snprintf.patch
deleted file mode 100644
index 7935849..0000000
--- a/package/jsoncpp/0001-Revert-Use-std-namespace-for-snprintf.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 29bfb6ac06b7304d326e3b70fc0209a702b89d83 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Subject: [PATCH] Revert "Use std namespace for snprintf."
-
-This reverts commit 1c58876185d2a4ed87dac4a54b82f607e74f55fd.
-
-std::snprintf() is only available in C++11, which is not provided by
-all compilers. Since the C library snprintf() can easily be used as a
-replacement on Linux systems, this patch changes jsoncpp to use the C
-library snprintf() instead of C++11 std::snprintf(), fixing the build error
-below:
-
-src/lib_json/json_writer.cpp:33:18: error: 'snprintf' is not a member of 'std'
-
-Upstream status: sent upstream
-package/jsoncpp/0001-Revert-Use-std-namespace-for-snprintf.patch
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-
- src/lib_json/json_writer.cpp | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/src/lib_json/json_writer.cpp b/src/lib_json/json_writer.cpp
-index 83102fd2bb86..f7ad1e21bbc0 100644
---- a/src/lib_json/json_writer.cpp
-+++ b/src/lib_json/json_writer.cpp
-@@ -29,8 +29,6 @@
- 
- #if defined(_MSC_VER) && _MSC_VER < 1500 // VC++ 8.0 and below
- #define snprintf _snprintf
--#elif __cplusplus >= 201103L
--#define snprintf std::snprintf
- #endif
- 
- #if defined(_MSC_VER) && _MSC_VER >= 1400 // VC++ 8.0
--- 
-2.1.4
-
diff --git a/package/jsoncpp/Config.in b/package/jsoncpp/Config.in
index 2c96f13..15e59d1 100644
--- a/package/jsoncpp/Config.in
+++ b/package/jsoncpp/Config.in
@@ -1,4 +1,10 @@
 config BR2_PACKAGE_JSONCPP
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # Too old, no C++11
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # Ditto
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # Ditto
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 # Ditto
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009 # Ditto
+	depends on !BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109 # Ditto
 	depends on BR2_INSTALL_LIBSTDCPP
 	bool "jsoncpp"
 	help
@@ -11,4 +17,10 @@ config BR2_PACKAGE_JSONCPP
 	  https://github.com/open-source-parsers/jsoncpp
 
 comment "jsoncpp needs a toolchain w/ C++"
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # Too old, no C++11
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # Ditto
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # Ditto
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 # Ditto
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009 # Ditto
+	depends on !BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109 # Ditto
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index 63b18e6..132e264 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSONCPP_VERSION = 1.6.1
+JSONCPP_VERSION = 1.6.5
 JSONCPP_SITE = $(call github,open-source-parsers,jsoncpp,$(JSONCPP_VERSION))
 JSONCPP_LICENSE = Public Domain or MIT
 JSONCPP_LICENSE_FILES = LICENSE
-- 
2.5.0
