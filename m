From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 May 2020 20:24:06 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/paho-mqtt-c: fix
 build on uclibc or musl
Message-ID: <20200510191328.99DD09131F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c53538af04110ee1429c7a8e2f9eb7d73d35989d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes:
 - http://autobuild.buildroot.org/results/4beb96d43180813906578b42875a1c3d4a905ed7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 91beea442a6b0e2d339b0d6cfb4ca91cbf6b30d9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...MakeLists.txt-fix-build-on-uclibc-or-musl.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/paho-mqtt-c/0001-src-CMakeLists.txt-fix-build-on-uclibc-or-musl.patch b/package/paho-mqtt-c/0001-src-CMakeLists.txt-fix-build-on-uclibc-or-musl.patch
new file mode 100644
index 0000000000..7989f045b9
--- /dev/null
+++ b/package/paho-mqtt-c/0001-src-CMakeLists.txt-fix-build-on-uclibc-or-musl.patch
@@ -0,0 +1,45 @@
+From 517e8659ab566b15cc409490a432e8935b164de8 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 24 Apr 2020 11:55:41 +0200
+Subject: [PATCH] src/CMakeLists.txt: fix build on uclibc or musl
+
+Build of version 1.3.2 with uclibc or musl fails on:
+
+[ 58%] Linking C shared library libpaho-mqtt3c.so
+/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/5.5.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -lanl
+collect2: error: ld returned 1 exit status
+
+This is due to commit 21ffebcb749fc8bd8578df85550f03f74e571620 which
+added a link to anl which is not available on uclibc or musl.
+
+Fix this by checking if anl is found on the system before using it
+
+Fixes:
+ - http://autobuild.buildroot.org/results/4beb96d43180813906578b42875a1c3d4a905ed7
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/eclipse/paho.mqtt.c/commit/517e8659ab566b15cc409490a432e8935b164de8]
+---
+ src/CMakeLists.txt | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index fb367b37..95fd43e7 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -60,7 +60,13 @@ IF (WIN32)
+     SET(LIBS_SYSTEM ws2_32 crypt32 RpcRT4)
+ ELSEIF (UNIX)
+     IF(CMAKE_SYSTEM_NAME MATCHES "Linux")
+-        SET(LIBS_SYSTEM c dl pthread anl rt)
++        SET(LIBS_SYSTEM c dl pthread rt)
++        # anl is only available with glibc so check if it is found before using
++        # it or build will fail on uclibc or musl
++        FIND_LIBRARY(LIB_ANL anl)
++        IF(LIB_ANL)
++            SET(LIBS_SYSTEM "${LIBS_SYSTEM} ${LIB_ANL}")
++        ENDIF()
+         ADD_DEFINITIONS(-D_GNU_SOURCE -fvisibility=hidden)
+     ELSEIF (CMAKE_SYSTEM_NAME MATCHES "Android")
+         SET(LIBS_SYSTEM c dl)
