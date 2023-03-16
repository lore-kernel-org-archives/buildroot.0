Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF37C6FD1F
	for <buildroot@archiver.kernel.org>; Thu, 16 Mar 2023 08:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2DA881F5B;
	Thu, 16 Mar 2023 08:37:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2DA881F5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dzLNPpX1NtNS; Thu, 16 Mar 2023 08:37:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7898981F55;
	Thu, 16 Mar 2023 08:37:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7898981F55
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A1DE31BF3D5
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 08:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BA29408A5
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 08:35:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BA29408A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NFGNh0VsPwFc for <buildroot@lists.busybox.net>;
 Thu, 16 Mar 2023 08:35:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9525B4095F
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9525B4095F
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 08:35:07 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id y12so586662ilq.4
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 01:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678955706;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yl63kMzE4uILLpW6g48oY+bJTjEKC0sHkAg8AGKyoPE=;
 b=TiOxfOLwiHFgsYRX159AQOKPhAGwzrAJ8xdVPpbMIb0aUCt6dSPHRRibQdPGp/Cj0N
 3yKDl/lKElq8u2fRNbbuNNTNzsWN777NuPEmmdFvFVpqG37LXJxljVhN9t9LL/H5cLDh
 V3NOZiR5i+dQopsHd75+M1h4oraBt2kkPe6Jqmo4EnwRBuZH6GVhy0b+3IqpXmasW7bM
 Y1Kw0QMT3lTs5EtvDZ3w27Qq0C9WPKrE8sfkfIgwFyeTnWaIs5GtkY2Yp8qmFNAslbLT
 718j/1lTYM6prGcpz4rS9sJt/L4FXohCqpkTPqQju0Mvr691YIWS0ozGbrd52aAgRYHY
 9Ldw==
X-Gm-Message-State: AO0yUKWSyqVfyNrBRjd4JGPYC72McYTZYlKQJco+QBqofazbvNAi93Fj
 AC8erTayyx8Ep9Z8TNMp53qzB8PW4TOnbQ==
X-Google-Smtp-Source: AK7set8Jm4U1ec28fN0+A7yix8ZfAv2dnGQVF5CwOnwx9mhHQbexZ7lprOg0wmjMAFzNY52hOZUnEQ==
X-Received: by 2002:a92:cf02:0:b0:314:5aa:94ba with SMTP id
 c2-20020a92cf02000000b0031405aa94bamr6874548ilo.9.1678955706254; 
 Thu, 16 Mar 2023 01:35:06 -0700 (PDT)
Received: from james-x399.localdomain (97-118-149-35.hlrn.qwest.net.
 [97.118.149.35]) by smtp.gmail.com with ESMTPSA id
 y34-20020a029525000000b003b331f0bbdfsm534630jah.97.2023.03.16.01.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 01:35:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 16 Mar 2023 02:34:40 -0600
Message-Id: <20230316083440.3466725-10-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230316083440.3466725-1-james.hilliard1@gmail.com>
References: <20230316083440.3466725-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678955706;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yl63kMzE4uILLpW6g48oY+bJTjEKC0sHkAg8AGKyoPE=;
 b=ghnHQaXHlZGmFS/Z+8W8A1rz+LQii2bbfDMmmpnmkUP+zr0jmwi3uqpT/yQEKjd68S
 pRHhPPE8RhX2bJzAs0WgEtIu1xjfbOctXMTpNTasSD3/pVnBDTjy5+J2Hw1PT0bd5W09
 F78hbXZ3SKBmPH3CEG3XkHcvtCqt1VETWsJhpY4EqpuqzHzlfvI8ezpgldfgqVNVW7ST
 jxjTcI+dtamMZ1ocJ8Wa7jSkHgcu1Mad2qxPd0l+pDUgQ+Pzm1z7uKKz/0bhTIT9GYzj
 o7+Z2gBsEUU6g9ksXq+7R2toPBE6tFyslwFpEEZAgtVJFtaMDPnt1JFNPxUnYpIe1GPi
 oaVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ghnHQaXH
Subject: [Buildroot] [PATCH v6 10/10] package/tensorflow-lite: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Stefan Hager <stefan.hager@ginzinger.com>

This package adds the tensorflow lite runtime to buildroot.

Tested-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v5 -> v6:
  - update patches
  - add architecture dependency
  - backport system farmhash patch
Changes v3 -> v4:
  - fix min gcc version
  - enable xnnpack
Changes v2 -> v3:
  - drop architecture restrictions which appear inaccurate after adding neon-2-sse
  - disable android only nnapi
Changes v1 -> v2:
  - fix label_image build
  - more explicit cmake config
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 .../0001-lite-Update-CMakeLists.txt.patch     | 49 ++++++++++++
 ...dd-SYSTEM_FARMHASH-cmake-config-flag.patch | 74 +++++++++++++++++++
 .../0003-Fix-FindFlatBuffers-cmake-file.patch | 51 +++++++++++++
 ...ink-tensorflow-lite-against-gemmlowp.patch | 32 ++++++++
 package/tensorflow-lite/Config.in             | 36 +++++++++
 package/tensorflow-lite/tensorflow-lite.hash  |  4 +
 package/tensorflow-lite/tensorflow-lite.mk    | 59 +++++++++++++++
 9 files changed, 307 insertions(+)
 create mode 100644 package/tensorflow-lite/0001-lite-Update-CMakeLists.txt.patch
 create mode 100644 package/tensorflow-lite/0002-Add-SYSTEM_FARMHASH-cmake-config-flag.patch
 create mode 100644 package/tensorflow-lite/0003-Fix-FindFlatBuffers-cmake-file.patch
 create mode 100644 package/tensorflow-lite/0004-Don-t-link-tensorflow-lite-against-gemmlowp.patch
 create mode 100644 package/tensorflow-lite/Config.in
 create mode 100644 package/tensorflow-lite/tensorflow-lite.hash
 create mode 100644 package/tensorflow-lite/tensorflow-lite.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 678c027898..1307949f7a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2694,6 +2694,7 @@ F:	package/gemmlowp/
 F:	package/psimd/
 F:	package/pthreadpool/
 F:	package/ruy/
+F:	package/tensorflow-lite/
 F:	package/xnnpack/
 
 N:	Stefan Ott <stefan@ott.net>
diff --git a/package/Config.in b/package/Config.in
index 8969672e42..45fca4f15d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2158,6 +2158,7 @@ endif
 	source "package/sphinxbase/Config.in"
 	source "package/startup-notification/Config.in"
 	source "package/tbb/Config.in"
+	source "package/tensorflow-lite/Config.in"
 	source "package/tinycbor/Config.in"
 	source "package/tl-expected/Config.in"
 	source "package/tz/Config.in"
diff --git a/package/tensorflow-lite/0001-lite-Update-CMakeLists.txt.patch b/package/tensorflow-lite/0001-lite-Update-CMakeLists.txt.patch
new file mode 100644
index 0000000000..53b5170681
--- /dev/null
+++ b/package/tensorflow-lite/0001-lite-Update-CMakeLists.txt.patch
@@ -0,0 +1,49 @@
+From 081c2e4e3cf021efb2853a485a18b563e88f6117 Mon Sep 17 00:00:00 2001
+From: Terry Heo <terryheo@google.com>
+Date: Tue, 1 Nov 2022 15:55:30 -0700
+Subject: [PATCH] lite: Update CMakeLists.txt
+
+This changes are needed to build kernel tests.
+
+PiperOrigin-RevId: 485439972
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+081c2e4e3cf021efb2853a485a18b563e88f6117]
+---
+ tensorflow/lite/CMakeLists.txt | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/tensorflow/lite/CMakeLists.txt b/tensorflow/lite/CMakeLists.txt
+index 9dfbb4b72f3..fd8b3faf1e2 100644
+--- a/tensorflow/lite/CMakeLists.txt
++++ b/tensorflow/lite/CMakeLists.txt
+@@ -209,6 +209,9 @@ list(FILTER TFLITE_SRCS EXCLUDE REGEX ".*tflite_with_xnnpack\\.cc$")
+ # Exclude Flex related files.
+ list(FILTER TFLITE_SRCS EXCLUDE REGEX ".*with_selected_ops\\.cc$")
+ 
++# Exclude tensorflow_profiler_logger files.
++list(FILTER TFLITE_SRCS EXCLUDE REGEX ".*tensorflow_profiler_logger\\.cc$")
++
+ if(_TFLITE_ENABLE_MMAP)
+   list(FILTER TFLITE_SRCS EXCLUDE REGEX ".*mmap_allocation_disabled\\.cc$")
+ else()
+@@ -222,6 +225,7 @@ if(NOT "${CMAKE_SYSTEM_NAME}" STREQUAL "iOS")
+ endif()
+ populate_tflite_source_vars("core" TFLITE_CORE_SRCS)
+ populate_tflite_source_vars("core/api" TFLITE_CORE_API_SRCS)
++populate_tflite_source_vars("core/c" TFLITE_CORE_C_SRCS)
+ populate_tflite_source_vars("c" TFLITE_C_SRCS)
+ populate_tflite_source_vars("delegates" TFLITE_DELEGATES_SRCS)
+ if(TFLITE_ENABLE_GPU)
+@@ -483,6 +487,7 @@ endif()
+ # TFLite library
+ set(_ALL_TFLITE_SRCS
+   ${TFLITE_CORE_API_SRCS}
++  ${TFLITE_CORE_C_SRCS}
+   ${TFLITE_CORE_SRCS}
+   ${TFLITE_C_SRCS}
+   ${TFLITE_DELEGATES_FLEX_SRCS}
+-- 
+2.34.1
+
diff --git a/package/tensorflow-lite/0002-Add-SYSTEM_FARMHASH-cmake-config-flag.patch b/package/tensorflow-lite/0002-Add-SYSTEM_FARMHASH-cmake-config-flag.patch
new file mode 100644
index 0000000000..99db29e354
--- /dev/null
+++ b/package/tensorflow-lite/0002-Add-SYSTEM_FARMHASH-cmake-config-flag.patch
@@ -0,0 +1,74 @@
+From d8451a9048d09692994c40a6f9bc928e70ed79b5 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Mon, 28 Nov 2022 21:36:34 -0700
+Subject: [PATCH] Add SYSTEM_FARMHASH cmake config flag
+
+Since farmhash does not install a cmake package we need to
+search for the library and headers to use the provided
+version.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+d8451a9048d09692994c40a6f9bc928e70ed79b5]
+---
+ tensorflow/lite/g3doc/guide/build_cmake.md    |  1 +
+ .../tools/cmake/modules/Findfarmhash.cmake    | 30 +++++++++++++++----
+ 2 files changed, 26 insertions(+), 5 deletions(-)
+
+diff --git a/tensorflow/lite/g3doc/guide/build_cmake.md b/tensorflow/lite/g3doc/guide/build_cmake.md
+index 6950a365bb8..6de955e70b0 100644
+--- a/tensorflow/lite/g3doc/guide/build_cmake.md
++++ b/tensorflow/lite/g3doc/guide/build_cmake.md
+@@ -81,6 +81,7 @@ variables to point to your library installations.
+ ```sh
+ cmake ../tensorflow_src/tensorflow/lite -DTFLITE_ENABLE_INSTALL=ON \
+   -DCMAKE_FIND_PACKAGE_PREFER_CONFIG=ON \
++  -DSYSTEM_FARMHASH=ON \
+   -Dabsl_DIR=<install path>/lib/cmake/absl \
+   -DEigen3_DIR=<install path>/share/eigen3/cmake \
+   -DFlatbuffers_DIR=<install path>/lib/cmake/flatbuffers \
+diff --git a/tensorflow/lite/tools/cmake/modules/Findfarmhash.cmake b/tensorflow/lite/tools/cmake/modules/Findfarmhash.cmake
+index 1b0dc28f624..97b43298f13 100644
+--- a/tensorflow/lite/tools/cmake/modules/Findfarmhash.cmake
++++ b/tensorflow/lite/tools/cmake/modules/Findfarmhash.cmake
+@@ -13,12 +13,32 @@
+ # See the License for the specific language governing permissions and
+ # limitations under the License.
+ 
+-# tensorflow-lite uses find_package for this package, so override the system
+-# installation and build from source instead.
+-include(farmhash)
+-if(farmhash_POPULATED)
++# tensorflow-lite uses find_package for this package, so build from
++# source if the system version is not enabled.
++
++if(SYSTEM_FARMHASH)
++  include(FindPackageHandleStandardArgs)
++  find_path(FARMHASH_ROOT_DIR NAMES include/farmhash.h)
++  find_library(FARMHASH_LIB NAMES farmhash PATHS ${FARMHASH_ROOT_DIR}/lib ${FARMHASH_LIB_PATH})
++  find_path(FARMHASH_INCLUDE_DIRS NAMES farmhash.h PATHS ${FARMHASH_ROOT_DIR}/include)
++  find_package_handle_standard_args(farmhash DEFAULT_MSG FARMHASH_LIB FARMHASH_INCLUDE_DIRS)
++endif()
++
++if(farmhash_FOUND)
++  add_library(farmhash SHARED IMPORTED GLOBAL)
++  set_target_properties(farmhash PROPERTIES
++    IMPORTED_LOCATION ${FARMHASH_LIB}
++    INTERFACE_INCLUDE_DIRECTORIES ${FARMHASH_INCLUDE_DIRS}
++  )
++else()
++  include(farmhash)
++  if(farmhash_POPULATED)
++    get_target_property(FARMHASH_INCLUDE_DIRS farmhash INTERFACE_DIRECTORIES)
++  endif()
++endif()
++
++if(farmhash_FOUND OR farmhash_POPULATED)
+   set(FARMHASH_FOUND TRUE)
+-  get_target_property(FARMHASH_INCLUDE_DIRS farmhash INTERFACE_DIRECTORIES)
+   add_library(farmhash::farmhash ALIAS farmhash)
+   set(FARMHASH_LIBRARIES farmhash::farmhash)
+ endif()
+-- 
+2.34.1
+
diff --git a/package/tensorflow-lite/0003-Fix-FindFlatBuffers-cmake-file.patch b/package/tensorflow-lite/0003-Fix-FindFlatBuffers-cmake-file.patch
new file mode 100644
index 0000000000..1d511ca441
--- /dev/null
+++ b/package/tensorflow-lite/0003-Fix-FindFlatBuffers-cmake-file.patch
@@ -0,0 +1,51 @@
+From d8f98dd9f2b437cca5954b38cb48d9c21733f67d Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Thu, 24 Nov 2022 14:29:06 -0700
+Subject: [PATCH] Fix FindFlatBuffers cmake file
+
+Capitalization needs to match for system cmake override to work:
+https://github.com/google/flatbuffers/blob/v22.11.23/CMake/FindFlatBuffers.cmake
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+d8f98dd9f2b437cca5954b38cb48d9c21733f67d]
+---
+ tensorflow/lite/CMakeLists.txt                                  | 2 +-
+ tensorflow/lite/g3doc/guide/build_cmake.md                      | 2 +-
+ .../modules/{FindFlatbuffers.cmake => FindFlatBuffers.cmake}    | 0
+ 3 files changed, 2 insertions(+), 2 deletions(-)
+ rename tensorflow/lite/tools/cmake/modules/{FindFlatbuffers.cmake => FindFlatBuffers.cmake} (100%)
+
+diff --git a/tensorflow/lite/CMakeLists.txt b/tensorflow/lite/CMakeLists.txt
+index f9c30d6a046..c2ee9edfb61 100644
+--- a/tensorflow/lite/CMakeLists.txt
++++ b/tensorflow/lite/CMakeLists.txt
+@@ -143,7 +143,7 @@ find_package(absl REQUIRED)
+ find_package(Eigen3 REQUIRED)
+ find_package(farmhash REQUIRED)
+ find_package(fft2d REQUIRED)
+-find_package(Flatbuffers REQUIRED)
++find_package(FlatBuffers REQUIRED)
+ find_package(gemmlowp REQUIRED)
+ find_package(NEON_2_SSE REQUIRED)
+ find_package(cpuinfo REQUIRED)  #CPUINFO is used by XNNPACK and RUY library
+diff --git a/tensorflow/lite/g3doc/guide/build_cmake.md b/tensorflow/lite/g3doc/guide/build_cmake.md
+index 6950a365bb8..9cb7ebac326 100644
+--- a/tensorflow/lite/g3doc/guide/build_cmake.md
++++ b/tensorflow/lite/g3doc/guide/build_cmake.md
+@@ -83,7 +83,7 @@ cmake ../tensorflow_src/tensorflow/lite -DTFLITE_ENABLE_INSTALL=ON \
+   -DCMAKE_FIND_PACKAGE_PREFER_CONFIG=ON \
+   -Dabsl_DIR=<install path>/lib/cmake/absl \
+   -DEigen3_DIR=<install path>/share/eigen3/cmake \
+-  -DFlatbuffers_DIR=<install path>/lib/cmake/flatbuffers \
++  -DFlatBuffers_DIR=<install path>/lib/cmake/flatbuffers \
+   -DNEON_2_SSE_DIR=<install path>/lib/cmake/NEON_2_SSE \
+   -Dcpuinfo_DIR=<install path>/share/cpuinfo \
+   -Druy_DIR=<install path>/lib/cmake/ruy
+diff --git a/tensorflow/lite/tools/cmake/modules/FindFlatbuffers.cmake b/tensorflow/lite/tools/cmake/modules/FindFlatBuffers.cmake
+similarity index 100%
+rename from tensorflow/lite/tools/cmake/modules/FindFlatbuffers.cmake
+rename to tensorflow/lite/tools/cmake/modules/FindFlatBuffers.cmake
+-- 
+2.34.1
+
diff --git a/package/tensorflow-lite/0004-Don-t-link-tensorflow-lite-against-gemmlowp.patch b/package/tensorflow-lite/0004-Don-t-link-tensorflow-lite-against-gemmlowp.patch
new file mode 100644
index 0000000000..d9ad78ef9e
--- /dev/null
+++ b/package/tensorflow-lite/0004-Don-t-link-tensorflow-lite-against-gemmlowp.patch
@@ -0,0 +1,32 @@
+From fb584589f707853d85a081c99b1b82598c2631c1 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Thu, 24 Nov 2022 15:10:27 -0700
+Subject: [PATCH] Don't link tensorflow-lite against gemmlowp
+
+We can't link against gemmlowp as it is a header only library.
+
+Fixes:
+/bin/ld: cannot find -lgemmlowp: No such file or directory
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+fb584589f707853d85a081c99b1b82598c2631c1]
+---
+ tensorflow/lite/CMakeLists.txt | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/tensorflow/lite/CMakeLists.txt b/tensorflow/lite/CMakeLists.txt
+index f9c30d6a046..3fe5ed15605 100644
+--- a/tensorflow/lite/CMakeLists.txt
++++ b/tensorflow/lite/CMakeLists.txt
+@@ -560,7 +560,6 @@ target_link_libraries(tensorflow-lite
+     farmhash
+     fft2d_fftsg2d
+     flatbuffers::flatbuffers
+-    gemmlowp
+     ruy::ruy
+     pthreadpool
+     ${CMAKE_DL_LIBS}
+-- 
+2.34.1
+
diff --git a/package/tensorflow-lite/Config.in b/package/tensorflow-lite/Config.in
new file mode 100644
index 0000000000..8685ec0c71
--- /dev/null
+++ b/package/tensorflow-lite/Config.in
@@ -0,0 +1,36 @@
+config BR2_PACKAGE_TENSORFLOW_LITE_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	default y if BR2_arm
+	default y if BR2_i386
+	default y if BR2_x86_64
+	depends on BR2_PACKAGE_CPUINFO_ARCH_SUPPORTS
+
+config BR2_PACKAGE_TENSORFLOW_LITE
+	bool "tensorflow-lite"
+	depends on BR2_PACKAGE_TENSORFLOW_LITE_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+	depends on BR2_TOOLCHAIN_HAS_THREADS # cpuinfo
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_SHARED_LIBS
+	select BR2_PACKAGE_CPUINFO
+	select BR2_PACKAGE_EIGEN
+	select BR2_PACKAGE_FARMHASH
+	select BR2_PACKAGE_FFT2D
+	select BR2_PACKAGE_FLATBUFFERS
+	select BR2_PACKAGE_GEMMLOWP
+	select BR2_PACKAGE_LIBABSEIL_CPP
+	select BR2_PACKAGE_NEON_2_SSE
+	select BR2_PACKAGE_RUY if BR2_PACKAGE_RUY_ARCH_SUPPORTS
+	select BR2_PACKAGE_XNNPACK if BR2_PACKAGE_XNNPACK_ARCH_SUPPORTS
+	help
+	  Tensorflow Lite dynamic library and headers: Inference engine
+	  to run previously trained machine learning models.
+
+comment "tensorflow-lite needs a toolchain w/ glibc, C++17, threads"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP || \
+			!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "tensorflow-lite needs a toolchain w/ shared libraries"
+	depends on !BR2_SHARED_LIBS
diff --git a/package/tensorflow-lite/tensorflow-lite.hash b/package/tensorflow-lite/tensorflow-lite.hash
new file mode 100644
index 0000000000..7d9035707b
--- /dev/null
+++ b/package/tensorflow-lite/tensorflow-lite.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  99c732b92b1b37fc243a559e02f9aef5671771e272758aa4aec7f34dc92dac48  tensorflow-lite-2.11.0.tar.gz
+# License files, locally calculated
+sha256  71c6915d04265772a0339bed47276942c678b45cc01534210ebe6984fd1aec65  LICENSE
diff --git a/package/tensorflow-lite/tensorflow-lite.mk b/package/tensorflow-lite/tensorflow-lite.mk
new file mode 100644
index 0000000000..433eff3242
--- /dev/null
+++ b/package/tensorflow-lite/tensorflow-lite.mk
@@ -0,0 +1,59 @@
+################################################################################
+#
+# tensorflow-lite
+#
+################################################################################
+
+TENSORFLOW_LITE_VERSION = 2.11.0
+TENSORFLOW_LITE_SITE =  $(call github,tensorflow,tensorflow,v$(TENSORFLOW_LITE_VERSION))
+TENSORFLOW_LITE_INSTALL_STAGING = YES
+TENSORFLOW_LITE_LICENSE = Apache-2.0
+TENSORFLOW_LITE_LICENSE_FILES = LICENSE
+TENSORFLOW_LITE_SUBDIR = tensorflow/lite
+TENSORFLOW_LITE_SUPPORTS_IN_SOURCE_BUILD = NO
+TENSORFLOW_LITE_DEPENDENCIES += \
+	host-pkgconf \
+	host-flatbuffers \
+	cpuinfo \
+	eigen \
+	farmhash \
+	fft2d \
+	flatbuffers \
+	gemmlowp \
+	libabseil-cpp \
+	neon-2-sse
+
+TENSORFLOW_LITE_CONF_OPTS = \
+	-Dabsl_DIR=$(STAGING_DIR)/usr/lib/cmake/absl \
+	-DBUILD_SHARED_LIBS=ON \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -I$(STAGING_DIR)/usr/include/gemmlowp" \
+	-DCMAKE_FIND_PACKAGE_PREFER_CONFIG=ON \
+	-DCMAKE_POSITION_INDEPENDENT_CODE=ON \
+	-DEigen3_DIR=$(STAGING_DIR)/usr/share/eigen3/cmake \
+	-DFETCHCONTENT_FULLY_DISCONNECTED=ON \
+	-DFETCHCONTENT_QUIET=OFF \
+	-DFFT2D_SOURCE_DIR=$(STAGING_DIR)/usr/include/fft2d \
+	-DFlatBuffers_DIR=$(STAGING_DIR)/usr/lib/cmake/flatbuffers \
+	-DNEON_2_SSE_DIR=$(STAGING_DIR)/usr/lib/cmake/NEON_2_SSE \
+	-DSYSTEM_FARMHASH=ON \
+	-DTFLITE_ENABLE_EXTERNAL_DELEGATE=ON \
+	-DTFLITE_ENABLE_GPU=OFF \
+	-DTFLITE_ENABLE_INSTALL=ON \
+	-DTFLITE_ENABLE_MMAP=ON \
+	-DTFLITE_ENABLE_NNAPI=OFF
+
+ifeq ($(BR2_PACKAGE_RUY),y)
+TENSORFLOW_LITE_DEPENDENCIES += ruy
+TENSORFLOW_LITE_CONF_OPTS += -DTFLITE_ENABLE_RUY=ON
+else
+TENSORFLOW_LITE_CONF_OPTS += -DTFLITE_ENABLE_RUY=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XNNPACK),y)
+TENSORFLOW_LITE_DEPENDENCIES += xnnpack
+TENSORFLOW_LITE_CONF_OPTS += -DTFLITE_ENABLE_XNNPACK=ON -Dxnnpack_POPULATED=ON
+else
+TENSORFLOW_LITE_CONF_OPTS += -DTFLITE_ENABLE_XNNPACK=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
