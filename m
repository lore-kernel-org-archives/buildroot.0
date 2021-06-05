From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Jun 2021 21:47:14 +0200
Subject: [Buildroot] [git commit] package/intel-mediadriver: disable -Werror
Message-ID: <20210605191658.BDB2D878C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e93eaf7248d62e5e79a3b0e46de7483094a276d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable -Werror to avoid the following build failure:

<command-line>: error: "_FORTIFY_SOURCE" redefined [-Werror]

MEDIA_BUILD_FATAL_WARNINGS option is available since version 18.2.0 and
https://github.com/intel/media-driver/commit/6932fc0ffb8228245052528820adafb6743f7482

Fixes:
 - http://autobuild.buildroot.org/results/52638d95312e464626d1c4047b3b26d4f57a1cd2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...ux-CMakelists.txt-respect-MEDIA_BUILD_FAT.patch | 51 ++++++++++++++++++++++
 package/intel-mediadriver/intel-mediadriver.mk     |  1 +
 2 files changed, 52 insertions(+)

diff --git a/package/intel-mediadriver/0003-cmrtlib-linux-CMakelists.txt-respect-MEDIA_BUILD_FAT.patch b/package/intel-mediadriver/0003-cmrtlib-linux-CMakelists.txt-respect-MEDIA_BUILD_FAT.patch
new file mode 100644
index 0000000000..bc7a27f4d0
--- /dev/null
+++ b/package/intel-mediadriver/0003-cmrtlib-linux-CMakelists.txt-respect-MEDIA_BUILD_FAT.patch
@@ -0,0 +1,51 @@
+From f09fddd6763aca237f19417de05a1f5de7f51d40 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 5 Jun 2021 16:57:32 +0200
+Subject: [PATCH] cmrtlib/linux/CMakelists.txt: respect
+ MEDIA_BUILD_FATAL_WARNINGS
+
+Respect MEDIA_BUILD_FATAL_WARNINGS to avoid the following build failure
+when the user provides _FORTIFY_SOURCE:
+
+In file included from /home/buildroot/autobuild/instance-0/output-1/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/dlfcn.h:22,
+                 from /home/buildroot/autobuild/instance-0/output-1/build/intel-mediadriver-19.4.0r/cmrtlib/linux/../linux/share/cm_include.h:30,
+                 from /home/buildroot/autobuild/instance-0/output-1/build/intel-mediadriver-19.4.0r/cmrtlib/agnostic/share/cm_printf_host.cpp:23:
+/home/buildroot/autobuild/instance-0/output-1/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/features.h:397:4: error: #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
+  397 | #  warning _FORTIFY_SOURCE requires compiling with optimization (-O)
+      |    ^~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/52638d95312e464626d1c4047b3b26d4f57a1cd2
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/intel/media-driver/pull/1203]
+---
+ cmrtlib/linux/CMakeLists.txt | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/cmrtlib/linux/CMakeLists.txt b/cmrtlib/linux/CMakeLists.txt
+index 7a0193a8..65f71cee 100644
+--- a/cmrtlib/linux/CMakeLists.txt
++++ b/cmrtlib/linux/CMakeLists.txt
+@@ -32,12 +32,16 @@ else()
+ 
+ # Set up compile options that will be used for the Linux build
+ if(CMAKE_COMPILER_IS_GNUCC)
+-    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -msse4.1 -std=c++11 -fPIC -fpermissive -Werror")
++    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -msse4.1 -std=c++11 -fPIC -fpermissive")
+     set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -fno-strict-aliasing ")
+     set(CMAKE_CXX_FLAGS_DEBUG   "${CMAKE_CXX_FLAGS_DEBUG} -D_DEBUG -D__DEBUG -O0")
+-    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -msse4.1 -std=c++11 -fPIC -fpermissive -Werror")
++    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -msse4.1 -std=c++11 -fPIC -fpermissive")
+     set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -fno-strict-aliasing")
+     set(CMAKE_C_FLAGS_DEBUG   "${CMAKE_C_FLAGS_DEBUG} -D_DEBUG -D__DEBUG -O0")
++    if(MEDIA_BUILD_FATAL_WARNINGS)
++        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS} -Werror")
++        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CMAKE_C_FLAGS} -Werror")
++    endif()
+ 
+    set(GCC_SECURE_LINK_FLAGS "-z relro -z now")
+    set(CMAKE_SKIP_RPATH ON)
+-- 
+2.30.2
+
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 963e4b8f9c..01423b9611 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -23,6 +23,7 @@ INTEL_MEDIADRIVER_SUPPORTS_IN_SOURCE_BUILD = NO
 
 INTEL_MEDIADRIVER_CONF_OPTS = \
 	-DINSTALL_DRIVER_SYSCONF=OFF \
+	-DMEDIA_BUILD_FATAL_WARNINGS=OFF \
 	-DMEDIA_RUN_TEST_SUITE=OFF
 
 $(eval $(cmake-package))
