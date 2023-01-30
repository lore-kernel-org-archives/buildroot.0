Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85FDC54EED
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 00:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BE3F41603;
	Mon, 30 Jan 2023 00:31:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BE3F41603
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pHJ9YQP7RNSb; Mon, 30 Jan 2023 00:31:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E500F4160F;
	Mon, 30 Jan 2023 00:31:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E500F4160F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 76BAE1BF869
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 00:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5126860ADA
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 00:29:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5126860ADA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ty_KrCaxibll for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 00:29:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0148860B3D
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0148860B3D
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 00:29:08 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id m8so4571027ili.7
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 16:29:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jqYPME6zRiekiH6mYQYFIXSaSGXzicR6dNtpX8DYi/c=;
 b=WaUF6eqyctqqmdcyMrI9XqRFla98dfH0OXbrT6MuGMfUBMinIDMeBNqPgjHS0mUPCF
 I4DTNMUbBlgYYlN0AYKTAYvruaCAbJt1uqMKrI/yWN/2cgxazuPCcvfxbWGzQIkcGlqH
 PfOkVCs9FE92YYoGwTUREGg5zYcYfagf/x3kTekrzfg3FHWeLM9wnMuJCqxbZYD1b7yq
 RwOAlQB0bOZSGgfWAUl005aUOmjlHMNTdDDHrKe0ohLs1xEpUPNM9tgWJWYhdcglvXMi
 Tpwx4t4RlJwZIKY/jNoD1JMNqMJVJ/sYsUxngIHZ+YCP2pA32YNfvgiLhIyNNKxilph/
 LmTg==
X-Gm-Message-State: AO0yUKVg9rfG7iT2YoKoO9DPcB5WulVjBvJ2kxdjnQjTTSyNdAu5O2SR
 1SftGyvRDxF8TPE7+WoS3EypSeuq8lU38w==
X-Google-Smtp-Source: AK7set/Ib8bzvBZxV78dePXItclPzqIpaf2XK4dQCjMfYQrI7NLf7HyNGDoeocVC0KawtuX4zYLVnQ==
X-Received: by 2002:a05:6e02:1a29:b0:310:e5f0:a4c9 with SMTP id
 g9-20020a056e021a2900b00310e5f0a4c9mr4010899ile.1.1675038547851; 
 Sun, 29 Jan 2023 16:29:07 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 q4-20020a02c8c4000000b00363d6918540sm1676570jao.171.2023.01.29.16.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 16:29:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 17:28:54 -0700
Message-Id: <20230130002854.2300661-10-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130002854.2300661-1-james.hilliard1@gmail.com>
References: <20230130002854.2300661-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jqYPME6zRiekiH6mYQYFIXSaSGXzicR6dNtpX8DYi/c=;
 b=qko4XgfckzNqyf/TG5z/W6shHapAs5zuHHlEu3WLLJCB9d+q9gra9/wgfW2Z14DKaw
 W7a2hsIVkGWYgy/Oe24Rn01Ftdxgu5X3hqGT2c6FIVmmy5NPSRh5/MneRfCa7FIQijrp
 li4ZBvBRB/quTfMbFg5ivRNcBMB7xG6V/JddZ1nwVkdPh+VSU0VvlgxjypwSFpP7mM6f
 ev6sajjCwJSzE8Rk/sKCfEco3oXWQJAO9WmMLwMAR/iEJb/NNpayrx7HKoU8iUlmM5t6
 jsu5XbGPR0qANWZVTxvLbArC5fFiKmJcM5ejRke4Lt9LMVgRfrXcZZpIa6RkrEYtFdwB
 G3Fw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qko4Xgfc
Subject: [Buildroot] [PATCH v5 10/10] package/tensorflow-lite: new package
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
 .../0001-lite-Update-CMakeLists.txt.patch     | 49 ++++++++++++++++++
 .../0002-Fix-FindFlatBuffers-cmake-file.patch | 37 ++++++++++++++
 ...ink-tensorflow-lite-against-gemmlowp.patch | 32 ++++++++++++
 package/tensorflow-lite/Config.in             | 27 ++++++++++
 package/tensorflow-lite/tensorflow-lite.hash  |  4 ++
 package/tensorflow-lite/tensorflow-lite.mk    | 51 +++++++++++++++++++
 8 files changed, 202 insertions(+)
 create mode 100644 package/tensorflow-lite/0001-lite-Update-CMakeLists.txt.patch
 create mode 100644 package/tensorflow-lite/0002-Fix-FindFlatBuffers-cmake-file.patch
 create mode 100644 package/tensorflow-lite/0003-Don-t-link-tensorflow-lite-against-gemmlowp.patch
 create mode 100644 package/tensorflow-lite/Config.in
 create mode 100644 package/tensorflow-lite/tensorflow-lite.hash
 create mode 100644 package/tensorflow-lite/tensorflow-lite.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 12d4dc2014..d18ab04329 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2732,6 +2732,7 @@ F:	package/gemmlowp/
 F:	package/psimd/
 F:	package/pthreadpool/
 F:	package/ruy/
+F:	package/tensorflow-lite/
 F:	package/xnnpack/
 
 N:	Stefan Ott <stefan@ott.net>
diff --git a/package/Config.in b/package/Config.in
index e79f6fe28f..6aa5e2640c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2132,6 +2132,7 @@ endif
 	source "package/sphinxbase/Config.in"
 	source "package/startup-notification/Config.in"
 	source "package/tbb/Config.in"
+	source "package/tensorflow-lite/Config.in"
 	source "package/tinycbor/Config.in"
 	source "package/tz/Config.in"
 	source "package/tzdata/Config.in"
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
diff --git a/package/tensorflow-lite/0002-Fix-FindFlatBuffers-cmake-file.patch b/package/tensorflow-lite/0002-Fix-FindFlatBuffers-cmake-file.patch
new file mode 100644
index 0000000000..e97bb3e52f
--- /dev/null
+++ b/package/tensorflow-lite/0002-Fix-FindFlatBuffers-cmake-file.patch
@@ -0,0 +1,37 @@
+From a4ff4b5e952a22906ac0ed01e73f84f42926c325 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Thu, 24 Nov 2022 14:29:06 -0700
+Subject: [PATCH] Fix FindFlatBuffers cmake file
+
+Capitalization needs to match for system cmake override to work:
+https://github.com/google/flatbuffers/blob/v22.11.23/CMake/FindFlatBuffers.cmake
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/tensorflow/tensorflow/pull/58677]
+---
+ tensorflow/lite/CMakeLists.txt                                  | 2 +-
+ .../modules/{FindFlatbuffers.cmake => FindFlatBuffers.cmake}    | 0
+ 2 files changed, 1 insertion(+), 1 deletion(-)
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
+diff --git a/tensorflow/lite/tools/cmake/modules/FindFlatbuffers.cmake b/tensorflow/lite/tools/cmake/modules/FindFlatBuffers.cmake
+similarity index 100%
+rename from tensorflow/lite/tools/cmake/modules/FindFlatbuffers.cmake
+rename to tensorflow/lite/tools/cmake/modules/FindFlatBuffers.cmake
+-- 
+2.34.1
+
diff --git a/package/tensorflow-lite/0003-Don-t-link-tensorflow-lite-against-gemmlowp.patch b/package/tensorflow-lite/0003-Don-t-link-tensorflow-lite-against-gemmlowp.patch
new file mode 100644
index 0000000000..dbee9942b3
--- /dev/null
+++ b/package/tensorflow-lite/0003-Don-t-link-tensorflow-lite-against-gemmlowp.patch
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
+[Upstream status:
+https://github.com/tensorflow/tensorflow/pull/58678]
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
index 0000000000..92a364ca36
--- /dev/null
+++ b/package/tensorflow-lite/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_TENSORFLOW_LITE
+	bool "tensorflow-lite"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+	depends on BR2_TOOLCHAIN_HAS_THREADS
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
+	select BR2_PACKAGE_RUY
+	select BR2_PACKAGE_XNNPACK
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
index 0000000000..4f8e8b9595
--- /dev/null
+++ b/package/tensorflow-lite/tensorflow-lite.mk
@@ -0,0 +1,51 @@
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
+	neon-2-sse \
+	ruy \
+	xnnpack
+
+TENSORFLOW_LITE_CONF_OPTS = \
+	-Dabsl_DIR=$(STAGING_DIR)/usr/lib/cmake/absl \
+	-DBUILD_SHARED_LIBS=ON \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -I$(STAGING_DIR)/usr/include/gemmlowp" \
+	-DCMAKE_FIND_PACKAGE_PREFER_CONFIG=ON \
+	-DCMAKE_POSITION_INDEPENDENT_CODE=ON \
+	-DEigen3_DIR=$(STAGING_DIR)/usr/share/eigen3/cmake \
+	-DFARMHASH_SOURCE_DIR=$(FARMHASH_DIR) \
+	-Dfarmhash_DIR=$(STAGING_DIR)/usr/lib \
+	-DFETCHCONTENT_FULLY_DISCONNECTED=ON \
+	-DFETCHCONTENT_QUIET=OFF \
+	-DFFT2D_SOURCE_DIR=$(STAGING_DIR)/usr/include/fft2d \
+	-DFlatBuffers_DIR=$(STAGING_DIR)/usr/lib/cmake/flatbuffers \
+	-DNEON_2_SSE_DIR=$(STAGING_DIR)/usr/lib/cmake/NEON_2_SSE \
+	-Dxnnpack_POPULATED=ON \
+	-DTFLITE_ENABLE_EXTERNAL_DELEGATE=ON \
+	-DTFLITE_ENABLE_GPU=OFF \
+	-DTFLITE_ENABLE_INSTALL=ON \
+	-DTFLITE_ENABLE_MMAP=ON \
+	-DTFLITE_ENABLE_NNAPI=OFF \
+	-DTFLITE_ENABLE_RUY=ON \
+	-DTFLITE_ENABLE_XNNPACK=ON
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
