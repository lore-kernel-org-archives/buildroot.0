From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 25 Apr 2016 19:50:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/jsoncpp: Do not treat conversion
	warning as error
Message-ID: <1461606641-14927-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/74b/74b1b9f8defc275ff2bc3d877faf2863929737b9/
http://autobuild.buildroot.net/results/71d/71dcaf18e3d42c66af8036a68250eea1be09227b/
http://autobuild.buildroot.net/results/599/5997a9e4a8ca8b6171438495920d0a487518851c/
http://autobuild.buildroot.net/results/4ab/4abde1d7fd631d3b50a6b53824a781a08d022bca/
http://autobuild.buildroot.net/results/968/9680ebd8c804ef15d471519d54f8aa209710414d/
http://autobuild.buildroot.net/results/d5b/d5be4d51458ca10f3f4ff5fd3ad4b3cfd097f3ad/
http://autobuild.buildroot.net/results/b1e/b1e3fc27f3d0cdd6ca8f7aff06f7d5e4108817ec/
http://autobuild.buildroot.net/results/ffb/ffb40572269c63438228000495e1dc78c778788e/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...txt-Treat-conversion-warning-as-error-onl.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/jsoncpp/0001-CMakeLists.txt-Treat-conversion-warning-as-error-onl.patch

diff --git a/package/jsoncpp/0001-CMakeLists.txt-Treat-conversion-warning-as-error-onl.patch b/package/jsoncpp/0001-CMakeLists.txt-Treat-conversion-warning-as-error-onl.patch
new file mode 100644
index 0000000..3e009b9
--- /dev/null
+++ b/package/jsoncpp/0001-CMakeLists.txt-Treat-conversion-warning-as-error-onl.patch
@@ -0,0 +1,37 @@
+From 98a7f56ed41071240274063b2d4e39e4e1c9589f Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Mon, 25 Apr 2016 19:41:28 +0200
+Subject: [PATCH 1/1] CMakeLists.txt: Treat conversion warning as error only
+ with JSONCPP_WITH_WARNING_AS_ERROR=On
+
+Fixes errors when building with buildroot:
+http://autobuild.buildroot.net/?reason=jsoncpp-1.7.2
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+(Patch sent upstream:
+ https://github.com/open-source-parsers/jsoncpp/pull/466)
+---
+ CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 7787850..637fc34 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -107,11 +107,11 @@ if (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
+   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall -Wconversion -Wshadow -Werror=conversion -Werror=sign-compare")
+ elseif (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
+   # using GCC
+-  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall -Wconversion -Wshadow -Wextra -Werror=conversion")
++  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall -Wconversion -Wshadow -Wextra")
+   # not yet ready for -Wsign-conversion
+ 
+   if (JSONCPP_WITH_STRICT_ISO AND NOT JSONCPP_WITH_WARNING_AS_ERROR)
+-    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pedantic")
++    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror=conversion -pedantic")
+   endif ()
+ endif()
+ 
+-- 
+2.8.0.rc3
+
-- 
2.8.0.rc3
