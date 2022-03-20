Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFE9C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 18:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1151C408D2;
	Sun, 20 Mar 2022 18:15:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hiarZRg1ecRC; Sun, 20 Mar 2022 18:15:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A32F408A2;
	Sun, 20 Mar 2022 18:15:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 83B091BF4D8
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 18:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71CBB40593
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 18:15:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zRBvYevIBZlK for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 18:15:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41FDD40577
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 18:15:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 65E9C845D8; Sun, 20 Mar 2022 18:06:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 19:14:23 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 46c073662bc24bb7c5b9fd1a27ae1945d0439528
X-Git-Newrev: fd0c2292f2a46bfcc61e73c2d4567f50b547b787
X-Patchwork-Hint: ignore
Message-Id: <20220320180628.65E9C845D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rpi-userland: fix
 build with libexecinfo
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

commit: https://git.buildroot.net/buildroot/commit/?id=fd0c2292f2a46bfcc61e73c2d4567f50b547b787
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure raised on uclibc and musl since the
addition of libexecinfo package in commit
eea8ba446c10701a273432552108d80fb2224ef4:

/home/peko/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../../build/lib/libvcos.so: undefined reference to `backtrace_symbols'

Fixes:
 - http://autobuild.buildroot.org/results/93d3b8cc2ac5dfa9d4b44946c0b4d8171e8f52a1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit bc4cc27705de50356d7e9945e41bd989fdc56fe8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...006-don-t-override-CMAKE_EXE_LINKER_FLAGS.patch | 58 ++++++++++++++++++++++
 package/rpi-userland/rpi-userland.mk               |  5 ++
 2 files changed, 63 insertions(+)

diff --git a/package/rpi-userland/0006-don-t-override-CMAKE_EXE_LINKER_FLAGS.patch b/package/rpi-userland/0006-don-t-override-CMAKE_EXE_LINKER_FLAGS.patch
new file mode 100644
index 0000000000..bf2a9eb6ea
--- /dev/null
+++ b/package/rpi-userland/0006-don-t-override-CMAKE_EXE_LINKER_FLAGS.patch
@@ -0,0 +1,58 @@
+From 87febf8b7b1c0a6d0ea1d26770d3665008d66fd2 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 25 Feb 2022 19:21:06 +0100
+Subject: [PATCH] don't override CMAKE_EXE_LINKER_FLAGS
+
+Don't override CMAKE_EXE_LINKER_FLAGS as it could be used by the user to
+pass additional flags such as -lexecinfo on musl and uclibc-ng
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/raspberrypi/userland/pull/719]
+---
+ host_applications/android/apps/vidtex/CMakeLists.txt | 2 +-
+ host_applications/linux/apps/raspicam/CMakeLists.txt | 2 +-
+ makefiles/cmake/arm-linux.cmake                      | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/host_applications/android/apps/vidtex/CMakeLists.txt b/host_applications/android/apps/vidtex/CMakeLists.txt
+index e7206cc..16c64db 100644
+--- a/host_applications/android/apps/vidtex/CMakeLists.txt
++++ b/host_applications/android/apps/vidtex/CMakeLists.txt
+@@ -5,7 +5,7 @@ SET(COMPILE_DEFINITIONS -Werror -Wall)
+ # Set --no-as-needed to stop the linker discarding mmal_vc_client
+ # as it can't see that the constructor registers a load of functionality
+ # with the MMAL core.
+-SET( CMAKE_EXE_LINKER_FLAGS "-Wl,--no-as-needed" )
++SET( CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--no-as-needed" )
+ 
+ include_directories(${PROJECT_SOURCE_DIR}/host_applications/linux/libs/bcm_host/include)
+ 
+diff --git a/host_applications/linux/apps/raspicam/CMakeLists.txt b/host_applications/linux/apps/raspicam/CMakeLists.txt
+index e6bd373..2f72eb2 100644
+--- a/host_applications/linux/apps/raspicam/CMakeLists.txt
++++ b/host_applications/linux/apps/raspicam/CMakeLists.txt
+@@ -6,7 +6,7 @@ SET(COMPILE_DEFINITIONS -Werror)
+ # Set --no-as-needed to stop the linker discarding mmal_vc_client
+ # as it can't see that the constructor registers a load of functionality
+ # with the MMAL core.
+-SET( CMAKE_EXE_LINKER_FLAGS "-Wl,--no-as-needed" )
++SET( CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--no-as-needed" )
+ 
+ include_directories(${PROJECT_SOURCE_DIR}/host_applications/linux/libs/bcm_host/include)
+ include_directories(${PROJECT_SOURCE_DIR}/host_applications/linux/apps/raspicam/)
+diff --git a/makefiles/cmake/arm-linux.cmake b/makefiles/cmake/arm-linux.cmake
+index 957846a..e172282 100644
+--- a/makefiles/cmake/arm-linux.cmake
++++ b/makefiles/cmake/arm-linux.cmake
+@@ -93,7 +93,7 @@ if(ANDROID)
+     set(CMAKE_SHARED_LINKER_FLAGS "-nostdlib ${ANDROID_CRTBEGIN} -Wl,-Bdynamic -Wl,-T${ANDROID_LDSCRIPTS}/armelf.x")
+ 
+     link_directories(${ANDROID_LIBS})
+-    set(CMAKE_EXE_LINKER_FLAGS "-nostdlib ${ANDROID_CRTBEGIN} -nostdlib -Wl,-z,noexecstack") 
++    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -nostdlib ${ANDROID_CRTBEGIN} -nostdlib -Wl,-z,noexecstack") 
+     set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,-dynamic-linker,/system/bin/linker -Wl,-rpath,${CMAKE_INSTALL_PREFIX}/lib")
+     set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,-T${ANDROID_LDSCRIPTS}/armelf.x -Wl,--gc-sections")
+     set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,-z,nocopyreloc -Wl,-z,noexecstack -Wl,--fix-cortex-a8 -Wl,--no-undefined")
+-- 
+2.34.1
+
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 84050b6df3..3564ec0703 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -13,6 +13,11 @@ RPI_USERLAND_CONF_OPTS = -DVMCS_INSTALL_PREFIX=/usr
 
 RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+RPI_USERLAND_DEPENDENCIES += libexecinfo
+RPI_USERLAND_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-lexecinfo
+endif
+
 ifeq ($(BR2_PACKAGE_RPI_USERLAND_HELLO),y)
 
 RPI_USERLAND_CONF_OPTS += -DALL_APPS=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
