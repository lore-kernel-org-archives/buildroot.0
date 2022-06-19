Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39373C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 13:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D78CB60E2E;
	Sun, 19 Jun 2022 13:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D78CB60E2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tj0CZhk6XQE3; Sun, 19 Jun 2022 13:06:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABE7B60C33;
	Sun, 19 Jun 2022 13:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABE7B60C33
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9F4861BF3D8
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 13:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A3FE607EC
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 13:06:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A3FE607EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E79MPoxyPdET for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 13:06:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EA77607D0
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 13:06:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EA77607D0
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6ABEF87187; Sun, 19 Jun 2022 12:53:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 15:05:31 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 0d9aaabd52f6d28ac481b8cd00a25233fb8e8676
X-Git-Newrev: a6d51d0b2d8fb8fcee64fe250b8f8f543fc58931
X-Patchwork-Hint: ignore
Message-Id: <20220619125343.6ABEF87187@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/rpi-userland: fix
 libexecinfo workaround
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a6d51d0b2d8fb8fcee64fe250b8f8f543fc58931
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fix libexecinfo workaround to avoid the following ffmpeg build failure
with BR2_PACKAGE_RPI_USERLAND raised on uclibc and musl since commit
bc4cc27705de50356d7e9945e41bd989fdc56fe8:

/home/giuliobenetti/autobuild/run/instance-3/output-1/host/bin/arm-linux-gcc --sysroot=/home/giuliobenetti/autobuild/run/instance-3/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot -mcpu=arm926ej-s -Wl,--as-needed -Wl,-z,noexecstack -o /tmp/ffconf.5K0cMIh3/test /tmp/ffconf.5K0cMIh3/test.o -lmmal_core -lmmal_util -lmmal_vc_client -lbcm_host -latomic
/home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/giuliobenetti/autobuild/run/instance-3/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libvcos.so: undefined reference to `backtrace_symbols'

[...]

ERROR: mmal not found

Fixes:
 - http://autobuild.buildroot.org/results/64d21872d25fef35b72106133ed2aed300f52f2f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 66d7d3bec341188bcfd83fa70b44dd62e0073431)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...006-don-t-override-CMAKE_EXE_LINKER_FLAGS.patch | 58 ----------------------
 ...cos-pthreads-CMakeLists.txt-fix-build-wit.patch | 45 +++++++++++++++++
 package/rpi-userland/rpi-userland.mk               |  1 -
 3 files changed, 45 insertions(+), 59 deletions(-)

diff --git a/package/rpi-userland/0006-don-t-override-CMAKE_EXE_LINKER_FLAGS.patch b/package/rpi-userland/0006-don-t-override-CMAKE_EXE_LINKER_FLAGS.patch
deleted file mode 100644
index bf2a9eb6ea..0000000000
--- a/package/rpi-userland/0006-don-t-override-CMAKE_EXE_LINKER_FLAGS.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 87febf8b7b1c0a6d0ea1d26770d3665008d66fd2 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 25 Feb 2022 19:21:06 +0100
-Subject: [PATCH] don't override CMAKE_EXE_LINKER_FLAGS
-
-Don't override CMAKE_EXE_LINKER_FLAGS as it could be used by the user to
-pass additional flags such as -lexecinfo on musl and uclibc-ng
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/raspberrypi/userland/pull/719]
----
- host_applications/android/apps/vidtex/CMakeLists.txt | 2 +-
- host_applications/linux/apps/raspicam/CMakeLists.txt | 2 +-
- makefiles/cmake/arm-linux.cmake                      | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/host_applications/android/apps/vidtex/CMakeLists.txt b/host_applications/android/apps/vidtex/CMakeLists.txt
-index e7206cc..16c64db 100644
---- a/host_applications/android/apps/vidtex/CMakeLists.txt
-+++ b/host_applications/android/apps/vidtex/CMakeLists.txt
-@@ -5,7 +5,7 @@ SET(COMPILE_DEFINITIONS -Werror -Wall)
- # Set --no-as-needed to stop the linker discarding mmal_vc_client
- # as it can't see that the constructor registers a load of functionality
- # with the MMAL core.
--SET( CMAKE_EXE_LINKER_FLAGS "-Wl,--no-as-needed" )
-+SET( CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--no-as-needed" )
- 
- include_directories(${PROJECT_SOURCE_DIR}/host_applications/linux/libs/bcm_host/include)
- 
-diff --git a/host_applications/linux/apps/raspicam/CMakeLists.txt b/host_applications/linux/apps/raspicam/CMakeLists.txt
-index e6bd373..2f72eb2 100644
---- a/host_applications/linux/apps/raspicam/CMakeLists.txt
-+++ b/host_applications/linux/apps/raspicam/CMakeLists.txt
-@@ -6,7 +6,7 @@ SET(COMPILE_DEFINITIONS -Werror)
- # Set --no-as-needed to stop the linker discarding mmal_vc_client
- # as it can't see that the constructor registers a load of functionality
- # with the MMAL core.
--SET( CMAKE_EXE_LINKER_FLAGS "-Wl,--no-as-needed" )
-+SET( CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--no-as-needed" )
- 
- include_directories(${PROJECT_SOURCE_DIR}/host_applications/linux/libs/bcm_host/include)
- include_directories(${PROJECT_SOURCE_DIR}/host_applications/linux/apps/raspicam/)
-diff --git a/makefiles/cmake/arm-linux.cmake b/makefiles/cmake/arm-linux.cmake
-index 957846a..e172282 100644
---- a/makefiles/cmake/arm-linux.cmake
-+++ b/makefiles/cmake/arm-linux.cmake
-@@ -93,7 +93,7 @@ if(ANDROID)
-     set(CMAKE_SHARED_LINKER_FLAGS "-nostdlib ${ANDROID_CRTBEGIN} -Wl,-Bdynamic -Wl,-T${ANDROID_LDSCRIPTS}/armelf.x")
- 
-     link_directories(${ANDROID_LIBS})
--    set(CMAKE_EXE_LINKER_FLAGS "-nostdlib ${ANDROID_CRTBEGIN} -nostdlib -Wl,-z,noexecstack") 
-+    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -nostdlib ${ANDROID_CRTBEGIN} -nostdlib -Wl,-z,noexecstack") 
-     set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,-dynamic-linker,/system/bin/linker -Wl,-rpath,${CMAKE_INSTALL_PREFIX}/lib")
-     set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,-T${ANDROID_LDSCRIPTS}/armelf.x -Wl,--gc-sections")
-     set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,-z,nocopyreloc -Wl,-z,noexecstack -Wl,--fix-cortex-a8 -Wl,--no-undefined")
--- 
-2.34.1
-
diff --git a/package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.patch b/package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.patch
new file mode 100644
index 0000000000..e799c82418
--- /dev/null
+++ b/package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.patch
@@ -0,0 +1,45 @@
+From 220c37b496f5c883bbfa955ee7fee471e41c34d4 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 25 Feb 2022 19:21:06 +0100
+Subject: [PATCH] interface/vcos/pthreads/CMakeLists.txt: fix build with
+ libexecinfo
+
+interface/vcos/glibc/vcos_backtrace.c uses execinfo.h which can be
+provided by libexecinfo on uclibc or musl so link with it if needed to
+avoid the following build failure:
+
+/home/peko/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../../build/lib/libvcos.so: undefined reference to `backtrace_symbols'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/93d3b8cc2ac5dfa9d4b44946c0b4d8171e8f52a1
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/raspberrypi/userland/pull/719]
+---
+ interface/vcos/pthreads/CMakeLists.txt | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/interface/vcos/pthreads/CMakeLists.txt b/interface/vcos/pthreads/CMakeLists.txt
+index 1d81ca3..43aca03 100644
+--- a/interface/vcos/pthreads/CMakeLists.txt
++++ b/interface/vcos/pthreads/CMakeLists.txt
+@@ -33,12 +33,14 @@ set (SOURCES
+    ../generic/vcos_generic_blockpool.c
+ )
+ 
++find_library (EXECINFO_LIBRARY execinfo)
++
+ if (VCOS_PTHREADS_BUILD_SHARED)
+    add_library (vcos SHARED ${SOURCES})
+-   target_link_libraries (vcos pthread dl rt)
++   target_link_libraries (vcos pthread dl rt ${EXECINFO_LIBRARY})
+ else ()
+    add_library (vcos ${SOURCES})
+-   target_link_libraries (vcos pthread rt)
++   target_link_libraries (vcos pthread rt ${EXECINFO_LIBRARY})
+ endif ()
+ 
+ 
+-- 
+2.35.1
+
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 3564ec0703..1204196e19 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -15,7 +15,6 @@ RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg
 
 ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
 RPI_USERLAND_DEPENDENCIES += libexecinfo
-RPI_USERLAND_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-lexecinfo
 endif
 
 ifeq ($(BR2_PACKAGE_RPI_USERLAND_HELLO),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
