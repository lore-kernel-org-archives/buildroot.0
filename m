From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 22:32:52 +0100
Subject: [Buildroot] [git commit] package/open62541: fix build without
 threads
Message-ID: <20210116211509.7C7BA83566@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d9eab98550749e24cc425dc752d5145e5ae5998
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/87ec3c987c991f790757276316d6caf81e635fa2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-CMakeLists.txt-fix-build-without-threads.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/open62541/0002-arch-posix-CMakeLists.txt-fix-build-without-threads.patch b/package/open62541/0002-arch-posix-CMakeLists.txt-fix-build-without-threads.patch
new file mode 100644
index 0000000000..94ee76ad92
--- /dev/null
+++ b/package/open62541/0002-arch-posix-CMakeLists.txt-fix-build-without-threads.patch
@@ -0,0 +1,37 @@
+From a312e82124fb8c9f139d5a40fa5a28123bb77a33 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 10 Jan 2021 14:25:56 +0100
+Subject: [PATCH] arch/posix/CMakeLists.txt: fix build without threads
+
+Fix the following build failure without threads:
+
+[100%] Linking C shared library bin/libopen62541.so
+/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: cannot find -lpthread
+collect2: error: ld returned 1 exit status
+CMakeFiles/open62541.dir/build.make:192: recipe for target 'bin/libopen62541.so.0.0.0' failed
+make[3]: *** [bin/libopen62541.so.0.0.0] Error 1
+
+Fixes:
+ - http://autobuild.buildroot.org/results/87ec3c987c991f790757276316d6caf81e635fa2
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ arch/posix/CMakeLists.txt | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/arch/posix/CMakeLists.txt b/arch/posix/CMakeLists.txt
+index bb24757c..a53c9f2c 100644
+--- a/arch/posix/CMakeLists.txt
++++ b/arch/posix/CMakeLists.txt
+@@ -20,8 +20,6 @@ if (${_index} GREATER -1 OR "${UA_ARCHITECTURE}" STREQUAL "posix")
+           ua_architecture_append_to_library(netdb ndblib socket)
+         else()
+           ua_architecture_append_to_library(m)
+-          #TODO - Error on first make run if pthread is included conditional?
+-          ua_architecture_append_to_library(pthread)
+           if(UA_ENABLE_MULTITHREADING OR UA_BUILD_UNIT_TESTS)
+             ua_architecture_append_to_library(pthread)
+           endif()
+-- 
+2.29.2
+
