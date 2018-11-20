From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Nov 2018 23:12:48 +0100
Subject: [Buildroot] [git commit] libcorrect: fix debug build
Message-ID: <20181120221012.2A1C983CEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43e6de35e934429f51fc7c0efa49b7e163e9ea7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to use -fsanitize=address only when available

Fixes:
 - http://autobuild.buildroot.net/results/221d6a418e75b39fe645c3a56cee676518d2cff6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...s.txt-conditionally-use-fsanitize-address.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/libcorrect/0002-CMakeLists.txt-conditionally-use-fsanitize-address.patch b/package/libcorrect/0002-CMakeLists.txt-conditionally-use-fsanitize-address.patch
new file mode 100644
index 0000000000..82e4f13e66
--- /dev/null
+++ b/package/libcorrect/0002-CMakeLists.txt-conditionally-use-fsanitize-address.patch
@@ -0,0 +1,35 @@
+From 1a3bb66608b2f96407d14fe13b782626990060f1 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 20 Nov 2018 08:20:13 +0100
+Subject: [PATCH] CMakeLists.txt: conditionally use -fsanitize=address
+
+Check that compiler supports -fsanitize=address before using it
+
+Fixes:
+ - http://autobuild.buildroot.net/results/221d6a418e75b39fe645c3a56cee676518d2cff6
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ CMakeLists.txt | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2e8e07e..c3f71ce 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -17,7 +17,11 @@ if(COMPILER_SUPPORTS_WPEDANTIC)
+ set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wpedantic")
+ endif()
+ if(CMAKE_BUILD_TYPE STREQUAL "Debug")
+-    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -g3 -O0 -fsanitize=address")
++    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -g3 -O0")
++    check_c_compiler_flag("-fsanitize=address -Werror" COMPILER_SUPPORTS_SANITIZE_ADDRESS)
++    if(COMPILER_SUPPORTS_SANITIZE_ADDRESS)
++        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fsanitize=address")
++    endif()
+     set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,-no_pie,")
+ else()
+   if("${CMAKE_C_COMPILER_ID}" STREQUAL "Clang")
+-- 
+2.14.1
+
