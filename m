Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07FEC433EF
	for <buildroot@archiver.kernel.org>; Fri, 25 Feb 2022 18:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 400D2418D8;
	Fri, 25 Feb 2022 18:52:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jF-mtF40lwTi; Fri, 25 Feb 2022 18:52:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47A5D418B0;
	Fri, 25 Feb 2022 18:52:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 350FA1BF3BA
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 18:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22087404DD
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 18:52:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 31qSYp0C62Q1 for <buildroot@lists.busybox.net>;
 Fri, 25 Feb 2022 18:52:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1A3540323
 for <buildroot@buildroot.org>; Fri, 25 Feb 2022 18:52:26 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id i19so2171828wmq.5
 for <buildroot@buildroot.org>; Fri, 25 Feb 2022 10:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IuFabWjpcQpkj2HMzCT3W3KaKrorRE0zkw1gsStyBvg=;
 b=gbMmx+6qId1hzugvIKD7aienb/Ckr4CyDJIZB7lIF+0XtesTUaFM+NG9GZSlBKyDD3
 ldkD2ugz6leILxl5eBDsngSPlK+5Kw6+sAhWYAypkbI1m40rCVhqAytdNb0tGir1eFn6
 ljRl2FoJV1uGgtCmdy5XcHxB/iiFlwYFzzkGR2wlSK4Xs8HeWeAunVOiXzc7FT0f7hs8
 80raI0AA9NtFtkvF7xsYrR7iRzIxmz9hjjsA4UREovjf7J0SXPWAgABzOcZIGjZhmcdo
 Ft6FBRO53r+5Sb3GRWHVWzapg7DNp2+/H+xJj3/ZgdAXMDYrGdJtfxMod1EiKtS5CkeT
 ZoMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IuFabWjpcQpkj2HMzCT3W3KaKrorRE0zkw1gsStyBvg=;
 b=3jCYLKvc4tY9i1jTaTjsrSXZnMLp+gZTR2Yy1hXLCKrFEHruI9yvH7mlZVuUrQXtAM
 cDOR92q4tygn2vKjqAK7MAvcDMo2rdu4zdjs6/7somO5qRHWRuMcxfQHQ83k7yBEgdGL
 SWU4tfRqDzXN7N3MDkTs0VkfiKd2wSr2aAmZisidB4MaK70y+tR7pgYyXxEdmm+uORJh
 +P4kk9SbDFuyhHcMe/Bsvtq8HRECINUg1WmLbz+Z18IPzCps04CFXvsPvOHwoLwlZGAa
 gtA+WTV8mt5griQfMvHQbRJ6nZhYIhpHPa0EOtJTGnqJyZz5YAv7brypk4JBat9oKJs9
 3XSA==
X-Gm-Message-State: AOAM530jzrWA/rCmx/kRy7D5pIg/WZ827cBbA+O2bk9/Ql6j66xzobSt
 N0PlMZdB0ABB6nCmMuTUByT2Tvy2d5I=
X-Google-Smtp-Source: ABdhPJziSZlfIbNulGPz1wZpfyiEBDy0F3YahI6Uof+nlVnNsfSopCLieFqe8guDW1pF8xgOwSNASg==
X-Received: by 2002:a05:600c:4f54:b0:37b:fe6a:ea9c with SMTP id
 m20-20020a05600c4f5400b0037bfe6aea9cmr3997242wmq.169.1645815144612; 
 Fri, 25 Feb 2022 10:52:24 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a05600c19c900b0037c050d73dcsm7304449wmq.46.2022.02.25.10.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 10:52:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Feb 2022 19:52:04 +0100
Message-Id: <20220225185204.1043277-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rpi-userland: fix build with
 libexecinfo
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised on uclibc and musl since the
addition of libexecinfo package in commit
eea8ba446c10701a273432552108d80fb2224ef4:

/home/peko/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../../build/lib/libvcos.so: undefined reference to `backtrace_symbols'

Fixes:
 - http://autobuild.buildroot.org/results/93d3b8cc2ac5dfa9d4b44946c0b4d8171e8f52a1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...on-t-override-CMAKE_EXE_LINKER_FLAGS.patch | 58 +++++++++++++++++++
 package/rpi-userland/rpi-userland.mk          |  5 ++
 2 files changed, 63 insertions(+)
 create mode 100644 package/rpi-userland/0006-don-t-override-CMAKE_EXE_LINKER_FLAGS.patch

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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
